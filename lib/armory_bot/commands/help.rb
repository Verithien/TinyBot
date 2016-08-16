module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help, bucket: :fight) do |event, *info|

        break if info.length >= 1

        puts '#{event.server.name} - CMD: help'

        event << 'New v1 Bot Website: <http://bit.ly/2blbFZ2>'
        
      end
    end
  end
end
