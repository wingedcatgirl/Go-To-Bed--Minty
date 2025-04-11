G.FUNCS.gtb_setTime = function(args)
    local refval = args.cycle_config.ref_value
    local opt = args.cycle_config.current_option
    --sendDebugMessage(refval, "GTB")
    --sendDebugMessage(opt, "GTB")
    if string.match(refval, "minute") then
        opt = (opt - 1) * 5
    else
        opt = opt - 1
    end
    --sendDebugMessage(opt, "GTB")
    GTB.config.bedtime[refval] = opt
end

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
            create_toggle({
                label = "Ban Endless Mode",
                ref_table = GTB.config,
                ref_value = 'no_endless',
            }),
            create_toggle({
                label = "Remove Main Menu button",
                ref_table = GTB.config,
                ref_value = 'no_main_menu',
            }),
            create_toggle({
                label = "Activate only at bedtime",
                ref_table = GTB.config.bedtime,
                ref_value = 'active',
            }),
        }},
        {n = G.UIT.C, config = {minw=1, minh=1, align = "tl", colour = G.C.CLEAR, padding = 0.15}, nodes = {
            create_option_cycle({
                label = "Starting Hour",
                ref_table = GTB.config.bedtime,
                ref_value = 'start_hour',
                options = {
                    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23
                },
                current_option = GTB.config.bedtime.start_hour + 1,
                opt_callback = 'gtb_setTime',
            }),
            create_option_cycle({
                label = "Starting Minute",
                ref_table = GTB.config.bedtime,
                ref_value = 'start_minute',
                options = {
                    0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55,
                },
                current_option = (GTB.config.bedtime.start_minute / 5) + 1,
                opt_callback = 'gtb_setTime',
            }),
            create_option_cycle({
                label = "Ending Hour",
                ref_table = GTB.config.bedtime,
                ref_value = 'end_hour',
                options = {
                    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23
                },
                current_option = GTB.config.bedtime.end_hour + 1,
                opt_callback = 'gtb_setTime',
            }),
            create_option_cycle({
                label = "Ending Minute",
                ref_table = GTB.config.bedtime,
                ref_value = 'end_minute',
                options = {
                    0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55,
                },
                current_option = (GTB.config.bedtime.end_minute / 5) + 1,
                opt_callback = 'gtb_setTime',
            }),
        }}
    }}
end