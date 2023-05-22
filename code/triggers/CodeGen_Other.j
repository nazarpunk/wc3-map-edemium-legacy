function Trig_CodeGen_Other_Func002Func003Func001C takes nothing returns boolean
    return bj_forLoopAIndex == 2
endfunction

function Trig_CodeGen_Other_Func002Func003C takes nothing returns boolean
    return bj_forLoopAIndex == 1
endfunction

function Trig_CodeGen_Other_Func005Func002Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction

function Trig_CodeGen_Other_Func005Func002C takes nothing returns boolean
    return udg_EM_LevelCV[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))] == 8
endfunction

function Trig_CodeGen_Other_Func005Func003C takes nothing returns boolean
    return udg_EM_LevelDiscovered[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))] == 1
endfunction

function Trig_CodeGen_Other_Func005Func004C takes nothing returns boolean
    return udg_EM_TargetCV == R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))
endfunction

function Trig_CodeGen_Other_Func005A takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), udg_EM_LevelCV[R2I(GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()))])
    if(Trig_CodeGen_Other_Func005Func002C())then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        call EnumDestructablesInCircleBJ(50.00, udg_Point, function Trig_CodeGen_Other_Func005Func002Func002A)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Pearlescence.mdl")
        call CreateDestructableLoc(0x42303139, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
    else
    endif
    if(Trig_CodeGen_Other_Func005Func003C())then
        set udg_Target = GetEnumUnit()
        call ConditionalTriggerExecute(gg_trg_CodeGen_Dungeon)
    else
    endif
    if(Trig_CodeGen_Other_Func005Func004C())then
        set udg_EM_Target = GetEnumUnit()
        set udg_TargetPoint = GetUnitLoc(udg_EM_Target)
        call CreateDestructableLoc(0x42303141, udg_TargetPoint, 0.00, 0.30, 0)
        set udg_EM_Effect = GetLastCreatedDestructable()
        call RemoveLocation(udg_TargetPoint)
    else
    endif
endfunction

function Trig_CodeGen_Other_Func008Func002Func003Func001C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetEnumDestructable()) == 0x42303136))then
        return false
    endif
    return true
endfunction

function Trig_CodeGen_Other_Func008Func002Func003A takes nothing returns nothing
    if(Trig_CodeGen_Other_Func008Func002Func003Func001C())then
        set udg_Point = GetDestructableLoc(GetEnumDestructable())
        call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction

function Trig_CodeGen_Other_Func008Func007A takes nothing returns nothing
    if GetDestructableTypeId(GetEnumDestructable()) == 0x42303136 then
        set udg_Point = GetDestructableLoc(GetEnumDestructable())
        call CreateDestructableLoc(0x42303146, udg_Point, 270.00, 12.00, 0)
        call RemoveLocation(udg_Point)
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction

function Trig_CodeGen_Other_Func008C takes nothing returns boolean
    return udg_TierUnlocked == 2
endfunction

function Trig_CodeGen_Other_Func010Func001Func001C takes nothing returns boolean
    return udg_SecretUnlocked[bj_forLoopAIndex] == 1
endfunction

function Trig_CodeGen_Other_Func010Func001C takes nothing returns boolean
    return udg_ART[bj_forLoopAIndex] > 0
endfunction

function Trig_CodeGen_Other_Func011C takes nothing returns boolean
    return udg_ART[7] > 0
endfunction

function Trig_CodeGen_Other_Func012C takes nothing returns boolean
    return udg_ART[12] > 0
endfunction

function Trig_CodeGen_Other_Func013C takes nothing returns boolean
    return udg_ART[16] > 0
endfunction

function Trig_CodeGen_Other_Func015C takes nothing returns boolean
    return udg_AS_AbilityStudied[1] == 1
endfunction

function Trig_CodeGen_Other_Func016C takes nothing returns boolean
    return udg_AS_AbilityStudied[2] == 1
endfunction

function Trig_CodeGen_Other_Func017C takes nothing returns boolean
    return udg_AS_AbilityStudied[3] == 1
