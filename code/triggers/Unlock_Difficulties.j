
function Trig_Unlock_Difficulties_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_Difficulty_Unlocked[bj_forLoopAIndex] = true
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

function InitTrig_Unlock_Difficulties takes nothing returns nothing
    set gg_trg_Unlock_Difficulties = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Unlock_Difficulties, Player(0), "4", true)
    call TriggerAddAction(gg_trg_Unlock_Difficulties, function Trig_Unlock_Difficulties_Actions)
endfunction
