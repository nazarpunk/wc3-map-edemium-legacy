function Trig_Abilities_Study_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303241
endfunction

function Trig_Abilities_Study_Actions takes nothing returns nothing
    if udg_AS_Points >= 300 then
        set udg_AS_Points = (udg_AS_Points - 300)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "SandTrap.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call UnitAddAbilityBJ(0x4130364A, udg_Target)
        call UnitAddAbilityBJ(0x4130364B, udg_Target)
        call UnitAddAbilityBJ(0x4130364C, udg_Target)
        call UnitAddAbilityBJ(0x4130364D, udg_Target)
        call UnitRemoveAbilityBJ(0x41303241, udg_Target)
        set udg_AS_AbilityStudied[GetUnitUserData(udg_Target)] = 1
        if udg_Target == gg_unit_h006_0081 then
            call RemoveDestructable(gg_dest_B003_2936)
            call ShowDestructableBJ(true, gg_dest_B00B_1355)
        else
            if udg_Target == gg_unit_h006_0075 then
                call RemoveDestructable(gg_dest_B003_2937)
                call ShowDestructableBJ(true, gg_dest_B00B_1357)
            else
                if udg_Target == gg_unit_h006_0077 then
                    call RemoveDestructable(gg_dest_B003_2939)
                    call ShowDestructableBJ(true, gg_dest_B00B_1354)
                else
                    if udg_Target == gg_unit_h006_0079 then
                        call RemoveDestructable(gg_dest_B003_2941)
                        call ShowDestructableBJ(true, gg_dest_B00B_1356)
                    else
                        if udg_Target == gg_unit_h006_0082 then
                            call RemoveDestructable(gg_dest_B003_2935)
                            call ShowDestructableBJ(true, gg_dest_B00B_1366)
                        else
                            if udg_Target == gg_unit_h006_0076 then
                                call RemoveDestructable(gg_dest_B003_2938)
                                call ShowDestructableBJ(true, gg_dest_B00B_1367)
                            else
                                if udg_Target == gg_unit_h006_0078 then
                                    call RemoveDestructable(gg_dest_B003_2940)
                                    call ShowDestructableBJ(true, gg_dest_B00B_1389)
                                else
                                    if udg_Target == gg_unit_h006_0080 then
                                        call RemoveDestructable(gg_dest_B003_2942)
                                        call ShowDestructableBJ(true, gg_dest_B00B_1390)
                                    else
                                        if udg_Target == gg_unit_h006_0071 then
                                            call RemoveDestructable(gg_dest_B003_2928)
                                            call ShowDestructableBJ(true, gg_dest_B00B_1359)
                                        else
                                            if udg_Target == gg_unit_h006_0069 then
                                                call RemoveDestructable(gg_dest_B003_2929)
                                                call ShowDestructableBJ(true, gg_dest_B00B_1362)
                                            else
                                                if udg_Target == gg_unit_h006_0073 then
                                                    call RemoveDestructable(gg_dest_B003_2932)
                                                    call ShowDestructableBJ(true, gg_dest_B00B_1361)
                                                else
                                                    if udg_Target == gg_unit_h006_0067 then
                                                        call RemoveDestructable(gg_dest_B003_2930)
                                                        call ShowDestructableBJ(true, gg_dest_B00B_1360)
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
    else
        call DisplayTimedTextToForce(GetPlayersAll(), 1.00, "Недостаточно очков умений (всего требуется 300 ед.).")
    endif
    
    if udg_Tutorial[2] then
        set udg_Tutorial[2] = false
        set udg_Tutorial[3] = true
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_9F, "Советую выставить навык на 3 серию. Чем меньше серия - тем меньше кнопок подряд надо нажать и тем чаще Аркт будет применять его.", bj_TIMETYPE_ADD, 0.00, true)
    endif
endfunction

function InitTrig_Abilities_Study takes nothing returns nothing
    set gg_trg_Abilities_Study = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Study, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Study, Condition(function Trig_Abilities_Study_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Study, function Trig_Abilities_Study_Actions)
endfunction
