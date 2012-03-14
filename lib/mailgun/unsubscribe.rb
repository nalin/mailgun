module Mailgun
  class Unsubscribe

    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # Get members in unsubscribed list on the Mailgun server
    def lists(limit = 100)
      Mailgun.submit :get, unsubscribes_url, :limit => limit
    end
    
    # Get a member in unsubscribed list, can use this to check if user is in unsubscribed list
    def get(address)
      Mailgun.submit :get, unsubscribe_url(address)
    end
    
    # Remove a member in unsubscribed list, can use this to check if user is in unsubscribed list
    def destroy(address)
      Mailgun.submit :delete, unsubscribe_url(address)
    end
    
    # Creates a mailing list on the Mailgun server
    def create(address, tag = nil)
      Mailgun.submit :post, unsubscribes_url, :address => address, :tag => tag
    end
    
    private

    # Helper method to generate the proper url for Mailgun mailing list API calls
    def unsubscribes_url
      "#{@mailgun.base_url}/#{APP_CONFIG[:mailgun_api_domain]}/unsubscribes"
    end
    
    def unsubscribe_url(address)
      "#{@mailgun.base_url}/#{APP_CONFIG[:mailgun_api_domain]}/unsubscribes/#{address}"
    end
    
  end
end