require_relative 'MapQuest'
require './APIs'
client = MapQuest::Client.new(api_key)
# client.get_batch(["Denver,CO"])