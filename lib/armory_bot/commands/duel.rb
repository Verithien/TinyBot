module ArmoryBot
  module Commands
    module Duel
      extend Discordrb::Commands::CommandContainer
		command([:fight, :duel], bucket: :fight, rate_limit_message: 'Too much fighting! Wait a bit') do |event, username1, username2|
		puts 'CMD: ITS TIME TO DU DU DU DUEL'

		randoclass = ["Druid", "Warrior", "Mage", "Paladin", "Death Knight", "Demon Hunter", "Priest", "Monk", "Warlock", "Rogue", "Hunter", "Shaman"]
		Druid = ["Wrath", "Starsurge", "Starfire", "Starfall", "Moonfire", "Sunfire", "Ferocious Bite", "Rake", "Maul", "Mangle"]
		Warrior = ["Collosus Smash", "Bladestorm", "Shield Slam", "Mortal Strike", "Raging Blow", "Thunder Clap", "Execute", "Slam", "Revenge", "Heroic Throw"]
		Mage = ["Frostbolt", "Pyroblast", "Arcane Blast", "Fireball", "Arcane Missiles", "Ice Lance", "Dragons Breath", "Frostfire Bolt", "Flamestrike", "Arcane Barrage"]
		Paladin = ["Judgement", "Crusader Strike", "Avengers Shield", "Divine Storm", "Execution Sentence", "Holy Prism", "Holy Shock", "Lights Hammer", "Shield of the Righteous", "Exorcism"]
		Deathknight = ["Obliterate", "Howling Blast", "Soul Reaper", "Blood Boil", "Plague Strike", "Icy Touch", "Death Strike", "Scourge Strike", "Necrotic Plague", "Defile"]
		Demonhunter = ["Chaos Blades", "Blade Dance", "Throw Glaive", "Fel Barrage", "Chaos Strike", "Demons Bite", "Chaos Nova", "Fel Eruption", "Eye Beam", "Fel Rush"]
		Priest = ["Mind Blast", "Holy Nova", "Halo", "Cascade", "Mind Flay", "Mind Spike", "Smite", "Shadow Mend", "Divine Star", "Lights Wrath"]
		Monk = ["Crackling Jade Lightning", "Strike of the Windlord", "Tiger Palm", "Blackout Kick", "Keg Smash", "Breath of Fire", "Chi Wave", "Chi Burst", "Chi Torpedo", "Whirling Dragon Punch"]
		Warlock = ["Chaos Bolt", "Incinerate", "Unstable Affliction", "Phantom Singularity", "Demonbolt", "Hand of Guldan", "Doom", "Cataclysm", "Conflagrate", "Shadow Bolt"]
		Rogue = ["Backstab", "Mutilate", "Envenom", "Death from Above", "Eviscerate", "Shuriken Toss", "Shadowstrike", "Pistol Shot", "Saber Slash", "Ambush"]
		Hunter = ["Kill Command", "Cobra Shot", "Stampede", "Blink Strikes", "Marked Shot", "Bursting Shot", "Head Shot", "Mongoose Bite", "Raptor Strike", "Hatchet Toss"]
		Shaman = ["Flame Shock", "Lava Burst", "Icefury", "Elemental Blast", "Lightning Bolt", "Fury of Air", "Lava Lash", "Stormstrike", "Feral Lunge", "Earthen Spike"]
		druidh = ["Regrowth", "Wild Growth"]
		warriorh = ["Second Wind", "Victory Rush"]
		mageh = ["Ice Block", "Cold Snap"]
		paladinh = ["Flash of Light", "Light of Dawn"]
		dkh = ["Blood Pact", "Mark of Blood"]
		dhh = ["Soul Barrier", "Soul Rending"]
		priesth = ["Flash Heal", "Power Word: Shield"]
		monkh = ["Renewing Mist", "Vivify"]
		warlockh = ["Demon Skin", "Dark Pact"]
		rogueh = ["Leeching Poison", "Cheat Death"]
		hunterh = ["Feign Death", "Disengage"]
		shamanh = ["Healing Surge", "Riptide"]
		dmg = [ -1, -2, -3, -4, -5, -6, -7, -8, -9]
		hlg = [ 2, 4, 6, 8, 10]

		puts 'Got Class'

		break if username1 == nil

		coin = [username1, username2]
		coin1 = coin.sample
		if coin1 == username1
			coin2 = username2
		else
			coin2 = username1
		end
		hp1 = 20
		class1 = randoclass.sample
		hp2 = 20
		class2 = randoclass.sample

		if class1 == "Druid"
			attacks1 = Druid
		elsif class1 == "Warrior"
			attacks1 = Warrior
		elsif class1 == "Mage"
			attacks1 = Mage
		elsif class1 == "Paladin"
			attacks1 = Paladin
		elsif class1 == "Death Knight"
			attacks1 = Deathknight
		elsif class1 == "Demon Hunter"
			attacks1 = Demonhunter
		elsif class1 == "Priest"
			attacks1 = Priest
		elsif class1 == "Monk"
			attacks1 = Monk
		elsif class1 == "Warlock"
			attacks1 = Warlock
		elsif class1 == "Rogue"
			attacks1 = Rogue
		elsif class1 == "Hunter"
			attacks1 = Hunter
		elsif class1 == "Shaman"
			attacks1 = Shaman
		else
			nil
		end

		if class1 == "Druid"
			heals1 = druidh
		elsif class1 == "Warrior"
			heals1 = warriorh
		elsif class1 == "Mage"
			heals1 = mageh
		elsif class1 == "Paladin"
			heals1 = paladinh
		elsif class1 == "Death Knight"
			heals1 = dkh
		elsif class1 == "Demon Hunter"
			heals1 = dhh
		elsif class1 == "Priest"
			heals1 = priesth
		elsif class1 == "Monk"
			heals1 = monkh
		elsif class1 == "Warlock"
			heals1 = warlockh
		elsif class1 == "Rogue"
			heals1 = rogueh
		elsif class1 == "Hunter"
			heals1 = hunterh
		elsif class1 == "Shaman"
			heals1 = shamanh
		else
			nil
		end

		if class2 == "Druid"
			attacks2 = Druid
		elsif class2 == "Warrior"
			attacks2 = Warrior
		elsif class2 == "Mage"
			attacks2 = Mage
		elsif class2 == "Paladin"
			attacks2 = Paladin
		elsif class2 == "Death Knight"
			attacks2 = Deathknight
		elsif class2 == "Demon Hunter"
			attacks2 = Demonhunter
		elsif class2 == "Priest"
			attacks2 = Priest
		elsif class2 == "Monk"
			attacks2 = Monk
		elsif class2 == "Warlock"
			attacks2 = Warlock
		elsif class2 == "Rogue"
			attacks2 = Rogue
		elsif class2 == "Hunter"
			attacks2 = Hunter
		elsif class2 == "Shaman"
			attacks2 = Shaman
		else
			nil
		end

		if class2 == "Druid"
			heals2 = druidh
		elsif class2 == "Warrior"
			heals2 = warriorh
		elsif class2 == "Mage"
			heals2 = mageh
		elsif class2 == "Paladin"
			heals2 = paladinh
		elsif class2 == "Death Knight"
			heals2 = dkh
		elsif class2 == "Demon Hunter"
			heals2 = dhh
		elsif class2 == "Priest"
			heals2 = priesth
		elsif class2 == "Monk"
			heals2 = monkh
		elsif class2 == "Warlock"
			heals2 = warlockh
		elsif class2 == "Rogue"
			heals2 = rogueh
		elsif class2 == "Hunter"
			heals2 = hunterh
		elsif class2 == "Shaman"
			heals2 = shamanh
		else
			nil
		end

		dmg1 = dmg.sample
		dmg2 = dmg.sample
		dmg3 = dmg.sample
		dmg4 = dmg.sample
		dmg5 = dmg.sample
		dmg6 = dmg.sample
		dmg7 = dmg.sample
		dmg8 = dmg.sample
		dmg9 = dmg.sample
		dmg10 = dmg.sample
		dmg11 = dmg.sample
		dmg12 = dmg.sample
		dmg13 = dmg.sample
		dmg14 = dmg.sample
		dmg15 = dmg.sample
		dmg20 = dmg.sample
		dmg21 = dmg.sample
		dmg22 = dmg.sample
		dmg23 = dmg.sample
		hlg1 = hlg.sample
		hlg2 = hlg.sample
		hlg3 = hlg.sample
		hlg4 = hlg.sample

		puts 'start events'
			event << "#{event.user.mention} initiated a fight between #{username1} and #{username2}"
			event << "**#{coin1}** rolls a **#{class1}**. **#{coin2}** rolls a **#{class2}**."
			event << "Coin flip decided that #{coin1} will attack first"
			event << ""
			event << "#{coin1} uses **#{attacks1.sample}** against #{coin2} dealing #{dmg1.abs} damage"
			hp2 += dmg1
			event << ""
		if hp2 == 14
			event << "#{coin2} casts **#{heals2.sample}** on themself and heals for #{hlg1} health"
			hp2 += hlg1
		elsif hp2 >= 17
			event << "#{coin2} swings their weapon at #{coin1}, #{coin1} jumps away from the attack."
		else
			event << "#{coin2} kicks #{coin1} for #{dmg2.abs} damage"
			hp1 += dmg2
		end
			event << ""
		if hp1 <= 2
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg1} health"
			hp1 += hlg1
		elsif hp1 >= 17
			event << "#{coin1} consumes a **Healthstone** and heals for #{hlg3} HP."
			hp1 += hlg3
		elsif hp1 == 18
			event << "#{coin1} casts on #{coin2} with **#{attacks1.sample}**. #{coin2} absorbs the entire hit."
		else
			event << "#{coin1} casts **#{attacks1.sample}**, hitting #{coin2} for #{dmg4.abs} damage"
			hp2 += dmg4
		end
			event << ""

		if hp2 <= 2
			event << "#{coin2} heals with **#{heals2.sample}** returning #{hlg2} health"
			hp2 += hlg3
		elsif hp2 == 11
			event << "#{coin2} attacks #{coin1} with **#{attacks2.sample}**. #{coin1} blocks the attack."
		else
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**, hitting for #{dmg5.abs} damage"
			hp1 += dmg5
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0


			event << ""
		if hp1 <= 2
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg2} health"
			hp1 += hlg2
		elsif hp1 == 6
			event << "#{coin1} smacks #{coin2} with **#{attacks1.sample}**. #{coin2} dodges and counters with #{dmg4.abs}"
			hp1 += dmg4
		elsif hp1 == 7
			event << "#{coin1} drinks a health potion for #{hlg3} health"
			hp1 += hlg3
		else
			event << "#{coin1} casts **#{attacks1.sample}**, hitting #{coin2} for #{dmg6.abs} damage"
			hp2 += dmg6
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end


		break if hp1 <= 0 || hp2 <= 0


			event << ""
		if hp2 <= 2
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 10
			event << "#{coin2} attacks #{coin1} with **#{attacks2.sample}**. #{coin2} misses."
		else
			event << "#{coin2} hits #{coin1} with a **#{attacks2.sample}**, dealing #{dmg5.abs} damage"
			hp1 += dmg5
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp1 <= 2
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 >= 17
			event << "#{coin1} smacks #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		elsif hp1 == hp2
			event << "#{coin1} attacks with a **#{attacks1.sample}**, while #{coin2} retaliates with **#{attacks2.sample}**, both striking each other at the same time and losing #{dmg1.abs} health"
			hp1 += dmg1
			hp2 += dmg1
		else
			event << "#{coin1} attacks with **#{attacks1.sample}**, hitting #{coin2} for #{dmg8.abs} damage"
			hp2 += dmg8
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end	

		break if hp1 <= 0 || hp2 <= 0

			event << ""
			
		if hp2 == 2
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 8
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg11.abs} damage"
			hp1 += dmg11
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""
		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} retaliates against #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end
			
		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		elsif hp1 == hp2
			event << "#{coin1} attacks with a **#{attacks1.sample}**, while #{coin2} retaliates with **#{attacks2.sample}**, both striking each other at the same time and losing #{dmg1.abs} health"
			hp1 += dmg1
			hp2 += dmg1
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end


		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		elsif hp1 <= 6 && hp2 <= 6
			event << "#{coin2} casts **#{heals2.sample}** on themself, healing for **#{hlg3}**. #{coin1} takes the opportunity to cast **#{heals1.sample}**, returning **#{hlg4}** life."
			hp2 += hlg3
			hp1 += hlg4 
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		event << ""

		if hp1 == 5
			event << "#{coin1} uses **#{heals1.sample}** on themself and heals for #{hlg4} health"
			hp1 += hlg2
		elsif hp1 == 1
			event << "#{coin1} blasts #{coin2} with **#{attacks1.sample}**. #{coin2} attempts to counter but hits themselves in the process taking #{dmg9.abs}"
			hp2 += dmg9
		else
			event << "#{coin1} follows with **#{attacks1.sample}**, hitting #{coin2} for #{dmg12.abs} damage"
			hp2 += dmg12
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end

		break if hp1 <= 0 || hp2 <= 0

			event << ""

		if hp2 == 3
			event << "#{coin2} casts **#{heals2.sample}** and heals for #{hlg2} health"
			hp2 += hlg4
		elsif hp2 == 1
			event << "#{coin2} hits #{coin1} with **#{attacks2.sample}**. #{coin1} reflects the attack back for #{dmg8.abs}"
			hp2 += dmg8
		else
			event << "#{coin2} retaliates with **#{attacks2.sample}**, injuring #{coin1} for #{dmg13.abs} damage"
			hp1 += dmg13
		end

		if hp1 <= 0
			event << ""
			event << ""
			event << "#{coin2} has defeated #{coin1} in a duel with #{hp2} health left." 	
		elsif hp2 <= 0
			event << ""
			event << ""
			event << "#{coin1} has defeated #{coin2} in a duel with #{hp1} health left." 	
		else
			nil
		end
		end
	end
end
end
