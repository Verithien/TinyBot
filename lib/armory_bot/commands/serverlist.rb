module ArmoryBot
  module Commands
    module ServerList
      extend Discordrb::Commands::CommandContainer
      command(:serverlist) do |event|
        #if event.user.id == '100311929821626368'
          event.user.id
        #else
          #nil
        #end
      end
    end
  end
end