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

        if arena2v2r == 0
          def pad2( random )
              "     " + random
          end
        elsif arena2v2r.length == 2
          def pad2( random )
              "    " + random
          end
        elsif arena2v2r.length = 3
          def pad2( random )
              "   " + random
          end
        else
          def pad2( random )
              "  " + random
          end
        end

        if arena3v3r == 0
          def pad3( random )
              "     " + random
          end
        elsif arena3v3r.length == 2
          def pad3( random )
              "    " + random
          end
        elsif arena3v3r.length = 3
          def pad3( random )
              "   " + random
          end
        else
          def pad3( random )
              "  " + random
          end
        end

        if arena5v5r == 0
          def pad5( random )
              "     " + random
          end
        elsif arena5v5r.length == 2
          def pad5( random )
              "    " + random
          end
        elsif arena5v5r.length = 3
          def pad5( random )
              "   " + random
          end
        else
          def pad5( random )
              "  " + random
          end
        end

        if rbgr == 0
          def padr( random )
              "     " + random
          end
        elsif rbgr.length == 2
          def padr( random )
              "    " + random
          end
        elsif rbgr.length = 3
          def padr( random )
              "   " + random
          end
        else
          def padr( random )
              "  " + random
          end
        end

        2v2wr = ((arena2v2w / ( arena2v2w + arena2v2l )) * 100).round(2)
        3v3wr = ((arena3v3w / ( arena3v3w + arena3v3l )) * 100).round(2)
        5v5wr = ((arena5v5w / ( arena5v5w + arena5v5l )) * 100).round(2)
        rbgwr = ((rbgw / ( rbgw + rbgl )) * 100).round(2)

        puts "#{event.server.name} - PvP"

		    event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase}) | PvP Stats**
```Ruby
Type | Rating | Win %
2v2  | #{pad2(arena2v2r)} | #{2v2wr}
3v3  | #{pad3(arena3v3r)} | #{3v3wr}
5v5  | #{pad5(arena5v5r)} | #{5v5wr}
RBG  | #{padr(rbgr)} | #{rbgwr}"""

      end
    end
  end
end