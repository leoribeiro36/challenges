class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :monster_name, type: String
  field :dangerLevel, type: String

  embeds_one :location
  embeds_many :heroes
end
