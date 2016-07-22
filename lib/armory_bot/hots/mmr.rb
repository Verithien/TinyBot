module ArmoryBot
  module Commands
    module MMR
      extend Discordrb::Commands::CommandContainer
      command(:mmr, bucket: :hots, min_args: 2, rate_limit_message: 'Respawning: Wait %time% more seconds.') do |event, *account, region|

          puts "Command Entered"

          region = region.upcase

          region_num = {
            "US" => 1, "EU" => 2, "KR" => 3,       
            "CN" => 5
          }

          acc = account.first
          acc = acc.split('#')
          acc = acc.join('_')

          data = HTTParty.get("https://api.hotslogs.com/Public/Players/#{region_num[region]}/#{acc}", :verify => false ).parsed_response
          data1 = data["LeaderboardRankings"]

          puts "#{data}"

          quick_match = data1.find { |r| r["GameMode"] == "QuickMatch" }
          hero_league = data1.find { |r| r["GameMode"] == "HeroLeague" }
          team_league = data1.find { |r| r["GameMode"] == "TeamLeague" }

          puts "#{quick_match}"
          puts "#{hero_league}"
          puts "#{team_league}"

        if hero_league.empty? && team_league.empty? && quick_match.empty?
          event << "No matchmaking information found for this Account"
        elsif team_league.empty? && hero_league.empty?
          if quick_match["CurrentMMR"] >= 2918
            qmmmr = "Master"
          elsif quick_match["CurrentMMR"] >= 2422
            qmmmr = "Diamond"
          elsif quick_match["CurrentMMR"] >= 2067
            qmmmr = "Platinum"
          elsif quick_match["CurrentMMR"] >= 1818
            qmmmr = "Gold"
          elsif quick_match["CurrentMMR"] >= 1565
            qmmmr = "Silver"
          else 
            qmmmr = "Bronze"
          end
        elsif hero_league.empty? && quick_match.empty?
          if team_league["CurrentMMR"] >= 3106
            tlmmr = "Master"
          elsif team_league["CurrentMMR"] >= 2626
            tlmmr = "Diamond"
          elsif team_league["CurrentMMR"] >= 2245
            tlmmr = "Platinum"
          elsif team_league["CurrentMMR"] >= 1967
            tlmmr = "Gold"
          elsif team_league["CurrentMMR"] >= 1695
            tlmmr = "Silver"
          else 
            tlmmr = "Bronze"
          end
        elsif team_league.empty? && quick_match.empty?
          if hero_league["CurrentMMR"] >= 3095
            hlmmr = "Master"
          elsif hero_league["CurrentMMR"] >= 2537
            hlmmr = "Diamond"
          elsif hero_league["CurrentMMR"] >= 2114
            hlmmr = "Platinum"
          elsif hero_league["CurrentMMR"] >= 1820
            hlmmr = "Gold"
          elsif hero_league["CurrentMMR"] >= 1527
            hlmmr = "Silver"
          else 
            hlmmr = "Bronze"
          end
        elsif team_league.empty?
          if quick_match["CurrentMMR"] >= 2918
            qmmmr = "Master"
          elsif quick_match["CurrentMMR"] >= 2422
            qmmmr = "Diamond"
          elsif quick_match["CurrentMMR"] >= 2067
            qmmmr = "Platinum"
          elsif quick_match["CurrentMMR"] >= 1818
            qmmmr = "Gold"
          elsif quick_match["CurrentMMR"] >= 1565
            qmmmr = "Silver"
          else 
            qmmmr = "Bronze"
          end

          if hero_league["CurrentMMR"] >= 3095
            hlmmr = "Master"
          elsif hero_league["CurrentMMR"] >= 2537
            hlmmr = "Diamond"
          elsif hero_league["CurrentMMR"] >= 2114
            hlmmr = "Platinum"
          elsif hero_league["CurrentMMR"] >= 1820
            hlmmr = "Gold"
          elsif hero_league["CurrentMMR"] >= 1527
            hlmmr = "Silver"
          else 
            hlmmr = "Bronze"
          end
        elsif hero_league.empty? 
          if quick_match["CurrentMMR"] >= 2918
            qmmmr = "Master"
          elsif quick_match["CurrentMMR"] >= 2422
            qmmmr = "Diamond"
          elsif quick_match["CurrentMMR"] >= 2067
            qmmmr = "Platinum"
          elsif quick_match["CurrentMMR"] >= 1818
            qmmmr = "Gold"
          elsif quick_match["CurrentMMR"] >= 1565
            qmmmr = "Silver"
          else 
            qmmmr = "Bronze"
          end

          if team_league["CurrentMMR"] >= 3106
            tlmmr = "Master"
          elsif team_league["CurrentMMR"] >= 2626
            tlmmr = "Diamond"
          elsif team_league["CurrentMMR"] >= 2245
            tlmmr = "Platinum"
          elsif team_league["CurrentMMR"] >= 1967
            tlmmr = "Gold"
          elsif team_league["CurrentMMR"] >= 1695
            tlmmr = "Silver"
          else 
            tlmmr = "Bronze"
          end
        else            
          if quick_match["CurrentMMR"] >= 2918
            qmmmr = "Master"
          elsif quick_match["CurrentMMR"] >= 2422
            qmmmr = "Diamond"
          elsif quick_match["CurrentMMR"] >= 2067
            qmmmr = "Platinum"
          elsif quick_match["CurrentMMR"] >= 1818
            qmmmr = "Gold"
          elsif quick_match["CurrentMMR"] >= 1565
            qmmmr = "Silver"
          else 
            qmmmr = "Bronze"
          end

          if hero_league["CurrentMMR"] >= 3095
            hlmmr = "Master"
          elsif hero_league["CurrentMMR"] >= 2537
            hlmmr = "Diamond"
          elsif hero_league["CurrentMMR"] >= 2114
            hlmmr = "Platinum"
          elsif hero_league["CurrentMMR"] >= 1820
            hlmmr = "Gold"
          elsif hero_league["CurrentMMR"] >= 1527
            hlmmr = "Silver"
          else 
            hlmmr = "Bronze"
          end

          if team_league["CurrentMMR"] >= 3106
            tlmmr = "Master"
          elsif team_league["CurrentMMR"] >= 2626
            tlmmr = "Diamond"
          elsif team_league["CurrentMMR"] >= 2245
            tlmmr = "Platinum"
          elsif team_league["CurrentMMR"] >= 1967
            tlmmr = "Gold"
          elsif team_league["CurrentMMR"] >= 1695
            tlmmr = "Silver"
          else 
            tlmmr = "Bronze"
          end
        end

          puts "#{tlmmr} #{hlmrr} #{qmmmr}"

          puts "Almost done"

          if data1.length == 0
            event << "No matches found for this account"
          elsif data1[0] == "GameMode" && data1[1] == "GameMode"  && data1[2] == "GameMode" 
            event.respond """#{account} - MMR
```Ruby
Quick Match: #{qmmmr} - #{quick_match["CurrentMMR"]}
Hero League: #{hlmmr} - #{hero_league["CurrentMMR"]}
Team League: #{tlmmr} - #{team_league["CurrentMMR"]}
```"""
          elsif data1[0] == "GameMode"  && data1[1] == "GameMode"
            event.respond """#{account} - MMR
```Ruby
Quick Match: #{qmmmr} - #{quick_match["CurrentMMR"]}
Hero League: #{hlmmr} - #{quick_match["CurrentMMR"]}
```"""
          elsif data1[0] == "GameMode"
          event.respond """#{account} - MMR
```Ruby
Quick Match: #{qmmmr} - #{quick_match["CurrentMMR"]}
```"""
          else
          nil
        end 

        puts "FINISHED!"

      end
    end
  end
end