endfunction

function Trig_CodeGen_Other_Func018C takes nothing returns boolean
    return udg_AS_AbilityStudied[4] == 1
endfunction

function Trig_CodeGen_Other_Func019C takes nothing returns boolean
    return udg_AS_AbilityStudied[5] == 1
endfunction

function Trig_CodeGen_Other_Func020C takes nothing returns boolean
    return udg_AS_AbilityStudied[6] == 1
endfunction

function Trig_CodeGen_Other_Func021C takes nothing returns boolean
    return udg_AS_AbilityStudied[7] == 1
endfunction

function Trig_CodeGen_Other_Func022C takes nothing returns boolean
    return udg_AS_AbilityStudied[8] == 1
endfunction

function Trig_CodeGen_Other_Func023C takes nothing returns boolean
    return udg_AS_AbilityStudied[9] == 1
endfunction

function Trig_CodeGen_Other_Func024C takes nothing returns boolean
    return udg_AS_AbilityStudied[10] == 1
endfunction

function Trig_CodeGen_Other_Func025C takes nothing returns boolean
    return udg_AS_AbilityStudied[11] == 1
endfunction

function Trig_CodeGen_Other_Func026C takes nothing returns boolean
    return udg_AS_AbilityStudied[12] == 1
endfunction

function Trig_CodeGen_Other_Func029Func002Func004Func001Func001C takes nothing returns boolean
    return udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 3
endfunction

function Trig_CodeGen_Other_Func029Func002Func004Func001C takes nothing returns boolean
    return udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 2
endfunction

function Trig_CodeGen_Other_Func029Func002Func004C takes nothing returns boolean
    return udg_AS_Value[GetUnitUserData(GetEnumUnit())] == 1
endfunction

function Trig_CodeGen_Other_Func029Func002C takes nothing returns boolean
    return udg_AS_Value[GetUnitUserData(GetEnumUnit())] > 0
endfunction

