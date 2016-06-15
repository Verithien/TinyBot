module ArmoryBot
  module Commands
    module Glory
      extend Discordrb::Commands::CommandContainer
      command(:glory, bucket: :armory) do |event, *realm, char, region|

        realm = realm.join('-')

        region = region.downcase

        @@api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'

        wolfus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_US&apikey=#{@@api_key}", :verify => false ).parsed_response
        wolfeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_GB&apikey=#{@@api_key}", :verify => false ).parsed_response
        
        realm1 = realm.downcase

        if region == "us"
          wolf = wolfus
        elsif region == "eu"
          wolf = wolfeu
        else
          event.respond "Sorry #{event.user.name}, please insert the region US or EU(?help for more info)"
        end

        wolves = wolf["mounts"]["collected"].find { |r| r["name"] == "Infernal Direwolf" }

        puts "#{event.server.name} - wolf CHECK"

        wolves ? "**#{char.capitalize}** has the **Infernal Direwolf** mount from **Glory of the Hellfire Raider**" : "**#{char.capitalize}** does not have the **Infernal Direwolf** yet :("
     
      end
    end
  end
end