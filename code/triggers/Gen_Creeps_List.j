
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 17.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 16.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 15.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 14.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 13.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 12.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 11.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 10.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 9.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 8.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 7.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 6.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 5.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 4.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 3.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 2.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Actions takes nothing returns nothing
    if(Trig_Gen_Creeps_List_Func006C())then
        set udg_D_CreepType[1] = 0x6E303032
        set udg_D_CreepType[2] = 0x6E303030
        set udg_D_CreepType[3] = 0x6E303033
        set udg_D_CreepType[4] = 0x6E30304A
        set udg_D_CreepType[5] = 0x6E30304A
        set udg_CC_IngredientDrop = 2
        set udg_IG_ItemLVL_Max = 4
    else
        if(Trig_Gen_Creeps_List_Func006Func001C())then
            set udg_D_CreepType[1] = 0x6E303030
            set udg_D_CreepType[2] = 0x6E303031
            set udg_D_CreepType[3] = 0x6E303035
            set udg_D_CreepType[4] = 0x6E30304A
            set udg_D_CreepType[5] = 0x6E30304A
            set udg_CC_IngredientDrop = 3
            set udg_IG_ItemLVL_Max = 4
        else
            if(Trig_Gen_Creeps_List_Func006Func001Func001C())then
                set udg_D_CreepType[1] = 0x6E303030
                set udg_D_CreepType[2] = 0x6E303031
                set udg_D_CreepType[3] = 0x6E303035
                set udg_D_CreepType[4] = 0x6E30304A
                set udg_D_CreepType[5] = 0x6E30304B
                set udg_CC_IngredientDrop = 3
                set udg_IG_ItemLVL_Max = 4
            else
                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001C())then
                    set udg_D_CreepType[1] = 0x6E303034
                    set udg_D_CreepType[2] = 0x6E303031
                    set udg_D_CreepType[3] = 0x6E303035
                    set udg_D_CreepType[4] = 0x6E30304B
                    set udg_D_CreepType[5] = 0x6E30304B
                    set udg_CC_IngredientDrop = 3
                    set udg_IG_ItemLVL_Max = 5
                else
                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001C())then
                        set udg_D_CreepType[1] = 0x6E303043
                        set udg_D_CreepType[2] = 0x6E303043
                        set udg_D_CreepType[3] = 0x6E30304E
                        set udg_D_CreepType[4] = 0x6E303050
                        set udg_D_CreepType[5] = 0x6E303050
                        set udg_CC_IngredientDrop = 4
                        set udg_IG_ItemLVL_Max = 5
                    else
                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001C())then
                            set udg_D_CreepType[1] = 0x6E303043
                            set udg_D_CreepType[2] = 0x6E303059
                            set udg_D_CreepType[3] = 0x6E30304E
                            set udg_D_CreepType[4] = 0x6E303050
                            set udg_D_CreepType[5] = 0x6E303050
                            set udg_CC_IngredientDrop = 4
                            set udg_IG_ItemLVL_Max = 6
                        else
                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006C())then
                                set udg_D_CreepType[1] = 0x6E303043
                                set udg_D_CreepType[2] = 0x6E303059
                                set udg_D_CreepType[3] = 0x6E30304E
                                set udg_D_CreepType[4] = 0x6E303057
                                set udg_D_CreepType[5] = 0x6E303050
                                set udg_CC_IngredientDrop = 4
                                set udg_IG_ItemLVL_Max = 6
                            else
                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006C())then
                                    set udg_D_CreepType[1] = 0x6E303043
                                    set udg_D_CreepType[2] = 0x6E303059
                                    set udg_D_CreepType[3] = 0x6E30304E
                                    set udg_D_CreepType[4] = 0x6E303057
                                    set udg_D_CreepType[5] = 0x6E30304F
                                    set udg_CC_IngredientDrop = 5
                                    set udg_IG_ItemLVL_Max = 7
                                else
                                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006C())then
                                        set udg_D_CreepType[1] = 0x6E303043
                                        set udg_D_CreepType[2] = 0x6E303059
                                        set udg_D_CreepType[3] = 0x6E30304E
                                        set udg_D_CreepType[4] = 0x6E303057
                                        set udg_D_CreepType[5] = 0x6E30304F
                                        set udg_CC_IngredientDrop = 5
                                        set udg_IG_ItemLVL_Max = 7
                                    else
                                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006C())then
                                            set udg_D_CreepType[1] = 0x6E303041
                                            set udg_D_CreepType[2] = 0x6E303051
                                            set udg_D_CreepType[3] = 0x6E303051
                                            set udg_D_CreepType[4] = 0x6E30305A
                                            set udg_D_CreepType[5] = 0x6E30305A
                                            set udg_CC_IngredientDrop = 6
                                            set udg_IG_ItemLVL_Max = 7
                                        else
                                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001C())then
                                                set udg_D_CreepType[1] = 0x6E303041
                                                set udg_D_CreepType[2] = 0x6E303051
                                                set udg_D_CreepType[3] = 0x6E303051
                                                set udg_D_CreepType[4] = 0x6E303052
                                                set udg_D_CreepType[5] = 0x6E30305A
                                                set udg_CC_IngredientDrop = 6
                                                set udg_IG_ItemLVL_Max = 8
                                            else
                                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006C())then
                                                    set udg_D_CreepType[1] = 0x6E303041
                                                    set udg_D_CreepType[2] = 0x6E303051
                                                    set udg_D_CreepType[3] = 0x6E303130
                                                    set udg_D_CreepType[4] = 0x6E303052
                                                    set udg_D_CreepType[5] = 0x6E30305A
                                                    set udg_CC_IngredientDrop = 6
                                                    set udg_IG_ItemLVL_Max = 8
                                                else
                                                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006C())then
                                                        set udg_D_CreepType[1] = 0x6E303041
                                                        set udg_D_CreepType[2] = 0x6E303051
                                                        set udg_D_CreepType[3] = 0x6E303130
                                                        set udg_D_CreepType[4] = 0x6E303054
                                                        set udg_D_CreepType[5] = 0x6E303052
                                                        set udg_CC_IngredientDrop = 7
                                                        set udg_IG_ItemLVL_Max = 8
                                                    else
                                                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006C())then
                                                            set udg_D_CreepType[1] = 0x6E303041
                                                            set udg_D_CreepType[2] = 0x6E303051
                                                            set udg_D_CreepType[3] = 0x6E303130
                                                            set udg_D_CreepType[4] = 0x6E303054
                                                            set udg_D_CreepType[5] = 0x6E303052
                                                            set udg_CC_IngredientDrop = 7
                                                            set udg_IG_ItemLVL_Max = 9
                                                        else
                                                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006C())then
                                                                set udg_D_CreepType[1] = 0x6E303041
                                                                set udg_D_CreepType[2] = 0x6E303056
                                                                set udg_D_CreepType[3] = 0x6E303130
                                                                set udg_D_CreepType[4] = 0x6E303054
                                                                set udg_D_CreepType[5] = 0x6E303052
                                                                set udg_CC_IngredientDrop = 9
                                                                set udg_IG_ItemLVL_Max = 9
                                                            else
                                                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006Func001C())then
                                                                    set udg_D_CreepType[1] = 0x6E303041
                                                                    set udg_D_CreepType[2] = 0x6E303056
                                                                    set udg_D_CreepType[3] = 0x6E303130
                                                                    set udg_D_CreepType[4] = 0x6E303054
                                                                    set udg_D_CreepType[5] = 0x6E303055
                                                                    set udg_CC_IngredientDrop = 9
                                                                    set udg_IG_ItemLVL_Max = 9
                                                                else
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps)
endfunction
function InitTrig_Gen_Creeps_List takes nothing returns nothing
    set gg_trg_Gen_Creeps_List = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps_List, function Trig_Gen_Creeps_List_Actions)
endfunction