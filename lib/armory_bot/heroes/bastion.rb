module ArmoryBot
  module Commands
    module Bastion
      extend Discordrb::Commands::CommandContainer
      command(:bastion, bucket: :armory, min_args: 3) do |event, *account, region, platform|

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

        data = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region}/#{acc}/hero/bastion/", :verify => false ).parsed_response

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        recon = data[0]["ReconKills"]
        sentry = data[1]["SentryKills"]
        sentrym = data[2]["SentryKills-MostinGame"]
        reconm = data[3]["ReconKills-MostinGame"]
        sentryavg = data[4]["SentryKills-Average"]
        reconavg = data[5]["ReconKills-Average"]
        elims = data[6]["Eliminations"]
        kbs = data[7]["FinalBlows"]
        dmg = data[12]["DamageDone"]
        wacc = data[18]["WeaponAccuracy"]
        waccm = data[25]["WeaponAccuracy-BestinGame"]
        ksm = data[26]["KillStreak-Best"]
        dmgm = data[27]["DamageDone-MostinGame"]
        elimsm = data[29]["Eliminations-MostinGame"]
        objkm = data[31]["ObjectiveKills-MostinGame"]
        objtm = data[32]["ObjectiveTime-MostinGame"]
        deathsavg = data[38]["Deaths-Average"]
        objtavg = data[40]["ObjectiveTime-Average"]
        objkavg = data[41]["ObjectiveKills-Average"]
        elimsavg = data[44]["Eliminations-Average"]
        dmgavg = data[45]["DamageDone-Average"]
        deaths = data[46]["Deaths"]
        bmedals = data[47]["Medals-Bronze"]
        smedals = data[48]["Medals-Silver"]
        gmedals = data[49]["Medals-Gold"]
        playedt = data[51]["TimePlayed"]
        gplayed = data[52]["GamesPlayed"]
        gwon = data[53]["GamesWon"]
        winperc = data[56]["WinPercentage"]

        if data["statusCode"] == 500
          event << "Sorry, either no account was found or your account is case sensitive"
        else
          event << "**#{event.user.mention} - #{name.capitalize} - Bastion**"
          event << "**Total Stats"
          event << "**Recon Kills:** #{recon} - **Sentry Kills:** #{sentry} - **Eliminations:** #{elims}"
          event << "**Final Blows:** #{kbs} - **Damage Done:** #{dmg} - **Weapon Accuracy:** #{wacc}"
          event << "**Games Played:** #{gplayed} - **Games Won:** #{gwon} - **Win Percentage:** #{winperc}"
          event << "**Most in Game**"
          event << "**Recon Kills:** #{reconm} - **Sentry Kills:** #{sentrym} - **Eliminations:** #{elimsm}"
          event << "**Damage Done:** #{dmgm} - **Weapon Accuracy:** #{waccm} - **Kill Streaks:** #{ksm}"
          event << "**Objective Time:** #{objtm} - **Objective Kills:** #{objkm}"
          event << "Average Stats"
          event << "**Recon Kills:** #{reconavg} - **Sentry Kills:** #{sentryavg} - **Eliminations:** #{elimsavg}"
          event << "**Damage Done:** #{dmgavg} - **Deaths:** #{deathsavg} - **"
          event << "yes"
        end


        
      end
    end
  end
end