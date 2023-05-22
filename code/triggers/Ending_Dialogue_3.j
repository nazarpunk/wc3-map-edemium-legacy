

function Trig_Ending_Dialogue_3_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] then
        call TriggerSleepAction(3.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor6, "Идём со мной.", bj_TIMETYPE_ADD, 1.00, true)
        set udg_Transparent = 0.00
        call EnableTrigger(gg_trg_Edemor_Transparent_2)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 4.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
        call CinematicModeExBJ(true, bj_FORCE_PLAYER[0], 5.00)
        call TriggerSleepAction(5.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Аркт достиг Эдема.")
        call StopMusicBJ(false)
        call ClearMapMusic()
        call PlayMusic((("/Edemium/MusicEnding.mp3")))
        call TriggerSleepAction(10.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Ты справился, красавчик! Спасибо тебе!|nОставь отзыв на сайте (xgm.guru/p/edemium) - сделай мир лучше!")
        call TriggerSleepAction(25.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "ALT + F4")
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor5, "Тогда путь был проделан зря. Твои деяния потеряли значение. Возвращайся обратно и доживай свой век на поводу у своих слабостей. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Ending_Dialogue_3 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_3 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_3)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_3, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_3, function Trig_Ending_Dialogue_3_Actions)
endfunction
