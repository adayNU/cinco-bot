# cinco-bot
Spice up any [Slack](https://slack.com/) channel with `cinco-bot`! Create a bot user and get their API token to begin.

You will need an API token for the [YouTube Data API](https://developers.google.com/youtube/v3/) and [bundler](http://bundler.io/). `cinco-bot` also expects Ruby v2.3.0.

`cinco-bot` is built on top of [dblock/slack-ruby-bot](https://github.com/dblock/slack-ruby-bot).

## Running Instructions
```ruby
bundle install
SLACK_API_TOKEN=<bot_token> API_TOKEN=<youtube_data_api_token> bundle exec ruby bot.rb
```
