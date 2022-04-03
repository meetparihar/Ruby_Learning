require_relative './APIs'
require 'json'
require 'faraday'
require 'faraday/net_http'
# require 'pry'
module MapQuest
    class Base
        attr_reader :key        
        @@key = API_KEY
        def make_request(method, location, api)
            retries = 0
            begin                
                params = {
                    'key' => @@key,
                    'location' => location 
                }
                if method.downcase == "get"                    
                    res = Faraday.get(api, params)                    
                    # puts res.status
                elsif method.downcase == "post"
                    res = Faraday.post(api, params)
                end
                res_hash = JSON.parse(res.body)
                statuscode = res_hash["info"]["statuscode"]

                if res.status == 200 && statuscode == 200
                    return res.body
                else
                    ## check statuscode
                    ## instead of raising do retry here
                    raise statuscode 
                end
            rescue Exception => e
                if e.message = 400
                    return "puts error 400"
                end
                else 

            return res
        end
    end
end
# res = MapQuest::Base.new.make_request("post","Denver,CO",FORWARD_API)
# puts res.body
# rescue Exception => e
            #     puts e.message
            #     # if retries < 3
            #     #     retries += 1
            #     #     puts "retrying.."
            #     #     sleep(2) 
            #     #     retry
            #     # else
            #     #     raise e
            #     # end
            # end
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