
function Trig_Creep_Skills_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30304A))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30304E))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303133))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303041))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func005Func002Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303033))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func005Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004Func004Func001C takes nothing returns boolean
    if(not(udg_CreepSpellType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004Func004C takes nothing returns boolean
    if(not(udg_CreepSpellType == 2))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004C takes nothing returns boolean
    if(not(udg_CreepSpellType == 4))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008C takes nothing returns boolean
    if(not(udg_CreepSpellType == 3))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func002C takes nothing returns boolean
    if(not(udg_CreepSpellType == 4))then
        return false
    endif
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func005C takes nothing returns boolean
    if(not(udg_CreepSpellType == 3))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func010Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func010Func001C())then
        set udg_AbilityPower = (40.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
        if(Trig_Creep_Skills_Func003Func010Func001Func005C())then
            set udg_Point = GetUnitLoc(GetEnumUnit())
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303143, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "entanglingroots", udg_Arct)
            call RemoveLocation(udg_Point)
        else
        endif
    else
        if(Trig_Creep_Skills_Func003Func010Func001Func002C())then
            set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
            call SetUnitLifeBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + udg_AbilityPower))
        else
        endif
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002Func003C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 73))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 72))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 71))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001C())then
        set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303641))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001C())then
        set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303356))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303541))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func002C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x4130354C))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303546))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func011C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303546))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func006Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func006Func001C())then
        set udg_AbilityPower = (60.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x41303457, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "roar")
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303456))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303030))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303052))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004Func007C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func004Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func005Func007C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303050))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303132))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func005Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func006Func001C())then
        set udg_AbilityPower = (60.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        if(Trig_Creep_Skills_Func003Func012Func006Func001Func004C())then
            set udg_Point = GetUnitLoc(GetEnumUnit())
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303230, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", GetEnumUnit())
            if(Trig_Creep_Skills_Func003Func012Func006Func001Func004Func007C())then
                call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0.00, 70.00, 100.00, 0.00)
            else
            endif
            call RemoveLocation(udg_Point)
        else
        endif
        if(Trig_Creep_Skills_Func003Func012Func006Func001Func005C())then
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303637, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
        else
        endif
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303232))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303139))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Actions takes nothing returns nothing
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
    if(Trig_Creep_Skills_Func003C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call RemoveLocation(udg_Point)
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        if(Trig_Creep_Skills_Func003Func005C())then
            call UnitAddAbilityBJ(0x41303355, GetLastCreatedUnit())
            set udg_CreepSpellType = 1
        else
            if(Trig_Creep_Skills_Func003Func005Func002C())then
                call UnitAddAbilityBJ(0x4130334E, GetLastCreatedUnit())
                set udg_CreepSpellType = 2
            else
                if(Trig_Creep_Skills_Func003Func005Func002Func001C())then
                    call UnitAddAbilityBJ(0x41303142, GetLastCreatedUnit())
                    set udg_CreepSpellType = 3
                else
                    if(Trig_Creep_Skills_Func003Func005Func002Func001Func002C())then
                        call UnitAddAbilityBJ(0x41303545, GetLastCreatedUnit())
                        set udg_CreepSpellType = 4
                    else
                    endif
                endif
            endif
        endif
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        call TriggerSleepAction(0.70)
        if(Trig_Creep_Skills_Func003Func008C())then
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(140.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        else
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
            if(Trig_Creep_Skills_Func003Func008Func004C())then
                call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
                if(Trig_Creep_Skills_Func003Func008Func004Func004C())then
                    call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "war3mapImported\\ShadowAssault.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                    if(Trig_Creep_Skills_Func003Func008Func004Func004Func001C())then
                        call SetTerrainTypeBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], 0x43706F73, - 1, 1, 0)
                    else
                    endif
                endif
            endif
        endif
        call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func010A)
        call DestroyGroup(udg_UnitGroup)
    else
        if(Trig_Creep_Skills_Func003Func012C())then
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            call AddSpecialEffectLocBJ(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Orc\\FeralSpirit\\feralspirittarget.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call RemoveLocation(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func006A)
            call DestroyGroup(udg_UnitGroup)
        else
            if(Trig_Creep_Skills_Func003Func012Func001C())then
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(120.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
                call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Orc\\FeralSpirit\\feralspirittarget.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call SetUnitPositionLoc(GetTriggerUnit(), udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
                call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func006A)
                call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
            else
                if(Trig_Creep_Skills_Func003Func012Func001Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
                    call UnitApplyTimedLifeBJ(3.00, 0x42544C46, GetLastCreatedUnit())
                    set udg_Point2 = GetUnitLoc(GetSpellTargetUnit())
                    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
                    call RemoveLocation(udg_Point)
                    call RemoveLocation(udg_Point2)
                    if(Trig_Creep_Skills_Func003Func012Func001Func001Func011C())then
                        set udg_BL_Idol = true
                    else
                        set udg_BL_Idol = false
                    endif
                else
                    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001C())then
                        if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001C())then
                            call SetUnitUserData(GetTriggerUnit(), 72)
                            call UnitAddAbilityBJ(0x41303535, GetTriggerUnit())
                        else
                            if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002C())then
                                call SetUnitUserData(GetTriggerUnit(), 73)
                                call UnitRemoveAbilityBJ(0x41303535, GetTriggerUnit())
                                call UnitAddAbilityBJ(0x41303536, GetTriggerUnit())
                            else
                                if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002Func003C())then
                                    call UnitRemoveAbilityBJ(0x41303536, GetTriggerUnit())
                                    call UnitAddAbilityBJ(0x41303539, GetTriggerUnit())
                                else
                                endif
                            endif
                        endif
                    else
                        if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002C())then
                            set udg_Point = GetUnitLoc(GetTriggerUnit())
                            call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, 2, 0)
                            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Blight Missile.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Point)
                            call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007A)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001C())then
                                set udg_Point = GetUnitLoc(GetTriggerUnit())
                                set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Point)
                                call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003A)
                                call RemoveLocation(udg_Point)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Creep_Skills takes nothing returns nothing
    set gg_trg_Creep_Skills = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Skills, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Creep_Skills, Condition(function Trig_Creep_Skills_Conditions))
    call TriggerAddAction(gg_trg_Creep_Skills, function Trig_Creep_Skills_Actions)
endfunction