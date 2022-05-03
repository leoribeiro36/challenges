class HeroesController < ApplicationController
  before_action :set_hero, only: %i[ show edit update destroy ]

  def index
    render json: Hero.all
  end

  def show
    render json: Hero.find(params[:id])
  end

  def create
    @location = Location.new({
      lat: params[:location][:lat].to_f,
      lng: params[:location][:lng].to_f})
    @location.save

    @hero = Hero.new({
      name: params[:name],
      rank: params[:rank],
      location: @location
    })

    if @hero.save
      render json: { message: "Hero was successfully created." }
    else
      internal_error
    end
  end

  def update
    @hero.name = params[:name]
    @hero.rank = params[:rank]
    @hero.location.lat = params[:location][:lat].to_f
    @hero.location.lng = params[:location][:lng].to_f
    if @hero.save
      render json: { message: "Hero was successfully updated." }
    else
      internal_error
    end
  end

  def destroy
    if @hero.destroy 
      render render: { message: "Hero was successfully destroyed." }
    else
      internal_error
    end
  end

  private
    def set_hero
      @hero = Hero.find(params[:id])
    end

    def hero_params
      params.require(:hero).permit(:name, :location)
    end

    def internal_error
      render json: {message: "Internal server error"}, status: 500
    end
end
