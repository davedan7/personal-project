class SearchesController < ApplicationController
 # https://pipes.yahoo.com/pipes/pipe.run?_id=9cb44301dcece96db1d28de6959bd25c&_render=json&locationinput1=80202&textinput2=web+developer 

 def search_jobs
  zipcode      = params[:zip]
  search_words = params[:search_string]
  feedurl      = "https://pipes.yahoo.com/pipes/pipe.run?_id=9cb44301dcece96db1d28de6959bd25c&_render=json&locationinput1=#{zip}&textinput2=#{searchword.join("+")}"
 end

end
