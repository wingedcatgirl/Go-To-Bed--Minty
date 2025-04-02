SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
        create_toggle({
            label = "Quit on die",
            ref_table = GTB.config,
            ref_value = 'quit_on_die',
        }),
        create_toggle({
            label = "Quit on win",
            ref_table = GTB.config,
            ref_value = 'quit_on_win',
        }),
        }}
    }}
end