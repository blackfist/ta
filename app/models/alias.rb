class Alias
  include Mongoid::Document
  field :name, type: String
  field :organization, type: String
  field :sources, type: Array
end
