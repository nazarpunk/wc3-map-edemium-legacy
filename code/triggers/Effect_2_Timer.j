function Trig_Effect_2_Timer_Actions takes nothing returns nothing
    if udg_AS_Effect2 then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    endif
endfunction

function InitTrig_Effect_2_Timer takes nothing returns nothing
    set gg_trg_Effect_2_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_2_Timer, udg_AS_TimerEffect2)
    call TriggerAddAction(gg_trg_Effect_2_Timer, function Trig_Effect_2_Timer_Actions)
endfunction