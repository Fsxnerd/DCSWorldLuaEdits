
local sd10_name = 'SD-10'
local sd10_mass = 199.0
local pylon_mass = 90.0
local pylon_dual_mass = 160.0

SD_10_AA = {
    category        = CAT_AIR_TO_AIR,
    name            = sd10_name,
    model           = 'pl12',
    user_name       = _(sd10_name),
    wsTypeOfWeapon  = {4,4,7,WSTYPE_PLACEHOLDER},
    mass            = sd10_mass,
    
    Escort          = 0,
    Head_Type       = 2,
    sigma           = {5, 5, 5},
    M               = sd10_mass,
    H_max           = 25000.0,
    H_min           = -1.0,
    Diam            = 203.0,
    Cx_pil          = 2,
    D_max           = 65000.0,
    D_min           = 1000.0,
    Head_Form       = 1,
    Life_Time       = 180.0,
    Nr_max          = 30,
    v_min           = 140.0,
    v_mid           = 1200.0,
    Mach_max        = 4.0,
    t_b             = 0.0,
    t_acc           = 6.0,
    t_marsh         = 4.0,
    Range_max       = 100000.0,
    H_min_t         = 3.0,
    Fi_start        = 0.5,
    Fi_rak          = 3.14152,
    Fi_excort       = 1.05,
    Fi_search       = 1.05,
    OmViz_max       = 0.52,
    warhead         = enhanced_a2a_warhead(18.0);
    exhaust         = { 1, 1, 1, 0.3 };
    X_back          = -1.74,
    Y_back          = -0.11,
    Z_back          = 0.0,
    Reflection      = 0.0329,
    KillDistance    = 11.0,

    shape_table_data = {
        {
            name     = sd10_name,
            file     = 'pl12',
            life     = 1,
            fire     = {0, 1},
            username = sd10_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    loft   = 1,
    hoj    = 1,
    ccm_k0 = 0.05,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	rad_correction = 1,
	
    PN_coeffs = { 3,                 -- Number of Entries    
                  5000.0 , 1.0,        -- Less 5 km to target Pn = 1
                  15000.0, 0.8,        -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
                  30000.0, 0.6,
                },
    supersonic_A_coef_skew = 0.25, -- slope of the direct polarity factor of the polar on supersonic
    nozzle_exit_area       = 0.007238, -- the nozzle exit area
    
    ModelData = {   
        58 ,  -- model params count
        0.9 ,   -- characteristic square (характеристическая площадь)

        -- параметры зависимости Сx
        0.012 , -- планка Сx0 на дозвуке ( M << 1) cx_k0
        0.042 , -- высота пика волнового кризиса cx_k1
        0.012 , -- крутизна фронта на подходе к волновому кризису cx_k2
        0.003 , -- планка Cx0 на сверхзвуке ( M >> 1) cx_k3
        1.20  , -- крутизна спада за волновым кризисом cx_k4
        1.50  , -- коэффициент отвала поляры

        -- параметры зависимости Cy
        0.90 , -- планка Сy0 на дозвуке ( M << 1)
        0.75 , -- планка Cy0 на сверхзвуке ( M >> 1)
        1.20 , -- крутизна спада(фронта) за волновым кризисом

        0.29 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
        0.00, --угловая скорость создаваймая моментом газовых рулей

        --    t_statr   t_b      t_accel  t_march   t_inertial   t_break  t_end
        -1.0,   -1.0,       6.0,     4.0,      0.0,          0.0,      1.0e9,           -- time interval
         0.0,    0.0,      10.0,     2.5,      0.0,          0.0,        0.0,           -- fuel flow rate in second kg/sec(секундный расход массы топлива кг/сек)
         0.0,    0.0,   25500.0,  10000.0,      0.0,          0.0,        0.0,           -- thrust

        1.0e9, -- таймер самоликвидации, сек  Self-destructive time, sec
        100.0, -- время работы энергосистемы, сек  Working time of power system, sec
        0, -- абсолютная высота самоликвидации, м  Absolute height of self-destruction, M
        1.0, -- время задержки включения управления (маневр отлета, безопасности), сек  Connection delay time (shunting departure, safety), sec
        30000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр 'горка', м
        31000, -- дальность до цели, при которой маневр 'горка' завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м
        0.26,  -- синус угла возвышения траектории набора горки
        50.0, -- продольное ускорения взведения взрывателя  Longitudinal acceleration of fuze arming
        0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
        1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
        1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
        2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
        30000.0, -- дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 на высоте H=2000
        4.0, -- крутизна зависимости  дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 от высоты H
        3.2,
        0.75, -- безразмерный коэф. эффективности САУ ракеты
        70.0, -- расчет времени полета
        -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
        65000.0, -- дальность ракурс   180(навстречу) град,  Н=10000м, V=900км/ч, м
        28000.0, -- дальность ракурс 0(в догон) град,  Н=10000м, V=900км/ч
        23000.0, -- дальность ракурс     180(навстречу) град, Н=1000м, V=900км/ч
        0.2,
        0.6,
        1.4,
        -3.0,
        0.5,
    },
}

declare_weapon(SD_10_AA)
SD_10_AA.shape_table_data.index = SD_10_AA.wsTypeOfWeapon[4]

declare_loadout({
    category    = CAT_AIR_TO_AIR,
    CLSID       = 'DIS_SD-10',
    Picture     = 'pl12.png',
    attribute   = SD_10_AA.wsTypeOfWeapon,
    displayName = _(sd10_name),
    Cx_pil      = 0.000859765625,
    Count       = 1,
    Weight      = sd10_mass + pylon_mass,
    Elements    = {
        [1] =
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = 'pl12',
        },
    }, -- end of Elements
})


declare_loadout({
    category       = CAT_AIR_TO_AIR,
    CLSID          = 'DIS_SD-10_DUAL_L',
    Picture        = 'pl12.png',
    wsTypeOfWeapon = SD_10_AA.wsTypeOfWeapon,
    attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
    displayName    = _(sd10_name .. ' x 2'),
    Cx_pil         = 0.000859765625 * 1.31,
    Count          = 2,
    Weight         = 2 * sd10_mass + pylon_dual_mass,
    Elements       = {
        { ShapeName = 'JF-17_PF12_twin', IsAdapter = true, },
        { ShapeName = 'pl12',            connector_name = 'dual_PF12L', },
        { ShapeName = 'pl12',            connector_name = 'dual_PF12R', },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
})

declare_loadout({
    category       = CAT_AIR_TO_AIR,
    CLSID          = 'DIS_SD-10_DUAL_R',
    Picture        = 'pl12.png',
    wsTypeOfWeapon = SD_10_AA.wsTypeOfWeapon,
    attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
    displayName    = _(sd10_name .. ' x 2'),
    Cx_pil         = 0.000859765625 * 1.31,
    Count          = 2,
    Weight         = 2 * sd10_mass + pylon_dual_mass,
    Elements       = {
        { ShapeName = 'JF-17_PF12_twin', IsAdapter = true, },
        { ShapeName = 'pl12',            connector_name = 'dual_PF12R', },
        { ShapeName = 'pl12',            connector_name = 'dual_PF12L', },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
})

