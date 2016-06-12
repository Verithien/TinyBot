module ArmoryBot
  module Commands
    module Overwatch
      extend Discordrb::Commands::CommandContainer
      command(:overwatch, bucket: :overwatch) do |event, *account, region, platform|

        platform = platform.downcase

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

        pc = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{region}/#{acc}", :verify => false ).parsed_response
        console = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{acc}", :verify => false ).parsed_response
        profile = HTTParty.get("https://api.lootbox.eu/#{platform}/#{region}/#{acc}/profile", :verify => false).parsed_response

        if platform == "pc"
          page = pc
        elsif platform == "xbl" || "psn"
          page = console
        else
          nil
        end


        parse_page = Nokogiri::HTML(page)

        top_won = []
        hero_wins = []
        no_acc = []
        top_played = []
        time_played = []

        puts "So far so good"

        topwon = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.title')
        herowins = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.description')
        noacc = parse_page.css('.undefined').css('.page-wrapper').css('.row').css('.u-align-center')
        topplayed = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.title')
        timeplayed = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.description')


        topwon.map do |a|
          post_name = a.text
          top_won.push(post_name)
        end

        herowins.map do |a|
          post_name = a.text
          hero_wins.push(post_name)
        end

        topplayed.map do |a|
          post_name = a.text
          top_played.push(post_name)
        end

        timeplayed.map do |a|
          post_name = a.text
          time_played.push(post_name)
        end

        noacc.map do |a|
          post_name = a.text
          no_acc.push(post_name)
        end

        one = top_won[21]
        two = top_won[22]
        three = top_won[23]

        win_one = hero_wins[21]
        win_two = hero_wins[22]
        win_three = hero_wins[23]

        top_one = top_played[0]
        top_two = top_played[1]
        top_three = top_played[2]

        time_one = time_played[0]
        time_two = time_played[1]
        time_three = time_played[2]

        page_not_found = no_acc[0]

        if platform == "pc"
          name = acc
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        if page_not_found == "Page Not Found"
          event << "Sorry, either no account was found or your account is case sensitive"
        else
          event.respond"""```ruby
#{name.capitalize} - Level #{profile["data"]["level"]}
Games Won: #{profile["data"]["games"]["wins"]} | Lost: #{profile["data"]["games"]["lost"]} | Win Percentage #{profile["data"]["games"]["win_percentage"]}%
1: #{one} - #{win_one} || 1: #{top_one} - #{time_one}
2: #{two} - #{win_two} || 2: #{top_two} - #{time_two}
3: #{three} - #{win_three} || 3: #{top_three} - #{time_three}
-------------------------------```"""
        end

      end
    end
  end
end