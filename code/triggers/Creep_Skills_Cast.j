
function Trig_Creep_Skills_Cast_Func004C takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303039))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303053))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303134))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Conditions takes nothing returns boolean
    if(not Trig_Creep_Skills_Cast_Func004C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003Func006C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E30305A))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x4972626B))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x58626C6D))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x56737470))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001Func007C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303054))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303551))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303231))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303639))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130354A))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303232))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func002C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303139))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303456))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Cast_Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Cast_Func005Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Actions takes nothing returns nothing
    set udg_Combat = true
    call StartTimerBJ(udg_CO_CombatTimer, false, 6.50)
    call EnableTrigger(gg_trg_Combo_Ability_Use)
    if(Trig_Creep_Skills_Cast_Func005C())then
        call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        set udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())] = GetUnitLoc(GetSpellTargetUnit())
        call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
        call AddSpecialEffectTargetUnitBJ("hand right", GetTriggerUnit(), "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
        set udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())] = GetLastCreatedEffectBJ()
    else
        if(Trig_Creep_Skills_Cast_Func005Func001C())then
            call RemoveLocation(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            set udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())] = GetUnitLoc(GetSpellTargetUnit())
            call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
            call AddSpecialEffectTargetUnitBJ("hand right", GetTriggerUnit(), "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
            set udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())] = GetLastCreatedEffectBJ()
        else
            if(Trig_Creep_Skills_Cast_Func005Func001Func007C())then
                call IssueImmediateOrderBJ(GetTriggerUnit(), "whirlwind")
                call IssueTargetOrderBJ(GetTriggerUnit(), "smart", udg_Arct)
            else
                if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    set udg_Point2 = PolarProjectionBJ(udg_Point, 350.00, GetRandomDirectionDeg())
                    if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003C())then
                        call SetUnitPositionLoc(GetTriggerUnit(), udg_Point2)
                        call AddSpecialEffectLocBJ(udg_Point2, "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003Func006C())then
                            call CreateNUnitsAtLoc(1, 0x6830314B, Player(11), udg_Point, bj_UNIT_FACING)
                        else
                            call CreateNUnitsAtLoc(1, 0x6830314C, Player(11), udg_Point, bj_UNIT_FACING)
                        endif
                        call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
                        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
                    else
                        call UnitResetCooldown(GetTriggerUnit())
                        call IssuePointOrderLocBJ(GetTriggerUnit(), "move", udg_Point)
                    endif
                    call RemoveLocation(udg_Point)
                    call RemoveLocation(udg_Point2)
                else
                    if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007C())then
                        call GroupAddUnitSimple(GetTriggerUnit(), udg_FallenGroup)
                        call EnableTrigger(gg_trg_Creep_Fallen_Spawn)
                    else
                        if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001C())then
                            set udg_CO_Point = GetUnitLoc(GetSpellAbilityUnit())
                            set udg_CO_Point2 = PolarProjectionBJ(udg_CO_Point, 70.00, GetRandomDirectionDeg())
                            call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_CO_Point2, bj_UNIT_FACING)
                            call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
                            call RemoveLocation(udg_CO_Point)
                            call RemoveLocation(udg_CO_Point2)
                            if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001Func007C())then
                                call SetUnitManaBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 15.00))
                            else
                            endif
                        else
                        endif
                    endif
                endif
            endif
        endif
    endif
    call CreateTextTagUnitBJ("!!!", GetTriggerUnit(), 0, 16.00, 100.00, 0.00, 0.00, 0)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 30.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.80)
endfunction
function InitTrig_Creep_Skills_Cast takes nothing returns nothing
    set gg_trg_Creep_Skills_Cast = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Skills_Cast, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Creep_Skills_Cast, Condition(function Trig_Creep_Skills_Cast_Conditions))
    call TriggerAddAction(gg_trg_Creep_Skills_Cast, function Trig_Creep_Skills_Cast_Actions)
endfunction