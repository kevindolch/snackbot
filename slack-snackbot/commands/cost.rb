module SlackMathbot
  module Commands
    class Cost < SlackRubyBot::Commands::Base
      command 'cost' do |client, data, match|
        cost = Item.total_cost_of_list(List.last.id)
        client.say(channel: data.channel, text: "The total cost of this list is #{cost}")
      end
    end
  end
end
