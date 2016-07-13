module ArmoryBot
  module Commands
    module Summary
      extend Discordrb::Commands::CommandContainer
      command(:char, bucket: :armory, min_args: 3) do |event, *realm, char, region|

          api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'

          cclass = {
            1 => "Warrior", 2 => "Paladin", 3 => "Hunter",       
            4 => "Rogue", 5 => "Priest", 6 => "Death Knight",
            7 => "Shaman", 8 => "Mage", 9 => "Warlock",
            10 => "Monk", 11 => "Druid"
          }

          crace = {
            1 => "Human", 2 => "Orc", 3 => "Dwarf",
            4 => "Night Elf", 5 => "Undead", 6 => "Tauren",
            7 => "Gnome", 8 => "Troll", 9 => "Goblin",
            10 => "Blood Elf", 11 => "Draenei", 22 => "Worgen",
            24 => "Pandaren", 25 => "Pandaren", 26 => "Pandaren"  
          }

          realm = realm.join('-')
          region = region.downcase

          puts '#{event.server.name} - CMD: Character search'
          dataus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=appearance&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
          data2us = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=guild&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
          data3us = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
          data4us = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=pets&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
          dataeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=appearance&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
          data2eu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=guild&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
          data3eu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=mounts&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
          data4eu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=pets&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
              
          if region == "us"
            data = dataus
            data2 = data2us
            data3 = data3us
            data4 = data4us
            armory = "<http://us.battle.net/wow/en/character/#{realm}/#{URI.escape(char)}/advanced>"
          elsif region == "eu"
            data = dataeu
            data2 = data2eu
            data3 = data3eu
            data4 = data4eu
            armory = "<http://eu.battle.net/wow/en/character/#{realm}/#{URI.escape(char)}/advanced>"
          else
            nil
          end

          charclass = cclass[data["class"]]
          charrace = crace[data["race"]]

          if data2["guild"] == nil
            event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase})**
#{data["level"]} | #{charrace} | #{charclass}
#{armory}

Achievement Points: `#{data["achievementPoints"]}`
Mounts: `#{data3["mounts"]["numCollected"]}`
Battle Pets: `#{data4["pets"]["numCollected"]}`"""
          else
            event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase}) | <#{data2["guild"]["name"]}>**
#{data["level"]} | #{charrace} | #{charclass}
#{armory}

Achievement Points: `#{data["achievementPoints"]}`
Mounts: `#{data3["mounts"]["numCollected"]}`
Battle Pets: `#{data4["pets"]["numCollected"]}`"""
        end
      end
    end
  end
end