
function Trig_Events_Buttons_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 50))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true) >= udg_EventAttribute))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func002Func013C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func002C takes nothing returns boolean
    if(not(udg_EventSucces == true))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_EdemEventButton[2]))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_EdemEventButton[1]))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002C takes nothing returns boolean
    if(not(udg_EdemEventType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Actions takes nothing returns nothing
    set udg_EdemEventBool[udg_EdemEventType] = true
    if(Trig_Events_Buttons_Func002C())then
        if(Trig_Events_Buttons_Func002Func001C())then
            call DialogClearBJ(udg_EdemEventDialog)
            call DialogSetMessageBJ(udg_EdemEventDialog, "Просунув палец в отверстие, оно с |nгрохотом захлопывается, оставляя |nпалец Аркта навечно запечатанным|nв стене. Резкий крик боли разлета-|nется по залам Эдемиума, оглашая |nмонстров о присутствии незваного|nгостя. Истекая кровью и с пеленой|nна глазах, Аркт продолжает схватку|nс монстрами, с Эдемиумом и с|nсамим собой.")
            call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
            call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303450, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
        else
            if(Trig_Events_Buttons_Func002Func001Func001C())then
                if(Trig_Events_Buttons_Func002Func001Func001Func001C())then
                    set udg_EventSucces = true
                else
                    if(Trig_Events_Buttons_Func002Func001Func001Func001Func001C())then
                        set udg_EventSucces = true
                    else
                        set udg_EventSucces = false
                    endif
                endif
                if(Trig_Events_Buttons_Func002Func001Func001Func002C())then
                    call DialogClearBJ(udg_EdemEventDialog)
                    call DialogSetMessageBJ(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Пошарив немного вокруг |nон находит небольшой кусок деревян- |nной рукояти молота. Аркт отсёк |nлишнее мечем и засунул палку в |nотверстие. Оно захлопнулось, разло- |nмав отесанную рукоять пополам, од- |nнако рядом с Арктом появился |nтяжеленный сундук.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                    set udg_Point = GetUnitLoc(udg_Arct)
                    call CreateNUnitsAtLoc(1, 0x6E303046, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, 180.00)
                    if(Trig_Events_Buttons_Func002Func001Func001Func002Func013C())then
                        call SetUnitUserData(GetLastCreatedUnit(), 10)
                    else
                    endif
                else
                    call DialogClearBJ(udg_EdemEventDialog)
                    call DialogSetMessageBJ(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Он решает пошарить немно- |nго вокруг, однако найти что-нибудь |nподходящее так и не получилось. |nКругом только пыль, ржавое железо |nи старые кости.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Просунуть палец.")
                    set udg_EdemEventButton[1] = GetLastCreatedButtonBJ()
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Пройти мимо.")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                endif
            else
            endif
        endif
    else
    endif
endfunction
function InitTrig_Events_Buttons takes nothing returns nothing
    set gg_trg_Events_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Events_Buttons, udg_EdemEventDialog)
    call TriggerAddAction(gg_trg_Events_Buttons, function Trig_Events_Buttons_Actions)
endfunction