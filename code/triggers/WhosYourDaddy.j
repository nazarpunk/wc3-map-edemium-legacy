
function Trig_WhosYourDaddy_Conditions takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_AntiCheatUnit[2]))then
        return false
    endif
    return true
endfunction

function Trig_WhosYourDaddy_Actions takes nothing returns nothing
    call CustomDefeatBJ(Player(0), "Боги наблюдают на тобой.")
endfunction

function InitTrig_WhosYourDaddy takes nothing returns nothing
    set gg_trg_WhosYourDaddy = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_WhosYourDaddy, Player(10), EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_WhosYourDaddy, Condition(function Trig_WhosYourDaddy_Conditions))
    call TriggerAddAction(gg_trg_WhosYourDaddy, function Trig_WhosYourDaddy_Actions)
endfunction
