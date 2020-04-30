# coding: utf-8
require 'json'
require 'uri'
require 'yaml'
require 'net/https'
require 'open-uri'
# require 'slack/incoming/webhooks'

class SlackBot
  def initialize(settings_file_path = "settings.yml")
    config = YAML.load_file(settings_file_path) if File.exist?(settings_file_path)
    # This code assumes to set incoming webhook url as evironment variable in Heroku
    # SlackBot uses settings.yml as config when it serves on local
    @incoming_webhook = ENV['INCOMING_WEBHOOK_URL'] || config["incoming_webhook_url"]
  end

  def post_message(string, options = {})
    payload = options.merge({text: string})
    uri = URI.parse(@incoming_webhook)
    res = nil
    json = payload.to_json
    request = "payload=" + json
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      res = http.post(uri.request_uri, request)
    end

    return res
  end
  
  def my_weather(params, options = {})
    uri = URI.parse(@incoming_webhook)
    if params[:text].include?("北海道")
      p "Hokkaidou!!"
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=016010' 
    elsif params[:text].include?("青森")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=020010' 
    elsif params[:text].include?("岩手")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=030010' 
    elsif params[:text].include?("宮城")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=040010' 
    elsif params[:text].include?("秋田")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=050010' 
    elsif params[:text].include?("山形")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=060010' 
    elsif params[:text].include?("福島")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=070010' 
    elsif params[:text].include?("茨城")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=080010' 
    elsif params[:text].include?("栃木")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=090010' 
    elsif params[:text].include?("群馬")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=100010' 
    elsif params[:text].include?("埼玉")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=110010' 
    elsif params[:text].include?("千葉")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=120010' 
    elsif params[:text].include?("東京")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010' 
    elsif params[:text].include?("神奈川")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010' 
    elsif params[:text].include?("新潟")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=150010' 
    elsif params[:text].include?("富山")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=160010' 
    elsif params[:text].include?("石川")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=170010' 
    elsif params[:text].include?("福井")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=180010' 
    elsif params[:text].include?("山梨")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=190010' 
    elsif params[:text].include?("長野")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=200010' 
    elsif params[:text].include?("岐阜")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=210010' 
    elsif params[:text].include?("静岡")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=220010' 
    elsif params[:text].include?("愛知")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=230010' 
    elsif params[:text].include?("三重")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=240010' 
    elsif params[:text].include?("滋賀")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=250010' 
    elsif params[:text].include?("京都")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=260010' 
    elsif params[:text].include?("大阪")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=270000'
      # 大阪は270000
    elsif params[:text].include?("兵庫")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=280010' 
    elsif params[:text].include?("奈良")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=290010' 
    elsif params[:text].include?("和歌山")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=300010' 
    elsif params[:text].include?("鳥取")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=310010' 
    elsif params[:text].include?("島根")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=320010' 
    elsif params[:text].include?("岡山")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=330010' 
    elsif params[:text].include?("広島")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=340010' 
    elsif params[:text].include?("山口")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=350020'
      # 山口は350010(下関市)ではなく350020(山口市)を指定
    elsif params[:text].include?("徳島")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=360010' 
    elsif params[:text].include?("香川")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=370000'
      # 香川は370000(香川市)
    elsif params[:text].include?("愛媛")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=380010' 
    elsif params[:text].include?("高知")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=390010' 
    elsif params[:text].include?("福岡")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=400010' 
    elsif params[:text].include?("佐賀")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=410010' 
    elsif params[:text].include?("長崎")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=420010' 
    elsif params[:text].include?("熊本")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=430010' 
    elsif params[:text].include?("大分")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=440010' 
    elsif params[:text].include?("宮崎")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=450010' 
    elsif params[:text].include?("鹿児島")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=460010' 
    elsif params[:text].include?("沖縄")
      uri_weather = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=471010'
      # 470010ではなく471010(那覇市)であることに注意
    end
    res     = JSON.load(open(uri_weather).read)
    title   = res['title']
    text    = res['description']['text']
    link    = res['link']
    if params[:text].include?("明日")
      p "tomorrow"
      weather = res['forecasts'][1]
    elsif params[:text].include?("明後日")
      p "the day after tomorrow"
      weather = res['forecasts'][2]
    else
      p "today"
      weather = res['forecasts'].first
    end
    p weather
    payload = params
    payload = options.merge({text: "#{weather['date']}の#{title}は「#{weather['telop']}」です。"})
    if weather['temperature']['max'] != nil && weather['temperature']['min'] != nil then
      payload[:text] = payload[:text] + "この日の最高気温は#{weather['temperature']['max']['celsius']}℃、最低気温は#{weather['temperature']['min']['celsius']}℃です。"
    end
    payload[:text] = payload[:text] + "\n#{text}"
    p payload[:text]
    json = payload.to_json
    request = "payload=" + json
#    p request
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      res = http.post(uri.request_uri, request)    
    end
  end  
end
