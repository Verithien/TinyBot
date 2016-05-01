module ArmoryBot
  module Commands
    module Information
      extend Discordrb::Commands::CommandContainer
      command(:info, 
                  description: 'Shows information about this bot!') do |event|
        puts 'Calling for Info dial 411 jk'
        event.user.pm("""
        Still in what I'll call beta phase
        Gems: discordrb and httparty
        First shot at a bot :worried: please give feedback at <wowarmorybot@gmail.com>""")
        #Using free api plan from blizzard. 36,000 calls per hour. If this gets bigger, I'll upgrade :slight_smile: """)
      end
    end
  end
end