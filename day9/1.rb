# require 'net/https'
# require 'rest-client'
# def check_URL(url)
#     uri = URI('https://checkurl.phishtank.com/checkurl/index.php')
#     res = Net::HTTP.post_form(uri, 'url' => url, 'format' => 'json')
#     # res = RestClient.post(uri, payload, headers={'url' => url})
#     puts res.body
    
# end

# begin
#     puts " Enter the URL to check "
#     url = gets.chomp
#     check_URL(url)
# end

# # require 'rest_client'

# # res = RestClient.get 'http://example.com/resource'
require 'json'
require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http
def check_URL(url)
    url = 'https://checkurl.phishtank.com/checkurl/index.php'
    headers = { 
        'url' => 'http://www.travelswitchfly.com/',
        'format' => 'json'
    }
    res = Faraday.post(url, headers)    
    json_data = JSON[res.body]
    if json_data["results"]["valid"]
        puts " #{url} is valid"
    else
        puts " #{url} is invalid"
    end
rescue => exception
    puts " Error Occured"
    
end

begin
    puts " Enter URL to check "    
    url = gets.chomp
    check_URL(url)
end