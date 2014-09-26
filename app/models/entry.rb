class Entry < ActiveRecord::Base
  after_create :send_tweet, if: Proc.new { Rails.env.production? }
  after_create :send_reminder_tweet, if: Proc.new { Rails.env.production? }
  
  validates :goal, presence: true

  TWEET_DELAY = 1.hour

  private

  def send_tweet
    bot = NGDWYLBot.new
    if submitted_by.present?
      tweet = "#{ goal } - #{ submitted_by }"
    else
      tweet = "#{ goal } - anonymous"
    end
    bot.tweet(tweet)
  end

  def send_reminder_tweet
    if submitted_by.present? && submitted_by.first == "@"
      bot = NGDWYLBot.new
      tweet = "Hey #{ submitted_by }, how's #{ goal } coming along? It's been #{ TWEET_DELAY } seconds."
      bot.delay(run_at: TWEET_DELAY.from_now).tweet(tweet)
    end
  end

end
