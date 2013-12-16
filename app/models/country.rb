class Country
  include Mongoid::Document
  field :name, type: String
  field :sources, type: Array
end
