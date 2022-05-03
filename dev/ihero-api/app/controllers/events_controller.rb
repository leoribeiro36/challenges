class EventsController < ApplicationController
  def show
  	render json: Event.all
  end

  def register
    heroes = select_heroes(params[:dangerLevel], params[:location][0][:lat], params[:location][0][:lat])
    location = Location.new({
      lat: params[:location][0][:lat].to_f,
      lng: params[:location][0][:lng].to_f})
    @event = Event.new({
      monster_name: params[:monsterName],
      dangerLevel: params[:dangerLevel],
      location: location,
      heroes: heroes
    })
    if @event.save
      render json: { message: "Event was successfully created." }
    else
      internal_error
    end
  end

  private

  def select_heroes(dangerLevel, event_lat, event_lng)
    rank_priority = case dangerLevel
      when 'God'
        ['S', 'A', 'B', 'C']
      when 'Dragon'
        ['A', 'B', 'C']
      when 'Tiger'
        ['B', 'C']
      when 'Wolf'
        ['C']
    end
    heroes = Hero.where(rank: { "$in": rank_priority })
    ordered_heroes = heroes.sort_by {|hero|
      euclidian_distanc(event_lat, event_lng, hero.location.lat, hero.location.lng)
    }
    
    priority_hero(ordered_heroes, rank_priority, event_lat, event_lng)
  end

  def priority_hero(ordered_heroes, rank_priority, event_lat, event_lng)
    s_heroes = ordered_heroes.select { |hero| hero.rank == 'S' } if rank_priority.include?("S") 
    a_heroes = ordered_heroes.select { |hero| hero.rank == 'A' } if rank_priority.include?("A")
    b_heroes = ordered_heroes.select { |hero| hero.rank == 'B' } if rank_priority.include?("B")
    c_heroes = ordered_heroes.select { |hero| hero.rank == 'C' } if rank_priority.include?("C")
    
    resp_heroes = []
    shortest_distance = 0
    index = 1

    if rank_priority.include?("S") && s_heroes.length > index
      s_hero = s_heroes.at(index)
      shortest_distance = euclidian_distanc(event_lat, event_lng, s_hero.location.lat, s_hero.location.lng)
      resp_heroes = s_heroes.first(index)
      index = index + 1
    end
    if rank_priority.include?("A") && a_heroes.length > index
      a_hero = a_heroes.at(index)
      a_distance = euclidian_distanc(event_lat, event_lng, a_hero.location.lat, a_hero.location.lng)
      if (shortest_distance > a_distance || shortest_distance == 0)
        resp_heroes = a_heroes.first(index)
        shortest_distance = a_distance
      end
      index = index + 1
    end
    if rank_priority.include?("B") && b_heroes.length > index
      b_hero = b_heroes.at(index)
      b_distance = euclidian_distanc(event_lat, event_lng, b_hero.location.lat, b_hero.location.lng)
      if (shortest_distance > b_distance || shortest_distance == 0)
        resp_heroes = b_heroes.first(index)
        shortest_distance = b_distance
      end
      index = index + 1
    end
    if rank_priority.include?("C") && c_heroes.length > index
      c_hero = c_heroes.at(index)
      c_distance = euclidian_distanc(event_lat, event_lng, c_hero.location.lat, c_hero.location.lng)
      if (shortest_distance > c_distance || shortest_distance == 0)
        resp_heroes = c_heroes.first(index)
      end
    end
    resp_heroes
  end

  def fibonacci( n )
    [ n ] if ( 0..1 ).include? n
    ( fibonacci( n - 1 ) + fibonacci( n - 2 ) ) if n > 1
  end

  def euclidian_distanc(alat, alng, blat, blng)
    ablat = (alat - blat) ** 2
    ablng = (alng - blng) ** 2

    Math.sqrt(ablat + ablng)
  end
end
