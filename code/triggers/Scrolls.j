
function Trig_Scrolls_Actions takes nothing returns nothing
    call CreateItemLoc(0x49303143, GetUnitLoc(udg_Arct))
    call CreateItemLoc(0x49303131, GetUnitLoc(udg_Arct))
    call CreateItemLoc(0x49303055, GetUnitLoc(udg_Arct))
endfunction

function InitTrig_Scrolls takes nothing returns nothing
    set gg_trg_Scrolls = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Scrolls, Player(0), "sc", true)
    call TriggerAddAction(gg_trg_Scrolls, function Trig_Scrolls_Actions)
endfunction
