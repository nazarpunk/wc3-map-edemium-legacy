
function Trig_Trees_Specialeffects_Actions takes nothing returns nothing
    call TriggerSleepAction(0.05)
    call AddSpecialEffectTargetUnitBJ("chest", gg_unit_h001_0037, "Stomp.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

function InitTrig_Trees_Specialeffects takes nothing returns nothing
    set gg_trg_Trees_Specialeffects = CreateTrigger()
    call TriggerAddAction(gg_trg_Trees_Specialeffects, function Trig_Trees_Specialeffects_Actions)
endfunction
