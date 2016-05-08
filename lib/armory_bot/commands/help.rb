module ArmoryBot
  module Commands
    module Help
      extend Discordrb::Commands::CommandContainer
      command(:help, bucket: :fight) do |event|
        puts 'CMD: help'
        event << 'Regions: us, eu'
        event << '**?status** [realm] [region]: checks realm status'
        event << '**?char** [realm] [character] [region]: Shows summary of a character in text format(Name, Class, Race, Gender, achievement points, mounts, and pets)'
        event << '**?ilvl** [realm] [character] [region]: Quickly check the item level of a character.'
        event << '**?gear** [realm] [character] [region]: Lists Armory Link, Item Level, and Gear with wowhead links. *Private message*'
        event << '**?prog** [realm] [character] [region]: Returns character progression in HFC. *Private message*'
        event << '**?tals** [realm] [character] [region]: Gets Talents & Glyphs of the character. *Private message*'
        event << '**?stats** [realm] [character] [region]: Stats from character sheet. *Private message*'
        event << 'Example ?command Aerie Peak Chuey us'
        event << '**?info**: Gives a bit of quick info about the bot. *Private message*'
        #event << '**?duel/?fight** [@user] [@user]: Randomly assigns a class to each user, and then they duel to the death!'
        event << '**Rate Limits**: 2 calls every 60secs'# for all but Duel command. Duels are 1 every 5mins'
      end
    end
  end
end