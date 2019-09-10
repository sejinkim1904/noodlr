class YelpService
  def restaurants(term, location, limit = nil, offset = nil)
    get_json("/v3/businesses/search?term=#{term}&location=#{location}&limit=#{limit}&offset=#{offset}")
  end

  private

  def conn
    Faraday.new(url: "https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
