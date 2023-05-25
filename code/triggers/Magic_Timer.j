function Trig_Magic_Timer_Actions takes nothing returns nothing
    set udg_ChanceCrit = (udg_ChanceCrit - 5.00)
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    set udg_EnchantCritBool = false
endfunction

function InitTrig_Magic_Timer takes nothing returns nothing
    set gg_trg_Magic_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Magic_Timer, udg_EnchantCritTimer)
    call TriggerAddAction(gg_trg_Magic_Timer, function Trig_Magic_Timer_Actions)
endfunction