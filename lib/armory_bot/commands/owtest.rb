module ArmoryBot
  module Commands
    module Owtest
      extend Discordrb::Commands::CommandContainer
      command(:owtest, bucket: :armory, min_args: 3) do |event, *account, region, platform|

        break unless event.user.id == 100311929821626368

        platform = platform.downcase

        if platform = "pc"
          account = account.split('#')
          account = account.join('-')
        elsif platform = "xbl"
          account = account.split(' ')
          account = account.join('%20')
        else
          account = account.downcase
        end


        page = HTTParty.get("https://masteroverwatch.com/profile/#{platform}/#{region}/#{account}", :verify => false ).parsed_response

        parse_page = Nokogiri::HTML(page)

        stats = []

        #puts parse_page

        puts parse_page.css('.data-stats').css('.stats-title')

        parse_page.css('.data-stats').css('.stats-list').css('.row').css('.stats-list-box').map do |a|
          post_name = a.text
          stats.push(post_name)
        end
        yay = stats.join(' ')
        event << "#{yay.squeeze(" ")}"
        
      end
    end
  end
end