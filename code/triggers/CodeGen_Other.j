function Trig_CodeGen_Other_Func005Func002Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction

function Trig_CodeGen_Other_Func005A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), udg_EM_LevelCV[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))])
    if udg_EM_LevelCV[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))] == 8 then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        call EnumDestructablesInCircleBJ(50.00, udg_Point, function Trig_CodeGen_Other_Func005Func002Func002A)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Pearlescence.mdl")
        call CreateDestructableLoc(0x42303139, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
    endif
    if udg_EM_LevelDiscovered[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))] == 1 then
        set udg_Target = GetEnumUnit()
        call ConditionalTriggerExecute(gg_trg_CodeGen_Dungeon)
    endif
    if udg_EM_TargetCV == R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit())) then
        set udg_EM_Target = GetEnumUnit()
        set udg_TargetPoint = GetUnitLoc(udg_EM_Target)
        call CreateDestructableLoc(0x42303141, udg_TargetPoint, 0.00, 0.30, 0)
        set udg_EM_Effect = GetLastCreatedDestructable()
        call RemoveLocation(udg_TargetPoint)
    endif
endfunction

function Trig_CodeGen_Other_Func008Func002Func003A takes nothing returns nothing
    if GetDestructableTypeId(GetEnumDestructable()) == 0x42303136 then
        set udg_Point = GetDestructableLoc(GetEnumDestructable())
        call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_CodeGen_Other_Func008Func007A takes nothing returns nothing
    if GetDestructableTypeId(GetEnumDestructable()) == 0x42303136 then
        set udg_Point = GetDestructableLoc(GetEnumDestructable())
        call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_CodeGen_Other_Func029A takes nothing returns nothing
    set udg_Target = GetEnumUnit()
    if udg_AS_Value[GetUnitUserData(GetEnumUnit())] > 0 then
        set udg_Point = GetUnitLoc(udg_Target)
        call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
        call RemoveLocation(udg_Point)
        if udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 1 then
            set udg_MagneticField[1] = GetLastCreatedDestructable()
            set udg_AS_Logic[1] = true
            set udg_AS_SeriesNumber = 1
            call CreateTextTagUnitBJ("3", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[1] = GetLastCreatedTextTag()
        else
            if udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 2 then
                set udg_MagneticField[2] = GetLastCreatedDestructable()
                set udg_AS_Logic[2] = true
                set udg_AS_SeriesNumber = 2
                call CreateTextTagUnitBJ("5", udg_Target, 0, 15.00, 100, 100, 100, 0)
                set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
            else
                if udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 3 then
                    set udg_MagneticField[3] = GetLastCreatedDestructable()
                    set udg_AS_Logic[3] = true
                    set udg_AS_SeriesNumber = 3
                    call CreateTextTagUnitBJ("7", udg_Target, 0, 15.00, 100, 100, 100, 0)
                    set udg_AS_TextNumber[3] = GetLastCreatedTextTag()
                else
                    set udg_MagneticField[4] = GetLastCreatedDestructable()
                    set udg_AS_Logic[4] = true
                    set udg_AS_SeriesNumber = 4
                    call CreateTextTagUnitBJ("9", udg_Target, 0, 15.00, 100, 100, 100, 0)
                    set udg_AS_TextNumber[4] = GetLastCreatedTextTag()
                endif
            endif
        endif
        set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
        call ConditionalTriggerExecute(gg_trg_Abilities_Remove)
    endif
endfunction

function Trig_CodeGen_Other_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AugmentCost[bj_forLoopAIndex] = (udg_AugmentLevel[bj_forLoopAIndex] * 10)
        set udg_AugmentCost[bj_forLoopAIndex] = (udg_AugmentCost[bj_forLoopAIndex] + 50)
        if bj_forLoopAIndex == 1 then
            call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[1])
            set udg_Point = GetUnitLoc(gg_unit_h012_0012)
        else
            if bj_forLoopAIndex == 2 then
                call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[2])
                set udg_Point = GetUnitLoc(gg_unit_h012_0011)
            else
                call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[3])
                set udg_Point = GetUnitLoc(gg_unit_h012_0013)
            endif
        endif
        call CreateTextTagLocBJ(I2S(udg_AugmentLevel[bj_forLoopAIndex]), udg_Point, 150.00, 10, 100, 100, 100, 0)
        set udg_GiftText[bj_forLoopAIndex] = GetLastCreatedTextTag()
        call RemoveLocation(udg_Point)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Tier_3_Camera)
    call ForGroupBJ(udg_UnitGroup, function Trig_CodeGen_Other_Func005A)
    call DestroyGroup(udg_UnitGroup)
    if udg_TierUnlocked == 2 then
        set udg_Difficulty_Unlocked[1] = true
        set udg_Difficulty_Unlocked[2] = true
        set udg_Difficulty_Unlocked[3] = true
        set udg_EM_Boss[1] = true
        set udg_EM_Boss[2] = true
        call EnumDestructablesInRectAll(gg_rct_Tier_3_Camera, function Trig_CodeGen_Other_Func008Func007A)
    else
        if udg_TierUnlocked == 1 then
            set udg_Difficulty_Unlocked[1] = true
            set udg_EM_Boss[1] = true
            call EnumDestructablesInRectAll(gg_rct_Tier_2_Camera, function Trig_CodeGen_Other_Func008Func002Func003A)
        endif
    endif
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if udg_ART[bj_forLoopAIndex] > 0 then
            set udg_Point = GetUnitLoc(udg_CC_SecretUnit[bj_forLoopAIndex])
            call CreateTextTagLocBJ(I2S(udg_ART[bj_forLoopAIndex]), udg_Point, (GetUnitFlyHeight(udg_CC_SecretUnit[bj_forLoopAIndex]) + 40.00), 10, 100, 100, 100, 0)
            call RemoveLocation(udg_Point)
            set udg_CC_SecretLevel[bj_forLoopAIndex] = GetLastCreatedTextTag()
            set udg_CC_SecretUnlocked[bj_forLoopAIndex] = true
            call ShowUnitShow(udg_CC_SecretUnit[bj_forLoopAIndex])
        else
            if udg_SecretUnlocked[bj_forLoopAIndex] == 1 then
                set udg_CC_SecretUnlocked[bj_forLoopAIndex] = true
                call ShowUnitShow(udg_CC_SecretUnit[bj_forLoopAIndex])
            else
                set udg_CC_SecretUnlocked[bj_forLoopAIndex] = false
                call ShowUnitHide(udg_CC_SecretUnit[bj_forLoopAIndex])
            endif
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if udg_ART[7] > 0 then
        set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_ART[7]))
    endif
    if udg_ART[12] > 0 then
        set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_ART[12]))
    endif
    if udg_ART[16] > 0 then
        call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, udg_ART[16])
        call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, udg_ART[16])
        call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, udg_ART[16])
    endif
    if udg_AS_AbilityStudied[1] == 1 then
        set udg_Target = gg_unit_h006_0081
        call RemoveDestructable(gg_dest_B003_2936)
        call ShowDestructableBJ(true, gg_dest_B00B_1355)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[2] == 1 then
        set udg_Target = gg_unit_h006_0075
        call RemoveDestructable(gg_dest_B003_2937)
        call ShowDestructableBJ(true, gg_dest_B00B_1357)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[3] == 1 then
        set udg_Target = gg_unit_h006_0077
        call RemoveDestructable(gg_dest_B003_2939)
        call ShowDestructableBJ(true, gg_dest_B00B_1354)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[4] == 1 then
        set udg_Target = gg_unit_h006_0079
        call RemoveDestructable(gg_dest_B003_2941)
        call ShowDestructableBJ(true, gg_dest_B00B_1356)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[5] == 1 then
        set udg_Target = gg_unit_h006_0082
        call RemoveDestructable(gg_dest_B003_2935)
        call ShowDestructableBJ(true, gg_dest_B00B_1366)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[6] == 1 then
        set udg_Target = gg_unit_h006_0076
        call RemoveDestructable(gg_dest_B003_2938)
        call ShowDestructableBJ(true, gg_dest_B00B_1367)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[7] == 1 then
        set udg_Target = gg_unit_h006_0078
        call RemoveDestructable(gg_dest_B003_2940)
        call ShowDestructableBJ(true, gg_dest_B00B_1389)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[8] == 1 then
        set udg_Target = gg_unit_h006_0080
        call RemoveDestructable(gg_dest_B003_2942)
        call ShowDestructableBJ(true, gg_dest_B00B_1390)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[9] == 1 then
        set udg_Target = gg_unit_h006_0071
        call RemoveDestructable(gg_dest_B003_2928)
        call ShowDestructableBJ(true, gg_dest_B00B_1359)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[10] == 1 then
        set udg_Target = gg_unit_h006_0069
        call RemoveDestructable(gg_dest_B003_2929)
        call ShowDestructableBJ(true, gg_dest_B00B_1362)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[11] == 1 then
        set udg_Target = gg_unit_h006_0073
        call RemoveDestructable(gg_dest_B003_2932)
        call ShowDestructableBJ(true, gg_dest_B00B_1361)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    if udg_AS_AbilityStudied[12] == 1 then
        set udg_Target = gg_unit_h006_0067
        call RemoveDestructable(gg_dest_B003_2930)
        call ShowDestructableBJ(true, gg_dest_B00B_1360)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    endif
    set udg_UnitGroup = GetUnitsInRectAll(gg_rct_Abilities)
    call ForGroupBJ(udg_UnitGroup, function Trig_CodeGen_Other_Func029A)
    call DestroyGroup(udg_UnitGroup)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_CodeGen_Other takes nothing returns nothing
    set gg_trg_CodeGen_Other = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Other, function Trig_CodeGen_Other_Actions)
endfunction