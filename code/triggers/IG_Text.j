
function Trig_IG_Text_Conditions takes nothing returns boolean
    return GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED
endfunction

function Trig_IG_Text_Actions takes nothing returns nothing
    if not udg_IG_InfoBool then
        set udg_IG_InfoItem = GetManipulatedItem()
    else
        set udg_IG_InfoBool = false
    endif
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 4, 4))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 6, 6))
    if GetItemLevel(udg_IG_InfoItem) == 4 then
        set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 5, 5))
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 9, 9))
        if udg_IG_ItemValue[1] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Стойкость +" + I2S(udg_IG_ItemValue[1])))
        endif
        if udg_IG_ItemValue[2] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Ловкость +" + I2S(udg_IG_ItemValue[2])))
        endif
        if udg_IG_ItemValue[3] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Мудрость +" + I2S(udg_IG_ItemValue[3])))
        endif
        if udg_IG_ItemValue[4] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс блока +" + (I2S(udg_IG_ItemValue[4]) + "%")))
        endif
        if udg_IG_ItemValue[5] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс разгрома +" + (I2S(udg_IG_ItemValue[5]) + "%")))
        endif
        if udg_IG_ItemValue[6] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Здоровье +" + I2S((udg_IG_ItemValue[6] * 30))))
        endif
        if udg_IG_ItemValue[7] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Энергия +" + I2S((udg_IG_ItemValue[7] * 10))))
        endif
        if udg_IG_ItemValue[8] > 1 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Регенерация здоровья +" + I2S(udg_IG_ItemValue[8])))
        endif
        if udg_IG_ItemValue[9] > 1 then
            if udg_IG_ItemValue[9] == 2 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFFFC2Скорость Света|r: рывок в указанную точку; при достижении врага он отталкивается и получает урон (зависит от стойкости)")
            else
                if udg_IG_ItemValue[9] == 3 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFF4F20Огненный шар|r: все монстры вокруг указанной точки получают урон (зависит от мудрости и стойкости)")
                else
                    if udg_IG_ItemValue[9] == 4 then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFF6C76Ослабление|r: понижает скорость и силу атаки цели на 50% на 10 сек.")
                    else
                        if udg_IG_ItemValue[9] == 5 then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFA05AFFСлово Пилигрима|r: подчиняет указанного противника (время зависит от мудрости)")
                        else
                            if udg_IG_ItemValue[9] == 6 then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFFFC9Освобождение|r: мгновенно убивает слабого врага у которого меньше 50% здоровья и создаёт Свет (кол-во зависит от ловкости)")
                            else
                                if udg_IG_ItemValue[9] == 7 then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFDC00Осырение|r: превращает указанного монстра в сыр на 5 сек.")
                                else
                                    if udg_IG_ItemValue[9] == 8 then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBF00Пугало|r: создает на несколько секунд провоцирующее монстров пугало")
                                    else
                                        if udg_IG_ItemValue[9] == 9 then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFA90000Жнец|r: крадёт здоровье монстра и передает Аркту (зависит от ловкости)")
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        if GetItemLevel(udg_IG_InfoItem) == 1 or GetItemLevel(udg_IG_InfoItem) == 2 then
            if udg_IG_ItemValue[1] > 1 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Атака +" + I2S((udg_IG_ItemValue[1] * 2))))
            endif
            if udg_IG_ItemValue[2] > 1 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс разгрома +" + (I2S(udg_IG_ItemValue[2]) + "%")))
            endif
            if udg_IG_ItemValue[3] > 1 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Скорость атаки +" + (I2S((udg_IG_ItemValue[3] * 3)) + "%")))
            endif
            if udg_IG_ItemValue[4] > 1 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Ловкость +" + I2S(udg_IG_ItemValue[4])))
            endif
            if udg_IG_ItemValue[6] == 2 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00AD50Ядовитое|r (при разгроме): волна яда, отравлящая стоящих перед Арктом монстров")
            else
                if udg_IG_ItemValue[6] == 3 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF81DBF5Морозное|r (при разгроме): замедляет скорость монстра и высасывает энергию")
                else
                    if udg_IG_ItemValue[6] == 4 then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF8C7A00Проклятое|r (при разгроме): сильно снижает защиту монстра и исцеляет Аркта")
                    else
                        if udg_IG_ItemValue[6] == 5 then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF9E24A2Магическое|r (при разгроме): оглушает и временно повышает шанс разгрома")
                        else
                            if udg_IG_ItemValue[6] == 6 then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00DB93Астральное|r: разгром наносит урон монстрам всем вокруг")
                            endif
                        endif
                    endif
                endif
            endif
        else
            if GetItemLevel(udg_IG_InfoItem) == 3 then
                if udg_IG_ItemValue[1] > 1 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Броня +" + I2S((udg_IG_ItemValue[1] * 2))))
                endif
                if udg_IG_ItemValue[2] > 1 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс блока +" + (I2S(udg_IG_ItemValue[2]) + "%")))
                endif
                if udg_IG_ItemValue[3] > 1 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Здоровье +" + I2S((udg_IG_ItemValue[3] * 30))))
                endif
                if udg_IG_ItemValue[4] > 1 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Стойкость +" + I2S(udg_IG_ItemValue[4])))
                endif
                if udg_IG_ItemValue[6] > 1 then
                    if udg_IG_ItemValue[6] == 2 then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFE32B00Жизнеотвод|r: восстанавливает энергию (10%) за счёт здоровья (20%)")
                    else
                        if udg_IG_ItemValue[6] == 3 then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF449EFFДушеотвод|r: восстанавливает здоровье (20%) за счёт энергии (20%)")
                        else
                            if udg_IG_ItemValue[6] == 4 then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF449EFFРунический доспех|r: создаёт случайный свиток (ценой 50% энергии)")
                            else
                                if udg_IG_ItemValue[6] == 5 then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF90DFFFЗащитные символы|r: отталкивает всех вокруг и наносит урон (зависит от стойкости и ловкости)")
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction

function InitTrig_IG_Text takes nothing returns nothing
    set gg_trg_IG_Text = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_IG_Text, ArctUnit, EVENT_UNIT_USE_ITEM)
    call TriggerAddCondition(gg_trg_IG_Text, Condition(function Trig_IG_Text_Conditions))
    call TriggerAddAction(gg_trg_IG_Text, function Trig_IG_Text_Actions)
endfunction
