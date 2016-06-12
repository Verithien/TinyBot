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

        won = []
        mwins = []
        pnf = []

        puts "So far so good"

        topwon = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.title')
        wins = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.description')
        noacc = parse_page.css('.undefined').css('.page-wrapper').css('.row').css('.u-align-center')

        topwon.map do |a|
          post_name = a.text
          won.push(post_name)
        end

        wins.map do |a|
          post_name = a.text
          mwins.push(post_name)
        end

        noacc.map do |a|
          post_name = a.text
          pnf.push(post_name)
        end

        one = won[21]
        two = won[22]
        three = won[23]

        onet = mwins[21]
        twot = mwins[22]
        threet = mwins[23]

        page_not_found = pnf[0]

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
1: #{one} - #{onet}
2: #{two} - #{twot}
3: #{three} - #{threet}
-------------------------------```"""
        end

      end
    end
  end
end