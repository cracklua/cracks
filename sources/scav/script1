if game.PlaceId ~= 13438553315 and game.PlaceId ~= 13438553315 then
    return
end

repeat wait() until game.Players.LocalPlayer ~= nil



local namecall
local newindex
local DamageTypes = {"burning","bleed","toxicated","sepsis"}
_G.Code1 = nil
_G.Code2 = nil
local Humanoid = nil
local EffectsTable = nil
local Whitelist = {}
local WeaponStats = nil
local AmmoTable = nil
local ClipLabel = nil
local ReserveLabel = nil
local FoodTable = nil
local mouse = game.Players.LocalPlayer:GetMouse()
local CurrentWeapon = ""
local ShownWeapon = ""
local RenderStepConnection = nil
local Enemies = {}
local KillAuraDistance = 30
local GrenadeRainDamage = 5
local AkimboActive = false
local AuxFunction = nil
local CurrentTrap = "Proximity Mine"
local ToLoopDrop = ""
local CurrentThrowable = "TKnife"
-- local CameraShakeFunction
local LoopedFeatures = {"KillAura","GrenadeRain","SuperRun","LoopDrop","AntiVoteKick"}
local DevWeapons = {"RVolver","JBox","LSMini","GMSword","EMSword","CMMaul","PLBlade"}
local GuiCommands = {"InfClip","InfAmmo","Godmode","SemiGodmode","OneShot","NoCooldown","InfAux","SilentAim","AutoParry","KillAura","VirusBlock","AntiDebuff","NoHunger","AntiFallDamage","AntiRecoil","SuperRun","AntiVoteKick"}


local Toggles = {
    Godmode = false;
    SemiGodmode = false;
    InfRun = true;
    AntiDebuff = false;
    Dispenser = false;
    NoCooldown = false;
    GrabAmmo = false;
    VirusBlock = false;
    OneShot = false;
    SilentAim = false;
    InfAmmo = false;
    InfClip = false;
    AntiRecoil = false;
    AntiFallDamage = false;
    SuperRun = false;
    NoHunger = false;
    AutoParry = false;
    KillAura = false;
    AutoKill = false;
    GrenadeRain = false;
    InfAux = false;
    LoopDrop = false;
    ThrowingKnives = false;
    AntiVoteKick = false;
}


local Traps = {
    ["Steel Punjis"] = "Steel Punjis";
    ["Punjis"] = "Steel Punjis";
    ["Steel Snares"] = "Steel Snares";
    ["Snares"] = "Steel Snares";
    ["Proximity Mine"] = "Proximity Mine";
    ["Mines"] = "Proximity Mine";
    ["Landmines"] = "Proximity Mine";
    ["Remote Explosives"] = "Remote Explosive";
    ["C4"] = "Remote Explosive";
    ["Crafted Pavise"] = "Crafted Pavise";
    ["Pavise"] = "Crafted Pavise";
    ["Barrier"] = "Crafted Pavise";
    ["Wall"] = "Crafted Pavise";
    ["Blockade"] = "Crafted Pavise";
    ["Wood Barrier"] = "Crafted Pavise";
}

local TrapToItemName = {
    ["Steel Punjis"] = "PTrap";
    ["Steel Snares"] = "SSnare";
    ["Proximity Mine"] = "PMine";
    ["Remote Explosives"] = "RExplosive";
    ["Crafted Pavise"] = "CRPavise";
};

local Throwables = {
    ["Knives"] = "TKnife";
    ["Throwing Knives"] = "TKnife";
    ["Knife"] = "TKnife";
    ["Dynamite"] = "Dynamite";
    ["TNT"] = "Dynamite";
    ["Bundle of Dynamite"] = "Dynamite";
    ["Molotovs"] = "Molo";
    ["Molly"] = "Molo";
    ["Fire bomb"] = "Molo";
    ["Molotov Cocktail"] = "Molo";
    ["Bottle"] = "Molo";
    ["Grenade"] = "MGrenade";
    ["M67 Grenade"] = "MGrenade";
    ["Frag Grenade"] = "MGrenade";
    ["Impact Grenade"] = "ImpN";
    ["Touch Grenade"] = "ImpN";
    ["Bomb Spear"] = "CRBSpear";
    ["Spear"] = "CRBSpear";
    ["Hot Dog"] = "CRBSpear";
    ["HotDog"] = "CRBSpear";
    ["Caltrops"] = "TCaltrop";
    ["Spikes"] = "TCaltrop";
    ["Throwing Axe"] = "TAxe";
    ["Axe"] = "TAxe";
    ["Hatchet"] = "TAxe";
}

local SuperRun = {
    WHeld = false;
    SHeld = false;
    AHeld = false;
    DHeld = false;
    ShiftHeld = false;
    RunSpeed = 1;
}
local Debounces = {
    Dispensing = false;
    Killing = false;
    Trap = false;
    LoopDrop = false;
    Throwing = false;
}

local WeaponStats = nil

local NameToStat = {
  
    ------- GUNS -------

    ["LIMB_LETHALITY"] = {
        Stat = "damagerating";
        Index = 3;
        Increment = 5;
    };
    ["HEADSHOT_LEHTALITY"] = {
        Stat = "damagerating";
        Index = 4;
        Increment = 5;
    };
    ["ROUNDS_PER_MINUTE"] = {
        Stat = "speedrating";
        Increment = -0.01;
        BigIncrement = -0.1;
    };
    ["EFFECTIVE_RECOIL"] = {
        Stat = "woundrating";
        Increment = 2;
        BigIncrement = 20;
    };
    ["FIREARM_INACCURACY"] = {
        Stat = "sizerating";
        Increment = -1;
        BigIncrement = -10;
    };

    ------- MELEE ------

    ["LETHALITY"] = {
        Stat = "damagerating";
        Index = 1;
        Increment = 5;
    };
    ["STRIKE_LETHALITY"] = {
        Stat = "damagerating";
        Index = 2;
        Increment = 5;
    };
    ["WEIGHT_LIGHT_SWING"] = {
        Stat = "speedrating";
        Increment = 1;
    };
    ["WEIGHT_HEAVY_SWING"] = {
        Stat = "chargerating";
        Increment = 0;
    };
    ["EFFECTIVE_RANGE"] = {
        Stat = "sizerating";
        Increment = 1;
    };
    ["WOUNDING_LEVEL"] = {
        Stat = "woundrating";
        Increment = 1;
    };


    ------- MISC -------

    ["LIMB_DAMAGE"] = {
        Stat = "damagerating";
        Increment = 5;
        BigIncrement = 50;
    };
    ["HEAD_DAMAGE"] = {
        Stat = "damagerating";
        Increment = 5;
        BigIncrement = 50;
    };
    ["SPEED_RATING"] = {
        Stat = "speedrating";
        Increment = 1;
    };
    ["CHARGE_RATING"] = {
        Stat = "chargerating";
        Increment = 1;
    };
    ["WOUND_RATING"] = {
        Stat = "woundrating";
        Increment = 2;
    };
    ["SIZE_RATING"] = {
        Stat = "sizerating";
        Increment = 1;
    };
    ["THROW_RATING"] = {
        Stat = "throwrating";
        Increment = 1;
    };
}

local Weapons = {
    ["Juggernaut Box"] = "JBox";
    ["TYPE-22 LSR-MG"] = "LSMini";
    ["LSR-MG"] = "LSMini";
    ["Minigun"] = "LSMini";
    ["PLASMA Broadsword"] = "PLBlade";
    ["Gabriel's Blade"] = "GMSword";
    ["Zealot's Blade"] = "EMSword";
    ["Commander's Maul"] = "CMMaul";
    ["Maul"] = "CMMaul";
    ["brokenplasma"] = "PLBlade";
    ["Caltrops"] = "TCaltrop";
    ["Alarm Gun"] = "AlrGun";
    ["Pickaxe"] = "PAxe";
    ["STI DVC Limited Custom"] = "STIPistol";
    ["Limited Custom"] = "STIPistol";
    ["Custom"] = "STIPistol";
    ["High Cappa"] = "STIPistol";
    ["Crafted Pavise"] = "CRPavise";
    ["Pavise"] = "CRPavise";
    ["Barricade"] = "CRPavise";
    ["Wall"] = "CRPavise";
    ["HighCappa"] = "STIPistol";
    ["Extendo"] = "STIPistol";
    ["Hunting Axe"] = "TAxe";
    ["Splitting Axe"] = "SAxe";
    ["Pitchfork"] = "PFork";
    ["Remington 700"] = "HuntingR";
    ["Opposers Flagpole"] = "EFlag";
    ["Fire Axe"] = "FAxe";
    ["Ruger LCP"] = "Ruger";
    ["Company Flagpole"] = "CFlag";
    ["Flagpole"] = "CFlag";
    ["Flagpole2"] = "EFlag";
    ["Throwing Javelin"] = "TJavelin";
    ["Peacemaker"] = "RVolver";
    ["M1911A1"] = "MPistol";
    ["First Aid Kit"] = "MAid";
    ["Pavise"] = "CRPavise";
    ["Impact Grenade"] = "ImpN";
    ["Baseball Bat"] = "BBat";
    ["Bat"] = "BBat";
    ["Cleaver"] = "CCleaver";
    ["Berserk Injector"] = "BInjector";
    ["Stone Rock"] = "CRStone";
    ["Kel-Tec KSG"] = "KSG";
    ["KSG"] = "KSG";
    ["Bomb Spear"] = "CRBSpear";
    ["Hot Dog"] = "CRBSpear";
    ["HotDog"] = "CRBSpear";
    ["Kitchen Knife"] = "KitKnife";
    ["M60-E6"] = "SubLMG";
    ["LMG"] = "SubLMG";
    ["OLDLMG"] = "SubLMG";
    ["OLD LMG"] = "SubLMG";
    ["Crafted Spear"] = "CRSpear";
    ["Pepper Spray"] = "PSpray";
    ["Lameo-Blade"] = "Hyperlame";
    ["Crafted Caltrops"] = "CRCaltrop";
    ["Handheld Radio"] = "RDio";
    ["Radio"] = "RDio";
    ["Model 6 Unica"] = "Mateba";
    ["Unica"] = "Mateba";
    ["Broken Tracker"] = "PScanner";
    ["Tracker"] = "PScanner";
    ["AS Val"] = "ASVal";
    ["Val"] = "ASVal";
    ["Wood Branch"] = "CRBranch";
    ["Branch"] = "CRBranch";
    ["Police Baton"] = "PBaton";
    ["Dolch 96"] = "Mauser";
    ["Mauser"] = "Mauser";
    ["Frying Pan"] = "FPan";
    ["Pan"] = "FPan";
    ["Specialist Knife"] = "KaramB";
    ["Karambit"] = "KaramB";
    ["Winchester 940-1"] = "HRifle";
    ["MCX VIRTUS"] = "SubMCX";
    ["VIRTUS"] = "SubMCX";
    ["Lead Pipe"] = "LPipe";
    ["Pipe"] = "LPipe";
    ["AK-74"] = "SubAK";
    ["AK 74"] = "SubAK";
    ["AK74"] = "SubAK";
    ["AK-47"] = "SubAK";
    ["AK 47"] = "SubAK";
    ["AK47"] = "SubAK";
    ["FN SCAR-H"] = "SubScar";
    ["SCAR-H"] = "SubScar";
    ["Estoc"] = "ESword";
    ["Polters Last Breath"] = "GhostBomb";
    ["GhostBomb"] = "GhostBomb";
    ["Great Sword"] = "GSword";
    ["Shadow Claws"] = "SClaw";
    ["Claws"] = "SClaw";
    ["Wakizashi"] = "NSword";
    ["Short Sword"] = "SSword";
    ["Sword"] = "SSword";
    ["Augmentin Antibiotics"] = "IbuP";
    ["Antibiotics"] = "IbuP";
    ["H&K MP5A3"] = "SubMP";
    ["MP5A3"] = "SubMP";
    ["Construction Hammer"] = "CHammer";
    ["Hammer"] = "CHammer";
    ["Throwing Knife"] = "TKnife";
    ["Rigged Detonator"] = "CRRiggedE";
    ["Detonator"] = "CRRiggedE";
    ["M14 EBR"] = "EBR";
    ["EBR"] = "EBR";
    ["Crude Bandage"] = "CRBandage";
    ["Commissioned Musket"] = "MusketR";
    ["Musket"] = "MusketR";
    ["Tactical Spear"] = "TSpear";
    ["Smoke Launcher"] = "SLauncher";
    ["Remote Explosive"] = "RExplosive";
    ["C4"] = "RExplosive";
    [".22 Broomhandle"] = "Pistol";
    ["Broomhandle"] = "Pistol";
    ["Modded AKM"] = "SUPAK";
    ["AKM"] = "SUPAK";
    ["Punjis"] = "PTrap";
    ["Combat Knife"] = "CKnife";
    ["Caldwell 940"] = "DoubleShotgun";
    ["940"] = "DoubleShotgun";
    ["Double Barrel"] = "DoubleShotgun";
    ["DoubleBarrel"] = "DoubleShotgun";
    ["Snares"] = "SSnare";
    ["Crafted Quiver"] = "CRQuiver";
    ["Tomahawk"] = "THawk";
    ["R11 RSASS"] = "RSASS";
    ["FAMAS F1"] = "FAMAS";
    ["Airdrop Flare"] = "Flare";
    ["Proximity Mine"] = "PMine";
    ["Mine"] = "PMine";
    ["Emergency Airdrop Flare"] = "EFlare";
    ["Alarming Gun"] = "VAlrGun";
    ["Dynamite"] = "Dynamite";
    ["Immobilising Splint"] = "Splint";
    ["Splint"] = "Splint";
    ["Esmarch Tourniquet"] = "Tourni";
    ["Tourniquet"] = "Tourni";
    ["Javelin"] = "CRJavelin";
    ["Scissors"] = "SCKnife";
    ["Modded Rifle"] = "Rifle";
    ["Rifle"] = "Rifle";
    ["Advanced IFAK"] = "FAid";
    ["IFAK"] = "FAid";
    ["Firerier Axe"] = "DFAxe";
    ["Tactical Armour"] = "APack";
    ["Armour"] = "APack";
    ["Armor"] = "APack";
    ["Crafted Knife"] = "CRKnife";
    ["Rake"] = "Rake";
    ["Yari"] = "Yari";
    ["Modded Pistol"] = "SUPMPistol";
    ["Backpack"] = "BPack";
    ["Model 870"] = "MShotgun";
    ["Decommissioned Musket"] = "DMusket";
    ["Musket2"] = "DMusket";
    ["MVD KS-23"] = "KShotgun";
    ["KS-23"] = "KShotgun";
    ["Military Axe"] = "MilAxe";
    ["Pizza Cutter"] = "PCutter";
    ["Boar Spear"] = "BSpear";
    ["Riot Grenade"] = "TGas";
    ["Hidden Knife"] = "HKnife";
    ["S44-UL1"] = "SPDStim";
    ["Speed Stimpak"] = "SPDStim";
    ["Blue Stimpak"] = "SPDStim";
    ["Peacemaker Chain"] = "CRVolver";
    ["Chain"] = "CRVolver";
    ["Cudgel"] = "CRCudgel";
    ["Stone Scrap"] = "CRStoneS";
    ["The Redeemer"] = "MRVolver";
    ["Redeemer"] = "MRVolver";
    ["Artisans Hook"] = "BHook";
    ["Halberd"] = "HBerd";
    ["Poisoned Knife"] = "PKnife";
    ["Executioner Sword"] = "ExecSword";
    ["Recurve Bow"] = "RBow";
    ["Amoxicillin Tablets"] = "PKillers";
    ["Ingram MAC-10"] = "Mac";
    ["MAC-10"] = "Mac";
    ["Peacemaker Uppercut"] = "URVolver";
    ["Fire Bomb"] = "Molo";
    ["Molotov"] = "Molo";
    ["The Bad Business"] = "BadBat";
    ["Bad Business"] = "BadBat";
    ["Compound Z"] = "SPCStim";
    ["Black Tar Heroin"] = "SPCStim";
    ["Black Stimpack"] = "SPCStim";
    ["Crowbar"] = "CBar";
    ["I4S-DS"] = "DEFStim";
    ["Regen Stimpak"] = "DEFStim";
    ["Green Stimpak"] = "DEFStim";
    ["3-(cbSTM)"] = "DStim";
    ["cbSTM"] = "DStim";
    ["Stamina Stimpak"] = "DStim";
    ["Purple Stimpak"] = "DStim";
    ["Cocktail Perithesene"] = "HStim";
    ["Perithesene"] = "HStim";
    ["Health Stimpak"] = "HStim";
    ["Full Heal Stimpak"] = "HStim";
    ["Red Stimpak"] = "HStim";
    ["Broken Taser"] = "Taser";
    ["Taser"] = "Taser";
    ["Compound MilBow"] = "CPBow";
    ["MilBow"] = "CPBow";
    ["Bow"] = "CPBow";
    ["M67 Grenade"] = "MGrenade";
    ["Grenade"] = "MGrenade";
    ["Frag Grenade"] = "MGrenade";
    ["A.J.M. 9"] = "AJM";
    ["AJM 9"] = "AJM";
    ["Aseptic Bandage"] = "ADBandage";
    ["Smoke Bomb"] = "CRSBomb";
    ["Shovel"] = "Shovel";
    ["Crafted Hatchet"] = "CRHatchet";
    ["Fists"] = "Fist";
    ["Maria"] = "NailedB";
    ["PGM FR-12.7"] = "AMR";
    ["Anti Material Rifle"] = "AMR";
    ["Anti-Material Rifle"] = "AMR";
    ["50 Caliber Rifle"] = "AMR";
    ["50-Caliber"] = "AMR";
    ["AMR"] = "AMR";
    ["Military Fork"] = "MFork";
    ["The Decimator"] = "RBHammer";
    ["Decimator"] = "RBHammer";
    ["Mark VII"] = "Deagle";
    ["Deagle"] = "Deagle";
    ["Karabiner 98k"] = "KarSniper";
    ["Ice Axe"] = "IPick";
    ["GhostKnife"] = "GhostKnife";
    ["Polters Last Wish"] = "GhostKnife";
    ["Caldwell Handcannon"] = "DBarrel";
    ["Handcannon"] = "DBarrel";
    ["Crafted Bow"] = "CRBow";
    ["SPAS-12"] = "SPShotgun";
    ["KRISS Vector"] = "SubVector";
    ["Vector"] = "SubVector";
    ["Rapier"] = "RPier";
    ["Pike"] = "PSpear";
    ["Brass Knuckles"] = "BKnuckles";
    ["Military Machete"] = "MMachete";
    ["M1891 Avtomat"] = "Avto";
    ["Avtomat"] = "Avto";
    ["Wood Scrap"] = "CRWoodS";
    ["Sledgehammer"] = "SHammer";
    ["Glock 17"] = "Glock";
    ["Crafted Backpack"] = "CRBPack";
    ["CBJ-MS PDW"] = "SubMG";
    ["PDW"] = "SubMG";
    ["Crafted Explosive"] = "CRNade";
    ["BL1 (Neloprephine)"] = "SStim";
    ["Neloprephine"] = "SStim";
    ["Heroin"] = "SStim";
    ["Orange Stimpack"] = "SStim";
    ["Morale Stimpack"] = "SStim";
    ["Used Stim"] = "TStim";
    ["Hemostatic Zanustin"] = "AdrStim";
    ["Adrenaline Stimpack"] = "AdrStim";
    ["Clear Stimpack"] = "AdrStim";
    ["Glass Stimpack"] = "AdrStim";
    ["Effect Stimpack"] = "AdrStim";
    ["Crafted Splint"] = "CRSplint";
    ["Theourgias Hand"] = "THand";
    ["THand"] = "THand";
    ["Hand"] = "THand";
    ["Crafted Punjis"] = "CRPTrap";
    ["Simonov SKS"] = "SKS";
    ["SKS"] = "SKS";
    ["H&K UMP45"] = "UMP";
    ["UMP45"] = "UMP";
    ["FN M249"] = "FNLMG";
    ["M249"] = "FNLMG";
    ["LMG2"] = "FNLMG";
    ["FNLMG"] = "FNLMG";
    ["FN P90 TR"] = "SubPS";
    ["P90 TR"] = "SubPS";
    ["SubPS "] = "SubPS";
    ["Benelli M4"] = "Benelli";
    ["Winchester 1901"] = "LeverShotgun";
    ["LeverShotgun"] = "LeverShotgun";
    ["Lever Shotgun"] = "LeverShotgun";
    ["IZhMASh SV-98M"] = "SUPSniper";
    ["SV-98M"] = "SUPSniper";
    ["SUPSniper"] = "SUPSniper";
    ["AI-AWSM"] = "AWMSniper";
    ["AWSM"] = "AWMSniper";
    ["AWMSniper"] = "AWMSniper";
    ["PPSh-41"] = "SubPP";
    ["Dragunov SVD-63"] = "SVD";
    ["SVD-63"] = "SVD";
    ["Atchisson AA-12"] = "AAShotgun";
    ["AA-12"] = "AAShotgun";
    ["ASh-12"] = "AshR";
    ["H&K MR308 A3"] = "HKMR";
    ["MR308 A3"] = "HKMR";
    ["HKMR"] = "HKMR";
    ["CheyTac M200"] = "IntSniper";
    ["M200"] = "IntSniper";
    ["1927A1 Deluxe"] = "TSMG";
    ["FN SCAR-L"] = "ScarL";
    ["SCARL"] = "ScarL";
    ["SCAR-L"] = "ScarL";
    ["H&K MP5/10"] = "MPTen";
    ["MP5/10"] = "MPTen";
    ["MP10"] = "MPTen";
    ["Skorpion vz. 61"] = "Scorp";
    ["SIG MPX"] = "SubMPX";
    ["MPX"] = "SubMPX";
    ["SubMPX"] = "SubMPX";
    ["Container Zero"] = "AgentCD";
}

