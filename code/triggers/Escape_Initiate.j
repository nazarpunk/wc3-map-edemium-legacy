function Trig_Escape_Initiate_Conditions takes nothing returns boolean
    return GetTriggerUnit() == udg_Arct
endfunction

function Trig_Escape_Initiate_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(udg_D_Exit)
    call CreateNUnitsAtLocFacingLocBJ(1, 0x6E303042, Player(11), udg_D_Point1, GetUnitLoc(GetTriggerUnit()))
    set udg_D_Guardian = GetLastCreatedUnit()
    call PlaySoundAtPointBJ(gg_snd_HPitLordYes3, 100, udg_D_Point1, 0)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Exit)
    call SetUnitPositionLoc(udg_D_Exit, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    call AddSpecialEffectTargetUnitBJ("origin", udg_D_Guardian, "Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Escape_Initiate takes nothing returns nothing
    set gg_trg_Escape_Initiate = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Initiate)
    call TriggerRegisterUnitInRangeSimple(gg_trg_Escape_Initiate, 256.00, gg_unit_h00N_0045)
    call TriggerAddCondition(gg_trg_Escape_Initiate, Condition(function Trig_Escape_Initiate_Conditions))
    call TriggerAddAction(gg_trg_Escape_Initiate, function Trig_Escape_Initiate_Actions)
endfunction
