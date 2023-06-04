function Trig_Combo_Spawn_Timer_Conditions takes nothing returns boolean
    return GetAttacker() == ArctUnit
endfunction

function Trig_Combo_Spawn_Timer_Actions takes nothing returns nothing
    set udg_ComboSpawnAllowed = true
    call StartTimerBJ(udg_ComboSpawnTimer, false, 3.00)
endfunction

function InitTrig_Combo_Spawn_Timer takes nothing returns nothing
    set gg_trg_Combo_Spawn_Timer = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Combo_Spawn_Timer, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Timer, Condition(function Trig_Combo_Spawn_Timer_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Timer, function Trig_Combo_Spawn_Timer_Actions)
endfunction