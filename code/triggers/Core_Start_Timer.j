
function Trig_Core_Start_Timer_Actions takes nothing returns nothing
    call ShowUnitHide(gg_unit_h00F_0003)
    call StartTimerBJ(udg_CC_Timer, false, 3.00)
    set udg_Point = GetUnitLoc(gg_unit_h00F_0003)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\CoreCraft.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\LaserStrike.mdx")
    set udg_CC_Effect = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Core_Start_Timer takes nothing returns nothing
    set gg_trg_Core_Start_Timer = CreateTrigger()
    call TriggerAddAction(gg_trg_Core_Start_Timer, function Trig_Core_Start_Timer_Actions)
endfunction
