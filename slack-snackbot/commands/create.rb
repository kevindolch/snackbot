

module SlackMathbot
  module Commands
    class Create < SlackRubyBot::Commands::Base
      command 'create' do |client, data, match|
        name = match[:expression].tr("<>", "")
        if List.create!(name: name)
          client.say(channel: data.channel, text: "list #{name} created")
        else
          client.say(channel: data.channel, text: "List did not save correctly. Ya dun goofed")
        end
      end
    end
  end
end
