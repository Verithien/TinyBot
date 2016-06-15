module ArmoryBot
  module Commands
    module PvP
      extend Discordrb::Commands::CommandContainer
      command(:pvp, bucket: :armory) do |event, *realm, char, region|

      	api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'

        realm = realm.join('-')
        region = region.upcase

        dataus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=pvp&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
        dataeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=pvp&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response


        if region == "US"
          arena = dataus
        elsif region == "EU"
          arena = dataeu
        else
          event.respond "Sorry #{event.user.name}, please insert your region US or EU(?help for more info)"
        end

    		arena2v2 = arena["pvp"]["brackets"]["ARENA_BRACKET_2v2"]
    		arena2v2r = arena2v2["rating"]
    		arena2v2w = arena2v2["seasonWon"]
    		arena2v2l = arena2v2["seasonLost"]

    		arena3v3 = arena["pvp"]["brackets"]["ARENA_BRACKET_3v3"]
    		arena3v3r = arena3v3["rating"]
    		arena3v3w = arena3v3["seasonWon"]
    		arena3v3l = arena3v3["seasonLost"]

    		arena5v5 = arena["pvp"]["brackets"]["ARENA_BRACKET_5v5"]
    		arena5v5r = arena5v5["rating"]
    		arena5v5w = arena5v5["seasonWon"]
    		arena5v5l = arena5v5["seasonLost"]

    		rbg = arena["pvp"]["brackets"]["ARENA_BRACKET_RBG"]
    		rbgr = rbg["rating"]
    		rbgw = rbg["seasonWon"]
    		rbgl = rbg["seasonLost"]

        puts "#{event.server.name} - PvP"

		    event.respond("""**#{char.capitalize} - #{realm.capitalize} - #{region.upcase}**
**2v2 Rating:** #{arena2v2r}  **Wins:** #{arena2v2w}  **Losses:** #{arena2v2l}
**3v3 Rating:** #{arena3v3r}  **Wins:** #{arena3v3w}  **Losses:** #{arena3v3l}
**5v5 Rating:** #{arena5v5r}  **Wins:** #{arena5v5w} **Losses:** #{arena5v5l}
**RBG Rating:** #{rbgr}  **Wins:** #{rbgw}  **Losses:** #{rbgl}""")

      end
    end
  end
end