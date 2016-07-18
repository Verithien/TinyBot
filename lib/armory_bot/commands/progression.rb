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
        
        if korm["mythicKills"] >= 1
        event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase}) | Mythic Progression**
`#{assault["mythicKills"]}` | `Hellfire Assault`
`#{iron["mythicKills"]}` | `Iron Reaver`
`#{korm["mythicKills"]}` | `Kormrok`
`#{hellfire_council["mythicKills"]}` | `Hellfire High Council`
`#{killrogg["mythicKills"]}` | `Kilrogg Deadeye`
`#{gore["mythicKills"]}` | `Gorefiend`
`#{iskar["mythicKills"]}` | `Shadow Lord Iskar`
`#{socrethar["mythicKills"]}` | `Socrethar the Eternal`
`#{velhari["mythicKills"]}` | `Tyrant Velhari`
`#{fellord["mythicKills"]}` | `Fel Lord Zakuun`
`#{xhul["mythicKills"]}` | `Xhulhorac`
`#{mann["mythicKills"]}` | `Mannoroth`
`#{archi["mythicKills"]}` | `Archimonde`
```"""
            elsif korm["heroicKills"] >= 1
                        event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase}) | Heroic Progression**
`#{assault["heroicKills"]}` | `Hellfire Assault`
`#{iron["heroicKills"]}` | `Iron Reaver`
`#{korm["heroicKills"]}` | `Kormrok`
`#{hellfire_council["heroicKills"]}` | `Hellfire High Council`
`#{killrogg["heroicKills"]}` | `Kilrogg Deadeye`
`#{gore["heroicKills"]}` | `Gorefiend`
`#{iskar["heroicKills"]}` | `Shadow Lord Iskar`
`#{socrethar["heroicKills"]}` | `Socrethar the Eternal`
`#{velhari["heroicKills"]}` | `Tyrant Velhari`
`#{fellord["heroicKills"]}` | `Fel Lord Zakuun`
`#{xhul["heroicKills"]}` | `Xhulhorac`
`#{mann["heroicKills"]}` | `Mannoroth`
`#{archi["heroicKills"]}` | `Archimonde`
```"""
            else
                        event.respond """**#{char.capitalize} - #{realm.capitalize}(#{region.upcase}) | Normal Progression**
`#{assault["normalKills"]}` | `Hellfire Assault`
`#{iron["normalKills"]}` | `Iron Reaver`
`#{korm["normalKills"]}` | `Kormrok`
`#{hellfire_council["normalKills"]}` | `Hellfire High Council`
`#{killrogg["normalKills"]}` | `Kilrogg Deadeye`
`#{gore["normalKills"]}` | `Gorefiend`
`#{iskar["normalKills"]}` | `Shadow Lord Iskar`
`#{socrethar["normalKills"]}` | `Socrethar the Eternal`
`#{velhari["normalKills"]}` | `Tyrant Velhari`
`#{fellord["normalKills"]}` | `Fel Lord Zakuun`
`#{xhul["normalKills"]}` | `Xhulhorac`
`#{mann["normalKills"]}` | `Mannoroth`
`#{archi["normalKills"]}` | `Archimonde`
```"""
end

     end
    end
  end
end