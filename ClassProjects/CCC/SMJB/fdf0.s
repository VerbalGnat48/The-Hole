;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Definitions
;;
%define T1		R0
%define T2		R1
%define X		R2
%define Y		R3
%define Value		R4
%define T3		R5
%define T4		R6
%define T5		R7

%define Cntlr		R11
%define Jndex		R12
%define Index		R13

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mem Addresses
;;
%define Score		0x00000000								;Score
%define Coins		0x00000001								;Coins
%define Lives		0x00000002								;Lives
%define RID		0x00000003								;Region ID
%define	REND		0x00000004								;Region End for Matrix
%define RRL		0x00000005								;Region Row Limit (if sheet is 6 sprites, each 40px wide then. (6+1)*40 = 240)

%define Death		0x00000007								;Keep track of if dead
%define Direction	0x00000008								;Holds last pressed game direction value
%define LSE		0x00000009								;Left screen edge, will act as a boolean for stuff behind player being active
%define RSE		0x0000000A								;Right screen edge, will act as a boolean for stuff infront of player being active
%define PX		0x0000000B								;Player X
%define PY		0x0001001F								;Player Y
%define PYHT		0x0000000D								;PLayer Y Hotspot Top Distance (use in region matrix)
%define PYHB		0x0000000E								;Player Y Hotspot Bottom Distance (use in region matrix)
%define PYHD		0x0000000F								;Non Region Matrix Player HotSpot Distance (use outside of region matrix)
%define PID		0x00000010								;Which Direction the Player is facing
%define Pspeed		0x00000011								;Player Speed
%define Espeed		0x00000012								;Enemy Speed
%define Ispeed		0x00000015								;Item Speed
%define Print		0x00000016								;Helps print numbers
%define Jump		0x00000017								;Jump State
%define Side		0x00000018								;Face Left or Right ( 0=Left, 1=Right )
%define Ground		0x00000019								;Ground status ( 0 = Ground, 1 = In air, 2 = highest point )
%define Size		0x0000001A								;Controls big and small player
%define SBGY		0x0000001B								;Size Based Ground Level as differnt sizes have different ground levels
%define DFC		0x0000001C								;Distance from Center of Sprite for obejcts
%define MoveScreen	0x0000001D								;X position to move screen when past
%define CBGY		0x0001001E
%define ItemID		0x0000001F
%define LeftEdge	0x00010020								;Left Edge Screen Barrier
%define HighPoint	0x00000021								;Highest Poin the Player can Jump
%define GroundI		0x00000022								;Item Grround level
%define Iframes		0x00000023

;;Background Defines
%define BGY		0x00000050								;All Background Y positions
%define BGX1		0x00000051								;Background 1 X position
%define BGX2		0x00000052
%define BGX3		0x00000053
%define BGX4		0x00000054
%define BGX5		0x00000055
%define BGX6		0x00000056
%define BGX7		0x00000057
%define BGXU		0x00000058								;Background "Underground" X
%define BGF1		0x00000061								;Background Flag (0=Active, 1=Dead)
%define BGF2		0x00000062
%define BGF3		0x00000063
%define BGF4		0x00000064
%define BGF5		0x00000065
%define BGF6		0x00000066
%define BGF7		0x00000067
%define BGFU		0x00000068
%define BGS		0x00000060								;Background Sub number
%define GroundY		0x00000070								;Ground Y Value

;;Environmental Obejcts Defines
;;(13 ? Blocks, 30 Surface Bricks (at most 16 at once...), 7 Invisible, ~50 metallic)
;;(3 lv1 pipes, 1 lv2 pipes, 2 lv3 pipes, 1 side pipe)
;;(13 Trap, 1 Axe, 1 Chain)
;Pipes
%define PipeL1		0x00000100								;Pipe 1 Left
%define PipeR1		0x00000101								;Pipe 1 Right
%define PipeT1		0x00000102								;Pipe 1 Top
%define PipeL2		0x00000103
%define PipeR2		0x00000104
%define PipeT2		0x00000105
%define PipeL3		0x00000106
%define PipeR3		0x00000107
%define PipeT3		0x00000108
%define PipeL4		0x00000109
%define PipeR4		0x0000010A
%define PipeT4		0x0000010B
%define PipeL5		0x0000010C
%define PipeR5		0x0000010D
%define PipeT5		0x0000010E
%define PipeL6		0x0000010F
%define PipeR6		0x00000110
%define PipeT6		0x00000111
%define PipeL7		0x00000112
%define PipeR7		0x00000113
%define PipeT7		0x00000114

;Bricks
%define BrickL1		0x00000120								;Brick 1 Left
%define BrickR1		0x00000121								;Brick 1 Right
%define BrickT1		0x00000122								;Brick 1 Top
%define BrickB1		0x00000123								;Brick 1 Bottom
%define BrickL2		0x00000124
%define BrickR2		0x00000125
%define BrickT2		0x00000126
%define BrickB2		0x00000127
%define BrickL3		0x00000128
%define BrickR3		0x00000129
%define BrickT3		0x0000012A
%define BrickB3		0x0000012B
%define BrickL4		0x0000012C
%define BrickR4		0x0000012D
%define BrickT4		0x0000012E
%define BrickB4		0x0000012F
%define BrickL5		0x00000130
%define BrickR5		0x00000131
%define BrickT5		0x00000132
%define BrickB5		0x00000133
%define BrickL6		0x00000134
%define BrickR6		0x00000135
%define BrickT6		0x00000136
%define BrickB6		0x00000137
%define BrickL7		0x00000138
%define BrickR7		0x00000139
%define BrickT7		0x0000013A
%define BrickB7		0x0000013B
%define BrickL8		0x0000013C
%define BrickR8		0x0000013D
%define BrickT8		0x0000013E
%define BrickB8		0x0000013F
%define BrickL9		0x00000140
%define BrickR9		0x00000141
%define BrickT9		0x00000142
%define BrickB9		0x00000143
%define BrickL10	0x00000144
%define BrickR10	0x00000145
%define BrickT10	0x00000146
%define BrickB10	0x00000147
%define BrickL11	0x00000148
%define BrickR11	0x00000149
%define BrickT11	0x0000014A
%define BrickB11	0x0000014B
%define BrickL12	0x0000014C
%define BrickR12	0x0000014D
%define BrickT12	0x0000014E
%define BrickB12	0x0000014F
%define BrickL13	0x00000150
%define BrickR13	0x00000151
%define BrickT13	0x00000152
%define BrickB13	0x00000153
%define BrickL14	0x00000154
%define BrickR14	0x00000155
%define BrickT14	0x00000156
%define BrickB14	0x00000157
%define BrickL15	0x00000158
%define BrickR15	0x00000159
%define BrickT15	0x0000015A
%define BrickB15	0x0000015B
%define BrickL16	0x0000015C
%define BrickR16	0x0000015D
%define BrickT16	0x0000015E
%define BrickB16	0x0000015F
%define BrickL17	0x00000160
%define BrickR17	0x00000161
%define BrickT17	0x00000162
%define BrickB17	0x00000163
%define BrickL18	0x00000164
%define BrickR18	0x00000165
%define BrickT18	0x00000166
%define BrickB18	0x00000167
%define BrickL19	0x00000168
%define BrickR19	0x00000169
%define BrickT19	0x0000016A
%define BrickB19	0x0000016B
%define BrickL20	0x0000016C
%define BrickR20	0x0000016D
%define BrickT20	0x0000016E
%define BrickB20	0x0000016F
%define BrickL21	0x00000170
%define BrickR21	0x00000171
%define BrickT21	0x00000172
%define BrickB21	0x00000173
%define BrickL22	0x00000174
%define BrickR22	0x00000175
%define BrickT22	0x00000176
%define BrickB22	0x00000177

;Brick Flags
%define BrickF1		0x00000200								;Brick Flag Values (0=Active, 1=Dead)
%define BrickF2		0x00000201
%define BrickF3		0x00000202
%define BrickF4		0x00000203
%define BrickF5		0x00000204
%define BrickF6		0x00000205
%define BrickF7		0x00000206
%define BrickF8		0x00000207
%define BrickF9		0x00000208
%define BrickF10	0x00000209
%define BrickF11	0x0000020A
%define BrickF12	0x0000020B
%define BrickF13	0x0000020C
%define BrickF14	0x0000020D
%define BrickF15	0x0000020E
%define BrickF16	0x0000020F
%define BrickF17	0x00000210
%define BrickF18	0x00000211
%define BrickF19	0x00000212
%define BrickF20	0x00000213
%define BrickF21	0x00000214
%define BrickF22	0x00000215

;Holes
%define HoleL1		0x00000230
%define HoleR1		0x00000231
%define HoleT1		0x00000232
%define HoleL2		0x00000233
%define HoleR2		0x00000234
%define HoleT2		0x00000235
%define HoleL3		0x00000236
%define HoleR3		0x00000237
%define HoleT3		0x00000238
%define HoleL4		0x00000239
%define HoleR4		0x0000023A
%define HoleT4		0x0000023B

;Stairs
%define StairL1A	0x00000240
%define StairR1A	0x00000241
%define StairT1A	0x00000242
%define StairL1B	0x00000243
%define StairR1B	0x00000244
%define StairT1B	0x00000245
%define StairL1C	0x00000246
%define StairR1C	0x00000247
%define StairT1C	0x00000248
%define StairL1D	0x00000249
%define StairR1D	0x0000024A
%define StairT1D	0x0000024B

%define StairL2A	0x0000024C
%define StairR2A	0x0000024D
%define StairT2A	0x0000024E
%define StairL2B	0x0000024F
%define StairR2B	0x00000250
%define StairT2B	0x00000251
%define StairL2C	0x00000252
%define StairR2C	0x00000253
%define StairT2C	0x00000254
%define StairL2D	0x00000255
%define StairR2D	0x00000256
%define StairT2D	0x00000257

%define StairL3A	0x00000258
%define StairR3A	0x00000259
%define StairT3A	0x0000025A
%define StairL3B	0x0000025B
%define StairR3B	0x0000025C
%define StairT3B	0x0000025D
%define StairL3C	0x0000025E
%define StairR3C	0x0000025F
%define StairT3C	0x00000260
%define StairL3D	0x00000261
%define StairR3D	0x00000262
%define StairT3D	0x00000263

%define StairL4A	0x00000264
%define StairR4A	0x00000265
%define StairT4A	0x00000266
%define StairL4B	0x00000267
%define StairR4B	0x00000268
%define StairT4B	0x00000269
%define StairL4C	0x0000026A
%define StairR4C	0x0000026B
%define StairT4C	0x0000026C
%define StairL4D	0x0000026D
%define StairR4D	0x0000026E
%define StairT4D	0x0000026F

%define StairL5A	0x00000270
%define StairR5A	0x00000271
%define StairT5A	0x00000272
%define StairL5B	0x00000273
%define StairR5B	0x00000274
%define StairT5B	0x00000275
%define StairL5C	0x00000276
%define StairR5C	0x00000277
%define StairT5C	0x00000278
%define StairL5D	0x00000279
%define StairR5D	0x0000027A
%define StairT5D	0x0000027B
%define StairL5E	0x0000027C
%define StairR5E	0x0000027D
%define StairT5E	0x0000027E
%define StairL5F	0x0000027F
%define StairR5F	0x00000280
%define StairT5F	0x00000281
%define StairL5G	0x00000282
%define StairR5G	0x00000283
%define StairT5G	0x00000284
%define StairL5H	0x00000285
%define StairR5H	0x00000286
%define StairT5H	0x00000287

%define StairL6A	0x00000288
%define StairR6A	0x00000289
%define StairT6A	0x0000028A
%define StairL6B	0x0000028B
%define StairR6B	0x0000028C
%define StairT6B	0x0000028D
%define StairL6C	0x0000028E
%define StairR6C	0x0000028F
%define StairT6C	0x00000291
%define StairL6D	0x00000292
%define StairR6D	0x00000293
%define StairT6D	0x00000294

