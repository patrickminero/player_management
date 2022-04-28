require 'sinatra'
require 'mail'
require 'bunny'

class PlayerMailer
  def self.send_email(params)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end

    Mail.deliver do
      to      params['email']
      from    'info@test.com'
      subject params['subject']
    
      text_part do
        body "Name:#{params['player']['name']}, Position: #{params['player']['position']}, Price: #{params['player']['price']}"
      end
    
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<h1>Name: #{params['player']['name']}</h1></br><h3>Position: #{params['player']['position']}</h3></br><h3>Price: #{params['player']['price']}</h3>"
      end
    end
  end

  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue("new_player_email")
  begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      email_params = JSON.parse(body)
      send_email(email_params)
      puts "Email sent to #{email_params['email']}"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end
end
