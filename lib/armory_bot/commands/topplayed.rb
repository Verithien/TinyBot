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

        if platform == "pc"
          page = pc
        elsif platform == "xbl" || "psn"
          page = console
        else
          nil
        end


        parse_page = Nokogiri::HTML(page)

        stats = []
        playt = []
        pnf = []

        puts "So far so good"

        topplayed = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.title')
        timeplayed = parse_page.css('.bg-crystal-dark').css('.content-box').css('.content-box').css('.row').css('.row').css('.progress-category').css('.progress-2').css('.description')
        noacc = parse_page.css('.undefined').css('.page-wrapper').css('.row').css('.u-align-center')

        topplayed.map do |a|
          post_name = a.text
          stats.push(post_name)
        end

        timeplayed.map do |a|
          post_name = a.text
          playt.push(post_name)
        end

        noacc.map do |a|
          post_name = a.text
          pnf.push(post_name)
        end


        one = stats[0]
        two = stats[1]
        three = stats[2]

        onet = playt[0]
        twot = playt[1]
        threet = playt[2]

        page_not_found = pnf[0]

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        if page_not_found == "Page Not Found"
          event << "Sorry, either no account was found or your account is case sensitive"
        else
          event << "**#{event.user.mention} - #{name.capitalize} - Top Played**"
          event << "**#1:** #{one} - #{onet}" 
          event << "**#2:** #{two} - #{twot}"
          event << "**#3:** #{three} - #{threet}"
        end

      end
    end
  end
end