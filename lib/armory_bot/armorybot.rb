module ArmoryBot
	bot = Bot.new(token: 'MTY5OTgyNzQyMTI4MzYxNDgy.CfCjAg.SDlVm1DTYoQVWdaSqpCRpfHz3gM', 
				application_id: '169952497690083328', 
				prefix: '?')

	bot.bucket(:armory, limit: 2,
						time_span: 60,
						delay: 1)
	bot.bucket(:fight, limit: 1,
						time_span: 300,
						delay: 1)

	bot.include! Commands::ItemLevel
	bot.include! Commands::Summary
	bot.include! Commands::GearCheck
	bot.include! Commands::RealmStatus
	bot.include! Commands::Progression
	bot.include! Commands::Help
	bot.include! Commands::Information
	bot.include! Commands::Duel

	bot.run :async

	bot.game = 'on Nostalrius'
	bot.profile.username = 'Armory Bot'
	bot.profile.avatar = File.new('/wow_icon.jpg')

	bot.sync

end