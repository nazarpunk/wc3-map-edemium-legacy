
function Trig_Boss_Units_Remove_Func002002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Boss_Units_Remove_Func005002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Boss_Units_Remove_Func008002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Boss_Units_Remove_Func011002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Boss_Units_Remove_Func014002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Boss_Units_Remove_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func002002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_2_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func005002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func008002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func011002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(1))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func014002)
    call DestroyGroup(udg_D_Pick)
endfunction

function InitTrig_Boss_Units_Remove takes nothing returns nothing
    set gg_trg_Boss_Units_Remove = CreateTrigger()
    call TriggerAddAction(gg_trg_Boss_Units_Remove, function Trig_Boss_Units_Remove_Actions)
endfunction
