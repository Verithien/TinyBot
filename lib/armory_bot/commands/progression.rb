module ArmoryBot
  module Commands
    module Progression
      extend Discordrb::Commands::CommandContainer
      command(:prog, bucket: :armory) do |event, *realm, char, region|
        api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'
        realm = realm.join('-')
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
        mychar = prog["progression"]["raids"].find { |r| r["name"] == "Hellfire Citadel" }
        hellass = mychar["bosses"].find { |r| r["name"] == "Hellfire Assault"}
        iron = mychar["bosses"].find { |r| r["name"] == "Iron Reaver" }
        korm = mychar["bosses"].find { |r| r["name"] == "Kormrok" }
        hhc = mychar["bosses"].find { |r| r["name"] == "Hellfire High Council" }
        killrogg = mychar["bosses"].find { |r| r["name"] == "Kilrogg Deadeye" }
        gore = mychar["bosses"].find { |r| r["name"] == "Gorefiend" }
        iskar = mychar["bosses"].find { |r| r["name"] == "Shadow-Lord Iskar" }
        socrethar = mychar["bosses"].find { |r| r["name"] == "Socrethar the Eternal" }
        velhari = mychar["bosses"].find { |r| r["name"] == "Tyrant Velhari" }
        fellord = mychar["bosses"].find { |r| r["name"] == "Fel Lord Zakuun" }
        xhul = mychar["bosses"].find { |r| r["name"] == "Xhul'horac" }
        mann = mychar["bosses"].find { |r| r["name"] == "Mannoroth" }
        archi = mychar["bosses"].find { |r| r["name"] == "Archimonde" }
        event.user.pm("""**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - Hellfire Citadel Progression**
        **Hellfire Assault**
        LFR: **#{hellass["lfrKills"]}**, Normal: **#{hellass["normalKills"]}**, Heroic: **#{hellass["heroicKills"]}**, Mythic: **#{hellass["mythicKills"]}**
        **Iron Reaver**
        LFR: **#{iron["lfrKills"]}**, Normal: **#{iron["normalKills"]}**, Heroic: **#{iron["heroicKills"]}**, Mythic: **#{iron["mythicKills"]}**
        **Kormrok**
        LFR: **#{korm["lfrKills"]}**, Normal: **#{korm["normalKills"]}**, Heroic: **#{korm["heroicKills"]}**, Mythic: **#{korm["mythicKills"]}**
        **Hellfire High Council**
        LFR: **#{hhc["lfrKills"]}**, Normal: **#{hhc["normalKills"]}**, Heroic: **#{hhc["heroicKills"]}**, Mythic: **#{hhc["mythicKills"]}**
        **Killrogg Deadeye**
        LFR: **#{killrogg["lfrKills"]}**, Normal: **#{killrogg["normalKills"]}**, Heroic: **#{killrogg["heroicKills"]}**, Mythic: **#{killrogg["mythicKills"]}**
        **Gorefiend**
        LFR: **#{gore["lfrKills"]}**, Normal: **#{gore["normalKills"]}**, Heroic: **#{gore["heroicKills"]}**, Mythic: **#{gore["mythicKills"]}**
        **Shadow Lord Iskar**
        LFR: **#{iskar["lfrKills"]}**, Normal: **#{iskar["normalKills"]}**, Heroic: **#{iskar["heroicKills"]}**, Mythic: **#{iskar["mythicKills"]}**
        **Socrethar the Eternal**
        LFR: **#{socrethar["lfrKills"]}**, Normal: **#{socrethar["normalKills"]}**, Heroic: **#{socrethar["heroicKills"]}**, Mythic: **#{socrethar["mythicKills"]}**
        **Tyrant Velhari**
        LFR: **#{velhari["lfrKills"]}**, Normal: **#{velhari["normalKills"]}**, Heroic: **#{velhari["heroicKills"]}**, Mythic: **#{velhari["mythicKills"]}**
        **Fel Lord Zakuun**
        LFR: **#{fellord["lfrKills"]}**, Normal: **#{fellord["normalKills"]}**, Heroic: **#{fellord["heroicKills"]}**, Mythic: **#{fellord["mythicKills"]}**
        **Xhul'horac**
        LFR: **#{xhul["lfrKills"]}**, Normal: **#{xhul["normalKills"]}**, Heroic: **#{xhul["heroicKills"]}**, Mythic: **#{xhul["mythicKills"]}**
        **Mannoroth**
        LFR: **#{mann["lfrKills"]}**, Normal: **#{mann["normalKills"]}**, Heroic: **#{mann["heroicKills"]}**, Mythic: **#{mann["mythicKills"]}**
        **Archimonde**
        LFR: **#{archi["lfrKills"]}**, Normal: **#{archi["normalKills"]}**, Heroic: **#{archi["heroicKills"]}**, Mythic: **#{archi["mythicKills"]}**""")
      end
    end
  end
end