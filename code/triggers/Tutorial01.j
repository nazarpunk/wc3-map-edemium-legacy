
function Trig_Tutorial01_Actions takes nothing returns nothing
    call CinematicModeExBJ(false, GetPlayersAll(), 999.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_1F, "Наконец-то - хоть кто-то с мозгами! Добро пожаловать. Меня Беба зовут.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_2F, "Я тут как раз решил провести тренировку с этим бездарем, я и тебя заодно научу самому главному. Начнём с боевой системы.", bj_TIMETYPE_ADD, 0.00, true)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CinematicModeExBJ(false, GetPlayersAll(), 3.00)
    call TriggerSleepAction(4.00)
    call CameraSetSmoothingFactorBJ(10.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_3F, "Смотри, всё просто. У Аркта есть три навыка, они различаются по цвету. Во время боя над монстром может появиться одна из трёх иконок.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_4F, "Тебе нужно успеть нажать на такую же на панели умений Аркта, тогда монстр получит урон, а герой исцелится.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_H000_0004, "Аркт", gg_snd_4BF, "С кем ты разговариваешь?", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_5F, "Погоди ты, не мешай. Так вот. Всё понятно? Сейчас я создам монстра, а ты попробуй с помощью Аркта его убить.", bj_TIMETYPE_ADD, 0.00, true)
    call TriggerSleepAction(2.00)
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    set udg_Point = GetRandomLocInRect(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, udg_D_CreepType[5], Player(11), udg_Point, bj_UNIT_FACING)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    set udg_TutorialCreep = GetLastCreatedUnit()
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call CameraSetSmoothingFactorBJ(0.00)
    call RemoveLocation(udg_Point)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Tutorial01 takes nothing returns nothing
    set gg_trg_Tutorial01 = CreateTrigger()
    call DisableTrigger(gg_trg_Tutorial01)
    call TriggerRegisterTimerEventSingle(gg_trg_Tutorial01, 3.00)
    call TriggerAddAction(gg_trg_Tutorial01, function Trig_Tutorial01_Actions)
endfunction
