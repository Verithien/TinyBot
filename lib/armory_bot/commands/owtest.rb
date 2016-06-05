module ArmoryBot
  module Commands
    module Owtest
      extend Discordrb::Commands::CommandContainer
      command(:owtest, bucket: :armory) do |event|

        break unless event.user.id == 100311929821626368

        page = HTTParty.get('https://masteroverwatch.com/profile/pc/us/Chuey-1652', :verify => false ).parsed_response

        parse_page = Nokogiri::HTML(page)

        stats = []

        #puts parse_page

        puts parse_page.css('.data-stats').css('.stats-title')

        parse_page.css('.data-stats').css('.stats-list').css('.row').css('.stats-list-box').map do |a|
          post_name = a.text
          stats.push(post_name)
        end

        event << "#{stats.join(' ')}"
        
      end
    end
  end
end