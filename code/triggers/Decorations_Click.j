function Trig_Decorations_Click_Conditions takes nothing returns boolean
    local integer id = GetDestructableTypeId(GetOrderTargetDestructable())
    return id == 0x42303053 or id == 0x42303156 or id == 0x4230314B or id == 0x4230314C or id == 0x4230315A or id == 0x42303159 or id == 0x42303231
endfunction

function Trig_Decorations_Click_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetDestructableLoc(GetOrderTargetDestructable())
    if GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053 or GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303156 then
        if DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00 then
            call KillDestructable(GetOrderTargetDestructable())
            if GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053 then
                set udg_RandomNumber = GetRandomInt(2, 4)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
                if GetRandomInt(1, 10) <= 8 then
                    call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_D_Point2)
                endif
            endif

            if GetRandomInt(1, 20) == 20 then
                call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_D_Point2, GetRandomReal(0, 360.00))
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
        if DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00 then
            call ModifyGateBJ(bj_GATEOPERATION_OPEN, GetOrderTargetDestructable())
            if GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230315A or GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303159 then
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
                if GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303231 then
                    set udg_Point = GetUnitLoc(udg_Arct)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if udg_RandomNumber == 1 then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if udg_RandomNumber == 2 then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                endif
            endif
        else
            call IssuePointOrderLocBJ(udg_Arct, "move", udg_D_Point2)
            if GetRandomInt(1, 2) == 1 then
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
