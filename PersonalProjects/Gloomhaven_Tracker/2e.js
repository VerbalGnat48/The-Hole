//////////////////////////////
// Characters
//
//Name, Level, Health, Color 01, Color 02
//Pics start at 32,34 and box is 190,240
const characters = [
	["Bruiser",			1, [10,12,14,16,18,20,22,24,26],	"#6896c8", "#03233c"],
	["Cragheart",		1, [10,12,14,16,18,20,22,24,26],	"#cace70", "#313713"],
	["Mindthief",		1, [6,7,8,9,10,11,12,13,14],		"#8891b0", "#2e292f"],
	["SilentKnife",		1, [8,9,11,12,14,15,17,18,20],		"#90c654", "#1d2e1b"],
	["Spellweaver",		1, [6,7,8,9,10,11,12,13,14],		"#a279b5", "#381b47"],
	["Tinkerer",		1, [8,9,11,12,14,15,17,18,20],		"#cbb699", "#291f1d"],

	["Berserker",		1, [10,12,14,16,18,20,22,24,26],	"#a3301e", "#3a2720"],
	["Bladeswarm",		1, [8,9,11,12,14,15,17,18,20],		"#bc8045", "#593215"],
	["Doomstalker", 	1, [8,9,11,12,14,15,17,18,20],		"#008eae", "#00374b"],
	["Elementalist",	1, [6,7,8,9,10,11,12,13,14],		"#497e8e", "#1a272d"],
	["Nightshroud",		1, [8,9,11,12,14,15,17,18,20],		"#3f4d67", "#222433"],
	["Plagueherald",	1, [6,7,8,9,10,11,12,13,14],		"#206463", "#242336"],

	["Quartermaster",	1, [10,12,14,16,18,20,22,24,26],	"#8f481a", "#292019"],
	["Sawbones",		1, [8,9,11,12,14,15,17,18,20],		"#a9aaac", "#492115"],
	["Sunkeeper",		1, [10,12,14,16,18,20,22,24,26],	"#b7892b", "#621505"],
	["Soothsinger",		1, [6,7,8,9,10,11,12,13,14],		"#945077", "#520529"],
	["Soultether",		1, [6,7,8,9,10,11,12,13,14],		"#784882", "#541f2f"],
	["Wildfury",		1, [6,7,8,9,10,11,12,13,14],		"#7f3c29", "#1a1f23", [10,12,14,16,18,20,22,24,26] ],
];

