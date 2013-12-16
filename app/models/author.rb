class Author
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :handle, type: String
  
  embedded_in :source
end
