module SlackMathbot
  module Commands
    class Display < SlackRubyBot::Commands::Base
      command 'list' do |client, data, match|
        output = ""
        List.last.items.each do |item|
          output += item.name
          output += "\n"
        end
        output = "No Items in List" if output.empty?
        client.say(channel: data.channel, text: output)
      end
    end
  end
end
