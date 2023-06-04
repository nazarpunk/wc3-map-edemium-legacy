function Trig_Hero_Levelup_Actions takes nothing returns nothing
    set udg_EX_LevelUp = (udg_EX_LevelUp + 1)
    call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "war3mapImported\\Holy_Retribution.mdx")
    call DestroyEffect(GetLastCreatedEffectBJ())
    call SetUnitManaPercentBJ(GetTriggerUnit(), 100)
    call SetUnitLifePercentBJ(GetTriggerUnit(), 100)
endfunction

function InitTrig_Hero_Levelup takes nothing returns nothing
    set gg_trg_Hero_Levelup = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Hero_Levelup, ArctUnit, EVENT_UNIT_HERO_LEVEL)
    call TriggerAddAction(gg_trg_Hero_Levelup, function Trig_Hero_Levelup_Actions)
endfunction