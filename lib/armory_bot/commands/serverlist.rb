module ArmoryBot
  module Commands
    module ServerList
      extend Discordrb::Commands::CommandContainer
      command(:serverlist) do |event|
        if event.user.id == 100311929821626368
          event.respond "TEST WORKED"
        else
          nil
        end
      end
    end
  end
end