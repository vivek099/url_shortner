class UrlMappersController < ApplicationController

  def create
    data = {
      short_url: request.base_url + '/' + SecureRandom.urlsafe_base64(5),
      long_url: params[:long_url]
    }
    render json: UrlMapper.create!(data), status: :created
  end

  def show
    url_mapper = UrlMapper.find_by(short_url: request.url)

    # Raise resource not found error if short url is older than 30 days
    if (url_mapper.created_at + 30.days) < Time.now.utc
      raise Mongoid::Errors::DocumentNotFound.new(UrlMapper, [request.url])
    end

    # Populate client request details
    spec = {
      country: request.location.country,
      city: request.location.city,
      user_agent: request.user_agent,
      ip: request.ip
    }
    url_mapper.request_stats.create!(spec)
    redirect_to url_mapper.long_url
  end

  def index
    # TODO: Add pagination for lazy loading
    items = UrlMapper.all.map do |url_mapper|
      {
        long_url: url_mapper.long_url,
        short_url: url_mapper.short_url,
        total_clicks: url_mapper.request_stats.count,
        top_countries: url_mapper.request_stats.map(&:country).uniq.compact.join(', ')
      }
    end
    render json: {items: items}
  end
end
