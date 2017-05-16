class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	 validates_presence_of :long_url
    validates_format_of :long_url, :with => URI::regexp(['http', 'https']),
    :message => "Only letters allowed"
      

  def shorten
    # Write a method here

 		# after_validation :display_short_url

 		# def display_short_url
 		# 	url = Urls.where(long_url = link) #link is user inputted link
  	# 		return short_url = url.short_url
 		# end


  #   	url = Urls.where(long_url = link) #link is user inputted link
  # 		long_url = url.long_url
  # 		short_url = url.short_url

  #   	if link == long_url #link has previously been shorted
  #   		return short_url
  #   	else
  #   		short_arr = Array.new(6)
  #   		alphabet_arr = ('a'..'z').to_a + ('A'..'Z').to_a
  #   		short_arr.map!{|i| i = alphabet_arr.sample}
  #   		short = short_arr.unshift(rand(10).to_s).join
  #   		short = "http://ton.ly/" + short
  #   		Urls.create(long_url: link, short_url: short)
		# end
	end
end
