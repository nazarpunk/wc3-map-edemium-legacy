function Trig_Effect_8_Config_Actions takes nothing returns nothing
    set udg_BE_DummyType = 0x6E303053
    set udg_BE_Model = "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl"
    set udg_BE_Bounces[1] = 4
    set udg_BE_Bounces[2] = 5
    set udg_BE_Bounces[3] = 6
    set udg_BE_Bounces[4] = 7
    set udg_BE_Bounces[5] = 8
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_SearchAoE[bj_forLoopAIndex] = 400.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_BE_CDamage[1] = 0.00
    set udg_BE_CHeal[1] = 0.00
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_DamageAddition[bj_forLoopAIndex] = 3.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_HealAddition[bj_forLoopAIndex] = 0.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_Speed[bj_forLoopAIndex] = (400.00 * 0.03)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_Height[bj_forLoopAIndex] = 300.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_BE_CSizeIncrement = 10.00
    set udg_BE_PosSpecialEffect = "war3mapImported\\HolySmiteMissileNew.mdx"
    set udg_BE_DamageType = DAMAGE_TYPE_MAGIC
    set udg_BE_AttackType = ATTACK_TYPE_NORMAL
    set udg_BE_TempPoint = GetRectCenter(bj_mapInitialPlayableArea)
    call CreateNUnitsAtLoc(1, 0x6E303053, Player(PLAYER_NEUTRAL_PASSIVE), udg_BE_TempPoint, bj_UNIT_FACING)
    set udg_BE_PreloadUnit = GetLastCreatedUnit()
    call RemoveUnit(GetLastCreatedUnit())
    call RemoveLocation(udg_BE_TempPoint)
endfunction

function InitTrig_Effect_8_Config takes nothing returns nothing
    set gg_trg_Effect_8_Config = CreateTrigger()
    call TriggerAddAction(gg_trg_Effect_8_Config, function Trig_Effect_8_Config_Actions)
endfunction
