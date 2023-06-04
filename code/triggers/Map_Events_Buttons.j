function Trig_Map_Events_Buttons_Actions takes nothing returns nothing
    if GetClickedButton() == udg_EventButton[1] then
        if GetHeroStatBJ(bj_HEROSTAT_STR, ArctUnit, true) >= udg_EventAttribute then
            set udg_EventSucces = true
        else
            set udg_EventSucces = GetRandomInt(1, 100) <= 50
        endif
    endif

    if GetClickedButton() == udg_EventButton[2] then
        if GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true) >= udg_EventAttribute then
            set udg_EventSucces = true
        else
            set udg_EventSucces = GetRandomInt(1, 100) <= 50
        endif
    endif

    if GetClickedButton() == udg_EventButton[3] then
        if GetHeroStatBJ(bj_HEROSTAT_AGI, ArctUnit, true) >= udg_EventAttribute then
            set udg_EventSucces = true
        else
            set udg_EventSucces = GetRandomInt(1, 100) <= 50
        endif
    endif

    if udg_EventSucces then
        call CreateTextTagUnitBJ("Успех!", udg_Target, 0, 10.00, 0.00, 100.00, 0.00, 0)
    else
        if udg_RandomNumber != 1 then
            call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) - udg_EventLux))
            call CreateTextTagUnitBJ("Неудача (часть Света пропала)...", udg_Target, 0, 10.00, 100.00, 0.00, 0.00, 0)
        endif
    endif
    set udg_EventSucces = false
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
endfunction

function InitTrig_Map_Events_Buttons takes nothing returns nothing
    set gg_trg_Map_Events_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Map_Events_Buttons, udg_EventDialog)
    call TriggerAddAction(gg_trg_Map_Events_Buttons, function Trig_Map_Events_Buttons_Actions)
endfunction
