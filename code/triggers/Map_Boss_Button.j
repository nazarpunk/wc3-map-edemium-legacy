function Trig_Map_Boss_Button_Func002Func005C takes nothing returns boolean
    return udg_EM_BossEnterDialog == 1
endfunction

function Trig_Map_Boss_Button_Actions takes nothing returns nothing
    if GetClickedButton() == udg_MapBossButton[1] then
        set udg_EM_BossRoom = true
        set udg_EM_Bool = false
        set udg_EM_Encounter = true
        set udg_ARTInteger[4] = 0
        if(Trig_Map_Boss_Button_Func002Func005C())then
            set udg_EM_BossLevel = gg_unit_h00K_0105
            set udg_EM_BossCreate[1] = true
            set udg_EM_BossDead[1] = false
            call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 1))
            set udg_D_CreepType[1] = 0x6E303034
            set udg_D_CreepType[2] = 0x6E303030
            set udg_D_CreepType[3] = 0x6E303035
            set udg_D_CreepType[4] = 0x6E30304A
            set udg_D_CreepType[5] = 0x6E30304B
            set udg_CC_IngredientDrop = 3
            call SetTerrainFogExBJ(0, 500.00, 10000.00, 0.50, 0.00, 100.00, 0.00)
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistYes2, "Сейчас похимичим...", bj_TIMETYPE_ADD, 0, false)
        else
            if udg_EM_BossEnterDialog == 2 then
                set udg_EM_BossLevel = gg_unit_h00K_0123
                set udg_EM_BossCreate[2] = true
                set udg_EM_BossDead[2] = false
                call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 2))
                call EnableTrigger(gg_trg_Boss_II_Phase_2_Init)
                set udg_D_CreepType[1] = 0x6E30304E
                set udg_D_CreepType[2] = 0x6E303043
                set udg_D_CreepType[3] = 0x6E30304E
                set udg_D_CreepType[4] = 0x6E303050
                set udg_D_CreepType[5] = 0x6E303050
                set udg_CC_IngredientDrop = 5
                call SetTerrainFogExBJ(0, 1500.00, 6000.00, 0.50, 70.00, 50.00, 0.00)
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_O04Mannoroth38, "*гнилой смех*", bj_TIMETYPE_ADD, 0, false)
            else
                set udg_EM_BossLevel = gg_unit_h00K_0142
                set udg_EM_BossCreate[3] = true
                set udg_EM_BossDead[3] = false
                call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 3))
                call EnableTrigger(gg_trg_Boss_III_Portal_Use)
                set udg_D_CreepType[1] = 0x6E303051
                set udg_D_CreepType[2] = 0x6E303041
                set udg_D_CreepType[3] = 0x6E303056
                set udg_D_CreepType[4] = 0x6E303052
                set udg_D_CreepType[5] = 0x6E303055
                set udg_CC_IngredientDrop = 9
                call SetTerrainFogExBJ(0, 1300.00, 5000.00, 0.50, 0.00, 0.00, 0.00)
            endif
        endif
        call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
        call ConditionalTriggerExecute(gg_trg_Gen_Boss)
    else
    endif
endfunction

function InitTrig_Map_Boss_Button takes nothing returns nothing
    set gg_trg_Map_Boss_Button = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Map_Boss_Button, udg_MapBossDialog)
    call TriggerAddAction(gg_trg_Map_Boss_Button, function Trig_Map_Boss_Button_Actions)
endfunction
