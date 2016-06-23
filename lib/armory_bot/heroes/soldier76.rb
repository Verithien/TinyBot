module ArmoryBot
  module Commands
    module Soldier76
      extend Discordrb::Commands::CommandContainer
      command([:soldier76, :Soldier76, :SOLDIER76], bucket: :overwatch, min_args: 3, rate_limit_message: 'All heroes share a rate limit. Wait %time% more seconds.') do |event, *account, region, platform|

        platform = platform.downcase

        acc = account.join(' ')

        if platform == "pc"
          acc = acc.split('#')
          acc = acc.join('-')
        elsif platform == "xbl"
          acc = acc.split(' ')
          acc = acc.join('%20')
        else
          acc = acc.downcase
        end

        if platform == "pc" && region == "us"
          region = "us"
        elsif platform == "pc" && region =="eu"
          region = "eu"
        elsif platform == "psn" || "xbl"
          region = "global"
        else
          nil
        end

        data = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region}/#{acc}/hero/Soldier76/", :verify => false ).parsed_response

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        rockets = data["HelixRocketsKills"]
        rockets_most = data["HelixRocketsKills-MostinGame"]
        rockets_average = data["HelixRocketsKills-Average"]
        visor = data["TacticalVisorKills"]
        visor_average = data["TacticalVisorKills-Average"]
        visor_most = data["TacticalVisorKills-MostinGame"]
        biotic = data["BioticFieldsDeployed"]
        biotic_healing = data["BioticFieldHealingDone"]

        elims = data["Eliminations"]
        objk = data["ObjectiveKills"]
        objt = data["ObjectiveTime"]
        dmg = data["DamageDone"]
        wacc = data["WeaponAccuracy"]
        ksm = data["KillStreak-Best"]
        dmgm = data["DamageDone-MostinGame"]
        elimsm = data["Eliminations-MostinGame"]
        objkm = data["ObjectiveKills-MostinGame"]
        objtm = data["ObjectiveTime-MostinGame"]
        deathsavg = data["Deaths-Average"]
        objtavg = data["ObjectiveTime-Average"]
        objkavg = data["ObjectiveKills-Average"]
        elimsavg = data["Eliminations-Average"]
        solokill = data["SoloKills"]
        solokillavg = data["SoloKills-Average"]
        dmgavg = data["DamageDone-Average"]
        deaths = data["Deaths"]
        bmedals = data["Medals-Bronze"]
        smedals = data["Medals-Silver"]
        gmedals = data["Medals-Gold"]
        playedt = data["TimePlayed"]
        gplayed = data["GamesPlayed"]
        gwon = data["GamesWon"]
        winperc = data["WinPercentage"]
        cards = data["Cards"]

        if data["statusCode"] == 500
          event << "Sorry, you inputted everything correctly, just seems to be an error while retrieving your account. :( "
        elsif data["statusCode"] == 404
          event << "Sorry, no account was found with that name."
        else
          event.respond """#{event.user.mention} - #{name.capitalize} - Soldier: 76
```ruby
- Hero Specific -
Helix Rocket Kills: #{rockets} | Most in Game: #{rockets_most} | Average: #{rockets_average}
Visor Kills: #{visor} | Most in Game: #{visor_most} | Average: #{visor_average}
Biotic Fields: #{biotic} | Biotic Field Healing: #{biotic_healing}

- Total Stats -
Eliminations: #{elims} | Damage Done: #{dmg} | Deaths: #{deaths}
Objective Kills: #{objk} | Best Killstreak: #{ksm} | Solo Kills: #{solokill}

- Average Stats -
Eliminations: #{elimsavg} | Damage Done: #{dmgavg} | Deaths: #{deathsavg}
Objective Kills: #{objkavg} | Objective Time: #{objtavg} | Solo Kills: #{solokillavg}

- Game -
Time Played: #{playedt} | Games Won: #{gwon} | Win Percentage: #{winperc}
Gold: #{gmedals} | Silver: #{smedals} | Bronze: #{bmedals} | Cards: #{cards}
```"""
        end
        puts "#{event.server.name} - Soldier76"
      end
    end
  end
end