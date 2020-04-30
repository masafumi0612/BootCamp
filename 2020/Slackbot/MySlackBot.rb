# coding: utf-8
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'SlackBot'

class MySlackBot < SlackBot
  # cool code goes here
end

slackbot = MySlackBot.new

set :environment, :production
set :port,443

get '/' do
  "SlackBot Server"
end

post '/slack' do
  content_type :json

  if params[:text].include?("と言って")  
    message = params[:text].split(/[「|」]/)
    string = message[1]
    slackbot.post_message(message[1], {username: "masabot"})
    return
  end
  if params[:text].include?("天気")
    slackbot.my_weather(params, username: "masabot")
    return
  end
end

