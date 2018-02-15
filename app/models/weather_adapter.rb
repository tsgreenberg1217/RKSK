class WeatherAdapter < ApplicationRecord
  require 'open-uri'
  def self.local_xml(location)
      url1  = "http://api.worldweatheronline.com/premium/v1/weather.ashx?q=#{location}&format=xml&num_of_days=5&key=87fa44b4ace84d60bad192619182101"
      Nokogiri::XML(open(url1))
  end

  def self.get_temp(location)
    local_xml(location).css("current_condition").css("temp_F").text
  end

  def self.get_description(location)
    desc =local_xml(location).css("current_condition").css("weatherDesc").text
    desc.downcase
  end

end
