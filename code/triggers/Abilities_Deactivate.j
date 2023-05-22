
function Trig_Abilities_Deactivate_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303649))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 1))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303649, GetTriggerUnit())
    call UnitAddAbilityBJ(0x4130364A, udg_Target)
    call UnitAddAbilityBJ(0x4130364B, udg_Target)
    call UnitAddAbilityBJ(0x4130364C, udg_Target)
    call UnitAddAbilityBJ(0x4130364D, udg_Target)
    if(Trig_Abilities_Deactivate_Func006C())then
        call RemoveDestructable(udg_MagneticField[1])
        call DestroyTextTagBJ(udg_AS_TextNumber[1])
        set udg_AS_Logic[1] = false
        set udg_AS_Effect[1] = 0
    else
        if(Trig_Abilities_Deactivate_Func006Func001C())then
            call RemoveDestructable(udg_MagneticField[2])
            call DestroyTextTagBJ(udg_AS_TextNumber[2])
            set udg_AS_Logic[2] = false
            set udg_AS_Effect[2] = 0
        else
            if(Trig_Abilities_Deactivate_Func006Func001Func001C())then
                call RemoveDestructable(udg_MagneticField[3])
                call DestroyTextTagBJ(udg_AS_TextNumber[3])
                set udg_AS_Logic[3] = false
                set udg_AS_Effect[3] = 0
            else
                if(Trig_Abilities_Deactivate_Func006Func001Func001Func001C())then
                    call RemoveDestructable(udg_MagneticField[4])
                    call DestroyTextTagBJ(udg_AS_TextNumber[4])
                    set udg_AS_Logic[4] = false
                    set udg_AS_Effect[4] = 0
                else
                endif
            endif
        endif
    endif
    set udg_AS_Value[GetUnitUserData(udg_Target)] = 0
endfunction
function InitTrig_Abilities_Deactivate takes nothing returns nothing
    set gg_trg_Abilities_Deactivate = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Deactivate, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Deactivate, Condition(function Trig_Abilities_Deactivate_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Deactivate, function Trig_Abilities_Deactivate_Actions)
endfunction