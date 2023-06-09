function Trig_Dungeon_Deadly_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303348
endfunction

function Trig_Dungeon_Deadly_Actions takes nothing returns nothing
    set udg_DungeonDeadlyCleansing = (udg_DungeonDeadlyCleansing - 1)
    if udg_DungeonDeadlyCleansing == 0 then
        call UnitRemoveAbilityBJ(0x41303348, GetTriggerUnit())
    endif
    set udg_PointCleansing = GetSpellTargetLoc()
    call TriggerSleepAction(0.70)
    if udg_D_DungeonTier == 1 then
        set udg_D_TextureType = 0x51647272
    else
        if udg_D_DungeonTier == 2 then
            set udg_D_TextureType = 0x416C7664
        else
            set udg_D_TextureType = 0x4762726B
        endif
    endif
    call SetTerrainTypeBJ(udg_PointCleansing, udg_D_TextureType, - 1, 4, 0)
    call RemoveLocation(udg_PointCleansing)
endfunction

function InitTrig_Dungeon_Deadly takes nothing returns nothing
    set gg_trg_Dungeon_Deadly = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Deadly)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Deadly, ArctUnit, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Dungeon_Deadly, Condition(function Trig_Dungeon_Deadly_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Deadly, function Trig_Dungeon_Deadly_Actions)
endfunction
