
require_relative './APIs'
require_relative './base'
module MapQuest
    class Reverse < Base
        def get_reverse(locations)
            res = self.make_request('get', location, REVERSE_API)
            puts res.body
        end
        def post_reverse(location)
            res = self.make_request('post', location, REVERSE_API)
            puts res.body
        end
    end
end
MapQuest::Reverse.new.get_reverse('40.039401,-76.307078')