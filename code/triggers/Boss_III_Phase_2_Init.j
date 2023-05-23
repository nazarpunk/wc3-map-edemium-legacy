function Trig_Boss_III_Phase_2_Init_Conditions takes nothing returns boolean
    return GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038 and GetUnitLifePercent(udg_EM_BossUnit) < 50.00
endfunction

function Trig_Boss_III_Phase_2_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack2, "Убью!", bj_TIMETYPE_ADD, 0, false)
    set udg_Boss3Pukes = 0
    call EnableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call EnableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Boss_III_Phase_2_Init takes nothing returns nothing
    set gg_trg_Boss_III_Phase_2_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Phase_2_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Phase_2_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_III_Phase_2_Init, Condition(function Trig_Boss_III_Phase_2_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Phase_2_Init, function Trig_Boss_III_Phase_2_Init_Actions)
endfunction
