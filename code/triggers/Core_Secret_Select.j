function Trig_Core_Secret_Select_Conditions takes nothing returns boolean
    return IsUnitInGroup(GetTriggerUnit(), udg_SecretGroup)
endfunction

function Trig_Core_Secret_Select_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    if GetTriggerUnit() == gg_unit_h00Y_0005 then
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Энергии Света|r: поднятие Света восстанавливает энергию (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 субстанции смерти, 3 души превратности.")
    else
        if GetTriggerUnit() == gg_unit_h00H_0002 then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Сущности Света|r: в бою каждые десять секунд создается Свет (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 субстанции смерти, 2 души превратности.")
        else
            if GetTriggerUnit() == gg_unit_h00Z_0007 then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Богатой Добычи|r: увеличивает шанс выпадения предметов с монстров (1% за уровень).|n|cFFBFBFC2Элементы|r: 5 субстанций смерти, 5 душ превратности.")
            else
                if GetTriggerUnit() == gg_unit_h011_0009 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Жатвы Крови|r: каждое убийство монстра восстанавливает здоровье (2% за уровень).|n|cFFBFBFC2Элементы|r: 1 субстанция смерти, 3 экстракта гниения.")
                else
                    if GetTriggerUnit() == gg_unit_h010_0008 then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Искры Пилигрима|r: после убийства монстра есть шанс (3% за уровень) применить случайный навык.|n|cFFBFBFC2Элементы|r: 4 души превратности, 4 экстракта гниения.")
                    else
                        if GetTriggerUnit() == gg_unit_h002_0010 then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Распыления|r: увеличивает количество получаемого Света за распыление (3 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 экстракта гниения, 8 сущностей невежества.")
                        else
                            if GetTriggerUnit() == gg_unit_h003_0014 then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Меча|r: увеличивает шанс разгрома (1% за уровень).|n|cFFBFBFC2Элементы|r: 10 сущностей невежества, 3 сердца ненависти.")
                            else
                                if GetTriggerUnit() == gg_unit_h00U_0015 then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Бури|r: ежесекундно шанс 5% ударить ближайшего монстра молнией (50 ед. урона за уровень).|n|cFFBFBFC2Элементы|r: 5 душ превратности, 5 экстрактов гниения.")
                                else
                                    if GetTriggerUnit() == gg_unit_h015_0016 then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Пилигримов|r: в бою каждые пять секунд серия ударов увеличивается (на 1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 4 природы падения, 3 ядра тьмы.")
                                    else
                                        if GetTriggerUnit() == gg_unit_h016_0017 then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Анимирования|r: открытие сундуков призывает на 60 сек. ожившее оружие (сила зависит от уровня) помогающее Аркту.|n|cFFBFBFC2Элементы|r: 8 сущностей невежества, 5 эссенций жадности.")
                                        else
                                            if GetTriggerUnit() == gg_unit_h017_0018 then
                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Вливания Света|r: после каждого приёма есть шанс (5% за уровень) запустить наносящий урон (сила зависит от хар-ик и серии ударов) снаряд в монстра.|n|cFFBFBFC2Элементы|r: 2 экстракта гниения, 6 сердцевин лжи.")
                                            else
                                                if GetTriggerUnit() == gg_unit_h018_0019 then
                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Защиты|r: увеличивает шанс блока (1% за уровень).|n|cFFBFBFC2Элементы|r: 3 сердцевины лжи, 3 природы падения.")
                                                else
                                                    if GetTriggerUnit() == gg_unit_h019_0020 then
                                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Вынесения Урока|r: прохождение трех подземелий повышает случайную хар-ку (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 10 сущностей невежества.")
                                                    else
                                                        if GetTriggerUnit() == gg_unit_h01A_0021 then
                                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Сильной Воли|r: при снижении здоровья до 20% - оно восстанавливается (100 ед. за уровень). Срабатывает один раз за уровень.|n|cFFBFBFC2Элементы|r: 5 сердец ненависти.")
                                                        else
                                                            if GetTriggerUnit() == gg_unit_h01B_0022 then
                                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Отражений Души|r: при блоке создаёт иллюзию Аркта на 10 сек. (сила зависит от уровня).|n|cFFBFBFC2Элементы|r: 6 эссенций жадности, 6 сердцевин лжи.")
                                                            else
                                                                if GetTriggerUnit() == gg_unit_h01C_0023 then
                                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Роста Души|r: увеличивает все хар-ки (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 5 субстанций смерти, 3 сердца ненависти.")
                                                                else
                                                                    if GetTriggerUnit() == gg_unit_h01D_0024 then
                                                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Проницательности|r: увеличивает максимальное количество секретов на уровне (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 7 эссенций жадности.")
                                                                    else
                                                                        if GetTriggerUnit() == gg_unit_h01E_0025 then
                                                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Мастерства|r: применение навыков дополнительно увеличивают серию ударов (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 природы падения, 2 ядра тьмы.")
                                                                        else
                                                                            if GetTriggerUnit() == gg_unit_h01F_0026 then
                                                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Техники Стража|r: во время действия рывка увеличивается шанс блока (3% за уровень).|n|cFFBFBFC2Элементы|r: 6 сущностей невежества, 2 сердцевины лжи.")
                                                                            else
                                                                                if GetTriggerUnit() == gg_unit_h01G_0027 then
                                                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Единства Света|r: в начале боя на 15 сек. появляется Собрат, помогающий в бою (сила растет с уровнем).|n|cFFBFBFC2Элементы|r: 2 субстанции смерти, 2 души превратности, 2 экстракта гниения, 2 сущности невежества.")
                                                                                endif
                                                                            endif
                                                                        endif
                                                                    endif
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Core_Secret_Select takes nothing returns nothing
    set gg_trg_Core_Secret_Select = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Core_Secret_Select, Player(0), true)
    call TriggerAddCondition(gg_trg_Core_Secret_Select, Condition(function Trig_Core_Secret_Select_Conditions))
    call TriggerAddAction(gg_trg_Core_Secret_Select, function Trig_Core_Secret_Select_Actions)
endfunction