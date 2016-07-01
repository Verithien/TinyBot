module ArmoryBot
  module Commands
    module Overwatch
      extend Discordrb::Commands::CommandContainer
        command(:overwatch, bucket: :overwatch, min_args: 3) do |event, *account, region, platform|

        platform = platform.downcase

        mode = mode.downcase

        region = region.downcase

        if platform == "pc"
          acc = account.first
          acc = acc.split('#')
          acc = acc.join('-')
        elsif platform == "xbl"
            if account.count >= 2
                acc = account.map!(&:capitalize)
                acc = acc.join('%20')
            else
                acc = account.first
            end
        else
          acc = account
        end

        if platform == "pc" && region == "us"
          region1 = "us"
        elsif platform == "pc" && region =="eu"
          region1 = "eu"
        elsif platform == "psn" || "xbl"
          region1 = "global"
        else
          nil
        end

        pc = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{region}/#{acc}", :verify => false ).parsed_response
        console = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{acc}", :verify => false ).parsed_response
        stats1 = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region1}/#{acc}/quick-play/allHeroes/", :verify => false ).parsed_response
        stats2 = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region1}/#{acc}/competitive-play/allHeroes/", :verify => false ).parsed_response
        profile1 = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region1}/#{acc}/quick-play/profile", :verify => false).parsed_response
        profile2 = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region1}/#{acc}/competitive-play/profile", :verify => false).parsed_response

        if platform == "pc"
          page = pc
        elsif platform == "xbl" || "psn"
          page = console
        else
          nil
        end

        parse_page = Nokogiri::HTML(page)

        hero_name = []
        hero_stats = []
        no_acc = []

        puts "#{event.server.name} - So far so good"

        heroname = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.title')
        herostats = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.description')
        noacc = parse_page.css('.undefined').css('.page-wrapper').css('.row').css('.u-align-center')
        averagestats = parse_page.css('.bg-crystal-dark').css('.content-box').css('.row').css('.row').css('.card-heading')

        heroname.map do |a|
          post_name = a.text
          hero_name.push(post_name)
        end

        herostats.map do |a|
          post_name = a.text
          hero_stats.push(post_name)
        end

        herostats.map do |a|
          post_name = a.text
          hero_stats.push(post_name)
        end

        noacc.map do |a|
          post_name = a.text
          no_acc.push(post_name)
        end

        one = hero_name[21]
        two = hero_name[22]
        three = hero_name[23]

        win_one = hero_stats[21]
        win_two = hero_stats[22]
        win_three = hero_stats[23]

        top_one = hero_name[0]
        top_two = hero_name[1]
        top_three = hero_name[2]

        time_one = hero_stats[0]
        time_two = hero_stats[1]
        time_three = hero_stats[2]

        page_not_found = no_acc[0]

        if platform == "pc"
          name = acc
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        if page_not_found == "Page Not Found"
          event << "Sorry, either no account was found or your account is case sensitive"
        elsif profile["statusCode"] == 500
          event << "Sorry, you inputted everything correctly, just seems to be an error while retrieving your account. :( "
        elsif profile["statusCode"] == 404
          event << "Sorry, no account was found with that name."
        else
          event.respond"""#{event.user.mention}
```ruby
#{name.capitalize} - Level #{profile["data"]["level"]}
Games Won: #{profile["data"]["games"]["wins"]} | Lost: #{profile["data"]["games"]["lost"]} | Win Percentage #{profile["data"]["games"]["win_percentage"]}%
1: #{one} - #{win_one} | 1: #{top_one} - #{time_one}
2: #{two} - #{win_two} | 2: #{top_two} - #{time_two}
3: #{three} - #{win_three} | 3: #{top_three} - #{time_three}
-------------------------------
Average Stats
Eliminations: #{stats["Eliminations-Average"]}
Damage Done: #{stats["DamageDone-Average"]}
Deaths: #{stats["Deaths-Average"]}
Final Blows: #{stats["FinalBlows-Average"]}
Healing Done: #{stats["HealingDone-Average"]}
Objective Kills: #{stats["ObjectiveKills-Average"]}
Objective Time: #{stats["ObjectiveTime-Average"]}
Solo Kills: #{stats["SoloKills-Average"]}
```"""

          
        end
      end
    end
  end
end