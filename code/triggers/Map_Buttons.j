function Trig_Map_Buttons_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetTriggerUnit()) == 0x6830304B
endfunction

function Trig_Map_Buttons_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 0x4130345A then
        call ClearTextMessagesBJ(GetPlayersAll())
        if udg_EM_EncounterChance < 75 then
            set udg_EM_EncounterChance = (udg_EM_EncounterChance + 4)
        endif
        if GetRandomInt(1, 100) <= udg_EM_EncounterChance then
            call UnitAddAbilityBJ(0x4130345A, GetTriggerUnit())
            set udg_EM_Bool = false
            set udg_EM_Encounter = true
            set udg_EM_EncounterChance =- 4
            call ConditionalTriggerExecute(gg_trg_Map_Events)
        else
            set udg_EM_Encounter = false
            set udg_EM_Bool = true
        endif
    else
        if GetSpellAbilityId() == 0x4130354E then
            set udg_D_Point1 = GetUnitLoc(udg_EM_Target)
            set udg_D_Point2 = GetUnitLoc(udg_Target)
            set udg_EM_Cost = R2I(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2))
            set udg_EM_Cost = (udg_EM_Cost / 8)
            set udg_EM_Encounter = false
            if GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) >= udg_EM_Cost then
                set udg_EM_Bool = true
                call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) - udg_EM_Cost))
            else
                set udg_EM_Bool = false
                call UnitRemoveAbilityBJ(0x4130354E, GetTriggerUnit())
                call UnitAddAbilityBJ(0x4130354E, GetTriggerUnit())
                call ClearTextMessagesBJ(GetPlayersAll())
                call DisplayTimedTextToForce(GetPlayersAll(), 1.00, ("Понадобится Света: " + I2S(udg_EM_Cost)))
            endif
        else
            if GetSpellAbilityId() == 0x4130354D then
                call VolumeGroupSetVolumeBJ(SOUND_VOLUMEGROUP_FIRE, 100.00)
                set udg_EM_BossRoom = false
                if GetUnitTypeId(GetTriggerUnit()) == 0x6830304B and (SubStringBJ(I2S(GetUnitUserData(udg_EM_Target)), 1, 1) == "7" or GetUnitUserData(GetTriggerUnit()) == 8 or GetUnitUserData(GetTriggerUnit()) == 5) then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 4
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        set udg_EM_BossDead[bj_forLoopAIndex] = true
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
                    call ConditionalTriggerExecute(gg_trg_Gen_Start)
                else
                    if GetUnitUserData(GetTriggerUnit()) == 4 then
                        set udg_EnchantingRoom = true
                        call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
                        call EnableTrigger(gg_trg_Escape_Dialog)
                        call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
                        call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
                    else
                        if GetUnitUserData(GetTriggerUnit()) == 3 then
                            set udg_OnkieRoom = true
                            call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
                            call EnableTrigger(gg_trg_Escape_Dialog)
                            call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
                            call SetDayNightModels("", "")
                        else
                            if GetUnitUserData(GetTriggerUnit()) == 2 then
                                set udg_CS_Bool = true
                                call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
                                call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
                                call SetDayNightModels("", "")
                            else
                                if GetUnitUserData(GetTriggerUnit()) == 1 then
                                    if GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) > 0 then
                                        call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 1))
                                        set udg_ER_Logic = true
                                        call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
                                        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
                                        call ConditionalTriggerExecute(gg_trg_Edemor_Start)
                                    else
                                        call ClearTextMessagesBJ(GetPlayersAll())
                                        call DisplayTimedTextToForce(GetPlayersAll(), 1.00, "Для входа требуется Ключ Эдемора.")
                                    endif
                                else
                                    if GetTriggerUnit() == gg_unit_h00K_0105 and GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) >= 1 then
                                        set udg_EM_BossEnterDialog = 1
                                        call DialogClear(udg_MapBossDialog)
                                        call DialogSetMessage(udg_MapBossDialog, "Чтобы пройти дальше нужен|n1 ключ Эдемора. Потратить?")
                                        call DialogAddButtonBJ(udg_MapBossDialog, "Да.")
                                        set udg_MapBossButton[1] = bj_lastCreatedButton
                                        call DialogAddButtonBJ(udg_MapBossDialog, "Нет.")
                                        set udg_MapBossButton[2] = bj_lastCreatedButton
                                        call DialogDisplayBJ(true, udg_MapBossDialog, Player(0))
                                    else
                                        if GetTriggerUnit() == gg_unit_h00K_0123 and GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) >= 2 then
                                            set udg_EM_BossEnterDialog = 2
                                            call DialogClear(udg_MapBossDialog)
                                            call DialogSetMessage(udg_MapBossDialog, "Чтобы пройти дальше нужны|n2 ключа Эдемора. Потратить?")
                                            call DialogAddButtonBJ(udg_MapBossDialog, "Да.")
                                            set udg_MapBossButton[1] = bj_lastCreatedButton
                                            call DialogAddButtonBJ(udg_MapBossDialog, "Нет.")
                                            set udg_MapBossButton[2] = bj_lastCreatedButton
                                            call DialogDisplayBJ(true, udg_MapBossDialog, Player(0))
                                        else
                                            if GetTriggerUnit() == gg_unit_h00K_0142 and GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) >= 3 then
                                                set udg_EM_BossEnterDialog = 3
                                                call DialogClear(udg_MapBossDialog)
                                                call DialogSetMessage(udg_MapBossDialog, "Чтобы пройти дальше нужны|n3 ключа Эдемора. Потратить?")
                                                call DialogAddButtonBJ(udg_MapBossDialog, "Да.")
                                                set udg_MapBossButton[1] = bj_lastCreatedButton
                                                call DialogAddButtonBJ(udg_MapBossDialog, "Нет.")
                                                set udg_MapBossButton[2] = bj_lastCreatedButton
                                                call DialogDisplayBJ(true, udg_MapBossDialog, Player(0))
                                            else
                                                call ClearTextMessagesBJ(GetPlayersAll())
                                                if GetTriggerUnit() == gg_unit_h00K_0105 then
                                                    call DisplayTimedTextToForce(GetPlayersAll(), 3.00, "Для входа требуется 1 ключ Эдемора.")
                                                else
                                                    if GetTriggerUnit() == gg_unit_h00K_0123 then
                                                        call DisplayTimedTextToForce(GetPlayersAll(), 3.00, "Для входа требуются 2 ключа Эдемора.")
                                                    else
                                                        if GetTriggerUnit() == gg_unit_h00K_0142 then
                                                            call DisplayTimedTextToForce(GetPlayersAll(), 3.00, "Для входа требуются 3 ключа Эдемора.")
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
        endif
    endif
    if udg_EM_Bool then
        call ConditionalTriggerExecute(gg_trg_Map_Move)
    endif
endfunction

function InitTrig_Map_Buttons takes nothing returns nothing
    set gg_trg_Map_Buttons = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Map_Buttons, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Map_Buttons, Condition(function Trig_Map_Buttons_Conditions))
    call TriggerAddAction(gg_trg_Map_Buttons, function Trig_Map_Buttons_Actions)
endfunction
