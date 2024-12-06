obs = obslua

-- Default values
timer_text_source_name = ""  -- To be set in properties
api_response_file_path = "C:\\Users\\Ezra\\Documents\\OBS stuff\\bat\\api_response.txt"
update_interval_ms = 5000  -- Update interval in milliseconds

-- Checkbox options for displaying specific keys
checkbox_options = {
    stock_kibble = true,
    stock_snack = true,
    local_viewers = true,
    jiemao_viewers = true,
    purrrr_viewers = true,
}

-- Function to read the API response
function read_api_response()
    local file = io.open(api_response_file_path, "r")
    if not file then
        return nil
    end

    local content = file:read("*all")
    file:close()

    return content
end

-- Function to extract data from the response
function extract_data(content)
    local stock_kibble = content:match('"kibble":"(.-)"')
    local stock_snack = content:match('"snack":"(.-)"')
    local local_viewers = content:match('"local":(%d+)')
    local jiemao_viewers = content:match('"jiemao":(%d+)')
    local purrrr_viewers = content:match('"purrrr":(%d+)')

    return {
        stock_kibble = stock_kibble,
        stock_snack = stock_snack,
        local_viewers = local_viewers,
        jiemao_viewers = jiemao_viewers,
        purrrr_viewers = purrrr_viewers,
    }
end

-- Function to update the text source
function update_text_source()
    local content = read_api_response()
    if not content then
        return
    end

    local data = extract_data(content)
    local text_parts = {}
    
    -- Build the text based on selected options
    if checkbox_options.stock_kibble then
        table.insert(text_parts, "Kibble: " .. (data.stock_kibble or "N/A") .. " ")
    end
    if checkbox_options.stock_snack then
        table.insert(text_parts, "Snack: " .. (data.stock_snack or "N/A") .. " ")
    end
    if checkbox_options.local_viewers then
        table.insert(text_parts, "meow.camera Viewers: " .. (data.local_viewers or "N/A") .. " ")  -- Changed here
    end
    if checkbox_options.jiemao_viewers then
        table.insert(text_parts, "Jiemao Viewers: " .. (data.jiemao_viewers or "N/A") .. " ")
    end
    if checkbox_options.purrrr_viewers then
        table.insert(text_parts, "Purrrr Viewers: " .. (data.purrrr_viewers or "N/A") .. " ")
    end

    -- Join all parts into a single line
    local text = table.concat(text_parts, ", ")

    -- Update the text source in OBS
    local source = obs.obs_get_source_by_name(timer_text_source_name)
    if source then
        local settings = obs.obs_data_create()
        obs.obs_data_set_string(settings, "text", text)
        obs.obs_source_update(source, settings)
        obs.obs_data_release(settings)
        obs.obs_source_release(source)
    end
end

-- Function to set up the script
function script_update(settings)
    timer_text_source_name = obs.obs_data_get_string(settings, "text_source_name")  -- Get text source name
    obs.timer_add(update_text_source, update_interval_ms)  -- Update every 5 seconds
end

-- Function to load the script
function script_load(settings)
    update_text_source()  -- Initial update on load
end

-- Function to define properties
function script_properties()
    local props = obs.obs_properties_create()
    
    -- Dropdown for text source selection
    local text_source = obs.obs_properties_add_list(props, "text_source_name", "Select Text Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
    local sources = obs.obs_enum_sources()
    for _, source in ipairs(sources) do
        local source_name = obs.obs_source_get_name(source)
        obs.obs_property_list_add_string(text_source, source_name, source_name)
    end
    obs.source_list_release(sources)

    -- Checkbox for stock_kibble
    obs.obs_properties_add_bool(props, "display_stock_kibble", "Display Stock Kibble")
    
    -- Checkbox for stock_snack
    obs.obs_properties_add_bool(props, "display_stock_snack", "Display Stock Snack")
    
    -- Checkbox for local_viewers
    obs.obs_properties_add_bool(props, "display_local_viewers", "Display meow.camera Viewers")  -- Changed here
    
    -- Checkbox for jiemao_viewers
    obs.obs_properties_add_bool(props, "display_jiemao_viewers", "Display Jiemao Viewers")
    
    -- Checkbox for purrrr_viewers
    obs.obs_properties_add_bool(props, "display_purrrr_viewers", "Display Purrrr Viewers")

    return props
end

-- Function to set default settings
function script_defaults(settings)
    obs.obs_data_set_default_bool(settings, "display_stock_kibble", true)
    obs.obs_data_set_default_bool(settings, "display_stock_snack", true)
    obs.obs_data_set_default_bool(settings, "display_local_viewers", true)
    obs.obs_data_set_default_bool(settings, "display_jiemao_viewers", true)
    obs.obs_data_set_default_bool(settings, "display_purrrr_viewers", true)
end

-- Function to save settings
function script_save(settings)
    checkbox_options.stock_kibble = obs.obs_data_get_bool(settings, "display_stock_kibble")
    checkbox_options.stock_snack = obs.obs_data_get_bool(settings, "display_stock_snack")
    checkbox_options.local_viewers = obs.obs_data_get_bool(settings, "display_local_viewers")
    checkbox_options.jiemao_viewers = obs.obs_data_get_bool(settings, "display_jiemao_viewers")
    checkbox_options.purrrr_viewers = obs.obs_data_get_bool(settings, "display_purrrr_viewers")
end

-- Function to describe the script
function script_description()
    return "Updates a text source with data from api_response.txt. Display options are customizable."
end
