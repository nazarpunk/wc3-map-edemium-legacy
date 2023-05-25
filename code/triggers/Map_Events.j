function Trig_Map_Events_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 4)
    set udg_EventAttribute = (10 + GetHeroLevel(udg_Arct))
    set udg_EventLux = (udg_EventAttribute * 3)
    call DialogClear(udg_EventDialog)
    if udg_RandomNumber == 1 then
        call DialogSetMessage(udg_EventDialog, "О чем-то глубого задумавшись,|nя только спустя несколько часов|nосознал, что всё это время шёл|nнепонятно куда. Точно не туда,|nкуда хотел. Чёрт, это безыдейное|nблуждание чревато проблемами.")
        call DialogAddButtonBJ(udg_EventDialog, "И где я!?")
        set udg_EM_Encounter = true
        call ConditionalTriggerExecute(gg_trg_Map_Move)
    else
        if udg_RandomNumber == 2 then
            if GetRandomInt(1, 2) == 1 then
                call DialogSetMessage(udg_EventDialog, "На полпути коридор с обеих |nсторон завалило непонятно |nоткуда свалившимися камнями;|nя в ловушке. Могу попробовать |nразгрести завал, но у меня |nможет не хватить сил. Чем |nдольше я тут - тем хуже.")
                call DialogAddButtonBJ(udg_EventDialog, ("Разгрести (необходимо " + (I2S(udg_EventAttribute) + " стойкости).")))
            else
                call DialogSetMessage(udg_EventDialog, "Прямо напротив одной из|nдверей подземелья стоит|nогромный валун. Наверняка|nего прикатил кто-то очень|nбольшой. Очень мило с его |nстороны, но теперь мне|nпридётся откатывать валун|nв сторону, если я планирую |nидти дальше.")
                call DialogAddButtonBJ(udg_EventDialog, ("Откатить (необходимо " + (I2S(udg_EventAttribute) + " стойкости).")))
            endif
            set udg_EventButton[1] = bj_lastCreatedButton
        else
            if udg_RandomNumber == 3 then
                if GetRandomInt(1, 2) == 1 then
                    call DialogSetMessage(udg_EventDialog, "В конце коридора стоят две двери. |nОдна из них - та, что мне нужна, |nтолько вот какая из них? Что-то |nмне подсказывает, что открыв |nодну дверь - вторая уже не |nподдастся.")
                    call DialogAddButtonBJ(udg_EventDialog, ("Изучить (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
                else
                    call DialogSetMessage(udg_EventDialog, "Какой-то странный парень|n(откуда он взялся?) в капюшоне |nпредлагает мне отгадать одну|nиз его загадок. Если у меня|nполучится, то он обещает не|nотбирать у меня Свет. Что же,|nя уверен в своих умственных|nсилах; можно попробовать.")
                    call DialogAddButtonBJ(udg_EventDialog, ("Отгадать (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
                endif
                set udg_EventButton[2] = bj_lastCreatedButton
            else
                if udg_RandomNumber == 4 then
                    if GetRandomInt(1, 2) == 1 then
                        call DialogSetMessage(udg_EventDialog, "Кто-то явно обо мне заботится.|nВесь коридор впереди устлан|nраскачивающимися ловушками|nс недавно заостренными лезвиями|n(если верить ярким отблескам |nметалла). Не очень хочется туда|nлезть, но у меня нет выбора.")
                        call DialogAddButtonBJ(udg_EventDialog, ("Пройти (необходимо " + (I2S(udg_EventAttribute) + " ловкости).")))
                    else
                        call DialogSetMessage(udg_EventDialog, "Мне кажется, или сзади |nприближается что-то огромное… |nи оно, судя по всему, катится... |nКатится!? Это огромный |nвалун, что-ли!?")
                        call DialogAddButtonBJ(udg_EventDialog, ("Бежать! (необходимо " + (I2S(udg_EventAttribute) + " ловкости).")))
                    endif
                    set udg_EventButton[3] = bj_lastCreatedButton
                endif
            endif
        endif
    endif
    call DialogDisplayBJ(true, udg_EventDialog, Player(0))
endfunction

function InitTrig_Map_Events takes nothing returns nothing
    set gg_trg_Map_Events = CreateTrigger()
    call TriggerAddAction(gg_trg_Map_Events, function Trig_Map_Events_Actions)
endfunction