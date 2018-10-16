module SlackMathbot
  module Commands
    class Clear < SlackRubyBot::Commands::Base
      command 'clear' do |client, data, match|
        List.last.items.delete_all
        client.say(channel: data.channel, text: "list cleared")
      end
    end
  end
end
