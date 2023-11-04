local Songs = {}
--Must be named exactly as listed in quotes below next to the title: key
local color = 
  {
  r = 0,
  g = 0,
  b = 0
  }
-- Define a function to read a file and return its contents as a table
function split_lines(inputstr)
  local lines = {}
  for line in inputstr:gmatch("[^\r\n]+") do
      table.insert(lines, line)
  end
  return (lines)
end

function CreatePost(i, name, author) 
  return {
  id = i,
  title = name or "???",
  author = author or "",
  read = true,
  }
end

-- Example usage:
local file_content = [[add_on.ogg
centre_city.ogg
cruise_ship.ogg
cyber_of_aircleaner.ogg
cyber_of_clocktower.ogg
cyber_of_cruise_ship.ogg
cyber_of_dungeon.ogg
cyber_of_hospital.ogg
cyber_of_refrigerator.ogg
cyber_of_rom.ogg
cyber_of_school.ogg
cyber_of_server.ogg
cyber_of_shrine.ogg
DeepArea.ogg
deepnetbackground.ogg
eien_city.ogg
emergency.ogg
encounter.ogg
ending.ogg
GameOver.ogg
game_center.ogg
gen_city.ogg
gen_uni.ogg
heavenbackground.ogg
hospital.ogg
incident.ogg
ingles.ogg
internet.ogg
in_room.ogg
LastBattle.ogg
main_center.ogg
main_theme.ogg
result.ogg
ROM_base.ogg
sadness.ogg
school.ogg
settlement.ogg
stylechange.ogg
theme_of_ROM.ogg
title.ogg
Tournament.ogg
ura_internet.ogg
VScybeast.ogg
VSnavi.ogg
VSvirus.ogg
whiteheavenarea.ogg
]]
local lines = split_lines(file_content)

-- Print the lines with their indices
for i, line in ipairs(lines) do
  print(i, line)
  local postToAdd = CreatePost(i, line, "")
  table.insert(Songs, postToAdd)
end
print(Songs)

table.insert(Songs, CreatePost(#Songs+1, "Exit", ""))

function handle_post_selection(player_id,post_id)        
  Async.question_player(player_id,("Do you wish to change the song to " ..Songs[tonumber(post_id)].title.."?"))
  .and_then(function(response)
    if response == 0 then
      print("they said no")
      return
    elseif response == 1 then
      if post_id == (#Songs) then
      Net.close_bbs(player_id)
      print("closed BBS with a cancel")
      return
      elseif post_id ~= (#Songs) then
      print("Attempting to set song")
      local area_id = Net.get_player_area(player_id)
      Net.set_song(area_id, "/server/assets/jukebox/tracks/"..Songs[tonumber(post_id)].title)
      print("successfully set song")
      Net.close_bbs(player_id)
      print("Closed BBS with success")
      print(post_id)
      return
    end
    end
  end)
end
     function handle_object_interaction(player_id, object_id, button)
      local area_id = Net.get_player_area(player_id)
      local object = Net.get_object_by_id(area_id, object_id)
      if object.custom_properties.Jukebox ~= nil then
      print("Checked Custom properties to make sure its Jukebox")
      Net.open_board(player_id, "Songs", color, Songs)
      end
    end