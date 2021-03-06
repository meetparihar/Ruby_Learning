require_relative './APIs'
require_relative './base'
require 'json'
module MapQuest
    class Batch < Base
        def get_batch(locations)
            location = ""
            for loc in locations
                location.concat("&location=#{loc}")
            end
            # puts "http://www.mapquestapi.com/geocoding/v1/batch?key=#{API_KEY}#{location}"
            res = Faraday.get("http://www.mapquestapi.com/geocoding/v1/batch?key=#{API_KEY}#{location}")
            puts res.body
        end
        def post_batch(locations)
            param = {
                'key' => API_KEY,
                'locations' => locations
            }
            res = Faraday.get(BATCH_API, param)
            puts res.body
        end
    end
end
MapQuest::Batch.new.get_batch(['Boulder,CO', 'Washington,DC'])
