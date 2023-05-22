
function Trig_Izurods_Damage_Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) <= I2R(udg_RandomNumber)))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 70))then
        return false
    endif
    return true
endfunction

function Trig_Izurods_Damage_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_DamageEventTarget) == 0x6E30304F))then
        return false
    endif
    return true
endfunction

function Trig_Izurods_Damage_Func002C takes nothing returns boolean
    if(not(UnitHasBuffBJ(GetTriggerUnit(), 0x42486162) == true))then
        return false
    endif
    return true
endfunction

function Trig_Izurods_Damage_Actions takes nothing returns nothing
    if(Trig_Izurods_Damage_Func001C())then
        set udg_RandomNumber = (R2I(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit())) * 85)
        set udg_RandomNumber = (udg_RandomNumber / 100)
        if(Trig_Izurods_Damage_Func001Func003C())then
            call SetUnitUserData(GetTriggerUnit(), 71)
            call UnitRemoveBuffBJ(0x42303045, GetTriggerUnit())
            call ResetUnitAnimation(GetTriggerUnit())
            call AddSpecialEffectTargetUnitBJ("chest", GetTriggerUnit(), "war3mapImported\\StompRed.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
        endif
    else
    endif
    if(Trig_Izurods_Damage_Func002C())then
        call SetUnitManaBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 10.00))
    else
    endif
endfunction

function InitTrig_Izurods_Damage takes nothing returns nothing
    set gg_trg_Izurods_Damage = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Izurods_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddAction(gg_trg_Izurods_Damage, function Trig_Izurods_Damage_Actions)
endfunction
