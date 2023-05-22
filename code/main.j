//! import "globals.j"

//! import "all.j"

//! import "InitCustomTriggers.j"

//! inject main
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    call SetTerrainFogEx(0, 1000.0, 10000.0, 0.000, 0.000, 0.502, 1.000)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("DalaranDay")
    call SetAmbientNightSound("DalaranNight")
    call SetMapMusic("Music", true, 0)
    call InitSoundsOld()
    call CreateRegionsOld()
    call CreateCamerasOld()
    call CreateAllDestructablesOld()
    call CreateAllUnitsOld()
    call InitBlizzard()
    call InitGlobalsOld()
    call InitCustomTriggersOld()
    //! dovjassinit
//! endinject

//! inject config
    call SetMapName("Edemium")
    call SetMapDescription("")
    call SetPlayers(3)
    call SetTeams(3)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    call DefineStartLocation(0, 6528.0, - 11648.0)
    call DefineStartLocation(1, 4224.0, 2112.0)
    call DefineStartLocation(2, 4160.0, 2112.0)
    call InitCustomPlayerSlots()
    call InitCustomTeams()
//! endinject


