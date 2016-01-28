require 'telegram_bot'

task start_bot: :environment do |t|
  Bot.start
end