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

				puts 'Got Class'

				coin = [username1, username2]
				coin1 = coin.sample
				if coin1 == username1
					coin2 = username2
				else
					coin2 = username1
				end
				class1 = randoclass.sample
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

				event << """
				#{event.user.mention} initiated a fight between #{username1} and #{username2}
				**#{coin1}** rolls a **#{class1}**. **#{coin2}** rolls a **#{class2}**.
				Coin flip decided that #{coin1} will attack first

				#{coin1} casts #{attacks1.sample} on #{coin2} dealing 4 damage

				#{coin2} recovers and attacks with #{attacks2.sample} dealing 5 damage

				#{coin1} is dazed by the attack, but manages to get #{attacks1.sample} off on #{coin2}. The attack barely hits, only dealing 2 damage.

				#{coin1} tries to press his attack, however #{coin2} was prepared and hits them with #{attacks1.sample}, removing 4 health.

				#{coin2} casts #{atttacks1.sample}, but #{coin1} manages to redirect it back for 6 damage.

				#{coin2} retaliates with #{attacks2.sample}. It's a *critical hit* doing 10 damage.

				#{coin1} uses #{heals1} to recover 6 health.

				#{coin2} uses the opportunity to hit #{coin1} with #{attacks2.sample}, dealing 5 damage.

				#{coin1} *critical hits* with #{attacks1.sample}, dealing 8 damage.



				#{coin1} has defeated #{coin2} in a duel with #{hp1} health left."""
		

			end
		end
	end
end
