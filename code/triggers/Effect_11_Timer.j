function Trig_Effect_11_Timer_Actions takes nothing returns nothing
    if udg_AS_Effect11 then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        call DestroyEffect(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(ArctUnit, 100.00, 100.00, 100, 0)
    endif
endfunction

function InitTrig_Effect_11_Timer takes nothing returns nothing
    set gg_trg_Effect_11_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_11_Timer, udg_AS_TimerEffect11)
    call TriggerAddAction(gg_trg_Effect_11_Timer, function Trig_Effect_11_Timer_Actions)
endfunction