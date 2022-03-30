require_relative "./APIs"
require 'json'
require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http
module MapQuest
    class Client
        # attr_reader :key
        @@key = api_key
    end
end
class Address < Client
    def get_address(location)
        params = {
            'key' => @@key,
            'location' =>location
        }
        res = Faraday.get(FORWARD_API, params)
        puts res.body
    end
    def post_address(location)
        params = {
            'key' => @@key,
            'location' =>location
        }
        res = Faraday.post(FORWARD_API, params)
        puts res.body
    end
end
class Reverse < Client
    def get_reverse(location)
        params = {
            'key' => @@key,
            'location' =>location
        }
        res = Faraday.get(REVERSE_API, params)
        puts res.body
    end

    def post_reverse(location)
        params = {
            'key' => @@key,
            'location' =>location
        }
        res = Faraday.post(REVERSE_API, params)
        puts res.body
    end
end
class Batch < Client
    def get_batch(location)
        params = {
            'key' => @@key,
            'location' =>location
        }
        res = Faraday.get(BATCH_API, params)
        puts res.body
    end

    def post_batch(locations)
        params = {
            'key' => @@key,
            'location' =>locations
        }
        res = Faraday.post(BATCH_API, params)
        puts res.body
    end        
end



