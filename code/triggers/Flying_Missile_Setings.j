
function Trig_Flying_Missile_Setings_Conditions takes nothing returns boolean
    if(not(0x4130354B == GetSpellAbilityId()))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func003C takes nothing returns boolean
    if(not(udg_BL_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303149))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_BL_Idol == true))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 33))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 22))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) != 22))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303133))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Actions takes nothing returns nothing
    if(Trig_Flying_Missile_Setings_Func003C())then
        call EnableTrigger(gg_trg_Flying_Missile_Loop)
    else
    endif
    set udg_BL_Skip = (udg_BL_Skip + 1)
    set udg_BL_Times = (udg_BL_Times + 1)
    set udg_BL_Off[udg_BL_Times] = true
    set udg_BL_Hero[udg_BL_Times] = GetSpellAbilityUnit()
    set udg_BL_Point[0] = GetUnitLoc(GetSpellAbilityUnit())
    set udg_BL_Point[1] = GetSpellTargetLoc()
    set udg_BL_Angle[udg_BL_Times] = AngleBetweenPoints(udg_BL_Point[0], udg_BL_Point[1])
    set udg_BL_Distance[udg_BL_Times] = 1000.00
    set udg_BL_Speed[udg_BL_Times] = 11.25
    set udg_BL_AoE[udg_BL_Times] = 100.00
    set udg_BL_Collision[udg_BL_Times] = 50.00
    call CreateNUnitsAtLoc(1, 0x6E303053, GetOwningPlayer(udg_BL_Hero[udg_BL_Times]), udg_BL_Point[0], udg_BL_Angle[udg_BL_Times])
    set udg_BL_Missile[udg_BL_Times] = GetLastCreatedUnit()
    call SetUnitFlyHeightBJ(udg_BL_Missile[udg_BL_Times], 30.00, 0.00)
    if(Trig_Flying_Missile_Setings_Func019C())then
        set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl")
        set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
        set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
    else
        if(Trig_Flying_Missile_Setings_Func019Func001C())then
            set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
        else
            if(Trig_Flying_Missile_Setings_Func019Func001Func001C())then
                set udg_BL_Dmg[udg_BL_Times] = (120.00 * I2R(udg_Difficulty))
                call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
                set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl")
                set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
            else
                if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001C())then
                    set udg_BL_Dmg[udg_BL_Times] = (200.00 * I2R(udg_Difficulty))
                    call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "war3mapImported\\Black Missile.mdx")
                    set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                    call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
                    set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                    set udg_BL_Speed[udg_BL_Times] = (14.00 + I2R(udg_Difficulty))
                else
                    if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009C())then
                        set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
                        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl")
                        set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
                        set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                    else
                        if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009Func001C())then
                            set udg_BL_Dmg[udg_BL_Times] = (I2R(udg_CO_Power) * 3.00)
                            set udg_BL_Dmg[udg_BL_Times] = (udg_BL_Dmg[udg_BL_Times] + I2R(udg_CO_Combo))
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\PriestMissile\\PriestMissile.mdl")
                            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl")
                            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                        else
                            set udg_BL_Dmg[udg_BL_Times] = (100.00 * I2R(udg_Difficulty))
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\CryptFiendMissile\\CryptFiendMissile.mdl")
                            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilMissile.mdl")
                            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                        endif
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_BL_Point[0])
    call RemoveLocation(udg_BL_Point[1])
endfunction
function InitTrig_Flying_Missile_Setings takes nothing returns nothing
    set gg_trg_Flying_Missile_Setings = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Flying_Missile_Setings, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Flying_Missile_Setings, Condition(function Trig_Flying_Missile_Setings_Conditions))
    call TriggerAddAction(gg_trg_Flying_Missile_Setings, function Trig_Flying_Missile_Setings_Actions)
endfunction