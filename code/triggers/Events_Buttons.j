function Trig_Events_Buttons_Actions takes nothing returns nothing
    set udg_EdemEventBool[udg_EdemEventType] = true
    if udg_EdemEventType == 1 then
        if GetClickedButton() == udg_EdemEventButton[1] then
            call DialogClear(udg_EdemEventDialog)
            call DialogSetMessage(udg_EdemEventDialog, "Просунув палец в отверстие, оно с |nгрохотом захлопывается, оставляя |nпалец Аркта навечно запечатанным|nв стене. Резкий крик боли разлета-|nется по залам Эдемиума, оглашая |nмонстров о присутствии незваного|nгостя. Истекая кровью и с пеленой|nна глазах, Аркт продолжает схватку|nс монстрами, с Эдемиумом и с|nсамим собой.")
            call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
            call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
            set udg_Point = GetUnitLoc(ArctUnit)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303450, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", ArctUnit)
        else
            if GetClickedButton() == udg_EdemEventButton[2] then
                if GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true) >= udg_EventAttribute then
                    set udg_EventSucces = true
                else
                    if GetRandomInt(1, 100) <= 50 then
                        set udg_EventSucces = true
                    else
                        set udg_EventSucces = false
                    endif
                endif
                if udg_EventSucces then
                    call DialogClear(udg_EdemEventDialog)
                    call DialogSetMessage(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Пошарив немного вокруг |nон находит небольшой кусок деревян- |nной рукояти молота. Аркт отсёк |nлишнее мечем и засунул палку в |nотверстие. Оно захлопнулось, разло- |nмав отесанную рукоять пополам, од- |nнако рядом с Арктом появился |nтяжеленный сундук.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                    set udg_Point = GetUnitLoc(ArctUnit)
                    call CreateNUnitsAtLoc(1, 0x6E303046, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, 180.00)
                    if GetRandomInt(1, 20) == 1 then
                        call SetUnitUserData(GetLastCreatedUnit(), 10)
                    endif
                else
                    call DialogClear(udg_EdemEventDialog)
                    call DialogSetMessage(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Он решает пошарить немно- |nго вокруг, однако найти что-нибудь |nподходящее так и не получилось. |nКругом только пыль, ржавое железо |nи старые кости.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Просунуть палец.")
                    set udg_EdemEventButton[1] = bj_lastCreatedButton
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Пройти мимо.")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Events_Buttons takes nothing returns nothing
    set gg_trg_Events_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Events_Buttons, udg_EdemEventDialog)
    call TriggerAddAction(gg_trg_Events_Buttons, function Trig_Events_Buttons_Actions)
endfunction
