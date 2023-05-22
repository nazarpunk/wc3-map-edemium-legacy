
function Trig_Tutorial02_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Enter_Regions)
    set udg_Tutorial[3] = false
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_10F, "Что же. Вы готовы. Можно отправляться в портал. Удачи.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_H000_0004, "Аркт", gg_snd_11F, "Да с кем ты там разговариваешь!?", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_12F, "Заткнись.", bj_TIMETYPE_ADD, 0.00, true)
    call EnableTrigger(gg_trg_Enter_Dialog)
    call EnableTrigger(gg_trg_Damage_Effects)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Tutorial02 takes nothing returns nothing
    set gg_trg_Tutorial02 = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial02, function Trig_Tutorial02_Actions)
endfunction