;Groud Obejcts
%define GOBJL1		0x000002A0
%define GOBJR1		0x000002A1
%define GOBJT1		0x000002A2
%define GOBJL2		0x000002A3
%define GOBJR2		0x000002A4
%define GOBJT2		0x000002A5
%define GOBJL3		0x000002A6
%define GOBJR3		0x000002A7
%define GOBJT3		0x000002A8
%define GOBJL4		0x000002A9
%define GOBJR4		0x000002AA
%define GOBJT4		0x000002AB

;Ceilings
%define COBJL1		0x000002B0
%define COBJR1		0x000002B1
%define COBJT1		0x000002B2
%define COBJB1		0x000002B3
%define COBJL2		0x000002B4
%define COBJR2		0x000002B5
%define COBJT2		0x000002B6
%define COBJB2		0x000002B7
%define COBJL3		0x000002B8
%define COBJR3		0x000002B9
%define COBJT3		0x000002BA
%define COBJB3		0x000002BB
%define COBJL4		0x000002BC
%define COBJR4		0x000002BD
%define COBJT4		0x000002BE
%define COBJB4		0x000002BF
%define COBJL5		0x000002C0
%define COBJR5		0x000002C1
%define COBJT5		0x000002C2
%define COBJB5		0x000002C3
%define COBJL6		0x000002C4
%define COBJR6		0x000002C5
%define COBJT6		0x000002C6
%define COBJB6		0x000002C7

;Metal Blocks
%define MetalL1		0x000002CA
%define MetalR1		0x000002CB
%define MetalT1		0x000002CC

;Mystery Blocks
%define MystL1		0x000002D0
%define MystR1		0x000002D1
%define MystT1		0x000002D2
%define MystB1		0x000002D3
%define MystL2		0x000002D4
%define MystR2		0x000002D5
%define MystT2		0x000002D6
%define MystB2		0x000002D7
%define MystL3		0x000002D8
%define MystR3		0x000002D9
%define MystT3		0x000002DA
%define MystB3		0x000002DB
%define MystL4		0x000002DC
%define MystR4		0x000002DD
%define MystT4		0x000002DE
%define MystB4		0x000002DF
%define MystL5		0x000002E0
%define MystR5		0x000002E1
%define MystT5		0x000002E2
%define MystB5		0x000002E3
%define MystL6		0x000002E4
%define MystR6		0x000002E5
%define MystT6		0x000002E6
%define MystB6		0x000002E7
%define MystL7		0x000002E8
%define MystR7		0x000002E9
%define MystT7		0x000002EA
%define MystB7		0x000002EB

;Mystery Block Flags
%define MystF1		0x000002F0
%define MystF2		0x000002F1
%define MystF3		0x000002F2
%define MystF4		0x000002F3
%define MystF5		0x000002F4
%define MystF6		0x000002F5
%define MystF7		0x000002F6

;Mystery Block Texture Flags
%define MystTex1	0x000002F7
%define MystTex2	0x000002F8
%define MystTex3	0x000002F9
%define MystTex4	0x000002FA
%define MystTex5	0x000002FB
%define MystTex6	0x000002FC
%define MystTex7	0x000002FD

;Invisible Blocks
%define InvisL1		0x00000300
%define InvisR1		0x00000301
%define InvisT1		0x00000302
%define InvisB1		0x00000303
%define InvisL2		0x00000304
%define InvisR2		0x00000305
%define InvisT2		0x00000306
%define InvisB2		0x00000307
%define InvisL3		0x00000308
%define InvisR3		0x00000309
%define InvisT3		0x0000030A
%define InvisB3		0x0000030B
%define InvisL4		0x0000030C
%define InvisR4		0x0000030D
%define InvisT4		0x0000030E
%define InvisB4		0x0000030F
%define InvisL5		0x00000310
%define InvisR5		0x00000311
%define InvisT5		0x00000312
%define InvisB5		0x00000313
%define InvisL6		0x00000314
%define InvisR6		0x00000315
%define InvisT6		0x00000316
%define InvisB6		0x00000317

;Invisible Block Flags
%define InvisF1		0x00000318
%define InvisF2		0x00000319
%define InvisF3		0x0000031A
%define InvisF4		0x0000031B
%define InvisF5		0x0000031C
%define InvisF6		0x0000031D

;Invisible Block make Visible Flags
%define VisF1		0x00000320
%define VisF2		0x00000321
%define VisF3		0x00000322
%define VisF4		0x00000323
%define VisF5		0x00000324
%define VisF6		0x00000325

;Axe
%define AxeL1		0x00000330
%define AxeR1		0x00000331
%define AxeT1		0x00000332
%define AxeF1		0x00000333

;Trap
%define TrapL1		0x00000334
%define TrapR1		0x00000335
%define TrapT1		0x00000336
%define TrapF1		0x00000337

;;Enemie and Item Defines
;;(16 Goombas, 100pts each; 500pts Koopa; Koopa Shell; Bowser)
;;(2-3 Mushrooms, 1000pts each; 1-Up; Star, 1000pts; ~43 Coints, 200pts each)

;Mushroom
%define MushL1		0x00000340
%define MushR1		0x00000341
%define MushT1		0x00000342
%define MushB1		0x00000343
%define MushL2		0x00000344
%define MushR2		0x00000345
%define MushT2		0x00000346
%define MushB2		0x00000347

%define MushF1		0x0000034A							;Normal flag but 2 = Used
%define MushF2		0x0000034B							;Normal flag but 2 = Used

%define MushX1		0x0000034C
%define MushY1		0x0000034D
%define MushX2		0x0000034E
%define MushY2		0x0000034F

;Coin
%define CoinL1		0x00000350
%define CoinR1		0x00000351
%define CoinT1		0x00000352
%define CoinB1		0x00000353
%define CoinL2		0x00000354
%define CoinR2		0x00000355
%define CoinT2		0x00000356
%define CoinB2		0x00000357
%define CoinL3		0x00000358
%define CoinR3		0x00000359
%define CoinT3		0x0000035A
%define CoinB3		0x0000035B
%define CoinL4		0x0000035C
%define CoinR4		0x0000035D
%define CoinT4		0x0000035E
%define CoinB4		0x0000035F
%define CoinL5		0x00000360
%define CoinR5		0x00000361
%define CoinT5		0x00000362
%define CoinB5		0x00000363
%define CoinL6		0x00000364
%define CoinR6		0x00000365
%define CoinT6		0x00000366
%define CoinB6		0x00000367

;Coin Flag
%define CoinF1		0x00000370							;Normal flags but 2 = Used
%define CoinF2		0x00000371
%define CoinF3		0x00000372
%define CoinF4		0x00000373
%define CoinF5		0x00000374
%define CoinF6		0x00000375

%define CoinID		0x00000369							; Coin Region ID 
mov T1,			109
mov [CoinID],		T1

%define CoinIDwt	0x0000036A							; Coin ID wait, a driver that slows down the animation process, 0 = go, 1 = wait
mov T1,			0
mov [CoinIDwt],		T1

%define character	0x0000036B							; ID for which character to play, 0 = Matt, 1 = Joe - references respective files
mov T1,			0
mov [character],	T1

;One Up
%define OneUpL1		0x0000037A
%define OneUpR1		0x0000037B
%define OneUpT1		0x0000037C
%define OneUpB1		0x0000037D
%define OneUpF1		0x0000037F
%define OneUpX1		0x00000380
%define OneUpY1		0x00000381

;Goomba
%define GoomL1		0x00000390
%define GoomR1		0x00000391
%define GoomT1		0x00000392
%define GoomB1		0x00000393
%define GoomX1		0x00000394
%define GoomY1		0x00000396
%define GoomL2		0x00000397
%define GoomR2		0x00000398
%define GoomT2		0x00000399
%define GoomB2		0x0000039A
%define GoomX2		0x0000039B
%define GoomY2		0x0000039C
%define GoomL3		0x0000039D
%define GoomR3		0x0000039E
%define GoomT3		0x0000039F
%define GoomB3		0x000003A0
%define GoomX3		0x000003A1
%define GoomY3		0x000003A2
%define GoomL4		0x000003A3
%define GoomR4		0x000003A4
%define GoomT4		0x000003A5
%define GoomB4		0x000003A6
%define GoomX4		0x000013A7
%define GoomY4		0x000003A8
%define GoomL5		0x000003A9
%define GoomR5		0x000003AA
%define GoomT5		0x000003AB
%define GoomB5		0x000003AC
%define GoomX5		0x000003AD
%define GoomY5		0x000003AE
%define GoomL6		0x000003AF
%define GoomR6		0x000003B0
%define GoomT6		0x000003B1
%define GoomB6		0x000003B2
%define GoomX6		0x000003B3
%define GoomY6		0x000003B4
%define GoomL7		0x000003B5
%define GoomR7		0x000003B6
%define GoomT7		0x000003B7
%define GoomB7		0x000003B8
%define GoomX7		0x000003B9
%define GoomY7		0x000003BA
%define GoomL8		0x000013BC
%define GoomR8		0x000013BD
%define GoomT8		0x000013BE
%define GoomB8		0x000013BF
%define GoomX8		0x000013C0
%define GoomY8		0x000013C1
%define GoomL9		0x000003C2
%define GoomR9		0x000003C3
%define GoomT9		0x000003C4
%define GoomB9		0x000003C5
%define GoomX9		0x000003C6
%define GoomY9		0x000003C7
%define GoomL10		0x000003C8
%define GoomR10		0x000003C9
%define GoomT10		0x000003CA
%define GoomB10		0x000003CB
%define GoomX10		0x000003CC
%define GoomY10		0x000003CD
%define GoomL11		0x000003CE
%define GoomR11		0x000003CF
%define GoomT11		0x000003D0
%define GoomB11		0x000003D1
%define GoomX11		0x000003D2
%define GoomY11		0x000003D3
%define GoomL12		0x000003D4
%define GoomR12		0x000003D5
%define GoomT12		0x000003D6
%define GoomB12		0x000003D7
%define GoomX12		0x000003D8
%define GoomY12		0x000003D9
%define GoomL13		0x000003DA
%define GoomR13		0x000003DB
%define GoomT13		0x000003DC
%define GoomB13		0x000003DD
%define GoomX13		0x000003DE
%define GoomY13		0x000003DF
%define GoomL14		0x000003E0
%define GoomR14		0x000003E1
%define GoomT14		0x000003E2
%define GoomB14		0x000003E3
%define GoomX14		0x000003E4
%define GoomY14		0x000003E5
%define GoomL15		0x000003E6
%define GoomR15		0x000003E7
%define GoomT15		0x000003E8
%define GoomB15		0x000003E9
%define GoomX15		0x000003EA
%define GoomY15		0x000003EB
%define GoomL16		0x000003EC
%define GoomR16		0x000003ED
%define GoomT16		0x000003EE
%define GoomB16		0x000003EF
%define GoomX16		0x000003F0
%define GoomY16		0x000003F1

;Goomba Flag
%define GoomF1		0x00000410
%define GoomF2		0x00000411
%define GoomF3		0x00000412
%define GoomF4		0x00000413
%define GoomF5		0x00000414
%define GoomF6		0x00000415
%define GoomF7		0x00000416
%define GoomF8		0x00000417
%define GoomF9		0x00000418
%define GoomF10		0x00000419
%define GoomF11		0x0000041A
%define GoomF12		0x0000041B
%define GoomF13		0x0000041C
%define GoomF14		0x0000041D
%define GoomF15		0x0000041E
%define GoomF16		0x0000041F

;Goomba Speed
%define GoomS1		0x00000430
%define GoomS2		0x00000431
%define GoomS3		0x00000432
%define GoomS4		0x00000433
%define GoomS5		0x00000434
%define GoomS6		0x00000435
%define GoomS7		0x00000436
%define GoomS8		0x00000437
%define GoomS9		0x00000438
%define GoomS10		0x00000439
%define GoomS11		0x0000043A
%define GoomS12		0x0000043B
%define GoomS13		0x0000043C
%define GoomS14		0x0000043D
%define GoomS15		0x0000043E
%define GoomS16		0x0000043F

