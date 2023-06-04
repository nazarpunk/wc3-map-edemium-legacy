function Trig_Sprint_Cast_Conditions takes nothing returns boolean
    return GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldon") or GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldoff")
endfunction

function Trig_Sprint_Cast_Actions takes nothing returns nothing
    if GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) == 0.00 then
        call CreateTextTagUnitBJ("Нет сил...", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
        call StartTimerBJ(udg_SprintTimer, false, 0.00)
    else
        if GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldon") then
            set udg_SprintLogic = true
            call SetUnitMoveSpeed(GetTriggerUnit(), (GetUnitMoveSpeed(GetTriggerUnit()) + 120.00))
            call EnableTrigger(gg_trg_Sprint_Energy)
            call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
            if udg_ART[19] > 0 then
                set udg_ChanceBlock = (udg_ChanceBlock + (3.00 * I2R(udg_ART[19])))
            endif
        else
            if GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldoff") then
                set udg_SprintLogic = false
                call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
                call DisableTrigger(gg_trg_Sprint_Energy)
                call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
                if udg_ART[19] > 0 then
                    set udg_ChanceBlock = (udg_ChanceBlock - (3.00 * I2R(udg_ART[19])))
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Sprint_Cast takes nothing returns nothing
    set gg_trg_Sprint_Cast = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Sprint_Cast, ArctUnit, EVENT_UNIT_ISSUED_ORDER)
    call TriggerAddCondition(gg_trg_Sprint_Cast, Condition(function Trig_Sprint_Cast_Conditions))
    call TriggerAddAction(gg_trg_Sprint_Cast, function Trig_Sprint_Cast_Actions)
endfunction
