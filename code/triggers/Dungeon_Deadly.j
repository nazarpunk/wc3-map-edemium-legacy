
function Trig_Dungeon_Deadly_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303348))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func002C takes nothing returns boolean
    if(not(udg_DungeonDeadlyCleansing == 0))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func005Func001C takes nothing returns boolean
    if(not(udg_D_DungeonTier == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func005C takes nothing returns boolean
    if(not(udg_D_DungeonTier == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Actions takes nothing returns nothing
    set udg_DungeonDeadlyCleansing = (udg_DungeonDeadlyCleansing - 1)
    if(Trig_Dungeon_Deadly_Func002C())then
        call UnitRemoveAbilityBJ(0x41303348, GetTriggerUnit())
    else
    endif
    set udg_PointCleansing = GetSpellTargetLoc()
    call TriggerSleepAction(0.70)
    if(Trig_Dungeon_Deadly_Func005C())then
        set udg_D_TextureType = 0x51647272
    else
        if(Trig_Dungeon_Deadly_Func005Func001C())then
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
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Deadly, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Dungeon_Deadly, Condition(function Trig_Dungeon_Deadly_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Deadly, function Trig_Dungeon_Deadly_Actions)
endfunction