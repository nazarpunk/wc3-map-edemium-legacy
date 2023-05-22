
function Trig_Music_Castle_Func004Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction

function Trig_Music_Castle_Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction

function Trig_Music_Castle_Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Music_Castle_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusic()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_Music_Castle_Func004C())then
        call PlayMusic((("/Edemium/MusicCastle1.mp3")))
    else
        if(Trig_Music_Castle_Func004Func001C())then
            call PlayMusic((("/Edemium/MusicCastle2.mp3")))
        else
            if(Trig_Music_Castle_Func004Func001Func001C())then
                call PlayMusic((("/Edemium/MusicCastle3.mp3")))
            else
                call PlayMusic((("/Edemium/MusicCastle4.mp3")))
            endif
        endif
    endif
endfunction

function InitTrig_Music_Castle takes nothing returns nothing
    set gg_trg_Music_Castle = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Castle, function Trig_Music_Castle_Actions)
endfunction
