
function Trig_Abilities_Info_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303036))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func007C takes nothing returns boolean
    if(not(GetTriggerUnit() != gg_unit_h006_0035))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0067))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0073))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0069))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0071))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0080))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0078))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0076))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0082))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0079))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0077))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0075))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0081))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Actions takes nothing returns nothing
    set udg_Target = GetTriggerUnit()
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    call ClearTextMessagesBJ(GetPlayersAll())
    if(Trig_Abilities_Info_Func007C())then
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, ("|cFFBFBFC2\"" + (udg_AS_Name[GetUnitUserData(udg_Target)] + "\"|r")))
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, ("Уровень/опыт: " + (I2S(udg_AS_AbilityLVL[GetUnitUserData(udg_Target)]) + ("/" + I2S(udg_AS_AbilityEXP[GetUnitUserData(udg_Target)])))))
    else
    endif
    if(Trig_Abilities_Info_Func008C())then
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Накладывает исцеление на 5/6/7/8/9/10 сек. и повышает броню на это время на 5/10/15/20/25 ед.")
    else
        if(Trig_Abilities_Info_Func008Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Наносит урон всем вокруг и повышает шанс разгрома на 10% на 4/8/12/16/20 сек.")
        else
            if(Trig_Abilities_Info_Func008Func001Func001C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Добавляет, помимо медитации и рывка, одноразовое умение невидимости, действующее 5/10/15/20/25 сек.")
            else
                if(Trig_Abilities_Info_Func008Func001Func001Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Увеличивает скорость атаки на 50% на 3/6/9/12/15 сек. и добавляет вампиризм 30% к любому исходящему урону.")
                else
                    if(Trig_Abilities_Info_Func008Func001Func001Func001Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создаёт бесплотный призрак случайного монстра, сражающегося на стороне Аркта в течение 7/9/11/13/15 сек.")
                    else
                        if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Пассивно периодически наносит урон случайному ближайшему противнику. При активации навыка следующие 1/2/3/4/5 ударов нанесут дополнительный урон.")
                        else
                            if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Если запас энергии ниже 90%, то восстанавливает 3/4/5/6/7 ед., иначе происходит взрыв, наносящий урон в зависимости её количества.")
                            else
                                if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001C())then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Запускает шар света: если приземлится на монстре - нанесет ему урон, если на Аркте - исцелит, после этого перепрыгивает на случайную цель ещё 3/4/5/6/7 раз.")
                                else
                                    if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002C())then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создает в случайной точке недалеко от Аркта источник испепеляющего света на 2/4/6/8/10 сек., наносящего урон монстрам. Каждое третье применение повышает все хар-ки на 1 ед. (действует до конца выхода из подземелья).")
                                    else
                                        if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001C())then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Бессрочно призывает духа помогающего в бою. Активация навыка когда дух уже призван - вызывает нову исходящую от духа, наносящую урон врагам и исцеляющую союзников. Сила духа растет с уровнем навыка.")
                                        else
                                            if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001C())then
                                                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Накладывает ледяной щит повышающий шанс блока на 20% на 4/8/12/16/20 сек. Во время этого любой блок нанесёт урон монстру и исцелит Аркта.")
                                            else
                                                if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001Func001C())then
                                                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создаёт под Арктом зону, находясь в которой его сила атаки возрастает на 20/40/60/80/100%, а враги ежесекундно получают урон.")
                                                else
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
function InitTrig_Abilities_Info takes nothing returns nothing
    set gg_trg_Abilities_Info = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Abilities_Info, Player(0), true)
    call TriggerAddCondition(gg_trg_Abilities_Info, Condition(function Trig_Abilities_Info_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Info, function Trig_Abilities_Info_Actions)
endfunction