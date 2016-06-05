module ArmoryBot
  module Commands
    module TopPlayed
      extend Discordrb::Commands::CommandContainer
      command(:topplayed, bucket: :armory) do |event, *account, region, platform|

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

        puts "https://playoverwatch.com/en-us/career/#{platform}/#{acc}"

        if platform == "pc"
          page = pc
        elsif platform == "xbl" || "psn"
          page = console
        else
          nil
        end


        parse_page = Nokogiri::HTML(page)

        stats = []

        puts "So far so good"

        topplayed = parse_page.css('.bg-crystal-dark').css('.content-box').css('.row').css('.row').css('.card-heading')

        topplayed.map do |a|
          post_name = a.text
          stats.push(post_name)
        end

        one = stats[0]
        two = stats[1]
        three = stats[2]

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        event << "**#{event.user.mention} - #{name.capitalize} - Top Played**"
        event << "**#1:** #{one}"
        event << "**#2:** #{two}"
        event << "**#3:** #{three}"
        
      end
    end
  end
end