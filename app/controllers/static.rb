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
        flash[:success] =  "Congratulations. You created a link!"
        redirect to '/'
      else
        flash[:danger] = "Bad Format: Link should start with https://"
        redirect to '/'
      end
	else
      flash[:danger] = "Link has already been shortened"
      redirect to '/'
	end
end

post '/clear' do
	Url.destroy_all
	redirect to '/'
end

# i.e. /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  u = Url.find_by(short_url: params[:short_url])
  u.click_count += 1
  u.save
  redirect u.long_url
  # erb :"static/index"
end