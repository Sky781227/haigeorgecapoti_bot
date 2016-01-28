require 'telegram_bot'
require 'pp'
require 'logger'

logger = Logger.new(STDOUT, Logger::DEBUG)

class External
  def self.motivate_the_shit_out_of_george
    quotes =  []
    quotes << "Nothing is impossible, the word itself says “I’m possible”! —Audrey Hepburn"
    quotes << "I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. —Maya Angelou"
    quotes << "Whether you think you can or you think you can’t, you’re right. —Henry Ford"
    quotes << "Perfection is not attainable, but if we chase perfection we can catch excellence. —Vince Lombardi"
    quotes << "Life is 10% what happens to me and 90% of how I react to it. —Charles Swindoll"
    quotes << "If you look at what you have in life, you’ll always have more. If you look at what you don’t have in life, you’ll never have enough. —Oprah Winfrey"
    quotes << "Remember no one can make you feel inferior without your consent. —Eleanor Roosevelt"
    quotes << "I can’t change the direction of the wind, but I can adjust my sails to always reach my destination. —Jimmy Dean"
    quotes << "Believe you can and you’re halfway there. —Theodore Roosevelt"
    quotes << "To handle yourself, use your head; to handle others, use your heart. —Eleanor Roosevelt"
    quotes << "Too many of us are not living our dreams because we are living our fears. —Les Brown"
    quotes << "Do or do not. There is no try. —Yoda"
    quotes << "Whatever the mind of man can conceive and believe, it can achieve. —Napoleon Hill"
    quotes << "Strive not to be a success, but rather to be of value. —Albert Einstein"
    quotes << "I am not a product of my circumstances. I am a product of my decisions. —Stephen Covey"
    quotes << "When everything seems to be going against you, remember that the airplane takes off against the wind, not with it. —Henry Ford"
    quotes << "The most common way people give up their power is by thinking they don’t have any. —Alice Walker"
    quotes << "The most difficult thing is the decision to act, the rest is merely tenacity. —Amelia Earhart"
    quotes << "It is during our darkest moments that we must focus to see the light. —Aristotle Onassis"
    quotes << "Don’t judge each day by the harvest you reap but by the seeds that you plant. —Robert Louis Stevenson"
    quotes << "The only way to do great work is to love what you do. —Steve Jobs"
    quotes << "Change your thoughts and you change your world. —Norman Vincent Peale"
    quotes << "I would rather die of passion than of boredom. —Vincent van Gogh"

    quotes.sample
  end
end

bot = TelegramBot.new(token: '168908536:AAEr3XjROJDtwIlWIPkfCjgwIeNxdYYJVjI')
logger.debug "starting telegram bot"

bot.get_updates(fail_silently: true) do |message|
  logger.info "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /motivatie/
      reply.text = External.motivate_the_shit_out_of_george
    when /cesafac/
      reply.text = External.motivate_the_shit_out_of_george
    when /bagauncitat/
      reply.text = External.motivate_the_shit_out_of_george
    else
      reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means. Try /motivatie /cesafac /bagauncitat "
    end
    logger.info "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
