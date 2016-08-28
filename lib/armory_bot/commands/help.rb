module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help, bucket: :fight) do |event, *info|

        break if info.length >= 1

        puts '#{event.server.name} - CMD: help'

        #event << 'Bot Website v1: http://bit.ly/2blbFZ2'

        event << 'https://discord.gg/NPArPx7'
        
      end
    end
  end
end
