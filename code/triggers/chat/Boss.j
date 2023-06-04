function Trig_Boss_Actions takes nothing returns nothing
    set udg_Difficulty_Unlocked[1] = true
    call SuspendHeroXPBJ(true, ArctUnit)
    if GetEventPlayerChatString() == "boss1" then
        call SetHeroLevelBJ(ArctUnit, 10, false)
        call AdjustPlayerStateBJ(100, Player(0), PLAYER_STATE_RESOURCE_GOLD)
        call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, 10)
        call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, 10)
        call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, 10)
    else
        if GetEventPlayerChatString() == "boss2" then
            set udg_EM_Boss[1] = true
            set udg_EM_Generate = 2
            call SetHeroLevelBJ(ArctUnit, 20, false)
            call AdjustPlayerStateBJ(200, Player(0), PLAYER_STATE_RESOURCE_GOLD)
            call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, 15)
            call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, 15)
            call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, 15)
            call ConditionalTriggerExecute(gg_trg_Map_Generate)
        else
            if GetEventPlayerChatString() == "boss3" then
                set udg_EM_Boss[1] = true
                set udg_EM_Boss[2] = true
                set udg_EM_Generate = 3
                call SetHeroLevelBJ(ArctUnit, 40, false)
                call AdjustPlayerStateBJ(300, Player(0), PLAYER_STATE_RESOURCE_GOLD)
                call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            else
                set udg_EM_Boss[1] = true
                set udg_EM_Boss[2] = true
                set udg_EM_Boss[3] = true
                set udg_EM_Generate = 4
                call SetHeroLevelBJ(ArctUnit, 60, false)
                call AdjustPlayerStateBJ(500, Player(0), PLAYER_STATE_RESOURCE_GOLD)
                call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_ADD, 20)
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            endif
        endif
    endif
    call ConditionalTriggerExecute(gg_trg_Attributes_Multiboard)
    call AdjustPlayerStateBJ(50, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
    call SuspendHeroXPBJ(false, ArctUnit)
endfunction

function InitTrig_Boss takes nothing returns nothing
    set gg_trg_Boss = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss1", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss2", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss3", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss4", true)
    call TriggerAddAction(gg_trg_Boss, function Trig_Boss_Actions)
endfunction
