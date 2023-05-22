
function Trig_Bad_Ending_Good_Job_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusic()
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 4.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
    call CinematicModeExBJ(true, bj_FORCE_PLAYER[0], 5.00)
    call TriggerSleepAction(5.00)
    call PlayMusic((("/Edemium/MusicEnding.mp3")))
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Аркт не достиг Эдема.")
    call TriggerSleepAction(10.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Ты не справился, но всё равно спасибо тебе!|nОставь отзыв на сайте (xgm.guru/p/edemium) - сделай мир лучше!")
    call TriggerSleepAction(25.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "ALT + F4")
endfunction

function InitTrig_Bad_Ending_Good_Job takes nothing returns nothing
    set gg_trg_Bad_Ending_Good_Job = CreateTrigger()
    call TriggerAddAction(gg_trg_Bad_Ending_Good_Job, function Trig_Bad_Ending_Good_Job_Actions)
endfunction
