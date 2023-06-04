function Trig_Creep_Exp_Actions takes nothing returns nothing
    if GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1 then
        call AddHeroXPSwapped(R2I((10.00 * udg_EX_Rate)), ArctUnit, false)
    else
        if GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1 then
            call AddHeroXPSwapped(R2I((20.00 * udg_EX_Rate)), ArctUnit, false)
        endif
    endif
endfunction

function InitTrig_Creep_Exp takes nothing returns nothing
    set gg_trg_Creep_Exp = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Exp, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Exp, function Trig_Creep_Exp_Actions)
endfunction