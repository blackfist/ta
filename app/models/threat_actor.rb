class ThreatActor
  include Mongoid::Document
  field :actor_id, type: String
  field :schema_version, type: String, default: 0.1
  field :_id, type: String, default: ->{ actor_id }
  
  embeds_many :sources
  embeds_many :aliases
  embeds_many :countries
  embeds_many :motives
  embeds_many :varieties
  embeds_many :iocs
end
