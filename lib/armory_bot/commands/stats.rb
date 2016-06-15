module ArmoryBot
  module Commands
    module Stats
      extend Discordrb::Commands::CommandContainer
     command(:stats, bucket: :armory) do |event, *realm, char, region|

        realm = realm.join('-')

        api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'

        statsus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=stats&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
        talentsus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=talents&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
        
        statseu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=stats&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
        talentseu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=talents&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response

        if region == "us"
          data = statsus
        elsif region == "eu"
          data = statseu
        else
          event.respond "Sorry #{event.user.name}, please insert your region US or EU(?help for more info)"
        end

        if region == "us"
          data1 = talentsus
        elsif region == "eu"
          data1 = talentseu
        else
          event.respond "Sorry #{event.user.name}, please insert your region US or EU(?help for more info)"
        end

        cclass = {
                  "Z" => "Warrior", "b" => "Paladin", "Y" => "Hunter",       
                  "c" => "Rogue", "X" => "Priest", "d" => "Death Knight",
                  "W" => "Shaman", "e" => "Mage", "V" => "Warlock",
                  "f" => "Monk", "U" => "Druid"
                }

        specs = data1["talents"].find { |r| r["selected"] == true }
        spec = specs["spec"]["name"]

        armor = data["stats"]["armor"]
        armor103 = armor + 5234.0
        armor100 = armor + 3610.0
        armora = armor / armor103
        armorb = armor / armor100
        armordr103 = armora * 100
        armordr100 = armorb * 100
        
        puts "#{event.server.name} - STATS BITCH"

        cchar = cclass[data["calcClass"]]
       
    if spec == "Blood"
        event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Strength:** #{data["stats"]["str"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Reduction:** #{data["stats"]["versatilityDamageTakenBonus"].round(2)}%
        **Armor:** #{data["stats"]["armor"]}     **Armor DR:** NPC lvl 103: #{armordr103.round(2)}%  /  lvl 100: #{armordr100.round(2)}%
        **Dodge:** #{data["stats"]["dodge"].round(2)}%     **Parry:** #{data["stats"]["parry"].round(2)}%
        """
    elsif spec == "Protection"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Strength:** #{data["stats"]["str"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Reduction:** #{data["stats"]["versatilityDamageTakenBonus"].round(2)}%
        **Armor:** #{data["stats"]["armor"]}     **Armor DR:** NPC lvl 103: #{armordr103.round(2)}%  /  lvl 100: #{armordr100.round(2)}%
        **Dodge:** #{data["stats"]["dodge"].round(2)}%     **Parry:** #{data["stats"]["parry"].round(2)}%     **Block:** #{data["stats"]["block"].round(2)}%
        """
    elsif spec == "Brewmaster" or spec == "Guardian"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Agility:** #{data["stats"]["agi"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Reduction:** #{data["stats"]["versatilityDamageTakenBonus"].round(2)}%
        **Armor:** #{data["stats"]["armor"]}     **Armor DR:** NPC lvl 103: #{armordr103.round(2)}%  /  lvl 100: #{armordr100.round(2)}%
        **Dodge:** #{data["stats"]["dodge"].round(2)}%     **Parry:** #{data["stats"]["parry"].round(2)}%
        """
  elsif spec == "Holy" or spec == "Discipline" or spec == "Mistweaver" or spec == "Restoration"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Intellect:** #{data["stats"]["int"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Healing Increase:** #{data["stats"]["versatilityHealingDoneBonus"].round(2)}%
        **Spirit:** #{data["stats"]["spr"]}     **Combat Regen:** #{data["stats"]["mana5Combat"]} mp5
        """
    elsif cchar == "Death Knight" or cchar == "Paladin" or cchar == "Warrior"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Strength:** #{data["stats"]["str"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Increase:** #{data["stats"]["versatilityDamageDoneBonus"].round(2)}%
        """   
    elsif cchar == "Hunter" or cchar == "Monk" or cchar == "Rogue" or spec == "Feral" or spec =="Enhancement"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Strength:** #{data["stats"]["str"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Increase:** #{data["stats"]["versatilityDamageDoneBonus"].round(2)}%
        """   
  elsif spec == "Shadow" or spec == "Balance" or cchar == "Mage" or spec == "Elemental" or cchar == "Warlock"
      event.user.pm """**#{char.capitalize} - #{realm.capitalize} - #{region.upcase} - #{spec} #{cchar}**
        **Health:** #{data["stats"]["health"]}
        **Intellect:** #{data["stats"]["int"]}     **Stamina:** #{data["stats"]["sta"]}
        **Crit Rating:** #{data["stats"]["critRating"]}     **Crit:** #{data["stats"]["crit"].round(2)}%
        **Haste Rating:** #{data["stats"]["hasteRating"]}     **Haste:** #{data["stats"]["haste"].round(2)}%
        **Mastery Rating:** #{data["stats"]["masteryRating"]}     **Mastery:** #{data["stats"]["mastery"].round(2)}%
        **Multistrike Rating:** #{data["stats"]["multistrikeRating"]}     **Multistrike:** #{data["stats"]["multistrike"].round(2)}%
        **Versatility Rating:** #{data["stats"]["versatility"]}     **Versatility Damage Increase:** #{data["stats"]["versatilityDamageDoneBonus"].round(2)}%
        """   
    else
      event.user.pm "No info found"
    end

    puts "STATS COMPLETE"
      end
    end
  end
end