function Trig_CodeGen_Other_Func029A takes nothing returns nothing
    set udg_Target = GetEnumUnit()
    if(Trig_CodeGen_Other_Func029Func002C())then
        set udg_Point = GetUnitLoc(udg_Target)
        call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
        call RemoveLocation(udg_Point)
        if(Trig_CodeGen_Other_Func029Func002Func004C())then
            set udg_MagneticField[1] = GetLastCreatedDestructable()
            set udg_AS_Logic[1] = true
            set udg_AS_SeriesNumber = 1
            call CreateTextTagUnitBJ("3", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[1] = GetLastCreatedTextTag()
        else
            if(Trig_CodeGen_Other_Func029Func002Func004Func001C())then
                set udg_MagneticField[2] = GetLastCreatedDestructable()
                set udg_AS_Logic[2] = true
                set udg_AS_SeriesNumber = 2
                call CreateTextTagUnitBJ("5", udg_Target, 0, 15.00, 100, 100, 100, 0)
                set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
            else
                if(Trig_CodeGen_Other_Func029Func002Func004Func001Func001C())then
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
    else
    endif
endfunction

function Trig_CodeGen_Other_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AugmentCost[bj_forLoopAIndex] = (udg_AugmentLevel[bj_forLoopAIndex] * 10)
        set udg_AugmentCost[bj_forLoopAIndex] = (udg_AugmentCost[bj_forLoopAIndex] + 50)
        if(Trig_CodeGen_Other_Func002Func003C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[1])
            set udg_Point = GetUnitLoc(gg_unit_h012_0012)
        else
            if(Trig_CodeGen_Other_Func002Func003Func001C())then
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[2])
                set udg_Point = GetUnitLoc(gg_unit_h012_0011)
            else
                call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, udg_AugmentLevel[3])
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
    if(Trig_CodeGen_Other_Func008C())then
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
        else
        endif
    endif
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if(Trig_CodeGen_Other_Func010Func001C())then
            set udg_Point = GetUnitLoc(udg_CC_SecretUnit[bj_forLoopAIndex])
            call CreateTextTagLocBJ(I2S(udg_ART[bj_forLoopAIndex]), udg_Point, (GetUnitFlyHeight(udg_CC_SecretUnit[bj_forLoopAIndex]) + 40.00), 10, 100, 100, 100, 0)
            call RemoveLocation(udg_Point)
            set udg_CC_SecretLevel[bj_forLoopAIndex] = GetLastCreatedTextTag()
            set udg_CC_SecretUnlocked[bj_forLoopAIndex] = true
            call ShowUnitShow(udg_CC_SecretUnit[bj_forLoopAIndex])
        else
            if(Trig_CodeGen_Other_Func010Func001Func001C())then
                set udg_CC_SecretUnlocked[bj_forLoopAIndex] = true
                call ShowUnitShow(udg_CC_SecretUnit[bj_forLoopAIndex])
            else
                set udg_CC_SecretUnlocked[bj_forLoopAIndex] = false
                call ShowUnitHide(udg_CC_SecretUnit[bj_forLoopAIndex])
            endif
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_CodeGen_Other_Func011C())then
        set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_ART[7]))
    else
    endif
    if(Trig_CodeGen_Other_Func012C())then
        set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_ART[12]))
    else
    endif
    if(Trig_CodeGen_Other_Func013C())then
        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, udg_ART[16])
        call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, udg_ART[16])
        call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, udg_ART[16])
    else
    endif
    if(Trig_CodeGen_Other_Func015C())then
        set udg_Target = gg_unit_h006_0081
        call RemoveDestructable(gg_dest_B003_2936)
        call ShowDestructableBJ(true, gg_dest_B00B_1355)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func016C())then
        set udg_Target = gg_unit_h006_0075
        call RemoveDestructable(gg_dest_B003_2937)
        call ShowDestructableBJ(true, gg_dest_B00B_1357)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func017C())then
        set udg_Target = gg_unit_h006_0077
        call RemoveDestructable(gg_dest_B003_2939)
        call ShowDestructableBJ(true, gg_dest_B00B_1354)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func018C())then
        set udg_Target = gg_unit_h006_0079
        call RemoveDestructable(gg_dest_B003_2941)
        call ShowDestructableBJ(true, gg_dest_B00B_1356)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func019C())then
        set udg_Target = gg_unit_h006_0082
        call RemoveDestructable(gg_dest_B003_2935)
        call ShowDestructableBJ(true, gg_dest_B00B_1366)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func020C())then
        set udg_Target = gg_unit_h006_0076
        call RemoveDestructable(gg_dest_B003_2938)
        call ShowDestructableBJ(true, gg_dest_B00B_1367)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func021C())then
        set udg_Target = gg_unit_h006_0078
        call RemoveDestructable(gg_dest_B003_2940)
        call ShowDestructableBJ(true, gg_dest_B00B_1389)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func022C())then
        set udg_Target = gg_unit_h006_0080
        call RemoveDestructable(gg_dest_B003_2942)
        call ShowDestructableBJ(true, gg_dest_B00B_1390)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func023C())then
        set udg_Target = gg_unit_h006_0071
        call RemoveDestructable(gg_dest_B003_2928)
        call ShowDestructableBJ(true, gg_dest_B00B_1359)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func024C())then
        set udg_Target = gg_unit_h006_0069
        call RemoveDestructable(gg_dest_B003_2929)
        call ShowDestructableBJ(true, gg_dest_B00B_1362)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func025C())then
        set udg_Target = gg_unit_h006_0073
        call RemoveDestructable(gg_dest_B003_2932)
        call ShowDestructableBJ(true, gg_dest_B00B_1361)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
    endif
    if(Trig_CodeGen_Other_Func026C())then
        set udg_Target = gg_unit_h006_0067
        call RemoveDestructable(gg_dest_B003_2930)
        call ShowDestructableBJ(true, gg_dest_B00B_1360)
        call ConditionalTriggerExecute(gg_trg_CodeGen_Abilities)
    else
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
