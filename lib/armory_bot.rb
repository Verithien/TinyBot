require 'discordrb'
require 'httparty'

require_relative 'armory_bot/version'

require_relative 'armory_bot/bot'

Dir["#{File.dirname(__FILE__)}/armory_bot/commands/*.rb"].each { |file| require file }

require_relative 'armory_bot/armorybot'