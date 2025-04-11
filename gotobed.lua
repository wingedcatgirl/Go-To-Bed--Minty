GTB = {}

GTB.config = SMODS.current_mod.config
assert(SMODS.current_mod.lovely, "Lovely patches whiffed! Please make sure this mod's file structure is not nested.'")
SMODS.load_file('configui.lua')()


GTB.isItBedtime = function()
    if not GTB.config.bedtime.active then return true end

    local startTime = (GTB.config.bedtime.start_hour * 60) + GTB.config.bedtime.start_minute
    local endTime = (GTB.config.bedtime.end_hour * 60) + GTB.config.bedtime.end_minute
    local currentTime = (tonumber(os.date("%H"))*60) + tonumber(os.date("%M"))

    --sendDebugMessage("startTime: "..startTime)
    --sendDebugMessage("endTime: "..endTime)
    --sendDebugMessage("currentTime: "..currentTime)

    if startTime < endTime then
        return currentTime > startTime and currentTime < endTime
    end

    if startTime > endTime then
        return currentTime > startTime or currentTime < endTime or not (currentTime < startTime and currentTime > endTime)
    end
    
end

GTB.DIEBUTTON = function()
    if
        (GTB.config.quit_on_die or
        (GTB.config.quit_on_win and G.GAME.won))
        and GTB.isItBedtime()
    then return "quit" else return "notify_then_setup_run" end
end

GTB.DIELABEL = function()
    if
        (GTB.config.quit_on_die or
        (GTB.config.quit_on_win and G.GAME.won))
        and GTB.isItBedtime()
    then return "b_quit_cap" else return "b_start_new_run" end
end

GTB.WINBUTTON = function()
    if GTB.config.quit_on_win and GTB.isItBedtime() then return "quit" else return "notify_then_setup_run" end
end

GTB.WINLABEL = function()
    if GTB.config.quit_on_win and GTB.isItBedtime() then return "b_quit_cap" else return "b_start_new_run" end
end

GTB.ENDLESSBUTTON = function()
    if GTB.config.no_endless and GTB.isItBedtime() then return {} else return {
        UIBox_button({button = 'exit_overlay_menu', label = {localize('b_endless')}, minw = 6.5, maxw = 5, minh = 1.2, scale = 0.7, shadow = true, colour = G.C.BLUE, focus_args = {nav = 'wide', button = 'x',set_button_pip = true}}),
      } end
end