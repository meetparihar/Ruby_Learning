
require_relative './APIs'
require_relative './base'
module MapQuest
    class Reverse < Base
        def get_reverse(location)
            puts self.make_request('get', location, REVERSE_API)
            
        end
        def post_reverse(location)
            puts self.make_request('post', location, REVERSE_API)
             
        end
    end
end
MapQuest::Reverse.new.get_reverse('40.039401,-76.307078')
MapQuest::Reverse.new.post_reverse('40.039401,-76.307078')
