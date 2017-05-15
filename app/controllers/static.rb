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
    	@url = Url.create(long_url: params[:long_url], short_url: short)
    	@urls = Url.all
    	erb :"static/index"
	else
		@urls = Url.all
		erb :"static/index"
	end
end

post '/click_count' do
  @url = Url.find_by(short_url: params[:short_url])

  erb :"static/index"
end

post '/clear' do
	Url.destroy_all
	erb :"static/index"
end

# i.e. /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  u = Url.find_by(short_url: params[:short_url])
  u.click_count += 1
  u.save
  redirect u.long_url
end