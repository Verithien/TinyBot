module ArmoryBot
  module Commands
    module ServerList
      extend Discordrb::Commands::CommandContainer
      command(:serverlist) do |event|
        if event.user.id == 100311929821626368
          puts bot.servers.map{|k,v| [k, v.name]}.to_h
        else
          nil
        end
      end
    end
  end
end