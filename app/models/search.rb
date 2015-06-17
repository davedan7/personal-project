class Search #< ActiveRecord::Base
  require 'net/http'
  require 'json'

  def jobs(zip, *words)
    search_phrase = words.join("+")
    zipcode       = zip.to_s
    url           = URI.parse("https://pipes.yahoo.com/pipes/pipe.run?_id=9cb44301dcece96db1d28de6959bd25c&_render=json&locationinput1=#{zipcode}&textinput2=#{search_phrase}")
    # parser = URI::Parser.new
    # JSON.parse(parser.parse(url).to_s)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
  end
  
end

s = Search.new
p s.jobs(80202, "web", "developer")

# url = URI.parse('http://www.example.com/index.html')
# req = Net::HTTP::Get.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
#   http.request(req)
# }
# puts res.body



# require "net/http"
# require "uri"

# uri = URI.parse("http://google.com/")

# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new(uri.request_uri)

# response = http.request(request)

# response.code             # => 301
# response.body             # => The body (HTML, XML, blob, whatever)
# # Headers are lowercased
# response["cache-control"] # => public, max-age=2592000

# # Listing all headers
# response.each_header { |h| do_something(h, response[h]) } # => location = http://www.google.com/
#                                                           # => content-type = text/html; charset=UTF-8
#                                                           # => cache-control = public, max-age=2592000
#                                                           # etc...

# class RssParser

#   require 'rexml/document'

#   def self.run(url)
#     xml = REXML::Document.new Net::HTTP.get(URI.parse(url))
#     data = {
#       :title => xml.root.elements['channel/title'].text,
#       :home_url => xml.root.elements['channel/link'].text,
#       :rss_url => url,
#       :items => []
#     }

#     xml.elements.each '//item' do |item|
#       new_items = {} and item.elements.each do |e|
#         new_items[e.name.gsub(/^dc:(w)/,"1").to_sym] = e.text
#       end
#       data[:items] <<>
#     end

#     data
#   end

# end