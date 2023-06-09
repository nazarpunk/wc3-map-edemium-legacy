function Trig_CodeGen_Load_4_Actions takes nothing returns nothing
    set udg_Code = udg_ImportCode4
    call CodeGen_Load(udg_Code)
    if not udg_SaveLoad_Valid then
        return
    endif
    set udg_LoadCount = 0
    set udg_Hero = ArctUnit
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 60
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_EM_LevelDiscovered[bj_forLoopBIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_AS_Value[bj_forLoopBIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    call ConditionalTriggerExecute(gg_trg_CodeGen_Other)
    set udg_LoadSucces = true
    call ClearTextMessagesBJ(GetPlayersAll())
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_CodeGen_Load_4 takes nothing returns nothing
    set gg_trg_CodeGen_Load_4 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Load_4, function Trig_CodeGen_Load_4_Actions)
endfunction
