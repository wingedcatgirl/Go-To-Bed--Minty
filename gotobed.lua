GTB = {}

GTB.config = SMODS.current_mod.config
assert(SMODS.current_mod.lovely, "Lovely patches whiffed! Please make sure this mod's file structure is not nested.'")
SMODS.load_file('configui.lua')()


GTB.DIEBUTTON = function()
    if
        GTB.config.quit_on_die or
        (GTB.config.quit_on_win and G.GAME.won)
    then return "quit" else return "notify_then_setup_run" end
end

GTB.DIELABEL = function()
    if
        GTB.config.quit_on_die or
        (GTB.config.quit_on_win and G.GAME.won)
    then return "b_quit_cap" else return "b_start_new_run" end
end

GTB.WINBUTTON = function()
    if GTB.config.quit_on_win then return "quit" else return "notify_then_setup_run" end
end

GTB.WINLABEL = function()
    if GTB.config.quit_on_win then return "b_quit_cap" else return "b_start_new_run" end
end