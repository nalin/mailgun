require "rest-client"
require "json"
require "multimap"

require "mailgun/mailgun_error"
require "mailgun/base"
require "mailgun/campaign"
require "mailgun/mailbox"
require "mailgun/mailing_list"
require "mailgun/message"
require "mailgun/unsubscribe"
require "mailgun/route"


def Mailgun(options={})
  Mailgun::Base.new(options)
end
