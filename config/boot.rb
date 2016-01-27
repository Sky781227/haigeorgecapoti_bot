# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
require 'telegram_bot'
require 'pp'
require 'logger'

logger = Logger.new(STDOUT, Logger::DEBUG)

load 'external.rb'

motivatie = ["Some people die at 25 and aren’t buried until 75. – Benjamin Franklin", "Here is the test to find whether your mission on Earth is finished: if you’re alive, it isn’t. – Richard Bach", "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma — which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition. They somehow already know what you truly want to become. Everything else is secondary. – Steve Jobs"]
cesafac = ["Quit bitching about how tired you are.", "If the motivation you need is to work on building your own business", "Put a pot of coffee on or get some tea brewing.", "Turn off email, Twitter, Facebook, Pinterest and whatever other social procrastination network you’re part of.", "Now, put on your favorite music playlist."]

bot = TelegramBot.new(token: '168908536:AAEr3XjROJDtwIlWIPkfCjgwIeNxdYYJVjI')
logger.debug "starting telegram bot"

bot.get_updates(fail_silently: true) do |message|
  logger.info "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /motivatie/
      reply.text = motivatie.sample
    when /cesafac/
      reply.text = cesafac.sample
    when /bagauncitat/
      reply.text = External.motivate_the_shit_out_of_george
    else
      reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
    end
    logger.info "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
