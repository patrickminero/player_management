require 'sinatra'
require 'mail'
require 'bunny'

class NewPlayerMailer
  Mail.defaults do
    @settings = {
      :address=>"smtp.gmail.com",
      :port=>587,
      :domain=>"gmail.com",
      :user_name=>ENV['GMAIL_ADDRESS'],
      :password=>ENV['GMAIL_APP_PASSWORD'],
      :authentication=>:login,
      :enable_starttls=>nil,
      :enable_starttls_auto=>true,
      :openssl_verify_mode=>nil,
      :ssl=>nil,
      :tls=>nil,
      :open_timeout=>nil,
      :read_timeout=>nil
    }
  end

  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue("new_player_email")
  begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      email_params = JSON.parse(body)
      send(email_params)
      puts "Email sent to #{params[:email]}"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end

  def send(params)
    Mail.deliver do
      to      params[:email]
      from    'info@test.com'
      subject 'New Player added to your team'
    
      text_part do
        body "Name:#{params[:player][:name]}, Position: #{params[:player][:position]}, Price: #{params[:player][:price]}"
      end
    
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<h1>Name: #{params[:player][:name]}</h1></br><h3>Position: #{params[:player][:position]}</h3></br><h3>Price: #{params[:player][:price]}</h3>"
      end
    end
  end
end
