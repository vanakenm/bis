require 'twilio-ruby'

class Caller
  def self.call(request_id)
    request = Request.find(request_id)
    # Get your Account Sid and Auth Token from twilio.com/console
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

    call = @client.calls.create(
        to: "+32486899652",
        from: "+3278259049",
        url: "http://2fcff55a.ngrok.io/calls/voice.xml?request_id=#{request_id}",
        record: true)
    request.call_id = call.sid
    request.save
  end
end