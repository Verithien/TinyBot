module ArmoryBot
  module Commands
    module Servers
      extend Discordrb::Commands::CommandContainer
      	command(:servers) do |event|

        break unless event.user.id == 100311929821626368

        HTTParty.post("https://www.carbonitex.net/discord/data/botdata.php",
        				:body => { :key => "chuey0187s276sazzf",
        						   :servercount => event.bot.servers.count }.to_json
        			)

        puts "server count"

        event.bot.servers.count

      end
    end
  end
end