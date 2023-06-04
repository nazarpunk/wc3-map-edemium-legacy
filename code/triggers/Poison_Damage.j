function Trig_Poison_Damage_Func001A takes nothing returns nothing
    call UnitDamageTargetBJ(ArctUnit, GetEnumUnit(), I2R(udg_CO_Power), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
endfunction

function Trig_Poison_Damage_Actions takes nothing returns nothing
    call ForGroupBJ(udg_PoisonGroup, function Trig_Poison_Damage_Func001A)
endfunction

function InitTrig_Poison_Damage takes nothing returns nothing
    set gg_trg_Poison_Damage = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Poison_Damage, 1.00)
    call TriggerAddAction(gg_trg_Poison_Damage, function Trig_Poison_Damage_Actions)
endfunction
