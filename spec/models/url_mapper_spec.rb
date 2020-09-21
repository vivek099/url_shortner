require 'rails_helper'

RSpec.describe UrlMapper, type: :model do
  it 'validates presence of short_url and long_url' do
    url_mapper = UrlMapper.new(short_url: '', long_url: '')
    expect(url_mapper).to_not be_valid
  end

  it 'validates uniqueness of short_url' do
    UrlMapper.create!(short_url: 'http://dummy.url', long_url: 'http://mock.long.url')
    url_mapper = UrlMapper.new(short_url: 'http://dummy.url', long_url: 'http://mock.long.url')
    expect(url_mapper).to_not be_valid
  end

  it 'validates maximum length of long_url' do
    url_mapper = UrlMapper.new(short_url: 'http://dummy.url.com', long_url: SecureRandom.hex(1100))
    expect(url_mapper).to_not be_valid
  end
end
