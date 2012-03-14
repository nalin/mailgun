module Mailgun
  class MailingList

    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end
    
    # Get all mailing lists
    def lists
      Mailgun.submit :get, mailing_lists_url
    end
    
    # Get / Check a mailing list
    def get(address)
      Mailgun.submit :get, mailing_list_url(address)
    end
    
    # Creates a mailing list on the Mailgun server
    def create(address, desc = '')
      Mailgun.submit :post, mailing_lists_url, :address => address, :description => desc
    end
    
    # Get members in a mailing list on the Mailgun server
    def get_members(mailinglist, subscribed = true, limit=100)
      Mailgun.submit :get, members_mailing_list_url(mailinglist),
        :subscribed => subscribed,
        :limit => limit
    end
    
    # Get a member in a mailing list on the Mailgun server
    def get_member(mailinglist, user_email)
      Mailgun.submit :get, member_mailing_list_url(mailinglist, user_email)
    end

    # Add a member to a mailing list on the Mailgun server
    def add_member(mailinglist, user_email, user_name, vars = {})
      Mailgun.submit :post, members_mailing_list_url(mailinglist),
        :subscribed => true,
        :address => user_email,
        :name => user_name,
        :description => 'Customer',
        :vars => vars
    end
    
    # Update a member to a mailing list on the Mailgun server
    def update_member(mailinglist, user_email, user_name, vars = {})
      Mailgun.submit :put, member_mailing_list_url(mailinglist, user_email),
        :subscribed => true,
        :address => user_email,
        :name => user_name,
        :description => 'Customer',
        :vars => vars
    end
    
    # Remove a member to a mailing list on the Mailgun server
    def destroy_member(mailinglist, user_email)
      Mailgun.submit :delete, member_mailing_list_url(mailinglist, user_email)
    end
    
    private

    # Helper method to generate the proper url for Mailgun mailing list API calls
    def mailing_lists_url
      "#{@mailgun.base_url}/lists"
    end
    
    def mailing_list_url(address)
      "#{@mailgun.base_url}/lists/#{address}"
    end
    
    def members_mailing_list_url(address)
      "#{@mailgun.base_url}/lists/#{address}/members"
    end
    
    def member_mailing_list_url(address, member_id)
      "#{@mailgun.base_url}/lists/#{address}/members/#{member_id}"
    end
    
  end
end