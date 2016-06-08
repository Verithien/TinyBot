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
	bot.bucket(:dbupdate, limit: 1,
						time_span: 86400,
						delay: 1)


	bot.include! Commands::ItemLevel
	bot.include! Commands::Summary
	bot.include! Commands::GearCheck
	bot.include! Commands::RealmStatus
	bot.include! Commands::Progression
	bot.include! Commands::GuildRank
	bot.include! Commands::Talents
	bot.include! Commands::Help
	#bot.include! Commands::Duel
	bot.include! Commands::Invite
	bot.include! Commands::Stats
	bot.include! Commands::PvP
	bot.include! Commands::Moose
	bot.include! Commands::ServerList
	bot.include! Commands::Game
	bot.include! Commands::Glory
	bot.include! Commands::Evaluation
	bot.include! Commands::OAverage
	#bot.include! Commands::Register
	#bot.include! Commands::Update
	bot.include! Commands::Donate
	bot.include! Commands::Servers
	bot.include! Commands::TopPlayed
	bot.include! Commands::Wins

	bot.run :async

	bot.profile.username = 'Armory Bot'
	bot.profile.avatar = File.new('/app/lib/armory_bot/wow_icon.jpg')
	bot.sync

end