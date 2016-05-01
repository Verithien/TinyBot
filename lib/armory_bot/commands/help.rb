module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help) do |event|
        puts 'CMD: help'
        event << 'Regions: US, EU'
        event << '**?status** [realm] [region]: checks realm status'
        event << '**?char** [realm] [character] [region]: Shows summary of a character in text format'
        event << '**?ilvl** [realm] [character] [region]: checks item level of a character.'
        event << '**?gear** [realm] [character] [region]: Lists Armory Link, Item Level, and Gear with wowhead links. *Does this in a private message*'
        event << '**?prog** [realm] [character] [region]: Returns character progression in HFC. *Does this in a private message*'
        event << '**?info**: Gives a bit of quick info about the bot. *Does so in a private message*'
        #event << '**?duel/?fight** [@user] [@user]: Randomly assigns a class to each user, and then they duel to the death!'
        event << '**Rate Limits**: 2 calls every 60secs'# for all but Duel command. Duels are 1 every 5mins'
      end
    end
  end
end