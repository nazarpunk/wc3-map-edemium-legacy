function Trig_Boss_II_Phase_2_Init_Conditions takes nothing returns boolean
    return GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047 and GetUnitLifePercent(udg_EM_BossUnit) < 50.00
endfunction

function Trig_Boss_II_Phase_2_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_HPitLordYesAttack2, "Час Хаоса!", bj_TIMETYPE_ADD, 0, false)
    call UnitAddAbilityBJ(0x41303553, GetTriggerUnit())
    call UnitRemoveAbilityBJ(0x4130354F, GetTriggerUnit())
    call EnableTrigger(gg_trg_Boss_II_Channel_Init)
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Boss_II_Phase_2_Init takes nothing returns nothing
    set gg_trg_Boss_II_Phase_2_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Phase_2_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Phase_2_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_II_Phase_2_Init, Condition(function Trig_Boss_II_Phase_2_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Phase_2_Init, function Trig_Boss_II_Phase_2_Init_Actions)
endfunction
