module ArmoryBot
  module Commands
    module OWAverage
      extend Discordrb::Commands::CommandContainer
      command(:owavg, bucket: :armory, min_args: 3) do |event, *account, region, platform|

        platform = platform.downcase

        region = region.downcase

        account = account.join('%20')

        if platform == "pc"
          acc = account.split('#')
          acc = acc.join('-')
        else
          nil
        end


        pc = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{region}/#{URI.escape(acc)}", :verify => false ).parsed_response
        console = HTTParty.get("https://playoverwatch.com/en-us/career/#{platform}/#{URI.escape(acc)}", :verify => false ).parsed_response

        puts pc
        puts console

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

        noar = account.split('%20')
        noar = noar.join(' ')

        event << "#{event.user.mention} - **#{noar.capitalize} - Average Stats**"
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