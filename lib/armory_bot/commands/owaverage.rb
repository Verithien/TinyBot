module ArmoryBot
  module Commands
    module OWAverage
      extend Discordrb::Commands::CommandContainer
      command(:owavg, bucket: :armory) do |event, *account, region, platform|

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

        average = parse_page.css('.bg-crystal-dark').css('.content-box').css('.row').css('.row').css('.card-heading')

        average.map do |a|
          post_name = a.text
          stats.push(post_name)
        end

        elim = stats[0]
        dmg = stats[1]
        deaths = stats[2]
        final = stats[3]
        healing = stats[4]
        objkills = stats[5]
        objtime = stats[6]
        solokills = stats[7]

        if platform == "pc"
          name = account.first
        else
          name = acc.split('%20')
          name = name.join(' ')
        end

        event << "#{event.user.mention} - **#{name.capitalize} - Average Stats**"
        event << "**Eliminations:**   #{elim}"
        event << "**Damage Done:**    #{dmg}"
        event << "**Deaths:**   #{deaths}"
        event << "**Final Blows:**    #{final}"
        event << "**Healing Done:**   #{healing}"
        event << "**Objective Kills:**    #{objkills}"
        event << "**Objective Time:**   #{objtime}"
        event << "**Solo Kills:**   #{solokills}"
        
      end
    end
  end
end