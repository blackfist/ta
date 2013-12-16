class Source
  include Mongoid::Document
  field :number, type: Integer
  field :title, type: String
  field :organization, type: String
  field :date_published, type: Date
  field :date_accessed, type: Date
  field :url, type: String
  field :tlp, type: String
  field :intel_discipline, type: String
  
  embeds_many :authors
end
