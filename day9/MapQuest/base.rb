require_relative './APIs'
require 'json'
require 'faraday'
require 'faraday/net_http'
module MapQuest
    class Base
        attr_reader :key        
        @@key = API_KEY
        def make_request(method, location, api, total_retry = 3, wait_time = 10)
            retries = 0
            begin
                if method.downcase == "get"                     
                    params = {
                        'key' => @@key,
                        'location' => location 
                    }
                    res = Faraday.get(api, params)
                  
                else
                    con = Faraday.new(FORWARD_API) 
                    res = con.post do |req|
                        req.url FORWARD_API
                        req.params['key'] = API_KEY
                        req.body = {"location" => "#{location}"}
                    end
                end

                if res.status == 403  #Handling key related error because doen't with res.body
                    return 'Key Related Error'
                end
                
                statuscode = JSON.load(res.body)["info"]["statuscode"]
                puts statuscode
                case statuscode
                when 0 
                    res.body
                when 400 
                    'Input error'
                when 500
                    'Unknown error'
                end
            rescue Faraday::Error => e #catches all the types of network error
                if retries < Total_retry
                    retries += 1
                    sleep(Wait_time)
                    puts 'Retrying...'
                    retry
                else
                    'Not able to connect'
                end
            end            
        end
    end
end

