module ArmoryBot
  module Commands
    module ItemLevel
      extend Discordrb::Commands::CommandContainer
      command(:ilvl, bucket: :armory) do |event, *realm, char, region|
        api_key = 'vg25atxufftra3tsx567svh9r8fh79mv'
        realm = realm.join('-')
        dataeu = HTTParty.get("https://eu.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=items&locale=en_GB&apikey=#{api_key}", :verify => false ).parsed_response
        dataus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=items&locale=en_US&apikey=#{api_key}", :verify => false ).parsed_response
          if region == "us"
              rdata = dataus
          elsif region == "eu"
              rdata = dataeu
          else
              event.respond "Sorry #{event.user.name}, please insert your region US or EU(?help for more info)"
          end
        event.respond "#{char.capitalize} - #{realm.capitalize} - #{region.upcase} has an average ilvl of **#{rdata["items"]["averageItemLevel"]}.** Equipped: **#{rdata["items"]["averageItemLevelEquipped"]}.**"
      end
    end
  end
end