require './APIs'
require 'json'
require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http
module MapQuest
    class Client
        attr_reader :key
        def initialize(key)
            @key = key
        end
        def get_forward(location)
            params = {
                'key' => @key,
                'location' =>location
            }
            res = Faraday.get(FORWARD_API, params)
            puts res.body
        end
        def post_forward(location)
            params = {
                'key' => @key,
                'location' =>location
            }
            res = Faraday.post(FORWARD_API, params)
            puts res.body
        end
        def get_reverse(location)
            params = {
                'key' => @key,
                'location' =>location
            }
            res = Faraday.get(REVERSE_API, params)
            puts res.body
        end

        def post_reverse(location)
            params = {
                'key' => @key,
                'location' =>location
            }
            res = Faraday.post(REVERSE_API, params)
            puts res.body
        end
        def get_batch(location)
            params = {
                'key' => @key,
                'location' =>location
            }
            res = Faraday.get(BATCH_API, params)
            puts res.body
        end

        def post_batch(locations)
            params = {
                'key' => @key,
                'location' =>locations
            }
            res = Faraday.post(BATCH_API, params)
            puts res.body
        end
        
    end
end


