module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help, bucket: :fight) do |event|

        puts 'CMD: help'

        event << 'Check out ArmoryBot Docs'
        event << '<http://bit.ly/1R3iaaX>'
        
      end
    end
  end
end