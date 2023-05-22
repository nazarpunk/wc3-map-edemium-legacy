function Trig_Map_Events_Func005Func001Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005Func001Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005Func001Func002Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005Func001Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Func005C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Map_Events_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 4)
    set udg_EventAttribute = (10 + GetHeroLevel(udg_Arct))
    set udg_EventLux = (udg_EventAttribute * 3)
    call DialogClearBJ(udg_EventDialog)
    if(Trig_Map_Events_Func005C())then
        call DialogSetMessageBJ(udg_EventDialog, "О чем-то глубого задумавшись,|nя только спустя несколько часов|nосознал, что всё это время шёл|nнепонятно куда. Точно не туда,|nкуда хотел. Чёрт, это безыдейное|nблуждание чревато проблемами.")
        call DialogAddButtonBJ(udg_EventDialog, "И где я!?")
        set udg_EM_Encounter = true
        call ConditionalTriggerExecute(gg_trg_Map_Move)
    else
        if(Trig_Map_Events_Func005Func001C())then
            if(Trig_Map_Events_Func005Func001Func001C())then
                call DialogSetMessageBJ(udg_EventDialog, "На полпути коридор с обеих |nсторон завалило непонятно |nоткуда свалившимися камнями;|nя в ловушке. Могу попробовать |nразгрести завал, но у меня |nможет не хватить сил. Чем |nдольше я тут - тем хуже.")
                call DialogAddButtonBJ(udg_EventDialog, ("Разгрести (необходимо " + (I2S(udg_EventAttribute) + " стойкости).")))
            else
                call DialogSetMessageBJ(udg_EventDialog, "Прямо напротив одной из|nдверей подземелья стоит|nогромный валун. Наверняка|nего прикатил кто-то очень|nбольшой. Очень мило с его |nстороны, но теперь мне|nпридётся откатывать валун|nв сторону, если я планирую |nидти дальше.")
                call DialogAddButtonBJ(udg_EventDialog, ("Откатить (необходимо " + (I2S(udg_EventAttribute) + " стойкости).")))
            endif
            set udg_EventButton[1] = GetLastCreatedButtonBJ()
        else
            if(Trig_Map_Events_Func005Func001Func002C())then
                if(Trig_Map_Events_Func005Func001Func002Func001C())then
                    call DialogSetMessageBJ(udg_EventDialog, "В конце коридора стоят две двери. |nОдна из них - та, что мне нужна, |nтолько вот какая из них? Что-то |nмне подсказывает, что открыв |nодну дверь - вторая уже не |nподдастся.")
                    call DialogAddButtonBJ(udg_EventDialog, ("Изучить (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
                else
                    call DialogSetMessageBJ(udg_EventDialog, "Какой-то странный парень|n(откуда он взялся?) в капюшоне |nпредлагает мне отгадать одну|nиз его загадок. Если у меня|nполучится, то он обещает не|nотбирать у меня Свет. Что же,|nя уверен в своих умственных|nсилах; можно попробовать.")
                    call DialogAddButtonBJ(udg_EventDialog, ("Отгадать (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
                endif
                set udg_EventButton[2] = GetLastCreatedButtonBJ()
            else
                if(Trig_Map_Events_Func005Func001Func002Func002C())then
                    if(Trig_Map_Events_Func005Func001Func002Func002Func001C())then
                        call DialogSetMessageBJ(udg_EventDialog, "Кто-то явно обо мне заботится.|nВесь коридор впереди устлан|nраскачивающимися ловушками|nс недавно заостренными лезвиями|n(если верить ярким отблескам |nметалла). Не очень хочется туда|nлезть, но у меня нет выбора.")
                        call DialogAddButtonBJ(udg_EventDialog, ("Пройти (необходимо " + (I2S(udg_EventAttribute) + " ловкости).")))
                    else
                        call DialogSetMessageBJ(udg_EventDialog, "Мне кажется, или сзади |nприближается что-то огромное… |nи оно, судя по всему, катится... |nКатится!? Это огромный |nвалун, что-ли!?")
                        call DialogAddButtonBJ(udg_EventDialog, ("Бежать! (необходимо " + (I2S(udg_EventAttribute) + " ловкости).")))
                    endif
                    set udg_EventButton[3] = GetLastCreatedButtonBJ()
                else
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