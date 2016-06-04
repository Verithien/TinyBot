module ArmoryBot
  module Commands
    module Servers
      extend Discordrb::Commands::CommandContainer
        break unless event.user.id == 100311929821626368
      end
    end
  end
        event.bot.servers.count
end