function Trig_CodeGen_Save_3_Func007A takes nothing returns nothing
    set udg_EM_LevelCV[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))] = GetUnitUserData(GetEnumUnit())
endfunction

function Trig_CodeGen_Save_3_Actions takes nothing returns nothing
    set udg_SaveCount = 0
    set udg_Hero = gg_unit_H000_0004
    set udg_Save[udg_SaveCount] = CodeGen_ConvertUnit(GetUnitTypeId(udg_Hero))
    set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Tier_3_Camera)
    call ForGroupBJ(udg_UnitGroup, function Trig_CodeGen_Save_3_Func007A)
    call DestroyGroup(udg_UnitGroup)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 60
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_EM_LevelCV[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_Code = CodeGen_Compile()
    call Preload("\")\ncall SetPlayerName(Player(15),\"" + udg_Code + "\")\ncall ExecuteFunc(\"Load3\")\n//")
    call PreloadGenEnd("Edemium\\Save3.txt")
    call ConditionalTriggerExecute(gg_trg_CodeGen_Save_4)
endfunction

function InitTrig_CodeGen_Save_3 takes nothing returns nothing
    set gg_trg_CodeGen_Save_3 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Save_3, function Trig_CodeGen_Save_3_Actions)
endfunction