;Goomba Ground
%define GoomG1		0x00000450
%define GoomG2		0x00000451
%define GoomG3		0x00000452
%define GoomG4		0x00000453
%define GoomG5		0x00000454
%define GoomG6		0x00000455
%define GoomG7		0x00000456
%define GoomG8		0x00000457
%define GoomG9		0x00000458
%define GoomG10		0x00000459
%define GoomG11		0x0000045A
%define GoomG12		0x0000045B
%define GoomG13		0x0000045C
%define GoomG14		0x0000045D
%define GoomG15		0x0000045E
%define GoomG16		0x0000045F

;Dummy Goomba
%define DGoomL		0x00000460
%define DGoomR		0x00000461
%define DGoomT		0x00000462
%define DGoomB		0x00000463
%define DGoomX		0x00000464
%define DGoomY		0x00000465
%define DGoomF		0x00000466
%define DGoomS		0x00000467
%define DGoomG		0x00000468

;Dummy Goomba 2
%define dGoomL		0x00000469
%define dGoomR		0x0000046A
%define dGoomT		0x0000046B
%define dGoomB		0x0000046C
%define dGoomX		0x0000046D
%define dGoomY		0x0000046E
%define dGoomF		0x0000006F
%define dGoomS		0x00000470
%define dGoomG		0x00000471

;Dummy Goomba 3
%define TGoomL		0x00000480
%define TGoomR		0x00000481
%define TGoomT		0x00000482
%define TGoomB		0x00000483
%define TGoomX		0x00000484
%define TGoomY		0x00000485
%define TGoomF		0x00000086
%define TGoomS		0x00000487
%define TGoomG		0x00000488

;Goomba ID stuff
%define GoomID		0x00000492
%define GoomRID		0x00000493
%define GoomRIDwt	0x00000494
mov T1,			0
mov [GoomRIDwt],	T1

;Koopa
%define KoopL1		0x000004A0
%define KoopR1		0x000004A1
%define KoopT1		0x000004A2
%define KoopB1		0x000004A3
%define KoopX1		0x000004A4
%define KoopY1		0x000004A5
%define KoopF1		0x000004A6
%define KoopS1		0x000004A7
%define KoopG1		0x000004A8
%define KoopRID		0x000004A9
%define KoopRIDwt	0x000004AA
mov T1,			0
mov [KoopRIDwt],	T1

;Band-aid for that koopa kerfluffle
%define Gtest		0x00001111




;Title
%define Apos		0x00001000
%define Bobpos		0x00001001

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Aliases
%define Command		GPU_Command
%define DrawRegion	GPUCommand_DrawRegion
%define DrawX 		GPU_DrawingPointX
%define DrawY		GPU_DrawingPointY
%define Region		GPU_SelectedRegion
%define Texture		GPU_SelectedTexture

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Call Game
call _main
hlt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Functions
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Regions and Draws
;;
_define_region:
	out GPU_RegionMinX,		R0
	out GPU_RegionMinY,		R1
	out GPU_RegionMaxX,		R2
	out GPU_RegionMaxY,		R3
	out GPU_RegionHotSpotX,		R4
	out GPU_RegionHotSpotY, 	R5
	ret

_define_topleft:
	out GPU_RegionMinX,		R0
	out GPU_RegionHotSpotX,		R0
	out GPU_RegionMinY,		R1
	out GPU_RegionHotSpotY,		R1
	out GPU_RegionMaxX,		R2
	out GPU_RegionMaxY,		R3
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define Matrix
;;	Takes T1 as texture, R7 as PYHT, R8 as PYHB
;;	Small is PYHT=8 and PYHB=7
;;	Big is PYHT=16 and PYHB=15
_define_matrix:
	out Texture,			T1
_matrix_loop:
	mov T2,				[RRL]
	mov R4,				[REND]
	mov R6,				[RID]
	mov T1,				R6
	igt T1,				R4					;Check if RID is > REND and if so stop
	jt T1,				_matrix_end
	out Region,			R6					;Send RID to Region
	mov T1,				X					;Put X in T1 as X will need to start at the same spot every loop
	mov T1,				0
	out GPU_RegionMinX,		T1
	iadd T1,			8
	out GPU_RegionHotSpotX,		T1
	iadd T1,			7
	out GPU_RegionMaxX,		T1
	mov T1,				Y					;Put Y in T1 as Y will need to start at the same spot every loop
	mov T1,				0
	out GPU_RegionMinY,		T1
	iadd T1,			R7
	out GPU_RegionHotSpotY,	T1
	iadd T1,			R8
	out GPU_RegionMaxY,		T1
	iadd R6,			1					;Add one to RID
	iadd X,				16					;Set X to next RID start
	mov [RID],			R6
	jmp _matrix_loop
;	mov T1,		X
;	ieq T1,		T2							;Check if X == RRL in order to know to go to next Row
;	jf T1,				_matrix_loop				;If not next row then start at new X on same row
;	mov X,				0					;If next Row indeed then reset X to 0 and set Y to next row start
;	iadd Y,				16
;	jmp				_matrix_loop
_matrix_end:
	ret

_draw_region_at:
	out DrawX,			X
	out DrawY,			Y
	out Command,			DrawRegion
	ret

_set_drawing_scale:
	out GPU_DrawingScaleX,		X
	out GPU_DrawingScaleY,  	Y
	ret

_scale:
	mov X,				2
	cif X								;Make int into float for set_drawing_scale
	mov Y,				2
	cif Y
	call _set_drawing_scale
	ret

_neg_scale_X:
	mov X,				2
	cif X
	isgn X								;Make X negative for mirror across Y axis
	mov Y,				2
	cif Y
	call _set_drawing_scale
	ret

_neg_scale_Y:
	mov X,				2
	cif X
	mov Y,				2
	cif Y
	isgn Y								;Make Y negative for mirror across X axis
	call _set_drawing_scale
	ret

_neg_scale_both:
	mov X,				2
	cif X
	isgn X								;Make X negative for mirror across Y axis
	mov Y,				2
	cif Y
	isgn Y								;Make Y negative for mirror across X axis
	call _set_drawing_scale
	ret

_draw_region_zoomed:
	out Command,GPUCommand_DrawRegionZoomed
	ret

_draw_region_zoomed_at:
	out DrawX,			X
	out DrawY,			Y
	out Command,GPUCommand_DrawRegionZoomed
	ret

_small_time:
	mov T1,				[Size]
	isub T1,			1
	mov [Size],			T1
	mov T1,				8
	mov [PYHD],			T1
	mov [PYHT],			T1
	mov T1,				7
	mov [PYHB],			T1
	mov T1,				280
	mov [SBGY],			T1
	mov T1,				16
	mov [DFC],			T1
	call _get_small
	ret

_big_time:
	mov T1,				[Size]
	iadd T1,			1
	mov [Size],			T1
	mov T1,				24
	mov [PYHD],			T1
	mov [PYHT],			T1
	mov T1,				7
	mov [PYHB],			T1
	mov T1,				264
	mov [SBGY],			T1
	mov T1,				32
	mov [DFC],			T1
	call _get_big
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Background Stuff
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define Background
;;	Takes T1 as Texture/Region
_define_background:
	out Texture,		T1
	out Region,		T1
	mov T1,			0
	mov T2, 		0
	mov X,			639
	mov Y,			339
	mov R4,			320
	mov R5,			170
	call _define_region
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define Backgrounds
;;	Takes R6 as end number
_define_backgrounds:
	mov Index,		1
_dbgs_loop:
	mov T1,			Index
	call _define_background
	mov T1,			Index
	ieq T1,			R6
	jt T1,			_dbgs_end
	iadd Index,		1
	jmp _dbgs_loop
_dbgs_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Print Background
;;	Takes T1 as Flag, T2 as X, T3 as Texture/Region, R10 as Y
_print_background:
	ieq T1,			0								;Chesks flag value for if active
	jf T1,			_print_background_end
	out Texture,		T3
	out Region, 		T3
	mov X,  		T2
	mov Y,			R10
	call _draw_region_zoomed_at
_print_background_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Print Backgrounds
;;	Takes T4 as end number
_print_backgrounds:
	mov Index,		0
_pbgs_loop:
	mov R7,			Index
	ieq R7,			T4
	jt R7,			_pbgs_end
	mov R7,			BGF1
	mov R8,			BGX1
	mov R9,			Index
	iadd R9,		1
	iadd R7,		Index
	iadd R8,		Index
	mov T1,			[R7]
	mov T2,			[R8]
	mov T3,			R9
	call _print_background
	iadd Index,		1
	jmp _pbgs_loop
_pbgs_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move Backgrounds
;;
_background_mover:
	mov T1,			[PX]
	mov T2,			[MoveScreen]
	igt T1,			T2
	mov T2,			[Side]
	ieq T2,			1
	and T1,			T2
	jf T1,			_bgc_end
	in Cntlr,		INP_GamepadRight			;Gamepad Value is loaded into Cntlr (positive if pressed, negative it not)
	mov T1,			0
	ilt T1,			Cntlr					;If < 0 then jump to up
	jf T1,			_bgc_end
_bg1c:
	mov T1,			[BGF1]
	ieq T1,			0
	jf T1,			_bg2c
	mov T2,			[Pspeed]
	mov T1,			[BGX1]
	isub T1,		T2
	mov [BGX1],		T1
_bg2c:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_bg3c
	mov T2,			[Pspeed]
	mov T1,			[BGX2]
	isub T1,		T2
	mov [BGX2],		T1
_bg3c:
	mov T1,			[BGF3]
	ieq T1,			0
	jf T1,			_bg4c
	mov T2,			[Pspeed]
	mov T1,			[BGX3]
	isub T1,		T2
	mov [BGX3],		T1
_bg4c:
	mov T1,			[BGF4]
	ieq T1,			0
	jf T1,			_bg5c
	mov T2,			[Pspeed]
	mov T1,			[BGX4]
	isub T1,		T2
	mov [BGX4],		T1
_bg5c:
	mov T1,			[BGF5]
	ieq T1,			0
	jf T1,			_bg6c
	mov T2,			[Pspeed]
	mov T1,			[BGX5]
	isub T1,		T2
	mov [BGX5],		T1
_bg6c:
	mov T1,			[BGF6]
	ieq T1,			0
	jf T1,			_bg7c
	mov T2,			[Pspeed]
	mov T1,			[BGX6]
	isub T1,		T2
	mov [BGX6],		T1
_bg7c:
	mov T1,			[BGF7]
	ieq T1,			0
	jf T1,			_bgc_end
	mov T2,			[Pspeed]
	mov T1,			[BGX7]
	isub T1,		T2
	mov [BGX7],		T1
_bgc_end:
	mov T1,			[PY]						;If PY < 100 Y then move background "up"
	ilt T1,			100
	jf T1,			_Y_bottom
	mov T1,			[BGY]
	iadd T1,		5
	mov [BGY],		T1
	jmp _end_Y
_Y_bottom:
	mov T1,			[PY]						;If PY > 200 Y then move background "down"
	igt T1,			200
	jf T1,			_end_Y
	mov T1,			[BGY]
	isub T1,		5
	mov T2,			T1
	mov [BGY],		T1
	ile T2,			28
	jf T2,			_end_Y
	mov T1,			28
	mov [BGY],		T1
_end_Y:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move Items/Enemies
;;
_background_item_ememy_mover:
_bgiem1c:
	mov T1,			[BGF1]
	ieq T1,			0
	jf T1,			_bgiem2c
	;Mushroom 1
	mov R4,			MushF1
	mov R8,			MushX1
	mov R9,			MushY1
	call _move_item
	call _Item_C_main
	;Goomba 1
	mov R4,			GoomF1
	mov R6,			[GoomS1]
	mov R7,			[GoomG1]
	mov R8,			GoomX1
	mov R9,			GoomY1
	call _move_goomba
