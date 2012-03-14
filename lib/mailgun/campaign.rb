module Mailgun
  class Campaign

    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # Creates a campaign on the Mailgun server
    def create(name, id)
      Mailgun.submit :post, campaigns_url, :name => name, :id => id
    end
    
    # return all campaigns on the Mailgun server
    def lists(limit = 100)
      Mailgun.submit :get, campaigns_url, :limit => limit
    end
    
    # Get a campaign on the Mailgun server
    def get(id)
      Mailgun.submit :get, campaign_url(id)
    end
    
    private

    # Helper method to generate the proper url for Mailgun mailing list API calls
    def campaigns_url
      "#{@mailgun.base_url}/#{APP_CONFIG[:mailgun_api_domain]}/campaigns"
    end
    
    def campaign_url(id)
      "#{@mailgun.base_url}/#{APP_CONFIG[:mailgun_api_domain]}/campaigns/#{id}"
    end
  end
end