class Variety
  include Mongoid::Document
  field :variety, type: String
  field :sources, type: Array
end
