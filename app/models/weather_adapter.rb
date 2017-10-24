class WeatherAdapter < ApplicationRecord
  require 'open-uri'
  def self.local_xml(location)

      url1 = "http://api.worldweatheronline.com/premium/v1/weather.ashx?q=#{location}&format=xml&num_of_days=5&key=acdcc7e8951d4de190d165134172310"
      Nokogiri::XML(open(url1))
  end

  def self.get_temp(location)
    local_xml(location).css("current_condition").css("temp_F").text
  end

  def self.get_description(location)
    local_xml(location).css("current_condition").css("weatherDesc").text
  end

end


# class WeatherAdapter < ApplicationRecord
#   def local_xml(location)
#
#       url1 = "http://api.worldweatheronline.com/premium/v1/weather.ashx?q=#{location}&format=xml&num_of_days=5&key=acdcc7e8951d4de190d165134172310"
#       @data1 = Nokogiri::XML(open(url1))
#   end
#
#   def get_temp(location)
#
#     local_xml(location).css("current_condition").css("temp_F").text
#   end
#
#   def get_description(location)
#     local_xml(location).css("current_condition").css("weatherDesc").text
#   end
#
# end
