function Trig_Initialisation_Elapsed_Func006A takes nothing returns nothing
    if GetUnitTypeId(GetEnumUnit()) == 0x6830304B then
        call SetUnitUserData(GetEnumUnit(), 10)
        call SetUnitVertexColorBJ(GetEnumUnit(), 100, 100, 100, 100.00)
    else
        if GetUnitTypeId(GetEnumUnit()) == 0x68303132 then
            call AddItemToStockBJ(0x49303047, GetEnumUnit(), 1, 1)
            call SetUnitVertexColorBJ(GetEnumUnit(), 100, 100, 100, 100.00)
            call UnitAddAbilityBJ(0x416E6575, GetEnumUnit())
        else
            if GetUnitTypeId(GetEnumUnit()) == 0x68303036 then
                call SetUnitVertexColorBJ(GetEnumUnit(), 100, 100, 100, 100.00)
                call UnitAddAbilityBJ(0x416E6575, GetEnumUnit())
                call UnitAddAbilityBJ(0x41303241, GetEnumUnit())
            else
            endif
        endif
    endif
endfunction
function Trig_Initialisation_Elapsed_Func140A takes nothing returns nothing
    call ShowUnitHide(GetEnumUnit())
    call GroupAddUnitSimple(GetEnumUnit(), udg_SecretGroup)
endfunction
function Trig_Initialisation_Elapsed_Func144Func001C takes nothing returns boolean
    return GetDestructableTypeId(GetEnumDestructable()) == 0x42303042
endfunction
function Trig_Initialisation_Elapsed_Func144A takes nothing returns nothing
    if(Trig_Initialisation_Elapsed_Func144Func001C())then
        call ShowDestructableBJ(false, GetEnumDestructable())
    else
    endif
endfunction

