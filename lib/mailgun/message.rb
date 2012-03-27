module Mailgun
  class Message
    
    # Used internally, called from Mailgun::Base
    def initialize(mailgun)
      @mailgun = mailgun
    end

    # send email
    def send_email(options)
      # TODO with the following options
      # :from, :to, :cc, :bcc, :subject, :text, :html 
      # :with_attachment
      # :with_attachments
      # :at for delayed delivery time option
      # :in_test_mode BOOL. override the @use_test_mode setting
      # :tags to add tags to the email
      # :track BOOL
      Mailgun.submit :post, message_url(options[:from].split("@").last), options
    end
    
    private

    # Helper method to generate the proper url for Mailgun mailbox API calls
    def message_url(domain, mime_message=false)
      "#{@mailgun.base_url}/#{domain}/messages#{'.mime' if mime_message}"
    end
    
  end
end
