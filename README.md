Mailgun
=========
This gem allows for idiomatic Mailgun usage from within ruby. Mailgun is a kickass email-as-a-service that lets you use email as if it made sense. Check it out at http://mailgun.net/

The official gem repo is at https://github.com/Bushido/mailgun

Usage
=====
We mimic the ActiveRecord-style interface.

Configure Mailgun API Key in config/app_config.yml

  development:
  mailgun_api_key: 'your-api-key'
  mailgun_api_domain: 'your-api-domain'


Initialize:

  @mailgun = Mailgun::Base.new(:api_key => APP_CONFIG[:mailgun_api_key])
  
Mailboxes:

    # Create a mailbox
    @mailgun.mailboxes.create "new-mailbox@your-domain.com", "password"
    
    # List all mailboxes that belong to a domain
    @mailgun.mailboxes.list "domain.com"
    
    # Destroy a mailbox (queue bond-villian laughter)
    # "I'm sorry Bond, it seems your mailbox will be... destroyed!"
    @mailbox.mailboxes.destroy "bond@mi6.co.uk"
    
MailingLists:

    # Create a mailing list
    @mailgun.mailing_lists.create "alias-address@your-domain.com", "description"
    
    # List all members in a mailing list
    @mailgun.mailing_lists.get_members("mailing list address", subscribed, limit)
    
    # Get one member in a mailing list
    @mailgun.mailing_lists.get_member("mailing list address", "user email")
    
    # Add one member in a mailing list
    @mailgun.mailing_lists.add_member("mailing list address", "user email", "user name", user_vars)
    
    # Update one member in a mailing list
    @mailgun.mailing_lists.update_member("mailing list address", "user email", "user name", user_vars)
    
    # Delete one member in a mailing list
    @mailgun.mailing_lists.destroy_member("mailing list address", "user email")

Campaigns:

    # Create a campaign, campaign id is X-Mailgun-Campaign-Id
    @mailgun.campaigns.create("campaign name", "campaign id")
  
    # List all campaigns
    @mailgun.campaigns.lists
  
    # Get a campaign
    @mailgun.campaigns.get("campaign id")


Unsubscribe:

    # List all unsubscribed users
    @mailgun.unsubscribes.lists

    # Get / Check if a user is in unsubscribed list
    @mailgun.unsubscribes.get(user_email)
    
    # Add a user to unsubscribed list
    @mailgun.unsubscribes.create(user_email)
    
    # Remove a user to unsubscribed list
    @mailgun.unsubscribes.destroy(user_email)


Routes:

    # Initialize your Mailgun object:
    @mailgun = Mailgun(:api_key => 'your-api-key')

    # Create a route
    # Give it a human-readable description for later, a priority
    # filters, and actions
    @mailgun.routes.create "Description for the new route", 1,
         [:match_recipient, "apowers@mi5.co.uk"],
         [[:forward, "http://my-site.com/incoming-mail-route"],
          [:stop]]
    
    # List all routes that belong to a domain
    # limit the query to 100 routes starting from 0
    @mailgun.routes.list 100, 0

    # Get the details of a route via its id
    @mailgun.routes.find "4e97c1b2ba8a48567f007fb6"

    # Update a route via its id
    # (all keys are optional)
    @mailgun.routes.update "4e97c1b2ba8a48567f007fb6", {
         :priority => 2,
         :filter   => [:match_header, :subject, "*.support"],
         :actions  => [[:forward, "http://new-site.com/incoming-emails"]]
         }
    
    # Destroy a route via its id
    @mailbox.routes.destroy "4e97c1b2ba8a48567f007fb6"

Supported route filters are: `:match_header`, `:match_recipient`, and `:catch_all`
Supported route actions are: `:forward`, and `:stop`


Making Your Changes
===================

  * Fork the project (Github has really good step-by-step directions)
  * Start a feature/bugfix branch
  * Commit and push until you are happy with your contribution
  * Make sure to add tests for it. This is important so we don't break it in a future version unintentionally.
  * After making your changes, be sure to run the Mailgun RSpec specs to make sure everything works.
  * Submit your change as a Pull Request and update the GitHub issue to let us know it is ready for review.

Authors
=======

  * Akash Manohar J (akash@akash.im)
  * Sean Grove (sean@gobushido.com)
  * Nalin Mittal (nalin.mittal@gmail.com)

Thanks
======
Huge thanks to the Mailgun guys for such an amazing service! No time spent on mailservers == way more time spent drinking!

License & Copyright
===================
Released under the MIT license. See LICENSE for more details.

All copyright Bushido Inc. 2011
