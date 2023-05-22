
function Trig_Boss_III_Phase_3_Init_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038))then
        return false
    endif
    if(not(GetUnitLifePercent(udg_EM_BossUnit) < 25.00))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Phase_3_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack1, "Смерть!", bj_TIMETYPE_ADD, 0, false)
    call UnitAddAbilityBJ(0x41303553, GetTriggerUnit())
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Boss_III_Phase_3_Init takes nothing returns nothing
    set gg_trg_Boss_III_Phase_3_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Phase_3_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_III_Phase_3_Init, Condition(function Trig_Boss_III_Phase_3_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Phase_3_Init, function Trig_Boss_III_Phase_3_Init_Actions)
endfunction