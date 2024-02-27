require 'easycache'
require 'net/http'

cache = EasyCache.new

def earthquake
  p "Block called"
  uri = URI('https://earthquake.usgs.gov/fdsnws/event/1/version')
  res = Net::HTTP.get_response(uri).body
  res
end

http_response = cache.fetch("earthquake", 60, true) do
  earthquake
end

puts cache.fetch("earthquake")
puts earthquake