_bgiem2c:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_bgiem3c
	;OneUp
	mov R4,			OneUpF1
	mov R8,			OneUpX1
	mov R9,			OneUpY1
	call _move_item
	call _Item_C_main
	;Goomba 2
	mov R4,			GoomF2
	mov R6,			[GoomS2]
	mov R7,			[GoomG2]
	mov R8,			GoomX2
	mov R9,			GoomY2
	call _move_goomba
	;Goomba 3
	mov R4,			GoomF3
	mov R6,			[GoomS3]
	mov R7,			[GoomG3]
	mov R8,			GoomX3
	mov R9,			GoomY3
	call _move_goomba
	;Goomba 4
	mov R4,			GoomF4
	mov R6,			[GoomS4]
	mov R7,			[GoomG4]
	mov R8,			GoomX4
	mov R9,			GoomY4
	call _move_goomba
	;Goomba 5
	mov R4,			GoomF5
	mov R6,			[GoomS5]
	mov R7,			[GoomG5]
	mov R8,			GoomX5
	mov R9,			GoomY5
	call _move_goomba
	;Goomba 6
	mov R4,			GoomF6
	mov R6,			[GoomS6]
	mov R7,			[GoomG6]
	mov R8,			GoomX6
	mov R9,			GoomY6
	call _move_goomba
_bgiem3c:
	mov T1,			[BGF3]
	ieq T1,			0
	jf T1,			_bgiem4c
	;Goomba 7
	mov R4,			GoomF7
	mov R6,			[GoomS7]
	mov R7,			[GoomG7]
	mov R8,			GoomX7
	mov R9,			GoomY7
	call _move_goomba
	;Goomba 8
	mov R4,			GoomF8
	mov R6,			[GoomS8]
	mov R7,			[GoomG8]
	mov R8,			GoomX8
	mov R9,			GoomY8
	call _move_goomba
	;Goomba 9
	mov R4,			GoomF9
	mov R6,			[GoomS9]
	mov R7,			[GoomG9]
	mov R8,			GoomX9
	mov R9,			GoomY9
	call _move_goomba
	;Goomba 10
	mov R4,			GoomF10
	mov R6,			[GoomS10]
	mov R7,			[GoomG10]
	mov R8,			GoomX10
	mov R9,			GoomY10
	call _move_goomba
_bgiem4c:
	mov T1,			[BGF4]
	ieq T1,			0
	jf T1,			_bgiem5c
	;Goomba 11
	mov R4,			GoomF11
	mov R6,			[GoomS11]
	mov R7,			[GoomG11]
	mov R8,			GoomX11
	mov R9,			GoomY11
	call _move_goomba
	;Goomba 12
	mov R4,			GoomF12
	mov R6,			[GoomS12]
	mov R7,			[GoomG12]
	mov R8,			GoomX12
	mov R9,			GoomY12
	call _move_goomba
	;Goomba 13
	mov R4,			GoomF13
	mov R6,			[GoomS13]
	mov R7,			[GoomG13]
	mov R8,			GoomX13
	mov R9,			GoomY13
	call _move_goomba
	;Goomba 14
	mov R4,			GoomF14
	mov R6,			[GoomS14]
	mov R7,			[GoomG14]
	mov R8,			GoomX14
	mov R9,			GoomY14
	call _move_goomba
_bgiem5c:
	mov T1,			[BGF5]
	ieq T1,			0
	jf T1,			_bgiem6c
	;Goomba 15
	mov R4,			GoomF15
	mov R6,			[GoomS15]
	mov R7,			[GoomG15]
	mov R8,			GoomX15
	mov R9,			GoomY15
	call _move_goomba
	;Goomba 16
	mov R4,			GoomF16
	mov R6,			[GoomS16]
	mov R7,			[GoomG16]
	mov R8,			GoomX16
	mov R9,			GoomY16
	call _move_goomba
_bgiem6c:
	mov T1,			[BGF6]
	ieq T1,			0
	jf T1,			_bgiem7c
_bgiem7c:
	mov T1,			[BGF7]
	ieq T1,			0
	jf T1,			_bgiemc_end
	;Koopa 1
	mov R4,			KoopF1
	mov R6,			[KoopS1]
	mov R7,			[KoopG1]
	mov R8,			KoopX1
	mov R9,			KoopY1
	call _move_goomba
_bgiemc_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Pipe Stuff
;;
;;	Takes X for [PX], Y for [PY], R6 for [PipeLeft], R7 for [PipeRight], R8 for [PipeTop], R10 for [PYHB]
_pipe_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
_pipe_checker:
	mov T1,			X			;Check Player X + distance to center (dtc) is == Left of Pipe
	iadd T1,		8
	mov T2,			T1
	ile T1,			R6
	mov T3,			R6
	isub T3,		6
	ige T2,			T3
	and T1,			T2
	jt T1,			_pipe_left
	mov T1,			X			;Check PX + dtc == Right of Pipe
	isub T1,		8
	mov T2,			T1
	ige T1,			R7
	mov T3,			R7
	iadd T3,		6
	ile T2,			T3
	and T1,			T2
	jt T1,			_pipe_right
	jmp _pipe_top
_pipe_left:
	mov T1,			Y			;Check Player Y + dtc == Pipe Top( BGY(28) + 204 = 232) - 64 = 168
	mov T2,			R8
	igt T1,			T2
	jf T1,			_pipe_top
	mov X,			R6
	isub X,			20
	mov [PX],		X
	jmp _pipe_end
_pipe_right:
	mov T1,			Y
	mov T2,			R8
	igt T1,			T2
	jf T1,			_pipe_top
	mov X,			R7
	iadd X,			14
	mov [PX],		X
	jmp _pipe_end
_pipe_top:
	mov T1,			X
	iadd T1,		8
	mov T3,			R6
	ige T1,			T3
	mov T2,			X
	isub T2,		8
	mov T3,			R7
	ile T2,			T3
	and T1,			T2
	jf T1,			_pipe_end
	mov T1,			Y
	iadd T1,		R10
	mov T2,			R8
	mov T3,			[DFC]
	isub T2,		T3
	ige T1,			T2					;If on pipe then continue, if not then end
	jf T1,			_pipe_end
	mov Y,			R8
	mov T3,			[DFC]
	isub Y,			T3
	mov [PY],		Y
	mov [CBGY],		Y
	mov T1,			0
	mov [Ground],		T1
	isub Y,			172
	mov [HighPoint],	Y
_pipe_end:
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Brick Stuff
;;
;;	X for [PX], Y for [PY], R4 for Flag, R6 for [BrickLeft], R7 for [BrickRight], R8 for [BrickTop], R9 for [BrickBottom], R10 for [PYHB]
_brick_check:
	push R0			;T1
	push R1			;T2
	push R2			;Player X
	push R3			;Player Y
	push R4			;Flag
	push R5			;T3
	push R6			;BL
	push R7			;BR
	push R8			;BT
	push R9			;BB
	push R10		;PYHD
	push R11
	push R12		;Mystery Block Visual Flag
	push R13
	mov R10,		T2
	mov R12,		R5
_brick_state:								;Check Active Status
	mov T1,			[R4]
	ieq T1,			1
	jf T1,			_brick_checker
_brick_position:
	mov T1,			R6					;Check if Brick is on screen
	ile T1,			640
	mov T2,			R7
	ige T2,			0
	and T1,			T2
	jf T1,			_brick_end_plus				;If so then set status to active
	mov T1,			0
	mov [R4],		T1
_brick_checker:
	mov T1,			X					;Check if player is left of the brick, if so go to that function
	iadd T1,		8
	mov T2,			T1
	ile T1,			R6
	mov T3,			R6
	isub T3,		6
	ige T2,			T3
	and T1,			T2
	jt T1,			_brick_left
	mov T1,			X					;Check if player is right of the brick, if so go to that function
	isub T1,		8
	mov T2,			T1
	ige T1,			R7
	mov T3,			R7
	iadd T3,		6
	ile T2,			T3
	and T1,			T2
	jt T1,			_brick_right
	jmp _brick_check_Y						;If neither then check the Y's of the Player v/s Brick
_brick_left:
	mov T1,			Y					;Is Player between top and bottom of brick?
	mov T3,			R8
	igt T1,			T3
	mov T2,			Y
	isub T2,		R10
	mov T3,			R9
	ilt T2,			T3
	and T1,			T2					;If not then check the Y's
	jf T1,			_brick_check_Y
	mov X,			R6
	isub X,			20
	mov [PX],		X
	jmp _brick_check_Y
_brick_right:
	mov T1,			Y					;Is Player between top and bottom of brick?
	mov T3,			R8
	igt T1,			T3
	mov T2,			Y
	isub T2,		R10
	mov T3,			R9
	ilt T2,			T3
	and T1,			T2					;If not check the Y's
	jf T1,			_brick_check_Y
	mov X,			R7
	iadd X,			12
	mov [PX],		X
_brick_check_Y:
	mov T1,			X					;Is Player between left and right of brick?
	iadd T1,		8
	mov T3,			R6
	ige T1,			T3
	mov T2,			X
	isub T2,		8
	mov T3,			R7
	ile T2,			T3
	and T1,			T2
	jf T1,			_brick_end				;If not then stop
	mov T1,			Y					;Is Player below the brick?
	isub T1,		R10
	mov T3,			R8
	ige T1,			T3
	mov T2,			Y
	isub T2,		R10
	mov T3,			R9
	iadd T3,		16
	ile T2,			T3
	and T1,			T2
	jt T1,			_brick_bottom				;If so then go to that function
	mov T1,			Y					;Is Player above the brick?
	iadd T1,		R10
	mov T3,			R8
	mov R11,		[DFC]
	isub T3,		R11
	ige T1,			T3
	mov T2,			Y
	isub T2,		R10
	mov T3,			R9
	ile T2,			T3
	and T1,			T2
	jt T1,			_brick_top				;Then go to that function
	jmp _brick_end							;If not then end
_brick_top:
	mov Y,			R8
	mov R11,		[DFC]
	isub Y,			R11
	mov [PY],		Y
	mov [CBGY],		Y
	mov T1,			0
	mov [Ground],		T1
	isub Y,			172
	mov [HighPoint],	Y
	jmp _brick_end
_brick_bottom:
	mov T1,			2
	mov [Ground],		T1
_invis_update_checker2:							;Check if MEMADD is for Invisble Blocks
	mov T1,			R4
	ige T1,			792
	mov T2,			R4
	ile T2,			797
	and T1,			T2
	jf T1,			_brick_mystery_check
_invis_updater2:
	mov T1,			0
	mov [R12],		T1
	mov T1,			R4
	ieq T1,			792
	jf T1,			_brick_itemID_check
	mov T1,			0
	mov [OneUpF1],		T1
	jmp _brick_itemID_check
_brick_mystery_check:							;Check if MEMADD is for Mystery Blocks
	mov T1,			R4
	ige T1,			752
	mov T2,			R4
	ile T2,			758
	and T1,			T2
	jf T1,			_brick_itemID_check
_brick_mystery_updater:
	mov T1,			R4
	iadd T1,		7
	mov T2,			102
	mov [T1],		T2
_brick_itemID_check:
	mov T1,			[ItemID]
	ige T1,			1
	jt T1,			_brick_item_found
	jmp _brick_end
_brick_item_found:
	mov T1,			[R12]
	ieq T1,			2
	jt T1,			_brick_end
	mov T1,			0
	mov [R12],		T1
	jmp _brick_end
_brick_end:
	mov T1,			R7					;Check if BrickR is < 0 and if so then update that Brick Flag to Dead
	ilt T1,			0
	jf T1,			_brick_end_plus
	mov T1,			1
	mov [R4],		T1
	mov [R12],		T1
_brick_mystery_check2:							;Check if MEMADD is for Mystery Blocks
	mov T1,			R4
	ige T1,			752
	mov T2,			R4
	ile T2,			758
	and T1,			T2
	jf T1,			_brick_end_plus
	mov T1,			R4					;Make Mystery Blocks Hard Blocks
	iadd T1,		7
	mov T2,			101
	mov [T1],		T2
