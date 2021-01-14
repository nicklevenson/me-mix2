class ArtApi
  def fetch_art(query)
    url = "https://collectionapi.metmuseum.org/public/collection/v1/search?q=#{query}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    ids = JSON.parse(response.body)["objectIDs"][0..19]
    # byebug
    results = []
    ids.each do |id|
      url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{id}"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body)
      results << result
    end
    filtered_data = []
    results.each do |r|
      filtered_data << {data_type: "art", title: r["title"], creators: [r["artistDisplayName"]], date: r["objectEndDate"],image: r["primaryImageSmall"], url: r["objectURL"]}
    end
    filtered_data
  
  end
end