local EspObjects = {
        Enemies = {};
        Demons = {};

        Guns = {};
        Melee = {};
        Ammo = {};
        Traps = {};
        BodyArmor = {};
        Backpacks = {};
        Throwable = {};
        Health = {};
        Stims = {};
        Blueprints = {};

        Crate = {};
        Workbench = {};
        Scrapper = {};
        Locker = {};
        ["Medical Cabinet"] = {};
}

local EspInfo = {
    Toggles = {
        Enemies = false;
        Demons = true;

        Guns = true;
        Melee = false;
        Ammo = false;
        Traps = false;
        BodyArmor = false;
        Backpacks = true;
        Throwable = false;
        Health = false;
        Stims = false;
        Blueprints = false;

        Crate = true;
        Workbench = true;
        Scrapper = false;
        Locker = false;
        ["Medical Cabinet"] = false;
    };

    Scavs = {

        ------------ MELEE SCAVS ------------

        ScavMeleeA = {
            img = 7841679252;
            desc = "ice axe scav";
            subtext = "MELEE";
        };
        ScavMeleeB = {
            img = 7841677917;
            desc = "combat knife scav";
            subtext = "MELEE";
        };
        ScavMeleeC = {
            img = 7841680342;
            desc = "lead pip scav";
            subtext = "MELEE";
        };
        ScavMeleeD = {
            img = 7841678596;
            desc = "crow bar scav";
            subtext = "MELEE";
        };
        ScavMeleeE = {
            img = 7841680966;
            desc = "karambit scav";
            subtext = "MELEE";
        };
        ScavMeleeF = {
            img = 7841677017;
            desc = "boar spear scav";
            subtext = "MELEE";
        };

        ------------ PISTOL SCAVS ------------

        ScavPistolA = {
            img = 7841738039;
            desc = "22 LR broomhandle scav";
            subtext = "PISTOL";
        };
        ScavPistolB = {
            img = 7841738562;
            desc = "m1911 scav";
            subtext = "PISTOL";
        };
        ScavPistolC = {
            img = 7841739010;
            desc = "ruger scav";
            subtext = "PISTOL";
        };

        ------------ AUTOM SCAVS ------------

        ScavSMGA = {
            img = 7841760841;
            desc = "smg scav";
            subtext = "AUTOMATIC";
        };
        ScavSMGB = {
            img = 7841760841;
            desc = "smg scav";
            subtext = "AUTOMATIC";
        };
        ScavAKA = {
            img = 7841761784;
            desc = "ak scav";
            subtext = "AUTOMATIC";
        };
        ScavAKB = {
            img = 7841761784;
            desc = "ak scav";
            subtext = "AUTOMATIC";
        };

        ----------- SHOTTY SCAVS -----------

        ScavDoubleBarrel = {
            img = 7841821770;
            desc = "double barrel scav";
            subtext = "SHOTGUN";
        };
        ScavShotgun = {
            img = 7841833207;
            desc = "model 870 scavenger";
            subtext = "SHOTGUN";
        };

        ----------- RIFLE SCAVS ------------

        ScavSniper = {
            img = 7841872755;
            desc = "remington scav";
            subtext = "MARKSMAN";
        };
        ScavHenry = {
            img = 7841873513;
            desc = "winchester scav";
            subtext = "MARKSMAN";
        };

        --------- BOSS WAVE SCAVS ----------

        BossScav = {
            img = 7841904249;
            desc = "boss scav";
            subtext = "KILL";
        };
        BossScavGuard = {
            img = 7841903504;
            desc = "boss scav guard";
            subtext = "GUARD";
        };

        ------------ SHADOWS ------------

        ShadowHidden = {
            img = 7842766024;
            desc = "hidden demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowSkinnerA = {
            img = 7842771883;
            desc = "skinner demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowSkinnerB = {
            img = 7842767367;
            desc = "skinner demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowSkinnerC = {
            img = 7842771883;
            desc = "skinner demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowSkinnerD = {
            img = 7842767367;
            desc = "skinner demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowSickler = {
            img = 7842766888;
            desc = "sickler demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
        ShadowHanger = {
            img = 7842765069;
            desc = "hanger demon";
            subtext = "DEMON";
            subtextcolor = Color3.fromRGB(0,0,0);
        };
    };

    Interactables = {
        Crate = {
            img = 7841194630;
        };
        Workbench = {
            img = 7841197317;
        };
        Scrapper = {
            img = 7841196664;
        };
        Locker = {
            img = 7841195140;
        };
        ["Medical Cabinet"] = {
            img = 7841195738;
        };
    };

    Items = {
        Guns = {
            img = 7843043692;
        };
        Melee = {
            img = 7843044421;
        };
        Ammo = {
            img = 7843046990;
        };
        Backpack = {
            img = 7843047903;
        };
        Placeable = {
            img = 7843048761;
        };
        BodyArmor = {
            img = 7843049470;
        };
        Throwable = {
            img = 7843050297;
        };
        Health = {
            img = 7843627206;
        };
        Stims = {
            img = 7843626657;
        };
        Blueprints = {
            img = 7843630409;
        };
    };
}

local function KnifeKill(Model,UntilDeath)
    if Model.Parent ~= nil and Model.Parent.Name == "activeHostiles" or Model.Parent ~= nil and Model.Parent.Name == "NoTarget" then
        local TargetPart = Model:FindFirstChild("Torso") or Model:FindFirstChild("Head")
        if TargetPart == nil then
            return
        end
        if not Model:FindFirstChild("Humanoid") or Model.Humanoid.Health <= 0 then
            return
        end
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        local Data = WeaponStats["TKnife"]
        local Position = CFrame.new(TargetPart.CFrame.p + Vector3.new(0,0,math.random(-2,2)),TargetPart.CFrame.p)
        if _G.Code1 ~= nil and _G.Code2 ~= nil then
            if UntilDeath == true then
                repeat 
                    spawn(function()
                        local Position = CFrame.new(TargetPart.CFrame.p + Vector3.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)),TargetPart.CFrame.p)
                        workspace.ServerStuff.throwWeapon:FireServer("TKnife", 1000, Position, 0.19341856241226196, Data, 0, false, _G.Code1, nil, _G.Code2)
                    end)
                    wait()
                until Model == nil or not Model:FindFirstAncestor("Workspace") or not Model:FindFirstChild("Humanoid") or Model.Humanoid.Health <= 0
            else
                spawn(function()
                    workspace.ServerStuff.throwWeapon:FireServer("TKnife", 1000, Position, 0.19341856241226196, Data, 0, false, _G.Code1, nil, _G.Code2)
                end)
            end
        end
    end
end

