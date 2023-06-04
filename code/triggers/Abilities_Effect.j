function Trig_Abilities_Effect_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Target)
    call DestroyEffect(udg_Starfall)
    call AddSpecialEffectLocBJ(udg_Point, "StarfallTarget.mdx")
    set udg_Starfall = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Abilities_Effect takes nothing returns nothing
    set gg_trg_Abilities_Effect = CreateTrigger()
    call DisableTrigger(gg_trg_Abilities_Effect)
    call TriggerAddAction(gg_trg_Abilities_Effect, function Trig_Abilities_Effect_Actions)
endfunction
