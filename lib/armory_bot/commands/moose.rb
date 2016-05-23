module ArmoryBot
  module Commands
    module Moose
      extend Discordrb::Commands::CommandContainer
      command(:moose, bucket: :armory) do |event, *realm, char, region|
        realm = realm.join('-')
        region = region.downcase
        @@api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'
        mooseus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_US&apikey=#{@@api_key}", :verify => false ).parsed_response
        mooseeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_GB&apikey=#{@@api_key}", :verify => false ).parsed_response
        realm1 = realm.downcase
          if region == "us"
            moose = mooseus
          elsif region == "eu"
            moose = mooseeu
          else
            event.respond "Sorry #{event.user.name}, please insert the region US or EU(?help for more info)"
          end

        mooses = moose["mounts"]["collected"].find { |r| r["name"] == "Grove Warden" }
        puts "MOOSE CHECK"
        mooses ? "**#{char.capitalize}** has the **Grove Warden** mount from **Archimonde**" : "**#{char.capitalize}** does not have the moose yet :("

        event.bot.game = 'with Moose'
        nil
      end
    end
  end
end