//////////////////////////////
// Enemies
//
const normal_enemies = [
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8, Curse = 9
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
	["AncientArtillery",		[4,6,8,9,12,15,18,21],		[0,0,0,0,0,0,0,0], 	[2,2,2,3,3,3,4,5], 	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0], 	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditArcher",			[4,5,6,6,8,9,9,12],			[2,3,3,3,3,4,4,4],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],	
	["BanditScout",				[5,6,7,10,11,11,16,19],		[2,3,3,3,4,4,4,4],	[2,2,3,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["BlackImp",				[3,3,4,4,5,7,9,13], 		[1,1,1,1,1,1,1,1],	[2,2,3,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["CaveBear",				[7,9,11,13,15,17,21,27],	[3,3,4,4,4,5,5,5],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["ChaosDemon",				[7,8,11,12,14,16,20,25],	[3,3,3,3,4,4,4,4],	[2,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[6,6,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["CrystalRot",				[5,6,7,10,11,13,18,21],		[2,2,3,3,3,3,3,3],	[1,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CityArcher",				[4,4,6,6,8,8,10,11],		[1,1,1,2,2,2,2,2],	[2,2,3,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,1,1,1,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CityGuard",				[5,5,7,8,9,10,13,17],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Cultist",					[4,6,7,8,9,11,16,18],		[2,2,3,3,3,3,3,3],	[1,1,1,2,2,2,2,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,9,9,9,9],	[0,0,0,0,0,0,0,0] ],
	["DeepTerror",				[3,4,4,5,7,7,9,9],			[0,0,0,0,0,0,0,0],	[2,2,3,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,81,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["EarthDemon",				[7,9,12,13,15,17,21,25],	[1,1,1,2,2,2,3,3],	[3,3,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,3,3,3],	[0,0,0,0,0,0,0,0] ],
	["FlameDemon",				[2,2,3,3,3,4,4,6],			[3,3,3,3,4,4,4,4],	[2,2,3,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[2,3,3,3,3,4,4,4],	[0,0,0,0,82,83,83,84,85],[0,0,0,0,0,0,0,0] ],
	["ForestImp",				[1,2,2,3,3,4,5,8],			[3,3,3,4,4,4,4,4],	[1,1,2,2,2,2,3,3],	[0,0,0,0,0,0,0,0],	[1,1,1,1,2,2,2,2],	[0,0,0,0,0,9,9,9],	[0,0,0,0,0,0,0,0] ],
	["FrostDemon",				[5,6,7,8,11,13,18,25],		[2,2,3,3,3,3,3,3],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,82,82,82,83,83,83],[0,0,0,0,0,0,0,0] ],
	["GiantViper",				[2,3,4,4,6,7,9,12],			[2,2,3,3,3,3,4,4],	[1,1,1,2,2,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["HarrowerInfester",		[6,7,8,10,12,12,15,18],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,82,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["Hound",					[4,4,6,8,9,10,14,17],		[3,4,4,4,4,4,5,5],	[2,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,81,81,81,82,82,82],[0,0,0,0,0,0,0,0] ],
	["InoxArcher",				[5,6,8,8,10,14,16,23],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["InoxGuard",				[7,8,12,13,16,20,28,32],	[2,3,3,3,4,4,4,4],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,81,81,81,81,81,82],[0,0,0,0,0,0,0,0] ],
	["InoxPriest",				[5,7,8,11,12,15,20,25],		[1,1,2,2,2,2,3,3],	[2,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingBones",				[5,5,5,7,7,9,12,15],		[2,3,3,3,3,3,4,4],	[1,1,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingCorpse",			[5,8,10,11,12,14,18,26],	[1,1,1,1,2,2,2,2],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["LivingSpirit",			[2,2,2,3,3,4,6,7],			[2,2,2,3,3,3,3,4],	[2,2,3,3,3,3,4,5],	[0,0,0,0,0,0,0,0],	[1,2,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LurkerSoldier",			[5,7,9,10,10,11,16,20],		[2,2,3,3,3,3,4,4],	[2,2,2,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,1,1,1,1],	[0,71,71,71,72,72,72,72],[0,0,0,0,0,0,0,0] ],
	["NightDemon",				[3,5,6,7,8,11,16,20],		[3,3,3,4,4,4,4,4],	[3,3,4,4,5,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Ooze",					[4,5,7,8,9,10,13,17],		[1,1,1,1,2,2,2,2],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["RendingDrake",			[5,6,7,7,9,10,14,18],		[3,3,4,4,4,4,5,5],	[3,3,3,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["SavvasIcestorm",			[7,10,12,12,13,15,16,20],	[2,2,3,3,3,3,4,4],	[2,2,2,2,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,1,1,1,2,2],	[73,73,73,73,73,73,73,73],[0,0,0,0,0,0,0,0] ],
	["SavvasLavaflow",			[8,9,11,14,16,20,28,35],	[3,3,3,3,3,3,4,4],	[2,2,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["SpittingDrake",			[4,5,7,8,9,12,16,22],		[3,3,3,3,4,4,4,4],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,6,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["StoneConstruct",			[10,10,11,11,12,13,19,22],	[1,1,1,1,2,2,2,2],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,1,1,2,2,2,2,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["SunDemon",				[5,8,10,11,13,13,16,19],	[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,5],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingScout",			[2,3,3,4,5,7,10,15],		[3,3,3,3,3,3,4,4],	[1,1,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingPriest",			[2,2,3,3,3,4,5,8],			[2,2,2,2,3,3,3,3],	[1,1,1,2,2,3,4,4],	[0,0,0,0,0,0,0,0],	[2,3,3,3,3,3,3,3],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["WindDemon",				[3,3,4,5,7,10,11,14],		[3,3,4,4,4,4,4,4],	[2,2,2,3,3,3,3,4],	[0,0,0,0,0,0,0,0],	[1,2,2,2,2,2,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],

	["BanditCommanderBoss",		[13,17,19,21,25,28,33,40],	[3,3,4,4,4,5,5,6],	[3,3,3,4,4,4,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CandleKeeperTriceBossC",	[18,20,24,25,29,31,37,44],	[3,3,3,4,4,4,5,5],	[1,1,2,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FirstShieldHarmonBossC",	[10,12,14,16,20,23,28,34],	[2,2,2,2,2,2,2,2],	[2,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["InoxBodyguardBossC",		[9,10,12,13,16,17,21,24],	[2,2,3,3,3,3,4,4],	[0,1,1,2,2,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[83,83,83,84,84,85,85,86],[0,0,0,0,0,0,0,0] ],
	["JekserahBossC",			[11,15,17,19,23,26,32,41],	[3,3,3,4,4,4,4,4],	[1,2,2,3,3,4,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["MercilessTaskmasterBoss",	[21,25,28,31,34,36,43,49],	[2,2,3,3,4,4,4,4],	[2,3,3,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheBetrayerBossC",		[22,26,29,34,37,42,46,53],	[3,3,3,3,3,3,3,3],	[1,1,2,2,3,3,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheColorlessBossC",		[12,15,16,19,20,23,27,32],	[2,2,2,3,3,3,4,4],	[1,1,2,2,3,3,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheDarkRiderBossC",		[16,20,23,29,30,36,45,52],	[3,4,4,4,5,5,5,6],	[1,1,2,2,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheElderDrakeBoss",		[26,31,37,41,47,52,62,75],	[0,0,0,0,0,0,0,0],	[1,2,2,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheGloomBossC",			[21,27,33,37,43,84,58,70],	[10,10,10,10,10,10,10,10],[2,3,3,4,4,5,6,7],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["ThePrimeDemonBoss",		[17,22,25,31,35,41,50,60],	[3,4,4,4,4,5,5,5],	[4,4,5,5,6,6,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheSightlessEyeBoss",		[21,23,28,30,35,38,47,54],	[0,0,0,0,0,0,0,0],	[5,6,6,7,7,8,8,9],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheWingedHorrorBoss",		[19,22,24,27,30,32,38,44],	[3,4,4,4,5,5,6,6],	[3,3,4,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
//	["",	[],	[],	[],	[],	[],	[],	[] ],
];

const elite_enemies = [
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8, Curse = 9
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
	["AncientArtillery",		[7,9,12,14,16,21,26,34], 	[0,0,0,0,0,0,0,0],	[3,3,3,4,5,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditArcher",			[6,7,9,10,10,12,13,17], 	[2,3,3,3,3,4,4,4],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["BanditScout",				[7,8,9,12,14,15,18,22],		[2,3,3,3,4,4,4,4],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,2,2],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["BlackImp",				[3,5,7,7,7,9,12,18], 		[1,1,1,1,1,1,1,1],	[2,2,2,2,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[2,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["CaveBear",				[11,14,17,20,21,24,29,37],	[3,3,4,4,5,5,5,5],	[4,4,4,5,5,6,7,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["ChaosDemon",				[10,12,14,18,21,26,33,39],	[4,4,4,5,5,5,5,6],	[3,4,5,5,6,6,8,9],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[6,6,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["CrystalRot",				[8,9,11,16,18,21,29,33], 	[2,2,3,3,3,3,3,3],	[2,3,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CityArcher",				[6,6,7,8,10,11,14,16],		[1,1,1,2,2,2,2,2],	[3,3,4,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,1,1,2,2,2,3,3],	[0,71,72,72,72,73,73,73],[0,0,0,0,0,0,0,0] ],
	["CityGuard",				[6,6,9,9,10,13,15,20],		[2,2,2,2,3,3,3,3],	[3,3,3,4,4,4,4,5],	[0,0,0,0,0,0,0,0],	[1,2,2,2,2,2,3,3],	[0,0,0,81,82,82,83,83],[0,0,0,0,0,0,0,0] ],
	["Cultist",					[7,9,11,15,16,20,26,30],	[2,2,3,3,3,3,3,3],	[2,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,9,9,9,9,9,9,9],	[0,0,0,0,0,0,0,0] ],
	["DeepTerror",				[5,6,7,8,9,11,13,16],		[0,0,0,0,0,0,0,0],	[3,3,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,81,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["EarthDemon",				[10,13,18,20,21,25,32,42],	[2,2,2,2,3,3,3,3],	[4,4,4,4,5,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,3,3,3,3,3],	[0,0,0,0,0,0,0,0] ],
	["FlameDemon",				[3,3,4,5,5,6,7,9],			[3,3,3,3,4,4,4,4],	[2,2,3,3,4,4,5,6],	[0,0,0,0,0,0,0,0],	[3,4,4,4,4,5,5,5],	[0,82,82,82,83,83,84,85],[0,0,0,0,0,0,0,0] ],
	["ForestImp",				[4,5,6,7,7,8,10,14],		[3,3,3,4,4,4,4,4],	[1,2,2,2,2,3,4,4],	[0,0,0,0,0,0,0,0],	[1,1,1,1,2,2,2,2],	[0,0,9,9,9,9,9,9],	[0,0,0,0,0,0,0,0] ],
	["FrostDemon",				[10,10,12,14,19,22,29,40],	[3,3,4,4,4,4,4,4],	[3,3,4,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,83,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["GiantViper",				[3,5,7,8,11,14,16,20],		[2,2,3,3,3,4,4,5],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[2,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["HarrowerInfester",		[12,12,14,17,19,21,27,32],	[2,3,3,3,3,3,3,4],	[2,2,3,3,4,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,83,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["Hound",					[6,6,7,8,11,13,17,23],		[5,5,5,5,5,5,6,6],	[2,2,3,4,4,4,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,82,82,83,83,83],[0,0,0,0,0,0,0,0] ],
	["InoxArcher",				[7,9,12,13,16,22,25,35],	[2,2,2,2,3,3,3,3],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["InoxGuard",				[11,13,15,20,23,28,34,40],	[2,3,3,3,4,4,4,4],	[3,3,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[81,82,82,82,82,82,82,83],[0,0,0,0,0,0,0,0] ],
	["InoxPriest",				[7,10,12,16,18,23,24,36],	[2,2,3,3,3,3,4,4],	[3,3,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingBones",				[6,6,7,9,10,13,18,21],		[4,4,4,4,4,4,5,6],	[2,2,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingCorpse",			[10,11,15,15,19,21,31,36],	[1,1,1,2,2,2,2,2],	[3,4,4,5,5,6,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["LivingSpirit",			[3,3,3,4,4,5,8,10],			[3,3,3,4,4,4,4,4],	[3,3,4,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[2,3,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LurkerSoldier",			[7,9,11,13,13,15,19,27],	[2,2,3,3,3,3,4,4],	[3,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[1,1,1,1,2,2,2,2],	[0,71,72,72,73,73,73,73],[0,0,0,0,0,0,0,0] ],
	["NightDemon",				[5,8,11,13,15,17,23,30],	[4,4,4,4,5,5,5,5],	[4,4,4,5,5,6,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Ooze",					[8,9,11,11,12,15,21,27],	[1,1,1,2,2,3,3,3],	[2,2,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["RendingDrake",			[7,7,9,10,12,15,19,24],		[4,4,5,5,6,6,6,6],	[4,5,5,6,6,6,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["SavvasIcestorm",			[12,12,15,17,20,26,33],		[2,2,3,3,4,4,4,4],	[3,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,1,1,1,2,2,2,2],	[73,73,73,73,73,73,73,73],[0,0,0,0,0,0,0,0] ],
	["SavvasLavaflow",			[13,15,18,21,30,40,50],		[3,3,3,3,4,4,4,4],	[3,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,1,1,1,1,1,1],	[0,0,1,1,1,1,1,1] ],
	["SpittingDrake",			[7,9,10,13,16,19,27,34],	[3,3,3,3,4,4,4,4],	[4,4,5,5,5,6,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,6,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["StoneConstruct",			[10,11,14,15,17,19,23,26],	[2,2,2,2,2,3,3,3],	[4,4,5,5,6,6,7,7],	[0,0,0,0,0,0,0,0],	[1,2,2,3,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["SunDemon",				[9,12,13,16,18,18,25,27],	[2,2,2,3,3,3,4,4],	[3,3,4,4,5,5,5,6],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingScout",			[4,5,5,7,8,11,16,23],		[3,3,4,4,4,4,5,5],	[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingPriest",			[3,3,4,5,5,6,8,11],			[3,3,3,3,3,3,3,3],	[2,2,2,3,3,4,5,5],	[0,0,0,0,0,0,0,0],	[2,3,3,3,4,4,4,4],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["WindDemon",				[5,5,7,8,10,14,16,21],		[3,3,4,4,4,4,4,4],	[3,3,3,4,5,5,5,6],	[0,0,0,0,0,0,0,0],	[1,2,2,2,2,2,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],

	["BanditCommanderBoss",		[13,17,19,21,25,28,33,40],	[3,3,4,4,4,5,5,6],	[3,3,3,4,4,4,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CandleKeeperTriceBossC",	[18,20,24,25,29,31,37,44],	[3,3,3,4,4,4,5,5],	[1,1,2,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FirstShieldHarmonBossC",	[10,12,14,16,20,23,28,34],	[2,2,2,2,2,2,2,2],	[2,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["InoxBodyguardBossC",		[9,10,12,13,16,17,21,24],	[2,2,3,3,3,3,4,4],	[0,1,1,2,2,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[83,83,83,84,84,85,85,86],[0,0,0,0,0,0,0,0] ],
	["JekserahBossC",			[11,15,17,19,23,26,32,41],	[3,3,3,4,4,4,4,4],	[1,2,2,3,3,4,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["MercilessTaskmasterBoss",	[21,25,28,31,34,36,43,49],	[2,2,3,3,4,4,4,4],	[2,3,3,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheBetrayerBossC",		[22,26,29,34,37,42,46,53],	[3,3,3,3,3,3,3,3],	[1,1,2,2,3,3,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheColorlessBossC",		[12,15,16,19,20,23,27,32],	[2,2,2,3,3,3,4,4],	[1,1,2,2,3,3,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheDarkRiderBossC",		[16,20,23,29,30,36,45,52],	[3,4,4,4,5,5,5,6],	[1,1,2,2,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheElderDrakeBoss",		[26,31,37,41,47,52,62,75],	[0,0,0,0,0,0,0,0],	[1,2,2,3,3,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheGloomBossC",			[21,27,33,37,43,84,58,70],	[10,10,10,10,10,10,10,10],[2,3,3,4,4,5,6,7],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["ThePrimeDemonBoss",		[17,22,25,31,35,41,50,60],	[3,4,4,4,4,5,5,5],	[4,4,5,5,6,6,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheSightlessEyeBoss",		[21,23,28,30,35,38,47,54],	[0,0,0,0,0,0,0,0],	[5,6,6,7,7,8,8,9],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheWingedHorrorBoss",		[19,22,24,27,30,32,38,44],	[3,4,4,4,5,5,6,6],	[3,3,4,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
//	["",	[],	[],	[],	[],	[],	[],	[] ],
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8, Curse = 9
];


//////////////////////////////
// Ememy Cards
//
const enemy_cards = [
	//Name, Useabel Score Cards, Unuseable Score Cards
	["AncientArtillery",		[], [], ,],
	["BanditArcher",			[], [], ,],
	["BanditScout",				[], [], ,],
	["BlackImp",				[], [], ,],
	["CaveBear",				[], [], ,],
	["ChaosDemon",				[], [], ,],
	["CrystalRot",				[], [], ,],
	["CityArcher",				[], [], ,],
	["CityGuard",				[], [], ,],
	["Cultist",					[], [], ,],
	["DeepTerror",				[], [], ,],
	["EarthDemon",				[], [], ,],
	["FlameDemon",				[], [], ,],
	["ForestImp",				[], [], ,],
	["FrostDemon",				[], [], ,],
	["GiantViper",				[], [], ,],
	["HarrowerInfester",		[], [], ,],
	["Hound",					[], [], ,],
	["InoxArcher",				[], [], ,],
	["InoxGuard",				[], [], ,],
	["InoxPriest",				[], [], ,],
	["LivingBones",				[], [], ,],
	["LivingCorpse",			[], [], ,],
	["LivingSpirit",			[], [], ,],
	["LurkerSoldier",			[], [], ,],
	["NightDemon",				[], [], ,],
	["Ooze",					[], [], ,],
	["RendingDrake",			[], [], ,],
	["SavvasIcestorm",			[], [], ,],
	["SavvasLavaflow",			[], [], ,],
	["SpittingDrake",			[], [], ,],
	["StoneConstruct",			[], [], ,],
	["SunDemon",				[], [], ,],
	["VermlingScout",			[], [], ,],
	["VermlingPriest",			[], [], ,],
	["WindDemon",				[], [], ,],

	["BanditCommanderBoss",		[], [], ,],
	["CandleKeeperTriceBossC",	[], [], ,],
	["FirstShieldHarmonBossC",	[], [], ,],
	["InoxBodyguardBossC",		[], [], ,],
	["JekserahBossC",			[], [], ,],
	["MercilessTaskmasterBoss",	[], [], ,],
	["TheBetrayerBossC",		[], [], ,],
	["TheColorlessBossC",		[], [], ,],
	["TheDarkRiderBossC",		[], [], ,],
	["TheElderDrakeBoss",		[], [], ,],
	["TheGloomBossC",			[], [], ,],
	["ThePrimeDemonBoss",		[], [], ,],
	["TheSightlessEyeBoss",		[], [], ,],
	["TheWingedHorrorBoss",		[], [], ,],
];

function makeEnemyScoreCards() {
	//Ancient Artillery
	makeEnemyScoreCard("AncientArtillery", 46, "Attack -1 / Immobilize", "", "_1", false);
	makeEnemyScoreCard("AncientArtillery", 17, "fill | Attack -2 | Shield 2", "", "", false);
	makeEnemyScoreCard("AncientArtillery", 95, "Attack 1", "", "", false);
	makeEnemyScoreCard("AncientArtillery", 57, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("AncientArtillery", 37, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("AncientArtillery", 46, "Attack -1", "", "_2", false);
	makeEnemyScoreCard("AncientArtillery", 71, "Attack 0", "", "", true); makeEnemyScoreCard("AncientArtillery", 71, "Attack 0", "", "A", true);

	//Bandit Acrher
	makeEnemyScoreCard("BanditArcher", 29, "fill | Attack -1 / Immobilize", "Archer", "", true);
	makeEnemyScoreCard("BanditArcher", 14, "fill | Attack -1", "Archer", "", false);
	makeEnemyScoreCard("BanditArcher", 32, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("BanditArcher", 16, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("BanditArcher", 64, "Attack 1", "Archer", "", true);
	makeEnemyScoreCard("BanditArcher", 31, "fill | Attack 0", "Archer", "", false);
	makeEnemyScoreCard("BanditArcher", 44, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("BanditArcher", 56, "Attack -1", "Archer", "", false);

	//BanditScout
	makeEnemyScoreCard("BanditScout", 29, "fill | Attack -1 / Wound", "Scout", "", true);
	makeEnemyScoreCard("BanditScout", 35, "fill | fill", "Scout", "", true);
	makeEnemyScoreCard("BanditScout", 40, "fill | Attack -1", "Scout", "", false);
	makeEnemyScoreCard("BanditScout", 53, "fill | Attack 0", "Scout", "", false);
	makeEnemyScoreCard("BanditScout", 54, "fill | Attack 0 / Poison", "Scout", "", false);
	makeEnemyScoreCard("BanditScout", 69, "fill | Attack 1", "Scout", "", false);
	makeEnemyScoreCard("BanditScout", 79, "Attack -1", "Scout", "", false);
	makeEnemyScoreCard("BanditScout", 92, "Attack 2 / Poison", "Scout", "", false);

	//Black Imp
	makeEnemyScoreCard("BlackImp", 24, "fill | fill", "Imp", "", false);
	makeEnemyScoreCard("BlackImp", 43, "fill | Attack -1 / Poison | Consume:Any", "Imp", "_1", true);
	makeEnemyScoreCard("BlackImp", 43, "fill | Attack -1 / Curse | Consume:Any", "Imp", "_2", true);
	makeEnemyScoreCard("BlackImp", 76, "fill | Attack 1", "Imp", "", false);
	makeEnemyScoreCard("BlackImp", 42, "fill | ", "Imp", "", false);
	makeEnemyScoreCard("BlackImp", 37, "fill | Attack 0", "Imp", "", false); makeEnemyScoreCard("BlackImp", 37, "fill | Attack 0", "Imp", "A", false);
	makeEnemyScoreCard("BlackImp", 5, "Shield 5 | Heal 1 | Infuse:Any", "Imp", "", false);

	//Cave Bear
	makeEnemyScoreCard("CaveBear", 3, "fill |  Heal 2 / Safe", "", "", false);
	makeEnemyScoreCard("CaveBear", 61, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("CaveBear", 80, "Attack -1 | fill |  Attack 0", "", "", true);
	makeEnemyScoreCard("CaveBear", 60, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("CaveBear", 41, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("CaveBear", 29, "Attack 1 / Muddle", "", "", false);
	makeEnemyScoreCard("CaveBear", 14, "fill | Attack -1 / Immobilize", "", "", false);
	makeEnemyScoreCard("CaveBear", 13, "fill | Attack -1", "", "", true);

	//Chaose Demon
	makeEnemyScoreCard("ChaosDemon", 1, "fill | Attack -1 | Consume:Fire:Attack -1 / Wound", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 14, "fill | Attack 0 | Consume:Ice", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 67, "fill | Attack 1 | Consume:Grass", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 20, "fill | Attack -1 | Consume:Wind:Shield 2", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 42, "fill | Attack 0 | Consume:Light:Heal 4", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 51, "fill | Attack 1 | Consume:Dark:Invisible Self", "", "", false);
	makeEnemyScoreCard("ChaosDemon", 77, "fill | Attack 0 | Infuse:All", "", "", true);
	makeEnemyScoreCard("ChaosDemon", 98, "fill | Attack -1 | Consume:Any:Attack -1 / Disarm", "", "", true);

	//Crystal Rot
	makeEnemyScoreCard("CrystalRot", 67, "fill | Attack -1 | Infuse:Dark", "", "", true);
	makeEnemyScoreCard("CrystalRot", 87, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("CrystalRot", 49, "fill | Attack 0 | Infuse:Dark", "", "", false);
	makeEnemyScoreCard("CrystalRot", 18, "fill", "", "", true);
	makeEnemyScoreCard("CrystalRot", 34, "fill | Attack -1 | fill |  Consume:Dark", "", "", false);
	makeEnemyScoreCard("CrystalRot", 40, "fill | fill |  Consume:Dark", "", "", false);
	makeEnemyScoreCard("CrystalRot", 28, "Attack 0 / Muddle | Heal 2 | Strengthen", "", "", false);
	makeEnemyScoreCard("CrystalRot", 28, "Attack 0 / Muddle | Heal 2 | Strengthen", "", "A", false);

	//City Archer
	makeEnemyScoreCard("CityArcher", 29, "fill | Attack -1 / Immobilize", "Archer", "", true);
	makeEnemyScoreCard("CityArcher", 14, "fill | Attack -1", "Archer", "", false);
	makeEnemyScoreCard("CityArcher", 32, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("CityArcher", 16, "fill | Attack -1", "Archer", "", false);
	makeEnemyScoreCard("CityArcher", 64, "Attack 1", "Archer", "", true);
	makeEnemyScoreCard("CityArcher", 31, "fill | Attack 0", "Archer", "", false);
	makeEnemyScoreCard("CityArcher", 44, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("CityArcher", 56, "Attack -1", "Archer", "", false);

	//City Guard
	makeEnemyScoreCard("CityGuard", 55, "fill | Attack 0 | Strengthen", "Guard", "", true);
	makeEnemyScoreCard("CityGuard", 50, "fill | Attack 0", "Guard", "", false); makeEnemyScoreCard("CityGuard", 50, "fill | Attack 0", "Guard", "A", false);
	makeEnemyScoreCard("CityGuard", 30, "fill | Attack -1", "Guard", "", false);
	makeEnemyScoreCard("CityGuard", 15, "Attack 0 / Poison | Shield 1", "Guard", "_1", false);
	makeEnemyScoreCard("CityGuard", 15, "fill | Shield 1", "Guard", "_2", true);
	makeEnemyScoreCard("CityGuard", 35, "fill | Attack 0", "Guard", "", false);
	makeEnemyScoreCard("CityGuard", 70, "Attack 1 | fill", "Guard", "", false);

	//Cultist
	makeEnemyScoreCard("Cultist", 10, "fill | Attack -1", "", "", false); makeEnemyScoreCard("Cultist", 10, "fill | Attack -1", "", "A", false);
	makeEnemyScoreCard("Cultist", 27, "fill | Attack 0| fill", "", "", false); makeEnemyScoreCard("Cultist", 27, "fill | Attack 0| fill", "", "A", false);
	makeEnemyScoreCard("Cultist", 63, "fill | Suffer 1 | Stun Self", "", "", true); makeEnemyScoreCard("Cultist", 63, "fill | Suffer 1 | Stun Self", "", "A", true);
	makeEnemyScoreCard("Cultist", 21, "fill | fill", "", "", false); makeEnemyScoreCard("Cultist", 21, "fill | fill", "", "A", false);

	//Deep Terror
	makeEnemyScoreCard("DeepTerror", 54, "", "", "", false);
	makeEnemyScoreCard("DeepTerror", 96, "Attack -2", "", "", false);
	makeEnemyScoreCard("DeepTerror", 84, "Attack -1 | Attack 0 / Wound", "", "", false);
	makeEnemyScoreCard("DeepTerror", 75, "Attack -1 / Poison | Attack -1 / Immobilize", "", "_1", false);
	makeEnemyScoreCard("DeepTerror", 75, "Attack -2 / Disarm | Attack -1 / Muddle", "", "_2", false);
	makeEnemyScoreCard("DeepTerror", 65, "Attack -1 / Curse", "", "", false);
	makeEnemyScoreCard("DeepTerror", 60, "Attack 0 / Pierce 3", "", "", true); makeEnemyScoreCard("DeepTerror", 60, "Attack 0 / Pierce 3", "", "A", true);

	//Earth Demon
	makeEnemyScoreCard("EarthDemon", 87, "fill | Attack -1 | Consume:Any:Grass", "", "", false);
	makeEnemyScoreCard("EarthDemon", 40, "Heal 4 | Consume:Grass", "", "", false);
	makeEnemyScoreCard("EarthDemon", 42, "fill | Attack -1", "", "", true);
	makeEnemyScoreCard("EarthDemon", 62, "fill | Attack 0 | Infuse:Grass", "", "", false);
	makeEnemyScoreCard("EarthDemon", 71, "Attack 0 | Consume:Grass", "", "", false);
	makeEnemyScoreCard("EarthDemon", 83, "fill | Attack 1 | Infuse:Grass", "", "", false);
	makeEnemyScoreCard("EarthDemon", 93, "fill | Attack -1| fill", "", "", false);
	makeEnemyScoreCard("EarthDemon", 79, "fill | Attack 0 | Consume:Wind:Attack -2", "", "", false);

	//Flame Demon
	makeEnemyScoreCard("FlameDemon", 3, "fill | Attack -1 | Infuse:Fire", "", "", false);
	makeEnemyScoreCard("FlameDemon", 24, "fill | Attack 0 | Infuse:Fire", "", "", false);
	makeEnemyScoreCard("FlameDemon", 46, "Attack 0 | Consume:Fire", "", "", true);
	makeEnemyScoreCard("FlameDemon", 8, "fill | fill | Consume:Any:Fire", "", "", false);
	makeEnemyScoreCard("FlameDemon", 49, "Attack 0 | Consume:Fire:Attack 1 / Wound", "", "", false);
	makeEnemyScoreCard("FlameDemon", 67, "fill | Attack 1 | Infuse:Fire", "", "", false);
	makeEnemyScoreCard("FlameDemon", 30, "Consume:Fire | fill |  Attack -2 / Wound", "", "", true);
	makeEnemyScoreCard("FlameDemon", 77, "Attack 0 | Consume:Ice:Suffer 1", "", "", false);

	//Forest Imp
	makeEnemyScoreCard("ForestImp", 24, "", "Imp", "", false);
	makeEnemyScoreCard("ForestImp", 43, "fill | Attack -1 / Poison | Consume:Any", "Imp", "_1", true);
	makeEnemyScoreCard("ForestImp", 43, "fill | Attack -1 | Consume:Any", "Imp", "_2", true);
	makeEnemyScoreCard("ForestImp", 76, "fill | Attack 1", "Imp", "", false);
	makeEnemyScoreCard("ForestImp", 42, "fill | fill", "Imp", "", false);
	makeEnemyScoreCard("ForestImp", 37, "fill | Attack 0", "Imp", "", false); makeEnemyScoreCard("ForestImp", 37, "Attack 0", "Imp", "A", false);
	makeEnemyScoreCard("ForestImp", 5, "Shield 5 | Heal 1 | Infuse:Any", "Imp", "", false);

	//Frost Demon
	makeEnemyScoreCard("FrostDemon", 18, "fill | Consume:Ice:Heal 3", "", "_1", false);
	makeEnemyScoreCard("FrostDemon", 18, "fill | Shield 2 | Consume:Fire:Stun Self", "", "_2", false);
	makeEnemyScoreCard("FrostDemon", 38, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("FrostDemon", 58, "fill | Attack 0", "", "_1", false);
	makeEnemyScoreCard("FrostDemon", 58, "fill | Attack 0 | Consume:Ice:Attack 2", "", "_2", false);
	makeEnemyScoreCard("FrostDemon", 78, "fill | Attack 0 | Infuse:Ice", "", "", true);
	makeEnemyScoreCard("FrostDemon", 78, "fill | Attack 0 | Infuse:Ice", "", "A", true);

	//Giant Viper
	makeEnemyScoreCard("GiantViper", 23, "fill | Attack -1 / Immobilize | Attack -1", "", "", false);
	makeEnemyScoreCard("GiantViper", 43, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("GiantViper", 18, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("GiantViper", 33, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("GiantViper", 58, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("GiantViper", 11, "Shield 1 | Attack 0", "", "", false);
	makeEnemyScoreCard("GiantViper", 32, "fill | Attack 0", "", "", true); makeEnemyScoreCard("GiantViper", 32, "fill | Attack 0", "", "A", true);

	//Harrower Infester
	makeEnemyScoreCard("HarrowerInfester", 30, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("HarrowerInfester", 7, "fill | Attack -1 / Poison | Infuse:Dark", "", "_1", false);
	makeEnemyScoreCard("HarrowerInfester", 7, "Attack -1 / Muddle | Heal 4", "", "_2", true);
	makeEnemyScoreCard("HarrowerInfester", 16, "fill | Attack -1 | Heal 5", "", "_1", false);
	makeEnemyScoreCard("HarrowerInfester", 16, "Attack 2 / Immobilize | fill", "", "_2", false);
	makeEnemyScoreCard("HarrowerInfester", 2, "Shield 2 | fill", "", "", true);
	makeEnemyScoreCard("HarrowerInfester", 38, "fill | Attack 1", "", "_1", false);
	makeEnemyScoreCard("HarrowerInfester", 38, "fill | Attack -1 / Wound | Consume:Dark:Attack 1", "", "_2", false);

	//Hound
	makeEnemyScoreCard("Hound", 6, "fill | Attack / Immobilize", "", "", false);
	makeEnemyScoreCard("Hound", 7, "", "", "", false);
	makeEnemyScoreCard("Hound", 19, "fill | Attack 0", "", "", true); makeEnemyScoreCard("Hound", 19, "fill | Attack 0", "", "A", true);
	makeEnemyScoreCard("Hound", 26, "fill | Attack 0", "", "", false); makeEnemyScoreCard("Hound", 26, "fill | Attack 0", "", "A", false);
	makeEnemyScoreCard("Hound", 83, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("Hound", 72, "Attack -1 / Pierce 2 | fill |  Attack -1 / Pierce 2", "", "", false);

	//Inox Archer
	makeEnemyScoreCard("InoxArcher", 29, "fill | Attack -1 / Immobilize", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 14, "fill | Attack -1", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 32, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 16, "fill | Attack -1", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 64, "Attack 1", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 31, "fill | Attack 0", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 44, "fill | Attack 1", "Archer", "", false);
	makeEnemyScoreCard("InoxArcher", 56, "Attack -1", "Archer", "", false);

	//Inox Guard
	makeEnemyScoreCard("InoxGuard", 55, "fill | Attack 0 | Strengthen", "Guard", "", false);
	makeEnemyScoreCard("InoxGuard", 50, "fill | Attack 0", "Guard", "", false); makeEnemyScoreCard("InoxGuard", 50, "fill | Attack 0", "Guard", "A", false);
	makeEnemyScoreCard("InoxGuard", 30, "fill | Attack -1", "Guard", "", false);
	makeEnemyScoreCard("InoxGuard", 15, "Attack 0 / Poison | Shield 1", "Guard", "_1", false);
	makeEnemyScoreCard("InoxGuard", 15, "Shield 1", "Guard", "_2", false);
	makeEnemyScoreCard("InoxGuard", 35, "fill | Attack 0", "Guard", "", false);
	makeEnemyScoreCard("InoxGuard", 70, "fill | Attack 1", "Guard", "", false);

	//Inox Priest
	makeEnemyScoreCard("InoxPriest", 8, "fill | Attack 0 / Immobilize", "Priest", "_1", false);
	makeEnemyScoreCard("InoxPriest", 8, "fill | Attack -1 / Disarm", "Priest", "_2", false);
	makeEnemyScoreCard("InoxPriest", 62, "fill | Attack 0", "Priest", "", false);
	makeEnemyScoreCard("InoxPriest", 23, "", "Priest", "", true); makeEnemyScoreCard("InoxPriest", 23, "", "Priest", "A", true);
	makeEnemyScoreCard("InoxPriest", 74, "fill | Attack 1", "Priest", "", false);
	makeEnemyScoreCard("InoxPriest", 89, "fill | Bless Self", "Priest", "", false);
	makeEnemyScoreCard("InoxPriest", 9, "fill | Attack -1 / Curse", "Priest", "", false);

	//Living Bones
	makeEnemyScoreCard("LivingBones", 12, "Shield 1 | Heal 2", "", "", true);
	makeEnemyScoreCard("LivingBones", 74, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("LivingBones", 81, "Attack 2", "", "", false);
	makeEnemyScoreCard("LivingBones", 45, "fill | Attack 0", "", "", false); makeEnemyScoreCard("LivingBones", 45, "fill | Attack 0", "", "A", false);
	makeEnemyScoreCard("LivingBones", 25, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("LivingBones", 20, "fill | Attack 0 | Heal 2", "", "", true);
	makeEnemyScoreCard("LivingBones", 64, "fill | Attack 1", "", "", false);

	//Living Corpse
	makeEnemyScoreCard("LivingCorpse", 21, "", "", "", false);
	makeEnemyScoreCard("LivingCorpse", 82, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("LivingCorpse", 47, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("LivingCorpse", 66, "fill | Attack 0", "", "", true); makeEnemyScoreCard("LivingCorpse", 66, "fill | Attack 0", "", "A", true);
	makeEnemyScoreCard("LivingCorpse", 91, "fill | Consume:Grass:Attack 0", "", "", false);
	makeEnemyScoreCard("LivingCorpse", 71, "fill | Attack 1 / Poison | Infuse:Grass", "", "", false);
	makeEnemyScoreCard("LivingCorpse", 32, "Attack 2", "", "", false);

	//Living Spirit
	makeEnemyScoreCard("LivingSpirit", 67, "fill | Attack 0 / Consume:Ice:Stun", "", "", false);
	makeEnemyScoreCard("LivingSpirit", 55, "fill | Infuse:Ice", "", "", false);
	makeEnemyScoreCard("LivingSpirit", 75, "fill | Attack 1 | Heal 1 | Infuse:Ice", "", "", false);
	makeEnemyScoreCard("LivingSpirit", 61, "Attack 0", "", "", false);
	makeEnemyScoreCard("LivingSpirit", 48, "fill | Attack 0", "", "", false); makeEnemyScoreCard("LivingSpirit", 48, "fill | Attack 0", "", "A", false);
	makeEnemyScoreCard("LivingSpirit", 33, "fill | Attack -1", "", "", true);
	makeEnemyScoreCard("LivingSpirit", 22, "fill | Attack -1 / Muddle", "", "", true);

	//Lurker Soldier
	makeEnemyScoreCard("LurkerSoldier", 23, "fill | Attack -1 | Shield 1 | Infuse:Ice", "", "", true);
	makeEnemyScoreCard("LurkerSoldier", 41, "Consume:Ice:Strengthen | fill |  Attack -1 / Wound", "", "", false);
	makeEnemyScoreCard("LurkerSoldier", 64, "Attack 1 / Muddle", "", "", false);
	makeEnemyScoreCard("LurkerSoldier", 61, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("LurkerSoldier", 38, "fill | Attack 0", "", "_1", false); makeEnemyScoreCard("LurkerSoldier", 38, "fill | Attack 0", "", "_2", false);
	makeEnemyScoreCard("LurkerSoldier", 28, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("LurkerSoldier", 11, "fill | Shield 1 / Consume:Ice:Shield 2", "", "", true);

	//Night Demon
	makeEnemyScoreCard("NightDemon", 15, "fill | Attack -1 | Consume:Any:Dark", "", "", false);
	makeEnemyScoreCard("NightDemon", 35, "Attack -1 | Attack -1 / Pierce 2 | Consume:Light:Curse Self", "", "", false);
	makeEnemyScoreCard("NightDemon", 41, "fill | Attack 1 | Infuse:Dark", "", "", true);
	makeEnemyScoreCard("NightDemon", 46, "fill | Attack 1 | Consume:Dark:Attack 2", "", "", true);
	makeEnemyScoreCard("NightDemon", 26, "Attack -2 / Consume:Dark", "", "", false);
	makeEnemyScoreCard("NightDemon", 22, "fill | Attack 0 | Infuse:Dark", "", "", false);
	makeEnemyScoreCard("NightDemon", 37, "fill | Attack -2 | Consume:Dark:Invisible Self", "", "", false);
	makeEnemyScoreCard("NightDemon", 4, "fill | Attack -1 | Inufse:Dark", "", "", false);

	//Ooze
	makeEnemyScoreCard("Ooze", 94, "Suffer 2", "", "", true); makeEnemyScoreCard("Ooze", 94, "Suffer 2", "", "A", true);
	makeEnemyScoreCard("Ooze", 66, "fill | Attack 1 | Infuse:Dark", "", "", false);
	makeEnemyScoreCard("Ooze", 85, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("Ooze", 59, "Attack 0 / Poison | Consume:Grass", "", "", false);
	makeEnemyScoreCard("Ooze", 57, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("Ooze", 36, "fill | Attack -1 | Infuse:Grass", "", "", false);

	//Rending Drake
	makeEnemyScoreCard("RendingDrake", 6, "Shield 2 | Heal 2 | Strengthen", "", "", false);
	makeEnemyScoreCard("RendingDrake", 72, "Attack -1 | Attack -1 | Attack -2", "", "", true);
	makeEnemyScoreCard("RendingDrake", 59, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("RendingDrake", 54, "fill | Attack -1 / Poison", "", "", false);
	makeEnemyScoreCard("RendingDrake", 39, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("RendingDrake", 25, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("RendingDrake", 13, "Attack -1 | fill |  Attack -1", "", "", true);
	makeEnemyScoreCard("RendingDrake", 12, "fill | Attack -1", "", "", false);

	//Savvas Icestorm
	makeEnemyScoreCard("SavvasIcestorm", 35, "fill | Attack -1 | Infuse:Ice", "", "", true);
	makeEnemyScoreCard("SavvasIcestorm", 47, "fill | fill | Attack -1 | Infuse:Wind", "", "", true);
	makeEnemyScoreCard("SavvasIcestorm", 14, "Shield 4 | fill |  Consume:Ice:Heal 3 | Consume:Wind:Attack -1", "", "_1", false);
	makeEnemyScoreCard("SavvasIcestorm", 14, "Attack 0 | Consume:Ice:Attack 2 | Infuse:Wind", "", "_2", false);
	makeEnemyScoreCard("SavvasIcestorm", 19, "fill | Attack -1 | Infuse:Ice", "", "", false);
	makeEnemyScoreCard("SavvasIcestorm", 98, "fill | Infuse:Ice", "", "_1", false);
	makeEnemyScoreCard("SavvasIcestorm", 98, "fill | Infuse:Wind", "", "_2", false);
	makeEnemyScoreCard("SavvasIcestorm", 70, "fill |  Consume:Wind | Attack 1", "", "", false);

	//Savvas Lavaflow
	makeEnemyScoreCard("SavvasLavaflow", 97, "fill | Infuse:Fire", "", "_1", false);
	makeEnemyScoreCard("SavvasLavaflow", 97, "fill | Infuse:Grass", "", "_2", false);
	makeEnemyScoreCard("SavvasLavaflow", 68, "fill | Attack 1 | fill |  Infuse:Grass", "", "_1", true);
	makeEnemyScoreCard("SavvasLavaflow", 68, "fill | Attack -1 | Infuse:Fire", "", "_2", true);
	makeEnemyScoreCard("SavvasLavaflow", 22, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("SavvasLavaflow", 41, "fill | Attack -1 | Consume:Grass:Attack -2 / Immobilize", "", "", false);
	makeEnemyScoreCard("SavvasLavaflow", 51, "fill |  Consume:Fire | Consume:Grass", "", "", false);
	makeEnemyScoreCard("SavvasLavaflow", 31, "fill |  Consume:Grass", "", "", false);

	//Spitting Drake
	makeEnemyScoreCard("SpittingDrake", 32, "fill | Attack -1", "", "", false);
	makeEnemyScoreCard("SpittingDrake", 52, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("SpittingDrake", 57, "fill | Attack -1", "", "", true);
	makeEnemyScoreCard("SpittingDrake", 27, "Attack 0 / Poison", "", "", false);
	makeEnemyScoreCard("SpittingDrake", 87, "fill | Attack 1", "", "", false);
	makeEnemyScoreCard("SpittingDrake", 89, "Attack -2 / Stun", "", "_1", false);
	makeEnemyScoreCard("SpittingDrake", 89, "fill | Attack -2 / Poison", "", "_2", true);
	makeEnemyScoreCard("SpittingDrake", 6, "Shield 2 | Heal 2 | Strengthen", "", "", false);

	//Stone Construct
	makeEnemyScoreCard("StoneConstruct", 28, "fill | Attack -2 / Immobilize", "", "_1", false);
	makeEnemyScoreCard("StoneConstruct", 28, "fill | Attack 0", "", "_2", false);
	makeEnemyScoreCard("StoneConstruct", 83, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("StoneConstruct", 90, "fill | Attack 1", "", "", true);
	makeEnemyScoreCard("StoneConstruct", 72, "Attack 1", "", "", false);
	makeEnemyScoreCard("StoneConstruct", 64, "fill | Attack 0", "", "", false);
	makeEnemyScoreCard("StoneConstruct", 51, "fill | Attack -1", "", "", true);
	makeEnemyScoreCard("StoneConstruct", 10, "", "", "", false);

	//Sun Demon
	makeEnemyScoreCard("SunDemon", 17, "fill | Consume:Light:All", "", "", true);
	makeEnemyScoreCard("SunDemon", 36, "fill | Attack 0 | Infuse:Light", "", "", false); makeEnemyScoreCard("SunDemon", 36, "fill | Attack 0 | Infuse:Light", "", "A", false);
	makeEnemyScoreCard("SunDemon", 68, "fill | Attack 1 | Infuse:Light", "", "", false);
	makeEnemyScoreCard("SunDemon", 73, "fill | Attack 1 | Consume:Light:Heal 3", "", "", true);
	makeEnemyScoreCard("SunDemon", 95, "Attack -1 | fill |  Consume:Light:All", "", "", false);
	makeEnemyScoreCard("SunDemon", 88, "fill | Attack -1 | Consume:Dark:Muddle Self", "", "", false);
	makeEnemyScoreCard("SunDemon", 50, "fill | Attack 0 | Consume:Any:Light", "", "", false);

	//Vermling Scout
	makeEnemyScoreCard("VermlingScout", 29, "fill | Attack -1 / Wound", "Scout", "", true);
	makeEnemyScoreCard("VermlingScout", 35, "", "Scout", "", true);
	makeEnemyScoreCard("VermlingScout", 40, "fill | Attack -1", "Scout", "", false);
	makeEnemyScoreCard("VermlingScout", 53, "fill | Attack 0", "Scout", "", false);
	makeEnemyScoreCard("VermlingScout", 54, "fill | Attack 0 / Poison", "Scout", "", false);
	makeEnemyScoreCard("VermlingScout", 69, "fill | Attack 1", "Scout", "", false);
	makeEnemyScoreCard("VermlingScout", 79, "Attack -1", "Scout", "", false);
	makeEnemyScoreCard("VermlingScout", 92, "Attack 2 / Poison", "Scout", "", false);

	//Vermling Priest
	makeEnemyScoreCard("VermlingPriest", 8, "fill | Attack 0 / Immobilize", "Priest", "_1", false);
	makeEnemyScoreCard("VermlingPriest", 8, "fill | Attack -1 / Disarm", "Priest", "_2", false);
	makeEnemyScoreCard("VermlingPriest", 62, "fill | Attack 0", "Priest", "", false);
	makeEnemyScoreCard("VermlingPriest", 23, "", "Priest", "", true); makeEnemyScoreCard("VermlingPriest", 23, "", "Priest", "A", true);
	makeEnemyScoreCard("VermlingPriest", 74, "fill | Attack 1", "Priest", "", false);
	makeEnemyScoreCard("VermlingPriest", 89, "fill | fill | Bless Self", "Priest", "", false);
	makeEnemyScoreCard("VermlingPriest", 9, "fill | Attack -1 / Curse", "Priest", "", false);

	//Wind Demon
	makeEnemyScoreCard("WindDemon", 9, "Attack -1 | Heal 1 | Consume:Wind:Invisible Self", "", "", false);
	makeEnemyScoreCard("WindDemon", 21, "fill | Attack 0 | Infuse:Wind", "", "", true); makeEnemyScoreCard("WindDemon", 21, "fill | Attack 0 | Infuse:Wind", "", "A", true);
	makeEnemyScoreCard("WindDemon", 29, "fill | Attack -1 | Consume:Wind", "", "", false);
	makeEnemyScoreCard("WindDemon", 37, "fill | Attack 0 / Consume:Wind:Attack 1", "", "", false);
	makeEnemyScoreCard("WindDemon", 2, "fill | Attack -1 | Shield 2 | Consume:Any:Wind", "", "", false);
	makeEnemyScoreCard("WindDemon", 43, "fill | Attack 0 / Disarm | Consume:Grass", "", "_1", false);
	makeEnemyScoreCard("WindDemon", 43, "fill | Attack 1 / Consume:Wind:Disarm", "", "_2", false);

	//Bandit Commander
	makeEnemyScoreCard("BanditCommanderBoss", 11, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 14, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 17, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 85, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 79, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 73, "", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 36, "fill | Attack 0", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 52, "fill | Attack -1", "Boss", "", false);
	makeEnemyScoreCard("BanditCommanderBoss", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "Boss", "", false);

	//Candle Keeper Trice
	makeEnemyScoreCard("CandleKeeperTriceBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("CandleKeeperTriceBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//First Shield Harmon
	makeEnemyScoreCard("FirstShieldHarmonBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("FirstShieldHarmonBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//Inox Bodyguard
	makeEnemyScoreCard("InoxBodyguardBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("InoxBodyguardBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//Jekserah
	makeEnemyScoreCard("JekserahBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("JekserahBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//Mercliss Taskmaster
	makeEnemyScoreCard("MercilessTaskmasterBoss", 11, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 14, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 17, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 85, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 79, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 73, "", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 36, "fill | Attack 0", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 52, "fill | Attack -1", "Boss", "", false);
	makeEnemyScoreCard("MercilessTaskmasterBoss", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "Boss", "", false);

	//The Betrayer
	makeEnemyScoreCard("TheBetrayerBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("TheBetrayerBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//The Colorless
	makeEnemyScoreCard("TheColorlessBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("TheColorlessBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//The Dark Rider
	makeEnemyScoreCard("TheDarkRiderBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("TheDarkRiderBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//The Edler Drake
	makeEnemyScoreCard("TheElderDrakeBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("TheElderDrakeBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//The Gloom
	makeEnemyScoreCard("TheGloomBossC", 11, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 14, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 17, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 85, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 79, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 73, "", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 36, "fill | Attack 0", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 52, "fill | Attack -1", "BossC", "", false);
	makeEnemyScoreCard("TheGloomBossC", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "BossC", "", false);

	//The Prime Demon
	makeEnemyScoreCard("ThePrimeDemonBoss", 11, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 14, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 17, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 85, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 79, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 73, "", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 36, "fill | Attack 0", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 52, "fill | Attack -1", "Boss", "", false);
	makeEnemyScoreCard("ThePrimeDemonBoss", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "Boss", "", false);

	//The Sightless Eye
	makeEnemyScoreCard("TheSightlessEyeBoss", 11, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 14, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 17, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 85, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 79, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 73, "", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 36, "fill | Attack 0", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 52, "fill | Attack -1", "Boss", "", false);
	makeEnemyScoreCard("TheSightlessEyeBoss", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "Boss", "", false);

	//The Winged Horror
	makeEnemyScoreCard("TheWingedHorrorBoss", 11, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 14, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 17, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 85, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 79, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 73, "", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 36, "fill | Attack 0", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 52, "fill | Attack -1", "Boss", "", false);
	makeEnemyScoreCard("TheWingedHorrorBoss", 66, "fill | fill |  Heal 2 | Consume:Dark:Heal 3", "Boss", "", false);

	//
//	makeEnemyScoreCard("", , "", "", "", false);
}

