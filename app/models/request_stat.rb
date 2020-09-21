class RequestStat
  include Mongoid::Document
  include Mongoid::Timestamps
  field :country, type: String
  field :city, type: String
  field :user_agent, type: String
  field :ip, type: String

  embedded_in :url_mapper
end
