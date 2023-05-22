
function Trig_Pause_Off_Func005Func001C takes nothing returns boolean
    if(not(udg_TutorialHint[4] == false))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func005C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[3] == false))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func006Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func006C takes nothing returns boolean
    if(not(udg_EM_BossRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Actions takes nothing returns nothing
    call PauseAllUnitsBJ(false)
    call SuspendHeroXPBJ(true, udg_Arct)
    call EnableTrigger(gg_trg_Trap_Periodic)
    call EnableTrigger(gg_trg_Tile_Damage)
    if(Trig_Pause_Off_Func005C())then
        set udg_TutorialHint[3] = true
        call DialogClearBJ(udg_TeleportDialog)
        call DialogSetMessageBJ(udg_TeleportDialog, "Смерть для Аркта не страшна, но|nвсё равно умирая он будет терять|nвсе предметы снаряжения. Твоя |nцель: найти и убить хозяина уровня. |nВ зависимости от сложности зависит |nнаграда за прохождение уровня. |nДа пребудут с тобой Боги Эдемиума.")
        call DialogAddButtonBJ(udg_TeleportDialog, "Понятно, спасибо!")
        call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
        call TriggerSleepAction(1.00)
        set udg_TutorialHint[4] = true
        call ConditionalTriggerExecute(gg_trg_QG_Generate)
    else
        if(Trig_Pause_Off_Func005Func001C())then
            set udg_TutorialHint[4] = true
            call ConditionalTriggerExecute(gg_trg_QG_Generate)
        else
        endif
    endif
    if(Trig_Pause_Off_Func006C())then
        if(Trig_Pause_Off_Func006Func001C())then
            set udg_Boss3PortalCounter = 0
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack3, "Свежее мясо!", bj_TIMETYPE_ADD, 0, false)
            call EnableTrigger(gg_trg_Boss_III_Creep_Spawn)
            call EnableTrigger(gg_trg_Boss_III_Portal_Spawn)
            call EnableTrigger(gg_trg_Boss_III_Phase_2_Init)
        else
        endif
    else
    endif
endfunction
function InitTrig_Pause_Off takes nothing returns nothing
    set gg_trg_Pause_Off = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Pause_Off, udg_PauseTimer)
    call TriggerAddAction(gg_trg_Pause_Off, function Trig_Pause_Off_Actions)
endfunction