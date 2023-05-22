function Trig_CodeGen_Save_4_Actions takes nothing returns nothing
    set udg_SaveCount = 0
    set udg_Hero = gg_unit_H000_0004
    set udg_Save[udg_SaveCount] = CodeGen_ConvertUnit(GetUnitTypeId(udg_Hero))
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 60
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_EM_LevelDiscovered[GetForLoopIndexB()]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_AS_Value[GetForLoopIndexB()]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set udg_Code = CodeGen_Compile()
    call Preload("\")\ncall SetPlayerName(Player(15),\"" + udg_Code + "\")\ncall ExecuteFunc(\"Load4\")\n//")
    call PreloadGenEnd("Edemium\\Save4.txt")
    call DisplayTimedTextToForce(GetForceOfPlayer(GetTriggerPlayer()), 0.50, "|cFF00FF00Автосохранение|r")
    call ClearTextMessagesBJ(bj_FORCE_PLAYER[0])
    call SelectUnitForPlayerSingle(udg_Arct, Player(0))
endfunction

function InitTrig_CodeGen_Save_4 takes nothing returns nothing
    set gg_trg_CodeGen_Save_4 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Save_4, function Trig_CodeGen_Save_4_Actions)
endfunction
