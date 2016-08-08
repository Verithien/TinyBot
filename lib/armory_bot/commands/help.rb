module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help, bucket: :fight) do |event|

        puts '#{event.server.name} - CMD: help'

        event << 'Check out ArmoryBot Docs: <http://bit.ly/1R3iaaX>'
        event << '`Paypal Donation:`<http://bit.ly/1RTGoox> | `Patreon:` <https://www.patreon.com/blizzardbot>'
        
      end
    end
  end
end
