module ArmoryBot
  module Commands
    module Game
      extend Discordrb::Commands::CommandContainer
      command(:game, min_args: 1) do |event, *text|
      	event.message.delete if bot_profile.permission?(:manage_messages, event.channel)
        event.bot.game = text.join(' ') if event.author.id == 100311929821626368
        nil
      end
    end
  end
end