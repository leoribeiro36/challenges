class Hero
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :rank, type: String

  embeds_one :location
end
