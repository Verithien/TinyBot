module ArmoryBot
  module Commands
    module Servers
      extend Discordrb::Commands::CommandContainer
      command(:servers) do |event|
        break unless event.user.id == 100311929821626368
        event.bot.servers.count.join(' ')
      end
    end
  end
end