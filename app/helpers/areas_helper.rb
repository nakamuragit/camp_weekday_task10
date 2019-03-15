module AreasHelper
require 'net/http'
require 'uri'
require "json"

  def research(post_code) 
    res = Net::HTTP.get(URI.parse("http://zipcloud.ibsnet.co.jp/api/search?zipcode=#{post_code}"))
    JSON.parse(res)
  end
end
