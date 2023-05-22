function Trig_CodeGen_Load_3_Func004C takes nothing returns boolean
    return udg_SaveLoad_Valid == false
endfunction

function Trig_CodeGen_Load_3_Actions takes nothing returns nothing
    set udg_Code = udg_ImportCode3
    call CodeGen_Load(udg_Code)
    if(Trig_CodeGen_Load_3_Func004C())then
        return
    else
    endif
    set udg_LoadCount = 0
    set udg_Hero = gg_unit_H000_0004
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 60
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_EM_LevelCV[bj_forLoopAIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ConditionalTriggerExecute(gg_trg_CodeGen_Load_4)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_CodeGen_Load_3 takes nothing returns nothing
    set gg_trg_CodeGen_Load_3 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Load_3, function Trig_CodeGen_Load_3_Actions)
endfunction
