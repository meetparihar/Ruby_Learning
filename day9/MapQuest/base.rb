require_relative './APIs'
require 'json'
require 'faraday'
require 'faraday/net_http'
module MapQuest
    class Base
        attr_reader :key        
        @@key = API_KEY
        def make_request(method, location, api)
            @retries = 0
            begin                
                params = {
                    'key' => @@key,
                    'location' => location 
                }
                if method.downcase == "get"
                    res = Faraday.get(api, params)    
                elsif method.downcase == "post"
                    res = Faraday.post(api, params)
                end                
            rescue StandardError => e
                if @retries < 3
                    @retries += 1
                    puts "retrying.."
                    sleep(2) 
                    retry
                else
                    raise e
                end
            end
        end
    end
end
# res = MapQuest::Base.new.make_request("post","Denver,CO",FORWARD_API)
# puts res.body

# ## How to get status of res if error occured
# retries = 0
# begin
#     # retries = 0
#     if retries == 0
#         raise "Retries is 0"
#     else
#         puts " Program ran successfully"
#     end    
# rescue StandardError => e
#     retries += 1
#     puts "retrying..."
#     retry
# end