local function Kill(Model)
    if _G.Code1 ~= nil and _G.Code2 ~= nil and Model:FindFirstChild("Torso") then
        if not Model:FindFirstChild("Humanoid") or Model.Humanoid.Health <= 0 then
            return
        end
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        local WeaponInfo = WeaponStats[tostring(CurrentWeapon)] or nil
        local WeaponType = "Fists"
        local WaitForGun = false
        local ReplacementGun = "FNLMG"
        if WeaponInfo ~= nil then
            WeaponType = WeaponInfo.weapontype
        end
        if WeaponType ~= "Gun" then
            local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats[ReplacementGun].animset)
            game.Workspace.ServerStuff.getTPWeapon:FireServer(ReplacementGun, AnimSet, "Fist", nil, false)
            WaitForGun = true
        end
        if WaitForGun then
            repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild(ReplacementGun)
        end
        game.Workspace.ServerStuff.claimItem:InvokeServer(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Model"))
        WeaponInfo = WeaponStats[tostring(CurrentWeapon)]
        local TargetPart =  Model:FindFirstChild("Head") or Model:FindFirstChild("Torso")
        if TargetPart == nil then
            return
        end
        local Data = {
        	[1] = "gundamage",
        	[2] = Model,
        	[3] = WeaponInfo.damagerating[3],
        	[4] = false,
        	[5] = CurrentWeapon,
        	[6] = false,
        	[7] = false,
        	[8] = {},
        	[9] = TargetPart,
        	[10] = WeaponInfo
        }
        workspace.ServerStuff.dealDamage:FireServer(Data, nil, _G.Code1, _G.Code2)
        if Toggles.SemiGodmode then
            game.Workspace.ServerStuff.getTPWeapon:FireServer("HStim", AnimSet, "Fist", nil, false)
        end
    end
end

local function RenderStepped()
    if SuperRun.ShiftHeld == true and Toggles.SuperRun == true and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if SuperRun.WHeld == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-SuperRun.RunSpeed)
        end
        if SuperRun.SHeld == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,SuperRun.RunSpeed)
        end
        if SuperRun.DHeld == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(SuperRun.RunSpeed,0,0)
        end
        if SuperRun.AHeld == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(-SuperRun.RunSpeed,0,0)
        end
    end
    if Toggles.KillAura then
        for i = 1,#Enemies do
            if Enemies[i] ~= nil and Enemies[i]:FindFirstChild("Torso") and game.Players.LocalPlayer:DistanceFromCharacter(Enemies[i].Torso.Position) <= KillAuraDistance then
                KnifeKill(Enemies[i])
            end
        end
        return
    end
    if Toggles.AntiVoteKick then
        local Players = {}
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer then
                table.insert(Players,v)
            end
        end
        if #Players > 1 then
            local Target = Players[math.random(0,#Players)]
            if Target ~= nil then
                game.Players:Chat("votekick/"..Target.Name)
            end
        end
    end
    if Toggles.LoopDrop and not Debounces.LoopDrop and ToLoopDrop ~= "" then
        local Current = ToLoopDrop
        Debounces.LoopDrop = true
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        if WeaponStats[ToLoopDrop] == nil then
            return
        end
        local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats[ToLoopDrop].animset)
        local Type = WeaponStats[ToLoopDrop].weapontype
        local Uses = 1
        local ToDropStats = WeaponStats[ToLoopDrop]
        local NewStatsTable = {}
        if Type == "Gun" and game.ReplicatedStorage.Weapons:FindFirstChild(ToLoopDrop) and game.ReplicatedStorage.Weapons[ToLoopDrop]:FindFirstChild("ammo") then
            Uses = game.ReplicatedStorage.Weapons[ToLoopDrop].ammo.Value
        end
        for i,v in pairs(ToDropStats) do
            NewStatsTable[i] = v
        end
        for i,v in pairs(NewStatsTable) do
            if string.sub(i,#i - 2,-1) ~= "old" and NewStatsTable[i.."old"] ~= nil then
                NewStatsTable[i] = NewStatsTable[i.."old"]
            end
        end
        for i,v in pairs(NewStatsTable) do
            if string.sub(i,#i - 2,-1) == "old" then
                v = nil
            end
        end
        game.Workspace.ServerStuff.getTPWeapon:FireServer(ToLoopDrop, AnimSet, "Fist", nil, false)
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild(ToLoopDrop) or ToLoopDrop == "" or ToLoopDrop ~= Current
        local cframe = CFrame.new(381.598999, -1.04327154, -48.8513374, -0.0525665507, -0.320858359, 0.945667326, -7.67457823e-05, 0.946977854, 0.321298748, -0.99861747, 0.0168169905, -0.0498039834)
        workspace.ServerStuff.throwWeapon:FireServer(ToLoopDrop, nil, cframe, "drop", NewStatsTable, Uses, false, _G.Code1, nil, _G.Code2)
        wait(0.3)
        Debounces.LoopDrop = false
    end
    if Toggles.GrenadeRain then
        local Data = {
        	["throwrating"] = 4,
        	["ability"] = "Impact triggered explosive.",
        	["animset"] = "THRW",
        	["woundrating"] = 2,
        	["weapontype"] = "Item",
        	["name"] = "Impact Grenade",
        	["damagerating"] = {
        		[1] = 0,
        		[2] = 0,
        		[3] = GrenadeRainDamage
        	},
        	["icon"] = "2331748192",
        	["sizerating"] = 4,
        	["desc"] = "Formerly created  by a man from somewhere in Russia, this little explosive device can go boom upon impacting something! No idea what Russia is though."
        }
        local RandomX = math.random(-179,420)
        local RandomZ = math.random(-205,196)
        local Position1 = Vector3.new(RandomX,150,RandomZ)
        local Position2 = Vector3.new(RandomX,-100,RandomZ)
        TargetCFrame = CFrame.new(Position1,Position2)
        if _G.Code1 ~= nil and _G.Code2 ~= nil then
            game.Workspace.ServerStuff.throwWeapon:FireServer("ImpN", 0, TargetCFrame, 0.1960853934288, Data, nil, false, _G.Code1, nil, _G.Code2)
        end
    end
end

local function GrabMainScript()
    local Script = nil
    for i,v in pairs(game.Players.LocalPlayer.Backpack.GetChildren(game.Players.LocalPlayer.Backpack)) do
        if v:IsA("LocalScript") and v.Name ~= "ClickDetectorScript" then
            Script = v
        end
    end
    return Script
end

local function GrabEssentials()
    local FunnyPlace = getrenv()._G
    local TempEnv = getsenv(GrabMainScript())
    repeat
        FunnyPlace = getrenv()._G
        TempEnv = getsenv(GrabMainScript())
        wait(0.3)
    until FunnyPlace["keylist"] ~= nil and TempEnv["afflictstatus"] ~= nil and TempEnv["drop_slide"] ~= nil
    wait(1)
    if TempEnv["afflictstatus"] ~= nil then
        local upvalues = getupvalues(TempEnv.afflictstatus)
        for i,v in pairs(upvalues) do
            if _G.Code1 ~= nil then
                break
            end
            if typeof(v) == "number" then
                for x,y in pairs(FunnyPlace) do
                    if y == v then
                        _G.Code1 = v
                        break
                    end
                end
            end
        end
        local CorrectIndex = math.huge
        for i,v in pairs(upvalues) do
            if v == _G.Code1 and tonumber(i) ~= nil then
                CorrectIndex = i + 1
            end
            if i == CorrectIndex then
                _G.Code2 = v
            end
        end
    end
    if TempEnv["drop_slide"] ~= nil then
        for i,v in pairs(debug.getupvalues(TempEnv["drop_slide"])) do
            if typeof(v) == "table" then
                for x,y in pairs(v) do
                    if typeof(y) == "table" and y["effects"] ~= nil then
                        EffectsTable = v
                        break
                    end
                end
            end
        end
    end
    if TempEnv["unloadgun"] ~= nil then
        for i,v in pairs(debug.getupvalues(TempEnv["unloadgun"])) do
            if typeof(v) == "table" and v["Light"] ~= nil then
                AmmoTable = v
            end
        end
    end
    if TempEnv["ration_system_handler"] ~= nil then
        FoodTable = TempEnv["ration_system_handler"]
    end
    if TempEnv["convertToShadow"] ~= nil then
        for i,v in pairs(getupvalues(TempEnv.convertToShadow)) do
            if typeof(v) == "function" then
                local constants = debug.getconstants(v)
                for x,y in pairs(constants) do
                    if table.find(DevWeapons,y) then
                        debug.setconstant(v,x,"DXDXDXDXD")
                    end
                end
            end
        end
    end
    TempEnv = nil
    FunnyPlace = nil
end

local function HealOnce()
    if _G.Code1 ~= nil and _G.Code2 ~= nil then
        local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats["HStim"].animset)
        game.Workspace.ServerStuff.getTPWeapon:FireServer("HStim", AnimSet, "Fist", nil, false)
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HStim")
        workspace.ServerStuff.dealDamage:FireServer("stimheal", nil, _G.Code1, _G.Code2)
    end
end

local function ApplyGod(ungod)
    local AnimSet = game.ReplicatedStorage.animationSets.TPanimSets.global
    repeat game.Workspace.ServerStuff.getTPWeapon:FireServer("ImpN", AnimSet, "Fist", nil, false) wait() until game.Players.LocalPlayer.Character:FindFirstChild("ImpN")
    local Previous = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(243.9402313232422, 26.216890335083008, -201.4144744873047)
    local Target = CFrame.new(243.940231, 27.7168903, -201.414474, -1, 2.27966084e-05, -4.12229565e-06, 0, 0.177943438, 0.984040737, 2.31663253e-05, 0.984040737, -0.177943438)
    local Damage = -6000000
    if ungod == true then
        if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            Damage = game.Players.LocalPlayer.Character.Humanoid.Health - game.Players.LocalPlayer.Character.Humanoid.MaxHealth
        end
    end
    local Data = {
    	["throwrating"] = 4,
    	["ability"] = "Impact triggered explosive.",
    	["animset"] = "THRW",
    	["desc"] = "Formerly created  by a man from somewhere in Russia, this little explosive device can go boom upon impacting something! No idea what Russia is though.",
    	["weapontype"] = "Item",
    	["name"] = "Impact Grenade",
    	["damagerating"] = {
    		[1] = 0,
    		[2] = 0,
    		[3] = Damage
    	},
    	["sizerating"] = 4,
    	["icon"] = "2331748192",
    	["woundrating"] = 2
    }
    wait(0.3)
    workspace.ServerStuff.throwWeapon:FireServer("ImpN", 0, Target, 0.19530236721038818, Data, 1, false, _G.Code1, nil, _G.Code2)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Previous
    if EffectsTable == nil then
        GrabEssentials()
    end
    for i,v in pairs(EffectsTable) do
        if not string.find(i, "Virus") and v["effects"] ~= nil and typeof(v.effects) == "table" and v.effects["currentduration"] ~= nil and typeof(v.effects) ~= "Color3" and v.effects.colour ~= nil then
            if v.effects.colour == false or i == "Burning" or i == "Exhaustion" or v.effects.colour == Color3.new(1,0.05,0.05) then
                v.effects.currentduration = 0
            end
        end
    end
end


local function HealthChanged(Health)
    if not Toggles.SemiGodmode then
        return
    end
    if Humanoid == nil or not Humanoid:FindFirstAncestor("Workspace") then
        return
    end
    if Health < Humanoid.MaxHealth then
        -- for i = 1,(Humanoid.MaxHealth - Health) do
            spawn(HealOnce)
        -- end
    end
end

local function RemoveMark(child)
    if child.Name == "playerflagged" then
        wait(0.1)
        child.Parent = nil
    end
end

local function ReserveChanged()
    if Toggles.InfAmmo and AmmoTable ~= nil then
        for i,v in pairs(AmmoTable) do
            --if tonumber(AmmoTable[i]) == nil then
                AmmoTable[i] = 900
           -- end
        end
    end
end


local function AkimboChanged(child, new)
    if new == nil or not child:FindFirstAncestor("Workspace") then
        AkimboActive = false
    end
end

local function ClipChanged()
    if Toggles.InfClip--[[ and not string.find(string.lower(ClipLabel.Text), "inf")]] then
        local Pee = getsenv(GrabMainScript())
        local GetSex = getupvalues(Pee.unloadgun)
        for i,v in pairs(GetSex) do
            if typeof(v) == "table"  then
                for x,y in pairs(v) do
                    if typeof(y) == "table" then
                        for n,m in pairs(y) do
                            if y[n] == tonumber(ClipLabel.Text) then
                                if AkimboActive then
                                    y[n] = 20
                                else
                                    y[n] = math.huge
                                end
                            end
                        end
                    end
                end
            end
        end
        Pee = nil
        GetSex = nil
    end
end

local function MenuEffect()
    local Sound = game.ReplicatedStorage.soundLibrary.AGENT:FindFirstChild("menu"):Clone()
    Sound.Parent = game.Players.LocalPlayer.PlayerGui
    Sound.SoundGroup = game:GetService("SoundService").regular
    Sound.Looped = false;
    Sound.Ended:connect(function()
        spawn(function()
            Sound:Destroy()
        end)
    end)
    Sound:Play()
    local BlinkEffect = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.bg:Clone()
    BlinkEffect.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    spawn(function()
        while true do
            BlinkEffect.ImageTransparency = BlinkEffect.ImageTransparency + 0.05
            wait()
            if BlinkEffect.ImageTransparency >= 1 then
                break
            end	
        end
        BlinkEffect:Destroy()
    end)
end

local function VirusChanged()
    if Toggles.VirusBlock and VirusFrame ~= nil and EffectsTable[VirusFrame.Name] ~= nil then
        EffectsTable[VirusFrame.Name].effects.currentduration = tick()
    end
end

local function StatusAdded(new)
    if string.find(new.Name, "Virus") then
        VirusFrame = new
        repeat wait() until new:FindFirstChild("EmptyBar")
        repeat wait() until new.EmptyBar:FindFirstChild("Bar")
        new.EmptyBar.Bar.Changed:Connect(VirusChanged)
    end
    if not Toggles.AntiDebuff then
        if not Toggles.AntiFallDamage then
            return
        elseif Toggles.AntiFallDamage and new.Name ~= "Cripple" then
            return
        end
    end
    repeat wait() until EffectsTable[new.Name] ~= nil
    wait()
    if new:IsA("Frame") and EffectsTable ~= nil and EffectsTable[new.Name] ~= nil and not string.find(new.Name,"Virus") then
        if EffectsTable[new.Name].effects ~= nil and EffectsTable[new.Name].effects.currentduration ~= nil and EffectsTable[new.Name].effects.colour ~= nil then
            if EffectsTable[new.Name].effects.colour == Color3.new(1,0.05,0.05) or EffectsTable[new.Name].effects.colour == false or new.Name == "Burning" or new.Name == "Exhaustion" then
                EffectsTable[new.Name].effects.currentduration = 0
            end
        end
    end
end


local function GetClosest()
    local LowestDistance = math.huge
    local ClosestCharacter = nil
    local Characters = game.Workspace.activeHostiles.GetChildren(game.Workspace.activeHostiles)
    for i,v in pairs(game.Workspace.NoTarget.GetChildren(game.Workspace.NoTarget)) do
        table.insert(Characters, v)
    end
    for i,v in pairs(Characters) do
        if v ~= nil then
            if v.FindFirstChild(v, "Torso") then
                local InitialDis = (v.Torso.Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local Ray = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * InitialDis)
                local Part,Position = game.Workspace.FindPartOnRay(game.Workspace, Ray, game.Workspace)
                local FinalDifference = math.floor((Position - v.Torso.Position).magnitude)
                if FinalDifference < LowestDistance then
                    ClosestCharacter = v
                    LowestDistance = FinalDifference
                end
            end
        end
    end
    return ClosestCharacter
end

local function Mark(part,table,visible,fade,fadedis)
    local billgui = Instance.new('BillboardGui', part)
    local imagelab = Instance.new('ImageLabel', billgui)
    
    billgui.Name = "ESPBillboard"
    billgui.Adornee  = part
    billgui.AlwaysOnTop = true
    --billgui.ExtentsOffset = Vector3.new(0, 1, 0)
    billgui.ExtentsOffsetWorldSpace = Vector3.new(0, 1, 0)
    billgui.StudsOffset = Vector3.new(0, 3, 0)
    billgui.Size = UDim2.new(0, 60, 0, 60)
    if visible == nil or visible == true then
        billgui.Enabled = true
    else
        billgui.Enabled = false
    end
    
    imagelab.Name = "ESPLabel"
    imagelab.Image = "rbxassetid://"..table.img
    imagelab.BackgroundTransparency = 1
    imagelab.BorderSizePixel = 0
    imagelab.Position = UDim2.new(0, 0, 0, 0)
    imagelab.Size = UDim2.new(1, 0, 1, 0)
    imagelab.Visible = true
    imagelab.ZIndex = 10

    if table["subtext"] ~= nil then
        local textlab = Instance.new('TextLabel', imagelab)
        textlab.Name = "ESPLabel"
        textlab.BackgroundColor3 = Color3.new(255, 255, 255)
        textlab.BackgroundTransparency = 1
        textlab.BorderSizePixel = 0
        textlab.Position = UDim2.new(0.4, 0, 0.8, 0)
        textlab.Size = UDim2.new(0.2, 0, 0.2, 0)
        textlab.Visible = true
        textlab.ZIndex = 15
        textlab.Font = 'ArialBold'
        textlab.FontSize = 2
        textlab.Text = table["subtext"]
        textlab.TextColor3 = Color3.fromRGB(255,255,255)
        if table["subtextcolor"] ~= nil then
            textlab.TextStrokeColor3 = table["subtextcolor"]
        else
            textlab.TextStrokeColor3 = Color3.fromRGB(255,0,93)
        end
        textlab.TextStrokeTransparency = 0.6
        textlab.TextXAlignment = Enum.TextXAlignment.Center
    end
    return billgui
end

local function EspHandle(v)
    if v.Name == "ai_type" and v:IsA("StringValue") and EspInfo.Scavs[v.Value] ~= nil then
        repeat wait() until v.Parent == nil or v.Parent:FindFirstChild("Head")
        if string.find(v.Value, "Shadow") then
            local EspItem = Mark(v.Parent:FindFirstChild("Head"), EspInfo.Scavs[v.Value], EspInfo.Toggles.Demons)
            table.insert(EspObjects.Demons,EspItem)
        elseif v.Parent ~= nil then
            local EspItem = Mark(v.Parent:FindFirstChild("Head"), EspInfo.Scavs[v.Value], EspInfo.Toggles.Enemies)
            table.insert(EspObjects.Enemies,EspItem)
        end
        return
    end
    if v.Name == "Interact" then
        local Swag = v:FindFirstAncestorOfClass("Model")
        if Swag ~= nil and string.find(Swag.Name, "Locker") then
            local EspItem = Mark(v, EspInfo["Interactables"]["Locker"], EspInfo.Toggles["Locker"])
            table.insert(EspObjects["Locker"], EspItem)
        elseif Swag ~= nil and EspInfo["Interactables"][Swag.Name] ~= nil and EspInfo["Toggles"][Swag.Name] ~= nil then
            local EspItem = Mark(v, EspInfo["Interactables"][Swag.Name], EspInfo.Toggles[Swag.Name])
            table.insert(EspObjects[Swag.Name], EspItem)
        elseif string.find(Swag.Name, "Ammo") then
            local EspItem = Mark(v, EspInfo["Items"]["Ammo"], EspInfo.Toggles.Ammo)
            table.insert(EspObjects.Ammo, EspItem)
        end
    end
    if v.Name == "JointGrip" and v:FindFirstAncestor("WeaponDrops") then
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        local Item = v:FindFirstAncestorOfClass("Model")
        if Item == nil or WeaponStats == nil then
            return
        end
        local Type = nil
        if WeaponStats[Item.Name] ~= nil and WeaponStats[Item.Name]["weapontype"] ~= nil then
            Type = WeaponStats[Item.Name]["weapontype"]
        else
            return
        end
        if Type == "Gun" then
            local EspItem = Mark(v, EspInfo.Items.Guns, EspInfo.Toggles.Guns)
            table.insert(EspObjects.Guns,EspItem)
        elseif Type ~= "Item" then
            local EspItem = Mark(v, EspInfo.Items.Melee, EspInfo.Toggles.Melee)
            table.insert(EspObjects.Melee,EspItem)
        else
            if string.sub(Item.Name, #Item.Name-2,-1) == "Aid" or Item.Name == "HStim" then
                local EspItem = Mark(v, EspInfo.Items.Health,EspInfo.Toggles.Health)
                table.insert(EspObjects.Health,EspItem)
            elseif string.sub(Item.Name, #Item.Name-3,-1) == "Stim" then
                local EspItem = Mark(v, EspInfo.Items.Stims, EspInfo.Toggles.Stims)
                table.insert(EspObjects.Stims,EspItem)
            elseif Item.Name == "BPack" then
                local EspItem = Mark(v, EspInfo.Items.Backpack, EspInfo.Toggles.Backpacks)
                table.insert(EspObjects.Backpacks,EspItem)
            elseif string.sub(Item.Name, 1,2) == "BP" then
                local EspItem = Mark(v, EspInfo.Items.Blueprints, EspInfo.Toggles.Blueprints)
                table.insert(EspObjects.Blueprints,EspItem)
            elseif Item.Name == "APack" then
                local EspItem = Mark(v, EspInfo.Items.BodyArmor, EspInfo.Toggles.BodyArmor)
                table.insert(EspObjects.BodyArmor,EspItem)
            elseif WeaponStats[Item.Name]["animset"] ~= nil and WeaponStats[Item.Name]["animset"] == "THRW" then
                local EspItem = Mark(v, EspInfo.Items.Throwable, EspInfo.Toggles.Throwable)
                table.insert(EspObjects.Throwable,EspItem)
            elseif table.find({"RExplosive","PMine","PTrap","SSnare"},Item.Name) then
                local EspItem = Mark(v, EspInfo.Items.Placeable, EspInfo.Toggles.Traps)
                table.insert(EspObjects.Traps,EspItem)
            end
        end
-- BPack
-- DEFStim
-- SPDStim
-- HStim
-- MAid
-- FAid
-- APack
    end
end


local function SetupGUI()
    repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("TabMenu")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu:FindFirstChild("bg")
    if game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("GOODWILL") then
        return
    end
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("rations")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("ammodrop")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("weaponinfo")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("scrap")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("rationstab")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("scraptab")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:FindFirstChild("weaponinfotab")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab:FindFirstChild("founditem")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.scraptab:FindFirstChild("lessbutton")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.scraptab:FindFirstChild("morebutton")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab:FindFirstChild("Soda")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab.Soda:FindFirstChild("drop")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab.Soda:FindFirstChild("desc")

    local GoodwillButton = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rations:Clone()
    GoodwillButton.Name = "GOODWILL"
    GoodwillButton.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    GoodwillButton.Text = "GOODWILL"
    GoodwillButton.Position = UDim2.new(0.949999988, -340, 0.899999976, 0)
    local GoodwillTab = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab:Clone()
    GoodwillTab:ClearAllChildren()
    GoodwillTab.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    GoodwillTab.Name = "GOODWILLtab"

    local FeatureButton = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab.Soda.drop:Clone()
    FeatureButton.Size = UDim2.new(0.24, 0, 0.15, 0)

    local SmallText = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab.Soda.desc:Clone()
    SmallText.Size = UDim2.new(0.24, 0, 0.15, 0)

    local MoreButton = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.scraptab:FindFirstChild("morebutton"):Clone()
    MoreButton.Size = UDim2.new(0.05, 0, 0.084, 0)
    local LessButton = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.scraptab:FindFirstChild("lessbutton"):Clone()
    LessButton.Size = UDim2.new(0.05, 0, 0.084, 0)

    for i,v in pairs(GuiCommands) do
        local NewButton = FeatureButton:Clone()
        NewButton.Name = v
        NewButton.Text = v
        NewButton.Parent = GoodwillTab
        local OutOfFour = (((i/4)%1)/25)*100
        if OutOfFour == 0 then
            OutOfFour = 4 -- fuck math
        end
        local Rounded = math.floor((i/4)-0.01)
        NewButton.Position = UDim2.new(0.24*(OutOfFour-1),OutOfFour*15,0.15*Rounded,Rounded*15)
        NewButton.MouseButton1Down:Connect(function()
            MenuEffect()
            if Toggles[v] ~= nil and Toggles[v] then
                game.Players:Chat(":un"..v)
            else
                game.Players:Chat(":"..v)
            end
        end)
    end


    local MothLogo = Instance.new("ImageLabel", game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg)
    MothLogo.Visible = false
    MothLogo.BackgroundTransparency = 1
    MothLogo.Image = "rbxassetid://7841170230"
    MothLogo.Size = UDim2.new(0.17,0,0.371,0)
    MothLogo.Position = UDim2.new(0,20,0.65,0)
    local CreditText = SmallText:Clone()
    CreditText.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    CreditText.TextXAlignment = Enum.TextXAlignment.Left
    CreditText.Size = UDim2.new(0.001, 0, 0.001, 0)
    CreditText.Position = UDim2.new(0.2,0,0.8,0)
    CreditText.Text = "> ESP ICONS MADE BY PALEMOTH"
    CreditText.Visible = false

    local Watermark = Instance.new("ImageLabel",game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg)
    watermark = Watermark
    Watermark.Name = "Watermark"
    Watermark.BackgroundColor3 = Color3.new(1, 1, 1)
    Watermark.BackgroundTransparency = 1
    Watermark.Position = UDim2.new(0,0,0.7,0)
    Watermark.Size = UDim2.new(0.3,0,0.25,0)
    Watermark.ImageTransparency = 0
    Watermark.Image = "rbxassetid://4738504469"
    Watermark.Visible = false
    local CreditText2 = SmallText:Clone()
    CreditText2.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    CreditText2.TextXAlignment = Enum.TextXAlignment.Left
    CreditText2.Size = UDim2.new(0.001, 0, 0.001, 0)
    CreditText2.Position = UDim2.new(0.28,0,0.75,0)
    CreditText2.Text = "> SCRIPT BY AIDEZ"
    CreditText2.Visible = false

    GoodwillButton.MouseButton1Down:Connect(function()
        MenuEffect()
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:GetChildren()) do
            if string.sub(string.lower(v.Name), #v.Name - 2, -1) == "tab" and v.Name ~= "GOODWILLtab" and v.Name ~= "objectivetab" then
                 v.Visible = false
            elseif v.Parent:FindFirstChild(v.Name.."tab") and v.Name ~= "GOODWILL" then
                 v.BackgroundTransparency = 0.7
            end
        end
        Watermark.Visible = true
        CreditText2.Visible = true
        MothLogo.Visible = false
        CreditText.Visible = false
        GoodwillTab.Visible = true
        GoodwillButton.BackgroundTransparency = 0.3
    end)

    local ESPButton = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rations:Clone()
    ESPButton.Name = "ESP"
    ESPButton.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    ESPButton.Text = "ESP"
    ESPButton.Position = UDim2.new(0.949999988, -340, 0.980000019, 0)
    local ESPTab = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.rationstab:Clone()
    ESPTab:ClearAllChildren()
    ESPTab.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg
    ESPTab.Name = "ESPtab"

    ESPButton.MouseButton1Down:Connect(function()
        MenuEffect()
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:GetChildren()) do
            if string.sub(string.lower(v.Name), #v.Name - 2, -1) == "tab" and v.Name ~= "ESPtab" and v.Name ~= "objectivetab" then
                 v.Visible = false
            elseif v.Parent:FindFirstChild(v.Name.."tab") and v.Name ~= "ESP" then
                 v.BackgroundTransparency = 0.7
            end
        end
        Watermark.Visible = false
        CreditText2.Visible = false
        ESPTab.Visible = true
        MothLogo.Visible = true
        CreditText.Visible = true
        ESPButton.BackgroundTransparency = 0.3
        GoodwillButton.BackgroundTransparency = 0.7
    end)
    local EspButtonsTemp = {}
    for i,v in pairs(EspInfo.Toggles) do
        local NewButton = FeatureButton:Clone()
        NewButton.Name = i
        NewButton.Text = i
        NewButton.Parent = ESPTab
        if v == true then
            NewButton.BackgroundTransparency = 0.3
        else
            NewButton.BackgroundTransparency = 0.7
        end
        NewButton.MouseButton1Down:Connect(function()
            MenuEffect()
            EspInfo.Toggles[i] = not EspInfo.Toggles[i]
            for x,y in pairs(EspObjects[i]) do
                y.Enabled = EspInfo.Toggles[i]
            end
            if EspInfo.Toggles[i] then
                NewButton.BackgroundTransparency = 0.3
            else
                NewButton.BackgroundTransparency = 0.7
            end
        end)
        table.insert(EspButtonsTemp, NewButton)
    end
    local AllOff = FeatureButton:Clone()
    AllOff.Name = "ALL OFF"
    AllOff.Text = "TURN ALL OFF"
    AllOff.Parent = ESPTab
    AllOff.BackgroundTransparency = 0.3
    AllOff.MouseButton1Down:Connect(function()
        for i,v in pairs(EspInfo.Toggles) do
            EspInfo.Toggles[i] = false
            for x,y in pairs(EspObjects[i]) do
                y.Enabled = EspInfo.Toggles[i]
            end
        end
        for i,v in pairs(ESPTab:GetChildren()) do
            if v:IsA("TextButton") and v.Name ~= "ALL OFF" then
                v.BackgroundTransparency = 0.7
            end
        end
    end)
    table.insert(EspButtonsTemp, AllOff)
    for i,v in pairs(EspButtonsTemp) do
        local OutOfFour = (((i/4)%1)/25)*100
        if OutOfFour == 0 then
            OutOfFour = 4 -- fuck math
        end
        local Rounded = math.floor((i/4)-0.01)
        v.Position = UDim2.new(0.24*(OutOfFour-1),OutOfFour*15,0.15*Rounded,Rounded*15)
    end


    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg:GetChildren()) do
        if v:IsA("TextButton") and v.Name ~= "GOODWILL" and v.Name ~= "ESP" then
            v.MouseButton1Down:Connect(function()
                GoodwillButton.BackgroundTransparency = 0.7
                GoodwillTab.Visible = false
                ESPButton.BackgroundTransparency = 0.7
                ESPTab.Visible = false
                MothLogo.Visible = false
                CreditText.Visible = false
                Watermark.Visible = false
                CreditText2.Visible = false
            end)
        end
    end

    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line1")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line2")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line3")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line4")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line5")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line6")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line7")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:FindFirstChild("line8")

    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab:FindFirstChild("error_found")

    local ErrorFound = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab["error_found"]
    local FrameClone = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:Clone()

    local ResetButton = MoreButton:Clone()
    ResetButton.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem
    ResetButton.Position = UDim2.new(0.9,0,0.200000003,0)
    ResetButton.Size = UDim2.new(0.127, 0, 0.084, 0)
    ResetButton.icon.Text = "Default"

    ResetButton.MouseButton1Down:Connect(function()
        if WeaponStats == nil then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
        end
        if ShownWeapon == "nil" or ShownWeapon == "" then
            return
        end
        for i,v in pairs(WeaponStats[ShownWeapon]) do
            if string.sub(i,#i - 2,-1) ~= "old" and WeaponStats[ShownWeapon][i.."old"] ~= nil then
                WeaponStats[ShownWeapon][i] = WeaponStats[ShownWeapon][i.."old"]
            end
        end
    end)

    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:GetChildren()) do
        if string.find(v.Name, "line") and v.Name ~= "line1" and not string.find(v.Name, "more") and not string.find(v.Name, "less") and not string.find(v.Name, "big") then
            local Space = string.find(v.Text, ": ")
            local StatName = ""
            local StatPlacement = nil
            if Space ~= nil then
                StatName = string.sub(v.Text, 2, Space-1)
                StatPlacement = NameToStat[StatName]
            end
            local NewMoreButton = MoreButton:Clone()
            local NewLessButton = LessButton:Clone()
            NewMoreButton.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem
            NewLessButton.Parent = NewMoreButton.Parent
            NewMoreButton.Position = UDim2.new(0.9,40,v.Position.Y.Scale,0)
            NewLessButton.Position = UDim2.new(0.9,0,v.Position.Y.Scale,0)
            NewMoreButton.Name = v.Name.."more"
            NewLessButton.Name = v.Name.."less"

            local NewBigMore = NewMoreButton:Clone()
            local NewBigLess = NewLessButton:Clone()
            NewBigMore.Parent = NewMoreButton.Parent
            NewBigLess.Parent = NewMoreButton.Parent
            NewBigMore.Name = NewBigMore.Name.."big"
            NewBigLess.Name = NewBigLess.Name.."big"
            NewBigMore.Position = UDim2.new(0.9,75,v.Position.Y.Scale,0)
            NewBigLess.Position = UDim2.new(0.9,-35,v.Position.Y.Scale,0)
            NewBigLess.icon.Text = "--"
            NewBigMore.icon.Text = "++"

            if StatPlacement ~= nil and StatPlacement["BigIncrement"] ~= nil then
                NewBigMore.Visible = true
                NewBigLess.Visible = true
            else
                NewBigMore.Visible = false
                NewBigLess.Visible = false
            end

            if v.Text == "" or string.find(v.Text, "RARITY") or string.find(v.Text, "HEAVY_SWING") then
                NewMoreButton.Visible = false
                NewLessButton.Visible = false
                NewBigMore.Visible = false
                NewBigLess.Visible = false
            end
            if string.find(v.Text, "TRUE") then
                NewLessButton.Visible = false
                NewMoreButton.icon.Text = "X"
            elseif string.find(v.Text, "FALSE") then
                NewLessButton.Visible = false
                NewMoreButton.icon.Text = ""
            end

            v:GetPropertyChangedSignal("Text"):Connect(function()
                local Space = string.find(v.Text, ": ")
                local StatName = ""
                local StatPlacement = nil
                if Space ~= nil then
                    StatName = string.sub(v.Text, 2, Space-1)
                    StatPlacement = NameToStat[StatName]
                end
                if StatPlacement ~= nil and StatPlacement["BigIncrement"] ~= nil then
                    NewBigMore.Visible = true
                    NewBigLess.Visible = true
                    NewBigLess.icon.Text = "--"
                    NewBigMore.icon.Text = "++"
                else
                    NewBigMore.Visible = false
                    NewBigLess.Visible = false
                end
                if string.find(v.Text, "TRUE") then
                    NewLessButton.Visible = false
                    NewMoreButton.icon.Text = "X"
                elseif string.find(v.Text, "FALSE") then
                    NewLessButton.Visible = false
                    NewMoreButton.icon.Text = ""
                elseif v.Text == "" or string.find(v.Text, "RARITY") or string.find(v.Text, "HEAVY_SWING") then
                    NewLessButton.Visible = false
                    NewMoreButton.Visible = false
                    NewBigMore.Visible = false
                    NewBigLess.Visible = false
                else
                    NewLessButton.Visible = true
                    NewLessButton.icon.Text = "-"
                    NewMoreButton.Visible = true
                    NewMoreButton.icon.Text = "+"
                end
            end)

            NewMoreButton.MouseButton1Down:Connect(function()
                local Label = NewMoreButton.Parent:FindFirstChild(string.sub(NewMoreButton.Name,1,#NewMoreButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewMoreButton.icon.Text == "+" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if NameToStat[StatName].Index ~= nil then
                        if WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] + StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] + StatPlacement.Increment
                        end
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.Increment
                        end
                    end
                elseif NewMoreButton.icon.Text == "" then
                    WeaponStats[ShownWeapon].auto = false
                    NewMoreButton.icon.Text = "X"
                elseif NewMoreButton.icon.Text == "X" then
                    WeaponStats[ShownWeapon].auto = true
                    NewMoreButton.icon.Text = ""
                end
            end)

            NewLessButton.MouseButton1Down:Connect(function()
                local Label = NewLessButton.Parent:FindFirstChild(string.sub(NewLessButton.Name,1,#NewLessButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewLessButton.icon.Text == "-" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if NameToStat[StatName].Index ~= nil then
                        if WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] - StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] - StatPlacement.Increment
                        end
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.Increment
                        end
                    end
                end
            end)

            NewBigMore.MouseButton1Down:Connect(function()
                local Label = NewBigMore.Parent:FindFirstChild(string.sub(NewBigMore.Name,1,#NewBigMore.Name-7))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewBigMore.icon.Text == "++" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if NameToStat[StatName].Index ~= nil then
                        if WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] + StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] + StatPlacement.BigIncrement
                        end
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.BigIncrement
                        end
                    end
                elseif NewBigMore.icon.Text == "" then
                    WeaponStats[ShownWeapon].auto = false
                    NewBigMore.icon.Text = "X"
                elseif NewBigMore.icon.Text == "X" then
                    WeaponStats[ShownWeapon].auto = true
                    NewBigMore.icon.Text = ""
                end
            end)
          

            NewBigLess.MouseButton1Down:Connect(function()
                local Label = NewBigLess.Parent:FindFirstChild(string.sub(NewBigLess.Name,1,#NewBigLess.Name-7))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewBigLess.icon.Text == "--" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if NameToStat[StatName].Index ~= nil then
                        if WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][tostring(StatPlacement.Index).."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] - StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] = WeaponStats[ShownWeapon][StatPlacement.Stat][StatPlacement.Index] - StatPlacement.BigIncrement
                        end
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.BigIncrement
                        end
                    end
                end
            end)


        end
    end

    if game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab:FindFirstChild("AlternateFrame") then
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab:FindFirstChild("AlternateFrame"):Destroy()
    end
    FrameClone.Name = "AlternateFrame"

    FrameClone.Parent = game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab
    FrameClone.Visible = not game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem.Visible

    FrameClone.line1.Text = ">SPECIFICATION: MISC"
    FrameClone.line2.Text = ">LIMB_DAMAGE"
    FrameClone.line3.Text = ">HEAD_DAMAGE"
    FrameClone.line4.Text = ">SPEED_RATING"
    FrameClone.line5.Text = ">CHARGE_RATING"
    FrameClone.line6.Text = ">WOUND_RATING"
    FrameClone.line7.Text = ">SIZE_RATING"
    FrameClone.line8.Text = ">THROW_RATING"

    local ResetButton2 = MoreButton:Clone()
    ResetButton2.Parent = FrameClone
    ResetButton2.Position = UDim2.new(0.9,0,0.200000003,0)
    ResetButton2.Size = UDim2.new(0.127, 0, 0.084, 0)
    ResetButton2.icon.Text = "Default"

    ResetButton2.MouseButton1Down:Connect(function()
        if WeaponStats == nil then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
        end
        if ShownWeapon == "nil" or ShownWeapon == "" then
            return
        end
        for i,v in pairs(WeaponStats[ShownWeapon]) do
            if string.sub(i,#i - 2,-1) ~= "old" and WeaponStats[ShownWeapon][i.."old"] ~= nil then
                WeaponStats[ShownWeapon][i] = WeaponStats[ShownWeapon][i.."old"]
            end
        end
        UpdateMiscWeaponry()
    end)

    repeat wait() until ShownWeapon ~= nil and ShownWeapon ~= ""

    if ShownWeapon ~= nil and ShownWeapon ~= "" then
        if WeaponStats == nil then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
        end
        local ShownWeaponStats = WeaponStats[ShownWeapon]
        for i,v in pairs(FrameClone:GetChildren()) do
            if not string.find(v.Text, "DAMAGE") and string.find(v.Name, "line") and v.Name ~= "line1" and not string.find(v.Name, "more") and not string.find(v.Name, "less") then
                if ShownWeaponStats[NameToStat[string.gsub(v.Text, ">", "")].Stat] ~= nil then
                    v.Text = v.Text..": "..tostring(ShownWeaponStats[NameToStat[string.gsub(v.Text, ">", "")].Stat])
                else
                    v.Text = v.Text..": N/A"
                end
            elseif string.find(v.Name, "more") or string.find(v.Name, "less") then
                v:Destroy()
            end
        end
        if FrameClone:FindFirstChild("line2") and FrameClone:FindFirstChild("line2") then
            if #ShownWeaponStats["damagerating"] == 2 then
                FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][1]
                FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][2]
            elseif #ShownWeaponStats["damagerating"] == 3 then
                FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][3]
            elseif #ShownWeaponStats["damagerating"] == 4 then
                FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][4]
            end
        end
    end
    game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem:GetPropertyChangedSignal("Visible"):Connect(function()
        ErrorFound.Visible = false
        if game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.founditem.Visible then
            FrameClone.Visible = false
        else
            FrameClone.Visible = true
        end
    end)

    for i,v in pairs(FrameClone:GetChildren()) do
        if string.find(v.Name, "line") and v.Name ~= "line1" and not string.find(v.Name, "more") and not string.find(v.Name, "less") then
            local Space = string.find(v.Text, ": ")
            local StatName = ""
            local StatPlacement = nil
            if Space ~= nil then
                StatName = string.sub(v.Text, 2, Space-1)
                StatPlacement = NameToStat[StatName]
            end

            local NewMoreButton = MoreButton:Clone()
            local NewLessButton = LessButton:Clone()
            NewMoreButton.Parent = FrameClone
            NewLessButton.Parent = NewMoreButton.Parent
            NewMoreButton.Position = UDim2.new(0.9,40,v.Position.Y.Scale,0)
            NewLessButton.Position = UDim2.new(0.9,0,v.Position.Y.Scale,0)
            NewMoreButton.Name = v.Name.."more"
            NewLessButton.Name = v.Name.."less"

            local NewBigMore = NewMoreButton:Clone()
            local NewBigLess = NewLessButton:Clone()
            NewBigMore.Parent = NewMoreButton.Parent
            NewBigLess.Parent = NewMoreButton.Parent
            NewBigMore.Name = NewBigMore.Name.."big"
            NewBigLess.Name = NewBigLess.Name.."big"
            NewBigMore.Position = UDim2.new(0.9,75,v.Position.Y.Scale,0)
            NewBigLess.Position = UDim2.new(0.9,-35,v.Position.Y.Scale,0)
            NewBigLess.icon.Text = "--"
            NewBigMore.icon.Text = "++"

            if StatPlacement ~= nil and StatPlacement["BigIncrement"] ~= nil then
                NewBigMore.Visible = true
                NewBigMore.Visible = true
            else
                NewBigMore.Visible = false
                NewBigLess.Visible = false
            end

            NewMoreButton.MouseButton1Down:Connect(function()
                local Label = NewMoreButton.Parent:FindFirstChild(string.sub(NewMoreButton.Name,1,#NewMoreButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewMoreButton.icon.Text == "+" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if string.find(StatName, "DAMAGE") then
                        local Index = #WeaponStats[ShownWeapon]["damagerating"]
                        if string.find(StatName, "LIMB") and Index ~= 3 then
                            Index = Index - 1
                        end
                        WeaponStats[ShownWeapon]["damagerating"][Index] = WeaponStats[ShownWeapon]["damagerating"][Index] + StatPlacement.Increment
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.Increment
                        end
                    end
                end
                if ShownWeapon ~= nil and ShownWeapon ~= "" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local ShownWeaponStats = WeaponStats[ShownWeapon]
                    for x,y in pairs(FrameClone:GetChildren()) do
                        if not string.find(y.Text, "DAMAGE") and string.find(y.Name, "line") and y.Name ~= "line1" and not string.find(y.Name, "more") and not string.find(y.Name, "less") then
                            local Space2 = string.find(y.Text, ": ")
                            local StatName2 = string.sub(y.Text, 2, Space2-1)
                            if ShownWeaponStats[NameToStat[StatName2].Stat] ~= nil then
                                y.Text = ">"..StatName2..": "..ShownWeaponStats[NameToStat[StatName2].Stat]
                            else
                                y.Text = ">"..StatName2..": N/A"
                            end
                        end
                    end
                    if #ShownWeaponStats["damagerating"] == 2 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][1]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][2]
                    elseif #ShownWeaponStats["damagerating"] == 3 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                    elseif #ShownWeaponStats["damagerating"] == 4 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][4]
                    end
                end
            end)

            NewLessButton.MouseButton1Down:Connect(function()
                local Label = NewLessButton.Parent:FindFirstChild(string.sub(NewLessButton.Name,1,#NewLessButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewLessButton.icon.Text == "-" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if string.find(StatName, "DAMAGE") then
                        local Index = #WeaponStats[ShownWeapon]["damagerating"]
                        if string.find(StatName, "LIMB") and Index ~= 3 then
                            Index = Index - 1
                        end
                        WeaponStats[ShownWeapon]["damagerating"][Index] = WeaponStats[ShownWeapon]["damagerating"][Index] - StatPlacement.Increment
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.Increment
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.Increment
                        end
                    end
                end
                if ShownWeapon ~= nil and ShownWeapon ~= "" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local ShownWeaponStats = WeaponStats[ShownWeapon]
                    for x,y in pairs(FrameClone:GetChildren()) do
                        if not string.find(y.Text, "DAMAGE") and string.find(y.Name, "line") and y.Name ~= "line1" and not string.find(y.Name, "more") and not string.find(y.Name, "less") then
                            local Space2 = string.find(y.Text, ": ")
                            local StatName2 = string.sub(y.Text, 2, Space2-1)
                            if ShownWeaponStats[NameToStat[StatName2].Stat] ~= nil then
                                y.Text = ">"..StatName2..": "..ShownWeaponStats[NameToStat[StatName2].Stat]
                            else
                                y.Text = ">"..StatName2..": N/A"
                            end
                        end
                    end
                    if #ShownWeaponStats["damagerating"] == 2 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][1]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][2]
                    elseif #ShownWeaponStats["damagerating"] == 3 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                    elseif #ShownWeaponStats["damagerating"] == 4 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][4]
                    end
                end
            end)

            NewBigMore.MouseButton1Down:Connect(function()
                local Label = NewMoreButton.Parent:FindFirstChild(string.sub(NewMoreButton.Name,1,#NewMoreButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewMoreButton.icon.Text == "+" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if string.find(StatName, "DAMAGE") then
                        local Index = #WeaponStats[ShownWeapon]["damagerating"]
                        if string.find(StatName, "LIMB") and Index ~= 3 then
                            Index = Index - 1
                        end
                        WeaponStats[ShownWeapon]["damagerating"][Index] = WeaponStats[ShownWeapon]["damagerating"][Index] + StatPlacement.BigIncrement
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] + StatPlacement.BigIncrement
                        end
                    end
                end
                if ShownWeapon ~= nil and ShownWeapon ~= "" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local ShownWeaponStats = WeaponStats[ShownWeapon]
                    for x,y in pairs(FrameClone:GetChildren()) do
                        if not string.find(y.Text, "DAMAGE") and string.find(y.Name, "line") and y.Name ~= "line1" and not string.find(y.Name, "more") and not string.find(y.Name, "less") then
                            local Space2 = string.find(y.Text, ": ")
                            local StatName2 = string.sub(y.Text, 2, Space2-1)
                            if ShownWeaponStats[NameToStat[StatName2].Stat] ~= nil then
                                y.Text = ">"..StatName2..": "..ShownWeaponStats[NameToStat[StatName2].Stat]
                            else
                                y.Text = ">"..StatName2..": N/A"
                            end
                        end
                    end
                    if #ShownWeaponStats["damagerating"] == 2 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][1]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][2]
                    elseif #ShownWeaponStats["damagerating"] == 3 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                    elseif #ShownWeaponStats["damagerating"] == 4 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][4]
                    end
                end
            end)

            NewBigLess.MouseButton1Down:Connect(function()
                local Label = NewLessButton.Parent:FindFirstChild(string.sub(NewLessButton.Name,1,#NewLessButton.Name-4))
                if Label == nil or ShownWeapon == nil then
                    return
                end
                local Space = string.find(Label.Text, ": ")
                local StatName = string.sub(Label.Text, 2, Space-1)
                if NewLessButton.icon.Text == "-" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local StatPlacement = NameToStat[StatName]
                    if string.find(StatName, "DAMAGE") then
                        local Index = #WeaponStats[ShownWeapon]["damagerating"]
                        if string.find(StatName, "LIMB") and Index ~= 3 then
                            Index = Index - 1
                        end
                        WeaponStats[ShownWeapon]["damagerating"][Index] = WeaponStats[ShownWeapon]["damagerating"][Index] - StatPlacement.BigIncrement
                    else
                        if WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] == nil then
                            WeaponStats[ShownWeapon][StatPlacement.Stat.."old"] = WeaponStats[ShownWeapon][StatPlacement.Stat]
                        end
                        local Projected = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.BigIncrement
                        if Projected <= 0 then
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = 0
                        else
                            WeaponStats[ShownWeapon][StatPlacement.Stat] = WeaponStats[ShownWeapon][StatPlacement.Stat] - StatPlacement.BigIncrement
                        end
                    end
                end
                if ShownWeapon ~= nil and ShownWeapon ~= "" then
                    if WeaponStats == nil then
                        WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
                    end
                    local ShownWeaponStats = WeaponStats[ShownWeapon]
                    for x,y in pairs(FrameClone:GetChildren()) do
                        if not string.find(y.Text, "DAMAGE") and string.find(y.Name, "line") and y.Name ~= "line1" and not string.find(y.Name, "more") and not string.find(y.Name, "less") then
                            local Space2 = string.find(y.Text, ": ")
                            local StatName2 = string.sub(y.Text, 2, Space2-1)
                            if ShownWeaponStats[NameToStat[StatName2].Stat] ~= nil then
                                y.Text = ">"..StatName2..": "..ShownWeaponStats[NameToStat[StatName2].Stat]
                            else
                                y.Text = ">"..StatName2..": N/A"
                            end
                        end
                    end
                    if #ShownWeaponStats["damagerating"] == 2 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][1]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][2]
                    elseif #ShownWeaponStats["damagerating"] == 3 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                    elseif #ShownWeaponStats["damagerating"] == 4 then
                        FrameClone.line2.Text = ">LIMB_DAMAGE: "..ShownWeaponStats["damagerating"][3]
                        FrameClone.line3.Text = ">HEAD_DAMAGE: "..ShownWeaponStats["damagerating"][4]
                    end
                end
            end)

        end
    end
end

local function UpdateMiscWeaponry()
    if WeaponStats == nil then
        return
    end
    local CurrentWeaponStats = WeaponStats[CurrentWeapon]
    if not game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.FindFirstChild(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab,"AlternateFrame") then
        return
    end
    if CurrentWeaponStats == nil then
        return
    end
    for x,y in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.GetChildren(game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame)) do
        if not string.find(y.Text, "DAMAGE") and string.find(y.Name, "line") and y.Name ~= "line1" and not string.find(y.Name, "more") and not string.find(y.Name, "less") and string.find(y.Text, ": ") then
            local Space2 = string.find(y.Text, ": ")
            local StatName2 = string.sub(y.Text, 2, Space2-1)
            if CurrentWeaponStats[NameToStat[StatName2].Stat] ~= nil then
                y.Text = ">"..StatName2..": "..CurrentWeaponStats[NameToStat[StatName2].Stat]
            else
                y.Text = ">"..StatName2..": N/A"
            end
        end
    end
    if #CurrentWeaponStats["damagerating"] == 2 then
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line2.Text = ">LIMB_DAMAGE: "..CurrentWeaponStats["damagerating"][1]
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line3.Text = ">HEAD_DAMAGE: "..CurrentWeaponStats["damagerating"][2]
    elseif #CurrentWeaponStats["damagerating"] == 3 then
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line2.Text = ">LIMB_DAMAGE: "..CurrentWeaponStats["damagerating"][3]
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line3.Text = ">HEAD_DAMAGE: "..CurrentWeaponStats["damagerating"][3]
    elseif #CurrentWeaponStats["damagerating"] == 4 then
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line2.Text = ">LIMB_DAMAGE: "..CurrentWeaponStats["damagerating"][3]
        game.Players.LocalPlayer.PlayerGui.mainHUD.TabMenu.bg.weaponinfotab.AlternateFrame.line3.Text = ">HEAD_DAMAGE: "..CurrentWeaponStats["damagerating"][4]
    end
end


namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FireServer" then
        local Args = {...}
        if tostring(self) == "getTPWeapon" then
            CurrentWeapon = Args[1]
            spawn(UpdateMiscWeaponry)
        end
        if tostring(self) == "throwWeapon" then
            if table.find(DevWeapons,tostring(Args[1])) then
                if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character.FindFirstChild(game.Players.LocalPlayer.Character, "hasPrimary") then
                    if game.Players.LocalPlayer.Character.hasPrimary.FindFirstChild(game.Players.LocalPlayer.Character.hasPrimary, Args[1]) then
                         game.Players.LocalPlayer.Character.hasPrimary.Parent = nil
                    end
                end
                Args[1] = "XDXDXDXDXDXDXDXDXDXD"
                return namecall(self, unpack(Args))
            end
        end
        if tostring(self) == "dropAmmo" and Args[1] == "agent_container" and typeof(Args[2]) == "table" and typeof(Args[2][1]) == "table" then
            for i,v in pairs(Args[2][1]) do
                Args[2][1][i] = 0
            end
            return namecall(self, unpack(Args))
        end
        if tostring(self) == "callEvent" then
            if Args[1] == "poke" or Args[1] == "self_gun"  then
                if game.Players.LocalPlayer.Character ~= nil then
                    game.Players.LocalPlayer.Character.BreakJoints(game.Players.LocalPlayer.Character)
                end
            else
                return
            end
        end
        if tostring(self) == "initiateblock" and Toggles.AutoParry then
            if Args[2] ~= nil and Args[2] == false then
                return
            end
        end
        if tostring(self) == "dealDamage" and not checkcaller() then
            if #Args >= 4 then
                _G.Code1 = Args[3]
                _G.Code2 = Args[4]
            end
            if Toggles.AntiFallDamage and Args[1] == "fall_damage" then
                return
            end
            if Toggles.AntiDebuff and table.find(DamageTypes,Args[1]) or Toggles.SilentAim and Args[1] == "gundamage" then
                return
            end
            if typeof(Args[1]) == "table" and typeof(Args[1][10]) == "table" then
                local NewStatsTable = {}
                for i,v in pairs(Args[1][10]) do
                    NewStatsTable[i] = v
                end
                for i,v in pairs(NewStatsTable) do
                    if string.sub(i,#i - 2,-1) ~= "old" and NewStatsTable[i.."old"] ~= nil then
                        NewStatsTable[i] = NewStatsTable[i.."old"]
                    end
                end
                for i,v in pairs(NewStatsTable) do
                    if string.sub(i,#i - 2,-1) == "old" then
                        v = nil
                    end
                end
                Args[1][10] = NewStatsTable
            end
            if Toggles.OneShot and typeof(Args[1]) == "table" and Args[1][2] ~= nil and string.find(tostring(Args[1][1]), "damage") and typeof(Args[1][2]) == "Instance" and Args[1][2].FindFirstChild(Args[1][2], "Humanoid") and Args[1][3] ~= nil and Args[1][3] ~= "shove" then
                if WeaponStats == nil and game.Workspace.FindFirstChild(game.Workspace,"ServerStuff") and game.Workspace.ServerStuff.FindFirstChild(game.Workspace.ServerStuff,"Statistics") and game.Workspace.ServerStuff.Statistics.FindFirstChild(game.Workspace.ServerStuff.Statistics,"W_STATISTICS") then
                    WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
                end
                local WeaponInfo = WeaponStats[tostring(CurrentWeapon)] or nil
                local WeaponType = "Fists"
                if WeaponInfo ~= nil then
                    WeaponType = WeaponInfo.weapontype
                end
                for i = 1,math.floor((Args[1][2].Humanoid.Health/Args[1][3])) + 1 do
                    if WeaponType == "Gun" then
                        workspace.ServerStuff.dealDamage.FireServer(workspace.ServerStuff.dealDamage,"gunsareloud", nil, _G.Code1, _G.Code2)
                    end
                    self.FireServer(self, unpack(Args))
                end
            end 
            return namecall(self, unpack(Args))
        end
        if tostring(self) == "applyGore" then
            if string.find(tostring(Args[1]), "fire") and Args[4] ~= nil and typeof(Args[4]) == "table" and #Args[4] <= 2 then
                return namecall(self, unpack(Args))
            end
            if string.find(tostring(Args[1]), "fire") and Args[4] ~= nil and typeof(Args[4]) == "table" and #Args[4] >= 3 then
                local AnimSet = game.ReplicatedStorage.animationSets.TPanimSets.FindFirstChild(game.ReplicatedStorage.animationSets.TPanimSets,WeaponStats[ShownWeapon].animset)
                game.Workspace.ServerStuff.getTPWeapon.FireServer(game.Workspace.ServerStuff.getTPWeapon,ShownWeapon, AnimSet, "Fist", nil, false)
            end
            if Toggles.SilentAim and string.find(tostring(Args[1]), "fire") then
                if WeaponStats[CurrentWeapon] ~= nil and _G.Code1 ~= nil and _G.Code2 ~= nil then
                    local Target = GetClosest()
                    if Target == nil then
                        return
                    end
                    local Damage = WeaponStats[CurrentWeapon].damagerating[4] or WeaponStats[CurrentWeapon].damagerating[3]
                    local FiringArgs = {
                    	[1] = "gundamage",
                    	[2] = Target,
                    	[3] = Damage,
                    	[4] = true,
                    	[5] = CurrentWeapon,
                    	[6] = false,
                    	[7] = false,
                    	[8] = {},
                    	[9] = Target.Torso,
                        [10] = WeaponStats[CurrentWeapon]
                    }
                    if not Toggles.OneShot then
                        game.Workspace.ServerStuff.dealDamage.FireServer(game.Workspace.ServerStuff.dealDamage, FiringArgs, nil, _G.Code1, _G.Code2)
                    else
                        for i = 1,math.floor((Target.Humanoid.Health/Damage)) + 1 do
                            game.Workspace.ServerStuff.dealDamage.FireServer(game.Workspace.ServerStuff.dealDamage, FiringArgs, nil, _G.Code1, _G.Code2)
                        end
                    end
                end
            end
        end
        if Toggles.InfRun and tostring(self) == "movementAdjust" and not checkcaller() then
            if tostring(Args[1]) == "sprint" and Args[2] == true then
                return
            end
        end
    end
    return namecall(self, ...)
end)

local function getargs(inputstring)
    inputstring = string.lower(inputstring)
    inputstring = string.gsub(inputstring, "'", "")
    inputstring = string.gsub(inputstring, ":", "")
    inputstring = string.gsub(inputstring, ";", "")
    inputstring = string.gsub(inputstring, "%.", "")
    inputstring = string.gsub(inputstring, "/e ", "")
    inputstring = string.gsub(inputstring, "/w ", "")
    local args = string.split(inputstring, " ")
    args.Command = args[1]
    table.remove(args, 1)
    return args
end

local function IsInTable(table, tofind)
    local found = false
    for i,v in pairs(table) do
        if v == tofind then
            found = true
            break
        end
    end
    return found
end



local function CommandHandler(msg, speaker)
    local Args = getargs(msg) 

    if IsInTable({"light","small","short","medium","heavy","long","shells","scrap","lit","mre","soda","beans","water","cola","bottle"}, Args.Command) then
        if not Toggles.Dispenser and speaker ~= game.Players.LocalPlayer then
            return
        end
        local Amount = tonumber(Args[1])
        if Args.Command == "lit" then
            Args.Command = "light"
        end
        local IsFood = false
        if IsInTable({"mre","soda","beans","water"}, Args.Command) then
            IsFood = true
        end
        if Amount == nil and Args.Command == "scrap" then
            Amount = 500
        elseif Amount == nil and Args.Command ~= "scrap" then
            Amount = 1
        end
        if speaker == game.Players.LocalPlayer then
            if Args.Command ~= "scrap" then
                if not IsFood then
                    local AmmoName = string.upper(string.sub(Args.Command,1,1))..string.sub(Args.Command,2,-1)
                    if AmmoTable[AmmoName] ~= nil then
                        AmmoTable[AmmoName] = Amount
                    end
                else
                    local FoodName = string.gsub(Args.Command, "water", "Bottle")
                    FoodName = string.gsub(FoodName, "mre", "MRE")
                    FoodName = string.gsub(FoodName, "cola", "Soda")
                    FoodName = string.upper(string.sub(FoodName,1,1))..string.sub(FoodName,2,-1)
                    FoodTable[FoodName] = Amount
                end
                return
            else
                workspace.ServerStuff.dropAmmo:FireServer("scrap", Amount)
                return
            end
        elseif speaker ~= game.Players.LocalPlayer and Toggles.Dispenser and speaker.Character ~= nil and not Debounces.Dispensing and speaker.Character:FindFirstChild("HumanoidRootPart") then
            Debounces.Dispensing = true
            local ReturnTo = nil
            if Toggles.Dispenser and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                ReturnTo = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0,3,0)
            end
            if Args.Command ~= "scrap" then
                local AmmoName = string.upper(string.sub(Args.Command,1,1))..string.sub(Args.Command,2,-1)
                for i = 1,Amount do
                    workspace.ServerStuff.dropAmmo:FireServer(AmmoName, 100)
                end
            else
                workspace.ServerStuff.dropAmmo:FireServer("scrap", Amount)
            end
            if ReturnTo ~= nil then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ReturnTo
            end
            Debounces.Dispensing = false
        end
    end

    if not string.find(msg,"/e ") and not string.find(msg,"/w ") and not string.find(msg,":") then
        return
    end
    if speaker ~= game.Players.LocalPlayer then
        return
    end
--[[
    if IsInTable({"god","godmode","ungod","ungodmode"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        if game.PlaceId ~= 9880062154 then
            if Toggle then
                game.Players:Chat(":sgod")
            else
                game.Players:Chat(":unsgod")
            end
        end
        Toggles.Godmode = Toggle
        local currenttext = ""
        if Toggle == true then
            ApplyGod()
            currenttext = "God-Mode is now ON!"
        else
            ApplyGod(true)
            currenttext = "God-Mode is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end
--]]

    if IsInTable({"semigodmode","semigod","sgod","regen","instantregen","unsemigodmode","unsemigod","unsgod","unregen","uninstantregen","god","godmode","ungod","ungodmode"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.SemiGodmode = Toggle
        local currenttext = ""
        if Toggle == true then
            if Humanoid ~= nil and Humanoid:FindFirstAncestor("Workspace") then
                if Humanoid.Health < Humanoid.MaxHealth then
                    HealOnce()
                end
            end
            currenttext = "Semi-God is now ON!"
        else
            currenttext = "Semi-God is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"goodwill","dispenser","ammocommands","ammo","ungoodwill","undispenser","unammocommands","unammo"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.Dispenser = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "Dispenser is now ON!"
        else
            currenttext = "Dispenser is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"defectblock","disabilityblock","debuffsblock","nodebuffs","antidebuff","antidebuffs","nodebuff","noeffects","nobleed","undefectblock","undisabilityblock","undebuffsblock","unnodebuffs","unnodebuff","unantidebuff","unantidebuffs","unnobleed","unnoeffects"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.AntiDebuff = Toggle
        local currenttext = ""
        if Toggle == true then
            for i,v in pairs(EffectsTable) do
                if not string.find(i, "Virus") and v.effects ~= nil and v.effects.currentduration ~= nil and v.effects.colour ~= nil then
                    if v.effects.colour == Color3.new(1,0.05,0.05) or v.effects.colour == false or i == "Burning" or i == "Exhaustion" then
                        v.effects.currentduration = 0
                    end
                end
            end
            currenttext = "AntiDebuff is now ON!"
        else
            currenttext = "AntiDebuff is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"infrun","permrun","runforever","run","uninfrun","unpermrun","unrunforever","unrun"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.InfRun = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "InfRun is now ON!"
        else
            currenttext = "InfRun is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"nocooldown","removecooldown","nocool","instantcharge","nocool","cooldown","unnocooldown","unremovecooldown","unnocool","uninstantcharge","unnocool"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" or Args.Command == "cooldown" then
            Toggle = false
        end
        Toggles.NoCooldown = Toggle
        --[[
        local Connections = getconnections(workspace.ServerStuff.playerMatsHandler.OnClientEvent)
        local TargetTable = nil
        for i,v in pairs(getupvalues(Connections[1].Function)) do
            if typeof(v) == "table" and v[3] ~= nil and typeof(v[3]) == "table" and v[3]["cooldown"] ~= nil then
                TargetTable = v
            end
        end
        --]]
        local Stats = require(game:GetService("Workspace").ServerStuff.Statistics["CLASS_STATISTICS"])
        local TargetTable = Stats[game.Players.LocalPlayer.Character.current_perk.Value]
        if TargetTable == nil then
            return
        end
        local currenttext = ""
        if Toggle == true then
            currenttext = "NoCooldown is now ON!"
            for i,v in pairs(TargetTable) do
                if typeof(v) == "table" and v["cooldown"] ~= nil then
                    for x,y in pairs(v) do
                        if string.find(tostring(x),"cooldown") and string.sub(x,#x - 2,-1) ~= "old" then
                            if v[x.."old"] == nil then
                                v[x.."old"] = v[x]
                            end
                            if v["kiramaxdamage"] ~= nil then
                                if tostring(x) == "mincooldown" then
                                    v[x] = 0.1
                                elseif tostring(x) == "cooldown" then
                                    v[x] = 1
                                end
                            else
                                if v["inverse_cd"] == nil then
                                    v[x] = 0
                                else
                                    v[x] = math.huge
                                end
                            end
                        end
                        if x == "perk_mincd" or x == "vulka_ammo_usage" or string.find(tostring(x),"overheat") or x == "goggle_broken_cd" or x == "damage_taken_multi" then
                            if v[x.."old"] == nil and string.sub(x,#x - 2,-1) ~= "old" then
                                v[x.."old"] = v[x]
                            end
                            v[x] = 0
                        end
                    end
                end
            end
        else
            currenttext = "NoCooldown is now OFF!"
            for i,v in pairs(TargetTable) do
                if typeof(v) == "table" and v["cooldown"] ~= nil then
                    for x,y in pairs(v) do
                        if string.sub(x,#x - 2,-1) ~= "old" and v[x.."old"] ~= nil then
                            v[x] = v[x.."old"]
                        end
                    end
                end
            end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"cig","ciggy","cigarette","smoke"}, Args.Command) then
        local Cig = game.ReplicatedStorage.auxItems.buffermodel:Clone()
        Cig.CFrame = game.Workspace.CurrentCamera.CFrame
        Cig.Parent = game.Workspace.CurrentCamera
        local Motor = Instance.new("Motor6D")
        Motor.Part0 = Cig
        Motor.Part1 = game.Workspace.CurrentCamera:FindFirstChildOfClass("Part")
        Motor.C1 = CFrame.new(0, -0.8, -0.7) * CFrame.Angles(0, math.rad(90), 0)
        Motor.Parent = Cig
        game.Workspace.ServerStuff.quickDisplay:FireServer("add_buffer")
        repeat wait() until game.Players.LocalPlayer.Character ~= nil
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Head")
        repeat wait() until game.Players.LocalPlayer.Character.Head:FindFirstChild("buffer_head")
        game.Players.LocalPlayer.Character.Head:FindFirstChild("buffer_head"):Destroy()
        return
    end

    if IsInTable({"uncig","unciggy","uncigarette","unsmoke"}, Args.Command) then
        if game.Workspace.CurrentCamera:FindFirstChild("buffermodel") then
            game.Workspace.CurrentCamera.buffermodel:Destroy()
        end
        return
    end

    if IsInTable({"heal","fullheal","maxhealth","recover"}, Args.Command) then
        if Humanoid ~= nil and Humanoid:FindFirstAncestor("Workspace") then
            if Humanoid.Health < Humanoid.MaxHealth then
                --for i = 1,(Humanoid.MaxHealth - Humanoid.Health) do
                    spawn(HealOnce)
                --end
            end
        end
        if EffectsTable == nil then
            GrabEssentials()
        end
        for i,v in pairs(EffectsTable) do
            if not string.find(i, "Virus") and v.effects ~= nil and v.effects.currentduration ~= nil and v.effects.colour ~= nil then
                if v.effects.colour == Color3.new(1,0.05,0.05) or v.effects.colour == false or i == "Burning" or i == "Exhaustion" then
                    v.effects.currentduration = 0
                end
            end
        end
        return
    end

    if IsInTable({"cleareffects","clear","removedebuffs","fix","effects"}, Args.Command) then
        for i,v in pairs(EffectsTable) do
            if not string.find(i, "Virus") then
                EffectsTable[i].effects.currentduration = 0
            end
        end
        return
    end

    if IsInTable({"infection","stopinfection","haltinfection","virus","novirus","blockvirus","stopvirus","haltvirus","uninfection","stopinfection","virusblock","unhaltinfection","antivirus","unvirus","unnovirus","unstopvirus","unhaltvirus","unblockvirus","unvirusblock","unantivirus"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.VirusBlock = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "VirusBlock is now ON!"
        else
            currenttext = "VirusBlock is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"resetvirus","pill","pills","resetinfection","restartvirus","restartinfection","virusprogress","infectionprogress"}, Args.Command) then
        for i,v in pairs(EffectsTable) do
            if string.find(i, "Virus") then
                EffectsTable[i].effects.currentduration = tick()
            end
        end
        return
    end

    if IsInTable({"oneshot","instantkill","instakill","onetap","infdamage","unoneshot","uninstantkill","uninstakill","unonetap","uninfdamage"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.OneShot = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "OneShot is now ON!"
        else
            currenttext = "OneShot is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"silentaim","alwayshit","nevermiss","aimbot","unsilentaim","unalwayshit","unnevermiss","unaimbot"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.SilentAim = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "SilentAim is now ON!"
        else
            currenttext = "SilentAim is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"infammo","infiniteammo","infreserve","infinitereserve","uninfammo","uninfiniteammo","uninfreserve","uninfinitereserve"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.InfAmmo = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "InfAmmo is now ON!"
            if AmmoTable ~= nil then
                for i,v in pairs(AmmoTable) do
                    --if tonumber(AmmoTable[i]) == nil then
                        AmmoTable[i] = 900
                    --end
                end
            end
        else
            currenttext = "InfAmmo is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"infclip","infiniteclip","infmag","infinitemag","infshots","infiniteshots","infshoot","infiniteshoot","bottomlessmags","uninfclip","uninfiniteclip","uninfmag","uninfinitemag","uninfshots","uninfiniteshots","uninfshoot","uninfiniteshoot","unbottomlessmags"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.InfClip = Toggle
        local currenttext = ""
        if Toggle == true then
            local Pee = getsenv(GrabMainScript())
            local GetSex = getupvalues(Pee.unloadgun)
            for i,v in pairs(GetSex) do
                if typeof(v) == "table"  then
                    for x,y in pairs(v) do
                        if typeof(y) == "table" then
                            for n,m in pairs(y) do
                                if y[n] == tonumber(ClipLabel.Text) then
                                    if AkimboActive then
                                        y[n] = 20
                                    else
                                        y[n] = math.huge
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Pee = nil
            GetSex = nil
            currenttext = "InfMag is now ON!"
        else
            local Pee = getsenv(GrabMainScript())
            local GetSex = getupvalues(Pee.unloadgun)
            for i,v in pairs(GetSex) do
                if typeof(v) == "table"  then
                    for x,y in pairs(v) do
                        if typeof(y) == "table" then
                            for n,m in pairs(y) do
                                if tonumber(y[n]) ~= nil and tonumber(y[n]) > 1000 then
                                    y[n] = 10
                                end
                            end
                        end
                    end
                end
            end
            Pee = nil
            GetSex = nil
            currenttext = "InfMag is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end


    if IsInTable({"nocamerashake","antirecoil","anticamerashake","norecoil","noshake","antishake","unnocamerashake","unantirecoil","unanticamerashake","unnorecoil","unnoshake","unantishake"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.AntiRecoil = Toggle
        local currenttext = ""
        local TempEnv = getsenv(GrabMainScript())
        if Toggle == true then
            local Env = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
            for i,v in pairs(Env) do
                if v.weapontype == "Gun" then
                    if v["woundratingold"] == nil then
                        v["woundratingold"] = v.woundrating
                    end
                    v["woundrating"] = 0
                end
            end
            Env = nil
            currenttext = "AntiRecoil is now ON!"
        else
            local Env = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)
            for i,v in pairs(Env) do
                if v.weapontype == "Gun" then
                    if v["oldrecoil"] ~= nil then
                        v["woundrating"] = v["oldrecoil"]
                    end
                end
            end
            currenttext = "AntiRecoil is now OFF!"
        end
        TempEnv = nil
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"nofall","nofalldamage","antifalldamage","antifall","unnofall","unnofalldamage","unantifalldamage","unantifall","falldamage"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" or Args.Command == "falldamage" then
            Toggle = false
        end
        Toggles.AntiFallDamage = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "AntiFallDamage is now ON!"
        else
            currenttext = "AntiFallDamage is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"superrun","superspeed","fasterrun","speed","run","unsuperrun","unsuperspeed","unfasterrun","unspeed","unrun"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.SuperRun = Toggle
        local currenttext = ""
        if Toggle == true then
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "SuperRun is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            currenttext = "SuperRun is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"nohunger","nodrink","noeat","nothirst","permfill","unnohunger","unnodrink","unnoeat","unnothirst","unpermfill"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.NoHunger = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "NoHunger is now ON!"
            FoodTable.hunger = math.huge
            FoodTable.thirst = math.huge
        else
            currenttext = "NoHunger is now OFF!"
            FoodTable.hunger = tick()
            FoodTable.thirst = tick()
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"fill","eat","drink","satiate","fillhunger","fillstomach"}, Args.Command) then
        FoodTable.hunger = tick()
        FoodTable.thirst = tick()
        return
    end

    if IsInTable({"autoparry","antimelee","meleeblock","meleecuck","antihit","autoblock","unautoparry","unantimelee","unmeleeblock","unmeleecuck","unantihit","unautoblock"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.AutoParry = Toggle
        local currenttext = ""
        if Toggle == true then
            game.Workspace.ServerStuff.initiateblock:FireServer(_G.Code1, true)
            currenttext = "AutoParry is now ON!"
        else
            game.Workspace.ServerStuff.initiateblock:FireServer(_G.Code1, false)
            currenttext = "AutoParry is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"killaura","murderaura","proximitykill","closekill","killclose","unkillaura","unmurderaura","unproximitykill","unclosekill","unkillclose"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        local Amount = tonumber(Args[1]) or tonumber(Args[2])
        if Amount ~= nil then
            KillAuraDistance = Amount
            game.StarterGui:SetCore("SendNotification", {
                Title = "notification";
                Text = "KillAura distance is now "..tostring(Amount);
                Icon = "rbxassetid://2541869220";
                Duration = 3;
            })
            return
        end
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.KillAura = Toggle
        local currenttext = ""
        if Toggle == true then
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "KillAura is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            currenttext = "KillAura is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"grenaderain","naderain","rainnade","rainnades","nadesrain","raingrenades","raingrenade","grenadesrain","ungrenaderain","unnaderain","unrainnade","unrainnades","unnadesrain","unraingrenades","unraingrenade","ungrenadesrain"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        local Amount = tonumber(Args[1]) or tonumber(Args[2])
        if Amount ~= nil then
            GrenadeRainDamage = Amount
            game.StarterGui:SetCore("SendNotification", {
                Title = "notification";
                Text = "GrenadeRain distance is now "..tostring(Amount);
                Icon = "rbxassetid://2541869220";
                Duration = 3;
            })
            return
        end
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.GrenadeRain = Toggle
        local currenttext = ""
        if Toggle == true then
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "GrenadeRain is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            currenttext = "GrenadeRain is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"autokill","autokillenemies","automurder","moneyfarm","autoclearenemies","autothreatclear","autowin","unautokill","unautokillenemies","unautomurder","unmoneyfarm","unautoclearenemies","unautothreatclear","unautowin"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.AutoKill = Toggle
        local currenttext = ""
        if Toggle == true then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Torso") and v:FindFirstChild("Humanoid") then
                    if v.Parent.Name == "activeHostiles" or v.Parent.Name == "NoTarget" then
                        KnifeKill(v,true)
                    end
                end
            end
            currenttext = "AutoKill is now ON!"
        else
            currenttext = "AutoKill is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"killenemies","killall","removeenemies","killothers","enemykill","clearenemies","clearhazards","enemieskill","unkillenemies","unkillall","unremoveenemies","unkillothers","unenemykill","unclearenemies","unclearhazards","unenemieskill"}, Args.Command) then
        local Amount = tonumber(Args[1]) or math.huge
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Torso") and v:FindFirstChild("Humanoid") and game.Players.LocalPlayer:DistanceFromCharacter(v.Torso.Position) <= Amount then
                if v.Parent.Name == "activeHostiles" or v.Parent.Name == "NoTarget" then
                    KnifeKill(v,true)
                end
            end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = "Killed all enemies!";
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"equipbackpack","backpack","enablebackpack","expandinventory","addbackpack"}, Args.Command) then
        --game.Workspace.ServerStuff.dealDamage:FireServer("putbackpack", nil, _G.Code1, _G.Code2);
        game.Players.LocalPlayer.PlayerGui.mainHUD.InventoryFrame.slot6.Visible = true;
        game.Players.LocalPlayer.PlayerGui.mainHUD.InventoryFrame.slot5.Visible = true;
        local TempEnv = getsenv(GrabMainScript())
        local TempUpValues = getupvalues(TempEnv.start_dual_wield)
        local TempEnv = getsenv(GrabMainScript())
        local TempUpValues = getupvalues(TempEnv.start_dual_wield)
        local InvTable = nil
        for i,v in pairs(TempUpValues) do
            if typeof(v) == "table" and v[1] ~= nil and typeof(v[1]) == "table" and typeof(v[1][1]) == "string" and typeof(v[1][2]) == "boolean" then
                v[5] = { "Fist", false, nil }
                v[6] = { "Fist", false, nil }
            end
        end
        TempEnv = nil
        TempUpValues = nil
        return
    end

    if IsInTable({"spawn","give","giveitem","spawnitem","giveme","gunspawn","spawngun"}, Args.Command) then
        if Args[1] == nil then
            return
        end
        if Args[2] ~= nil then
            Args[1] = Args[1].." "..Args[2]
        end
        if Args[3] ~= nil then
            Args[1] = Args[1].." "..Args[3]
        end
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        local TempEnv = getsenv(GrabMainScript())
        local TempUpValues = getupvalues(TempEnv.start_dual_wield)
        local InvTable = nil
        for i,v in pairs(TempUpValues) do
            if typeof(v) == "table" and v[1] ~= nil and typeof(v[1]) == "table" and typeof(v[1][1]) == "string" and typeof(v[1][2]) == "boolean" then
                InvTable = v
                break
            end
        end
        for i,v in pairs(Weapons) do
            if string.sub(string.lower(i),1,#Args[1]) == string.lower(Args[1]) then
                local Type = WeaponStats[v].weapontype
                if Type == "Gun" or Type == "Item" or Type == "Bow" then
                    for x,y in pairs(InvTable) do
                        if x ~= 1 and y[1] == "Fist" then
                            if Type == "Gun" then
                                if v == "LSMini" then
                                    InvTable[x] = {v, false, math.huge}
                                else
                                    local MaxAmmo = 10
                                    if game.ReplicatedStorage.Weapons:FindFirstChild(v) and game.ReplicatedStorage.Weapons[v]:FindFirstChild("ammo") then
                                        MaxAmmo = game.ReplicatedStorage.Weapons[v].ammo.Value
                                    end
                                    InvTable[x] = {v, false, MaxAmmo}
                                end
                            else
                                InvTable[x] = {v, false, 1}
                            end
                            return
                        end
                    end
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "notification";
                        Text = "NO AVAILABLE SLOTS (DROP SOMETHING)";
                        Icon = "rbxassetid://2541869220";
                        Duration = 3;
                    })
                elseif Type ~= "Gun" and Type ~= "Item" and Type ~= "Bow" then
                    if InvTable[1][1] ~= "Fist" then
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "notification";
                            Text = "You need to drop your current melee weapon before spawning another one!";
                            Icon = "rbxassetid://2541869220";
                            Duration = 3;
                        })
                        return
                    end
                    InvTable[1] = {v, false, nil}
                    local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats[v].animset)
                    game.Workspace.ServerStuff.getTPWeapon:FireServer(v, AnimSet, "Fist")
                    local NewModel = game.Players.LocalPlayer.Character:WaitForChild(v,10)
                    if NewModel == nil then
                        return
                    end
                    game.Workspace.ServerStuff.getTPWeapon:FireServer(v, AnimSet, "Fist", NewModel, true)
                end
                break
            end
        end
        InvTable = nil
        TempEnv = nil
        TempUpValues = nil
        return
    end

    if IsInTable({"weaponnames","names","weapons","spawnitems","guns"}, Args.Command) then
        print("====== WEAPON NAMES ======")
        for i,v in pairs(Weapons) do
            print(i)
        end
        print("==========================")
        return
    end
--[[
    if IsInTable({"teamkill","enemy","nemesis","scavmode","enemymode"}, Args.Command) then
        local TempEnv = getsenv(GrabMainScript())
        local TempUpValues = getupvalues(TempEnv.start_dual_wield)
        local InvTable = nil
        for i,v in pairs(TempUpValues) do
            if typeof(v) == "table" and v[1] ~= nil and typeof(v[1]) == "table" and typeof(v[1][1]) == "string" and typeof(v[1][2]) == "boolean" then
                InvTable = v
                break
            end
        end
        local OldMelee = InvTable[1][1] -- this is gonna be SCUFFED
        InvTable[1] = { "PLBlade", false, nil}

        local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats["PLBlade"].animset)
        game.Workspace.ServerStuff.getTPWeapon:FireServer("PLBlade", AnimSet, "Fist")
        local NewModel = game.Players.LocalPlayer.Character:WaitForChild("PLBlade", 20)
        game.Workspace.ServerStuff.claimItem:InvokeServer(NewModel)
        game.Workspace.ServerStuff.getTPWeapon:FireServer("PLBlade", AnimSet, "Fist", NewModel, true)
        wait(0.3)
        keypress(0x31)
        keyrelease(0x31)
        wait(0.6)
        InvTable[1] = {"Fist", false, nil}
        wait()
        keypress(0x31)
        keyrelease(0x31)
        if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("hasPrimary") then
            game.Players.LocalPlayer.Character.hasPrimary:Destroy()
        end
        wait(0.1)
        if OldMelee ~= "Fist" then
            local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats[OldMelee].animset)
            game.Workspace.ServerStuff.getTPWeapon:FireServer(OldMelee, AnimSet, "Fist")
            local NewModel = game.Players.LocalPlayer.Character:WaitForChild("PLBlade", 20)
            game.Workspace.ServerStuff.claimItem:InvokeServer(NewModel)
            game.Workspace.ServerStuff.getTPWeapon:FireServer(OldMelee, AnimSet, "Fist", NewModel, true)
            wait(0.3)
            keypress(0x31)
            keyrelease(0x31)
        end
        InvTable = nil
        TempEnv = nil
        TempUpValues = nil
        return
    end
--]]
--[[
    if IsInTable({"airstrike","carpetbomb","bombrun","dronestrike"}, Args.Command) then
        local Data = {
        	["throwrating"] = 4,
        	["ability"] = "Impact triggered explosive.",
        	["animset"] = "THRW",
        	["woundrating"] = 2,
        	["weapontype"] = "Item",
        	["name"] = "Impact Grenade",
        	["damagerating"] = {
        		[1] = 0,
        		[2] = 0,
        		[3] = Args[1] or 150
        	},
        	["icon"] = "2331748192",
        	["sizerating"] = 4,
        	["desc"] = "Formerly created  by a man from somewhere in Russia, this little explosive device can go boom upon impacting something! No idea what Russia is though."
        }
        for x = -179,420 do
            if x%5 == 0 then
                for z = -205,196 do
                    if z%5 == 0 and _G.Code1 ~= nil and _G.Code2 ~= nil then
                        local Position1 = Vector3.new(x,150,z)
                        local Position2 = Vector3.new(x,-100,z)
                        TargetCFrame = CFrame.new(Position1,Position2)
                        game.Workspace.ServerStuff.throwWeapon:FireServer("ImpN", 0, TargetCFrame, 0.1960853934288, Data, nil, false, _G.Code1, nil, _G.Code2)
                    end
                end
            end
        end
    end
--]]
    if IsInTable({"infaux","auxinf","infauxiliary","aux","auxiliary","uninfaux","unauxinf","uninfauxiliary","unaux","unauxiliary"}, Args.Command) then
        local Toggle = true
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.InfAux = Toggle
        local currenttext = ""
        if Toggle == true then
            currenttext = "InfAux is now ON!"
        else
            local Env = getsenv(GrabMainScript())
            Env["aux_usage"] = 1
            currenttext = "InfAux is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"settrap","trapset","picktrap","setrap"}, Args.Command) then
        if Args[1] == nil then
            return
        end
        for i,v in pairs(Traps) do
            if string.sub(string.lower(i),1,#Args[1]) == string.lower(Args[1]) then
                CurrentTrap = v
                break
            end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = "Trap type set to "..string.lower(CurrentTrap);
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"setthrowable","throwableset","pickthrowable","sethrowable","setthrow","throwset","pickthrow","sethrow","setykey","ykey"}, Args.Command) then
        if Args[1] == nil then
            return
        end
        Toggles.ThrowingKnives = false
        local TrapTitle = ""
        for i,v in pairs(Throwables) do
            if string.sub(string.lower(i),1,#Args[1]) == string.lower(Args[1]) then
                CurrentThrowable = v
                TrapTitle = i
                break
            end
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = "Throwable type set to "..string.lower(TrapTitle);
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"setuse","setuses","uses","setammo","setmag","mag","arrows","arrow","ammo","clip","setclip"}, Args.Command) then
        if Args[1] == "inf" or Args[1] == "math.huge" then
            Args[1] = math.huge
        end
        if tonumber(Args[1]) == nil then 
            return
        end
        if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
            WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
        end
        local TempEnv = getsenv(GrabMainScript())
        local TempUpValues = getupvalues(TempEnv.start_dual_wield)
        local InvTable = nil
        for i,v in pairs(TempUpValues) do
            if typeof(v) == "table" and v[1] ~= nil and typeof(v[1]) == "table" and typeof(v[1][1]) == "string" and typeof(v[1][2]) == "boolean" then
                InvTable = v
                break
            end
        end
        for i,v in pairs(InvTable) do
            if v[3] == tonumber(ClipLabel.Text) then
                v[3] = tonumber(Args[1])
            end
        end
        TempEnv = nil
        TempUpValues = nil
        ClipLabel.Text = Args[1]
        return
    end


    if IsInTable({"loopdrop","loopspawn","droploop","keepdropping","spawnloop","rapiddrop","rapidspawn","unloopdrop","unloopspawn","undroploop","unkeepdropping","unspawnloop","unrapiddrop","unrapidspawn"}, Args.Command) then
        local Toggle = true -- last second to default to true, rather than a toggle
        if Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.LoopDrop = Toggle
        local currenttext = ""
        if Toggle == true then
            if Args[1] == nil then
                return
            end
            if Args[2] ~= nil then
                Args[1] = Args[1].." "..Args[2]
            end
            if Args[3] ~= nil then
                Args[1] = Args[1].." "..Args[3]
            end
            local FoundToDrop = false
            for i,v in pairs(Weapons) do
                if string.sub(string.lower(i),1,#Args[1]) == string.lower(Args[1]) then
                    ToLoopDrop = v
                    FoundToDrop = true
                    break
                end
            end
            if FoundToDrop == false then
                return
            end
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "LoopDrop is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            ToLoopDrop = ""
            currenttext = "LoopDrop is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end

    if IsInTable({"antivotekick","antivk","novk","vkblock","votekickblock","blockvotekick","novotekick","blockvk","unantivotekick","unantivk","unnovk","unvkblock","unvotekickblock","unblockvotekick","unnovotekick","unblockvk"}, Args.Command) then
        local Toggle = true
        if Args[1] == "true" or Args[1] == "on" then
            Toggle = true
        elseif Args[1] == "false" or Args[1] == "off" or string.sub(Args.Command, 1,2) == "un" then
            Toggle = false
        end
        Toggles.AntiVoteKick = Toggle
        local currenttext = ""
        if Toggle == true then
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "AntiVoteKick is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            currenttext = "AntiVoteKick is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end


end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    CommandHandler(msg, game.Players.LocalPlayer)
end)
for i,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        v.Chatted:Connect(function(msg)
            CommandHandler(msg, v)
        end)
    end
end
game.Players.PlayerAdded:Connect(function(v)
    v.Chatted:Connect(function(msg)
        CommandHandler(msg, v)
    end)
end)

mouse.KeyDown:Connect(function(key)
    if key == "0" then
        SuperRun.ShiftHeld = true
        return
    end
    if key == "w" then
        SuperRun.WHeld = true
        return
    end
    if key == "s" then
        SuperRun.SHeld = true
        return
    end
    if key == "a" then
        SuperRun.AHeld = true
        return
    end
    if key == "d" then
        SuperRun.DHeld = true
        return
    end
    if key == "l" then
        Toggles.SuperRun = not Toggles.SuperRun
        local currenttext = ""
        if Toggles.SuperRun == true then
            if RenderStepConnection == nil then
                RenderStepConnection = game:GetService("RunService").Stepped:Connect(RenderStepped)
            end
            currenttext = "SuperRun is now ON!"
        else
            local LoopOff = false
            for i = 1,#LoopedFeatures do
                if Toggles[LoopedFeatures[i]] == true then
                    LoopOff = true
                    break
                end
            end
            if RenderStepConnection ~= nil and LoopOff then
                RenderStepConnection:Disconnect()
                RenderStepConnection = nil
            end
            currenttext = "SuperRun is now OFF!"
        end
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = currenttext;
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end
    if key == "-" then        
        SuperRun.RunSpeed = SuperRun.RunSpeed - 0.1
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = "Your Super-Run speed is now "..tostring(SuperRun.RunSpeed).."!";
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end
    if key == "=" then        
        SuperRun.RunSpeed = SuperRun.RunSpeed + 0.1
        game.StarterGui:SetCore("SendNotification", {
            Title = "notification";
            Text = "Your Super-Run speed is now "..tostring(SuperRun.RunSpeed).."!";
            Icon = "rbxassetid://2541869220";
            Duration = 3;
        })
        return
    end
    if key == "y" and _G.Code1 ~= nil and _G.Code2 ~= nil then
        if CurrentThrowable == "TKnife" then
            Toggles.ThrowingKnives = true
            repeat
                if WeaponStats == nil and game.Workspace:FindFirstChild("ServerStuff") and game.Workspace.ServerStuff:FindFirstChild("Statistics") and game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS") then
                    WeaponStats = require(game.Workspace.ServerStuff.Statistics["W_STATISTICS"])
                end
                local Data = WeaponStats["TKnife"]
                local CameraCFrame = game.Workspace.CurrentCamera.CFrame
                local Position = CFrame.new(CameraCFrame.p + Vector3.new(math.random(-12,12),math.random(-3,12),5),mouse.Hit.p)
                spawn(function()
                    workspace.ServerStuff.throwWeapon:FireServer("TKnife", 1000, Position, 0.19341856241226196, Data, 0, false, _G.Code1, nil, _G.Code2)
                end)
                wait(0.0000000000000000001)
            until Toggles.ThrowingKnives == false
        else
            if Debounces.Throwing then
                return
            end
            Debounces.Throwing = true
            local AnimSet = game.ReplicatedStorage.animationSets.TPanimSets.global
            repeat game.Workspace.ServerStuff.getTPWeapon:FireServer(CurrentThrowable, AnimSet, "Fist", nil, false) wait() until game.Players.LocalPlayer.Character:WaitForChild(CurrentThrowable,5)
            local Data = WeaponStats[CurrentThrowable]
            if game.Players.LocalPlayer.Character:FindFirstChild(CurrentThrowable) and Data ~= nil then
                workspace.ServerStuff.throwWeapon:FireServer(CurrentThrowable, 0, game.Workspace.CurrentCamera.CFrame, 0.19530236721038818, Data, 1, false, _G.Code1, nil, _G.Code2)
            end
            Debounces.Throwing = false
        end
        return
    end
--[[
    if key == "j" and _G.Code1 ~= nil and _G.Code2 ~= nil then
        local Data = {
        	["throwrating"] = 0,
        	["ability"] = "Impact triggered explosive.",
        	["animset"] = "THRW",
        	["woundrating"] = 0,
        	["weapontype"] = "Item",
        	["name"] = "Impact Grenade",
        	["damagerating"] = {
        		[1] = 0,
        		[2] = 0,
        		[3] = -math.huge
        	},
        	["icon"] = "2331748192",
        	["sizerating"] = 0,
        	["desc"] = "Formerly created  by a man from somewhere in Russia, this little explosive device can go boom upon impacting something! No idea what Russia is though."
        }
        game.Workspace.ServerStuff.throwWeapon:FireServer("ImpN", 0, game.Workspace.CurrentCamera.CFrame, 0.1960853934288, Data, nil, false, _G.Code1, nil, _G.Code2)
        return
    end
--]]
    if key == "c" and Toggles.InfAux then
        local Env = getsenv(GrabMainScript())
        if Env["aux_usage"] ~= nil and Env["aux_usage"] <= 0 then
            if Env["use_aux"] ~= nil then
                Env["aux_usage"] = math.huge
                wait()
                Env["use_aux"]()
            end
        end
        Env = nil
        return
    end
    if key == "u" and _G.Code1 ~= nil and _G.Code2 ~= nil and Debounces.Trap == false then
        Debounces.Trap = true
        if not game.Players.LocalPlayer.Character:FindFirstChild(CurrentTrap) then
            local TrapItemName = TrapToItemName[CurrentTrap]
            local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets.global
            game.Workspace.ServerStuff.getTPWeapon:FireServer(TrapItemName, AnimSet, "Fist", nil, false)
            repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild(TrapItemName)
        end
        game.Workspace.ServerStuff.deployTrap:FireServer(CurrentTrap, _G.Code1, _G.Code2)
        wait(0.8)
        Debounces.Trap = false
        return
    end
    if key == "n" then
        if Humanoid ~= nil and Humanoid:FindFirstAncestor("Workspace") then
            if Humanoid.Health < Humanoid.MaxHealth then
                --for i = 1,(Humanoid.MaxHealth - Humanoid.Health) do
                    spawn(HealOnce)
                --end
            end
        end
        if EffectsTable == nil then
            GrabEssentials()
        end
        for i,v in pairs(EffectsTable) do
            if not string.find(i, "Virus") and v["effects"] ~= nil and typeof(v.effects) == "table" and v.effects["currentduration"] ~= nil and typeof(v.effects) ~= "Color3" and v.effects.colour ~= nil then
                if v.effects.colour == Color3.new(1,0.05,0.05) or v.effects.colour == false or i == "Burning" or i == "Exhaustion" then
                    v.effects.currentduration = 0
                end
            end
        end
        return
    end
    if key == "m" then
        if EffectsTable == nil then
            GrabEssentials()
        end
        for i,v in pairs(EffectsTable) do
            if not string.find(i, "Virus") and v["effects"] ~= nil and typeof(v.effects) == "table" and v.effects["currentduration"] ~= nil and typeof(v.effects) ~= "Color3" and v.effects.colour ~= nil then
                if v.effects.colour == false or i == "Burning" or i == "Exhaustion" or v.effects.colour == Color3.new(1,0.05,0.05) then
                    v.effects.currentduration = 0
                end
            end
        end
        return
    end
end)


mouse.KeyUp:Connect(function(key)
    if key == "0" then
        SuperRun.ShiftHeld = false
        return
    end
    if key == "w" then
        SuperRun.WHeld = false
        return
    end
    if key == "s" then
        SuperRun.SHeld = false
        return
    end
    if key == "a" then
        SuperRun.AHeld = false
        return
    end
    if key == "d" then
        SuperRun.DHeld = false
        return
    end
    if key == "y" and _G.Code1 ~= nil and _G.Code2 ~= nil then
        Toggles.ThrowingKnives = false
    end
end)


repeat wait() until game.Players.LocalPlayer.Character ~= nil
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Head")

Humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

Humanoid.HealthChanged:Connect(HealthChanged)
game.Players.LocalPlayer.Character.Head.ChildAdded:Connect(RemoveMark)

repeat wait() until game.Workspace:FindFirstChild("activePlayers")

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    _G.Code1 = nil
    _G.Code2 = nil
    repeat wait() until character:FindFirstChild("Humanoid")
    Humanoid = character:FindFirstChild("Humanoid")
    repeat wait() until character:FindFirstChild("Head")
    character.Head.ChildAdded:Connect(RemoveMark)
    for i,v in pairs(character.Head:GetChildren()) do
        RemoveMark(v)
    end
    Humanoid.HealthChanged:Connect(HealthChanged)
    repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    repeat wait() until game.Players.LocalPlayer:FindFirstChild("Backpack")
    repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD")
    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("LocalScript")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")
    local FunnyPlace = getrenv()._G
    GrabEssentials()
    if game.PlaceId ~= 9880062154 and not game.Workspace:FindFirstChild("HoldoutDecor") then
        repeat 
            local Continue = false
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD") and game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame") and game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses") then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses:GetChildren()) do
                    if string.find(v.Name, "Virus") then
                        VirusFrame = v
                        repeat wait() until v:FindFirstChild("EmptyBar")
                        repeat wait() until v.EmptyBar:FindFirstChild("Bar")
                        v.EmptyBar.Bar.Changed:Connect(VirusChanged)
                        Continue = true
                    end
                end
            end
            wait() 
        until Continue
    end
    game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses.ChildAdded:Connect(StatusAdded)
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("LowerHudFrame")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("main")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("reserve")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.main:FindFirstChild("label")
    repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.reserve:FindFirstChild("label")
    ClipLabel = game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.main.label
    ReserveLabel = game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.reserve.label
    ClipLabel.Changed:Connect(ClipChanged)
    ReserveLabel.Changed:Connect(ReserveChanged)
    SetupGUI()
    if Toggles.AutoParry then
        repeat wait() until _G.Code1 ~= nil
        game.Workspace.ServerStuff.initiateblock:FireServer(_G.Code1, true)
    end
end)

repeat wait() until game.Players.LocalPlayer:FindFirstChild("Backpack")
repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("LocalScript")

if game.Players.LocalPlayer.Character ~= nil then
    GrabEssentials()
end

repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses")

if game.PlaceId ~= 9880062154 and not game.Workspace:FindFirstChild("HoldoutDecor") then
    repeat 
        local Continue = false
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("mainHUD") and game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("HealthFrame") and game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame:FindFirstChild("Statuses") then
            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses:GetChildren()) do
                if string.find(v.Name, "Virus") then
                    VirusFrame = v
                    repeat wait() until v:FindFirstChild("EmptyBar")
                    repeat wait() until v.EmptyBar:FindFirstChild("Bar")
                    v.EmptyBar.Bar.Changed:Connect(VirusChanged)
                    Continue = true
                end
            end
        end
        wait() 
    until Continue
end

game.Players.LocalPlayer.PlayerGui.mainHUD.HealthFrame.Statuses.ChildAdded:Connect(StatusAdded)

repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD:FindFirstChild("LowerHudFrame")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("main")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame:FindFirstChild("reserve")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.main:FindFirstChild("label")
repeat wait() until game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.reserve:FindFirstChild("label")
ClipLabel = game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.main.label
ReserveLabel = game.Players.LocalPlayer.PlayerGui.mainHUD.LowerHudFrame.reserve.label

ClipLabel.Changed:Connect(ClipChanged)
ReserveLabel.Changed:Connect(ReserveChanged)

repeat wait() until game.Workspace:FindFirstChild("ServerStuff")
repeat wait() until game.Workspace.ServerStuff:FindFirstChild("Statistics")
repeat wait() until game.Workspace.ServerStuff.Statistics:FindFirstChild("W_STATISTICS")
WeaponStats = require(game.Workspace.ServerStuff.Statistics.W_STATISTICS)

repeat wait() until game.Workspace:FindFirstChild("Interactables")

--[[
game.Workspace.Interactables.ChildAdded:Connect(function(v)
    if Toggles.GrabAmmo and _G.Code1 ~= nil and string.find(v.Name, "Ammo") then
        game:GetService("ReplicatedStorage").Interactables.interaction:FireServer(v, "getAmmo", _G.Code1)
    end
end)
--]]
for i,v in pairs(game.Workspace:GetDescendants()) do
    --spawn(function() 
        if v ~= nil and v.Parent ~= nil then
            EspHandle(v)
        end
    --end)
    if v.Parent ~= nil and v.Parent.Name == "activeHostiles" or v.Parent ~= nil and v.Parent.Name == "NoTarget" then
        if v:IsA("Model") then
            table.insert(Enemies, v)
        end
    end
end

game.Workspace.DescendantAdded:Connect(function(v)
    EspHandle(v)
    if v:IsA("Model") and v:FindFirstAncestor(game.Players.LocalPlayer.Name) then
        if string.find(v.Name, "AKIMBO") then
            AkimboActive = true
            v.AncestryChanged:Connect(AkimboChanged)
            local Pee = getsenv(GrabMainScript())
            local GetSex = getupvalues(Pee.unloadgun)
            for i,v in pairs(GetSex) do
                if typeof(v) == "table"  then
                    for x,y in pairs(v) do
                        if typeof(y) == "table" then
                            for n,m in pairs(y) do
                                if y[n] == tonumber(ClipLabel.Text) then
                                    y[n] = 20
                                end
                            end
                        end
                    end
                end
            end
        else
            workspace.ServerStuff.claimItem:InvokeServer(v)
            wait(0.6)
            if v.Name == "LSMini" and CurrentWeapon ~= "LSMini" then
                local AnimSet = game:GetService("ReplicatedStorage").animationSets.TPanimSets:FindFirstChild(WeaponStats["LSMini"].animset)
                game.Workspace.ServerStuff.getTPWeapon:FireServer("LSMini", AnimSet, CurrentWeapon)
            end
        end
    elseif v:IsA("Model") and v:FindFirstAncestor("FPArms") and v.Name ~= "LeftArm" and v.Name ~= "RightArm" then
        ShownWeapon = v.Name
    end
end)

game.Players.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        local NpcValue = child:WaitForChild("npc")
        if NpcValue.Value == nil then
            NpcValue.Changed:Wait()
        end
        local Model = NpcValue.Value
        if Model:IsA("Model") then
            if Toggles.AutoKill then
                local Torso = Model:WaitForChild("Torso",20)
                local Torso = Model:WaitForChild("Humanoid",20)
                KnifeKill(Model,true)
                return
            end
            table.insert(Enemies, Model)
        end
    end
end)
print("so what the fuck")
repeat wait() until _G.Code1 ~= nil and _G.Code2 ~= nil
print("so what the fuck 2")
if _G.Code1 ~= nil and _G.Code2 ~= nil then
    game.StarterGui:SetCore("SendNotification", {
        Title = 'GOODWILL';
        Text = "SUCCESSFULLY INJECTED, F9 FOR CMDS                    (MADE BY AIDEZ)";
        Icon = "rbxassetid://2541869220";
        Duration = 7;
    })
print([[

COMMANDS CAN BE DONE AS /e command OR :command

:god - Regens you when you take damage. (Won't save you from dynamite)
:ungod -- Turns off semi godmode

:nodebuff - Blocks all status effects. Moral, burning, bleeding, broken limbs, etc
:unnodebuff - Turns off no-debuff

:nocooldown - Removes all ability cooldowns (F key, assuming you have a perk equipped) (Also gives you inf auxiliary, which is the C key)
:cooldown - Sets your cooldowns back to normal

:AMMOTYPE NUMBER - sets your stash of AMMOTYPE to NUMBER (:light 50) (shells 20)
:FOODTYPE NUMBER - sets your stash of FOODTYPE to NUMBER (:mre 20) (:water 5) (:beans 60) (:cola 200)

:heal - Heals you, and removes status effects.
:cleareffects - Clears all status effects and debuffs

:stopvirus - halts your virus progression
:resetvirus - resets your current virus progression (will not revert stages)

:oneshot - enemies you hit will die after one hit
:unoneshot - turns off oneshot

:silentaim - makes it so you always hit the enemy closest to your mouse
:unsilentaim - turns off silent aim

:infmag - makes your mags bottomless
:uninfmag - makes the weapon you're currently holding no longer have a bottomless mag
:infreserve - sets all your ammo reserves to 900, and keeps them there. !!!!!!DO NOT GO OVER 1K!!!!!!
:uninfreserve - disables infinite reserve ammo, your ammo reserves will stay at 900 though

:norecoil - stops your camera from shaking
:unnorecoil - turns off no recoil

:nofalldamage - counters fall damage
:unnofalldamage - uncounters fall damage

:superrun - enables super run
:unsuperrun - disables super run

:nohunger - makes your hunger and thirst bar last indefinitely
:unnohunger - removes no hunger
:fill - fills your hunger and thirst bar

:autoparry - automatically counters all incoming melee attacks
:unautoparry - turns off autoparry

:killaura - turns killaura on (kills all enemies within a certain distance)
:killaura NUMBER - sets the kill radius for killaura to NUMBER (default is 30)
:unkillaura - turns off killaura

:killenemies - kills every enemy that's currently alive
:killenemies NUMBER - kills every enemies within NUMBER studs of you

:backpack - Gives you a backpack (gives you 2 more inventory slots)

:spawn WEAPONNAME - gives you WEAPONNAME (cannot be dropped) (guns require an empty slot)
:weaponnames - prints all the available weapon names in the dev console

:loopdrop ITEMNAME - rapidly drops ITEMNAME
:unloopdrop ITEMNAME

:infaux - Gives you infinite auxiliary equipment (Activated with C Key)
:uninfaux - Turns off infaux

:settrap TRAPNAME - sets the trap that gets placed when you press the U key

:setthrow THROWABLENAME - sets the throwable that's thrown when you press the Y key

:uses NUMBER - sets the uses / magazine of your current item to NUMBER

:cig - makes you super cool
:uncig - frees you of your nicotine addiction

N Key: Heal and remove effects
M Key: Remove effects
U Key: Place set trap (use :settrap TRAPNAME to change the trap set with this key)
Y Key: Hold to spam throw throwing knives, which one shot enemies
T Key: Access game & Goodwill GUI

L Key: Toggle super run
- Key: Lower super run speed
+ Key: Increase super run speed


!! HOLD T TO ACCESS THE GUI (FEATURES IN THE GOODWILL, ESP, AND WEAPONRY TABS) !!

- Toggle features in the GOODWILL tab
- Toggle ESP elements in the ESP tab
- Customize your held weapon's stats in the WEAPONRY tab

]])
else
    game.StarterGui:SetCore("SendNotification", {
        Title = 'FAILED';
        Text = "SOMETHING WENT FUCKO (FAILED TO GRAB REMOTE SECURITY CODES)";
        Icon = "rbxassetid://16201263";
        Duration = 7;
    })
end

SetupGUI()