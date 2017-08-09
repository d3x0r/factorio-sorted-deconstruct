
data:extend({

  {
    type = "deconstruction-item",
    name = "sorted-deconstructor-2",
    icon = "__sorted-blueprint-and-deconstruct__/graphics/deconstruct.png",
    flags = {"goes-to-quickbar"},
    subgroup = "tool",
    order = "c[automated-construction]-b[deconstruction-planner]",
    stack_size = 1,
    entity_filter_count = 30,
    tile_filter_count = 30,
    selection_color = { r = 1, g = 0, b = 0 },
    alt_selection_color = { r = 0, g = 0, b = 1 },
    selection_mode = {"deconstruct"},
    alt_selection_mode = {"cancel-deconstruct"},
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed"
  },


  {
    type = "selection-tool",
    name = "sorted-deconstructor",
    icon = "__sorted-blueprint-and-deconstruct__/graphics/deconstruct.png",
    stack_size = 1,
    subgroup = "tool",
    order = "c[automated-construction]-d[sorted-deconstructor]",
    flags = {}, --{"goes-to-quickbar"},
    selection_color = {r = 0.2, g = 0.8, b = 0.2, a = 0.2},
    alt_selection_color = {r = 0.2, g = 0.2, b = 0.8, a = 0.2},
    selection_mode = {"blueprint"},
    always_include_tiles = true,
    alt_selection_mode = {"blueprint"},
    selection_cursor_box_type = "entity",
    alt_selection_cursor_box_type = "copy"
    
  },
  {
    type = "recipe",
    name = "sorted-deconstructor",
    enabled = true,
    energy_required = 0.1,
    ingredients =
    {
    },
    result = "sorted-deconstructor"
  },
  {
    type = "recipe",
    name = "sorted-deconstructor-2",
    enabled = true,
    energy_required = 0.1,
    ingredients =
    {
    },
    result = "sorted-deconstructor-2"
  },
})


data:extend({
    {
        type = "font",
        name = "upgrade-planner2-small-font",
        from = "default",
        size = 14
    }
})

data.raw["gui-style"].default["upgrade-planner2-small-button"] = {
    type = "button_style",
    parent = "button_style",
    font = "upgrade-planner2-small-font"
}

data.raw["gui-style"].default["upgrade-planner2-menu-button"] = {
    type = "button_style",
    parent = "button_style",
    font = "upgrade-planner2-small-font"
}

data:extend{
  {
    type = "custom-input",
    name = "upgrade-planner2",
    key_sequence = "CONTROL+S",
  },
  {
    type = "custom-input",
    name = "sort-blueprint",
    key_sequence = "CONTROL + S",
  },
}
