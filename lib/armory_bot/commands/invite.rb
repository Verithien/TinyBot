module ArmoryBot
  module Commands
    module Invite
      extend Discordrb::Commands::CommandContainer
      command(:invite) do |event|
        puts 'CMD: INVITE MY BOT'
        event << "If you'd like to add this bot to your server, clink the link below"
        event << "Only users with `manage server` permission are able to invite me."
        event << "<https://discordapp.com/oauth2/authorize?&client_id=169952497690083328&scope=bot&permissions=3200>"
      end
    end
  end
end