function Trig_Initialisation_Elapsed_Actions takes nothing returns nothing
    call CreateLeaderboardBJ(bj_FORCE_PLAYER[0], ("|cFFFFFFFFСерия ударов:|r |cFF449EFF" + I2S(udg_CO_Combo)))
    set udg_CO_ComboBoard = GetLastCreatedLeaderboard()
    call LeaderboardDisplayBJ(false, GetLastCreatedLeaderboard())
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(PLAYER_NEUTRAL_PASSIVE))
    call GroupRemoveUnitSimple(gg_unit_h006_0035, udg_UnitGroup)
    call ForGroupBJ(udg_UnitGroup, function Trig_Initialisation_Elapsed_Func006A)
    call DestroyGroup(udg_UnitGroup)
    call SetUnitUserData(gg_unit_h006_0081, 1)
    call SetUnitUserData(gg_unit_h006_0075, 2)
    call SetUnitUserData(gg_unit_h006_0077, 3)
    call SetUnitUserData(gg_unit_h006_0079, 4)
    call SetUnitUserData(gg_unit_h006_0082, 5)
    call SetUnitUserData(gg_unit_h006_0076, 6)
    call SetUnitUserData(gg_unit_h006_0078, 7)
    call SetUnitUserData(gg_unit_h006_0080, 8)
    call SetUnitUserData(gg_unit_h006_0071, 9)
    call SetUnitUserData(gg_unit_h006_0069, 10)
    call SetUnitUserData(gg_unit_h006_0073, 11)
    call SetUnitUserData(gg_unit_h006_0067, 12)
    call SetUnitLifeBJ(gg_unit_h00K_0095, 1.00)
    call SetUnitLifeBJ(gg_unit_h00K_0097, 2.00)
    call SetUnitLifeBJ(gg_unit_h00K_0096, 3.00)
    call SetUnitLifeBJ(gg_unit_h00K_0098, 4.00)
    call SetUnitLifeBJ(gg_unit_h00K_0101, 5.00)
    call SetUnitLifeBJ(gg_unit_h00K_0099, 6.00)
    call SetUnitLifeBJ(gg_unit_h00K_0103, 7.00)
    call SetUnitLifeBJ(gg_unit_h00K_0152, 8.00)
    call SetUnitLifeBJ(gg_unit_h00K_0154, 9.00)
    call SetUnitLifeBJ(gg_unit_h00K_0149, 10.00)
    call SetUnitLifeBJ(gg_unit_h00K_0105, 11.00)
    call SetUnitLifeBJ(gg_unit_h00K_0148, 12.00)
    call SetUnitLifeBJ(gg_unit_h00K_0151, 13.00)
    call SetUnitLifeBJ(gg_unit_h00K_0107, 14.00)
    call SetUnitLifeBJ(gg_unit_h00K_0102, 15.00)
    call SetUnitLifeBJ(gg_unit_h00K_0108, 16.00)
    call SetUnitLifeBJ(gg_unit_h00K_0109, 17.00)
    call SetUnitLifeBJ(gg_unit_h00K_0112, 18.00)
    call SetUnitLifeBJ(gg_unit_h00K_0115, 19.00)
    call SetUnitLifeBJ(gg_unit_h00K_0114, 20.00)
    call SetUnitLifeBJ(gg_unit_h00K_0111, 21.00)
    call SetUnitLifeBJ(gg_unit_h00K_0110, 22.00)
    call SetUnitLifeBJ(gg_unit_h00K_0116, 23.00)
    call SetUnitLifeBJ(gg_unit_h00K_0121, 24.00)
    call SetUnitLifeBJ(gg_unit_h00K_0126, 25.00)
    call SetUnitLifeBJ(gg_unit_h00K_0118, 26.00)
    call SetUnitLifeBJ(gg_unit_h00K_0122, 27.00)
    call SetUnitLifeBJ(gg_unit_h00K_0147, 28.00)
    call SetUnitLifeBJ(gg_unit_h00K_0113, 29.00)
    call SetUnitLifeBJ(gg_unit_h00K_0120, 30.00)
    call SetUnitLifeBJ(gg_unit_h00K_0125, 31.00)
    call SetUnitLifeBJ(gg_unit_h00K_0124, 32.00)
    call SetUnitLifeBJ(gg_unit_h00K_0127, 33.00)
    call SetUnitLifeBJ(gg_unit_h00K_0150, 34.00)
    call SetUnitLifeBJ(gg_unit_h00K_0123, 35.00)
    call SetUnitLifeBJ(gg_unit_h00K_0129, 36.00)
    call SetUnitLifeBJ(gg_unit_h00K_0128, 37.00)
    call SetUnitLifeBJ(gg_unit_h00K_0130, 38.00)
    call SetUnitLifeBJ(gg_unit_h00K_0133, 39.00)
    call SetUnitLifeBJ(gg_unit_h00K_0132, 40.00)
    call SetUnitLifeBJ(gg_unit_h00K_0134, 41.00)
    call SetUnitLifeBJ(gg_unit_h00K_0131, 42.00)
    call SetUnitLifeBJ(gg_unit_h00K_0135, 43.00)
    call SetUnitLifeBJ(gg_unit_h00K_0104, 44.00)
    call SetUnitLifeBJ(gg_unit_h00K_0117, 45.00)
    call SetUnitLifeBJ(gg_unit_h00K_0119, 46.00)
    call SetUnitLifeBJ(gg_unit_h00K_0136, 47.00)
    call SetUnitLifeBJ(gg_unit_h00K_0139, 48.00)
    call SetUnitLifeBJ(gg_unit_h00K_0138, 49.00)
    call SetUnitLifeBJ(gg_unit_h00K_0140, 50.00)
    call SetUnitLifeBJ(gg_unit_h00K_0144, 51.00)
    call SetUnitLifeBJ(gg_unit_h00K_0145, 52.00)
    call SetUnitLifeBJ(gg_unit_h00K_0146, 53.00)
    call SetUnitLifeBJ(gg_unit_h00K_0141, 54.00)
    call SetUnitLifeBJ(gg_unit_h00K_0143, 55.00)
    call SetUnitLifeBJ(gg_unit_h00K_0106, 56.00)
    call SetUnitLifeBJ(gg_unit_h00K_0155, 58.00)
    call SetUnitLifeBJ(gg_unit_h00K_0153, 59.00)
    call SetUnitLifeBJ(gg_unit_h00K_0142, 60.00)
    call SetUnitUserData(gg_unit_h012_0012, 1)
    call SetUnitUserData(gg_unit_h012_0011, 2)
    call SetUnitUserData(gg_unit_h012_0013, 3)
    call SetUnitUserData(gg_unit_h00Y_0005, 1)
    set udg_CC_SecretUnit[1] = gg_unit_h00Y_0005
    call SetUnitUserData(gg_unit_h00H_0002, 2)
    set udg_CC_SecretUnit[2] = gg_unit_h00H_0002
    call SetUnitUserData(gg_unit_h00Z_0007, 3)
    set udg_CC_SecretUnit[3] = gg_unit_h00Z_0007
    call SetUnitUserData(gg_unit_h011_0009, 4)
    set udg_CC_SecretUnit[4] = gg_unit_h011_0009
    call SetUnitUserData(gg_unit_h010_0008, 5)
    set udg_CC_SecretUnit[5] = gg_unit_h010_0008
    call SetUnitUserData(gg_unit_h002_0010, 6)
    set udg_CC_SecretUnit[6] = gg_unit_h002_0010
    call SetUnitUserData(gg_unit_h003_0014, 7)
    set udg_CC_SecretUnit[7] = gg_unit_h003_0014
    call SetUnitUserData(gg_unit_h00U_0015, 8)
    set udg_CC_SecretUnit[8] = gg_unit_h00U_0015
    call SetUnitUserData(gg_unit_h015_0016, 9)
    set udg_CC_SecretUnit[9] = gg_unit_h015_0016
    call SetUnitUserData(gg_unit_h016_0017, 10)
    set udg_CC_SecretUnit[10] = gg_unit_h016_0017
    call SetUnitUserData(gg_unit_h017_0018, 11)
    set udg_CC_SecretUnit[11] = gg_unit_h017_0018
    call SetUnitUserData(gg_unit_h018_0019, 12)
    set udg_CC_SecretUnit[12] = gg_unit_h018_0019
    call SetUnitUserData(gg_unit_h019_0020, 13)
    set udg_CC_SecretUnit[13] = gg_unit_h019_0020
    call SetUnitUserData(gg_unit_h01A_0021, 14)
    set udg_CC_SecretUnit[14] = gg_unit_h01A_0021
    call SetUnitUserData(gg_unit_h01B_0022, 15)
    set udg_CC_SecretUnit[15] = gg_unit_h01B_0022
    call SetUnitUserData(gg_unit_h01C_0023, 16)
    set udg_CC_SecretUnit[16] = gg_unit_h01C_0023
    call SetUnitUserData(gg_unit_h01D_0024, 17)
    set udg_CC_SecretUnit[17] = gg_unit_h01D_0024
    call SetUnitUserData(gg_unit_h01E_0025, 18)
    set udg_CC_SecretUnit[18] = gg_unit_h01E_0025
    call SetUnitUserData(gg_unit_h01F_0026, 19)
    set udg_CC_SecretUnit[19] = gg_unit_h01F_0026
    call SetUnitUserData(gg_unit_h01G_0027, 20)
    set udg_CC_SecretUnit[20] = gg_unit_h01G_0027
    call SetUnitVertexColorBJ(gg_unit_h001_0037, 100, 100, 100, 100.00)
    call SetUnitVertexColorBJ(gg_unit_h00V_0063, 100, 100, 100, 100.00)
    call SetUnitVertexColorBJ(gg_unit_h006_0035, 100, 100, 100, 100.00)
    call SetUnitVertexColorBJ(gg_unit_h00F_0003, 100, 100, 100, 100.00)
    call ShowUnitHide(gg_unit_h00V_0029)
    set udg_RandomNumber = 0
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Secrets, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_UnitGroup, function Trig_Initialisation_Elapsed_Func140A)
    call DestroyGroup(udg_UnitGroup)
    call SetUnitVertexColorBJ(gg_unit_h007_0065, 100, 100, 100, 100.00)
    call EnumDestructablesInRectAll(gg_rct_Abilities, function Trig_Initialisation_Elapsed_Func144A)
    call EnableSelect(true, false)
    call EnableMinimapFilterButtons(false, false)
    call SetMusicVolumeBJ(100.00)
    call VolumeGroupSetVolumeBJ(SOUND_VOLUMEGROUP_MUSIC, 100)
    call CreateTextTagUnitBJ("III|n", udg_Arct, 0.00, 11.00, 100, 100, 100, 0)
    set udg_DungeonColdText = GetLastCreatedTextTag()
    call ShowTextTagForceBJ(false, udg_DungeonColdText, bj_FORCE_PLAYER[0])
    call ConditionalTriggerExecute(gg_trg_Music_Castle)
    call DialogClearBJ(udg_InitDialog)
    call DialogSetMessageBJ(udg_InitDialog, "|n")
    call DialogAddButtonBJ(udg_InitDialog, "Пройти обучение|n")
    set udg_DialogButton[1] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_InitDialog, "Обойтись без обучения|n")
    set udg_DialogButton[2] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_InitDialog, "Загрузить сохранение|n")
    set udg_DialogButton[3] = GetLastCreatedButtonBJ()
    call DialogDisplayBJ(true, udg_InitDialog, Player(0))
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Initialisation_Elapsed takes nothing returns nothing
    set gg_trg_Initialisation_Elapsed = CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Initialisation_Elapsed, 0.00)
    call TriggerAddAction(gg_trg_Initialisation_Elapsed, function Trig_Initialisation_Elapsed_Actions)
endfunction