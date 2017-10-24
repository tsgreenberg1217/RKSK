class WeatherAdapter < ApplicationRecord
  def local_xml
      url1 = "http://api.worldweatheronline.com/premium/v1/weather.ashx?q=#{@user.location}&format=xml&num_of_days=5&key=acdcc7e8951d4de190d165134172310"
      @data1 = Nokogiri::XML(open(url1))
  end
end
