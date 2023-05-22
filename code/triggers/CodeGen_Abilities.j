function Trig_CodeGen_Abilities_Actions takes nothing returns nothing
    call UnitAddAbilityBJ(0x4130364A, udg_Target)
    call UnitAddAbilityBJ(0x4130364B, udg_Target)
    call UnitAddAbilityBJ(0x4130364C, udg_Target)
    call UnitAddAbilityBJ(0x4130364D, udg_Target)
    call UnitRemoveAbilityBJ(0x41303241, udg_Target)
endfunction
function InitTrig_CodeGen_Abilities takes nothing returns nothing
    set gg_trg_CodeGen_Abilities = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Abilities, function Trig_CodeGen_Abilities_Actions)
endfunction