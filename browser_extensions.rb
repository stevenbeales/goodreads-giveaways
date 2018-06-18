
#methods to login and enter all competions on GoodReads
module BrowserExtensions
	def log_in
	  begin	
	    text_field(:id => 'userSignInFormEmail').set 'YOUR USERNAME'
	    text_field(:id => 'user_password').set 'YOUR PASSWORD'
	    form(:id => 'sign_in').submit
	  rescue

	  end  
	end  

	def get_books(url)
	  goto url
	  enter_giveaways(get_all_giveaway_links)
	end

  private
	
	def get_all_giveaway_links
	  self.links.collect do |link| 
	  	link.href if (link.href =~ /giveaway\/enter/)
	  end.compact!	
	end

	def enter_giveaways(giveaway_links)
	  giveaway_links.each do |link|
    	goto link
    	enter_giveaways_on_page
      end	
	end

    def enter_giveaways_on_page
      self.links.each do |link|
        enter_giveaway if link.href =~ /enter_choose/
      end
	end

	def enter_giveaway
      self.link(:text, 'select this address').wait_until_present
      self.link(:text, 'select this address').click
      self.checkbox(:id => 'terms').wait_until_present
      self.checkbox(:id => 'terms').set(true)
      self.checkbox(:id => 'want_to_read').clear
      self.form(:name=> 'entry_form').submit
	end
end
