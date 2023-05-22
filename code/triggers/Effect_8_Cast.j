
function Trig_Effect_8_Cast_Func001C takes nothing returns boolean
    if(not(udg_BE_MaxIndex == 0))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Cast_Func010Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Cast_Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Cast_Func016Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Cast_Func018Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Cast_Func018A takes nothing returns nothing
    if(Trig_Effect_8_Cast_Func018Func001C())then
        set udg_BE_Target[udg_BE_MaxIndex] = GetEnumUnit()
    else
    endif
endfunction

function Trig_Effect_8_Cast_Actions takes nothing returns nothing
    if(Trig_Effect_8_Cast_Func001C())then
        call EnableTrigger(gg_trg_Effect_8_Loop)
    else
    endif
    set udg_BE_MaxIndex = (udg_BE_MaxIndex + 1)
    set udg_BE_Caster[udg_BE_MaxIndex] = udg_Arct
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
    call RemoveLocation(udg_Point)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(0))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(1))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(PLAYER_NEUTRAL_PASSIVE))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Effect_8_Cast_Func018A)
    call DestroyGroup(udg_UnitGroup)
    set udg_BE_AbilityIndex[udg_BE_MaxIndex] = udg_AS_AbilityLVL[8]
    set udg_BE_DistanceTravelled[udg_BE_MaxIndex] = 0.00
    set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    set udg_BE_Damage[udg_BE_MaxIndex] = udg_AbilityPower
    set udg_BE_Heal[udg_BE_MaxIndex] = udg_AbilityPower
    set udg_BE_SizeIncrement[udg_BE_MaxIndex] = udg_BE_CSizeIncrement
    set udg_BE_CurrentBounces[udg_BE_MaxIndex] = 0
    set udg_BE_Player[udg_BE_MaxIndex] = GetTriggerPlayer()
    set udg_BE_TempPoint2 = GetUnitLoc(udg_BE_Caster[udg_BE_MaxIndex])
    set udg_BE_TempPoint3 = GetUnitLoc(udg_BE_Target[udg_BE_MaxIndex])
    set udg_BE_Angle[udg_BE_MaxIndex] = AngleBetweenPoints(udg_BE_TempPoint2, udg_BE_TempPoint3)
    call CreateNUnitsAtLoc(1, udg_BE_DummyType, udg_BE_Player[udg_BE_MaxIndex], udg_BE_TempPoint2, udg_BE_Angle[udg_BE_MaxIndex])
    set udg_BE_Dummy[udg_BE_MaxIndex] = GetLastCreatedUnit()
    call AddSpecialEffectTargetUnitBJ("origin", udg_BE_Dummy[udg_BE_MaxIndex], udg_BE_Model)
    set udg_BE_FX[udg_BE_MaxIndex] = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_BE_TempPoint2)
    call RemoveLocation(udg_BE_TempPoint3)
endfunction

function InitTrig_Effect_8_Cast takes nothing returns nothing
    set gg_trg_Effect_8_Cast = CreateTrigger()
    call TriggerAddAction(gg_trg_Effect_8_Cast, function Trig_Effect_8_Cast_Actions)
endfunction
