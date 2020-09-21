class UrlMapper
  include Mongoid::Document
  include Mongoid::Timestamps
  field :long_url, type: String
  field :short_url, type: String

  validates :long_url, presence: true, length: {minimum: 15, maximum: 2083}
  validates :short_url, presence: true, uniqueness: true
  embeds_many :request_stats
end
