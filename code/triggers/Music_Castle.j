function Trig_Music_Castle_Actions takes nothing returns nothing
    call StopMusic(false)
    call ClearMapMusic()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if udg_RandomNumber == 1 then
        call PlayMusic((("/Edemium/MusicCastle1.mp3")))
    endif
    if udg_RandomNumber == 2 then
        call PlayMusic((("/Edemium/MusicCastle2.mp3")))
    endif
    if udg_RandomNumber == 3 then
        call PlayMusic((("/Edemium/MusicCastle3.mp3")))
    endif
    if udg_RandomNumber == 4 then
        call PlayMusic((("/Edemium/MusicCastle4.mp3")))
    endif
endfunction

function InitTrig_Music_Castle takes nothing returns nothing
    set gg_trg_Music_Castle = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Castle, function Trig_Music_Castle_Actions)
endfunction
