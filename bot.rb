require 'slack-ruby-bot'
require 'rest-client'
require 'json'

API_BASE_URL = 'https://www.googleapis.com/youtube/v3/playlistItems?playlistId=PLChdd6e8jJiROW8uiIsunfCfAc7Vf5yWi&maxResults=50&part=snippet%2CcontentDetails&key='
VIDEO_BASE_URL = 'https://www.youtube.com/watch?v='

class CincoBot < SlackRubyBot::Bot
  match /^cinco$/i do |client, data, match|    
    resp = RestClient.get("#{API_BASE_URL}#{ENV['API_TOKEN']}")
    video_id = JSON.parse(resp.body)["items"].sample["contentDetails"]["videoId"]

    # Slack doesn't like when it gets identical links twice.
    cache_buster = rand(1 << 20)

    client.say(text: "#{VIDEO_BASE_URL}#{video_id}&cache=#{cache_buster}", channel: data.channel, thread_ts: data.thread_ts)
  end
end

CincoBot.run
