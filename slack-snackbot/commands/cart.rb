require_relative '../util/scraper'
module SlackMathbot
  module Commands
    class Cart < SlackRubyBot::Commands::Base
      command 'cart' do |client, data, match|
        scraper = Scraper.new("https://express.google.com/")
        error_count = scraper.add_to_shopping_cart
        scraper.close
        output = error_count > 0 ? "There were #{error_count} items that were not added to the cart successfully" : "Items have been successfully added to cart"
        client.say(channel: data.channel, text: output)
      end
    end
  end
end
