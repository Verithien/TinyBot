module ArmoryBot
  module Commands
    module BotStats
      extend Discordrb::Commands::CommandContainer
      	command(:bstats, bucket: :fight) do |event|

        postData = HTTParty.post("https://www.carbonitex.net/discord/data/botdata.php",
                                {  
        				                  :body => [ { :key => "chuey0187s276sazzf", :servercount => "#{event.bot.servers.count}" } ].to_json
        						            })

        puts "Server Count: #{event.bot.servers.count}"
        puts postData

event.respond """
```ruby
Armory Bot Stats

Servers: #{event.bot.servers.count}
Users: #{event.bot.users.count}
```"""

      end
    end
  end
end