_brick_end_plus:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Brick Maker
;;	T2 is [BGX#], T3 is BrickL# ,T4 is X sub number, T5 is Y add number
_brick_maker:
	mov T1,			T2
	iadd T1,		640
	isub T1,		T4
	mov [T3],		T1		;L
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;R
	iadd T3,		1
	mov T1,			[BGY]
	iadd T1,		T5
	mov [T3],		T1		;T
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;B
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Brick Boundaries
;;	 T2 for [PYHB], R5 for Visual Flag, R10 is BrickF#, R11 is BrickL#, R12 is how many bricks
_brick_boundaries:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov Index,		0
_bbi:
	mov T1,			Index
	ieq T1,			R12
	jt T1,			_bb_end
	mov R4,			R10		;F
	iadd R10,		1
	mov R6,			[R11]		;L
	iadd R11,		1
	mov R7,			[R11]		;R
	iadd R11,		1
	mov R8,			[R11]		;T
	iadd R11,		1
	mov R9,			[R11]		;B
	iadd R11,		1
_bb_con:
	call _brick_check
	iadd Index,		1
	jmp _bbi
_bb_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Brick Draw
;;	R3 is end number, T4 is starting BrickL# MA, T5 is starting BrickT# MA, R8 is region number
_draw_brick:
	mov Index,		0
_draw_brick_loop:
	mov T1,			Index
	ieq T1,			T3
	jt T1,			_draw_brick_end
	out Texture,		0
	out Region,		R8
	mov X,			[T4]
	mov Y,			[T5]
	call _draw_region_zoomed_at
	iadd T4,		4
	iadd T5,		4
	iadd Index,		1
	jmp _draw_brick_loop
_draw_brick_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Hole Stuff
;;
;;	X as [PX], Y as [PY], R6 as [HoleL#], R7 as [HoleR#], R8 as [HoleT#], R10 as [PYHB], R11 as [BGF2], R12 as [HoleL1], R13 as [HoleR1]
_hole_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_hole_checker:
	mov T1,			[BGF2]
	ieq T1,			0
	jf T1,			_hole_time
	mov T1,			X					;Check if player is between hole 1 X's
	isub T1,		8
	ige T1,			R12
	mov T2,			X
	iadd T2,		8
	ilt T2,			R13
	and T1,			T2
	jt T1,			_ground_change
_hole_time:
	mov T1,			X					;Check if player is between hole X's
	isub T1,		8
	ige T1,			R6
	mov T2,			X
	iadd T2,		8
	ilt T2,			R7
	and T1,			T2
	jf T1,			_hole_resetter				;If not then keep ground at current level, if so then change ground lvl
_ground_change:
	mov T1,			[SBGY]					;Only want to add 100 once so see if SBGY > 300
	ilt T1,			300
	jf T1,			_hole_check_Y				;If so then don't change ground lvl again
	mov T1,			[SBGY]
	iadd T1,		100
	mov [GroundY],		T1
	mov [SBGY],		T1
	jmp _hole_check_Y
_hole_resetter:
	mov T1,			[SBGY]					;Only want to sub 100 once so see if SBGY < 300
	ilt T1,			300
	jt T1,			_hole_check_end				;If so then don't change ground lvl again
	mov T1,			[SBGY]
	isub T1,		100
	mov [GroundY],		T1
	mov [SBGY],		T1
	jmp _hole_check_end
_hole_check_Y:
	mov T1,			Y
	igt T1,			312
	jf T1,		 	_hole_check_end
	mov T1,			0
	mov [Size],		T1
_hole_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Scalable Hitbox stuff
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Stair Boundaries
;;	 R6 for Background X, R7 for StairL##, R8 for first starting point, R9 for first length, R10 for first BGY sub num, R11 for how many step, R12: 0=Left, 1=Right
_stair_boundaries:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov Index,		0
_stair_loop:
	mov T1,			Index
	ieq T1,			R11
	jt T1,			_stair_end
	mov T1,			R6
	iadd T1,		640
	isub T1,		R8
	mov [R7],		T1
	iadd R7,		1
	iadd T1,		R9
	mov [R7],		T1
	iadd R7,		1
	mov T1,			[BGY]
	iadd T1,		R10
	mov [R7],		T1
_next_stair:
	iadd Index,		1
	iadd R7,		1
	mov T1,			R12
	ieq T1,			1
	jt T1,			_stair_is
	isub R8,		32
_stair_is:
	isub R9,		32
	isub R10,		32
	jmp _stair_loop
_stair_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Stair Check
;;	 X for [PX], Y for [PY], T2 for start mem add Stair##, R9 for number of steps, R10 for [PYHB]
_stair_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov Index,		0
_stair_checker:
	mov T1,			Index
	ieq T1,			R9
	jt T1,			_stair_check_end
	mov R6,			[R11]				;L
	iadd R11,		1
	mov R7,			[R11]				;R
	iadd R11,		1
	mov R8,			[R11]				;T
	iadd R11,		1
	call _pipe_check
	iadd Index,		1
	jmp _stair_checker	
_stair_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ceiling Maker
;;	T2 is [BGX#], T3 is COBJL# ,T4 is X sub number, T5 is Y add number, R9 is length, R10 is height
_ceiling_maker:
	mov T1,			T2
	iadd T1,		640
	isub T1,		T4
	mov [T3],		T1		;L
	iadd T3,		1
	iadd T1,		R8
	mov [T3],		T1		;R
	iadd T3,		1
	mov T1,			[BGY]
	iadd T1,		T5
	mov [T3],		T1		;T
	iadd T3,		1
	iadd T1,		R10
	mov [T3],		T1		;B
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ceiling Boundaries
;;	 T2 for [PYHB], R10 is BrickF#, R11 is BrickL#, R12 is how many bricks
_ceiling_boundaries:
	mov R6,			[R11]		;L
	iadd R11,		1
	mov R7,			[R11]		;R
	iadd R11,		1
	mov R8,			[R11]		;T
	iadd R11,		1
	mov R9,			[R11]		;B
	iadd R11,		1
	call _brick_check
_ceiling_boundaries_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Items
;;
;; X is [PX], Y is [PY], R4 is ItemF#, R6 is ItemL#
_item_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_item_flag_ckecker:
	mov T1,			[R4]
	ieq T1,			0
	jf T1,			_item_check_end
_item_position_checker:
	mov T3,			R6				;L
	mov T1,			[T3]
	igt T1,			640
	iadd T3,		1				;R
	mov T2,			[T3]
	ilt T2,			0
	or T1,			T2
	jf T1,			_item_checker
	mov T1,			2
	mov [R4],		T1
	mov [Ispeed],		T1
_item_checker:
	mov T1,			X				;Check Player X and Item X against each other
	mov T3,			[R6]
	ige T1,			T3
	iadd R6,		1
	mov T2,			X
	mov T3,			[R6]
	ile T2,			T3
	iadd R6,		1
	and T1,			T2
	mov T2,			Y				;Same but with Y's
	iadd T2,		8
	mov T3,			[R6]
	ige T2,			T3
	iadd R6,		1
	and T1,			T2
	mov T2,			Y
	mov T3,			[R6]
	ile T2,			T3
	and T1,			T2
	jf T1,			_item_check_end
_item_found:
	mov T1,			R4
	mov T3,			MushF1
	ige T1,			T3				;Literal MushF1 mem add value;843
	mov T2,			R4
	mov T3,			MushF2
	ile T2,			T3				;Literal MushF3 mem add value;845
	and T1,			T2
	jt T1,			_item_mushroom
	mov T1,			R4
	mov T3,			CoinF1
	ige T1,			T3				;Literal CoinF1 mem add value;864
	mov T2,			R4
	mov T3,			CoinF6
	ile T2,			T3				;Literal CoinF4 mem add value;868/70
	and T1,			T2
	jt T1,			_item_coin
	mov T1,			R4
	mov T3,			OneUpF1
	ieq T1,			T3
	jt T1,			_item_oneup
	jmp _item_check_end
_item_mushroom:

	mov T1,			9
	out SPU_SelectedSound,	T1
	mov T1,			9
	out SPU_SelectedChannel,T1
	mov T1,			9
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

	mov T1,			[Score]
	iadd T1,		1000
	mov [Score],		T1
	mov T1,			2
	mov [R4],		T1
	mov [Ispeed],		T1
	call _big_time
	jmp _item_check_end
_item_coin:

	mov T1,			8
	out SPU_SelectedSound,	T1
	mov T1,			8
	out SPU_SelectedChannel,T1
	mov T1,			8
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

	mov T1,			[Score]
	iadd T1,		200
	mov [Score],		T1
	mov T1,			2
	mov [R4],		T1
	jmp _item_check_end
_item_oneup:

	mov T1,			9
	out SPU_SelectedSound,	T1
	mov T1,			9
	out SPU_SelectedChannel,T1
	mov T1,			9
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

	mov T1,			[Score]
	iadd T1,		1000
	mov [Score],		T1
	mov T1,			2
	mov [R4],		T1
	mov [Ispeed],		T1
	mov T1,			[Lives]
	iadd T1,		1
	mov [Lives],		T1
	mov T1,			220
	mov [GroundI],		T1
_item_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Item Maker
;;	 T2 is [BGX#], T3 is ItemL#, T4 is X sub number, T5 is Y add number
_item_maker:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_item_mushroom_left_check:			;If ItemL# is Mush1/2 or OneUpL1 then add 16 from T4
	mov T1,			T3
	ieq T1,			MushL1
	jt T1,			_mushroom_XY_accounted
	mov T1,			T3
	ieq T1,			MushL2
	jt T1,			_mushroom_XY_accounted
	mov T1,			T3
	ieq T1,			OneUpL1
	jt T1,			_mushroom_XY_accounted
	jmp _item_updater
_mushroom_XY_accounted:
	iadd T4,		16
	iadd T5,		16
_item_updater:
	mov T1,			T2
	iadd T1,		640
	isub T1,		T4
	mov [T3],		T1		;L
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;R
	iadd T3,		1
	mov T1,			[BGY]
	iadd T1,		T5
	mov [T3],		T1		;T
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;B
_item_maker_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Item Draw
;;	 R6 is [ItemF#], R7 is [ItemL#], R8 is [ItemT#], R9 is Region Number
_draw_item:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov T1,			R6
	ieq T1,			0
	jf T1,			_draw_item_end
_draw_item_real:
	out Texture,		0
	out Region,		R9
	mov X,			R7
	mov Y,			R8
	call _draw_region_zoomed_at
_draw_item_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Item Move
;;	 R4 is ItemF#, R8 is ItemX#, R9 is ItemY#
_move_item:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_move_item_flag_check:
	mov T1,			[R4]
	ieq T1,			0
	jf T1,			_move_item_end
_move_item_position_check:
	mov T1,			[R8]			;X
	mov T2,			[Ispeed]
	isub T1,		T2
	mov [R8],		T1
	mov T1,			[R9]			;Y
	iadd T1,		5
	mov [R9],		T1
	mov T2,			[GroundI]		;Gravity/Movement
	ige T1,			T2
	jf T1,			_move_item_end
	mov T2,			[GroundI]
	mov T1,			T2
	mov [R9],		T1
_move_item_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Trap Darw
;;
_trap_draw:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov Index,		0
	mov T2,			[TrapL1]
_trap_drawer:
	mov T1,			Index
	ieq T1,			13
	jt T1,			_trap_draw_end
	out Texture,		0
	out Region,		105
	mov X,			T2
	mov Y,			[TrapT1]
	call _draw_region_zoomed_at
	iadd T2,		32
	iadd Index,		1
	jmp _trap_drawer
_trap_draw_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enemies
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Maker
;;	T2 is [BGX#], T3 is GoomL#, T4 is X sub number, T5 is Y add number
_goomba_maker:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_goomba_updater:
	mov T1,			T2
	iadd T1,		640
	isub T1,		T4
	mov [T3],		T1		;L
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;R
	iadd T3,		1
	mov T1,			[BGY]
	iadd T1,		T5
	mov [T3],		T1		;T
	iadd T3,		1
	iadd T1,		32
	mov [T3],		T1		;B
_goomba_make_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Check
;;	X is [PX], Y is [PY], R4 is GoomF#, R6 is [GoomL#], R7 is [GoomR#], R8 is [GoomT#], R9 is [GoomB#], R11 is GoomY#, R12 is GoomRID
_goomba_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov R10,		[PYHB]
_goomba_flag_checker:
	mov T1,			[R4]
	ieq T1,			3					;3 is big dead; 2 is dying, 1 is not yet active, 0 is active
	jt T1,			_goomba_check_end
	mov T1,			[R4]
	ieq T1,			2
	jt T1,			_goomba_is_dead
_goomba_checker_position:
	mov T1,			R6
	ile T1,			640
	mov T2,			R7
	mov T3,			144					;If we want them to move wheil off screen and bounce between pipes then 288
	isgn T3
	ige T2,			T3
	and T1,			T2
	jf T1,			_goomba_check_lt0
	mov T1,			0
	mov [R4],		T1
	jmp _goomba_check_iframes
_goomba_check_lt0:
	mov T1,			R7
	ilt T1,			0
	jf T1,			_goomba_check_end
	mov T1,			3
	mov [R4],		T1
	jmp _goomba_check_end
_goomba_check_iframes:
	mov T1,		[Iframes]
	igt T1,		0
	jt T1,		_goomba_check_end
_goomba_checker_X:
	mov T1,			X
	iadd T1,		8
	mov T2,			T1
	ile T1,			R6
	mov T3,			R6
	isub T3,		6
	ige T2,			T3
	and T1,			T2
	jt T1,			_goomba_left
	mov T1,			X
	isub T1,		8
	mov T2,			T1
	ige T1,			R7
	mov T3,			R7
	iadd T3,		6
	ile T2,			T3
	and T1,			T2
	jt T1,			_goomba_right
	jmp _goomba_top
_goomba_left:
	mov T1,			Y
	mov T2,			R8
	igt T1,			T2
	jf T1,			_goomba_top
	call _small_time
	jmp _goomba_top
_goomba_right:
	mov T1,			Y
	mov T2,			R8
	igt T1,			T2
	jf T1,			_goomba_top
	call _small_time
	jmp _goomba_top
_goomba_top:
	mov T1,			X
	iadd T1,		8
	mov T3,			R6
	ige T1,			T3
	mov T2,			X
	isub T2,		8
	mov T3,			R7
	ile T2,			T3
	and T1,			T2
	jf T1,			_goomba_check_end
	mov T1,			Y
	iadd T1,		R10
	mov T2,			R8
	mov T3,			[DFC]
	isub T2,		T3
	ige T1,			T2
	jf T1,			_goomba_check_end
_goomba_dead:
	mov T1,			X
	iadd T1,		20
	mov [PX],		T1
	mov T1,			Y
	isub T1,		20
	mov [PY],		T1
	mov T1,			2
	mov [R4],		T1
	mov T1,			[Score]
	iadd T1,		100
	mov [Score],		T1
	mov T1,			20
	mov [Iframes],		T1

	mov T1,			R4
	ieq T1,			KoopF1
	jf T1,			_is_not_a_koopa
	mov T1,			555
	mov [Gtest],	T1

	; Stop the game theme and play the victory theme
	mov T1,			0
	out SPU_SelectedSound,	T1
	mov T1,			0
	out SPU_SelectedChannel,	T1
	mov T1,			0
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_StopAllChannels

	mov T1,			11
	out SPU_SelectedSound,	T1
	mov T1,			11
	out SPU_SelectedChannel,	T1
	;mov T1,			2
	;out SPU_ChannelVolume, 		T1
	mov T1,			11
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

_is_not_a_koopa:
	mov T1,			10
	out SPU_SelectedSound,	T1
	mov T1,			10
	out SPU_SelectedChannel,T1
	mov T1,			10
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

_goomba_or_koopa_death:
	mov T1,			R4
	ieq T1,			KoopF1
	jt T1,			_koopa_death_value
_goomba_death_value:
	mov T1,			32
	mov [R12],		T1
	jmp _goomba_check_end
_koopa_death_value:
	mov T1,			42
	mov [R12],		T1
	jmp _goomba_check_end
_goomba_is_dead:
	mov T1,			[R11]
	iadd T1,		1
	mov [R11],		T1
	igt T1,			400
	jf T1,			_goomba_check_end
_make_dead:
	mov T1,			3
	mov [R4],		T1
	jmp _goomba_check_end
_goomba_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Draw
;;	 R6 is ItemF#, R7 is [ItemL#], R8 is [ItemT#], R12 is GoomRID
_draw_goomba:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_draw_goomba_flag_check:
	mov T1,			[R6]
	ieq T1,			0
	jt T1,			_draw_goomba_real
	mov T1,			[R6]
	ieq T1,			2
	jt T1,			_draw_enemy_dead
	jmp _draw_goomba_end
_draw_goomba_real:
	out Texture,		0
	mov T1,			[R12]
	out Region,		T1
	mov X,			R7
	mov Y,			R8
	call _draw_region_zoomed_at
	jmp _draw_goomba_end
_draw_enemy_dead:
	mov T1,			R6
	ieq T1,			KoopF1
	jt T1,			_draw_koopa_dead
_draw_goomba_dead:
	out Texture,		0
	out Region,		32
	mov X,			R7
	mov Y,			R8
	call _draw_region_zoomed_at
	jmp _draw_goomba_end
_draw_koopa_dead:
	out Texture,		0
	out Region,		42
	mov X,			R7
	mov Y,			R8
	call _draw_region_zoomed_at
	jmp _draw_goomba_end
_draw_goomba_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Move
;;	 R4 is GoomF#, R6 is [GoomS#], R7 is [GoomG#] R8 is GoomX#, R9 is GoomY#
_move_goomba:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_move_goomba_flag_check:
	mov T1,			[R4]
	ieq T1,			0
	jf T1,			_move_goomba_dead
_move_goomba_position_check:
	mov T1,			[R8]					;X
	mov T2,			R6
	isub T1,		T2
	mov [R8],		T1
	mov T1,			[R9]					;Y
	iadd T1,		5
	mov [R9],		T1
	mov T2,			R7					;Gravity/Movement
	ige T1,			T2
	jf T1,			_move_goomba_end
	mov T2,			R7
	mov [R9],		T2
	jmp _move_goomba_end
_move_goomba_dead:
	mov T1,			[R9]
	iadd T1,		5
	mov [R9],		T1
_move_goomba_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Check Maker
;;	X is [PX], Y is [PY], R4 is GoomF#, R6 is GoomL#, R10 is [PYHB], R12 is EnemyRID
_goomba_check_maker:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_goomba_check_maker_updater:
	mov T1,		R6
	mov R6,		[T1]				;L
	iadd T1,	1
	mov R7,		[T1]				;R
	iadd T1,	1
	mov R8,		[T1]				;T
	iadd T1,	1
	mov R9,		[T1]				;B
	iadd T1,	2
	mov R11,	[T1]				;Y
	call _goomba_check
_goomba_check_maker_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Goomba Object Check
;;	R4 is GoomF#, R6 is [GoomL#], R7 is [GoomR#], R8 is sudo GoomID, R9 is GoomS# or GoomG#, R10 is object one, R11 is object 2R
_goomba_object_check:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
	mov R7,			R6
	iadd R7,		1
_goc_flag_checker:
	mov T1,			[R4]
	ieq T1,			0
	jf T1,			_goomba_object_check_end
_goc_ID_check:
	mov T1,			R8
	ieq T1,			2
	jt T1,			_goc_pipes_check
	mov T1,			R8
	ieq T1,			3
	jt T1,			_goc_hole_check
	jmp _goomba_object_check_end
_goc_pipes_check:
	mov T1,			[R6]
	ile T1,			R10
	mov T2,			[R7]
	igt T2,			R11
	or T1,			T2
	jt T1,			_goc_speed_flip
	jmp _goomba_object_check_end
_goc_hole_check:
	mov T1,			[R7]
	ile T1,			R10
	jt T1,			_goc_hole_maker
	jmp _goomba_object_check_end
_goc_speed_flip:
	mov T1,			[R9]
	isgn T1
	mov [R9],		T1
	jmp _goomba_object_check_end
_goc_hole_maker:
	mov T1,			600
	mov [R9],		T1
	jmp _goomba_object_check_end
_goomba_object_check_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Koopa Maker
;;	T2 is [BGX#], T3 is KoopL#, T4 is X sub number, T5 is Y add number
_koopa_maker:
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	push R11
	push R12
	push R13
_koopa_updater:
	mov T1,			T2
	iadd T1,		640
	isub T1,		T4
	mov [T3],		T1		;L
	iadd T3,		1
	iadd T1,		32;64
	mov [T3],		T1		;R
	iadd T3,		1
	mov T1,			[BGY]
	iadd T1,		T5
	mov [T3],		T1		;T
	iadd T3,		1
	iadd T1,		64;32
	mov [T3],		T1		;B
_koopa_make_end:
	pop R13
	pop R12
	pop R11
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Death
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of game process, make screen grey, print "Game Ovber"
;;
;_game_over_one:
;	mov T1,			[Lives]
;	ieq 0,			T1
;	jt T1,			_game_over_two
;	mov T1,			[Lives]
;	isub T1,		1
;	call _less_lives_screen
;	call _frame_counter
_game_over_timer:
;	imod T1,		100
;	ieq T1,			0
;	jf T1,			_game_over_timer
;
;	jmp _new_game
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	mov [Size],		T1
;	mov T1,			[Size]
;	ieq T1,			0
;	jf T1,			_game_loop
_game_over_two:
	mov T1,			0
	out SPU_SelectedSound,	T1
	mov T1,			0
	out SPU_SelectedChannel,	T1
	mov T1,			0
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_StopAllChannels
_game_over_sound_death:
	mov T1,			7
	out SPU_SelectedSound,	T1
	mov T1,			7
	out SPU_SelectedChannel,	T1
	mov T1,			7
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel
	mov T1,			5
	mov [RID],		T1
	call _clear
_move_player_off_screen:
	wait
	call _clear
	;Something
	mov T1,			[PY]
	iadd T1,		5
	mov [PY],		T1
	mov T1,			0
	out Texture,		T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at
	mov T1,			[PY]
	ige T1,			500
	jf T1,			_move_player_off_screen
_game_over_three:
	mov R6,			-1
	out GPU_SelectedTexture,R6
	mov T1,			_message_game_over
	mov X,			275
	mov Y,			180
	call _msgmkr
	mov X,			320
	mov Y,			200

	mov T1,			[Score]
	ieq T1,			0
	jt T1,			_game_over_0
	mov Value,		[Score]
	call _Itoa_D
	hlt
_game_over_0:
	mov T1,			_message_0
	call _msgmkr
	hlt


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of game process, make screen grey, print "Game Over"
;;
_less_lives_screen:
	mov T1,	0xFFD58394						;Shiny Volcarona
	out GPU_ClearColor,	T1
	out Command, GPUCommand_ClearScreen
	out Texture,		0
	out Region,		0
	mov X,			290
	mov Y,			180
	call _draw_region_zoomed_at
	mov X,			310
	mov Y,			170
	out Texture,		-1
	mov T1,			_message_X
	call _msgmkr
	mov X,			330
	mov T1,			[Lives]
	ieq T1,			0
	jt T1,			_less_lives_0
	mov Value,		[Lives]
	call _Itoa_D
	jmp _less_lives_timer_start
_less_lives_0:
	mov T1,			_message_0
	call _msgmkr
_less_lives_timer_start:
	mov Index,		0
	call _main_theme_stop
_less_lives_timer:
	mov T1,			Index
	igt T1,			180
	jt T1,			_less_lives_end
	iadd Index,		1
	wait
	jmp _less_lives_timer
_less_lives_end:
	call _main_theme
	ret
	


_message_game_over:
	string "Game Over!"

_message_X:
	string "x"

_message_0:
	string "0"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Gamepad
;;
_select_gamepad:
	out INP_SelectedGamepad,	R0
	ret

_movement:
	push R2
	push R3
	push R4
	push R5
	push R6
	push R7
	push R8
	push R9
	push R10
	mov X,		[PX]
	mov Y,		[PY]
	mov R4,		[PID]
	mov R5,		[Direction]
	mov R6,		[Ground]
	mov R7,		[Jump]
	mov R8,		[Side]
	mov R9,		[GroundY]
	mov R10,	[BGY]
_bgy_check:
	mov T1,		R10
	ine T1,		28
	jf T1,		_bgy_original
	mov R9,		600
	jmp _left
_bgy_original:
	mov R9,		[SBGY]
_left:
	in Cntlr,	INP_GamepadLeft				;Gamepad Value is loaded into Cntlr (positive if pressed, negative it not)
	mov T1,		0
	ilt T1,		Cntlr					;If < 0 then jump to right
	jf T1,		_right
	mov R4,		1
	mov R5,		1
	mov R7,		1
	mov T1,		[Pspeed]				;Going left so subtract Player Speed
	isub X,		T1
	mov R8,		0
	mov T1,		X					;Check if player leaves the screen on the left
	isub T1,	8
	ilt T1,		0
	jf T1,		_up					;If so then put them back on screen
	mov X,		12
	jmp _up
_right:
	mov R7,		0
	in Cntlr,	INP_GamepadRight			;Gamepad Value is loaded into Cntlr (positive if pressed, negative it not)
	mov T1,		0
	ilt T1,		Cntlr					;If < 0 then jump to up
	jf T1,		_up
	mov R4,		2
	mov R5,		2
	mov R7,		2
	mov T1,		[Pspeed]				;Going right so add Player Speed
	iadd X,		T1
	mov R8,		1
	mov T1,		X					;Check if player leaves the screen on the right
	iadd T1,	8
	mov T2,		[LeftEdge]
	igt T1,		T2
	jf T1,		_up					;If so then put them back on screen
	mov X,		T2
	jmp _up
_up:
	in Cntlr,	INP_GamepadButtonA
	mov T1,		0
	ilt T1,		Cntlr
	jt T1,		_check_ground_pos
_not_up:
	mov R7,		0
	mov R6,		2
	jmp _gravity
_check_ground_pos:
	mov T1,		Y
	mov T2,		[CBGY]
	ieq T1,		T2
	jf T1,		_where_sprite
_ground_sprite:

	mov T1,			4
	out SPU_SelectedSound,	T1
	mov T1,			4
	out SPU_SelectedChannel,T1
	mov T1,			4
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel

	mov R6,		0
	jmp _check_jmp
_where_sprite:
	mov T1,		Y
	mov T3,		[HighPoint]
	ilt T3,		25
	jf T3,		_highest_high
	mov T2,		25
	mov [HighPoint],T2
_highest_high:
	mov T2,		[HighPoint]
	ile T1,		T2
	jt T1,		_highest_point
	mov T1,		Y
	ilt T1,		R9
	jt T1,		_not_highest_point
_highest_point:
	mov R6,		2
	mov Cntlr,	0
	jmp _gravity
_not_highest_point:
	mov T1,		R6
	ieq T1,		2
	jt T1,		_gravity
	mov R6,		1
_up_or_down:
	mov T1,		Cntlr
	ieq R0,		0
	jt T1,		_highest_point
_check_jmp:
	mov T1,		R6
	ieq T1,		0
	jt T1,		_check_jmp_2
	mov T1,		R6
	ieq T1,		1
	jt T1,		_check_jmp_2
	jmp _gravity
_check_jmp_2:
	mov T1,		R7
	ieq T1,		0
	jt T1,		_jmp_up
	mov T1,		R7
	ieq T1,		1
	jt T1,		_jmp_left
	mov T1,		R7
	ieq T1,		2
	jt T1,		_jmp_right
	jmp _gravity
_jmp_up:
	isub Y,		16
	mov T1,		280
	mov [CBGY],	T1
	jmp _gravity
_jmp_left:
	mov T1,		[Pspeed]
	isub Y,		16
	mov T1,		280
	mov [CBGY],	T1
	jmp _gravity
_jmp_right:
	mov T1,		[Pspeed]
	isub Y,		16
	mov T1,		280
	mov [CBGY],	T1
_gravity:
	iadd Y,		4
	mov T2,		[CBGY]
	iadd T2,	4
	mov [CBGY],	T2
	mov T1,		Y
	mov T3,		R9
	ige T1,		T3
	jf T1,		_movement_end
	mov Y,		T3
	mov R9,		T3
	mov [CBGY],	T3
	isub T3,	172
	mov [HighPoint],T3
	mov R6,		0
_movement_end:
	mov [PX],	X
	mov [PY],	Y
	mov [PID],	R4
	mov [Direction],R5
	mov [Ground],	R6
	mov [Jump],	R7
	mov [Side],	R8
	mov [GroundY],	R9
	mov [BGY],	R10
	pop R10
	pop R9
	pop R8
	pop R7
	pop R6
	pop R5
	pop R4
	pop R3
	pop R2
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Text and Print
;;
_Itoa_D:								;Stuff prints right to left
	mov Index,	0
	mov Jndex,	0
	mov T3,		Value
_Itoa_D_start:
	mov T1,		Index
	ieq T1,		0
	jt T1,		_Itoa_D_mod					;If Value is 0 then print
	mov T1,		T3
	ieq T1,		0
	jt T1,		_Itoa_D_print
	idiv T3,	10
	iadd Jndex,	1
	isub Index,	1
	jmp _Itoa_D_start
_Itoa_D_mod:
	mov T1,		T3						;Make Value into Ascii
	imod T1,	10
	iadd T1,	48
	mov T2,		Print
	iadd T2,        Jndex
	mov [T2],       T1
	iadd Index,	1
	jmp _Itoa_D_start
_Itoa_D_print:
	mov Index,	0
_Itoa_D_ploop:
	mov T1,		Print
	iadd T1, 	Index
	mov T2,  	[T1]
	mov T1,		Index
	ilt T1,		Jndex
	jf T1, 		_Itoa_D_end
	out Region,	T2
	call _draw_region_at
	isub X,		10
	iadd Index, 	1
	jmp _Itoa_D_ploop
_Itoa_D_end:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Print the Message
;;
_msgmkr:
	mov T2,   	[T1]  			 	;Derefernce T1 and move into T2
	mov T3,   	T2				;Check if end of string
	ieq T3,   	0
	jt T3,		_msgmkrend
	out Region, 	T2				;Select Region and Draw
	out DrawX,  	X
	out DrawY,  	Y
	out Command,	DrawRegion
	iadd X, 	10 			 	;Move X for next letter in string
	iadd T1,   	1   				;Increment memory address of string msg
	jmp _msgmkr
_msgmkrend:
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Time
;;
_frame_counter:
	in T1,	TIM_FrameCounter
	ret

_get_time:
	in T1, TIM_CurrentTime
	ret

_rand:
	in T1,	RNG_CurrentValue
	ret

_srand:
	out RNG_CurrentValue,	T1
	ret

_clear:
	mov T1,	0xFF4A31BD				;Breloom
	out GPU_ClearColor,	T1
	out Command, GPUCommand_ClearScreen
	ret

_main_theme:
	mov T1,				3
	out SPU_SelectedSound,		T1
	mov T1,				3
	out SPU_SelectedChannel,	T1
	mov T1,				3
	out SPU_ChannelAssignedSound,	T1
	out SPU_Command, SPUCommand_PlaySelectedChannel
	ret

_main_theme_stop:
	mov T1,				3
	out SPU_SelectedSound,		T1
	mov T1,				3
	out SPU_SelectedChannel,	T1
	mov T1,				3
	out SPU_ChannelAssignedSound,	T1
;	out SPU_Command, SPUCommand_PlaySelectedChannel
	out SPU_Command, SPUCommand_StopAllChannels
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Main
;;
_main:

	;Time Time
	call _get_time
	call _srand
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;
	;; Texture Definitions
	;;

	;Backgrounds 1-7
	mov R6,		7
	call _define_backgrounds


	call _title_screen
	_end_title_screen:

_player_sprite_check:

	mov T1,		[character]
	ieq T1,		0
	jt T1,		_player_is_Mattio
	jf T1,		_player_is_Joeigi


_player_is_Mattio:

	call _character_equals_0
	jmp _player_sprite_check_end

_player_is_Joeigi:

	call _character_equals_1
	jmp _player_sprite_check_end

_player_sprite_check_end:

	;Play Music
	call _main_theme

	;Brick
	out Texture,		0
	out Region,		100
	mov T1,			160
	mov T2,			240
	mov X,			175
	mov Y,			255
	call _define_topleft

	;Mystery Block
	out Texture,		0
	out Region,		101
	mov T1,			224
	mov T2,			240
	mov X,			239
	mov Y,			255
	call _define_topleft

	;Hard/Invis Block
	out Texture,		0
	out Region,		102
	mov T1,			256
	mov T2,			240
	mov X,			271
	mov Y,			255
	call _define_topleft

	;Axe Block
	out Texture,		0
	out Region,		103
	mov T1,			448
	mov T2,			240
	mov X,			463
	mov Y,			255
	call _define_topleft

	;Chain Block
	out Texture,		0
	out Region,		104
	mov T1,			480
	mov T2,			240
	mov X,			495
	mov Y,			255
	call _define_topleft

	;Trap Block
	out Texture,		0
	out Region,		105
	mov T1,			416
	mov T2,			240
	mov X,			431
	mov Y,			255
	call _define_topleft

	;Power Up
	out Texture,		0
	out Region,		106
	mov T1,			0
	mov T2,			240
	mov X,			15
	mov Y,			255
	call _define_topleft

	;1-Up Block
	out Texture,		0
	out Region,		107
	mov T1,			32
	mov T2,			240
	mov X,			47
	mov Y,			255
	call _define_topleft

	;Mushroom Item
	out Texture,		0
	out Region,		108
	mov T1,			0
	mov T2,			240
	mov X,			15
	mov Y,			255
	call _define_topleft

	;Coin draw 1 (face forward)
	out Texture,		0
	out Region,		109
	mov T1,			288
	mov T2,			240
	mov X,			303
	mov Y,			255
	call _define_topleft

	;Coin draw 2 (turn 1)
	out Texture,		0
	out Region,		110
	mov T1,			304
	mov T2,			240
	mov X,			319
	mov Y,			255
	call _define_topleft

	;Coin draw 3 (turn 2)
	out Texture,		0
	out Region,		111
	mov T1,			320
	mov T2,			240
	mov X,			336
	mov Y,			255
	call _define_topleft

	;Coin draw 4 (turn 3)
	out Texture,		0
	out Region,		112
	mov T1,			336
	mov T2,			240
	mov X,			351
	mov Y,			255
	call _define_topleft

	call _Goomba_Regions
	call _Koopa_Regions

	mov T1,			3
	mov [Lives],		T1

_new_game:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;
	;; Initialize!
	;;
	;Sprite Values
	mov T1,			96
	mov [PX],		T1
	mov T1,			280
	mov [PY],		T1
	mov T1,			4
	mov [Pspeed],		T1
	mov T1,			8
	mov [PYHD],		T1
	mov [PYHT],		T1
	mov T1,			7
	mov [PYHB],		T1
	mov T1,			1
	mov [RID],		T1
	mov T1,			1
	mov [Size],		T1
	mov T1,			280
	mov [SBGY],		T1
	mov [CBGY],		T1
	mov T1,			16
	mov [DFC],		T1
	mov T1,			0
	mov [Iframes],		T1

	;Score
	mov T1,			0
	mov [Score],		T1

	;Background X, Y, and Flag values
	mov T1,			640
	mov [BGX1],		T1
	mov T1,			1920
	mov [BGX2],		T1
	mov T1,			1920
	mov [BGX3],		T1
	mov T1,			1920
	mov [BGX4],		T1
	mov T1,			1920
	mov [BGX5],		T1
	mov T1,			1920
	mov [BGX6],		T1
	mov T1,			1920
	mov [BGX7],		T1
	mov T1,			0
	mov [BGF1],		T1
	mov [BGF2],		T1
	mov T1,			1
	mov [BGF3],		T1
	mov [BGF4],		T1
	mov [BGF5],		T1
	mov [BGF6],		T1
	mov [BGF7],		T1
	mov T1,			280
	mov [GroundY],		T1
	mov T1,			28
	mov [BGY],		T1
	mov T1,			300
	mov [MoveScreen],	T1
	mov T1,			320
	mov [LeftEdge],		T1
	mov T1,			108
	mov [HighPoint],	T1

	;When to end background printing
	mov T1,			0
	isub T1,		640
	mov [BGS],		T1

	;Invis Block Draw Flags
	mov T1,			1
	mov [VisF1],		T1
	mov [VisF2],		T1
	mov [VisF3],		T1
	mov [VisF4],		T1
	mov [VisF5],		T1
	mov [VisF6],		T1
	mov T1,			101
	mov [MystTex1],		T1
	mov [MystTex2],		T1
	mov [MystTex3],		T1
	mov [MystTex4],		T1
	mov [MystTex5],		T1
	mov [MystTex6],		T1
	mov [MystTex7],		T1

	;Item Flags
	mov T1,			1
	mov [MushF1],		T1
	mov [MushF2],		T1
	mov [CoinF1],		T1
	mov [CoinF2],		T1
	mov [CoinF3],		T1
	mov [CoinF4],		T1
	mov [CoinF5],		T1
	mov [CoinF6],		T1

	;Item Movement
	mov T1,			2
	mov [Ispeed],		T1
	mov T1,			220
	mov [GroundI],		T1
	mov T1,			592
	mov [MushX1],		T1
	mov T1,			496
	mov [OneUpX1],		T1
	mov T1,			48
	mov [MushX2],		T1
	mov T1,			92
	mov [MushY1],		T1
	mov [OneUpY1],		T1
	mov [MushY2],		T1

	;Bricks
	mov T1,			1
	mov [BrickF1],		T1
	mov [BrickF2],		T1
	mov [BrickF3],		T1
	mov [BrickF4],		T1
	mov [BrickF5],		T1
	mov [BrickF6],		T1
	mov [BrickF7],		T1
	mov [BrickF8],		T1
	mov [BrickF9],		T1
	mov [BrickF10],		T1
	mov [BrickF11],		T1
	mov [BrickF12],		T1
	mov [BrickF13],		T1
	mov [BrickF14],		T1
	mov [BrickF15],		T1
	mov [BrickF16],		T1
	mov [BrickF17],		T1
	mov [BrickF18],		T1
	mov [BrickF19],		T1
	mov [BrickF20],		T1
	mov [BrickF21],		T1
	mov [BrickF22],		T1

	;Enemies/Goomba
	;Goomba Speed
	mov T1,			3
	isgn T1
	mov [GoomS1],		T1
	mov [GoomS2],		T1
	mov [GoomS3],		T1
	mov [GoomS4],		T1
	mov [GoomS5],		T1
	mov [GoomS6],		T1
	mov [GoomS7],		T1
	mov [GoomS8],		T1
	mov [GoomS9],		T1
	mov [GoomS10],		T1
	mov [GoomS11],		T1
	mov [GoomS12],		T1
	mov [GoomS13],		T1
	mov [GoomS14],		T1
	mov [GoomS15],		T1
	mov [GoomS16],		T1
	mov [DGoomS],		T1
	mov [dGoomS],		T1
	mov [TGoomS],		T1
	;Goomba Ground
	mov T1,			228
	mov [GoomG1],		T1
	mov [GoomG2],		T1
	mov [GoomG3],		T1
	mov [GoomG4],		T1
	mov [GoomG5],		T1
	mov [GoomG6],		T1
	mov [GoomG7],		T1
	mov [GoomG8],		T1
	mov [GoomG9],		T1
	mov [GoomG10],		T1
	mov [GoomG11],		T1
	mov [GoomG12],		T1
	mov [GoomG13],		T1
	mov [GoomG14],		T1
	mov [GoomG15],		T1
	mov [GoomG16],		T1
	mov [DGoomG],		T1
	mov [dGoomG],		T1
	mov [TGoomG],		T1
	;Goomba Y
	mov [GoomY1],		T1
	mov [GoomY2],		T1
	mov [GoomY3],		T1
	mov [GoomY4],		T1
	mov [GoomY5],		T1
	mov [GoomY6],		T1
	mov [GoomY7],		T1
	mov [GoomY8],		T1
	mov [GoomY9],		T1
	mov [GoomY10],		T1
	mov [GoomY11],		T1
	mov [GoomY12],		T1
	mov [GoomY13],		T1
	mov [GoomY14],		T1
	mov [GoomY15],		T1
	mov [GoomY16],		T1
	mov [DGoomY],		T1
	mov [dGoomY],		T1
	mov [TGoomY],		T1
	;Goomba Flags
	mov T1,			1
	mov [GoomF1],		T1
	mov [GoomF2],		T1
	mov [GoomF3],		T1
	mov [GoomF4],		T1
	mov [GoomF5],		T1
	mov [GoomF6],		T1
	mov [GoomF7],		T1
	mov [GoomF8],		T1
	mov [GoomF9],		T1
	mov [GoomF10],		T1
	mov [GoomF11],		T1
	mov [GoomF12],		T1
	mov [GoomF13],		T1
	mov [GoomF14],		T1
	mov [GoomF15],		T1
	mov [GoomF16],		T1
	mov [DGoomF],		T1
	mov [dGoomF],		T1
	mov [TGoomF],		T1
	;Goomba X
	mov T1,			576
	mov [GoomX1],		T1
	mov T1,			1120
	mov [GoomX2],		T1
	mov T1,			864
	mov [GoomX3],		T1
	mov T1,			800
	mov [GoomX4],		T1
	mov T1,			96
	mov [GoomX5],		T1
	mov T1,			64
	mov [GoomX6],		T1
	mov T1,			736
	mov [GoomX7],		T1
	mov T1,			672
	mov [GoomX8],		T1
	mov T1,			192
	mov [GoomX9],		T1
	mov T1,			128
	mov [GoomX10],		T1
	mov T1,			1152
	mov [GoomX11],		T1
	mov T1,			1088
	mov [GoomX12],		T1
	mov T1,			1052
	mov [GoomX13],		T1
	mov T1,			928
	mov [GoomX14],		T1
	mov T1,			832
	mov [GoomX15],		T1
	mov T1,			768
	mov [GoomX16],		T1
	mov T1,			20
	mov [DGoomX],		T1
	mov [dGoomX],		T1
	mov [TGoomX],		T1

	;Koopa
	mov T1,			3
	isgn T1
	mov [KoopS1],		T1
	mov T1,			108
	mov [KoopG1],		T1
	mov T1,			1
	mov [KoopF1],		T1
	mov T1,			108
	mov [KoopY1],		T1
	mov T1,			672
	mov [KoopX1],		T1

	;call _main_theme

_game_loop:

	call _frame_counter
	imod T1,	2
	ieq T1,		0
	jf T1,		_game_loop

	;Clear
	call _clear

	;Scale
	call _scale

	;Draw Backgrounds 1-7
	mov R6,			7					;End value
	mov R10,		[BGY]
	call _print_backgrounds

	;Enemy RID
	mov T1,			31
	mov [GoomRID],		T1
	mov T1,			41
	mov [KoopRID],		T1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Makes, Checks, and Draws
;;
	call _MCD_main							;In include_file_make_check_draw.s

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Update Background Flags
;;
_stop_screen:								;If background 7 then when BGX7 = 0 stop letting screen move
	mov T1,			[BGF6]
	mov T2,			[BGF7]
	ieq T1,			1
	ieq T2,			0
	and T1,			T2
	jf T1,			_background_flag_updater
	mov T1,			[BGX7]
	ile T1,			0
	jf T1,			_background_flag_updater
	mov T1,			700
	mov [MoveScreen],	T1
	mov T1,			640
	mov [LeftEdge],		T1
_background_flag_updater:
	mov T1,			[PX]					;If we are not updating the screen X postion then don't update the flags
	igt T1,			0
	jf T1,			_bgfu_end
_bgfu1:
	mov T2,			[BGS]
	mov T1,			[BGX1]
	ile T1,			T2
	jf T1,			_bgfu2
	mov T1,			1
	mov [BGF1],		T1
	mov T1,			0
	mov [BGF3],		T1
	;Mushroom 1 again
	mov T1,			2
	mov [Ispeed],		T1
	mov T1,			336
	mov [MushX1],		T1
	mov T1,			0
	isub T1,		48
	mov [MushY1],		T1
	mov T1,			31
	mov [GoomRID],		T1
_bgfu2:
	mov T2,			[BGS]
	mov T1,			[BGX2]
	ile T1,			T2
	jf T1,			_bgfu3
	mov T1,			1
	mov [BGF2],		T1
	mov T1,			0
	mov [BGF4],		T1
	mov T1,			31
	mov [GoomRID],		T1
_bgfu3:
	mov T2,			[BGS]
	mov T1,			[BGX3]
	ile T1,			T2
	jf T1,			_bgfu4
	mov T1,			1
	mov [BGF3],		T1
	mov T1,			0
	mov [BGF5],		T1
_bgfu4:
	mov T2,			[BGS]
	mov T1,			[BGX4]
	ile T1,			T2
	jf T1,			_bgfu5
	mov T1,			1
	mov [BGF4],		T1
	mov T1,			0
	mov [BGF6],		T1
_bgfu5:
	mov T2,			[BGS]
	mov T1,			[BGX5]
	ile T1,			T2
	jf T1,			_bgfu6
	mov T1,			1
	mov [BGF5],		T1
	mov T1,			0
	mov [BGF7],		T1
_bgfu6:
	mov T2,			[BGS]
	mov T1,			[BGX6]
	ile T1,			T2
	jf T1,			_bgfu_end
	mov T1,			1
	mov [BGF6],		T1
	mov T1,			0
	mov [BGF7],		T1
_bgfu_end:

	call _background_mover

_check_button_X:
	in Cntlr,		INP_GamepadButtonX
	mov T1,			Cntlr
	ieq T1,			1
	jf T1,			_check_button_Y
	call _small_time
	jmp _check_button_end
_check_button_Y:
	in Cntlr,		INP_GamepadButtonY
	mov T1,			0
	ilt T1,			Cntlr
	jf T1,			_check_button_end
	mov T1,			0
	mov [Lives],		T1
;	call _big_time
	jmp _check_button_end
_check_button_end:



_size_check:
	mov T1,			[Size]
	ieq T1,			0
	jt T1,			_no_size
	mov T1,			[Size]
	ieq T1,			1
	jt T1,			_small_size
	mov T1,			[Size]
	igt T1,			2
	jt T1,			_reduce_to_2
_size_big_check:
	mov T1,			[Size]
	ieq T1,			2
	jt T1,			_big_size
	jmp _size_check_end
_reduce_to_2:
	mov T1,			2
	mov [Size],		T1
	jmp _size_big_check
_no_size:
	mov T1,			[Lives]
	isub T1,		1
	mov [Lives],		T1

	ilt T1,			0
	jf T1,			_not_game_over
	call _game_over_two
_not_game_over:
	call _less_lives_screen
	jmp _new_game
_small_size:
	call _animation
	jmp _size_check_end
_big_size:
	call _animation
	jmp _size_check_end
_size_check_end:
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Move Items, Enemies and whatever else
;;
	call _background_item_ememy_mover


_mirror:
	mov T1,			[Side]
	ieq T1,			0
	jf T1,			_player
	call _neg_scale_X
_player:
	;Player Draw
	;call _movement
	;call _animation
	mov T1,			0
	out Texture,		T1
	mov T1,			[RID]
	out Region,		T1
	mov X,			[PX]
	mov Y,			[PY]
	call _draw_region_zoomed_at

;	mov T1,			Gtest;KoopF1
;	push T1
;	iadd T1,		0
;	push T1
;	call __debugmemory
;	pop T1
;	pop T1

	call _movement
_game_loop_end:
	wait

	;Iframe counter
	mov T1,			[Iframes]
	isub T1,		1
	mov [Iframes],		T1

	jmp _game_loop
_end:
	ret



%include "debug.s"
%include "include_file_coin_animation.asm"
%include "include_file_player_animation.asm"
%include "include_file_draw_Mattio.asm"
%include "include_file_draw_Joeigi.asm"
%include "include_file_make_check_draw.s"
%include "include_file_item_check.s"
%include "include_file_goomba_with_animation.asm"
%include "include_file_koopa_with_animation.asm"
%include "Title.asm"
%include "Mattio-game.asm"
%include "Joeigi-game.asm"

