function Trig_Izurods_Damage_Actions takes nothing returns nothing
    if GetUnitTypeId(udg_DamageEventTarget) == 0x6E30304F then
        set udg_RandomNumber = (R2I(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit())) * 85)
        set udg_RandomNumber = (udg_RandomNumber / 100)
        if GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) <= I2R(udg_RandomNumber) and GetUnitUserData(GetTriggerUnit()) == 70 then
            call SetUnitUserData(GetTriggerUnit(), 71)
            call UnitRemoveBuffBJ(0x42303045, GetTriggerUnit())
            call ResetUnitAnimation(GetTriggerUnit())
            call AddSpecialEffectTargetUnitBJ("chest", GetTriggerUnit(), "war3mapImported\\StompRed.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        endif
    endif
    if UnitHasBuffBJ(GetTriggerUnit(), 0x42486162) then
        call SetUnitManaBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 10.00))
    endif
endfunction

function InitTrig_Izurods_Damage takes nothing returns nothing
    set gg_trg_Izurods_Damage = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Izurods_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddAction(gg_trg_Izurods_Damage, function Trig_Izurods_Damage_Actions)
endfunction
