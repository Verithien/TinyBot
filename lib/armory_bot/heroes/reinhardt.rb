module ArmoryBot
  module Commands
    module Reinhardt
      extend Discordrb::Commands::CommandContainer
      command([:reinhardt, :Reinhardt, :REINHARDT], bucket: :overwatch, min_args: 3) do |event, *account, region, platform|

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

        data = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region}/#{acc}/hero/Reinhardt/", :verify => false ).parsed_response

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        blocked = data["DamageBlocked"]
        blocked_most = data["DamageBlocked-MostinGame"]
        blocked_average = data["DamageBlocked-Average"]
        charge = data["ChargeKills"]
        charge_average = data["ChargeKills-Average"]
        charge_most = data["ChargeKills-MostinGame"]
        firestrike = data["FireStrikeKills"]
        firestrike_average = data["FireStrikeKills-Average"]
        firestrike_most = data["FireStrikeKills-MostinGame"]
        shatter = data["EarthshatterKills"]
        shatter_average = data["EarthshatterKills-Average"]
        shatter_most = data["EarthshatterKills-MostinGame"]

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
          event.respond """#{event.user.mention} - #{name.capitalize} - Reinhardt
```ruby
- Hero Specific -
Charge Kills: #{charge} | Most in Game: #{charge_most} | Average: #{charge_average}
Fire Strike Kills: #{firestrike} | Most in Game: #{firestrike_most} | Average: #{firestrike_average}
Earthshatter Kills: #{shatter} | Most in Game: #{shatter_most} | Average: #{shatter_average}
Damage Blocked: #{blocked} | Most in Game: #{blocked_most} | Average: #{blocked_average}

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
        puts "#{event.server.name} - Reinhardt"
      end
    end
  end
end