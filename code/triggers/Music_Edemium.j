
function Trig_Music_Edemium_Func004Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Func004Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_Music_Edemium_Func004C())then
        call PlayMusic((("/Edemium/MusicEdemium1.mp3")))
    else
        if(Trig_Music_Edemium_Func004Func002C())then
            call PlayMusic((("/Edemium/MusicEdemium2.mp3")))
        else
            if(Trig_Music_Edemium_Func004Func002Func001C())then
                call PlayMusic((("/Edemium/MusicEdemium3.mp3")))
            else
                call PlayMusic((("/Edemium/MusicEdemium4.mp3")))
            endif
        endif
    endif
endfunction
function InitTrig_Music_Edemium takes nothing returns nothing
    set gg_trg_Music_Edemium = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Edemium, function Trig_Music_Edemium_Actions)
endfunction