
function Trig_Tutorial_Initialisation_Actions takes nothing returns nothing
    set udg_Tutorial[4] = true
    set udg_Tutorial[5] = true
    set udg_TutorialHint[1] = true
    set udg_TutorialHintsOn = true
    call EnableTrigger(gg_trg_Escape_Dialog)
    call EnableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Item_Pickup)
    call DisableTrigger(gg_trg_Damage_Effects)
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Enter)
    call SuspendHeroXPBJ(false, udg_Arct)
    call SetUnitPositionLoc(udg_Arct, GetRectCenter(gg_rct_Artefactorium_Enter))
    call RemoveLocation(udg_Point)
    set udg_Camera = gg_cam_Camera_Artefactorium
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    set udg_Training = true
    set udg_Artefactorium = true
    set udg_Tutorial[1] = true
    set udg_Tutorial[2] = true
    set udg_Tutorial[3] = false
    set udg_Tutorial[4] = true
    set udg_Tutorial[5] = true
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Tutorial_Initialisation takes nothing returns nothing
    set gg_trg_Tutorial_Initialisation = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial_Initialisation, function Trig_Tutorial_Initialisation_Actions)
endfunction