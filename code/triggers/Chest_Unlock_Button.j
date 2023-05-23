function Trig_Chest_Unlock_Button_Actions takes nothing returns nothing
    if GetClickedButton() == udg_ChestButtonEnergy then
        if GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) >= I2R(udg_ChestEnergy) then
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - I2R(udg_ChestEnergy)))
            if GetRandomInt(1, 10) <= 8 then
                call ConditionalTriggerExecute(gg_trg_Chest_Reward)
            else
                call CreateTextTagUnitBJ("Не получилось...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
            endif
        else
            call CreateTextTagUnitBJ("Нет сил...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
        endif
    else
        if GetClickedButton() == udg_ChestButtonKey then
            if GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) > 0 then
                call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 1))
                call ConditionalTriggerExecute(gg_trg_Chest_Reward)
            else
                call CreateTextTagUnitBJ("Нет ключей...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
            endif
        endif
    endif
    call DialogDisplayBJ(false, udg_ChestDialog, Player(0))
endfunction

function InitTrig_Chest_Unlock_Button takes nothing returns nothing
    set gg_trg_Chest_Unlock_Button = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Chest_Unlock_Button, udg_ChestDialog)
    call TriggerAddAction(gg_trg_Chest_Unlock_Button, function Trig_Chest_Unlock_Button_Actions)
endfunction
