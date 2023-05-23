function Trig_Boss_II_Channel_Init_Conditions takes nothing returns boolean
    return GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047
endfunction

function Trig_Boss_II_Channel_Init_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call StartTimerBJ(udg_Boss2Timer, false, 5.00)
    if GetRandomInt(1, 2) == 1 then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_PitLordYesAttack1, "*читает заклинание*", bj_TIMETYPE_ADD, 0, false)
    else
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_PitLordWhat1, "*читает заклинание*", bj_TIMETYPE_ADD, 0, false)
    endif
endfunction

function InitTrig_Boss_II_Channel_Init takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Channel_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Channel_Init, 10.00)
    call TriggerAddCondition(gg_trg_Boss_II_Channel_Init, Condition(function Trig_Boss_II_Channel_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Channel_Init, function Trig_Boss_II_Channel_Init_Actions)
endfunction
