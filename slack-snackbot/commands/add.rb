require 'byebug'
require_relative '../util/scraper'

module SlackMathbot
  module Commands
    class Add < SlackRubyBot::Commands::Base
      command 'add' do |client, data, match|
        url = match[:expression].tr("<>", "")
        scraper = Scraper.new(match[:expression].tr("<>", ""))
        price = scraper.get_price
        name = scraper.get_name
        list = List.last
        Item.create(price: price, name: name, list: list, url: url)
        scraper.close
        client.say(channel: data.channel, text: "#{name} #{price}")
      end
    end
  end
end
