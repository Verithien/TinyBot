module ArmoryBot
  module Commands
    module Bastion
      extend Discordrb::Commands::CommandContainer
      command(:bastion, bucket: :armory, min_args: 3) do |event, *account, region, platform|
        break unless event.user.id == 100311929821626368

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

        data = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region}/#{acc}/hero/Bastion/", :verify => false ).parsed_response

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        recon = data["ReconKills"]
        sentry = data["SentryKills"]
        tank = data["TankKills"]
        sentrym = data["SentryKills-MostinGame"]
        reconm = data["ReconKills-MostinGame"]
        tankm = data["TankKills-MostinGame"]
        sentryavg = data["SentryKills-Average"]
        reconavg = data["ReconKills-Average"]
        tankavg = data["TankKills-Average"]
        elims = data["Eliminations"]
        kbs = data["FinalBlows"]
        dmg = data["DamageDone"]
        wacc = data["WeaponAccuracy"]
        waccm = data["WeaponAccuracy-BestinGame"]
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

          event.respond """#{event.user.mention} - #{name.capitalize} - Bastion
```ruby
- Hero Specific -
Recon Kills: #{recon} | Most in Game: #{reconm} | Average: #{reconavg}
Sentry Kills: #{sentry} | Most in Game: #{sentrym} | Average: #{sentryavg}
Tank Kills: #{tank} | Most in Game: #{tankm} | Average: #{tankavg}

- Total Stats -
Eliminations: #{elims} | Damage Done: #{dmg} | Deaths: #{deaths}
Objective Kills: #{objk} | Objective Time: #{objt} | Solo Kills: #{solokill}

- Average Stats -
Eliminations: #{elimsavg} | Damage Done: #{dmgavg} | Deaths: #{deathsavg}
Objective Kills: #{objkavg} | Objective Time: #{objtavg} | Solo Kills: #{solokillavg}

- Game -
Time Played: #{playedt} | Games Won: #{gwon} | Win Percentage: #{winperc}
Gold: #{gmedals} | Silver: #{smedals} | Bronze: #{bmedals} | Cards: #{cards}
```"""

      end
    end
  end
end