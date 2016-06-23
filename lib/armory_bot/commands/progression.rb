module ArmoryBot
  module Commands
    module Progression
      extend Discordrb::Commands::CommandContainer
      command(:prog, bucket: :armory) do |event, *realm, char, region|

        api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'

        realm = realm.join('-')

        region = region.downcase

        puts "PROGRESSION SEARCH"

        progus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=progression&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
        progeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=progression&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
        
        if region == "us"
          prog = progus
        elsif region == "eu"
          prog = progeu
        else
          event.respond "Sorry #{event.user.name}, please insert the region US or EU(?help for more info)"
        end

        puts "#{event.server.name} - Char Prog"
        
        mychar = prog["progression"]["raids"].find { |r| r["name"] == "Hellfire Citadel" }
        assault = mychar["bosses"].find { |r| r["name"] == "Hellfire Assault"}
        iron = mychar["bosses"].find { |r| r["name"] == "Iron Reaver" }
        korm = mychar["bosses"].find { |r| r["name"] == "Kormrok" }
        hellfire_council = mychar["bosses"].find { |r| r["name"] == "Hellfire High Council" }
        killrogg = mychar["bosses"].find { |r| r["name"] == "Kilrogg Deadeye" }
        gore = mychar["bosses"].find { |r| r["name"] == "Gorefiend" }
        iskar = mychar["bosses"].find { |r| r["name"] == "Shadow-Lord Iskar" }
        socrethar = mychar["bosses"].find { |r| r["name"] == "Socrethar the Eternal" }
        velhari = mychar["bosses"].find { |r| r["name"] == "Tyrant Velhari" }
        fellord = mychar["bosses"].find { |r| r["name"] == "Fel Lord Zakuun" }
        xhul = mychar["bosses"].find { |r| r["name"] == "Xhul'horac" }
        mann = mychar["bosses"].find { |r| r["name"] == "Mannoroth" }
        archi = mychar["bosses"].find { |r| r["name"] == "Archimonde" }
        
        if assault["mythicKills"] >= 1
        event.respond """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - Hellfire Citadel Progression**
```ruby
Hellfire Assault
Heroic: #{assault["heroicKills"]} | Mythic: #{assault["mythicKills"]}
Iron Reaver
Heroic: #{iron["heroicKills"]} | Mythic: #{iron["mythicKills"]}
Kormrok
Heroic: #{korm["heroicKills"]} | Mythic: #{korm["mythicKills"]}
Hellfire High Council
Heroic: #{hellfire_council["heroicKills"]} | Mythic: #{hellfire_council["mythicKills"]}
Killrogg Deadeye
Heroic: #{killrogg["heroicKills"]} | Mythic: #{killrogg["mythicKills"]}
Gorefiend
Heroic: #{gore["heroicKills"]} | Mythic: #{gore["mythicKills"]}
Shadow Lord Iskar
Heroic: #{iskar["heroicKills"]} | Mythic: #{iskar["mythicKills"]}
Socrethar the Eternal
Heroic: #{socrethar["heroicKills"]} | Mythic: #{socrethar["mythicKills"]}
Tyrant Velhari
Heroic: #{velhari["heroicKills"]} | Mythic: #{velhari["mythicKills"]}
Fel Lord Zakuun
Heroic: #{fellord["heroicKills"]} | Mythic: #{fellord["mythicKills"]}
Xhulhorac
Heroic: #{xhul["heroicKills"]} | Mythic: #{xhul["mythicKills"]}
Mannoroth
Heroic: #{mann["heroicKills"]} | Mythic: #{mann["mythicKills"]}
Archimonde
Heroic: #{archi["heroicKills"]} | Mythic: #{archi["mythicKills"]}
```"""
            elsif assault["heroicKills"] >= 1
                        event.respond """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - Hellfire Citadel Progression**
```ruby
Hellfire Assault
Normal: #{assault["normalKills"]} | Heroic: #{assault["heroicKills"]}
Iron Reaver
Normal: #{iron["normalKills"]} | Heroic: #{iron["heroicKills"]}
Kormrok
Normal: #{korm["normalKills"]} | Heroic: #{korm["heroicKills"]}
Hellfire High Council
Normal: #{hellfire_council["normalKills"]} | Heroic: #{hellfire_council["heroicKills"]}
Killrogg Deadeye
Normal: #{killrogg["normalKills"]} | Heroic: #{killrogg["heroicKills"]}
Gorefiend
Normal: #{gore["normalKills"]} | Heroic: #{gore["heroicKills"]}
Shadow Lord Iskar
Normal: #{iskar["normalKills"]} | Heroic: #{iskar["heroicKills"]}
Socrethar the Eternal
Normal: #{socrethar["normalKills"]} | Heroic: #{socrethar["heroicKills"]}
Tyrant Velhari
Normal: #{velhari["normalKills"]} | Heroic: #{velhari["heroicKills"]}
Fel Lord Zakuun
Normal: #{fellord["normalKills"]} | Heroic: #{fellord["heroicKills"]} 
Xhulhorac
Normal: #{xhul["normalKills"]} | Heroic: #{xhul["heroicKills"]}
Mannoroth
Normal: #{mann["normalKills"]} | Heroic: #{mann["heroicKills"]}
Archimonde
Normal: #{archi["normalKills"]} | Heroic: #{archi["heroicKills"]}
```"""
            else
                        event.respond """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - Hellfire Citadel Progression**
```ruby
Hellfire Assault
LFR: #{assault["lfrKills"]} | Normal: #{assault["normalKills"]}
Iron Reaver
LFR: #{iron["lfrKills"]} | Normal: #{iron["normalKills"]}
Kormrok
LFR: #{korm["lfrKills"]} | Normal: #{korm["normalKills"]}
Hellfire High Council
LFR: #{hellfire_council["lfrKills"]} |Normal: #{hellfire_council["normalKills"]}
Killrogg Deadeye
LFR: #{killrogg["lfrKills"]} | Normal: #{killrogg["normalKills"]}
Gorefiend
LFR: #{gore["lfrKills"]} | Normal: #{gore["normalKills"]}
Shadow Lord Iskar
LFR: #{iskar["lfrKills"]} | Normal: #{iskar["normalKills"]}
Socrethar the Eternal
LFR: #{socrethar["lfrKills"]} | Normal: #{socrethar["normalKills"]}
Tyrant Velhari
LFR: #{velhari["lfrKills"]} | Normal: #{velhari["normalKills"]}
Fel Lord Zakuun
LFR: #{fellord["lfrKills"]} | Normal: #{fellord["normalKills"]}
Xhulhorac
LFR: #{xhul["lfrKills"]} | Normal: #{xhul["normalKills"]}
Mannoroth
LFR: #{mann["lfrKills"]} | Normal: #{mann["normalKills"]}
Archimonde
LFR: #{archi["lfrKills"]} | Normal: #{archi["normalKills"]}
```"""
end

     end
    end
  end
end