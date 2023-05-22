
function Trig_Creep_Exp_Func001Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Exp_Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Exp_Actions takes nothing returns nothing
    if(Trig_Creep_Exp_Func001C())then
        call AddHeroXPSwapped(R2I((10.00 * udg_EX_Rate)), udg_Arct, false)
    else
        if(Trig_Creep_Exp_Func001Func001C())then
            call AddHeroXPSwapped(R2I((20.00 * udg_EX_Rate)), udg_Arct, false)
        else
        endif
    endif
endfunction
function InitTrig_Creep_Exp takes nothing returns nothing
    set gg_trg_Creep_Exp = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Exp, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Exp, function Trig_Creep_Exp_Actions)
endfunction