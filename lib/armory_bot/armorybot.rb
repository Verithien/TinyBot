module ArmoryBot
	bot = Bot.new(token: 'MTY5OTgyNzQyMTI4MzYxNDgy.CfCjAg.SDlVm1DTYoQVWdaSqpCRpfHz3gM', 
				application_id: '169952497690083328', 
				prefix: '?', advanced_functionality: false)

	bot.bucket(:armory, limit: 4,
						time_span: 60,
						delay: 1)
	bot.bucket(:fight, limit: 1,
						time_span: 600,
						delay: 1)


	bot.include! Commands::ItemLevel
	bot.include! Commands::Summary
	bot.include! Commands::GearCheck
	bot.include! Commands::RealmStatus
	bot.include! Commands::Progression
	bot.include! Commands::GuildProg
	bot.include! Commands::Talents
	bot.include! Commands::Help
	#bot.include! Commands::Duel
	bot.include! Commands::Invite
	bot.include! Commands::Stats
	bot.include! Commands::PvP
	bot.include! Commands::Moose
	bot.include! Commands::ServerList

	bot.run :async

	bot.game = 'Half Life 3'
	bot.profile.username = 'Armory Bot'
	bot.profile.avatar = File.new('/app/lib/armory_bot/wow_icon.jpg')
	puts bot.servers.map{|k,v| [k, v.name]}.to_h
	bot.sync

end