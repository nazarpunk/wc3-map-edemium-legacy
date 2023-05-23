function Trig_Map_Events_Buttons_Func001Func001Func001Func001Func001C takes nothing returns boolean
    return GetRandomInt(1, 100) <= 50
endfunction

function Trig_Map_Events_Buttons_Func001Func001Func001Func001C takes nothing returns boolean
    return GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) >= udg_EventAttribute
endfunction

function Trig_Map_Events_Buttons_Func001Func001Func001C takes nothing returns boolean
    return GetClickedButton() == udg_EventButton[3]
endfunction

function Trig_Map_Events_Buttons_Func001Func001Func002C takes nothing returns boolean
    return GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true) >= udg_EventAttribute
endfunction

function Trig_Map_Events_Buttons_Func001Func001C takes nothing returns boolean
    return GetClickedButton() == udg_EventButton[2]
endfunction

function Trig_Map_Events_Buttons_Func001Func002Func001C takes nothing returns boolean
    return GetRandomInt(1, 100) <= 50
endfunction

function Trig_Map_Events_Buttons_Func001Func002C takes nothing returns boolean
    return GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true) >= udg_EventAttribute
endfunction

function Trig_Map_Events_Buttons_Func001C takes nothing returns boolean
    return GetClickedButton() == udg_EventButton[1]
endfunction

function Trig_Map_Events_Buttons_Func002Func001C takes nothing returns boolean
    return udg_RandomNumber != 1
endfunction

function Trig_Map_Events_Buttons_Func002C takes nothing returns boolean
    return udg_EventSucces == true
endfunction

function Trig_Map_Events_Buttons_Actions takes nothing returns nothing
    if(Trig_Map_Events_Buttons_Func001C())then
        if(Trig_Map_Events_Buttons_Func001Func002C())then
            set udg_EventSucces = true
        else
            if(Trig_Map_Events_Buttons_Func001Func002Func001C())then
                set udg_EventSucces = true
            else
                set udg_EventSucces = false
            endif
        endif
    else
        if(Trig_Map_Events_Buttons_Func001Func001C())then
            if(Trig_Map_Events_Buttons_Func001Func001Func002C())then
                set udg_EventSucces = true
            else
                set udg_EventSucces = GetRandomInt(1, 100) <= 50
            endif
        else
            if(Trig_Map_Events_Buttons_Func001Func001Func001C())then
                if(Trig_Map_Events_Buttons_Func001Func001Func001Func001C())then
                    set udg_EventSucces = true
                else
                    if(Trig_Map_Events_Buttons_Func001Func001Func001Func001Func001C())then
                        set udg_EventSucces = true
                    else
                        set udg_EventSucces = false
                    endif
                endif
            endif
        endif
    endif
    if(Trig_Map_Events_Buttons_Func002C())then
        call CreateTextTagUnitBJ("Успех!", udg_Target, 0, 10.00, 0.00, 100.00, 0.00, 0)
    else
        if(Trig_Map_Events_Buttons_Func002Func001C())then
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
