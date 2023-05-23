
function Trig_Effect_11_Timer_Func001C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction

function Trig_Effect_11_Timer_Actions takes nothing returns nothing
    if(Trig_Effect_11_Timer_Func001C())then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    endif
endfunction

function InitTrig_Effect_11_Timer takes nothing returns nothing
    set gg_trg_Effect_11_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_11_Timer, udg_AS_TimerEffect11)
    call TriggerAddAction(gg_trg_Effect_11_Timer, function Trig_Effect_11_Timer_Actions)
endfunction
