module ArmoryBot
  module Commands
    module GuildProg
      extend Discordrb::Commands::CommandContainer
      command(:guildprog, bucket: :armory) do |event, *realm, guild, region|

        if realm.include? "'"
          realm = realm.split("'")
          realm = realm.join('-')
        elsif realm.include? " "
          realm = realm.split(' ')
          realm = realm.join('-')
        else
          realm = realm.join('-')
        end

        if guild.include? " "
          guild = guild.split(' ')
          guild = guild.join('+')
        else
          guild = guild.delete!('"')
        end

        prog = HTTParty.get("http://www.wowprogress.com/guild/#{region.downcase}/#{realm}/#{guild}/json_rank", :verify => false ).parsed_response

        progsrv1 = prog.split(',')
        progsrv2 = progsrv1.at(3)
        progsrv3 = progsrv2.split(':')
        progsrv4 = progsrv3.at(1)
        server_rank = progsrv4.delete!("}")

        progreg1 = prog.split(',')
        progreg2 = progreg1.at(2)
        progreg3 = progreg2.split(':')
        region_rank = progreg3.at(1)

        progwor1 = prog.split(',')
        progwor2 = progwor1.at(1)
        progwor3 = progwor2.split(':')
        world_rank = progwor3.at(1)

        puts "Getting Progression"

    event.respond("""**#{guild.capitalize} - #{realm.capitalize} - #{region.upcase}**
**Server Rank:** #{server_rank}
**Region Rank:** #{region_rank}
**World Rank:** #{world_rank}""")


      end
    end
  end
end