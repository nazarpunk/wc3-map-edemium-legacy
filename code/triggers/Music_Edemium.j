function Trig_Music_Edemium_Actions takes nothing returns nothing
    call StopMusic(false)
    call ClearMapMusic()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if udg_RandomNumber == 1 then
        call PlayMusic((("/Edemium/MusicEdemium1.mp3")))
    endif
    if udg_RandomNumber == 2 then
        call PlayMusic((("/Edemium/MusicEdemium2.mp3")))
    endif
    if udg_RandomNumber == 3 then
        call PlayMusic((("/Edemium/MusicEdemium3.mp3")))
    endif
    if udg_RandomNumber == 4 then
        call PlayMusic((("/Edemium/MusicEdemium4.mp3")))
    endif
endfunction

function InitTrig_Music_Edemium takes nothing returns nothing
    set gg_trg_Music_Edemium = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Edemium, function Trig_Music_Edemium_Actions)
endfunction
