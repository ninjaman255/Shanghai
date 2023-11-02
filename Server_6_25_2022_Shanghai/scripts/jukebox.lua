filenames = {}
--Must be named exactly as listed in quotes below next to the title: key
    local color = {
      r = 0,
      g = 0,
      b = 0
    }
    SongPath = "/server/assets/jukebox"

    function scandir(SongPath)
      local i, popen = {}, io.popen
        for filename in popen('dir "'..SongPath..'" /b'):lines() do
          local extension = filename:match("^.+(%..+)$")
          if extension == ".ogg" then
              uriFormat = filename:gsub(" ", "%%20")
              end
              i = i + 1
          end
        end

    local SongNamesTest = scandir(SongPath)

    print(SongNamesTest)

    local Songs = {
     
    }
    print("made it to step 1")


      function handle_post_selection(player_id,post_id)
        
      Async.question_player(player_id,("Do you wish to change the song to".." "..Songs[tonumber(post_id)].title.."?"))
  .and_then(function(response)
    if response == 0 then
      print("they said no")
      Net.close_bbs(player_id)
      print("closed BBS with a cancel")

    elseif response == 1 then
      if post_id == 21 then
        return
      end
      print("Attempting to set song")
      local area_id = Net.get_player_area(player_id)
      Net.set_song(area_id, (SongPath..Songs[tonumber(post_id)].title..".ogg"))
      print("successfully set song")
      Net.close_bbs(player_id)
      print("Closed BBS with success")
      print(post_id)
    end
  end)
end
    
  
    for i, s in ipairs(Songs) do
      if s.title == post_id then
        Songs = s
        break
      end
    end
    
     function handle_object_interaction(player_id, object_id, button)
      local area_id = Net.get_player_area(player_id)
      local object = Net.get_object_by_id(area_id, object_id)
      if object.custom_properties.Jukebox ~= nil then
      print("Checked Custom properties to make sure its Jukebox")
      Net.open_board(player_id, "Songs", color, Songs)
      end
    end