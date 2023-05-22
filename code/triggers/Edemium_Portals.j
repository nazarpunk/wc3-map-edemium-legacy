
function Trig_Edemium_Portals_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303049))then
        return false
    endif
    if(not(GetTriggerUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Portals_Conditions takes nothing returns boolean
    if(not Trig_Edemium_Portals_Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Portals_Func006Func008Func004A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), udg_D_Point1)
endfunction

function Trig_Edemium_Portals_Func006Func008A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    call PanCameraToTimedLocForPlayer(Player(0), udg_D_Point1, 0)
    call SetUnitPositionLoc(udg_Arct, udg_D_Point1)
    call ForGroupBJ(udg_FollowersGroup, function Trig_Edemium_Portals_Func006Func008Func004A)
    call RemoveLocation(udg_D_Point1)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0.00, 50.00, 100.00, 0)
    call PlaySoundBJ(gg_snd_CatapultDeath1)
    call StartTimerBJ(udg_D_TimerPortals, false, 3.00)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function Trig_Edemium_Portals_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction

function Trig_Edemium_Portals_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6E303049)
    call GroupRemoveUnitSimple(GetOrderTargetUnit(), udg_D_Pick)
    set udg_D_Point1 = GetUnitLoc(udg_Arct)
    set udg_D_Point2 = GetUnitLoc(GetOrderTargetUnit())
    if(Trig_Edemium_Portals_Func006C())then
        call RemoveLocation(udg_D_Point1)
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Edemium_Portals_Func006Func008A)
    else
        call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
    call DestroyGroup(udg_D_Pick)
endfunction

function InitTrig_Edemium_Portals takes nothing returns nothing
    set gg_trg_Edemium_Portals = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Edemium_Portals, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Edemium_Portals, Condition(function Trig_Edemium_Portals_Conditions))
    call TriggerAddAction(gg_trg_Edemium_Portals, function Trig_Edemium_Portals_Actions)
endfunction
