require 'httparty'
require 'json'

def world_time_data(area, location)
    url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
    response = HTTParty.get(url)
    JSON.parse(response.body)
end

def world_time_info(area, location, time_data)
    time = time_data['datetime']
    puts "The current time in #{area}/#{location} is #{time}"
end

area = 'Europe'
location = 'London'

time_data = world_time_data(area, location)
world_time_info(area, location, time_data)

