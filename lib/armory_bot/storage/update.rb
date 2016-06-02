module ArmoryBot
  module Commands
    module Update
      include ArmoryBot::Bnetbot
      extend Discordrb::Commands::CommandContainer
      command(:update, bucket: :dbupdate) do |event, *realm, character, region|

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

        realm = realm.join('-')

        db.execute("UPDATE bnetbot 
                    SET realm = #{realm}
                    WHERE id = #{userdb}")
        db.execute("UPDATE bnetbot 
                    SET character = #{character}
                    WHERE id = #{userdb}")
        db.execute("UPDATE bnetbot 
                    SET region = #{region}
                    WHERE id = #{userdb}")

        event << "#{event.user.name} - Your info has been updated!"


      end
    end
  end
end