module ArmoryBot
  module Commands
    module Servers
      extend Discordrb::Commands::CommandContainer
      command(:servers) do |event|
        break unless event.user.id == 100311929821626368
        list = event.bot.servers.count
        event << list.join(' ')
      end
    end
  end
end