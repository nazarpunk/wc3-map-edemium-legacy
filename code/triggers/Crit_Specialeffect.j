function Trig_Crit_Specialeffect_Actions takes nothing returns nothing
    call CameraSetEQNoiseForPlayer(Player(0), 3.00)
    call TriggerSleepAction(0.15)
    call CameraClearNoiseForPlayer(Player(0))
endfunction

function InitTrig_Crit_Specialeffect takes nothing returns nothing
    set gg_trg_Crit_Specialeffect = CreateTrigger()
    call TriggerAddAction(gg_trg_Crit_Specialeffect, function Trig_Crit_Specialeffect_Actions)
endfunction