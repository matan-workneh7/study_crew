# Load environment variables before setting up the Telegram bot
require 'dotenv/load' if Rails.env.development? || Rails.env.test?

# Configure Telegram bot
TELEGRAM_BOT_TOKEN = ENV.fetch('TELEGRAM_BOT_TOKEN') do
  raise "Missing TELEGRAM_BOT_TOKEN environment variable"
end

# Example of how to use it:
# Telegram::Bot::Client.run(TELEGRAM_BOT_TOKEN) do |bot|
#   bot.listen do |message|
#     # Your bot logic here
#   end
# end
