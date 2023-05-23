
function Trig_Enter_Regions_Conditions takes nothing returns boolean
    if(not(GetEnteringUnit() == gg_unit_H000_0004))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func007C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region1, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func008C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region2, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func009C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region10, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func010Func003C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[6] == false))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func010C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region11, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func011Func010C takes nothing returns boolean
    if(not(udg_Tutorial[1] == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func011C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region9, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func012C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region4, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func013Func003C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[1] == false))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func013C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region5, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func014C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region8, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func015C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region7, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction

function Trig_Enter_Regions_Func018002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Enter_Regions_Func021002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Enter_Regions_Actions takes nothing returns nothing
    call SetPlayerAbilityAvailableBJ(false, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303530, Player(0))
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    if(Trig_Enter_Regions_Func007C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Meditate)
        call AddUnitAnimationPropertiesBJ(true, "gold", gg_unit_H000_0004)
        set udg_Camera = gg_cam_Camera_Abilities
        call EnableTrigger(gg_trg_Trees_Choose_ESC)
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Чтобы открыть новые умения нажмите ESC.")
    endif
    if(Trig_Enter_Regions_Func008C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_2)
        set udg_Camera = gg_cam_Camera_Workshop_2
    endif
    if(Trig_Enter_Regions_Func009C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
        set udg_Camera = gg_cam_Camera_Workshop
    endif
    if(Trig_Enter_Regions_Func010C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_1)
        set udg_Camera = gg_cam_Camera_Workshop_1
        if(Trig_Enter_Regions_Func010Func003C())then
            set udg_TutorialHint[6] = true
            call DialogClearBJ(udg_TeleportDialog)
            call DialogSetMessageBJ(udg_TeleportDialog, "Ядро - это магический механизм |nдля раскрытия секретов (талантов),|nдающих Аркту пассивные умения. |nСейчас я раскрою тебе один из них|nи дам необходимые элементы, |nа дальше сам разберёшься. Не|nмаленький уже.")
            call DialogAddButtonBJ(udg_TeleportDialog, "Ничего не понял, но спасибо!")
            call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
            set udg_Point = GetRectCenter(gg_rct_Workshop_Core)
            call CreateItemLoc(0x49303132, udg_Point)
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 3
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(0x4930305A, udg_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(0x49303130, udg_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            call RemoveLocation(udg_Point)
        endif
        call EnableTrigger(gg_trg_Core_Item_Pickup)
        call DisableTrigger(gg_trg_Item_Pickup)
    endif
    if(Trig_Enter_Regions_Func011C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
        set udg_Camera = gg_cam_Camera_Portal_Room
        set udg_Point = GetRectCenter(gg_rct_Room_Portal_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        if(Trig_Enter_Regions_Func011Func010C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_8F, "Возле камина Аркт может войти в медитацию в которой может изучить новые навыки. Прямо сейчас у него имеется 1 очко навыка, так что можешь намедитировать что-нибудь новенькое.", bj_TIMETYPE_ADD, 0.00, false)
            set udg_Tutorial[1] = false
        endif
    endif
    if(Trig_Enter_Regions_Func012C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetTerrainFogExBJ(0, 1500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
        set udg_Camera = gg_cam_Camera_Workshop
        set udg_Point = GetRectCenter(gg_rct_Room_Workshop_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Training)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
    endif
    if(Trig_Enter_Regions_Func013C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Gate)
        set udg_Camera = gg_cam_Camera_Portal
        if(Trig_Enter_Regions_Func013Func003C())then
            set udg_TutorialHint[1] = true
            call DialogClearBJ(udg_TeleportDialog)
            call DialogSetMessageBJ(udg_TeleportDialog, "Сложность можно менять в любое|nвремя, но в начале игры менять её |nне советую: сперва привыкни к |nбоевой системе. На лёгком уровне |nсложности монстры не применяют |nумения. И да, за повышение уровня|nАркта после прохождения подземе-|nлий повышается случайная хар-ка.")
            call DialogAddButtonBJ(udg_TeleportDialog, "Понятно, спасибо!")
            call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
        endif
    endif
    if(Trig_Enter_Regions_Func014C())then
        call SuspendHeroXPBJ(false, udg_Arct)
        call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
        call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
        call EnablePreSelect(true, true)
        set udg_Target = udg_Arct
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Artefactorium)
        set udg_Camera = gg_cam_Camera_Artefactorium
        set udg_Artefactorium = true
        set udg_Point = GetRectCenter(gg_rct_Artefactorium_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
        call EnableTrigger(gg_trg_Artefactorium_Damage)
    endif
    if(Trig_Enter_Regions_Func015C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetTerrainFogExBJ(0, 1500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call LeaderboardDisplayBJ(false, udg_CO_ComboBoard)
        call EnablePreSelect(false, false)
        call SetTerrainFogExBJ(0, 500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_2)
        set udg_Camera = gg_cam_Camera_Workshop_2
        set udg_Artefactorium = false
        set udg_Point = GetRectCenter(gg_rct_Vault_Machinery_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Room_Portal_Enter_2)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        call DestroyEffectBJ(udg_AR_SealEffect)
        call ClearTextMessagesBJ(GetPlayersAll())
    endif
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_UnitGroup, function Trig_Enter_Regions_Func018002)
    call DestroyGroup(udg_UnitGroup)
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(9))
    call ForGroupBJ(udg_UnitGroup, function Trig_Enter_Regions_Func021002)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Enter_Regions takes nothing returns nothing
    set gg_trg_Enter_Regions = CreateTrigger()
    call DisableTrigger(gg_trg_Enter_Regions)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Training)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Room_Portal_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Portal)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Artefatorium_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Artefatorium_Leave_2)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Machinery_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Room_Workshop_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Machinery)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Workshop_Machinery)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Workshop_Core)
    call TriggerAddCondition(gg_trg_Enter_Regions, Condition(function Trig_Enter_Regions_Conditions))
    call TriggerAddAction(gg_trg_Enter_Regions, function Trig_Enter_Regions_Actions)
endfunction
