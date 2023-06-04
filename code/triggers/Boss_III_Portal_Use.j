
function Trig_Boss_III_Portal_Use_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303048
endfunction

function Trig_Boss_III_Portal_Use_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    set udg_Point2 = GetUnitLoc(GetOrderTargetUnit())
    if DistanceBetweenPoints(udg_Point, udg_Point2) < 400.00 then
        set udg_Boss3Portal = GetOrderTargetUnit()
        call StartTimerBJ(udg_Boss3Timer, false, 2.00)
        call UnitAddAbilityBJ(0x41303631, ArctUnit)
        call IssueImmediateOrderBJ(ArctUnit, "tranquility")
        call SetUnitFacingToFaceUnitTimed(ArctUnit, GetOrderTargetUnit(), 0)
        call StartTimerBJ(udg_Boss3TimerOrder, false, 0.01)
        call EnableTrigger(gg_trg_Boss_III_Portal_Timer)
        call DestroyLightningBJ(udg_Boss3PortalEffect)
        call AddLightningLoc("HWSB", udg_Point, udg_Point2)
        set udg_Boss3PortalEffect = GetLastCreatedLightningBJ()
    else
        call IssuePointOrderLocBJ(ArctUnit, "move", udg_Point2)
        call CreateTextTagUnitBJ("Поближе бы...", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction

function InitTrig_Boss_III_Portal_Use takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Use)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Use, ArctUnit, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Boss_III_Portal_Use, Condition(function Trig_Boss_III_Portal_Use_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Portal_Use, function Trig_Boss_III_Portal_Use_Actions)
endfunction
