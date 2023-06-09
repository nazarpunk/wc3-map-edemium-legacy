function Trig_Ending_Init_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    call DisableTrigger(gg_trg_Camera_Boss)
    call EnableTrigger(gg_trg_Camera_Hero)
    call SetUnitLifePercentBJ(ArctUnit, 100)
    call SetUnitManaPercentBJ(ArctUnit, 100)
    call StopMusic(true)
    call UnitAddAbilityBJ(0x4176756C, ArctUnit)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Use)
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Abort)
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call ConditionalTriggerExecute(gg_trg_Boss_Units_Remove)
    set udg_Point = GetRectCenter(gg_rct_Boss_3_Spawn)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Special-2.mdx")
    call DestroyEffect(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(5.00)
    set udg_Point = GetUnitLoc(gg_unit_h00V_0029)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Retribution.mdx")
    call DestroyEffect(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(0.80)
    call ShowUnitShow(gg_unit_h00V_0029)
    call UnitAddAbilityBJ(0x416C6F63, gg_unit_h00V_0029)
    call TriggerSleepAction(3.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor1, "Путь Пилигрима пройден. Что ты чувствуешь?", bj_TIMETYPE_ADD, 0.00, true)
    call DialogClear(udg_EndingDialog)
    call DialogSetMessage(udg_EndingDialog, "Что ты чувствуешь?")
    call DialogAddButtonBJ(udg_EndingDialog, "Грусть")
    set udg_DialogButton[1] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_EndingDialog, "Облегчение")
    set udg_DialogButton[2] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_EndingDialog, "Радость")
    set udg_DialogButton[3] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_EndingDialog, "Воодушевление")
    set udg_DialogButton[4] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_EndingDialog, "Безразличие")
    set udg_DialogButton[5] = bj_lastCreatedButton
    call DialogAddButtonBJ(udg_EndingDialog, "Голод")
    set udg_DialogButton[6] = bj_lastCreatedButton
    call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
    call EnableTrigger(gg_trg_Ending_Dialogue_1)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Ending_Init takes nothing returns nothing
    set gg_trg_Ending_Init = CreateTrigger()
    call TriggerAddAction(gg_trg_Ending_Init, function Trig_Ending_Init_Actions)
endfunction
