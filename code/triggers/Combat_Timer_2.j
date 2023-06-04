function Trig_Combat_Timer_2_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303445, ArctUnit)
    call DestroyEffectBJ(udg_CO_SweapEffect[1])
    call DestroyEffectBJ(udg_CO_SweapEffect[2])
endfunction

function InitTrig_Combat_Timer_2 takes nothing returns nothing
    set gg_trg_Combat_Timer_2 = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combat_Timer_2, udg_CO_CombatTimer2)
    call TriggerAddAction(gg_trg_Combat_Timer_2, function Trig_Combat_Timer_2_Actions)
endfunction
