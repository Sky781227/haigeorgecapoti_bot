require 'telegram_bot'
require 'pp'
require 'logger'



class Bot
  @@logger = Logger.new(STDOUT, Logger::DEBUG)
  @@motivatie = ["Some people die at 25 and aren’t buried until 75. – Benjamin Franklin", "Here is the test to find whether your mission on Earth is finished: if you’re alive, it isn’t. – Richard Bach", "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma — which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition. They somehow already know what you truly want to become. Everything else is secondary. – Steve Jobs"]
  @@cesafac = ["Quit bitching about how tired you are.", "If the motivation you need is to work on building your own business", "Put a pot of coffee on or get some tea brewing.", "Turn off email, Twitter, Facebook, Pinterest and whatever other social procrastination network you’re part of.", "Now, put on your favorite music playlist."]

  def self.start
    bot = TelegramBot.new(token: '168908536:AAEr3XjROJDtwIlWIPkfCjgwIeNxdYYJVjI')
    @@logger.debug "starting telegram bot"

    bot.get_updates(fail_silently: true) do |message|
      @@logger.info "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(bot)

      message.reply do |reply|
        case command
        when /motivatie/
          reply.text = @@motivatie.sample
        when /cesafac/
          reply.text = @@cesafac.sample
        when /bagauncitat/
          reply.text = Bot.motivate_the_shit_out_of_george
        else
          reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means. Try /motivatie /cesafac /bagauncitat "
        end
        @@logger.info "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end


  private

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

    quotes << "Fear is a place where you just tell the truth. -Clive Barker"
    quotes << "Wasted youth is better by far the a wise and productive old age. -Meatloaf"
    quotes << "Seek the truth, no matter where it lies. -Metallica"
    quotes << "The foolish man think with narrow mind and speak with wide mouth. -Charlie Chin"
    quotes << "There is no knowledge that is not power. -Mortal Kombat 3"
    quotes << "We've got far too many hung juries and not enough hung defendants. -Dennis Miller"
    quotes << "Conservatives want live babies so they can raise them to be dead soldiers. -George Carlin"
    quotes << "The strength of the Constitution lies entirely in the determination of each citizen to defend it. -Albert Einstein"
    quotes << "Any plan, no matter how poorly conceived, if boldly executed, is better than inaction. -U.S. Infantry Manual"
    quotes << "Affection can no more spoil a child than the sun could be put out by a bucket of gasoline. -L. Ron Hubbard"
    quotes << "A fanatic is a nut who has something to believe in. -Dean Koontz"
    quotes << "Whether or not God exists is not as important as whether a belief in God exists. -Daniel Jackson, SG-1"
    quotes << "Those who make peaceful revolution impossible will make violent revolution inevitable -John F. Kennedy"
    quotes << "A tax-supported, compulsory educational system is the complete model of the totalitarian state -Isabel Paterson"
    quotes << "A person's a person, no matter how small. -Dr. Suess"
    quotes << "Puritanism: The haunting fear that someone, somewhere, may be happy. -H. L. Mencken"
    quotes << "Man is the only animal that blushes...or needs to. -Mark Twain"
    quotes << "Common sense isn't all that common. -Voltaire  Why is it that, as a culture, we are more comfortable seeing two men holding guns than holding hands? -Ernest Gaines"
    quotes << "Resist much. Obey little. -Walt Whitman"
    quotes << "A patriot must always be ready to defend his country against its government. -Edward Abbey"
    quotes << "Reporters are puppets. They simply respond to the pull of the most powerful strings. -Lyndon Johnson"
    quotes << "Parents can only give good advice or put them on the right paths, but the final forming of a person's character lies in their own hands. -Anne Frank"
    quotes << "Thou shalt hold nothing above reason and logic. -The 1st Commandment of Lord Galen"
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
