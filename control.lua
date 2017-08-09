require("mod-gui")


function gui_init( player )
	if not player then
        log( "NO PLAYER!" )
        	return
                end
	local flow = mod_gui.get_button_flow(player)
	if not flow["sorted-deconstruct"] then
		local button = flow.add
		{
		type = "sprite-button",
		name = "sorted-deconstruct",
		style = mod_gui.button_style,
		sprite = "item/sorted-deconstructor",
		tooltip = {"sorted-deconstruct"}
		}
		button.style.visible = true
	end

end


local tile_deconstruct = nil;
local tile_cancel_deconstruct = {};
local function on_selected_area(player,event)
  log( "Selected:"..event.item.. tostring(event.entities)..":"..#event.entities);
	local surface = player.surface;
  if event.item ~= "sorted-deconstructor" and event.item ~= "sorted-deconstructor-2" then return end--If its a upgrade builder 

  --if event.item == "sorted-deconstructor" then 
    if #event.tiles then
      local new_tiles = {};

	 -- surface.deconstruct_area{ force= player.force, area=ab };
          tile_deconstruct = player.force;
  --player.cursor_stack.set_stack{name = "deconstruction-planner", count = 1}
  --player.cursor_stack.clear_deconstruction_item();
  --player.cursor_stack.tile_selection_mode = defines.deconstruction_item.tile_selection_mode.only;
      for _, tile in pairs( event.tiles ) do 
	log( "tile position:".. tile.position.x.. ","..tile.position.y );
	--log( "entity:".. tostring(surface.find_entity( tile.name, tile.position) ));
	  local p = { x = tile.position.x + 0.5, y = tile.position.y + 0.5 }
	  local ab = {{p.x-0.1,p.y-0.1},{p.x+0.1,p.y+0.1}}
	  surface.deconstruct_area{ force= player.force, area=ab };
	  surface.deconstruct_area{ force= player.force, area=ab };
      end
    log( "canceling deconstruction on:"..#tile_cancel_deconstruct );
      for _, entity in pairs( tile_cancel_deconstruct ) do 
	entity.cancel_deconstruction( player.force );
      end
	tile_cancel_deconstruct = {};
          tile_deconstruct = false;
  --player.cursor_stack.set_stack{name = event.item, count = 1}

    else
      log( "NO TILES" );
    end

  --end--If its a upgrade builder 
  
end

script.on_event( defines.events.on_marked_for_deconstruction, function(event)
    if tile_deconstruct then
	if( event.entity.type == "deconstructible-tile-proxy" ) then
		return;
	end
	log( "mark deconstruct false on:"..event.entity.name.. " "..event.entity.type );
	tile_cancel_deconstruct[#tile_cancel_deconstruct+1] = event.entity;
	--event.entity.cancel_deconstruction( tile_deconstruct );
    end
end);

script.on_event(defines.events.on_player_deconstructed_area, function(event)
   log( "deconstruction called...." );
end)

script.on_event(defines.events.on_player_selected_area, function(event)
    local player = game.players[event.player_index]
  on_selected_area(player,event)
  --remove_trees(event)
end)


script.on_init(function()

	for _, player in pairs(game.players) do
		gui_init();
	end
end)

script.on_load(function()
end)

script.on_configuration_changed(function(data)

	if not data or not data.mod_changes then
		return
	end
	
	if data.mod_changes["sorted-blueprint-and-deconstruct"] then	
		for k, player in pairs (game.players) do
			gui_init(player)
		end 
	end

end)

script.on_event(defines.events.on_player_joined_game, function(event)
	local player = game.players[event.player_index] 
	gui_init(player)
end)



script.on_event("sort-blueprint", function(event)
	log( "Sort blueprint in hand." );

	local player = game.players[event.player_index]
	local frame_flow = mod_gui.get_frame_flow(player)
	local button_flow = mod_gui.get_button_flow(player)
	if button_flow["sorted-deconstruct"] then
		button_flow["sorted-deconstruct"].style.visible = not button_flow["sorted-deconstruct"].style.visible
	end

end)

