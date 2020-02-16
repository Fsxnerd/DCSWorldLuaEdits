
--~ Added 2 types of warheads: 

--~ 'enhanced_a2a_warhead' and 'directional_a2a_warhead'

--~ 'enhanced_a2a_warhead' is a more powerful warhead (factor 1.7) type for some human fired a2a missiles, 
--~ to support the new extended proximity fuses.

--~ 'directional_a2a_warhead' has the bonus factor 5.0, used specifically by:
--~ 120B, C, 9X and R77
--~ The reason fo the high factor is because these have VERY high prox ranges in relation to their explosive weight

--~ --Yoda

local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local explosivePercent = 1.0

function simple_aa_warhead(power, caliber) -- By Saint
    local res = {};

	res.caliber = caliber
	res.mass = power; --old explosion damage effect
    res.expl_mass = power;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

function enhanced_a2a_warhead(power) -- By Yoda
    local res = {};

    res.expl_mass = 1.7*power;
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

function directional_a2a_warhead(power) -- By Yoda
    local res = {};

    res.expl_mass = 3.5*power;
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0.0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

function simple_warhead(power, caliber)
    local res = {};

	res.caliber = caliber
    res.expl_mass = power*explosivePercent*0.4; --new explosion damage effect (explosive + fragments)
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end


function cumulative_warhead(power, caliber)
    local res = {};              
    
	res.caliber = caliber;
    res.expl_mass = power*explosivePercent;
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 3.0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.2;
    
	calcPiercingMass(res)
    return res;
end

function penetrating_warhead(power, caliber)
	local res = {};
	
	res.caliber = caliber;
	res.expl_mass = power*explosivePercent;
	res.mass = res.expl_mass;
	res.other_factors = {1, 1, 1};
	res.obj_factors = {1, 1};
	res.concrete_factors = {5, 1, 10};
	res.cumulative_factor = 0.0;
	res.concrete_obj_factor = 5.0;
	res.cumulative_thickness = 0.0;
	
	calcPiercingMass(res)
	return res;
end

