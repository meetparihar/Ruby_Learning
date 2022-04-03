require_relative './APIs'
require_relative './base'
module MapQuest
    class Address < Base
        def get_address(location)
            self.make_request('get', location, FORWARD_API).body           
        end
        def post_address(location) 
            self.make_request('post', location, FORWARD_API).body

        end
    end
end
MapQuest::Address.new.get_address('Denver,CO')
# MapQuest::Address.new.post_address('Denver,CO')
 