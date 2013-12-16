class Ioc
  include Mongoid::Document
  field :indicator, type: String
  field :type, type: String
  field :sources, type: Array
end
