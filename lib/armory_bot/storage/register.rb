module ArmoryBot
  module Commands
    module Register
      include ArmoryBot::Bnetbot
      extend Discordrb::Commands::CommandContainer
      command(:register, bucket: :dbupdate) do |event, *realm, character, region|

        if region == "us" || "eu"
          region = region.downcase
        else
          event.respond "Sorry #{event.user.name}, please insert the region US or EU(?help for more info)"
        end

        break if region != "eu" || "us"

        userdb = event.user.id

        saved = db.get_first_row("select * from students where id = ?", 
                                "#{userdb}"
                                )
        saved1 = saved[0]

        if event.user.id == saved1
          event << "You're already registered. If you need to update your info, use **?update**"
        else
          nil
        end

        break if event.user.id == saved1

        realm = realm.join('-')

        db.execute("INSERT INTO bnetbot (id, realm, character, region) 
                    VALUES (?, ?, ?, ?)", ["#{userdb}", "#{realm}", "#{character}", "#{region}"])

        event << "#{event.user.name} You've been registered!"


      end
    end
  end
end