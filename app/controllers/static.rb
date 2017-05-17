require 'sinatra'
require 'sinatra/flash'
enable :sessions

get '/' do
  @urls = Url.all
  erb :"static/index"
end

post '/urls' do
	puts "urls======"
	@url = Url.find_by(long_url: params[:long_url])
	if @url.nil?
    	short_arr = Array.new(6)
    	alphabet_arr = ('a'..'z').to_a + ('A'..'Z').to_a
    	short_arr.map!{|i| i = alphabet_arr.sample}
    	short = short_arr.unshift(rand(10).to_s).join

    	@url = Url.new(long_url: params[:long_url], short_url: short)
      if @url.save
      Url.last(15).to_json(except: :id)
      end
	end
end

post '/clear' do
	Url.destroy_all
	# redirect to '/'
end

# i.e. /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  u = Url.find_by(short_url: params[:short_url])
  u.counter
  u.save
  # Url.last.to_json(except: :id)
  redirect to u.long_url
  # Url.last(5).to_json(except: :id)
  # u.click_count.to_json
  # erb :"static/index"
end