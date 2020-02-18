local brm1_90_warhead =
{
    mass                 = 30, 
    caliber              = 90,
    expl_mass            = 10,
    piercing_mass        = 30,					
    other_factors        = { 1.0, 0.5, 0.5 },	
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0, 
}

local brm1_name = 'BRM-1 90MM'
local brm1_mass = 20.0
local pylon_mass = 45.0

BRM_1_90 = 
{
    category        = CAT_MISSILES,
    name            = brm1_name,
    user_name       = _(brm1_name),
    scheme          = "command_guided_spin_missile",
    class_name      = "wAmmunitionVikhr",
    model           = "brm1_90",
    mass            = brm1_mass,
    
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},

    Escort       = 1,
    Head_Type    = 4,
    sigma        = {3, 3, 3},
    M            = brm1_mass,
    H_max        = 10000.0,
    H_min        = 5.0,
    Diam         = 90.0,
    Cx_pil       = 0.08,
    D_max        = 30000.0,
    D_min        = 600.0,
    Head_Form    = 0,
    Life_Time    = 30.0,
    Nr_max       = 20,
    v_min        = 170.0,
    v_mid        = 800.0,
    Mach_max     = 2.5,
    t_b          = 0.0,
    t_acc        = 5.0,
    t_marsh      = 5.0,
    Range_max    = 8000.0,
    H_min_t      = 0.0,
    Fi_start     = 0.698,
    Fi_rak       = 3.14152,
    Fi_excort    = 0.698,
    Fi_search    = 99.9,
    OmViz_max    = 99.9,
    exhaust      = {0.63, 0.67, 0.75, 0.1},
    X_back       = 0.208,
    Y_back       = 0.0,
    Z_back       = 0.0,
    Reflection   = 0.015,
    KillDistance = 0.0,
    
    shape_table_data =
    {
        {
            name     = brm1_name,
            file     = "brm1_90",
            life     = 1,
            fire     = {0, 1},
            username = brm1_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    warhead     = brm1_90_warhead,
    warhead_air = brm1_90_warhead,
    
    controller = {
        boost_start = 0.001,
        march_start = 0.500,
    },
    
    booster = {
        impulse                         = 200,
        fuel_mass                       = 1.0,
        work_time                       = 0.3,
        nozzle_position                 = {{-0.65, 0, 0}},
        nozzle_orientationXYZ           = {{0.0, 0.0, 0.0}},
        tail_width                      = 0.2,
        smoke_color                     = {1.0, 1.0, 1.0},
        smoke_transparency              = 0.8,
        custom_smoke_dissipation_factor = 0.0,                
    },
    
    march = {
        impulse                         = 190,
        fuel_mass                       = 4.0,
        work_time                       = 0.8,
        nozzle_position                 = {{-0.65, 0, 0}},
        nozzle_orientationXYZ           = {{0.0, 0.0, 0.0}},
        tail_width                      = 0.05,
        smoke_color                     = {1.0, 1.0, 1.0},
        smoke_transparency              = 0.1,
        custom_smoke_dissipation_factor = 0.2,
    },
    
    spiral_nav = {
        t_cone_near_rad         = 1000,
        def_cone_max_dist       = 10000,
        def_cone_near_rad       = 15,
        def_cone_near_rad_st    = 500,
        def_cone_time_stab_rad  = 5,
        gb_angle                = 0.0,
        gb_min_dist             = 0.0,
        gb_use_time             = 0.0,
        gb_max_retW             = 0.0,
        gb_ret_Kp               = 0.0,
    },
    
    autopilot = {
        Kp                    = 0.078,
        Ki                    = 0.058,
        Kd                    = 0.038,
        max_ctrl_angle        = 0.8,
        delay                 = 0.2,
        op_time               = 24.0,
        fins_discreet         = 0.04,
        no_ctrl_center_ang    = 0.00004,
    },

    fm = {
        mass        = brm1_mass,
        caliber     = 0.09,
        L           = 2,
        I           = 1 / 12 * brm1_mass * 2 * 2,
        Ma          = 1.5,
        Mw          = 6.0,
        cx_coeff    = {1,0.91,0.67,0.3248,2.08},
        Sw          = 0.11,
        dCydA       = {0.024, 0.018},
        A           = 0.6,
        maxAoa      = 0.2,
        finsTau     = 0.05,
        freq        = 8.0,
    },
    
    eng_err = {
        y_error = 0.0,
        z_error = 0.0,
        min_time_interval = 0.1,
        max_time_interval = 1.0,
    },
}

declare_weapon(BRM_1_90)


declare_loadout({
    category        = CAT_ROCKETS,
    CLSID           = 'DIS_BRM1_90',
    wsTypeOfWeapon  = BRM_1_90.wsTypeOfWeapon,
    attribute       = {4, 4, 32, WSTYPE_PLACEHOLDER},
    Count           = 16,
    Cx_pil          = 0.002,
    Picture         = "brm1_pod.png",
    displayName     = _(brm1_name),
    Weight          = 97.5 + 16 * BRM_1_90.mass + pylon_mass,
    Elements        = RocketPod("brm1_pod", "brm1_90", 16),
    Required = {"DIS_WMD7"},
    JettisonSubmunitionOnly = false,
})


local rkt90_name = 'Unguided Rocket 90mm'
local rkt90_mass = 15.0

RKT_90_UG =
{
    category        = CAT_ROCKETS,
    name            = rkt90_name,
    user_name       = _(rkt90_name),
    scheme          = "nurs-standard",
    class_name      = "wAmmunitionNURS",
    model           = "90-1",
    mass            = rkt90_mass,
    
    wsTypeOfWeapon  = {4, 7, 33, WSTYPE_PLACEHOLDER},

    shape_table_data =
    {
        {
            name     = rkt90_name,
            file     = "90-1",
            life     = 1,
            fire     = {0, 1},
            username = rkt90_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    warhead     = brm1_90_warhead,
    warhead_air = brm1_90_warhead,
    
    properties = {
        dist_min =  600, -- min range, meters
        dist_max = 30000, -- max range, meters
    },
    
    fm = {
        mass        = rkt90_mass,
        caliber     = 0.09,  
        cx_coeff    = {1,0.91,0.67,0.3248,2.08},
        L           = 2,
        I           = 1 / 12 * rkt90_mass * 2 * 2,
        Ma          = 2,
        Mw          = 5,
        shapeName   = "90-1",
        wind_time   = 1.1,
        wind_sigma  = 5,
    },
    
    engine = {
        fuel_mass               = 6.0,
        impulse                 = 400,
        boost_time              = 0,
        work_time               = 6.0,
        boost_factor            = 1,
        nozzle_position         = {{-0.65, 0, 0}},
        nozzle_orientationXYZ   = {{0, 0, 0}},
        tail_width              = 0.052,
        boost_tail              = 1,
        work_tail               = 1,
        smoke_color             = {0.9, 0.9, 0.9},
        smoke_transparency      = 0.5,
    },
}

declare_weapon(RKT_90_UG)


declare_loadout({
    category        = CAT_ROCKETS,
    CLSID           = 'DIS_RKT_90_UG',
    wsTypeOfWeapon  = RKT_90_UG.wsTypeOfWeapon,
    attribute       = {4, 7, 32, WSTYPE_PLACEHOLDER},
    Count           = 32,
    Cx_pil          = 0.002,
    Picture         = "brm1_pod.png",
    displayName     = _(rkt90_name),
    Weight          = 97.5 + 16 * RKT_90_UG.mass + pylon_mass,
    Elements        = RocketPod("brm1_pod", "90-1", 16),
    JettisonSubmunitionOnly = false,
})
