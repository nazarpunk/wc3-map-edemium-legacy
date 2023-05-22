
function Trig_Decorations_Click_Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303231))then
        return true
    endif
    return false
endfunction

function Trig_Decorations_Click_Conditions takes nothing returns boolean
    if(not Trig_Decorations_Click_Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001Func008Func001Func003Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001Func008Func001Func003C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001Func008Func001C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303231))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001Func008Func013C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303159))then
        return true
    endif
    return false
endfunction

function Trig_Decorations_Click_Func004Func001Func008C takes nothing returns boolean
    if(not Trig_Decorations_Click_Func004Func001Func008Func013C())then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func001C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func002Func003Func005C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 8))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func002Func003C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func002Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 20))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func002C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Func004Func003C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303156))then
        return true
    endif
    return false
endfunction

function Trig_Decorations_Click_Func004C takes nothing returns boolean
    if(not Trig_Decorations_Click_Func004Func003C())then
        return false
    endif
    return true
endfunction

function Trig_Decorations_Click_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetDestructableLoc(GetOrderTargetDestructable())
    if(Trig_Decorations_Click_Func004C())then
        if(Trig_Decorations_Click_Func004Func002C())then
            call KillDestructable(GetOrderTargetDestructable())
            if(Trig_Decorations_Click_Func004Func002Func003C())then
                set udg_RandomNumber = GetRandomInt(2, 4)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
                if(Trig_Decorations_Click_Func004Func002Func003Func005C())then
                    call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_D_Point2)
                else
                endif
            endif
            if(Trig_Decorations_Click_Func004Func002Func004C())then
                call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_D_Point2, GetRandomReal(0, 360.00))
            else
            endif
        else
            call IssuePointOrderLocBJ(udg_Arct, "move", udg_D_Point2)
            call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
    else
        if(Trig_Decorations_Click_Func004Func001C())then
            call ModifyGateBJ(bj_GATEOPERATION_OPEN, GetOrderTargetDestructable())
            if(Trig_Decorations_Click_Func004Func001Func008C())then
                call CreateTextTagUnitBJ("ЛОВУШКА!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
                set udg_Point = GetDestructableLoc(GetOrderTargetDestructable())
                call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x4130344C, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(2.50, 0x42544C46, GetLastCreatedUnit())
                call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
            else
                if(Trig_Decorations_Click_Func004Func001Func008Func001C())then
                    set udg_Point = GetUnitLoc(udg_Arct)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if(Trig_Decorations_Click_Func004Func001Func008Func001Func003C())then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if(Trig_Decorations_Click_Func004Func001Func008Func001Func003Func001C())then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                else
                endif
            endif
        else
            call IssuePointOrderLocBJ(udg_Arct, "move", udg_D_Point2)
            if(Trig_Decorations_Click_Func004Func001Func002C())then
                call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            else
                call CreateTextTagUnitBJ("Слишком далеко.", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            endif
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
endfunction

function InitTrig_Decorations_Click takes nothing returns nothing
    set gg_trg_Decorations_Click = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Decorations_Click, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Decorations_Click, Condition(function Trig_Decorations_Click_Conditions))
    call TriggerAddAction(gg_trg_Decorations_Click, function Trig_Decorations_Click_Actions)
endfunction
