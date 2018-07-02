require 'twilio-ruby'

class Caller
  def self.call(to)
    # Get your Account Sid and Auth Token from twilio.com/console
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

    call = @client.calls.create(
        to: "+32486899652",
        from: "+3278259049",
        url: "http://13609d7d.ngrok.io/calls/voice.xml",
        record: true)
    puts call.sid
  end
end