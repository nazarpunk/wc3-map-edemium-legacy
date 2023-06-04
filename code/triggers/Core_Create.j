function Trig_Core_Create_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303449
endfunction

function Trig_Core_Create_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    if udg_CC_IngredientAdded[1] == 3 or udg_CC_IngredientAdded[2] == 3 then
        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00Y_0005)
    else
        if udg_CC_IngredientAdded[1] == 3 or udg_CC_IngredientAdded[2] == 2 then
            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00H_0002)
        else
            if udg_CC_IngredientAdded[1] == 5 and udg_CC_IngredientAdded[2] == 5 then
                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00Z_0007)
            else
                if udg_CC_IngredientAdded[1] == 1 and udg_CC_IngredientAdded[3] == 3 then
                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h011_0009)
                else
                    if udg_CC_IngredientAdded[2] == 4 and udg_CC_IngredientAdded[3] == 4 then
                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h010_0008)
                    else
                        if udg_CC_IngredientAdded[3] == 3 and udg_CC_IngredientAdded[4] == 8 then
                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h002_0010)
                        else
                            if udg_CC_IngredientAdded[4] == 10 and udg_CC_IngredientAdded[5] == 3 then
                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h003_0014)
                            else
                                if udg_CC_IngredientAdded[2] == 5 and udg_CC_IngredientAdded[3] == 5 then
                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00U_0015)
                                else
                                    if udg_CC_IngredientAdded[8] == 4 and udg_CC_IngredientAdded[9] == 3 then
                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h015_0016)
                                    else
                                        if udg_CC_IngredientAdded[4] == 8 and udg_CC_IngredientAdded[6] == 5 then
                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h016_0017)
                                        else
                                            if udg_CC_IngredientAdded[3] == 2 and udg_CC_IngredientAdded[7] == 6 then
                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h017_0018)
                                            else
                                                if udg_CC_IngredientAdded[7] == 3 and udg_CC_IngredientAdded[8] == 3 then
                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h018_0019)
                                                else
                                                    if udg_CC_IngredientAdded[4] == 10 then
                                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h019_0020)
                                                    else
                                                        if udg_CC_IngredientAdded[5] == 5 then
                                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01A_0021)
                                                        else
                                                            if udg_CC_IngredientAdded[6] == 6 and udg_CC_IngredientAdded[7] == 6 then
                                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01B_0022)
                                                            else
                                                                if udg_CC_IngredientAdded[1] == 5 and udg_CC_IngredientAdded[5] == 3 then
                                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01C_0023)
                                                                else
                                                                    if udg_CC_IngredientAdded[6] == 7 then
                                                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01D_0024)
                                                                    else
                                                                        if udg_CC_IngredientAdded[8] == 3 and udg_CC_IngredientAdded[9] == 2 then
                                                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01E_0025)
                                                                        else
                                                                            if udg_CC_IngredientAdded[4] == 6 and udg_CC_IngredientAdded[7] == 2 then
                                                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01F_0026)
                                                                            else
                                                                                if udg_CC_IngredientAdded[1] == 2 and udg_CC_IngredientAdded[2] == 2 and udg_CC_IngredientAdded[3] == 2 and udg_CC_IngredientAdded[4] == 2 then
                                                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01G_0027)
                                                                                else
                                                                                    call CreateTextTagUnitBJ("Ничего...", ArctUnit, 0, 10.00, 100.00, 100.00, 100.00, 0)
                                                                                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                                                                                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                                                                                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                                                                                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
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
                endif
            endif
        endif
    endif
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if not udg_CC_SecretUnlocked[udg_CC_SecretNumber] then
        set udg_CC_SecretUnlocked[udg_CC_SecretNumber] = true
        call ShowUnitShow(udg_CC_SecretUnit[udg_CC_SecretNumber])
    endif
endfunction

function InitTrig_Core_Create takes nothing returns nothing
    set gg_trg_Core_Create = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Create, gg_unit_h00F_0003, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Core_Create, Condition(function Trig_Core_Create_Conditions))
    call TriggerAddAction(gg_trg_Core_Create, function Trig_Core_Create_Actions)
endfunction