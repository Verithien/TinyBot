module ArmoryBot
  module Commands
    module Talents
      extend Discordrb::Commands::CommandContainer
      command(:tals, bucket: :armory) do |event, *realm, char, region|
        realm = realm.join('-')
        region = region.downcase
        dataus = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=talents&locale=en_US&apikey=vg25atxufftra3tsx567svh9r8fh79mv", :verify => false ).parsed_response
        dataeu = HTTParty.get("https://us.api.battle.net/wow/character/#{realm}/#{URI.escape(char)}?fields=talents&locale=en_GB&apikey=vg25atxufftra3tsx567svh9r8fh79mv", :verify => false ).parsed_response
        if region == "us"
          data = dataus
        elsif region == "eu"
          data = dataeu
        else
          event.respond "Sorry #{event.user.name}, please insert your region US or EU(?help for more info)"
        end
        wh = "<http://www.wowhead.com/spell="
        whs = "<http://www.wowhead.com/search?q="

        glyphs = data["talents"].find { |r| r["selected"] == true }
        glyph = glyphs["glyphs"]["major"]
        if glyph[0] == nil
          majglyph0 = "No Glyph Equipped"
        else
          majglyph0 = glyph[0]["name"]
        end
            if glyph[1] == nil
          majglyph1 = "No Glyph Equippedt"
        else
          majglyph1 = glyph[1]["name"]
        end
            if glyph[2] == nil
          majglyph2 = "No Glyph Equipped"
        else
          majglyph2 = glyph[2]["name"]
        end

            glyphm = glyphs["glyphs"]["minor"]
            if glyphm[0] == nil
          minglyph0 = "No Glyph Equipped"
        else
          minglyph0 = glyphm[0]["name"]
        end
            if glyphm[1] == nil
          minglyph1 = "No Glyph Equipped"
        else
          minglyph1 = glyphm[1]["name"]
        end
            if glyphm[2] == nil
          minglyph2 = "No Glyph Equipped"
        else
          minglyph2 = glyphm[2]["name"]
        end


        talents = data["talents"].find { |r| r["selected"] == true }
        talent0 = talents["talents"].find { |r| r["tier"] == 0 }
        talentid0 = talent0["spell"]["id"]
        talent1 = talents["talents"].find { |r| r["tier"] == 1 }
        talentid1 = talent1["spell"]["id"]
        talent2 = talents["talents"].find { |r| r["tier"] == 2 }
        talentid2 = talent2["spell"]["id"]
        talent3 = talents["talents"].find { |r| r["tier"] == 3 }
        talentid3 = talent3["spell"]["id"]
        talent4 = talents["talents"].find { |r| r["tier"] == 4 }
        talentid4 = talent4["spell"]["id"]
        talent5 = talents["talents"].find { |r| r["tier"] == 5 }
        talentid5 = talent5["spell"]["id"]
        talent6 = talents["talents"].find { |r| r["tier"] == 6 }
        talentid6 = talent6["spell"]["id"]

        event.user.pm("""**#{char.capitalize}--#{realm.capitalize}--#{region.upcase}**
        __***TALENTS***__
        *#{talent0["spell"]["name"]}* - #{wh}#{talentid0}>
        *#{talent1["spell"]["name"]}* - #{wh}#{talentid1}>
        *#{talent2["spell"]["name"]}* - #{wh}#{talentid2}>
        *#{talent3["spell"]["name"]}* - #{wh}#{talentid3}>
        *#{talent4["spell"]["name"]}* - #{wh}#{talentid4}>
        *#{talent5["spell"]["name"]}* - #{wh}#{talentid5}>
        *#{talent6["spell"]["name"]}* - #{wh}#{talentid6}>
        __***GLYPHS***__
        **Major**
        *#{majglyph0}*
        *#{majglyph1}*
        *#{majglyph2}*
        **Minor**
        *#{minglyph0}*
        *#{minglyph1}*
        *#{minglyph2}*
        """)
      end
    end
  end
end