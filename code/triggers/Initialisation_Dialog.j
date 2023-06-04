function Trig_Initialisation_Dialog_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Artefactorium)
        call UnitAddItemByIdSwapped(0x4930304C, ArctUnit)
        call ConditionalTriggerExecute(gg_trg_Tutorial_Initialisation)
        call EnableTrigger(gg_trg_Tutorial01)
        set udg_EM_Generate = 1
        call ConditionalTriggerExecute(gg_trg_Map_Generate)
        set udg_TargetPoint = GetUnitLoc(gg_unit_h00K_0095)
        call CreateDestructableLoc(0x42303141, udg_TargetPoint, 0.00, 0.30, 0)
        set udg_EM_Effect = GetLastCreatedDestructable()
        call RemoveLocation(udg_TargetPoint)
        call DestroyTrigger(GetTriggeringTrigger())
    else
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
        call DestroyTrigger(gg_trg_Tutorial01)
        call DestroyTrigger(gg_trg_Tutorial_Initialisation)
        call DestroyTrigger(gg_trg_Tutorial_Cinematic)
        call DisableTrigger(gg_trg_Artefactorium_Damage)
        call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
        call EnableTrigger(gg_trg_Escape_Dialog)
        call EnableTrigger(gg_trg_Enter_Dialog)
        call EnableTrigger(gg_trg_Creep_Kill)
        call EnableTrigger(gg_trg_Camera_Fix)
        set RegionsEnabled = true
        call EnableTrigger(gg_trg_Item_Pickup)
        set udg_TutorialHintsOn = false
        call EnablePreSelect(false, false)

        if GetClickedButton() == udg_DialogButton[2] then
            call CinematicModeExBJ(false, GetPlayersAll(), 2.00)
            call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
            call UnitAddItemByIdSwapped(0x4930304C, ArctUnit)
            set udg_Target = gg_unit_h006_0081
            call RemoveDestructable(gg_dest_B003_2936)
            call ShowDestructableBJ(true, gg_dest_B00B_1355)
            set udg_Point = GetUnitLoc(gg_unit_h006_0081)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[2] = GetLastCreatedDestructable()
            set udg_AS_Logic[2] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 2
            set udg_AS_SeriesNumber = 2
            set udg_AS_Effect[udg_AS_SeriesNumber] = 1
            set udg_AS_AbilityStudied[1] = 1
            call CreateTextTagUnitBJ("5", gg_unit_h006_0081, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
            call UnitRemoveAbilityBJ(0x41303241, gg_unit_h006_0081)
            call UnitAddAbilityBJ(0x41303649, gg_unit_h006_0081)
            set udg_AS_Points = 300
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
            call ShowUnitShow(udg_CC_SecretUnit[2])
            set udg_CC_SecretUnlocked[2] = true
            set udg_ART[2] = (udg_ART[2] + 1)
            set udg_Point = GetUnitLoc(udg_CC_SecretUnit[2])
            call CreateTextTagLocBJ(I2S(udg_ART[2]), udg_Point, (GetUnitFlyHeight(udg_CC_SecretUnit[2]) + 40.00), 10, 100, 100, 100, 0)
            set udg_CC_SecretLevel[2] = GetLastCreatedTextTag()
            call RemoveLocation(udg_Point)
            call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
            set udg_RandomNumber = GetRandomInt(1, 20)
            if not udg_CC_SecretUnlocked[udg_RandomNumber] then
                call AddItemToStockBJ(udg_SecretsList[udg_RandomNumber], gg_unit_n009_0061, 1, 1)
            endif
            set udg_EM_Generate = 1
            call ConditionalTriggerExecute(gg_trg_Map_Generate)
            set udg_TargetPoint = GetUnitLoc(gg_unit_h00K_0095)
            call CreateDestructableLoc(0x42303141, udg_TargetPoint, 0.00, 0.30, 0)
            set udg_EM_Effect = GetLastCreatedDestructable()
            call RemoveLocation(udg_TargetPoint)
            call DestroyTrigger(GetTriggeringTrigger())
        else
            set udg_LoadSucces = false
            call Preloader("Edemium\\Save1.txt")
            call Preloader("Edemium\\Save2.txt")
            call Preloader("Edemium\\Save3.txt")
            call Preloader("Edemium\\Save4.txt")
            call StartTimerBJ(udg_LoadingTimer, false, 2.00)
        endif
    endif
endfunction


function InitTrig_Initialisation_Dialog takes nothing returns nothing
    set gg_trg_Initialisation_Dialog = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Initialisation_Dialog, udg_InitDialog)
    call TriggerAddAction(gg_trg_Initialisation_Dialog, function Trig_Initialisation_Dialog_Actions)
endfunction
