class Location
  include Mongoid::Document
  include Mongoid::Timestamps
  field :lat, type: Float
  field :lng, type: Float
end
