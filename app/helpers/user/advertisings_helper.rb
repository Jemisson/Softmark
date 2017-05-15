module User::AdvertisingsHelper

  def data_clima_tempo
    source = "https://api.hgbrasil.com/weather/?format=json&cid=BRXX0228"
    resp = Net::HTTP.get_response(URI.parse(source))
    if resp.code == '200'
      data = resp.body
      result = JSON.parse(data)
      result['results']
    end
  end

end
