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
                    # 'location' => location 
                }
                # res = nil
                if method.downcase == "get"                    
                    res = Faraday.get(api, params)                    
                    # puts res.status
                elsif method.downcase == "post"
                    res = Faraday.post(api, params)
                end
                # res.status = 500
                if res.status == 403
                    raise " Wrong API, please check and try again "
                end
                puts res.status
                ## Converting to hash because res.status gives 200 except 403
                 
                res_hash = JSON.parse(res.body)
                res_hash["info"]["statuscode"] = 503
                if res_hash["info"]["statuscode"]/100 ==4
                    raise "Wrong Location, Please check and try again"
                end
                
                if res_hash["info"]["statuscode"]/100 ==5
                    raise "5"
                end
            rescue Exception => e
                if(e.message=="5")
                    if retries < 3
                        retries += 1
                        puts "retrying.."
                        sleep(2) 
                        retry
                    else
                        raise e
                    end
                end
                puts e.message           
                        
            end
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