function antiship_penetrating_warhead(power, caliber)
    local res = {};
    
	res.caliber = caliber;
    res.expl_mass = power*explosivePercent;
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {2, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 2.0;
    res.concrete_obj_factor = 2.0;
    res.cumulative_thickness = 0.0;
    
    calcPiercingMass(res)
	return res;
end

function HE_penetrating_warhead(power,caliber)
	local res = {};
	
	res.caliber = caliber;
    res.expl_mass = power;
	res.mass = res.expl_mass;
    res.other_factors = { 0.5, 0.5, 0.5 };
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.concrete_obj_factor = 2.0;
	res.cumulative_factor = 0.0;    
    res.cumulative_thickness = 0.0;
    
    calcPiercingMass(res)
	return res;
end

function predefined_warhead(name)
	return warheads[name] or simple_warhead(0.0001)
end

warheads = {}


---------------------------------------------
-- Rockets
---------------------------------------------
warheads["C_5"] = -- S-5KO shaped-charge, fragmented
{
	mass			= 1.08,
    expl_mass        = 0.37, -- Warhead 1.08 kg, explosive 0.37 kg + fragments bonus
    other_factors    = { 1.0, 0.5, 0.5 },
    concrete_factors = { 1.0, 0.5, 0.1 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.1
};

warheads["C_8"] = -- S-8КОМ shaped-charge, fragmented
{
	mass			= 3.0,
    expl_mass        = 0.855, -- Warhead 3 kg, explosive 0.855 kg + fragments bonus
    other_factors    = { 0.5, 0.5, 0.5 },
    concrete_factors = { 0.5, 0.5, 0.1 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 0.5, 1.0 },
    cumulative_factor= 5.0,
    cumulative_thickness = 0.3
};

warheads["C_8OFP2"] =  -- S-8OFP HE
{
	 mass			= 9.2,
     expl_mass        = 2.7, -- Warhead 9,2 kg, explosive 2.7 kg + fragments bonus
     other_factors    = { 0.5, 1.0, 1.0 },
     concrete_factors = { 0.5, 1.0, 0.1 },
     concrete_obj_factor = 0.3,
     obj_factors      = { 0.5, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};

warheads["C_8CM"] = -- S-8TsM target-marking rocket
{
    transparency= 0.8,
    color = {3, 1, 0}, -- Orange colour RGB
    intensity = 10,
    duration = 300,
	flare    = false,
};

warheads["C_13"] = -- S-13ОФ HE
{
	mass			= 33.0,
    expl_mass        = 33.0, -- Warhead 33 kg, explosive 7 kg + fragments bonus
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 2.0, 0.5 },
    concrete_obj_factor = 1.0;
    obj_factors      = { 0.2, 2.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
}; 


warheads["C_24"] = -- S-24 HE Warhead 123 kg, explosive 23.5 kg + fragments bonus
{
	 mass			= 123.0,
     expl_mass        = 123.0, -- Warhead 123 kg, explosive 23.5 kg + fragments bonus
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 1.0,
     obj_factors      = { 0.2, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};

warheads["C_25"] = -- S-25OFM HE Penetrator
{
	 mass			= 155.0,
     expl_mass        = 155.0, 
     other_factors    = { 0.5, 0.5, 0.5 },
     concrete_factors = { 1.0, 1.0, 1.0 },
     concrete_obj_factor = 2.0,
     obj_factors      = { 1.0, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};



warheads["GRAD_9M22U"] = -- 9M22U HE
{
	 mass			= 18.4,
     expl_mass        = 6.4, -- Warhead 18.4 kg, explosive 6.4 kg + fragments bonus
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      = { 0.3, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};

warheads["URAGAN_9M27F"] = -- 9M27F HE
{
	 mass			= 99.0,
     expl_mass        = 51.9, -- Warhead 99.0 kg, explosive 51.9 kg
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      = { 0.3, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};

warheads["SMERCH_9M55F"] = -- 9M55F HE Smerch
{
	 mass				= 246.0,
     expl_mass        	= 92.5,
     other_factors    	= { 1.0, 1.0, 1.0 },
     concrete_factors 	= { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      	= { 0.3, 1.0 },
     cumulative_factor	= 0.0,
     cumulative_thickness = 0.0
};

warheads["HYDRA_70"] = -- HYDRA-70 HE
{
	 mass			  = 4.2,
     expl_mass        = 4.2, -- Warhead 4.2 kg, explosive 1.04 kg + fragments bonus
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      = { 0.25, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};

warheads["HYDRA_70_MK1"] = -- HYDRA-70 Mk1 HE
{
	 mass			 		= 2.94835,
     expl_mass        		= 2.94835, -- Warhead 6.5 lbs, explosive 0.428 kg + fragments bonus
     other_factors    		= { 1.0, 1.0, 1.0 },
     concrete_factors 		= { 1.0, 1.0, 0.1 },
     concrete_obj_factor 	= 0.0,
     obj_factors      	 	= { 0.25, 1.0 },
     cumulative_factor		= 0.0,
     cumulative_thickness   = 0.0
};


warheads["HYDRA_70_HE_ANTITANK"] = -- HYDRA-70 HE ANTITANK, shaped-charge, fragmented
{    
	mass        	 = 6.5,
	expl_mass        = 5.0, -- Warhead 2.6 kg, explosive 0.428 kg + fragments bonus
    other_factors    = { 1.0, 0.5, 0.5 },
    concrete_factors = { 1.0, 0.5, 0.1 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 1.0
};

warheads["HYDRA_70WP"] =
{
    transparency= 0.8,
    color = {1, 1, 1},
    intensity = 3,
    duration = 300,
	flare    = false
};

warheads["HYDRA_70_SMOKE"] =
{
	transparency= 0.5,
    color = {2, 2, 2}, -- White colour RGB
    intensity = 10,
    duration = 300,
	flare    = false
};

warheads["Zuni_127"] = -- Zuni 127 HE
{
	 mass			= 22.0,
     expl_mass        = 22.0, -- Warhead 22 kg, explosive ??? kg + fragments bonus
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      = { 0.25, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};


warheads["HVAR"] = -- HVAR HE
{
	 mass			= 20.0,
     expl_mass        = 20.0, -- Warhead 20 kg, explosive ??? kg + fragments bonus
     other_factors    = { 1.0, 1.0, 1.0 },
     concrete_factors = { 1.0, 1.0, 0.1 },
     concrete_obj_factor = 0.0,
     obj_factors      = { 0.25, 1.0 },
     cumulative_factor= 0.0,
     cumulative_thickness = 0.0
};


------------------------------------------------
-- Bombs
------------------------------------------------
warheads["FAB_100"] = simple_warhead(100.0); -- Explosive 45 kg + fragments bonus

warheads["FAB_250"] = simple_warhead(200.0); -- Explosive 100 kg + fragments bonus

warheads["FAB_500"] = simple_warhead(500.0); -- Explosive 200 kg + fragments bonus

warheads["FAB_1500"] = simple_warhead(1400.0); -- Explosive 700 kg + fragments bonus

warheads["BetAB_500"] = 
{
    mass        	= 200.0,
	expl_mass        = 200.0,
    other_factors    = { 0.5, 0.5, 1.0 },
    concrete_factors = { 5.0, 1.0, 5.0 },
    concrete_obj_factor= 5.0;
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
};

warheads["BetAB_500ShP"] = 
{
    mass 			= 200.0,
	expl_mass        = 200.0,
    other_factors    = { 0.5, 0.5, 1.0 },
    concrete_factors = { 5.0, 1.0, 5.0 },
    concrete_obj_factor = 10.0,
    obj_factors      = { 1.0, 1.0, 1.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
};

warheads["AO_1SCH"] = simple_warhead(1.0, 68.0);
warheads["BETAB_M"] = penetrating_warhead(20.0, 100.0);
warheads["OFAB_50UD"] = simple_warhead(40.0, 100.0);

warheads["M_117"] = simple_warhead(350.0); -- Explosive 175 kg + fragments bonus
warheads["Mk_81"] = simple_warhead(90.0); -- Explosive 45 kg + fragments bonus
warheads["Mk_82"] = simple_warhead(200.0); -- Explosive 89 kg + fragments bonus
warheads["Mk_83"] = simple_warhead(400.0); -- Explosive 202 kg + fragments bonus
warheads["Mk_84"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus
warheads["AN_M64"] = simple_warhead(250.0); -- Explosive 121 kg + fragments bonus
warheads["BDU"] = simple_warhead(0.0001); -- inert warhead for training munition

warheads["Mk_82P"] = 
{
	caliber					= 273,
	mass					= 180.0*explosivePercent,
	expl_mass				= 180.0*explosivePercent,
    other_factors			= { 1.0, 1.0, 1.0 },
    concrete_factors		= { 1.3, 1.0, 1.5 },
    concrete_obj_factor		= 0.5,
    obj_factors				= { 1.0, 1.0, 1.0 },
    cumulative_factor		= 0.0,
    cumulative_thickness	= 0.0
}

warheads["Mk_83P"] = 
{
	caliber					= 356,
	mass					= 400.0*explosivePercent,
	expl_mass				= 400.0*explosivePercent,
    other_factors			= { 1.0, 1.0, 1.0 },
    concrete_factors		= { 1.3, 1.0, 1.5 },
    concrete_obj_factor		= 0.5,
    obj_factors				= { 1.0, 1.0, 1.0 },
    cumulative_factor		= 0.0,
    cumulative_thickness	= 0.0
}

warheads["Mk_84P"] = 
{
	caliber					= 457,
	mass					= 850.0*explosivePercent,
	expl_mass				= 850.0*explosivePercent,
    other_factors			= { 1.0, 1.0, 1.0 },
    concrete_factors		= { 1.3, 1.0, 1.5 },
    concrete_obj_factor		= 0.5,
    obj_factors				= { 1.0, 1.0, 1.0 },
    cumulative_factor		= 0.0,
    cumulative_thickness	= 0.0
}

warheads["KAB_500Kr"] = 
{
    mass 			= 380.0*explosivePercent,
	expl_mass        = 380.0*explosivePercent,
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 3.0, 1.0, 5.0 },
    concrete_obj_factor = 5.0,
    obj_factors      = { 1.0, 1.0, 1.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
};

warheads["KAB_500"] = warheads["KAB_500Kr"];
warheads["KAB_500S"] = simple_warhead(460.0); --Explosive 195 kg

warheads["KAB_500KrOD"] = simple_warhead(560.0);	-- Explosive 280 kg + fuel-air explosive bonus
warheads["KAB_1500Kr"] = penetrating_warhead(1120.0); --(L-Pr, LG-Pr)
warheads["KAB_1500F"] = simple_warhead(1170.0);	-- Explosive 440 kg (Kr,LG-F) 
warheads["GBU_10"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus
warheads["GBU_11"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus
warheads["GBU_12"] = simple_warhead(180.0); -- Explosive 89 kg + fragments bonus
warheads["GBU_22"] = simple_warhead(180.0); -- Explosive 89 kg + fragments bonus
warheads["GBU_16"] = simple_warhead(400.0); -- Explosive 202 kg + fragments bonus
warheads["GBU_17"] = simple_warhead(240.0); 
warheads["GBU_24"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus
warheads["GBU_15"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus

warheads["GBU_27"] = 
{
    mass 			= 240.0, 
	expl_mass        = 240.0,
    other_factors    = { 0.2, 1.0, 1.0 },
    concrete_factors = { 5.0, 1.0, 5.0 },
    concrete_obj_factor = 8.0,
    obj_factors      = { 1.0, 1.0, 1.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
};

warheads["GBU_28"] = 
{
    mass 			= 325.0, 
	expl_mass        = 325.0,
    other_factors    = { 0.2, 1.0, 1.0 },
    concrete_factors = { 5.0, 1.0, 10.0 },
    concrete_obj_factor = 8.0,
    obj_factors      = { 1.0, 1.0, 1.0 },
    cumulative_factor= 0.0,
    cumulative_thickness = 0.0
};

warheads["BLU_109"] = penetrating_warhead(981, 370);

warheads["GBU_29"] = simple_warhead(850.0); -- Explosive 428 kg + fragments bonus
warheads["GBU_30"] = simple_warhead(400.0); -- Explosive 202 kg + fragments bonus
warheads["AGM_62"] = simple_warhead(914,457); -- 2015 lb Walleye 2 warhead 


warheads["PTAB-2-5"] = -- KMGU
{
	mass					= 2.8,
	caliber					= 68,
	expl_mass      			= 0.65, 
	other_factors   		= { 1.0, 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	concrete_obj_factor		= 0.0,
	obj_factors				= { 1.0, 1.0 },
	cumulative_factor		= 3.0,
	cumulative_thickness	= 0.4
};

warheads["SPBE_D"] = cumulative_warhead(9);

warheads["CBU97"] =
{
    mass					= 4.6,
	caliber					= 80,
    expl_mass				= 3.0, 
    other_factors			= { 1.0, 1.0, 1.0 },
    concrete_factors		= { 1.0, 1.0, 1.0 },
    concrete_obj_factor		= 0.0,
    obj_factors				= { 1.0, 1.0 },
    cumulative_factor		= 3.0,
    cumulative_thickness	= 0.65
};

warheads["PTAB-10-5"] = -- RBK-500
{
    mass					= 4.6,
	caliber					= 80,
    expl_mass				= 3.0, 
    other_factors			= { 1.0, 1.0, 1.0 },
    concrete_factors		= { 1.0, 1.0, 1.0 },
    concrete_obj_factor		= 0.0,
    obj_factors				= { 1.0, 1.0 },
    cumulative_factor		= 3.0,
    cumulative_thickness	= 0.65
};

warheads["PTAB-1M"] = 
{
   mass						= 0.95,
   caliber					= 42,
   expl_mass				= 0.4, 
   other_factors			= { 1.0, 1.0, 1.0 },
   concrete_factors			= { 1.0, 1.0, 1.0 },
   concrete_obj_factor		= 0.0,
   obj_factors				= { 1.0, 1.0 },
   cumulative_factor		= 3.0,
   cumulative_thickness		= 0.35
};

warheads["SHOAB"] = simple_warhead(0.5, 60.0);
warheads["OAB_2_5RT"] = simple_warhead(2.8, 90.0);

warheads["HEAT"] = -- BL-775
{
   mass = 0.98,
   expl_mass = 0.5, 
   other_factors = { 1.0, 1.0, 1.0 },
   concrete_factors = { 1.0, 1.0, 1.0 },
   concrete_obj_factor = 0.0,
   obj_factors = { 1.0, 1.0 },
   cumulative_factor= 3.0,
   cumulative_thickness = 0.35
};

warheads["MK118"] = -- Mk-20
{
   mass = 0.59,
   expl_mass = 0.25, 
   other_factors = { 1.0, 1.0, 1.0 },
   concrete_factors = { 1.0, 1.0, 1.0 },
   concrete_obj_factor = 0.0,
   obj_factors = { 1.0, 1.0 },
   cumulative_factor= 10.0,
   cumulative_thickness = 0.25
};

warheads["BLU_61"] = -- BLU-61A
{
   mass = 1.0,
   expl_mass = 0.9, 
   other_factors    = { 1.0, 1.0, 1.0 },
   concrete_factors = { 1.0, 1.0, 0.1 },
   concrete_obj_factor = 0.0,
   obj_factors      = { 0.25, 1.0 },
   cumulative_factor= 0.0,
   cumulative_thickness = 0.0
};

------------------------------------------------
-- Missiles AA
------------------------------------------------
warheads["R_550"] = simple_aa_warhead(13.0);
warheads["MICA_T"] = enhanced_a2a_warhead(12.0);
warheads["MICA_R"] = enhanced_a2a_warhead(12.0);
warheads["Super_530D"] = simple_aa_warhead(27.0);
warheads["P_40T"] = simple_aa_warhead(38.0);
warheads["P_40R"] = simple_aa_warhead(38.0);
warheads["P_24R"] = simple_aa_warhead(25.0);
warheads["P_24T"] = simple_aa_warhead(25.0);
warheads["P_60"] = simple_aa_warhead(3.5);
warheads["P_33E"] = simple_aa_warhead(47.0);
warheads["P_27AE"] = simple_aa_warhead(39.0);
warheads["P_27P"] = simple_aa_warhead(39.0);
warheads["P_27PE"] = simple_aa_warhead(39.0);
warheads["P_27T"] = simple_aa_warhead(39.0);
warheads["P_27TE"] = simple_aa_warhead(39.0);
warheads["P_27EM"] = simple_aa_warhead(39.0);
warheads["P_73"] = enhanced_a2a_warhead(8.0);
warheads["P_77"] = enhanced_a2a_warhead(11.0);
warheads["P_37"] = simple_aa_warhead(60.0);
warheads["AIM_7"] = simple_aa_warhead(39.0, 203);
warheads["AIM_9"] = simple_aa_warhead(10.0, 127);
warheads["AIM_9P"] = simple_aa_warhead(11.0);
warheads["AIM_9X"] = enhanced_a2a_warhead(5.0);
warheads["AIM_54"] = simple_aa_warhead(60.75);
warheads["AIM_120"] = enhanced_a2a_warhead(11.0);
warheads["AIM_120C"] = enhanced_a2a_warhead(11.0);

-----------------------------------------------------
-- Missiles AG
-----------------------------------------------------
warheads["S_25L"] = HE_penetrating_warhead(155, 340);

--[[
warheads["X_25ML"] = 
{
	 mass					= 89.6,
	 expl_mass				= 89.6 * explosivePercent,
     caliber				= 275,
     other_factors			= { 1.0, 1.0, 1.0 },
     concrete_factors		= { 1.0, 1.0, 1.0 },
     concrete_obj_factor	= 0.0,
     obj_factors			= { 1.0, 1.0 },
     cumulative_factor		= 0.0,
     cumulative_thickness	= 0.0
};
]]

warheads["X_25MP"] = 
{
	 mass					= 86.0,
	 expl_mass				= 86.0 * explosivePercent,
     caliber				= 275,
     other_factors			= { 1.0, 1.0, 1.0 },
     concrete_factors		= { 1.0, 1.0, 1.0 },
     concrete_obj_factor	= 0.0,
     obj_factors			= { 1.0, 1.0 },
     cumulative_factor		= 0.0,
     cumulative_thickness	= 0.0
};

warheads["X_58"] = 
{
	 mass					= 149.0,
	 expl_mass				= 58.5,
     caliber				= 380,
     other_factors			= { 1.0, 1.0, 1.0 },
     concrete_factors		= { 1.0, 1.0, 1.0 },
     concrete_obj_factor	= 0.0,
     obj_factors			= { 1.0, 1.0 },
     cumulative_factor		= 0.0,
     cumulative_thickness	= 0.0
};

warheads["X_22"] = simple_warhead(1000.0);
warheads["X_23"] = simple_warhead(108.0);
warheads["X_23L"] = simple_warhead(108.0);
warheads["X_28"] = simple_warhead(155.0,430);
warheads["X_25ML"] = simple_warhead(89.6,275);
--warheads["X_25MP"] = simple_warhead(90.0);
warheads["X_25MR"] = simple_warhead(140.0,275);
--warheads["X_58"] = simple_warhead(150.0);
warheads["X_59M"] = simple_warhead(315.0);
warheads["X_29L"] = penetrating_warhead(317.0,380);
warheads["X_29T"] = penetrating_warhead(317.0, 380);
warheads["X_29TE"] = penetrating_warhead(317.0, 380);
warheads["X_55"] = simple_warhead(410.0);
warheads["X_65"] = simple_warhead(500.0);
warheads["X_15"] = simple_warhead(150.0);
warheads["X_31P"] = simple_warhead(90.0, 360);
warheads["AGM_84E"] = penetrating_warhead(222.0); -- WDU-18/B penetrating blast-fragmentation
warheads["AGM_86"] = penetrating_warhead(450.0);
warheads["AGM_45"] = simple_warhead(66.0,203);
warheads["AGM_88"] = simple_warhead(66.0,254);
warheads["AGM_122"] = simple_warhead(10.2, 127);
warheads["AGM_123"] = simple_warhead(454.0);
warheads["AGM_130"] = simple_warhead(870.0);
warheads["ALARM"] = simple_warhead(66.0, 230);
warheads["BGM_109B"] = simple_warhead(454.0, 520);
warheads["SCUD_8F14"] = simple_warhead(989.0);
warheads["BLU-111B"] = penetrating_warhead(180.0,330); -- AGM-154C

warheads["AGM_65D"] = 
{
    mass        	= 56.25, -- Warhead 56,25 kg, explosive 39 kg 
	caliber			= 305,
	expl_mass        = 39.0 * explosivePercent,
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 2.0
};

warheads["AGM_65H"] = 
{
	mass        	= 56.25, -- Warhead 56,25 kg, explosive 39 kg 
	caliber			= 305,
    expl_mass        = 39.0,
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 2.0
};

warheads["AGM_65E"] = HE_penetrating_warhead(135,305);
warheads["AGM_65G"] = HE_penetrating_warhead(135,305);
warheads["AGM_65K"] = HE_penetrating_warhead(135,305);
    
warheads["TGM_65G"] = simple_warhead(0, 0.305);
warheads["TGM_65D"] = simple_warhead(0, 0.305);
warheads["CATM_65K"] = simple_warhead(0, 0.305);
warheads["TGM_65H"] = simple_warhead(0, 0.305);


------------------------------------------------------
-- ATGM
------------------------------------------------------
warheads["Vikhr_M"] = 
{
	mass 			= 8,
	caliber			= 130,
    expl_mass        = 4.0, -- Warhead 8 kg, explosive 4 kg + fragments bonus
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.9
};

warheads["Vikhr"] = 
{
	mass 			= 8,
	caliber			= 130,
    expl_mass        = 4.0, -- Warhead 8 kg, explosive 4 kg + fragments bonus
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.9
};

warheads["AT_6"] = 
{
	mass 			= 5.4,
	caliber			= 130,
    expl_mass        = 2.4, -- Warhead 5,4 kg, explosive 2,4 kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.75
};

warheads["MALUTKA"] = 
{
	mass 			= 3.5,
	caliber			= 125,
    expl_mass        = 2.2, -- Warhead 3,5 kg, explosive 2,2 kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.6
};

warheads["KONKURS"] = 
{
	mass			= 2.7,
	caliber			= 135,
    expl_mass        = 1.5, -- Warhead 2,7 kg, explosive ??? kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.4
};

warheads["P_9M117"] = 
{
	mass			= 4.5,
	caliber			= 100,
    expl_mass        = 2.7,
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.55
};

warheads["P_9M119"] = 
{
    mass			= 4.5,
	caliber			= 125,
    expl_mass        = 2.7,
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 1.0
};

warheads["P_9M133"] = 
{
    mass			= 5.9,
	caliber			= 152,
    expl_mass        = 3.5, -- Warhead ??? kg, explosive ??? kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 1.0
};


warheads["TOW"] = 
{
	mass			= 5.9,
	caliber			= 152,
    expl_mass        = 3.6, -- Warhead 5,9 kg, explosive 3,6 kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.9
};

warheads["AGM_114"] = 
{
    mass			= 9.98,
    expl_mass        = 6.17, -- Warhead 9,89 kg, explosive 6,17 kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 0.9
};

warheads["AGM_114K"] = 
{
	mass			 = 9.98,
    expl_mass        = 5.67, -- Warhead 9,89 kg, explosive 5,67 kg 
    other_factors    = { 1.0, 1.0, 1.0 },
    concrete_factors = { 1.0, 1.0, 1.0 },
    concrete_obj_factor = 0.0,
    obj_factors      = { 1.0, 1.0 },
    cumulative_factor= 3.0,
    cumulative_thickness = 1.2
};


------------------------------------------------------
--- Antiship Missiles
------------------------------------------------------
warheads["X_31A"] = antiship_penetrating_warhead(90.0);
warheads["X_35"] = antiship_penetrating_warhead(145.0);
warheads["X_41"] = antiship_penetrating_warhead(320.0);
warheads["AGM_84A"] = antiship_penetrating_warhead(225.0, 343);
warheads["AGM_84S"] = antiship_penetrating_warhead(225.0);
warheads["Sea_Eagle"] = antiship_penetrating_warhead(230.0);
warheads["Kormoran"] = antiship_penetrating_warhead(165.0);
warheads["AGM_119"] = antiship_penetrating_warhead(140.0);
warheads["P_35"] = antiship_penetrating_warhead(930.0);
warheads["P_500"] = antiship_penetrating_warhead(1000.0);
warheads["P_700"] = antiship_penetrating_warhead(1000.0);
warheads["P_15U"] = antiship_penetrating_warhead(490.0);
warheads["P_120"] = antiship_penetrating_warhead(500.0);
warheads["R_85"] = antiship_penetrating_warhead(930.0);
warheads["R_85U"] = antiship_penetrating_warhead(300.0);


------------------------------------------------------
-- SAM Missile
------------------------------------------------------
warheads["SeaSparrow"] = simple_aa_warhead(39.0); -- RIM-7 Sea Sparrow
warheads["SM_2"] = simple_aa_warhead(98.0); -- SM-2 RIM-66
warheads["SA5B55"] = simple_aa_warhead(133.0); -- SA-10 S-300PS
warheads["SA48H6E2"] = simple_aa_warhead(143.0); -- SA-N-10 S-300F
warheads["SA9M82"] = simple_aa_warhead(150.0); -- SA-12
warheads["SA9M83"] = simple_aa_warhead(150.0); -- SA-12
warheads["SAV611"] = simple_aa_warhead(80.0); --Volna
warheads["SA3M9M"] = simple_aa_warhead(59.0); -- SA-6 Kub
warheads["SA9M33"] = simple_aa_warhead(15.0); -- SA-8 Osa
warheads["SA9M31"] = simple_aa_warhead(2.6); -- SA-9 Strela-1   (2.6)
warheads["SA9M38M1"] = simple_aa_warhead(70.0); --SA-11 Buk
warheads["SA9M333"] = simple_aa_warhead(3.5); -- SA-13 Strela-10 (4.0)
warheads["SA9M330"] = simple_aa_warhead(14.5); -- SA-15 Tor
warheads["SA9M311"] = simple_aa_warhead(9.0); -- SA-19 Tunguska
--warheads["Igla_1E"] = simple_aa_warhead(1.25); -- SA-18 Igla-S
warheads["MIM_104"] = simple_aa_warhead(73.0); -- Patriot
--warheads["MIM_72G"] = simple_aa_warhead(10.0); -- Chaparrel
--warheads["FIM_92C"] = simple_aa_warhead(1.75); -- Stinger          (2-3 kg)
warheads["SA5B27"] = simple_aa_warhead(60.0); -- SA-3 S-125 
warheads["HAWK_RAKETA"] = simple_aa_warhead(70.0); -- Hawk
warheads["ROLAND_R"] = simple_aa_warhead(6.5); -- Roland

warheads["Igla_1E"] = 
{
	mass					= 1.25,
	expl_mass				= 1.25,
	caliber					= 72,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 17,
};

warheads["FIM_92C"] = 
{
	mass					= 3.0,
	expl_mass				= 3.0,
	caliber					= 70,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 17,
};

warheads["Mistral_MBDA"] = 
{
	mass					= 3.0,
	expl_mass				= 3.0,
	caliber					= 93,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 15,
};

warheads["MIM_72G"] = 
{
	mass					= 10.0,
	expl_mass				= 10.0,
	caliber					= 127,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 25,
};

warheads["RAM"] = 
{
	mass					= 10.0,
	expl_mass				= 10.0,
	caliber					= 127,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 45,
};

warheads["FSA_Rapier"] = 
{
	mass 					= 1.4; 
	expl_mass 				= 1.4;
	caliber					= 133,
	other_factors 			= {1, 1, 1},
	obj_factors 			= {1, 1},
	concrete_factors 		= {1, 1, 1},
	cumulative_factor 		= 0.0,
	concrete_obj_factor 	= 0.0,
	cumulative_thickness 	= 0.0,
	time_self_destruct		= 20,
};

warheads["G7_A"] = 
{
	mass					= 280,
	expl_mass				= 280,
	caliber					= 533,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 430,
};

warheads["LTF_5B"] = simple_warhead(200.0,450);

warheads["G7_A"] = 
{
	mass					= 280,
	expl_mass				= 280,
	caliber					= 533,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 430,
};

warheads["RIM_7"] = 
{
	mass					= 39,
	expl_mass				= 39,
	caliber					= 203,
	other_factors			= { 1.0, 1.0, 1.0 },
	obj_factors				= { 1.0, 1.0 },
	concrete_factors		= { 1.0, 1.0, 1.0 },
	cumulative_factor		= 0.0,
	concrete_obj_factor		= 0.0,    
	cumulative_thickness	= 0.0,
	time_self_destruct		= 75,
};


for warheadName, warhead in pairs(warheads) do
	if warhead.mass then
		warhead.expl_mass = warhead.expl_mass or warhead.mass * explosivePercent
		calcPiercingMass(warhead)
	end
end

-- Описание коэффициентов

--[[
expl_mass        = 2.0, 
Масса взрывчатого вещества в боевой части боеприпаса в килограммах

 other_factors   =  { HE1, HE2, HE3};
Коэффициенты фугасного действия при попадания в землю:
HE1. – фугасный поражающий эффект (expl_mass *HE1)
HE2. – размер эффекта взрыва
HE3. – размер воронки от взрыва

 concrete_factors = { HE1, HE2, HE3},
Коэффициенты фугасного действия при попадания в бетон:
HE1 – фугасный поражающий эффект (expl_mass *HE1)
HE2 – размер эффекта взрыва
HE3 – размер воронки от взрыва

 concrete_obj_factor = CP,
Коэффициенты бетонобойно-проникающего действия при попадания в бетон:
CP – бетонобойно-проникающий эффект для бетонобойных боеприпасов (expl_mass *CP)

 obj_factors      = { HE1, HE2 },
Коэффициент фугасного действия при попадания в наземный объект (технику):
HE1 – фугасный поражающий эффект (expl_mass *HE1)
HE2 – размер эффекта взрыва

 cumulative_factor= SC,
SC – кумулятивный эффект для кумулятивных боеприпасов (expl_mass *SC)
 cumulative_thickness = TH
TH - максимальная толщина брони, которую пробивает кумулятивная часть демеджа (в метрах).  
     Если броня юнита больше, то кумулятивный демедж не наносится.


Пусть у нас боевая часть условной бомбы имеет массу взрывчатого вещества 10 кг. 

Бомба имеет следующие коэффициенты:

obj_factors = {0.5, 1}, 
concrete_factors = {0.8, 1, 1}, 
other_factors = {0.9, 1, 1}, 
cumulative_factor = 5, 
concrete_obj_factor = 3
cumulative_thickness = 0.05

тогда, 

1.  если бомба падает в землю, то фугасный эффект будет 10*0.9 = 9
2.  если бомба падает на бетонный объект, то фугасный эффект будет 10*0.8, плюс дополнительно этому объекту передается еще 3*10 = 30 бетонобойного поражающего действия
3.  если бомба попадает в машину, то фугасный эффект будет 10*0.5, 
    плюс дополнительно этому объекту передается еще 5*10=50 кумулятивного поражающего действия, если броня машины меньше 5 см.

Для того, чтобы не писать большие таблицы на каждую боеголовку, есть функция simple_warhead, которая принимает один параметр - массу взрывчатки. На выходе получается обычная боеголовка с фугасно-осколочным эффектом.


--]]
