function Trig_Core_Timer_Actions takes nothing returns nothing
    set udg_ART[udg_CC_SecretNumber] = (udg_ART[udg_CC_SecretNumber] + 1)
    set udg_QG_Count[8] = (udg_QG_Count[8] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call DestroyTextTagBJ(udg_CC_SecretLevel[udg_CC_SecretNumber])
    set udg_Point = GetUnitLoc(udg_CC_SecretUnit[udg_CC_SecretNumber])
    call CreateTextTagLocBJ(I2S(udg_ART[udg_CC_SecretNumber]), udg_Point, (GetUnitFlyHeight(udg_CC_SecretUnit[udg_CC_SecretNumber]) + 40.00), 10, 100, 100, 100, 0)
    call RemoveLocation(udg_Point)
    set udg_CC_SecretLevel[udg_CC_SecretNumber] = GetLastCreatedTextTag()
    if udg_CC_SecretNumber == 7 then
        set udg_ChanceCrit = (udg_ChanceCrit + 1)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    endif
    if udg_CC_SecretNumber == 12 then
        set udg_ChanceBlock = (udg_ChanceBlock + 1)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
    endif
    if udg_CC_SecretNumber == 16 then
        call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, 1)
        call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, 1)
        call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, 1)
    endif
    call ShowUnitShow(gg_unit_h00F_0003)
    call DestroyEffect(udg_CC_Effect)
    set udg_Point = GetRectCenter(gg_rct_Core_Create)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffect(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    set udg_AutosaveBool = true
endfunction

function InitTrig_Core_Timer takes nothing returns nothing
    set gg_trg_Core_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Core_Timer, udg_CC_Timer)
    call TriggerAddAction(gg_trg_Core_Timer, function Trig_Core_Timer_Actions)
endfunction
