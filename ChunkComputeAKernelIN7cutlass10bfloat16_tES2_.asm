//.kernel _ZTSN3gdn19ChunkComputeAKernelIN7cutlass10bfloat16_tES2_EE
//.platform XE2
//.thread_config numGRF=256, numAcc=8, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 3504103527 3226068487 -hashmovs1 0 16 "
//.full_options "-emitLocation -enableCoalesceScalarMoves -samplerHeaderWA -enablePreemptionR0Only -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -TotalGRFNum 256 -abortOnSpill 4 -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-rp 100 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -generateDebugInfo -hashmovs 3504103527 3226068487 -hashmovs1 0 16 "
//.instCount 3354
//.RA type	GRAPH_COLORING_FF_RA
//.git-hash 478f6f8226d8d1cc49e6d217c362217352aba661
//.spill size 320
//.spill flag store 124
//.spill flag load 124

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r253.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare %null (10)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (13)  rf=r size=4 type=ud align=2 words (r2.10)
//.declare %local_id_y (14)  rf=r size=4 type=ud align=2 words (r2.11)
//.declare %local_size_x (15)  rf=r size=4 type=ud align=2 words (r2.6)
//.declare %local_size_y (16)  rf=r size=4 type=ud align=2 words (r2.7)
//.declare %group_id_x (17)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (18)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (19)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (20)  rf=r size=4 type=ud align=2 words (r2.8)
//.declare %group_count_y (21)  rf=r size=4 type=ud align=2 words (r2.9)
//.declare %tsc (22)  rf=r size=20 type=ud align=2 words
//.declare %arg (23)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare %retval (24)  rf=r size=64 type=ud align=32 words (r26.0) Output
//.declare %sp (25)  rf=r size=8 type=uq align=4 words (r255.3)
//.declare %fp (26)  rf=r size=8 type=uq align=4 words (r255.2)
//.declare %sr0 (27)  rf=r size=16 type=ud align=2 words
//.declare %cr0 (28)  rf=r size=12 type=ud align=2 words
//.declare %ce0 (29)  rf=r size=4 type=ud align=2 words
//.declare %dbg0 (30)  rf=r size=8 type=ud align=2 words
//.declare implBufPtr (32)  rf=r size=8 type=uq align=4 words (r254.0)
//.declare localIdBufPtr (33)  rf=r size=8 type=uq align=4 words (r254.3)
//.declare %msg0 (34)  rf=r size=12 type=ud align=2 words
//.declare %null (35)  rf=r size=4 type=ud align=2 words
//.declare V0033 (43)  rf=r size=64 type=d alias=+0 align=32 words (r253.0)
//.declare V0034 (44)  rf=r size=8 type=uq align=4 words (r4.1)
//.declare V0035 (45)  rf=r size=8 type=uq align=4 words (r4.2)
//.declare V0036 (46)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V0037 (47)  rf=r size=8 type=uq align=4 words (r5.0)
//.declare V0038 (48)  rf=r size=8 type=uq align=4 words (r5.1)
//.declare V0039 (49)  rf=r size=4 type=d align=2 words (r5.4)
//.declare V0040 (50)  rf=r size=4 type=d align=2 words (r5.5)
//.declare V0041 (51)  rf=r size=4 type=d align=2 words (r5.6)
//.declare V0042 (52)  rf=r size=4 type=d align=2 words (r5.7)
//.declare V0043 (53)  rf=r size=4 type=d align=2 words (r5.8)
//.declare V0045 (55)  rf=r size=32 type=d alias=+0 align=32 words (r253.0)
//.declare V0047 (57)  rf=r size=12 type=d align=2 words (r6.0)
//.declare V0048 (58)  rf=r size=12 type=d align=2 words (r6.3)
//.declare V0049 (59)  rf=r size=32 type=w align=16 words (r1.0)
//.declare V0050 (60)  rf=r size=32 type=w align=16 words (r2.0)
//.declare V0051 (61)  rf=r size=32 type=w align=16 words (r3.0)
//.declare V0052 (62)  rf=r size=8 type=uq align=4 words (r5.5)
//.declare V0053 (63)  rf=r size=8 type=uq align=4 words (r5.6)
//.declare V0065 (75)  rf=r size=2048 type=w align=32 words (r7.0)
//.declare V0067 (77)  rf=r size=768 type=d alias=%arg+0 align=32 words (r26.0)
//.declare V0069 (79)  rf=r size=512 type=d alias=%retval+0 align=32 words (r26.0)
//.declare V0071 (81)  rf=r size=8 type=uq alias=%sp+0 align=32 words (r255.3)
//.declare V0073 (83)  rf=r size=8 type=uq alias=%fp+0 align=32 words (r255.2)
//.declare V0074 (84)  rf=r size=4 type=ud align=2 words (r1.9)
//.declare V0076 (86)  rf=r size=4 type=ud align=2 words (r1.10)
//.declare V0078 (88)  rf=r size=4 type=ud align=2 words (r1.14)
//.declare V0079 (89)  rf=r size=4 type=ud align=2 words (r1.11)
//.declare V0080 (90)  rf=r size=4 type=ud align=32 words (r4.0)
//.declare V0082 (92)  rf=r size=8 type=uq align=32 words (r4.0)
//.declare V0083 (93)  rf=r size=8 type=uq align=32 words (r7.0)
//.declare V0084 (94)  rf=r size=4 type=ud align=2 words (r4.0)
//.declare V0085 (95)  rf=r size=8 type=uq align=4 words (r135.4)
//.declare V0086 (96)  rf=r size=32 type=w align=32 words (r7.0)
//.declare V0087 (97)  rf=r size=4 type=d alias=+4 align=2 words (r1.13)
//.declare V0088 (98)  rf=r size=8 type=q align=4 words (r3.4)
//.declare V0089 (99)  rf=r size=4 type=d align=2 words (r2.10)
//.declare P1 (100)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0090 (101)  rf=r size=8 type=df align=4 words (r4.4)
//.declare V0091 (102)  rf=r size=8 type=df align=4 words (r3.7)
//.declare V0092 (103)  rf=r size=8 type=df align=4 words (r3.6)
//.declare V0093 (104)  rf=r size=8 type=df align=4 words (r3.5)
//.declare V0094 (105)  rf=r size=8 type=df align=4 words (r1.7)
//.declare V0095 (106)  rf=r size=8 type=uq alias=V0088+0 align=4 words (r3.4)
//.declare V0096 (107)  rf=r size=4 type=f align=4 words (r1.8)
//.declare V0097 (108)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0098 (109)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0099 (110)  rf=r size=8 type=df align=4 words (r1.4)
//.declare V0100 (111)  rf=r size=8 type=df align=4 words (r1.4)
//.declare V0101 (112)  rf=r size=8 type=df align=4 words (r1.7)
//.declare V0102 (113)  rf=r size=8 type=df align=4 words (r1.4)
//.declare V0103 (114)  rf=r size=4 type=d align=4 words (r2.8)
//.declare V0104 (115)  rf=r size=4 type=ud alias=V0103+0 align=2 words (r2.8)
//.declare V0105 (116)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0106 (117)  rf=r size=4 type=d alias=+0 align=2 words (r1.12)
//.declare V0107 (118)  rf=r size=8 type=df alias=+0 align=4 words (r1.4)
//.declare V0108 (119)  rf=r size=4 type=ud alias=V0106+0 align=2 words (r1.12)
//.declare V0109 (120)  rf=r size=8 type=df alias=+8 align=4 words (r1.5)
//.declare V0110 (121)  rf=r size=4 type=ud alias=V0087+0 align=2 words (r1.13)
//.declare V0111 (122)  rf=r size=8 type=df align=4 words (r1.4)
//.declare V0112 (123)  rf=r size=8 type=df align=4 words (r1.4)
//.declare V0113 (124)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0114 (125)  rf=r size=8 type=uq alias=V0113+0 align=4 words (r1.5)
//.declare V0115 (126)  rf=r size=4 type=d align=2 words (r1.14)
//.declare V0116 (127)  rf=r size=8 type=d alias=V0113+0 align=4 words (r1.10)
//.declare P2 (130)  rf=f1  size=2 type=uw align=1 words (f0.0)
//.declare V0119 (131)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0122 (134)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0123 (135)  rf=r size=8 type=d alias=V0122+0 align=4 words (r1.8)
//.declare V0127 (139)  rf=r size=4 type=ud alias=V0115+0 align=2 words (r1.14)
//.declare V0128 (140)  rf=r size=4 type=ud alias=V0043+0 align=2 words (r5.8)
//.declare V0129 (141)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0133 (145)  rf=r size=8 type=q align=32 words (r8.0)
//.declare V0134 (146)  rf=r size=8 type=d alias=V0133+0 align=4 words (r8.0)
//.declare V0135 (147)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0136 (148)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0137 (149)  rf=r size=8 type=d alias=V0135+0 align=4 words (r1.8)
//.declare V0140 (152)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0141 (153)  rf=r size=8 type=d alias=V0140+0 align=4 words (r1.10)
//.declare P3 (154)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0142 (155)  rf=r size=8 type=ud alias=V0136+0 align=2 words (r1.8)
//.declare P4 (156)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare P5 (157)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0143 (158)  rf=r size=4 type=ud alias=V0089+0 align=2 words (r2.10)
//.declare V0144 (159)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0145 (160)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0146 (161)  rf=r size=8 type=d alias=V0145+0 align=4 words (r1.8)
//.declare V0147 (162)  rf=r size=8 type=q align=4 words (r2.7)
//.declare P6 (163)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0148 (164)  rf=r size=4 type=d align=2 words (r4.1)
//.declare V0149 (165)  rf=r size=4 type=f align=2 words (r1.11)
//.declare V0150 (166)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0151 (167)  rf=r size=4 type=ud alias=V0150+0 align=2 words (r1.8)
//.declare V0152 (168)  rf=r size=4 type=d alias=+0 align=2 words (r2.8)
//.declare V0153 (169)  rf=r size=4 type=f align=2 words (r1.10)
//.declare V0154 (170)  rf=r size=4 type=f align=2 words (r1.9)
//.declare V0155 (171)  rf=r size=4 type=f align=2 words (r4.0)
//.declare V0156 (172)  rf=r size=4 type=f align=2 words (r1.9)
//.declare V0157 (173)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0158 (174)  rf=r size=4 type=ud alias=V0157+0 align=2 words (r1.8)
//.declare V0159 (175)  rf=r size=4 type=d alias=+4 align=2 words (r2.9)
//.declare V0160 (176)  rf=r size=4 type=d align=2 words (r1.14)
//.declare V0161 (177)  rf=r size=4 type=ud alias=V0160+0 align=2 words (r1.14)
//.declare V0162 (178)  rf=r size=4 type=f alias=+0 align=2 words (r1.8)
//.declare V0163 (179)  rf=r size=4 type=ud alias=V0152+0 align=2 words (r2.8)
//.declare V0164 (180)  rf=r size=4 type=f alias=+4 align=2 words (r1.9)
//.declare V0165 (181)  rf=r size=4 type=ud alias=V0159+0 align=2 words (r2.9)
//.declare V0166 (182)  rf=r size=4 type=f align=2 words (r1.15)
//.declare V0168 (184)  rf=r size=4 type=f align=2 words (r4.10)
//.declare V0170 (186)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0171 (187)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0172 (188)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0173 (189)  rf=r size=4 type=d align=2 words (r1.9)
//.declare V0174 (190)  rf=r size=4 type=ud alias=V0173+0 align=2 words (r1.9)
//.declare V0175 (191)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0176 (192)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0177 (193)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0178 (194)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0179 (195)  rf=r size=4 type=ud alias=V0177+0 align=2 words (r1.8)
//.declare V0180 (196)  rf=r size=4 type=ud alias=V0178+0 align=2 words (r1.8)
//.declare  (197)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0181 (198)  rf=r size=4 type=ud alias=V0148+0 align=2 words (r4.1)
//.declare V0182 (199)  rf=r size=8 type=d align=2 words (r1.8)
//.declare V0183 (200)  rf=r size=8 type=d alias=V0147+0 align=4 words (r2.14)
//.declare V0187 (204)  rf=r size=8 type=ud alias=V0182+0 align=2 words (r1.8)
//.declare V0188 (205)  rf=r size=4 type=d align=32 words (r9.0)
//.declare V0190 (207)  rf=r size=4 type=d align=32 words (r8.0)
//.declare V0192 (209)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0193 (210)  rf=r size=8 type=d alias=V0192+0 align=4 words (r4.0)
//.declare V0195 (212)  rf=r size=8 type=q align=4 words (r1.4)
//.declare V0196 (213)  rf=r size=8 type=d align=2 words (r1.12)
//.declare V0197 (214)  rf=r size=8 type=d alias=V0195+0 align=4 words (r1.8)
//.declare V0198 (215)  rf=r size=8 type=df align=4 words (r2.4)
//.declare V0199 (216)  rf=r size=4 type=f align=4 words (r1.10)
//.declare V0200 (217)  rf=r size=4 type=f align=2 words (r1.10)
//.declare V0201 (218)  rf=r size=8 type=df align=4 words (r1.7)
//.declare V0202 (219)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0203 (220)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0204 (221)  rf=r size=8 type=df align=4 words (r1.7)
//.declare V0205 (222)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0206 (223)  rf=r size=4 type=d align=4 words (r3.8)
//.declare V0207 (224)  rf=r size=4 type=ud alias=V0206+0 align=2 words (r3.8)
//.declare V0208 (225)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0209 (226)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0210 (227)  rf=r size=8 type=df align=4 words (r3.4)
//.declare V0211 (228)  rf=r size=4 type=ud alias=V0209+0 align=2 words (r1.10)
//.declare V0212 (229)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0213 (230)  rf=r size=12 type=ud alias=V0047+0 align=2 words (r6.0)
//.declare V0214 (231)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0215 (232)  rf=r size=8 type=df align=4 words (r1.5)
//.declare V0216 (233)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0217 (234)  rf=r size=8 type=uq alias=V0216+0 align=4 words (r2.4)
//.declare V0218 (235)  rf=r size=8 type=d align=2 words (r1.14)
//.declare V0219 (236)  rf=r size=8 type=d alias=V0216+0 align=4 words (r2.8)
//.declare P7 (238)  rf=f1  size=2 type=uw align=1 words (f0.0)
//.declare V0221 (239)  rf=r size=8 type=ud alias=V0218+0 align=2 words (r1.14)
//.declare V0222 (240)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0225 (243)  rf=r size=8 type=q align=4 words (r2.6)
//.declare V0226 (244)  rf=r size=8 type=d alias=V0225+0 align=4 words (r2.12)
//.declare V0230 (248)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0234 (252)  rf=r size=8 type=q align=32 words (r8.0)
//.declare V0235 (253)  rf=r size=8 type=d alias=V0234+0 align=4 words (r8.0)
//.declare V0236 (254)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0237 (255)  rf=r size=8 type=d align=2 words (r1.10)
//.declare V0238 (256)  rf=r size=8 type=d alias=V0236+0 align=4 words (r1.10)
//.declare P8 (257)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0239 (258)  rf=r size=8 type=ud alias=V0237+0 align=2 words (r1.10)
//.declare P9 (259)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare P10 (260)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0240 (261)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0241 (262)  rf=r size=8 type=q align=4 words (r1.5)
//.declare V0242 (263)  rf=r size=8 type=d alias=V0241+0 align=4 words (r1.10)
//.declare V0244 (265)  rf=r size=4 type=d align=4 words (r236.10)
//.declare P11 (266)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0245 (267)  rf=r size=4 type=f align=2 words (r1.14)
//.declare V0246 (268)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0247 (269)  rf=r size=4 type=ud alias=V0246+0 align=2 words (r1.10)
//.declare V0248 (270)  rf=r size=4 type=d alias=+0 align=2 words (r2.12)
//.declare V0249 (271)  rf=r size=4 type=f align=2 words (r1.11)
//.declare V0250 (272)  rf=r size=4 type=f align=2 words (r1.15)
//.declare V0251 (273)  rf=r size=4 type=f align=2 words (r3.9)
//.declare V0252 (274)  rf=r size=4 type=f align=2 words (r1.15)
//.declare V0253 (275)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0254 (276)  rf=r size=4 type=ud alias=V0253+0 align=2 words (r1.10)
//.declare V0255 (277)  rf=r size=4 type=d alias=+4 align=2 words (r2.13)
//.declare V0256 (278)  rf=r size=4 type=d align=2 words (r1.15)
//.declare V0257 (279)  rf=r size=4 type=ud alias=V0256+0 align=2 words (r1.15)
//.declare V0258 (280)  rf=r size=4 type=f alias=+0 align=2 words (r2.8)
//.declare V0259 (281)  rf=r size=4 type=ud alias=V0248+0 align=2 words (r2.12)
//.declare V0260 (282)  rf=r size=4 type=f alias=+4 align=2 words (r2.9)
//.declare V0261 (283)  rf=r size=4 type=ud alias=V0255+0 align=2 words (r2.13)
//.declare V0262 (284)  rf=r size=4 type=f align=2 words (r3.8)
//.declare V0264 (286)  rf=r size=4 type=f align=2 words (r3.10)
//.declare V0266 (288)  rf=r size=4 type=f align=2 words (r1.10)
//.declare V0267 (289)  rf=r size=4 type=f align=2 words (r1.10)
//.declare V0268 (290)  rf=r size=4 type=f align=2 words (r3.8)
//.declare V0269 (291)  rf=r size=4 type=d align=2 words (r3.9)
//.declare V0270 (292)  rf=r size=4 type=ud alias=V0269+0 align=2 words (r3.9)
//.declare V0271 (293)  rf=r size=4 type=d align=2 words (r3.8)
//.declare V0272 (294)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0273 (295)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0274 (296)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0275 (297)  rf=r size=4 type=ud alias=V0273+0 align=2 words (r1.10)
//.declare V0276 (298)  rf=r size=4 type=ud alias=V0274+0 align=2 words (r1.10)
//.declare  (299)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare P12 (300)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0277 (301)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0278 (302)  rf=r size=4 type=d align=2 words (r3.8)
//.declare V0279 (303)  rf=r size=4 type=d align=2 words (r1.15)
//.declare V0280 (304)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0281 (305)  rf=r size=4 type=d align=2 words (r1.14)
//.declare V0282 (306)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0283 (307)  rf=r size=4 type=d align=2 words (r3.11)
//.declare V0284 (308)  rf=r size=4 type=f align=2 words (r3.10)
//.declare V0285 (309)  rf=r size=4 type=ud alias=V0281+0 align=2 words (r1.14)
//.declare V0286 (310)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0287 (311)  rf=r size=4 type=ud alias=V0286+0 align=2 words (r1.11)
//.declare V0288 (312)  rf=r size=4 type=d alias=+0 align=2 words (r2.12)
//.declare V0289 (313)  rf=r size=4 type=f align=2 words (r3.9)
//.declare V0290 (314)  rf=r size=4 type=ud alias=V0283+0 align=2 words (r3.11)
//.declare V0291 (315)  rf=r size=4 type=f align=2 words (r3.12)
//.declare V0292 (316)  rf=r size=4 type=f align=2 words (r3.14)
//.declare V0293 (317)  rf=r size=4 type=f align=2 words (r3.12)
//.declare V0294 (318)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0295 (319)  rf=r size=4 type=ud alias=V0294+0 align=2 words (r1.11)
//.declare V0296 (320)  rf=r size=4 type=d alias=+4 align=2 words (r2.13)
//.declare V0297 (321)  rf=r size=4 type=d align=2 words (r3.13)
//.declare V0298 (322)  rf=r size=4 type=ud alias=V0297+0 align=2 words (r3.13)
//.declare V0299 (323)  rf=r size=4 type=f alias=+0 align=2 words (r2.8)
//.declare V0300 (324)  rf=r size=4 type=ud alias=V0288+0 align=2 words (r2.12)
//.declare V0301 (325)  rf=r size=4 type=f alias=+4 align=2 words (r2.9)
//.declare V0302 (326)  rf=r size=4 type=ud alias=V0296+0 align=2 words (r2.13)
//.declare V0303 (327)  rf=r size=4 type=f align=2 words (r3.12)
//.declare V0305 (329)  rf=r size=4 type=f align=2 words (r3.9)
//.declare V0307 (331)  rf=r size=4 type=f align=2 words (r1.11)
//.declare V0308 (332)  rf=r size=4 type=f align=2 words (r1.11)
//.declare V0309 (333)  rf=r size=4 type=f align=2 words (r3.9)
//.declare V0310 (334)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0311 (335)  rf=r size=4 type=ud alias=V0310+0 align=2 words (r1.11)
//.declare V0312 (336)  rf=r size=4 type=d align=2 words (r3.9)
//.declare V0313 (337)  rf=r size=4 type=d align=2 words (r3.10)
//.declare V0314 (338)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0315 (339)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0316 (340)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0317 (341)  rf=r size=4 type=ud alias=V0315+0 align=2 words (r1.11)
//.declare V0318 (342)  rf=r size=4 type=ud alias=V0316+0 align=2 words (r1.11)
//.declare  (343)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0319 (344)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0320 (345)  rf=r size=4 type=d align=2 words (r1.14)
//.declare V0321 (346)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0322 (347)  rf=r size=4 type=d align=32 words (r235.0)
//.declare V0323 (348)  rf=r size=4 type=d align=2 words (r180.1)
//.declare V0324 (349)  rf=r size=4 type=ud alias=V0322+0 align=2 words (r235.0)
//.declare V0325 (350)  rf=r size=4 type=ud alias=V0041+0 align=2 words (r5.6)
//.declare V0326 (351)  rf=r size=4 type=ud alias=V0042+0 align=2 words (r5.7)
//.declare V0327 (352)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0329 (354)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0330 (355)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0331 (356)  rf=r size=4 type=d align=32 words (r8.0)
//.declare V0332 (357)  rf=r size=4 type=d align=2 words (r1.11)
//.declare V0333 (358)  rf=r size=4 type=ud alias=V0331+0 align=2 words (r8.0)
//.declare V0334 (359)  rf=r size=8 type=ud alias=V0196+0 align=2 words (r1.12)
//.declare V0335 (360)  rf=r size=4 type=ud alias=V0039+0 align=2 words (r5.4)
//.declare V0336 (361)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0338 (363)  rf=r size=4 type=d align=32 words (r4.0)
//.declare P13 (364)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0339 (365)  rf=r size=64 type=d align=32 words (r3.0)
//.declare V0340 (366)  rf=r size=32 type=uw alias=V0051+0 align=16 words (r3.0)
//.declare V0342 (368)  rf=r size=32 type=uw alias=V0050+0 align=16 words (r2.0)
//.declare V0344 (370)  rf=r size=32 type=uw alias=V0049+0 align=16 words (r1.0)
//.declare V0345 (371)  rf=r size=64 type=d align=32 words (r232.0)
//.declare V0347 (373)  rf=r size=4 type=d align=4 words (r135.14)
//.declare V0348 (374)  rf=r size=32 type=b alias=V0045+0 align=16 words (r253.0)
//.declare V0349 (375)  rf=r size=1 type=b align=1 words (r1.0)
//.declare V0350 (376)  rf=r size=4 type=d align=2 words (r1.0)
//.declare V0351 (377)  rf=r size=1 type=ub alias=V0349+0 align=1 words (r1.0)
//.declare V0352 (378)  rf=r size=4 type=d align=2 words (r1.2)
//.declare V0353 (379)  rf=r size=4 type=d align=2 words (r135.15)
//.declare V0354 (380)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0355 (381)  rf=r size=4 type=d align=32 words (r180.0)
//.declare V0356 (382)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0358 (384)  rf=r size=8 type=q align=4 words (r1.0)
//.declare V0359 (385)  rf=r size=8 type=d alias=V0358+0 align=4 words (r1.0)
//.declare V0360 (386)  rf=r size=8 type=q align=4 words (r1.0)
//.declare V0361 (387)  rf=r size=8 type=q alias=V0034+0 align=4 words (r4.1)
//.declare V0362 (388)  rf=r size=8 type=q align=4 words (r180.1)
//.declare V0363 (389)  rf=r size=64 type=d align=32 words (r2.0)
//.declare V0364 (390)  rf=r size=64 type=d align=32 words (r173.0)
//.declare V0365 (391)  rf=r size=4 type=d alias=+0 align=2 words (r1.0)
//.declare V0366 (392)  rf=r size=4 type=d alias=+4 align=2 words (r1.1)
//.declare V0367 (393)  rf=r size=4 type=d alias=+0 align=2 words (r135.12)
//.declare V0368 (394)  rf=r size=4 type=d alias=+4 align=2 words (r135.13)
//.declare P14 (395)  rf=f1  size=2 type=uw align=1 words (f0.0)
//.declare V0369 (396)  rf=r size=2 type=w align=1 words (r1.0)
//.declare V0370 (397)  rf=r size=2 type=b align=1 words (r1.0)
//.declare V0371 (398)  rf=r size=4 type=d align=2 words (r1.0)
//.declare V0372 (399)  rf=r size=2 type=ub alias=V0370+0 align=1 words (r1.0)
//.declare V0373 (400)  rf=r size=4 type=d align=2 words (r1.0)
//.declare V0374 (401)  rf=r size=4 type=d align=2 words (r135.10)
//.declare V0375 (402)  rf=r size=64 type=d align=32 words (r172.0)
//.declare V0376 (403)  rf=r size=64 type=d align=32 words (r175.0)
//.declare V0377 (404)  rf=r size=64 type=d align=32 words (r7.0)
//.declare V0378 (405)  rf=r size=32 type=uw alias=V0086+0 align=32 words (r7.0)
//.declare V0379 (406)  rf=r size=64 type=d align=32 words (r8.0)
//.declare V0380 (407)  rf=r size=128 type=uq align=32 words (r136.0)
//.declare V0381 (408)  rf=r size=8 type=uq align=4 words (r1.0)
//.declare V0382 (409)  rf=r size=128 type=uq align=32 words (r138.0)
//.declare V0383 (410)  rf=r size=128 type=ud alias=V0380+0 align=32 words (r136.0)
//.declare V0385 (412)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare V0386 (413)  rf=r size=128 type=ud alias=V0382+0 align=32 words (r138.0)
//.declare P15 (414)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0387 (415)  rf=r size=64 type=ud alias=V0345+0 align=32 words (r232.0)
//.declare P16 (416)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0388 (417)  rf=r size=64 type=d align=32 words (r174.0)
//.declare V0389 (418)  rf=r size=64 type=d align=32 words (r2.0)
//.declare V0390 (419)  rf=r size=4 type=d align=2 words (r4.8)
//.declare V0391 (420)  rf=r size=64 type=d align=32 words (r234.0)
//.declare V0392 (421)  rf=r size=64 type=ud alias=V0391+0 align=32 words (r234.0)
//.declare V0393 (422)  rf=r size=4 type=d align=32 words (r1.0)
//.declare P17 (423)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P18 (424)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0394 (425)  rf=r size=4 type=ud alias=V0353+0 align=2 words (r135.15)
//.declare V0395 (426)  rf=r size=64 type=ud alias=V0389+0 align=32 words (r2.0)
//.declare V0396 (427)  rf=r size=4 type=d align=2 words (r1.3)
//.declare P19 (428)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P20 (429)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0397 (430)  rf=r size=4 type=ud alias=V0396+0 align=2 words (r1.3)
//.declare V0398 (431)  rf=r size=4 type=d align=2 words (r1.4)
//.declare P21 (432)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P22 (433)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0399 (434)  rf=r size=4 type=ud alias=V0398+0 align=2 words (r1.4)
//.declare V0400 (435)  rf=r size=4 type=d align=2 words (r1.5)
//.declare P23 (436)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P24 (437)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0401 (438)  rf=r size=4 type=ud alias=V0400+0 align=2 words (r1.5)
//.declare V0402 (439)  rf=r size=4 type=d align=2 words (r1.6)
//.declare P25 (440)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P26 (441)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0403 (442)  rf=r size=4 type=ud alias=V0402+0 align=2 words (r1.6)
//.declare V0404 (443)  rf=r size=4 type=d align=2 words (r1.7)
//.declare P27 (444)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P28 (445)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0405 (446)  rf=r size=4 type=ud alias=V0404+0 align=2 words (r1.7)
//.declare V0406 (447)  rf=r size=4 type=d align=2 words (r1.11)
//.declare P29 (448)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P30 (449)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0407 (450)  rf=r size=4 type=ud alias=V0406+0 align=2 words (r1.11)
//.declare V0408 (451)  rf=r size=4 type=d align=2 words (r1.12)
//.declare P31 (452)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P32 (453)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0409 (454)  rf=r size=4 type=ud alias=V0408+0 align=2 words (r1.12)
//.declare V0410 (455)  rf=r size=4 type=d align=2 words (r236.7)
//.declare V0411 (456)  rf=r size=4 type=d align=32 words (r6.0)
//.declare P33 (457)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P34 (458)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0412 (459)  rf=r size=4 type=ud alias=V0410+0 align=2 words (r236.7)
//.declare V0413 (460)  rf=r size=4 type=d align=2 words (r1.13)
//.declare P35 (461)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P36 (462)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0414 (463)  rf=r size=4 type=ud alias=V0413+0 align=2 words (r1.13)
//.declare V0415 (464)  rf=r size=4 type=d align=2 words (r1.14)
//.declare P37 (465)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P38 (466)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0416 (467)  rf=r size=4 type=ud alias=V0415+0 align=2 words (r1.14)
//.declare V0417 (468)  rf=r size=4 type=d align=2 words (r1.15)
//.declare P39 (469)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P40 (470)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0418 (471)  rf=r size=4 type=ud alias=V0417+0 align=2 words (r1.15)
//.declare V0419 (472)  rf=r size=4 type=d align=2 words (r4.0)
//.declare P41 (473)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P42 (474)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0420 (475)  rf=r size=4 type=ud alias=V0419+0 align=2 words (r4.0)
//.declare V0421 (476)  rf=r size=4 type=d align=2 words (r4.1)
//.declare P43 (477)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P44 (478)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0422 (479)  rf=r size=4 type=ud alias=V0421+0 align=2 words (r4.1)
//.declare V0423 (480)  rf=r size=4 type=d align=2 words (r4.2)
//.declare P45 (481)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P46 (482)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0424 (483)  rf=r size=4 type=ud alias=V0423+0 align=2 words (r4.2)
//.declare V0425 (484)  rf=r size=4 type=d align=2 words (r4.3)
//.declare P47 (485)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P48 (486)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0426 (487)  rf=r size=4 type=ud alias=V0425+0 align=2 words (r4.3)
//.declare V0427 (488)  rf=r size=4 type=d align=2 words (r236.6)
//.declare V0428 (489)  rf=r size=4 type=d align=32 words (r252.0)
//.declare V0429 (490)  rf=r size=4 type=ud alias=V0428+0 align=32 words (r252.0)
//.declare P49 (491)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P50 (492)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0430 (493)  rf=r size=4 type=ud alias=V0427+0 align=2 words (r236.6)
//.declare V0431 (494)  rf=r size=4 type=d align=2 words (r236.5)
//.declare V0432 (495)  rf=r size=4 type=d align=32 words (r251.0)
//.declare V0433 (496)  rf=r size=4 type=ud alias=V0432+0 align=32 words (r251.0)
//.declare P51 (497)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P52 (498)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0434 (499)  rf=r size=4 type=ud alias=V0431+0 align=2 words (r236.5)
//.declare V0435 (500)  rf=r size=4 type=d align=2 words (r236.0)
//.declare V0436 (501)  rf=r size=4 type=d align=32 words (r250.0)
//.declare V0437 (502)  rf=r size=4 type=ud alias=V0436+0 align=32 words (r250.0)
//.declare P53 (503)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P54 (504)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0438 (505)  rf=r size=4 type=ud alias=V0435+0 align=2 words (r236.0)
//.declare V0439 (506)  rf=r size=4 type=d align=2 words (r235.15)
//.declare V0440 (507)  rf=r size=4 type=d align=32 words (r249.0)
//.declare V0441 (508)  rf=r size=4 type=ud alias=V0440+0 align=32 words (r249.0)
//.declare P55 (509)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P56 (510)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0442 (511)  rf=r size=4 type=ud alias=V0439+0 align=2 words (r235.15)
//.declare V0443 (512)  rf=r size=4 type=d align=2 words (r235.14)
//.declare V0444 (513)  rf=r size=4 type=d align=32 words (r248.0)
//.declare V0445 (514)  rf=r size=4 type=ud alias=V0444+0 align=32 words (r248.0)
//.declare P57 (515)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P58 (516)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0446 (517)  rf=r size=4 type=ud alias=V0443+0 align=2 words (r235.14)
//.declare V0447 (518)  rf=r size=4 type=d align=2 words (r235.13)
//.declare V0448 (519)  rf=r size=4 type=d align=32 words (r247.0)
//.declare V0449 (520)  rf=r size=4 type=ud alias=V0448+0 align=32 words (r247.0)
//.declare P59 (521)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P60 (522)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0450 (523)  rf=r size=4 type=ud alias=V0447+0 align=2 words (r235.13)
//.declare V0451 (524)  rf=r size=4 type=d align=2 words (r235.12)
//.declare V0452 (525)  rf=r size=4 type=d align=32 words (r246.0)
//.declare V0453 (526)  rf=r size=4 type=ud alias=V0452+0 align=32 words (r246.0)
//.declare P61 (527)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P62 (528)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0454 (529)  rf=r size=4 type=ud alias=V0451+0 align=2 words (r235.12)
//.declare V0455 (530)  rf=r size=4 type=d align=2 words (r235.11)
//.declare V0456 (531)  rf=r size=4 type=d align=32 words (r245.0)
//.declare V0457 (532)  rf=r size=4 type=ud alias=V0456+0 align=32 words (r245.0)
//.declare P63 (533)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P64 (534)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0458 (535)  rf=r size=4 type=ud alias=V0455+0 align=2 words (r235.11)
//.declare V0459 (536)  rf=r size=4 type=d align=2 words (r235.10)
//.declare V0460 (537)  rf=r size=4 type=d align=32 words (r244.0)
//.declare V0461 (538)  rf=r size=4 type=ud alias=V0460+0 align=32 words (r244.0)
//.declare P65 (539)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P66 (540)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0462 (541)  rf=r size=4 type=ud alias=V0459+0 align=2 words (r235.10)
//.declare V0463 (542)  rf=r size=4 type=d align=2 words (r235.3)
//.declare V0464 (543)  rf=r size=4 type=d align=32 words (r243.0)
//.declare V0465 (544)  rf=r size=4 type=ud alias=V0464+0 align=32 words (r243.0)
//.declare P67 (545)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P68 (546)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0466 (547)  rf=r size=4 type=ud alias=V0463+0 align=2 words (r235.3)
//.declare V0467 (548)  rf=r size=4 type=d align=2 words (r235.2)
//.declare V0468 (549)  rf=r size=4 type=d align=32 words (r242.0)
//.declare V0469 (550)  rf=r size=4 type=ud alias=V0468+0 align=32 words (r242.0)
//.declare P69 (551)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P70 (552)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0470 (553)  rf=r size=4 type=ud alias=V0467+0 align=2 words (r235.2)
//.declare V0471 (554)  rf=r size=4 type=d align=2 words (r235.1)
//.declare V0472 (555)  rf=r size=4 type=d align=32 words (r241.0)
//.declare V0473 (556)  rf=r size=4 type=ud alias=V0472+0 align=32 words (r241.0)
//.declare P71 (557)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P72 (558)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0474 (559)  rf=r size=4 type=ud alias=V0471+0 align=2 words (r235.1)
//.declare V0475 (560)  rf=r size=4 type=d align=2 words (r180.15)
//.declare V0476 (561)  rf=r size=4 type=d align=32 words (r240.0)
//.declare V0477 (562)  rf=r size=4 type=ud alias=V0476+0 align=32 words (r240.0)
//.declare P73 (563)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P74 (564)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0478 (565)  rf=r size=4 type=ud alias=V0475+0 align=2 words (r180.15)
//.declare V0479 (566)  rf=r size=4 type=d align=2 words (r180.14)
//.declare V0480 (567)  rf=r size=4 type=d align=32 words (r239.0)
//.declare V0481 (568)  rf=r size=4 type=ud alias=V0480+0 align=32 words (r239.0)
//.declare P75 (569)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P76 (570)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0482 (571)  rf=r size=4 type=ud alias=V0479+0 align=2 words (r180.14)
//.declare V0483 (572)  rf=r size=4 type=d align=2 words (r180.11)
//.declare V0484 (573)  rf=r size=4 type=d align=32 words (r238.0)
//.declare V0485 (574)  rf=r size=4 type=ud alias=V0484+0 align=32 words (r238.0)
//.declare P77 (575)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P78 (576)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0486 (577)  rf=r size=4 type=ud alias=V0483+0 align=2 words (r180.11)
//.declare V0487 (578)  rf=r size=4 type=d align=2 words (r180.10)
//.declare V0488 (579)  rf=r size=4 type=d align=32 words (r237.0)
//.declare V0489 (580)  rf=r size=4 type=ud alias=V0488+0 align=32 words (r237.0)
//.declare P79 (581)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P80 (582)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0490 (583)  rf=r size=4 type=ud alias=V0487+0 align=2 words (r180.10)
//.declare V0491 (584)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0492 (585)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0493 (586)  rf=r size=64 type=d align=32 words (r2.0)
//.declare V0494 (587)  rf=r size=64 type=d align=32 words (r233.0)
//.declare V0495 (588)  rf=r size=64 type=ud alias=V0494+0 align=32 words (r233.0)
//.declare P81 (589)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P82 (590)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare V0496 (591)  rf=r size=64 type=ud alias=V0493+0 align=32 words (r2.0)
//.declare P83 (592)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P84 (593)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P85 (594)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P86 (595)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P87 (596)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P88 (597)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P89 (598)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P90 (599)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P91 (600)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P92 (601)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P93 (602)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P94 (603)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P95 (604)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P96 (605)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P97 (606)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P98 (607)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P99 (608)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P100 (609)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P101 (610)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P102 (611)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P103 (612)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P104 (613)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P105 (614)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P106 (615)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P107 (616)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P108 (617)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P109 (618)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P110 (619)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P111 (620)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P112 (621)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P113 (622)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P114 (623)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P115 (624)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P116 (625)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P117 (626)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P118 (627)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P119 (628)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P120 (629)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P121 (630)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P122 (631)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P123 (632)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P124 (633)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P125 (634)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P126 (635)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P127 (636)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P128 (637)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P129 (638)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P130 (639)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P131 (640)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P132 (641)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P133 (642)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P134 (643)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P135 (644)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P136 (645)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P137 (646)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P138 (647)  rf=f16  size=2 type=uw align=1 words (spilled -> )
//.declare P139 (648)  rf=f16  size=2 type=uw align=1 words (f3.0)
//.declare P140 (649)  rf=f16  size=2 type=uw align=1 words (f2.1)
//.declare P141 (650)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare P142 (651)  rf=f16  size=2 type=uw align=1 words (f1.1)
//.declare P143 (652)  rf=f16  size=2 type=uw align=1 words (f1.0)
//.declare P144 (653)  rf=f16  size=2 type=uw align=1 words (f0.1)
//.declare V0497 (654)  rf=r size=64 type=d align=32 words (r227.0)
//.declare V0498 (655)  rf=r size=64 type=d align=32 words (r226.0)
//.declare V0499 (656)  rf=r size=64 type=d align=32 words (r225.0)
//.declare V0500 (657)  rf=r size=8 type=q alias=V0038+0 align=4 words (r5.1)
//.declare V0501 (658)  rf=r size=8 type=q alias=V0037+0 align=4 words (r5.0)
//.declare V0502 (659)  rf=r size=8 type=q alias=V0035+0 align=4 words (r4.2)
//.declare P145 (660)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare V0503 (661)  rf=r size=4 type=d alias=+4 align=2 words (r235.5)
//.declare V0504 (662)  rf=r size=4 type=d align=2 words (r236.8)
//.declare V0505 (663)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0506 (664)  rf=r size=4 type=d align=2 words (r135.11)
//.declare V0507 (665)  rf=r size=4 type=d alias=+0 align=2 words (r235.4)
//.declare V0508 (666)  rf=r size=4 type=d alias=+0 align=2 words (r180.4)
//.declare V0509 (667)  rf=r size=4 type=d alias=+4 align=2 words (r180.5)
//.declare V0510 (668)  rf=r size=8 type=q alias=V0036+0 align=4 words (r4.3)
//.declare V0511 (669)  rf=r size=4 type=ud alias=V0393+0 align=32 words (r1.0)
//.declare V0512 (670)  rf=r size=4 type=ud alias=V0411+0 align=32 words (r6.0)
//.declare V0513 (671)  rf=r size=4 type=d alias=+0 align=2 words (r180.12)
//.declare V0514 (672)  rf=r size=4 type=d alias=+4 align=2 words (r180.13)
//.declare V0516 (674)  rf=r size=4 type=ud alias=V0514+0 align=2 words (r180.13)
//.declare V0517 (675)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0518 (676)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0519 (677)  rf=r size=8 type=uq alias=V0518+0 align=32 words (r4.0)
//.declare V0520 (678)  rf=r size=8 type=d align=32 words (r4.0)
//.declare V0521 (679)  rf=r size=4 type=d align=2 words (r1.1)
//.declare P146 (680)  rf=f1  size=2 type=uw align=1 words (f3.1)
//.declare V0522 (681)  rf=r size=2 type=w align=1 words (r1.2)
//.declare V0523 (682)  rf=r size=2 type=b align=1 words (r1.4)
//.declare V0524 (683)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0525 (684)  rf=r size=2 type=ub alias=V0523+0 align=1 words (r1.4)
//.declare V0526 (685)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0527 (686)  rf=r size=4 type=d align=2 words (r1.1)
//.declare P147 (687)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0528 (688)  rf=r size=4 type=d align=2 words (r4.2)
//.declare  (689)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (690)  rf=r size=32 type=ud align=32 words (r2.0)
//.declare V0529 (691)  rf=r size=64 type=d align=32 words (r7.0)
//.declare V0530 (692)  rf=r size=64 type=d align=32 words (r2.0)
//.declare V0532 (694)  rf=r size=128 type=q align=32 words (r2.0)
//.declare V0533 (695)  rf=r size=128 type=q align=32 words (r8.0)
//.declare V0534 (696)  rf=r size=128 type=uq alias=V0533+0 align=32 words (r8.0)
//.declare V0535 (697)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0536 (698)  rf=r size=64 type=d align=32 words (r2.0)
//.declare V0537 (699)  rf=r size=64 type=ud alias=V0536+0 align=32 words (r2.0)
//.declare V0538 (700)  rf=r size=64 type=d align=32 words (r2.0)
//.declare P148 (701)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0539 (702)  rf=r size=64 type=ud alias=V0538+0 align=32 words (r2.0)
//.declare  (703)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (704)  rf=r size=32 type=ud align=32 words (r2.0)
//.declare V0540 (705)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0544 (709)  rf=r size=4 type=ud alias=V0528+0 align=2 words (r4.2)
//.declare V0545 (710)  rf=r size=4 type=d align=32 words (r3.0)
//.declare V0547 (712)  rf=r size=4 type=d align=32 words (r2.0)
//.declare V0549 (714)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0550 (715)  rf=r size=8 type=d alias=V0549+0 align=4 words (r4.0)
//.declare V0551 (716)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0552 (717)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0553 (718)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0554 (719)  rf=r size=4 type=f align=2 words (r1.7)
//.declare V0555 (720)  rf=r size=4 type=ud alias=V0506+0 align=2 words (r135.11)
//.declare V0556 (721)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0557 (722)  rf=r size=4 type=ud alias=V0556+0 align=2 words (r1.4)
//.declare V0558 (723)  rf=r size=4 type=d alias=+0 align=2 words (r1.8)
//.declare V0559 (724)  rf=r size=4 type=f align=2 words (r1.6)
//.declare V0560 (725)  rf=r size=4 type=ud alias=V0508+0 align=2 words (r180.4)
//.declare V0561 (726)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0562 (727)  rf=r size=4 type=f align=2 words (r1.11)
//.declare V0563 (728)  rf=r size=4 type=f align=2 words (r1.5)
//.declare V0564 (729)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0565 (730)  rf=r size=4 type=ud alias=V0564+0 align=2 words (r1.4)
//.declare V0566 (731)  rf=r size=4 type=d alias=+4 align=2 words (r1.9)
//.declare V0567 (732)  rf=r size=4 type=d align=2 words (r1.10)
//.declare V0568 (733)  rf=r size=4 type=ud alias=V0567+0 align=2 words (r1.10)
//.declare V0569 (734)  rf=r size=4 type=f alias=+0 align=2 words (r1.4)
//.declare V0570 (735)  rf=r size=4 type=ud alias=V0558+0 align=2 words (r1.8)
//.declare V0571 (736)  rf=r size=4 type=f alias=+4 align=2 words (r1.5)
//.declare V0572 (737)  rf=r size=4 type=ud alias=V0566+0 align=2 words (r1.9)
//.declare V0573 (738)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0575 (740)  rf=r size=4 type=f align=2 words (r1.6)
//.declare V0577 (742)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0578 (743)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0579 (744)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0580 (745)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0581 (746)  rf=r size=4 type=ud alias=V0580+0 align=2 words (r1.4)
//.declare V0582 (747)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0583 (748)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0584 (749)  rf=r size=4 type=d align=2 words (r1.5)
//.declare V0585 (750)  rf=r size=4 type=d align=2 words (r1.5)
//.declare V0586 (751)  rf=r size=4 type=ud alias=V0584+0 align=2 words (r1.5)
//.declare V0587 (752)  rf=r size=4 type=ud alias=V0585+0 align=2 words (r1.5)
//.declare  (753)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0588 (754)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0589 (755)  rf=r size=4 type=d align=32 words (r4.0)
//.declare V0591 (757)  rf=r size=8 type=q align=4 words (r1.2)
//.declare V0595 (761)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0597 (763)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0602 (768)  rf=r size=32 type=d align=32 words (r135.0)
//.declare V0603 (769)  rf=r size=32 type=q alias=V0602+0 align=32 words (r135.0)
//.declare V0605 (771)  rf=r size=32 type=d align=32 words (r177.0)
//.declare V0606 (772)  rf=r size=32 type=q alias=V0605+0 align=32 words (r177.0)
//.declare V0607 (773)  rf=r size=32 type=d align=32 words (r176.0)
//.declare V0608 (774)  rf=r size=32 type=q alias=V0607+0 align=32 words (r176.0)
//.declare V0609 (775)  rf=r size=32 type=d align=32 words (r3.0)
//.declare V0610 (776)  rf=r size=32 type=q alias=V0609+0 align=32 words (r3.0)
//.declare V0611 (777)  rf=r size=32 type=d align=32 words (r2.0)
//.declare V0612 (778)  rf=r size=32 type=q alias=V0611+0 align=32 words (r2.0)
//.declare V0613 (779)  rf=r size=512 type=f align=32 words (r111.0)
//.declare V0614 (780)  rf=r size=512 type=f align=32 words (r103.0)
//.declare V0615 (781)  rf=r size=512 type=f align=32 words (r95.0)
//.declare V0616 (782)  rf=r size=512 type=f align=32 words (r87.0)
//.declare V0617 (783)  rf=r size=512 type=f align=32 words (r79.0)
//.declare V0618 (784)  rf=r size=512 type=f align=32 words (r71.0)
//.declare V0619 (785)  rf=r size=512 type=f align=32 words (r63.0)
//.declare V0620 (786)  rf=r size=512 type=f align=32 words (r55.0)
//.declare V0621 (787)  rf=r size=4 type=d align=2 words (r1.2)
//.declare V0622 (788)  rf=r size=4 type=d align=2 words (r1.1)
//.declare  (789)  rf=r size=32 type=ud align=32 words (r7.0)
//.declare V0623 (790)  rf=r size=4 type=d align=2 words (r1.3)
//.declare V0624 (791)  rf=r size=4 type=d align=2 words (r1.3)
//.declare V0625 (792)  rf=r size=4 type=ud alias=V0623+0 align=2 words (r1.3)
//.declare V0626 (793)  rf=r size=4 type=ud alias=V0624+0 align=2 words (r1.3)
//.declare V0627 (794)  rf=r size=512 type=w align=32 words (r127.0)
//.declare V0628 (795)  rf=r size=512 type=w align=32 words (r119.0)
//.declare V0630 (797)  rf=r size=512 type=w align=32 words (r47.0)
//.declare V0631 (798)  rf=r size=512 type=w align=32 words (r39.0)
//.declare P149 (799)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare DST (801)  rf=r size=512 type=f alias=V0620+0 align=32 words (r55.0)
//.declare SRC1_UD (802)  rf=r size=512 type=ud alias=V0627+0 align=32 words (r127.0)
//.declare SRC2_UD (803)  rf=r size=256 type=ud alias=V0065+0 align=32 words (r7.0)
//.declare V0633 (804)  rf=r size=1792 type=w alias=V0065+256 align=32 words (r11.0)
//.declare DST (805)  rf=r size=512 type=f alias=V0619+0 align=32 words (r63.0)
//.declare SRC1_UD (806)  rf=r size=512 type=ud alias=V0627+0 align=32 words (r127.0)
//.declare SRC2_UD (807)  rf=r size=256 type=ud alias=V0633+0 align=32 words (r11.0)
//.declare V0634 (808)  rf=r size=1536 type=w alias=V0065+512 align=32 words (r15.0)
//.declare DST (809)  rf=r size=512 type=f alias=V0618+0 align=32 words (r71.0)
//.declare SRC1_UD (810)  rf=r size=512 type=ud alias=V0627+0 align=32 words (r127.0)
//.declare SRC2_UD (811)  rf=r size=256 type=ud alias=V0634+0 align=32 words (r15.0)
//.declare V0635 (812)  rf=r size=1280 type=w alias=V0065+768 align=32 words (r19.0)
//.declare DST (813)  rf=r size=512 type=f alias=V0617+0 align=32 words (r79.0)
//.declare SRC1_UD (814)  rf=r size=512 type=ud alias=V0627+0 align=32 words (r127.0)
//.declare SRC2_UD (815)  rf=r size=256 type=ud alias=V0635+0 align=32 words (r19.0)
//.declare DST (816)  rf=r size=512 type=f alias=V0613+0 align=32 words (r111.0)
//.declare SRC1_UD (817)  rf=r size=512 type=ud alias=V0628+0 align=32 words (r119.0)
//.declare SRC2_UD (818)  rf=r size=256 type=ud alias=V0635+0 align=32 words (r19.0)
//.declare DST (819)  rf=r size=512 type=f alias=V0614+0 align=32 words (r103.0)
//.declare SRC1_UD (820)  rf=r size=512 type=ud alias=V0628+0 align=32 words (r119.0)
//.declare SRC2_UD (821)  rf=r size=256 type=ud alias=V0634+0 align=32 words (r15.0)
//.declare DST (822)  rf=r size=512 type=f alias=V0615+0 align=32 words (r95.0)
//.declare SRC1_UD (823)  rf=r size=512 type=ud alias=V0628+0 align=32 words (r119.0)
//.declare SRC2_UD (824)  rf=r size=256 type=ud alias=V0633+0 align=32 words (r11.0)
//.declare DST (825)  rf=r size=512 type=f alias=V0616+0 align=32 words (r87.0)
//.declare SRC1_UD (826)  rf=r size=512 type=ud alias=V0628+0 align=32 words (r119.0)
//.declare SRC2_UD (827)  rf=r size=256 type=ud alias=V0065+0 align=32 words (r7.0)
//.declare V0636 (828)  rf=r size=1024 type=w alias=V0065+1024 align=32 words (r23.0)
//.declare DST (829)  rf=r size=512 type=f alias=V0620+0 align=32 words (r55.0)
//.declare SRC1_UD (830)  rf=r size=512 type=ud alias=V0630+0 align=32 words (r47.0)
//.declare SRC2_UD (831)  rf=r size=256 type=ud alias=V0636+0 align=32 words (r23.0)
//.declare V0637 (832)  rf=r size=768 type=w alias=V0065+1280 align=32 words (r27.0)
//.declare DST (833)  rf=r size=512 type=f alias=V0619+0 align=32 words (r63.0)
//.declare SRC1_UD (834)  rf=r size=512 type=ud alias=V0630+0 align=32 words (r47.0)
//.declare SRC2_UD (835)  rf=r size=256 type=ud alias=V0637+0 align=32 words (r27.0)
//.declare V0638 (836)  rf=r size=512 type=w alias=V0065+1536 align=32 words (r31.0)
//.declare DST (837)  rf=r size=512 type=f alias=V0618+0 align=32 words (r71.0)
//.declare SRC1_UD (838)  rf=r size=512 type=ud alias=V0630+0 align=32 words (r47.0)
//.declare SRC2_UD (839)  rf=r size=256 type=ud alias=V0638+0 align=32 words (r31.0)
//.declare V0639 (840)  rf=r size=256 type=w alias=V0065+1792 align=32 words (r35.0)
//.declare DST (841)  rf=r size=512 type=f alias=V0617+0 align=32 words (r79.0)
//.declare SRC1_UD (842)  rf=r size=512 type=ud alias=V0630+0 align=32 words (r47.0)
//.declare SRC2_UD (843)  rf=r size=256 type=ud alias=V0639+0 align=32 words (r35.0)
//.declare DST (844)  rf=r size=512 type=f alias=V0613+0 align=32 words (r111.0)
//.declare SRC1_UD (845)  rf=r size=512 type=ud alias=V0631+0 align=32 words (r39.0)
//.declare SRC2_UD (846)  rf=r size=256 type=ud alias=V0639+0 align=32 words (r35.0)
//.declare DST (847)  rf=r size=512 type=f alias=V0614+0 align=32 words (r103.0)
//.declare SRC1_UD (848)  rf=r size=512 type=ud alias=V0631+0 align=32 words (r39.0)
//.declare SRC2_UD (849)  rf=r size=256 type=ud alias=V0638+0 align=32 words (r31.0)
//.declare DST (850)  rf=r size=512 type=f alias=V0615+0 align=32 words (r95.0)
//.declare SRC1_UD (851)  rf=r size=512 type=ud alias=V0631+0 align=32 words (r39.0)
//.declare SRC2_UD (852)  rf=r size=256 type=ud alias=V0637+0 align=32 words (r27.0)
//.declare DST (853)  rf=r size=512 type=f alias=V0616+0 align=32 words (r87.0)
//.declare SRC1_UD (854)  rf=r size=512 type=ud alias=V0631+0 align=32 words (r39.0)
//.declare SRC2_UD (855)  rf=r size=256 type=ud alias=V0636+0 align=32 words (r23.0)
//.declare P150 (856)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare V0640 (857)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0642 (859)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0643 (860)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0644 (861)  rf=r size=64 type=f align=32 words (r10.0)
//.declare V0645 (862)  rf=r size=8 type=uq alias=V0643+0 align=32 words (r4.0)
//.declare V0646 (863)  rf=r size=32 type=f align=32 words (r7.0)
//.declare V0647 (864)  rf=r size=32 type=f align=32 words (r3.0)
//.declare V0648 (865)  rf=r size=64 type=f align=32 words (r2.0)
//.declare V0649 (866)  rf=r size=64 type=f align=32 words (r2.0)
//.declare V0651 (868)  rf=r size=64 type=f align=32 words (r2.0)
//.declare V0652 (869)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0653 (870)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0655 (872)  rf=r size=64 type=f align=32 words (r133.0)
//.declare V0656 (873)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0657 (874)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0659 (876)  rf=r size=64 type=f align=32 words (r124.0)
//.declare V0660 (877)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0661 (878)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0663 (880)  rf=r size=64 type=f align=32 words (r125.0)
//.declare V0664 (881)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0665 (882)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0667 (884)  rf=r size=64 type=f align=32 words (r126.0)
//.declare V0668 (885)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0669 (886)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0671 (888)  rf=r size=64 type=f align=32 words (r127.0)
//.declare V0672 (889)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0673 (890)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0675 (892)  rf=r size=64 type=f align=32 words (r128.0)
//.declare V0676 (893)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0677 (894)  rf=r size=64 type=f align=32 words (r8.0)
//.declare V0679 (896)  rf=r size=64 type=f align=32 words (r129.0)
//.declare V0680 (897)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0682 (899)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0683 (900)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0684 (901)  rf=r size=8 type=uq alias=V0683+0 align=32 words (r4.0)
//.declare V0685 (902)  rf=r size=32 type=f align=32 words (r9.0)
//.declare V0686 (903)  rf=r size=32 type=f align=32 words (r8.0)
//.declare V0687 (904)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0688 (905)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0690 (907)  rf=r size=64 type=f align=32 words (r130.0)
//.declare V0691 (908)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0692 (909)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0694 (911)  rf=r size=64 type=f align=32 words (r131.0)
//.declare V0695 (912)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0696 (913)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0698 (915)  rf=r size=64 type=f align=32 words (r132.0)
//.declare V0699 (916)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0700 (917)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0702 (919)  rf=r size=64 type=f align=32 words (r134.0)
//.declare V0703 (920)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0704 (921)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0706 (923)  rf=r size=64 type=f align=32 words (r176.0)
//.declare V0707 (924)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0708 (925)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0710 (927)  rf=r size=64 type=f align=32 words (r177.0)
//.declare V0711 (928)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0712 (929)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0714 (931)  rf=r size=64 type=f align=32 words (r178.0)
//.declare V0715 (932)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0716 (933)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0718 (935)  rf=r size=64 type=f align=32 words (r179.0)
//.declare V0719 (936)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0721 (938)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0722 (939)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0723 (940)  rf=r size=8 type=uq alias=V0722+0 align=32 words (r4.0)
//.declare V0724 (941)  rf=r size=4 type=f align=32 words (r20.0)
//.declare V0725 (942)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0727 (944)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0728 (945)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0729 (946)  rf=r size=8 type=uq alias=V0728+0 align=32 words (r4.0)
//.declare V0730 (947)  rf=r size=4 type=f align=32 words (r19.0)
//.declare V0731 (948)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0733 (950)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0734 (951)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0735 (952)  rf=r size=8 type=uq alias=V0734+0 align=32 words (r4.0)
//.declare V0736 (953)  rf=r size=4 type=f align=32 words (r18.0)
//.declare V0737 (954)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0739 (956)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0740 (957)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0741 (958)  rf=r size=8 type=uq alias=V0740+0 align=32 words (r4.0)
//.declare V0742 (959)  rf=r size=4 type=f align=32 words (r17.0)
//.declare V0743 (960)  rf=r size=4 type=f align=32 words (r26.0)
//.declare V0744 (961)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0745 (962)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0747 (964)  rf=r size=64 type=f align=32 words (r181.0)
//.declare V0748 (965)  rf=r size=4 type=f align=32 words (r24.0)
//.declare V0749 (966)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0750 (967)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0752 (969)  rf=r size=64 type=f align=32 words (r182.0)
//.declare V0753 (970)  rf=r size=4 type=f align=32 words (r22.0)
//.declare V0754 (971)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0755 (972)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0757 (974)  rf=r size=64 type=f align=32 words (r183.0)
//.declare V0758 (975)  rf=r size=4 type=f align=32 words (r16.0)
//.declare V0759 (976)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0760 (977)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0762 (979)  rf=r size=64 type=f align=32 words (r184.0)
//.declare V0763 (980)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0765 (982)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0766 (983)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0767 (984)  rf=r size=8 type=uq alias=V0766+0 align=32 words (r4.0)
//.declare V0768 (985)  rf=r size=4 type=f align=32 words (r15.0)
//.declare V0769 (986)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0771 (988)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0772 (989)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0773 (990)  rf=r size=8 type=uq alias=V0772+0 align=32 words (r4.0)
//.declare V0774 (991)  rf=r size=4 type=f align=32 words (r14.0)
//.declare V0775 (992)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0777 (994)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0778 (995)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0779 (996)  rf=r size=8 type=uq alias=V0778+0 align=32 words (r4.0)
//.declare V0780 (997)  rf=r size=4 type=f align=32 words (r13.0)
//.declare V0781 (998)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0783 (1000)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0784 (1001)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0785 (1002)  rf=r size=8 type=uq alias=V0784+0 align=32 words (r4.0)
//.declare V0786 (1003)  rf=r size=4 type=f align=32 words (r12.0)
//.declare V0787 (1004)  rf=r size=4 type=f align=32 words (r25.0)
//.declare V0788 (1005)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0789 (1006)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0791 (1008)  rf=r size=64 type=f align=32 words (r185.0)
//.declare V0792 (1009)  rf=r size=4 type=f align=32 words (r23.0)
//.declare V0793 (1010)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0794 (1011)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0796 (1013)  rf=r size=64 type=f align=32 words (r186.0)
//.declare V0797 (1014)  rf=r size=4 type=f align=32 words (r21.0)
//.declare V0798 (1015)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0799 (1016)  rf=r size=64 type=f align=32 words (r11.0)
//.declare V0801 (1018)  rf=r size=64 type=f align=32 words (r187.0)
//.declare V0802 (1019)  rf=r size=4 type=f align=32 words (r11.0)
//.declare V0803 (1020)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0804 (1021)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0806 (1023)  rf=r size=64 type=f align=32 words (r188.0)
//.declare V0807 (1024)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0809 (1026)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0810 (1027)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0811 (1028)  rf=r size=8 type=uq alias=V0810+0 align=32 words (r4.0)
//.declare V0812 (1029)  rf=r size=4 type=f align=32 words (r34.0)
//.declare V0813 (1030)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0815 (1032)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0816 (1033)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0817 (1034)  rf=r size=8 type=uq alias=V0816+0 align=32 words (r4.0)
//.declare V0818 (1035)  rf=r size=4 type=f align=32 words (r33.0)
//.declare V0819 (1036)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0821 (1038)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0822 (1039)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0823 (1040)  rf=r size=8 type=uq alias=V0822+0 align=32 words (r4.0)
//.declare V0824 (1041)  rf=r size=4 type=f align=32 words (r32.0)
//.declare V0825 (1042)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0827 (1044)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0828 (1045)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0829 (1046)  rf=r size=8 type=uq alias=V0828+0 align=32 words (r4.0)
//.declare V0830 (1047)  rf=r size=4 type=f align=32 words (r31.0)
//.declare V0831 (1048)  rf=r size=4 type=f align=32 words (r40.0)
//.declare V0832 (1049)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0833 (1050)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0835 (1052)  rf=r size=64 type=f align=32 words (r189.0)
//.declare V0836 (1053)  rf=r size=4 type=f align=32 words (r38.0)
//.declare V0837 (1054)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0838 (1055)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0840 (1057)  rf=r size=64 type=f align=32 words (r190.0)
//.declare V0841 (1058)  rf=r size=4 type=f align=32 words (r36.0)
//.declare V0842 (1059)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0843 (1060)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0845 (1062)  rf=r size=64 type=f align=32 words (r191.0)
//.declare V0846 (1063)  rf=r size=4 type=f align=32 words (r30.0)
//.declare V0847 (1064)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0848 (1065)  rf=r size=64 type=f align=32 words (r27.0)
//.declare V0850 (1067)  rf=r size=64 type=f align=32 words (r192.0)
//.declare V0851 (1068)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0853 (1070)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0854 (1071)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0855 (1072)  rf=r size=8 type=uq alias=V0854+0 align=32 words (r4.0)
//.declare V0856 (1073)  rf=r size=4 type=f align=32 words (r29.0)
//.declare V0857 (1074)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0859 (1076)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0860 (1077)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0861 (1078)  rf=r size=8 type=uq alias=V0860+0 align=32 words (r4.0)
//.declare V0862 (1079)  rf=r size=4 type=f align=32 words (r28.0)
//.declare V0863 (1080)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0865 (1082)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0866 (1083)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0867 (1084)  rf=r size=8 type=uq alias=V0866+0 align=32 words (r4.0)
//.declare V0868 (1085)  rf=r size=4 type=f align=32 words (r27.0)
//.declare V0869 (1086)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0871 (1088)  rf=r size=8 type=q align=4 words (r1.1)
//.declare V0872 (1089)  rf=r size=8 type=q align=32 words (r4.0)
//.declare V0873 (1090)  rf=r size=8 type=uq alias=V0872+0 align=32 words (r4.0)
//.declare V0874 (1091)  rf=r size=4 type=f align=32 words (r35.0)
//.declare V0875 (1092)  rf=r size=4 type=f align=32 words (r41.0)
//.declare V0876 (1093)  rf=r size=4 type=f align=32 words (r39.0)
//.declare V0877 (1094)  rf=r size=4 type=f align=32 words (r37.0)
//.declare V0878 (1095)  rf=r size=4 type=f align=32 words (r4.0)
//.declare V0879 (1096)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0880 (1097)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0882 (1099)  rf=r size=64 type=f align=32 words (r193.0)
//.declare V0883 (1100)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0884 (1101)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0886 (1103)  rf=r size=64 type=f align=32 words (r194.0)
//.declare V0887 (1104)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0888 (1105)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0890 (1107)  rf=r size=64 type=f align=32 words (r195.0)
//.declare V0891 (1108)  rf=r size=64 type=f align=32 words (r10.0)
//.declare V0892 (1109)  rf=r size=64 type=f align=32 words (r10.0)
//.declare V0894 (1111)  rf=r size=64 type=f align=32 words (r196.0)
//.declare V0895 (1112)  rf=r size=64 type=f align=32 words (r10.0)
//.declare V0896 (1113)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0897 (1114)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0899 (1116)  rf=r size=64 type=f align=32 words (r197.0)
//.declare V0900 (1117)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0901 (1118)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0903 (1120)  rf=r size=64 type=f align=32 words (r198.0)
//.declare V0904 (1121)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0905 (1122)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0907 (1124)  rf=r size=64 type=f align=32 words (r199.0)
//.declare V0908 (1125)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0909 (1126)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0911 (1128)  rf=r size=64 type=f align=32 words (r200.0)
//.declare V0912 (1129)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0913 (1130)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0915 (1132)  rf=r size=64 type=f align=32 words (r201.0)
//.declare V0916 (1133)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0917 (1134)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0919 (1136)  rf=r size=64 type=f align=32 words (r202.0)
//.declare V0920 (1137)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0921 (1138)  rf=r size=64 type=f align=32 words (r42.0)
//.declare V0923 (1140)  rf=r size=64 type=f align=32 words (r203.0)
//.declare V0924 (1141)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0925 (1142)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0927 (1144)  rf=r size=64 type=f align=32 words (r204.0)
//.declare V0928 (1145)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0929 (1146)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0931 (1148)  rf=r size=64 type=f align=32 words (r205.0)
//.declare V0932 (1149)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0933 (1150)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0935 (1152)  rf=r size=64 type=f align=32 words (r206.0)
//.declare V0936 (1153)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0937 (1154)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0939 (1156)  rf=r size=64 type=f align=32 words (r207.0)
//.declare V0940 (1157)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0941 (1158)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0943 (1160)  rf=r size=64 type=f align=32 words (r208.0)
//.declare V0944 (1161)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0945 (1162)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0947 (1164)  rf=r size=64 type=f align=32 words (r209.0)
//.declare V0948 (1165)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0949 (1166)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0951 (1168)  rf=r size=64 type=f align=32 words (r210.0)
//.declare V0952 (1169)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0953 (1170)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0955 (1172)  rf=r size=64 type=f align=32 words (r211.0)
//.declare V0956 (1173)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0957 (1174)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0959 (1176)  rf=r size=64 type=f align=32 words (r212.0)
//.declare V0960 (1177)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0961 (1178)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0963 (1180)  rf=r size=64 type=f align=32 words (r213.0)
//.declare V0964 (1181)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0965 (1182)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0967 (1184)  rf=r size=64 type=f align=32 words (r214.0)
//.declare V0968 (1185)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0969 (1186)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0971 (1188)  rf=r size=64 type=f align=32 words (r215.0)
//.declare V0972 (1189)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0973 (1190)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0975 (1192)  rf=r size=64 type=f align=32 words (r216.0)
//.declare V0976 (1193)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0977 (1194)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0979 (1196)  rf=r size=64 type=f align=32 words (r217.0)
//.declare V0980 (1197)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0981 (1198)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0983 (1200)  rf=r size=64 type=f align=32 words (r218.0)
//.declare V0984 (1201)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0985 (1202)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0987 (1204)  rf=r size=64 type=f align=32 words (r219.0)
//.declare V0988 (1205)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0989 (1206)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0991 (1208)  rf=r size=64 type=f align=32 words (r220.0)
//.declare V0992 (1209)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0993 (1210)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0995 (1212)  rf=r size=64 type=f align=32 words (r221.0)
//.declare V0996 (1213)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0997 (1214)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V0999 (1216)  rf=r size=64 type=f align=32 words (r222.0)
//.declare V1000 (1217)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1001 (1218)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1003 (1220)  rf=r size=64 type=f align=32 words (r223.0)
//.declare V1004 (1221)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1005 (1222)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1007 (1224)  rf=r size=64 type=f align=32 words (r224.0)
//.declare V1008 (1225)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1009 (1226)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1011 (1228)  rf=r size=64 type=f align=32 words (r228.0)
//.declare V1012 (1229)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1013 (1230)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1015 (1232)  rf=r size=64 type=f align=32 words (r229.0)
//.declare V1016 (1233)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1017 (1234)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1019 (1236)  rf=r size=64 type=f align=32 words (r230.0)
//.declare V1020 (1237)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1021 (1238)  rf=r size=64 type=f align=32 words (r3.0)
//.declare V1023 (1240)  rf=r size=64 type=f align=32 words (r231.0)
//.declare V1025 (1242)  rf=r size=768 type=uq alias=V0067+0 align=32 words (r26.0)
//.declare V1026 (1243)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1027 (1244)  rf=r size=512 type=w alias=V0069+0 align=32 words (r26.0)
//.declare V1028 (1245)  rf=r size=256 type=w align=32 words (r168.0)
//.declare V1030 (1247)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1032 (1249)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1034 (1251)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1036 (1253)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1038 (1255)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1040 (1257)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1042 (1259)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1044 (1261)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1045 (1262)  rf=r size=256 type=w align=32 words (r164.0)
//.declare V1047 (1264)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1049 (1266)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1051 (1268)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1053 (1270)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1055 (1272)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1057 (1274)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1059 (1276)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1061 (1278)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1062 (1279)  rf=r size=256 type=w align=32 words (r160.0)
//.declare V1064 (1281)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1066 (1283)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1068 (1285)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1070 (1287)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1072 (1289)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1074 (1291)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1076 (1293)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1078 (1295)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1079 (1296)  rf=r size=256 type=w align=32 words (r156.0)
//.declare V1081 (1298)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1083 (1300)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1085 (1302)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1087 (1304)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1089 (1306)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1091 (1308)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1093 (1310)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1095 (1312)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1096 (1313)  rf=r size=256 type=w align=32 words (r152.0)
//.declare V1098 (1315)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1100 (1317)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1102 (1319)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1104 (1321)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1106 (1323)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1108 (1325)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1110 (1327)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1112 (1329)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1113 (1330)  rf=r size=256 type=w align=32 words (r148.0)
//.declare V1115 (1332)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1117 (1334)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1119 (1336)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1121 (1338)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1123 (1340)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1125 (1342)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1127 (1344)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1129 (1346)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1130 (1347)  rf=r size=256 type=w align=32 words (r144.0)
//.declare V1132 (1349)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1134 (1351)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1136 (1353)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1138 (1355)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1140 (1357)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1142 (1359)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1144 (1361)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1146 (1363)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1147 (1364)  rf=r size=256 type=w align=32 words (r140.0)
//.declare V1149 (1366)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1151 (1368)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1153 (1370)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1155 (1372)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1157 (1374)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1159 (1376)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1161 (1378)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare P151 (1379)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare P152 (1380)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1381)  rf=r size=4 type=ud alias=SR+28 align=2 words (r254.7) Output
//.declare  (1382)  rf=r size=64 type=ud align=32 words (r240.0)
//.declare  (1383)  rf=r size=4 type=d alias=V0113+0 align=2 words (r1.10)
//.declare  (1384)  rf=r size=4 type=d alias=V0216+0 align=2 words (r2.8)
//.declare  (1385)  rf=r size=4 type=d alias=V0195+0 align=2 words (r1.8)
//.declare  (1386)  rf=r size=4 type=d alias=V0195+0 align=2 words (r1.8)
//.declare  (1387)  rf=r size=4 type=d alias=V0195+0 align=2 words (r1.8)
//.declare  (1388)  rf=r size=16 type=df align=8 words (r1.4)
//.declare  (1389)  rf=r size=8 type=ud align=8 words (r1.12)
//.declare  (1390)  rf=r size=8 type=f align=8 words (r1.8)
//.declare  (1391)  rf=r size=8 type=ud align=8 words (r2.8)
//.declare  (1392)  rf=r size=8 type=f align=8 words (r2.8)
//.declare  (1393)  rf=r size=8 type=ud align=8 words (r2.12)
//.declare  (1394)  rf=r size=8 type=f align=8 words (r2.8)
//.declare  (1395)  rf=r size=8 type=ud align=8 words (r2.12)
//.declare  (1396)  rf=r size=8 type=d align=8 words (r135.12)
//.declare  (1397)  rf=r size=8 type=d align=8 words (r1.0)
//.declare  (1398)  rf=r size=8 type=d align=8 words (r180.4)
//.declare  (1399)  rf=r size=8 type=d align=8 words (r235.4)
//.declare  (1400)  rf=r size=8 type=d align=8 words (r180.12)
//.declare  (1401)  rf=r size=8 type=f align=8 words (r1.4)
//.declare  (1402)  rf=r size=8 type=ud align=8 words (r1.8)
//.declare  (1403)  rf=r size=8 type=uq alias=V0602+24 align=4 words (r135.3)
//.declare  (1404)  rf=r size=4 type=d align=2 words (r1.8)
//.declare  (1405)  rf=r size=2 type=w align=1 words (r1.16)
//.declare  (1406)  rf=r size=4 type=f align=2 words (r1.8)
//.declare  (1407)  rf=r size=2 type=w align=1 words (r1.20)
//.declare  (1408)  rf=r size=4 type=f align=2 words (r1.10)
//.declare  (1409)  rf=r size=4 type=f align=2 words (r1.11)
//.declare  (1410)  rf=r size=2 type=w align=1 words (r1.0)
//.declare  (1411)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (1412)  rf=r size=2 type=w align=1 words (r1.2)
//.declare  (1413)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (1414)  rf=r size=4 type=f align=2 words (r1.5)
//.declare  (1415)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1416)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1417)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1418)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1419)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1420)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1421)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1422)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1423)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1424)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1425)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1426)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1427)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1428)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1429)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1430)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1431)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1432)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1433)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1434)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1435)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1436)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1437)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1438)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1439)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1440)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1441)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1442)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1443)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1444)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1445)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1446)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1447)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1448)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1449)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1450)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1451)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1452)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1453)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1454)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1455)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1456)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1457)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1458)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1459)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1460)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1461)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1462)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1463)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1464)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1465)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1466)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1467)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1468)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1469)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1470)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1471)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1472)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1473)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1474)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1475)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1476)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1477)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (1478)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare be_fp (1479)  rf=r size=4 type=ud align=2 words (r255.3)
//.declare be_sp (1480)  rf=r size=4 type=ud align=2 words (r255.2)
//.declare SR (1481)  rf=r size=64 type=ud align=32 words (r254.0)
//.declare VCE_SAVE (1482)  rf=r size=8256 type=ud align=32 words (r124.0)
//.declare  (1483)  rf=r size=7872 type=ud align=32 words
//.declare  (1484)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1485)  rf=f128  size=16 type=uw align=1 words
//.declare  (1486)  rf=r size=7872 type=ud align=32 words
//.declare  (1487)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1488)  rf=f128  size=16 type=uw align=1 words
//.declare  (1489)  rf=r size=7872 type=ud align=32 words
//.declare  (1490)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1491)  rf=f128  size=16 type=uw align=1 words
//.declare  (1492)  rf=r size=7872 type=ud align=32 words
//.declare  (1493)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1494)  rf=f128  size=16 type=uw align=1 words
//.declare  (1495)  rf=r size=7872 type=ud align=32 words
//.declare  (1496)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1497)  rf=f128  size=16 type=uw align=1 words
//.declare  (1498)  rf=r size=7872 type=ud align=32 words
//.declare  (1499)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1500)  rf=f128  size=16 type=uw align=1 words
//.declare  (1501)  rf=r size=7872 type=ud align=32 words
//.declare  (1502)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1503)  rf=f128  size=16 type=uw align=1 words
//.declare  (1504)  rf=r size=7872 type=ud align=32 words
//.declare  (1505)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1506)  rf=f128  size=16 type=uw align=1 words
//.declare  (1507)  rf=r size=7872 type=ud align=32 words
//.declare  (1508)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1509)  rf=f128  size=16 type=uw align=1 words
//.declare  (1510)  rf=r size=7872 type=ud align=32 words
//.declare  (1511)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1512)  rf=f128  size=16 type=uw align=1 words
//.declare  (1513)  rf=r size=7872 type=ud align=32 words
//.declare  (1514)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1515)  rf=f128  size=16 type=uw align=1 words
//.declare  (1516)  rf=r size=7872 type=ud align=32 words
//.declare  (1517)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1518)  rf=f128  size=16 type=uw align=1 words
//.declare  (1519)  rf=r size=7872 type=ud align=32 words
//.declare  (1520)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1521)  rf=f128  size=16 type=uw align=1 words
//.declare  (1522)  rf=r size=7872 type=ud align=32 words
//.declare  (1523)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1524)  rf=f128  size=16 type=uw align=1 words
//.declare  (1525)  rf=r size=7872 type=ud align=32 words
//.declare  (1526)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1527)  rf=f128  size=16 type=uw align=1 words
//.declare  (1528)  rf=r size=7872 type=ud align=32 words
//.declare  (1529)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1530)  rf=f128  size=16 type=uw align=1 words
//.declare  (1531)  rf=r size=7872 type=ud align=32 words
//.declare  (1532)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1533)  rf=f128  size=16 type=uw align=1 words
//.declare  (1534)  rf=r size=7872 type=ud align=32 words
//.declare  (1535)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1536)  rf=f128  size=16 type=uw align=1 words
//.declare  (1537)  rf=r size=7872 type=ud align=32 words
//.declare  (1538)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1539)  rf=f128  size=16 type=uw align=1 words
//.declare  (1540)  rf=r size=7872 type=ud align=32 words
//.declare  (1541)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1542)  rf=f128  size=16 type=uw align=1 words
//.declare  (1543)  rf=r size=7872 type=ud align=32 words
//.declare  (1544)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1545)  rf=f128  size=16 type=uw align=1 words
//.declare  (1546)  rf=r size=7872 type=ud align=32 words
//.declare  (1547)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1548)  rf=f128  size=16 type=uw align=1 words
//.declare  (1549)  rf=r size=7872 type=ud align=32 words
//.declare  (1550)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1551)  rf=f128  size=16 type=uw align=1 words
//.declare  (1552)  rf=r size=7872 type=ud align=32 words
//.declare  (1553)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1554)  rf=f128  size=16 type=uw align=1 words
//.declare  (1555)  rf=r size=7872 type=ud align=32 words
//.declare  (1556)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1557)  rf=f128  size=16 type=uw align=1 words
//.declare  (1558)  rf=r size=7872 type=ud align=32 words
//.declare  (1559)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1560)  rf=f128  size=16 type=uw align=1 words
//.declare  (1561)  rf=r size=7872 type=ud align=32 words
//.declare  (1562)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1563)  rf=f128  size=16 type=uw align=1 words
//.declare  (1564)  rf=r size=7872 type=ud align=32 words
//.declare  (1565)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1566)  rf=f128  size=16 type=uw align=1 words
//.declare  (1567)  rf=r size=7872 type=ud align=32 words
//.declare  (1568)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1569)  rf=f128  size=16 type=uw align=1 words
//.declare  (1570)  rf=r size=7872 type=ud align=32 words
//.declare  (1571)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1572)  rf=f128  size=16 type=uw align=1 words
//.declare  (1573)  rf=r size=7872 type=ud align=32 words
//.declare  (1574)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1575)  rf=f128  size=16 type=uw align=1 words
//.declare  (1576)  rf=r size=7872 type=ud align=32 words
//.declare  (1577)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1578)  rf=f128  size=16 type=uw align=1 words
//.declare  (1579)  rf=r size=7872 type=ud align=32 words
//.declare  (1580)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1581)  rf=f128  size=16 type=uw align=1 words
//.declare  (1582)  rf=r size=7872 type=ud align=32 words
//.declare  (1583)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1584)  rf=f128  size=16 type=uw align=1 words
//.declare  (1585)  rf=r size=7872 type=ud align=32 words
//.declare  (1586)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1587)  rf=f128  size=16 type=uw align=1 words
//.declare  (1588)  rf=r size=7872 type=ud align=32 words
//.declare  (1589)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1590)  rf=f128  size=16 type=uw align=1 words
//.declare  (1591)  rf=r size=7872 type=ud align=32 words
//.declare  (1592)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1593)  rf=f128  size=16 type=uw align=1 words
//.declare  (1594)  rf=r size=7872 type=ud align=32 words
//.declare  (1595)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1596)  rf=f128  size=16 type=uw align=1 words
//.declare  (1597)  rf=r size=7872 type=ud align=32 words
//.declare  (1598)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1599)  rf=f128  size=16 type=uw align=1 words
//.declare  (1600)  rf=r size=7872 type=ud align=32 words
//.declare  (1601)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1602)  rf=f128  size=16 type=uw align=1 words
//.declare  (1603)  rf=r size=7872 type=ud align=32 words
//.declare  (1604)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1605)  rf=f128  size=16 type=uw align=1 words
//.declare  (1606)  rf=r size=7872 type=ud align=32 words
//.declare  (1607)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1608)  rf=f128  size=16 type=uw align=1 words
//.declare  (1609)  rf=r size=7872 type=ud align=32 words
//.declare  (1610)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1611)  rf=f128  size=16 type=uw align=1 words
//.declare  (1612)  rf=r size=7872 type=ud align=32 words
//.declare  (1613)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1614)  rf=f128  size=16 type=uw align=1 words
//.declare  (1615)  rf=r size=7872 type=ud align=32 words
//.declare  (1616)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1617)  rf=f128  size=16 type=uw align=1 words
//.declare  (1618)  rf=r size=7872 type=ud align=32 words
//.declare  (1619)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1620)  rf=f128  size=16 type=uw align=1 words
//.declare  (1621)  rf=r size=7872 type=ud align=32 words
//.declare  (1622)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1623)  rf=f128  size=16 type=uw align=1 words
//.declare  (1624)  rf=r size=7872 type=ud align=32 words
//.declare  (1625)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1626)  rf=f128  size=16 type=uw align=1 words
//.declare  (1627)  rf=r size=7872 type=ud align=32 words
//.declare  (1628)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1629)  rf=f128  size=16 type=uw align=1 words
//.declare  (1630)  rf=r size=7872 type=ud align=32 words
//.declare  (1631)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1632)  rf=f128  size=16 type=uw align=1 words
//.declare  (1633)  rf=r size=7872 type=ud align=32 words
//.declare  (1634)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1635)  rf=f128  size=16 type=uw align=1 words
//.declare  (1636)  rf=r size=7872 type=ud align=32 words
//.declare  (1637)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1638)  rf=f128  size=16 type=uw align=1 words
//.declare  (1639)  rf=r size=7872 type=ud align=32 words
//.declare  (1640)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1641)  rf=f128  size=16 type=uw align=1 words
//.declare  (1642)  rf=r size=7872 type=ud align=32 words
//.declare  (1643)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1644)  rf=f128  size=16 type=uw align=1 words
//.declare  (1645)  rf=r size=7872 type=ud align=32 words
//.declare  (1646)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1647)  rf=f128  size=16 type=uw align=1 words
//.declare  (1648)  rf=r size=7872 type=ud align=32 words
//.declare  (1649)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1650)  rf=f128  size=16 type=uw align=1 words
//.declare  (1651)  rf=r size=7872 type=ud align=32 words
//.declare  (1652)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1653)  rf=f128  size=16 type=uw align=1 words
//.declare  (1654)  rf=r size=7872 type=ud align=32 words
//.declare  (1655)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1656)  rf=f128  size=16 type=uw align=1 words
//.declare  (1657)  rf=r size=7872 type=ud align=32 words
//.declare  (1658)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1659)  rf=f128  size=16 type=uw align=1 words
//.declare  (1660)  rf=r size=7872 type=ud align=32 words
//.declare  (1661)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1662)  rf=f128  size=16 type=uw align=1 words
//.declare  (1663)  rf=r size=7872 type=ud align=32 words
//.declare  (1664)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1665)  rf=f128  size=16 type=uw align=1 words
//.declare  (1666)  rf=r size=7872 type=ud align=32 words
//.declare  (1667)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1668)  rf=f128  size=16 type=uw align=1 words
//.declare  (1669)  rf=r size=7872 type=ud align=32 words
//.declare  (1670)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1671)  rf=f128  size=16 type=uw align=1 words
//.declare  (1672)  rf=r size=7872 type=ud align=32 words
//.declare  (1673)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (1674)  rf=f128  size=16 type=uw align=1 words
//.declare  (1675)  rf=r size=2 type=uw align=1 words (r237.24)
//.declare  (1676)  rf=r size=2 type=uw align=1 words (r237.23)
//.declare  (1677)  rf=r size=2 type=uw align=1 words (r237.22)
//.declare  (1678)  rf=r size=2 type=uw align=1 words (r237.21)
//.declare  (1679)  rf=r size=2 type=uw align=1 words (r237.20)
//.declare  (1680)  rf=r size=2 type=uw align=1 words (r237.19)
//.declare  (1681)  rf=r size=2 type=uw align=1 words (r237.18)
//.declare  (1682)  rf=r size=2 type=uw align=1 words (r237.17)
//.declare  (1683)  rf=r size=2 type=uw align=1 words (r237.16)
//.declare  (1684)  rf=r size=2 type=uw align=1 words (r237.15)
//.declare  (1685)  rf=r size=2 type=uw align=1 words (r237.14)
//.declare  (1686)  rf=r size=2 type=uw align=1 words (r237.13)
//.declare  (1687)  rf=r size=2 type=uw align=1 words (r237.12)
//.declare  (1688)  rf=r size=2 type=uw align=1 words (r237.11)
//.declare  (1689)  rf=r size=2 type=uw align=1 words (r237.10)
//.declare  (1690)  rf=r size=2 type=uw align=1 words (r236.31)
//.declare  (1691)  rf=r size=2 type=uw align=1 words (r236.30)
//.declare  (1692)  rf=r size=2 type=uw align=1 words (r236.29)
//.declare  (1693)  rf=r size=2 type=uw align=1 words (r236.28)
//.declare  (1694)  rf=r size=2 type=uw align=1 words (r236.27)
//.declare  (1695)  rf=r size=2 type=uw align=1 words (r236.26)
//.declare  (1696)  rf=r size=2 type=uw align=1 words (r236.25)
//.declare  (1697)  rf=r size=2 type=uw align=1 words (r236.24)
//.declare  (1698)  rf=r size=2 type=uw align=1 words (r236.23)
//.declare  (1699)  rf=r size=2 type=uw align=1 words (r236.22)
//.declare  (1700)  rf=r size=2 type=uw align=1 words (r236.19)
//.declare  (1701)  rf=r size=2 type=uw align=1 words (r236.18)
//.declare  (1702)  rf=r size=2 type=uw align=1 words (r237.26)
//.declare  (1703)  rf=r size=2 type=uw align=1 words (r237.25)
//.declare  (1704)  rf=r size=2 type=uw align=1 words (r237.28)
//.declare  (1705)  rf=r size=2 type=uw align=1 words (r237.27)
//.declare  (1706)  rf=r size=2 type=uw align=1 words (r237.30)
//.declare  (1707)  rf=r size=2 type=uw align=1 words (r237.29)
//.declare  (1708)  rf=r size=2 type=uw align=1 words (r238.2)
//.declare  (1709)  rf=r size=2 type=uw align=1 words (r237.31)
//.declare  (1710)  rf=r size=2 type=uw align=1 words (r238.4)
//.declare  (1711)  rf=r size=2 type=uw align=1 words (r238.3)
//.declare  (1712)  rf=r size=2 type=uw align=1 words (r238.6)
//.declare  (1713)  rf=r size=2 type=uw align=1 words (r238.5)
//.declare  (1714)  rf=r size=2 type=uw align=1 words (r238.10)
//.declare  (1715)  rf=r size=2 type=uw align=1 words (r238.9)
//.declare  (1716)  rf=r size=2 type=uw align=1 words (r238.8)
//.declare  (1717)  rf=r size=2 type=uw align=1 words (r238.7)
//.declare  (1718)  rf=r size=2 type=uw align=1 words (r238.12)
//.declare  (1719)  rf=r size=2 type=uw align=1 words (r238.11)
//.declare  (1720)  rf=r size=2 type=uw align=1 words (r238.14)
//.declare  (1721)  rf=r size=2 type=uw align=1 words (r238.13)
//.declare  (1722)  rf=r size=2 type=uw align=1 words (r238.16)
//.declare  (1723)  rf=r size=2 type=uw align=1 words (r238.15)
//.declare  (1724)  rf=r size=2 type=uw align=1 words (r238.18)
//.declare  (1725)  rf=r size=2 type=uw align=1 words (r238.17)
//.declare  (1726)  rf=r size=2 type=uw align=1 words (r238.20)
//.declare  (1727)  rf=r size=2 type=uw align=1 words (r238.19)
//.declare  (1728)  rf=r size=2 type=uw align=1 words (r238.22)
//.declare  (1729)  rf=r size=2 type=uw align=1 words (r238.21)
//.declare  (1730)  rf=r size=2 type=uw align=1 words (r238.25)
//.declare  (1731)  rf=r size=2 type=uw align=1 words (r238.24)
//.declare  (1732)  rf=r size=2 type=uw align=1 words (r238.23)
//.declare  (1733)  rf=r size=2 type=uw align=1 words (r238.26)
//.declare  (1734)  rf=r size=2 type=uw align=1 words (r238.27)
//.declare  (1735)  rf=r size=2 type=uw align=1 words (r240.31)
//.declare  (1736)  rf=r size=2 type=uw align=1 words (r240.30)
//.declare  (1737)  rf=r size=2 type=uw align=1 words (r240.29)
//.declare  (1738)  rf=r size=2 type=uw align=1 words (r240.28)
//.declare  (1739)  rf=r size=2 type=uw align=1 words (r240.27)
//.declare  (1740)  rf=r size=2 type=uw align=1 words (r240.26)
//.declare  (1741)  rf=r size=2 type=uw align=1 words (r240.25)
//.declare  (1742)  rf=r size=2 type=uw align=1 words (r240.24)
//.declare  (1743)  rf=r size=2 type=uw align=1 words (r240.23)
//.declare  (1744)  rf=r size=2 type=uw align=1 words (r240.22)
//.declare  (1745)  rf=r size=2 type=uw align=1 words (r240.21)
//.declare  (1746)  rf=r size=2 type=uw align=1 words (r240.20)
//.declare  (1747)  rf=r size=2 type=uw align=1 words (r240.19)
//.declare  (1748)  rf=r size=2 type=uw align=1 words (r240.18)
//.declare  (1749)  rf=r size=2 type=uw align=1 words (r240.17)
//.declare  (1750)  rf=r size=2 type=uw align=1 words (r240.16)
//.declare  (1751)  rf=r size=2 type=uw align=1 words (r240.15)
//.declare  (1752)  rf=r size=2 type=uw align=1 words (r240.14)
//.declare  (1753)  rf=r size=2 type=uw align=1 words (r240.13)
//.declare  (1754)  rf=r size=2 type=uw align=1 words (r240.12)
//.declare  (1755)  rf=r size=2 type=uw align=1 words (r240.11)
//.declare  (1756)  rf=r size=2 type=uw align=1 words (r240.10)
//.declare  (1757)  rf=r size=2 type=uw align=1 words (r240.9)
//.declare  (1758)  rf=r size=2 type=uw align=1 words (r240.8)
//.declare  (1759)  rf=r size=2 type=uw align=1 words (r240.7)
//.declare  (1760)  rf=r size=2 type=uw align=1 words (r240.6)
//.declare  (1761)  rf=r size=2 type=uw align=1 words (r240.5)
//.declare  (1762)  rf=r size=2 type=uw align=1 words (r240.4)
//.declare  (1763)  rf=r size=2 type=uw align=1 words (r240.3)
//.declare  (1764)  rf=r size=2 type=uw align=1 words (r240.2)
//.declare  (1765)  rf=r size=2 type=uw align=1 words (r239.31)
//.declare  (1766)  rf=r size=2 type=uw align=1 words (r239.30)
//.declare  (1767)  rf=r size=2 type=uw align=1 words (r239.29)
//.declare  (1768)  rf=r size=2 type=uw align=1 words (r239.28)
//.declare  (1769)  rf=r size=2 type=uw align=1 words (r239.27)
//.declare  (1770)  rf=r size=2 type=uw align=1 words (r239.26)
//.declare  (1771)  rf=r size=2 type=uw align=1 words (r239.25)
//.declare  (1772)  rf=r size=2 type=uw align=1 words (r239.24)
//.declare  (1773)  rf=r size=2 type=uw align=1 words (r239.23)
//.declare  (1774)  rf=r size=2 type=uw align=1 words (r239.22)
//.declare  (1775)  rf=r size=2 type=uw align=1 words (r239.21)
//.declare  (1776)  rf=r size=2 type=uw align=1 words (r239.20)
//.declare  (1777)  rf=r size=2 type=uw align=1 words (r239.19)
//.declare  (1778)  rf=r size=2 type=uw align=1 words (r239.18)
//.declare  (1779)  rf=r size=2 type=uw align=1 words (r239.17)
//.declare  (1780)  rf=r size=2 type=uw align=1 words (r239.16)
//.declare  (1781)  rf=r size=2 type=uw align=1 words (r239.15)
//.declare  (1782)  rf=r size=2 type=uw align=1 words (r239.14)
//.declare  (1783)  rf=r size=2 type=uw align=1 words (r239.13)
//.declare  (1784)  rf=r size=2 type=uw align=1 words (r239.12)
//.declare  (1785)  rf=r size=2 type=uw align=1 words (r239.11)
//.declare  (1786)  rf=r size=2 type=uw align=1 words (r239.10)
//.declare  (1787)  rf=r size=2 type=uw align=1 words (r239.9)
//.declare  (1788)  rf=r size=2 type=uw align=1 words (r239.8)
//.declare  (1789)  rf=r size=2 type=uw align=1 words (r239.7)
//.declare  (1790)  rf=r size=2 type=uw align=1 words (r239.6)
//.declare  (1791)  rf=r size=2 type=uw align=1 words (r239.5)
//.declare  (1792)  rf=r size=2 type=uw align=1 words (r239.4)
//.declare  (1793)  rf=r size=2 type=uw align=1 words (r239.3)
//.declare  (1794)  rf=r size=2 type=uw align=1 words (r239.2)
//.declare  (1795)  rf=r size=2 type=uw align=1 words (r238.31)
//.declare  (1796)  rf=r size=2 type=uw align=1 words (r238.30)
//.declare  (1797)  rf=r size=2 type=uw align=1 words (r238.29)
//.declare  (1798)  rf=r size=2 type=uw align=1 words (r238.28)
//.declare  (1799)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1800)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1801)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1802)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1803)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1804)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1805)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1806)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1807)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1808)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1809)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1810)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1811)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1812)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1813)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1814)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1815)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1816)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1817)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1818)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1819)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1820)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1821)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1822)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1823)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1824)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1825)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1826)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1827)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1828)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1829)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1830)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1831)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1832)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1833)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1834)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1835)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1836)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1837)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1838)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1839)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1840)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1841)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1842)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1843)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1844)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1845)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1846)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1847)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1848)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1849)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1850)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1851)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1852)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1853)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1854)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1855)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1856)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1857)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1858)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1859)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1860)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1861)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1862)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1863)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1864)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1865)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1866)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1867)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1868)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1869)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1870)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1871)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1872)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1873)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1874)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1875)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1876)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1877)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1878)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1879)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1880)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1881)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1882)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1883)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1884)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1885)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1886)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1887)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1888)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1889)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1890)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1891)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1892)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1893)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1894)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1895)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1896)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1897)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1898)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1899)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1900)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1901)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1902)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1903)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1904)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1905)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1906)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1907)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1908)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1909)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1910)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1911)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1912)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1913)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1914)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1915)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1916)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1917)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1918)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1919)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1920)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1921)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1922)  rf=f16  size=2 type=uw align=1 words (f0.0)
//.declare  (1923)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1924)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1925)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1926)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1927)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1928)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1929)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1930)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1931)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1932)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1933)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1934)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1935)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1936)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1937)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1938)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1939)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1940)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1941)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1942)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1943)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1944)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1945)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1946)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1947)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1948)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1949)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1950)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1951)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1952)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1953)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1954)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1955)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1956)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1957)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1958)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1959)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1960)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1961)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1962)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1963)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1964)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1965)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1966)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1967)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1968)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1969)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1970)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1971)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1972)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1973)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1974)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1975)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1976)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1977)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1978)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1979)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1980)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1981)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1982)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1983)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1984)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1985)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1986)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1987)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1988)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1989)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1990)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1991)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1992)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1993)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1994)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1995)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1996)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1997)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1998)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (1999)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2000)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2001)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2002)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2003)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2004)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2005)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2006)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2007)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2008)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2009)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2010)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2011)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2012)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2013)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2014)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2015)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2016)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2017)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2018)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2019)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2020)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2021)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2022)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2023)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2024)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2025)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2026)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2027)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2028)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2029)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2030)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2031)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2032)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2033)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2034)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2035)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2036)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2037)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2038)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2039)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2040)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2041)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2042)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2043)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2044)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2045)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2046)  rf=f16  size=2 type=uw align=1 words (f3.1)
//.declare  (2047)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare  (2048)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare  (2049)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare  (2050)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare  (2051)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2052)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2053)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2054)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2055)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2056)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2057)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2058)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2059)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2060)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2061)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2062)  rf=r size=16 type=ud align=2 words (r180.6)
//.declare  (2063)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2064)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2065)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2066)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2067)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2068)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2069)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2070)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2071)  rf=r size=16 type=ud align=2 words (r235.6)
//.declare  (2072)  rf=r size=16 type=ud align=2 words (r124.0)
//.declare  (2073)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2074)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2075)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2076)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2077)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2078)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2079)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2080)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2081)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2082)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2083)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2084)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2085)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2086)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2087)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2088)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2089)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2090)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2091)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2092)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2093)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2094)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2095)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2096)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2097)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2098)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2099)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2100)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2101)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2102)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2103)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2104)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2105)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2106)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2107)  rf=r size=16 type=ud align=2 words (r236.1)
//.declare  (2108)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2109)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2110)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2111)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2112)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2113)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2114)  rf=r size=16 type=ud align=2 words (r237.1)
//.declare  (2115)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2116)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2117)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2118)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2119)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2120)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2121)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2122)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2123)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2124)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2125)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2126)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2127)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2128)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2129)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2130)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2131)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2132)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2133)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2134)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2135)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2136)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2137)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2138)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2139)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2140)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2141)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2142)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2143)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2144)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2145)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2146)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2147)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2148)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2149)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2150)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2151)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2152)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2153)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2154)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2155)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2156)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2157)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2158)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2159)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2160)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2161)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2162)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2163)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2164)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2165)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2166)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2167)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2168)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2169)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2170)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2171)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2172)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2173)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2174)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2175)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2176)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2177)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2178)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (2179)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2180)  rf=r size=4 type=ud align=32 words NoSpill Input_Output
//.declare  (2181)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2182)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2183)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2184)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2185)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2186)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2187)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2188)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2189)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2190)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2191)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2192)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2193)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2194)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2195)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2196)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2197)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2198)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2199)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2200)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2201)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2202)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2203)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2204)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2205)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2206)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2207)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2208)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2209)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2210)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2211)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2212)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2213)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2214)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2215)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2216)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2217)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2218)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2219)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2220)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2221)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2222)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2223)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2224)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2225)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2226)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2227)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2228)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2229)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2230)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2231)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2232)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2233)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2234)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2235)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2236)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2237)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2238)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2239)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2240)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2241)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2242)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2243)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2244)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2245)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2246)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2247)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2248)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2249)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2250)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2251)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2252)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2253)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2254)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2255)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2256)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2257)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2258)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2259)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2260)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2261)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2262)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2263)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2264)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2265)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2266)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2267)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2268)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2269)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2270)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2271)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2272)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2273)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2274)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2275)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2276)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2277)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2278)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2279)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2280)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2281)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2282)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2283)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2284)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2285)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2286)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2287)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2288)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2289)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2290)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2291)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2292)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2293)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2294)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2295)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2296)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2297)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2298)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2299)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2300)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2301)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2302)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2303)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2304)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2305)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2306)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2307)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2308)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2309)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2310)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2311)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2312)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2313)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2314)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2315)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2316)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2317)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2318)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2319)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2320)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2321)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2322)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2323)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2324)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2325)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2326)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2327)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2328)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2329)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2330)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2331)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2332)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2333)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2334)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2335)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2336)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2337)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2338)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2339)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2340)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2341)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2342)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2343)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2344)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2345)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2346)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2347)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2348)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2349)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2350)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2351)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2352)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2353)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2354)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2355)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2356)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2357)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2358)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2359)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2360)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2361)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2362)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2363)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2364)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2365)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2366)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2367)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2368)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2369)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2370)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2371)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2372)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2373)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2374)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2375)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2376)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2377)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2378)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2379)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2380)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2381)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2382)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2383)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2384)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2385)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2386)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2387)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2388)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2389)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2390)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2391)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2392)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2393)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2394)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2395)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2396)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2397)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2398)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2399)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2400)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2401)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2402)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2403)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2404)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2405)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2406)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2407)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2408)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2409)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2410)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2411)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2412)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2413)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2414)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2415)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2416)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2417)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2418)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2419)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2420)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2421)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2422)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2423)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2424)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2425)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2426)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2427)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2428)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2429)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2430)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2431)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2432)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2433)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (2434)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare  (2435)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare r0 (2436)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (2437)  rf=r size=64 type=ud align=32 words (r255.0)
//.declare inlineRegFromTDL (2438)  rf=r size=32 type=ud align=2 words (r1.0)
//.declare inlineRegExpectedLocation (2439)  rf=r size=32 type=ud align=2 words (r4.0)
//.declare  (2440)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2441)  rf=r size=64 type=ud align=32 words (r3.0)
//.declare  (2442)  rf=r size=64 type=ud align=32 words (r5.0)
//.declare  (2443)  rf=r size=32 type=ud align=2 words (r6.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0049    | :w x 16  |   0x20 | r1       | pti[tid]+0x0     |
// | V0050    | :w x 16  |   0x20 | r2       | pti[tid]+0x40    |
// | V0051    | :w x 16  |   0x20 | r3       | pti[tid]+0x80    |
// | V0084    | :ud      |    0x4 | r4       | inline+0x0       |
// | V0034    | :uq      |    0x8 | r4+0x8   | inline+0x8       |
// | V0035    | :uq      |    0x8 | r4+0x10  | inline+0x10      |
// | V0036    | :uq      |    0x8 | r4+0x18  | inline+0x18      |
// | V0037    | :uq      |    0x8 | r5       | cti+0x20         |
// | V0038    | :uq      |    0x8 | r5+0x8   | cti+0x28         |
// | V0039    | :d       |    0x4 | r5+0x10  | cti+0x30         |
// | V0040    | :d       |    0x4 | r5+0x14  | cti+0x34         |
// | V0041    | :d       |    0x4 | r5+0x18  | cti+0x38         |
// | V0042    | :d       |    0x4 | r5+0x1C  | cti+0x3C         |
// | V0043    | :d       |    0x4 | r5+0x20  | cti+0x40         |
// | V0052    | :uq      |    0x8 | r5+0x28  | cti+0x48         |
// | V0053    | :uq      |    0x8 | r5+0x30  | cti+0x50         |
// | V0047    | :d x 3   |    0xC | r6       | cti+0x60         |
// | V0048    | :d x 3   |    0xC | r6+0xC   | cti+0x6C         |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
per_thread_prolog:
(W)     mov (16|M0)              r255.0<1>:ud  0x0:ud                                                //  ALU pipe: int; 
(W)     and (1|M0)               r255.2<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud                       //  ALU pipe: int; 
(W)     and (1|M0)               r255.0<1>:uw  r0.4<0;1,0>:uw    0xFF:uw                             //  ALU pipe: int; 
(W)     add (1|M0)               r255.2<1>:ud  r255.2<0;1,0>:ud  0x60:ud              {I@2}          //  ALU pipe: int; 
(W)     add (1|M0)               r255.2<1>:ud  r255.2<0;1,0>:ud  0x0:ud              {I@1}           //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     mad (1|M0)               r255.0<1>:ud  r255.2<0;0>:ud    r255.0<0;0>:uw    0xC0:uw              {I@1} //  ALU pipe: int; 
(W)     mov (8|M0)               r4.0<1>:ud    r1.0<1;1,0>:ud                                        //  ALU pipe: int; 

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x32t.a32.ca.cc (1|M0)  r1:2 bti[255][r255:1]   {A@1,$0} // ex_desc:0xFF000000; desc:0x6229E500 // 
(W)     load.ugm.d32x16t.a32.ca.cc (1|M0)  r3:1 bti[255][r255:1+0x80]  {$1} // ex_desc:0xFF080000; desc:0x6219D500 // 
        nop                                                                                          // 
        nop                                                                                          // 
        nop                                                                                          // 
// B001: Preds:{B000},  Succs:{B002}
// cross_thread_prolog:
        sync.nop                             null                             {Compacted,$1.src}     // 
(W)     and (1|M0)               r255.0<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud              {$0.src} //  ALU pipe: int; 
(W)     add (1|M0)               r255.0<1>:ud  r255.0<0;1,0>:ud  0x0:ud              {I@1}           //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     load.ugm.d32x16t.a32.ca.cc (1|M0)  r5:1 bti[255][r255:1]   {I@1,$2} // ex_desc:0xFF000000; desc:0x6219D500 // 
(W)     load.ugm.d32x8t.a32.ca.cc (1|M0)  r6:1  bti[255][r255:1+0x40]  {$3} // ex_desc:0xFF040000; desc:0x6219C500 // 
// B002: Preds:{B001},  Succs:{B003, B004}
// _main_0:
(W)     mov (16|M0)              r253.0<1>:ud  r0.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; 
        sync.nop                             null                             {Compacted,$3.src}     // 
(W)     mov (1|M0)               r255.3<1>:f   0x0:f                               {$2.src}          //  (0x00000000:f); ALU pipe: float; 
(W)     mov (16|M0)              r254.0<1>:f   r253.0<1;1,0>:f                  {Compacted,I@1}      //  ALU pipe: float; 
(W)     mov (1|M0)               r255.2<1>:f   0x140:f                                               //  (0x00000140:f); ALU pipe: float; 
(W)     and (1|M0)               r254.7<1>:ud  r253.5<0;1,0>:ud  0xFFFFFC00:ud              {F@2}    //  ALU pipe: int; 
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; 
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     and (1|M0)               r1.9<1>:ud    msg0.0<0;1,0>:ud  0xFF:uw              {A@1,$0.dst}   //  ALU pipe: int; $2
(W)     and (1|M0)               r1.10<1>:ud   sr0.0<0;1,0>:ud   0x7F:uw              {A@1}          //  ALU pipe: int; $3
(W)     and (1|M0)               r1.11<1>:ud   r1.10<0;1,0>:ud   7:w               {A@1}             //  ALU pipe: int; $5
(W)     asr (1|M0)               r1.14<1>:ud   r1.10<0;1,0>:ud   1:w                                 //  ALU pipe: int; $6
(W)     mov (1|M0)               r1.8<1>:d     -8:w                                                  //  ALU pipe: int; $7
(W)     shl (1|M0)               r1.9<1>:ud    r1.9<0;1,0>:ud    0x6:uw                              //  ALU pipe: int; $4
(W)     mov (1|M0)               r7.0<1>:uq    0x0:uw                                                //  ALU pipe: int; $13

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 152:  int chunk_id = item.get_group(1) / num_v_heads;
(W)     cmp (16|M0)   (gt)f0.1   null<1>:d     r5.8<0;1,0>:d     -1:w               {$2.dst}         //  ALU pipe: int; $30
(W)     bfn.(s0&s1|s2) (1|M0)    r1.10<1>:ud   r1.14<0;0>:ud     r1.8<0;0>:ud      r1.11<0>:ud      {I@4} //  ALU pipe: int; $7
(W)     mov (1|M0)               r135.8<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32: __devicelib_ConvertFToBF16INTEL; ALU pipe: int; $17
(W)     mov (1|M0)               r135.9<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32_HI: __devicelib_ConvertFToBF16INTEL; ALU pipe: int; $17
(W)     mov (1|M0)               r1.13<1>:d    r253.6<0;1,0>:d                                       //  ALU pipe: int; $20

// Line 151:  int v_head_id = item.get_group(1) % num_v_heads;
(W)     mov (1|M0)               r3.4<1>:q     r5.8<0;1,0>:d                    {$1.dst}             //  ALU pipe: int; $27
(W)     or (1|M0)                r1.9<1>:ud    r1.9<0;1,0>:ud    r1.10<0;1,0>:ud  {I@5}              //  ALU pipe: int; $8

// Line 152:  int chunk_id = item.get_group(1) / num_v_heads;
(W)     asr (1|M0)               r2.10<1>:d    r5.8<0;1,0>:d     31:w                                //  ALU pipe: int; $29
(W)     mov (1|M0)               r4.4<1>:df    0x41F0000000000000:df                                 //  ALU pipe: long; $31
(W)     mov (1|M0)               r3.7<1>:df    0x0:df                                                //  ALU pipe: long; $32
(W)     mov (1|M0)               r3.6<1>:df    0xBCF0000000000000:df                                 //  ALU pipe: long; $33
(W)     mul (1|M0)               acc0.0<1>:ud  r1.9<0;1,0>:ud    0xB40:uw              {I@2}         //  ALU pipe: int; $9
(W)     mov (1|M0)               r3.5<1>:df    0x3FF0000000000000:df                                 //  ALU pipe: long; $34
(W)     macl (1|M0)              r4.0<1>:ud    r1.9<0;1,0>:ud    0x10B40:ud                          //  ALU pipe: int; $10
(W)     add (1|M0)               r255.3<1>:uq  r5.6<0;1,0>:uq    r4.0<0;1,0>:ud   {I@1}              //  ALU pipe: int; $10
(W)     mov (1|M0)               r255.2<1>:uq  r255.3<0;1,0>:uq                 {I@1}                //  ALU pipe: int; $11
(W)     add (1|M0)               r255.3<1>:uq  r255.3<0;1,0>:uq  0x50:uw                             //  ALU pipe: int; $12
(W)     mov (1|M0)               r4.0<1>:uq    r255.2<0;1,0>:uq                 {Compacted,I@2}      //  ALU pipe: int; $14
(W)     store.ugm.d64x1t.a64 (1|M0)  [r4:1]     r7:1               {A@1,$4} // ex_desc:0x0; desc:0x2008784 // $16
(W)     mov (8|M0)               r7.0<1>:w     0x76543210:v                               {$4.src}   //  ALU pipe: int; $18
(W)     add (8|M0)               r7.8<1>:w     r7.0<1;1,0>:w     8:w               {I@1}             //  ALU pipe: int; $19
(W&f0.1) jmpi                                _0_045                                                  //  ALU pipe: int; $35
// B003: Preds:{B002},  Succs:{B008}
_0_046:
(W)     mov (1|M0)               r1.7<1>:df    r3.4<0;1,0>:uq                                        //  ALU pipe: long; $37
(W)     mov (1|M0)               r1.8<2>:f     r1.7<0;1,0>:df                   {L@1}                //  ALU pipe: float; $38
(W)     math.inv (1|M0)          r1.8<1>:f     r1.8<0;1,0>:f                    {F@1}                //  ALU pipe: math; $39
(W)     mov (1|M0)               r1.5<1>:df    r1.8<0;1,0>:f                    {M@1}                //  ALU pipe: long; $40
(W)     mad (1|M0)               r1.4<1>:df    r3.5<0;0>:df      r1.5<0;0>:df      -r1.7<0>:df      {L@1} //  ALU pipe: long; $41
(W)     add (1|M0)               r1.4<1>:df    r1.4<0;1,0>:df    r3.6<0;1,0>:df   {L@1}              //  ALU pipe: long; $42
(W)     mad (1|M0)               r1.7<1>:df    r1.5<0;0>:df      r1.4<0;0>:df      r1.5<0>:df       {L@1} //  ALU pipe: long; $43
(W)     mov (1|M0)               r1.5<1>:df    r1.13<0;1,0>:ud                                       //  ALU pipe: long; $48
(W)     mul (1|M0)               r1.4<1>:df    r1.7<0;1,0>:df    r3.7<0;1,0>:df   {L@2}              //  ALU pipe: long; $44
(W)     mov (1|M0)               r2.8<2>:ud    r1.4<0;1,0>:df                   {L@1}                //  ALU pipe: int; $45
(W)     mul (1|M0)               acc0.0<1>:d   r2.8<0;1,0>:d     r5.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $46
(W)     macl (1|M0)              r4.0<1>:d     r2.8<0;1,0>:d     r5.8<0;1,0>:d    {Compacted}        //  ALU pipe: int; $47
(W)     mov (1|M0)               r1.12<1>:d    -r4.0<0;1,0>:d                   {I@1}                //  ALU pipe: int; $47
(W)     mov (1|M0)               r1.4<1>:df    r1.12<0;1,0>:ud                  {I@1}                //  ALU pipe: long; $48
(W)     mad (1|M0)               r1.4<1>:df    r1.5<0;0>:df      r4.4<0;0>:df      r1.4<0>:df       {L@1} //  ALU pipe: long; $50
(W)     mul (1|M0)               r1.4<1>:df    r1.7<0;1,0>:df    r1.4<0;1,0>:df   {L@1}              //  ALU pipe: long; $51
(W)     mov (1|M0)               r1.5<1>:uq    r1.4<0;1,0>:df                   {L@1}                //  ALU pipe: int; $52
(W)     cmp (1|M0)    (eq)f0.0   null<1>:d     r1.11<0;1,0>:d    0:w               {Compacted,I@1}   //  ALU pipe: int; $56
(W)     mov (1|M0)               r1.14<1>:d    r1.10<0;1,0>:d                                        //  ALU pipe: int; $53
(W)     add (1|M0)               r1.11<1>:d    r1.11<0;1,0>:d    r2.8<0;1,0>:d                       //  ALU pipe: int; $76
(W)     mul (1|M0)               acc0.0<1>:ud  r1.14<0;1,0>:ud   r5.16<0;1,0>:uw  {I@2}              //  ALU pipe: int; $63
(W&~f0.0) sel (1|M0)             r1.8<1>:d     r5.8<0;1,0>:d     0:w                                 //  ALU pipe: int; $57
(W)     macl (1|M0)              r8.0<1>:ud    r1.14<0;1,0>:ud   r5.8<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $64
(W)     mul (1|M0)               acc0.0<1>:ud  r1.14<0;1,0>:ud   r5.16<0;1,0>:uw                     //  ALU pipe: int; $64
(W)     add3 (1|M0)              r1.9<1>:d     r1.10<0;0>:d      -r4.0<0;0>:d      -r1.8<0>:d       {I@3} //  ALU pipe: int; $58
(W)     mach (1|M0)              r4.0<1>:d     r1.14<0;1,0>:ud   r5.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mov (1|M0)               r1.8<1>:d     r1.13<0;1,0>:d                                        //  ALU pipe: int; $59
(W)     mov (1|M0)               r1.10<1>:d    r1.14<0;1,0>:d                                        //  ALU pipe: int; $77
(W)     mov (1|M0)               r8.1<1>:d     r4.0<0;1,0>:d                    {Compacted,I@3}      //  ALU pipe: int; $69
(W)     add (1|M0)               r1.4<1>:q     r1.4<0;1,0>:q     -r8.0<0;1,0>:q   {I@1}              //  ALU pipe: int; $74
(W)     cmp (16|M0)   (ge)f0.0   null<1>:d     r1.8<0;1,0>:ud    r5.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $81
(W)     mov (1|M0)               r1.16<1>:hf   0xFFFF:hf                              {I@1}          //  ALU pipe: float; $86
(W&f0.0) cmp (16|M0)  (eq)f0.0   null<1>:d     r1.9<0;1,0>:d     r2.10<0;1,0>:d                      //  ALU pipe: int; $82
(W&~f0.0) cmp (16|M0) (gt)f0.0   null<1>:d     r1.9<0;1,0>:ud    r2.10<0;1,0>:ud                     //  ALU pipe: int; $84
(W&f0.0) sel (1|M0)              r1.8<1>:d     r1.16<0;1,0>:w    0:w               {F@1}             //  ALU pipe: int; $86
(W)     mov (1|M0)               r1.4<1>:q     r1.8<0;1,0>:d                    {I@1}                //  ALU pipe: int; $87
(W)     add (1|M0)               r2.7<1>:q     r1.5<0;1,0>:q     -r1.4<0;1,0>:q   {I@1}              //  ALU pipe: int; $88
(W)     jmpi                                 _0_047                                                  // $89
// B004: Preds:{B002},  Succs:{B005, B006}
_0_045:
(W)     cmp (16|M0)   (eq)f0.0   null<1>:d     r5.8<0;1,0>:d     0:w                                 //  ALU pipe: int; $91
(W&~f0.0) jmpi                               _0_048                                                  //  ALU pipe: int; $92
// B005: Preds:{B004},  Succs:{B007}
_0_049:
(W)     mov (1|M0)               r4.1<1>:d     -1:w                               {Compacted}        //  ALU pipe: int; $94
(W)     jmpi                                 _0_050                                                  // $95
// B006: Preds:{B004},  Succs:{B007}
_0_048:
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $97
(W)     mov (1|M0)               r1.11<1>:f    r5.8<0;1,0>:ud                   {A@1}                //  ALU pipe: float; $98
(W)     mov (1|M0)               r1.10<1>:f    r1.13<0;1,0>:ud                                       //  ALU pipe: float; $101
(W)     mov (1|M0)               r1.8<1>:ud    r1.11<0;1,0>:f                   {F@2}                //  ALU pipe: int; $99
(W)     math.inv (1|M0)          r1.9<1>:f     r1.11<0;1,0>:f                                        //  ALU pipe: math; $102
(W)     add (1|M0)               r2.8<1>:d     r5.8<0;1,0>:d     -r1.8<0;1,0>:d   {I@1}              //  ALU pipe: int; $100
(W)     mov (1|M0)               r1.8<1>:f     0xB4C00000:f                               {I@1}      //  ALU pipe: float; $103
(W)     mad (1|M0)               r4.0<1>:f     r1.9<0;0>:f       r1.8<0;0>:f       r1.9<0>:f        {A@1} //  ALU pipe: float; $103
(W)     mov (1|M0)               r1.8<1>:ud    r1.10<0;1,0>:f                   {F@1}                //  ALU pipe: int; $105
(W)     mul (1|M0)               r1.9<1>:f     r1.10<0;1,0>:f    r4.0<0;1,0>:f                       //  ALU pipe: float; $104
(W)     add (1|M0)               r2.9<1>:d     r1.13<0;1,0>:d    -r1.8<0;1,0>:d   {I@1}              //  ALU pipe: int; $106
(W)     mov (1|M0)               r1.8<1>:f     r2.8<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $108
(W)     mov (1|M0)               r1.14<1>:ud   r1.9<0;1,0>:f                    {F@2}                //  ALU pipe: int; $107
(W)     mov (1|M0)               r1.9<1>:f     r2.9<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $108
(W)     mov (1|M0)               r1.15<1>:f    r1.14<0;1,0>:ud                                       //  ALU pipe: float; $110
(W)     mad (1|M0)               r4.10<1>:f    r1.10<0;0>:f      r1.15<0;0>:f      -r1.11<0>:f      {F@1} //  ALU pipe: float; $112
(W)     mad (1|M0)               r1.8<1>:f     r1.9<0;0>:f       r1.15<0;0>:f      -r1.8<0>:f        //  ALU pipe: float; $114
(W)     add (1|M0)               r1.8<1>:f     r4.10<0;1,0>:f    r1.8<0;1,0>:f    {F@1}              //  ALU pipe: float; $115
(W)     mul (1|M0)               r1.8<1>:f     r4.0<0;1,0>:f     r1.8<0;1,0>:f    {F@1}              //  ALU pipe: float; $116
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $117
(W)     mov (1|M0)               r1.9<1>:ud    r1.8<0;1,0>:f                    {A@1}                //  ALU pipe: int; $118
(W)     add (1|M0)               r1.8<1>:d     r1.9<0;1,0>:d     r1.14<0;1,0>:d   {I@1}              //  ALU pipe: int; $119
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:d     r5.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $120
(W)     macl (1|M0)              r4.0<1>:d     r1.8<0;1,0>:d     r5.8<0;1,0>:d    {Compacted}        //  ALU pipe: int; $121
(W)     add (1|M0)               r1.8<1>:d     r1.13<0;1,0>:d    -r4.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $121
(W)     cmp (1|M0)    (ge)f0.0   r1.8<1>:ud    r1.8<0;1,0>:ud    r5.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $122
(W)     add3 (1|M0)              r4.1<1>:d     r1.9<0;0>:d       r1.14<0;0>:d      -r1.8<0>:d       {I@1} //  ALU pipe: int; $123
// B007: Preds:{B006, B005},  Succs:{B008}
_0_050:
(W)     mov (1|M0)               r2.7<1>:q     r4.1<0;1,0>:ud                   {I@1}                //  ALU pipe: int; $125
// B008: Preds:{B007, B003},  Succs:{B009, B010}
_0_047:

// Line 151:  int v_head_id = item.get_group(1) % num_v_heads;
(W)     mov (2|M0)               r1.8<1>:d     r2.14<1;1,0>:d                   {I@1}                //  ALU pipe: int; $128
(W)     mul (1|M0)               acc0.0<1>:ud  r1.8<0;1,0>:ud    r5.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $129
(W)     macl (1|M0)              r4.0<1>:ud    r1.8<0;1,0>:ud    r5.8<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $130
(W)     mul (1|M0)               acc0.0<1>:ud  r1.8<0;1,0>:ud    r5.16<0;1,0>:uw                     //  ALU pipe: int; $130
(W)     mach (1|M0)              r9.0<1>:d     r1.8<0;1,0>:ud    r5.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:ud    r2.20<0;1,0>:uw                     //  ALU pipe: int; $131
(W)     macl (1|M0)              r8.0<1>:d     r1.8<0;1,0>:ud    r2.10<0;1,0>:d                      //  ALU pipe: int; $132
(W)     mul (1|M0)               acc0.0<1>:d   r5.8<0;1,0>:ud    r1.18<0;1,0>:uw                     //  ALU pipe: int; $133
(W)     add (1|M0)               r9.0<1>:d     r9.0<0;1,0>:d     r8.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $132
(W)     macl (1|M0)              r8.0<1>:d     r5.8<0;1,0>:ud    r1.9<0;1,0>:d                       //  ALU pipe: int; $135
(W)     add (1|M0)               r4.1<1>:d     r9.0<0;1,0>:d     r8.0<0;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $135
(W)     add (1|M0)               r1.4<1>:q     r1.13<0;1,0>:ud   -r4.0<0;1,0>:q   {I@1}              //  ALU pipe: int; $145
(W)     mov (2|M0)               r1.12<1>:d    r1.8<1;1,0>:d                    {I@1}                //  ALU pipe: int; $146

// Line 153:  const int global_chunk_range = item.get_group_range(1) / num_v_heads;
(W&f0.1) jmpi                                _0_051                                                  //  ALU pipe: int; $151
// B009: Preds:{B008},  Succs:{B013}
_0_052:
(W)     mov (1|M0)               r2.4<1>:df    r3.4<0;1,0>:uq                                        //  ALU pipe: long; $153
(W)     mov (1|M0)               r2.12<1>:d    r6.1<0;1,0>:d                    {$3.dst}             //  ALU pipe: int; $174
(W)     mov (1|M0)               r1.10<2>:f    r2.4<0;1,0>:df                   {L@1}                //  ALU pipe: float; $154
(W)     math.inv (1|M0)          r1.10<1>:f    r1.10<0;1,0>:f                   {F@1}                //  ALU pipe: math; $155
(W)     mov (1|M0)               r1.7<1>:df    r1.10<0;1,0>:f                   {M@1}                //  ALU pipe: long; $156
(W)     mad (1|M0)               r1.5<1>:df    r3.5<0;0>:df      r1.7<0;0>:df      -r2.4<0>:df      {L@1} //  ALU pipe: long; $157
(W)     add (1|M0)               r1.5<1>:df    r1.5<0;1,0>:df    r3.6<0;1,0>:df   {L@1}              //  ALU pipe: long; $158
(W)     mad (1|M0)               r1.7<1>:df    r1.7<0;0>:df      r1.5<0;0>:df      r1.7<0>:df       {L@1} //  ALU pipe: long; $159
(W)     mul (1|M0)               r1.5<1>:df    r1.7<0;1,0>:df    r3.7<0;1,0>:df   {L@1}              //  ALU pipe: long; $160
(W)     mov (1|M0)               r3.8<2>:ud    r1.5<0;1,0>:df                   {L@1}                //  ALU pipe: int; $161
(W)     mul (1|M0)               acc0.0<1>:d   r3.8<0;1,0>:d     r5.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $162
(W)     macl (1|M0)              r4.0<1>:d     r3.8<0;1,0>:d     r5.8<0;1,0>:d    {Compacted}        //  ALU pipe: int; $163
(W)     mov (1|M0)               r1.10<1>:d    -r4.0<0;1,0>:d                   {I@1}                //  ALU pipe: int; $163
(W)     mov (1|M0)               r3.4<1>:df    r1.10<0;1,0>:ud                  {I@1}                //  ALU pipe: long; $164
(W)     mov (1|M0)               r1.5<1>:df    r6.1<0;1,0>:ud                                        //  ALU pipe: long; $165
(W)     mad (1|M0)               r1.5<1>:df    r1.5<0;0>:df      r4.4<0;0>:df      r3.4<0>:df       {L@1} //  ALU pipe: long; $166
(W)     mul (1|M0)               r1.5<1>:df    r1.7<0;1,0>:df    r1.5<0;1,0>:df   {L@1}              //  ALU pipe: long; $167
(W)     mov (1|M0)               r2.4<1>:uq    r1.5<0;1,0>:df                   {L@1}                //  ALU pipe: int; $168
(W)     mov (2|M0)               r1.14<1>:d    r2.8<1;1,0>:d                    {I@1}                //  ALU pipe: int; $169
(W)     cmp (1|M0)    (lt)f0.0   null<1>:ud    r1.15<0;1,0>:ud   0x1:uw              {I@1}           //  ALU pipe: int; $171
(W)     mul (1|M0)               acc0.0<1>:ud  r1.14<0;1,0>:ud   r5.16<0;1,0>:uw                     //  ALU pipe: int; $178
(W)     macl (1|M0)              r8.0<1>:ud    r1.14<0;1,0>:ud   r5.8<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $179
(W)     mul (1|M0)               acc0.0<1>:ud  r1.14<0;1,0>:ud   r5.16<0;1,0>:uw                     //  ALU pipe: int; $179
(W&~f0.0) sel (1|M0)             r1.10<1>:d    r5.8<0;1,0>:d     0:w                                 //  ALU pipe: int; $172
(W)     add3 (1|M0)              r2.13<1>:d    r2.8<0;0>:d       -r4.0<0;0>:d      -r1.10<0>:d      {I@1} //  ALU pipe: int; $173
(W)     mach (1|M0)              r4.0<1>:d     r1.14<0;1,0>:ud   r5.8<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mov (1|M0)               r8.1<1>:d     r4.0<0;1,0>:d                    {Compacted,I@1}      //  ALU pipe: int; $184
(W)     add (1|M0)               r1.5<1>:q     r2.6<0;1,0>:q     -r8.0<0;1,0>:q   {I@1}              //  ALU pipe: int; $189
(W)     cmp (16|M0)   (ge)f0.0   null<1>:d     r1.10<0;1,0>:ud   r5.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $191
(W)     mov (1|M0)               r1.20<1>:hf   0xFFFF:hf                              {I@1}          //  ALU pipe: float; $196
(W&f0.0) cmp (16|M0)  (eq)f0.0   null<1>:d     r1.11<0;1,0>:d    r2.10<0;1,0>:d                      //  ALU pipe: int; $192
(W&~f0.0) cmp (16|M0) (gt)f0.0   null<1>:d     r1.11<0;1,0>:ud   r2.10<0;1,0>:ud                     //  ALU pipe: int; $194
(W&f0.0) sel (1|M0)              r1.10<1>:d    r1.20<0;1,0>:w    0:w               {F@1}             //  ALU pipe: int; $196
(W)     mov (1|M0)               r1.5<1>:q     r1.10<0;1,0>:d                   {I@1}                //  ALU pipe: int; $197
(W)     add (1|M0)               r236.10<2>:d  r2.4<0;1,0>:q     -r1.5<0;1,0>:q   {I@1}              //  ALU pipe: int; $198
(W)     jmpi                                 _0_053                                                  // $200
// B010: Preds:{B008},  Succs:{B011, B012}
_0_051:
(W)     cmp (16|M0)   (eq)f0.0   null<1>:d     r5.8<0;1,0>:d     0:w                                 //  ALU pipe: int; $202
(W&~f0.0) jmpi                               _0_054                                                  //  ALU pipe: int; $203
// B011: Preds:{B010},  Succs:{B013}
_0_055:
(W)     mov (1|M0)               r236.10<1>:d  -1:w                                                  //  ALU pipe: int; $205
(W)     jmpi                                 _0_053                                                  // $206
// B012: Preds:{B010},  Succs:{B013}
_0_054:
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $208
(W)     mov (1|M0)               r1.14<1>:f    r5.8<0;1,0>:ud                   {A@1}                //  ALU pipe: float; $209
        sync.nop                             null                             {Compacted,I@7}        // $212
(W)     mov (1|M0)               r1.11<1>:f    r6.1<0;1,0>:ud                   {$3.dst}             //  ALU pipe: float; $212
(W)     mov (1|M0)               r1.10<1>:ud   r1.14<0;1,0>:f                   {F@2}                //  ALU pipe: int; $210
(W)     math.inv (1|M0)          r1.15<1>:f    r1.14<0;1,0>:f                                        //  ALU pipe: math; $213
(W)     add (1|M0)               r2.12<1>:d    r5.8<0;1,0>:d     -r1.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $211
(W)     mov (1|M0)               r1.10<1>:f    0xB4C00000:f                               {I@1}      //  ALU pipe: float; $214
(W)     mov (1|M0)               r2.8<1>:f     r2.12<0;1,0>:ud                                       //  ALU pipe: float; $219
(W)     mad (1|M0)               r3.9<1>:f     r1.15<0;0>:f      r1.10<0;0>:f      r1.15<0>:f       {A@1} //  ALU pipe: float; $214
(W)     mov (1|M0)               r1.10<1>:ud   r1.11<0;1,0>:f                   {F@1}                //  ALU pipe: int; $216
(W)     mul (1|M0)               r1.15<1>:f    r1.11<0;1,0>:f    r3.9<0;1,0>:f                       //  ALU pipe: float; $215
(W)     add (1|M0)               r2.13<1>:d    r6.1<0;1,0>:d     -r1.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $217
(W)     mov (1|M0)               r1.15<1>:ud   r1.15<0;1,0>:f                   {F@1}                //  ALU pipe: int; $218
(W)     mov (1|M0)               r2.9<1>:f     r2.13<0;1,0>:ud                  {I@2}                //  ALU pipe: float; $219
(W)     mov (1|M0)               r3.8<1>:f     r1.15<0;1,0>:ud                  {I@1}                //  ALU pipe: float; $221
(W)     mad (1|M0)               r3.10<1>:f    r1.11<0;0>:f      r3.8<0;0>:f       -r1.14<0>:f      {F@1} //  ALU pipe: float; $223
(W)     mad (1|M0)               r1.10<1>:f    r2.9<0;0>:f       r3.8<0;0>:f       -r2.8<0>:f        //  ALU pipe: float; $225
(W)     add (1|M0)               r1.10<1>:f    r3.10<0;1,0>:f    r1.10<0;1,0>:f   {F@1}              //  ALU pipe: float; $226
(W)     mul (1|M0)               r3.8<1>:f     r3.9<0;1,0>:f     r1.10<0;1,0>:f   {F@1}              //  ALU pipe: float; $227
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $228
(W)     mov (1|M0)               r3.9<1>:ud    r3.8<0;1,0>:f                    {A@1}                //  ALU pipe: int; $229
(W)     add (1|M0)               r3.8<1>:d     r3.9<0;1,0>:d     r1.15<0;1,0>:d   {I@1}              //  ALU pipe: int; $230
(W)     mul (1|M0)               acc0.0<1>:d   r3.8<0;1,0>:d     r5.16<0;1,0>:uw  {I@1}              //  ALU pipe: int; $231
(W)     macl (1|M0)              r4.0<1>:d     r3.8<0;1,0>:d     r5.8<0;1,0>:d    {Compacted}        //  ALU pipe: int; $232
(W)     add (1|M0)               r1.10<1>:d    r6.1<0;1,0>:d     -r4.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $232
(W)     cmp (1|M0)    (ge)f0.0   r1.10<1>:ud   r1.10<0;1,0>:ud   r5.8<0;1,0>:ud   {I@1}              //  ALU pipe: int; $233
(W)     add3 (1|M0)              r236.10<1>:d  r3.9<0;0>:d       r1.15<0;0>:d      -r1.10<0>:d      {I@1} //  ALU pipe: int; $234
// B013: Preds:{B012, B011, B009},  Succs:{B014, B015}
_0_053:

// Line 187:  const int kv_ratio = num_v_heads / num_k_heads;
(W)     cmp (16|M0)   (eq)f0.0   null<1>:d     r5.6<0;1,0>:d     0:w                                 //  ALU pipe: int; $240
(W&~f0.0) jmpi                               _0_056                                                  //  ALU pipe: int; $241
// B014: Preds:{B013},  Succs:{B016}
_0_057:
(W)     mov (1|M0)               r1.10<1>:d    -1:w                                                  //  ALU pipe: int; $243
(W)     jmpi                                 _0_058                                                  // $244
// B015: Preds:{B013},  Succs:{B016}
_0_056:
(W)     asr (1|M0)               r3.8<1>:d     r5.6<0;1,0>:d     31:w                                //  ALU pipe: int; $246
(W)     asr (1|M0)               r1.15<1>:d    r5.8<0;1,0>:d     31:w                                //  ALU pipe: int; $247
(W)     add (1|M0)               r1.11<1>:d    r3.8<0;1,0>:d     r5.6<0;1,0>:d    {I@2}              //  ALU pipe: int; $248
(W)     xor (1|M0)               r1.14<1>:d    r1.11<0;1,0>:d    r3.8<0;1,0>:d    {I@1}              //  ALU pipe: int; $249
(W)     add (1|M0)               r1.11<1>:d    r1.15<0;1,0>:d    r5.8<0;1,0>:d                       //  ALU pipe: int; $250
(W)     xor (1|M0)               r3.11<1>:d    r1.11<0;1,0>:d    r1.15<0;1,0>:d   {I@1}              //  ALU pipe: int; $251
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $252
(W)     mov (1|M0)               r3.10<1>:f    r1.14<0;1,0>:ud                  {A@1}                //  ALU pipe: float; $253
(W)     mov (1|M0)               r3.9<1>:f     r3.11<0;1,0>:ud                  {I@2}                //  ALU pipe: float; $256
(W)     mov (1|M0)               r1.11<1>:ud   r3.10<0;1,0>:f                   {F@2}                //  ALU pipe: int; $254
(W)     math.inv (1|M0)          r3.12<1>:f    r3.10<0;1,0>:f                                        //  ALU pipe: math; $257
(W)     add (1|M0)               r2.12<1>:d    r1.14<0;1,0>:d    -r1.11<0;1,0>:d  {I@1}              //  ALU pipe: int; $255
(W)     mov (1|M0)               r1.11<1>:f    0xB4C00000:f                               {I@1}      //  ALU pipe: float; $258
(W)     mov (1|M0)               r2.8<1>:f     r2.12<0;1,0>:ud                                       //  ALU pipe: float; $263
(W)     mad (1|M0)               r3.14<1>:f    r3.12<0;0>:f      r1.11<0;0>:f      r3.12<0>:f       {A@1} //  ALU pipe: float; $258
(W)     mov (1|M0)               r1.11<1>:ud   r3.9<0;1,0>:f                    {F@1}                //  ALU pipe: int; $260
(W)     mul (1|M0)               r3.12<1>:f    r3.9<0;1,0>:f     r3.14<0;1,0>:f                      //  ALU pipe: float; $259
(W)     add (1|M0)               r2.13<1>:d    r3.11<0;1,0>:d    -r1.11<0;1,0>:d  {I@1}              //  ALU pipe: int; $261
(W)     mov (1|M0)               r3.13<1>:ud   r3.12<0;1,0>:f                   {F@1}                //  ALU pipe: int; $262
(W)     mov (1|M0)               r2.9<1>:f     r2.13<0;1,0>:ud                  {I@2}                //  ALU pipe: float; $263
(W)     mov (1|M0)               r3.12<1>:f    r3.13<0;1,0>:ud                  {I@1}                //  ALU pipe: float; $265
(W)     mad (1|M0)               r3.9<1>:f     r3.9<0;0>:f       r3.12<0;0>:f      -r3.10<0>:f      {F@1} //  ALU pipe: float; $267
(W)     mad (1|M0)               r1.11<1>:f    r2.9<0;0>:f       r3.12<0;0>:f      -r2.8<0>:f        //  ALU pipe: float; $269
(W)     add (1|M0)               r1.11<1>:f    r3.9<0;1,0>:f     r1.11<0;1,0>:f   {F@1}              //  ALU pipe: float; $270
(W)     mul (1|M0)               r3.9<1>:f     r3.14<0;1,0>:f    r1.11<0;1,0>:f   {F@1}              //  ALU pipe: float; $271
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $272
(W)     mov (1|M0)               r1.11<1>:ud   r3.9<0;1,0>:f                    {A@1}                //  ALU pipe: int; $273
(W)     xor (1|M0)               r3.10<1>:d    r3.8<0;1,0>:d     r1.15<0;1,0>:d                      //  ALU pipe: int; $275
(W)     add (1|M0)               r3.9<1>:d     r1.11<0;1,0>:d    r3.13<0;1,0>:d   {I@2}              //  ALU pipe: int; $274
(W)     mul (1|M0)               acc0.0<1>:d   r3.9<0;1,0>:d     r1.28<0;1,0>:uw  {I@1}              //  ALU pipe: int; $276
(W)     macl (1|M0)              r4.0<1>:d     r3.9<0;1,0>:d     r1.14<0;1,0>:d   {Compacted}        //  ALU pipe: int; $277
(W)     add (1|M0)               r1.11<1>:d    r3.11<0;1,0>:d    -r4.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $277
(W)     cmp (1|M0)    (ge)f0.0   r1.11<1>:ud   r1.11<0;1,0>:ud   r1.14<0;1,0>:ud  {I@1}              //  ALU pipe: int; $278
(W)     add3 (1|M0)              r1.11<1>:d    r3.9<0;0>:d       r3.10<0;0>:d      -r1.11<0>:d      {I@1} //  ALU pipe: int; $279
(W)     bfn.(s0^s1^s2) (1|M0)    r1.10<1>:ud   r1.11<0;0>:ud     r3.8<0;0>:ud      r1.15<0>:ud      {I@1} //  ALU pipe: int; $280
// B016: Preds:{B015, B014},  Succs:{B017, B100}
_0_058:

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     mul (1|M0)               acc0.0<1>:ud  r5.6<0;1,0>:ud    r5.14<0;1,0>:uw                     //  ALU pipe: int; $287
(W)     asr (1|M0)               r1.11<1>:d    r5.7<0;1,0>:d     31:w                                //  ALU pipe: int; $286

// Line 219:  head_k_dim +
(W)     asr (1|M0)               r1.14<1>:d    r5.6<0;1,0>:d     31:w                                //  ALU pipe: int; $284

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     macl (1|M0)              r235.0<1>:ud  r5.6<0;1,0>:ud    r5.7<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $288
(W)     mul (1|M0)               acc0.0<1>:ud  r5.6<0;1,0>:ud    r5.14<0;1,0>:uw                     //  ALU pipe: int; $288

// Line 189:  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
(W)     cmp (16|M0)   (gt)f0.0   null<1>:d     r5.5<0;1,0>:d     0:w                                 //  ALU pipe: int; $305
(W)     mach (1|M0)              r6.0<1>:d     r5.6<0;1,0>:ud    r5.7<0;1,0>:ud   {$3.dst}           //  ALU pipe: int; 

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     mul (1|M0)               acc0.0<1>:d   r5.6<0;1,0>:ud    r1.22<0;1,0>:uw  {I@6}              //  ALU pipe: int; $289
(W)     macl (1|M0)              r4.0<1>:d     r5.6<0;1,0>:ud    r1.11<0;1,0>:d                      //  ALU pipe: int; $290
(W)     mul (1|M0)               acc0.0<1>:d   r5.7<0;1,0>:ud    r1.28<0;1,0>:uw  {I@7}              //  ALU pipe: int; $291

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     asr (1|M0)               r1.11<1>:d    r5.4<0;1,0>:d     31:w                                //  ALU pipe: int; $295

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     add (1|M0)               r6.0<1>:d     r6.0<0;1,0>:d     r4.0<0;1,0>:d    {Compacted,I@3}    //  ALU pipe: int; $290
(W)     macl (1|M0)              r4.0<1>:d     r5.7<0;1,0>:ud    r1.14<0;1,0>:d                      //  ALU pipe: int; $293

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     mul (1|M0)               acc0.0<1>:ud  r1.12<0;1,0>:ud   r5.8<0;1,0>:uw                      //  ALU pipe: int; $296
(W)     macl (1|M0)              r8.0<1>:ud    r1.12<0;1,0>:ud   r5.4<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $297
(W)     mul (1|M0)               acc0.0<1>:ud  r1.12<0;1,0>:ud   r5.8<0;1,0>:uw                      //  ALU pipe: int; $297

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     add (1|M0)               r180.1<1>:d   r6.0<0;1,0>:d     r4.0<0;1,0>:d    {Compacted,I@4}    //  ALU pipe: int; $293
(W)     mach (1|M0)              r6.0<1>:d     r1.12<0;1,0>:ud   r5.4<0;1,0>:ud                      //  ALU pipe: int; 

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     mul (1|M0)               acc0.0<1>:d   r1.12<0;1,0>:ud   r1.22<0;1,0>:uw                     //  ALU pipe: int; $298
(W)     macl (1|M0)              r4.0<1>:d     r1.12<0;1,0>:ud   r1.11<0;1,0>:d                      //  ALU pipe: int; $299
(W)     mul (1|M0)               acc0.0<1>:d   r5.4<0;1,0>:ud    r1.26<0;1,0>:uw                     //  ALU pipe: int; $300
(W)     add (1|M0)               r6.0<1>:d     r6.0<0;1,0>:d     r4.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $299
(W)     macl (1|M0)              r4.0<1>:d     r5.4<0;1,0>:ud    r1.13<0;1,0>:d                      //  ALU pipe: int; $302
(W)     add (1|M0)               r1.11<1>:d    r6.0<0;1,0>:d     r4.0<0;1,0>:d    {I@1}              //  ALU pipe: int; $302

// Line 189:  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
(W&~f0.0) jmpi                               _0_059                                                  //  ALU pipe: int; $306
// B017: Preds:{B016},  Succs:{B018}
_0_060:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 121:  Index[0] * Extent[1] * Extent[2] + Index[1] * Extent[2] + Index[2];
        mul (16|M0)              r3.0<1>:d     r6.4<0;1,0>:d     r3.0<1;1,0>:uw                      //  ALU pipe: int; $314

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp

// Line 345:  return (a + b - Int<1>{}) / b;
(W)     cmp (1|M0)    (lt)f0.0   null<1>:d     r5.7<0;1,0>:d     -31:w                               //  ALU pipe: int; $377

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/container/tuple.hpp

// Line 108:  ESO(First const& first, Rest const&...) : first_{first} {}
        mov (16|M0)              r7.0<1>:d     r7.0<1;1,0>:uw                                        //  ALU pipe: int; $387

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 121:  Index[0] * Extent[1] * Extent[2] + Index[1] * Extent[2] + Index[2];
        add (16|M0)              r3.0<1>:d     r3.0<1;1,0>:d     r2.0<1;1,0>:uw   {I@3}              //  ALU pipe: int; $320

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 152:  int chunk_id = item.get_group(1) / num_v_heads;
(W)     mov (1|M0)               r135.14<2>:d  r2.7<0;1,0>:q                                         //  ALU pipe: int; $334
(W)     mov (1|M0)               r4.8<1>:d     32:w                                                  //  ALU pipe: int; $402
(W)     asr (1|M0)               r235.5<1>:d   r1.10<0;1,0>:d    31:w                                //  ALU pipe: int; $590

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 121:  Index[0] * Extent[1] * Extent[2] + Index[1] * Extent[2] + Index[2];
(W)     mul (16|M0)              acc0.0<1>:d   r3.0<1;1,0>:d     r6.6<0;1,0>:uw   {I@4}              //  ALU pipe: int; $321

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     asr (1|M0)               r236.8<1>:d   r1.8<0;1,0>:d     31:w                                //  ALU pipe: int; $591

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp
        macl (16|M0)             r3.0<1>:d     r3.0<1;1,0>:d     r6.3<0;1,0>:d    {Compacted}        //  ALU pipe: int; $327

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 212:  a[(chunk_start_offset + e) + v_head_id * total_virtual_seqlen];
(W)     mul (1|M0)               acc0.0<1>:d   r1.8<0;1,0>:d     r5.8<0;1,0>:uw                      //  ALU pipe: int; $351

// Line 189:  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
(W)     mov (2|M0)               r180.12<1>:d  0:w                                                   //  ALU pipe: int; $598
(W)     add (1|M0)               r235.4<1>:d   r236.8<0;1,0>:d   r1.8<0;1,0>:d    {I@4}              //  ALU pipe: int; $594

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 121:  Index[0] * Extent[1] * Extent[2] + Index[1] * Extent[2] + Index[2];
        add (16|M0)              r232.0<1>:d   r3.0<1;1,0>:d     r1.0<1;1,0>:uw   {I@4}              //  ALU pipe: int; $327

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/__spirv/spirv_vars.hpp

// Line 175:  return __spirv_BuiltInSubgroupId;
(W)     mov (1|M0)               r1.0<2>:b     r253.8<0;1,0>:b                                       //  ALU pipe: int; $338

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     mov (1|M0)               r1.1<1>:d     r1.11<0;1,0>:d                                        //  ALU pipe: int; $356

// Line 225:  K_tensor_shape, make_stride(head_k_dim * num_k_heads, _1{})));
(W)     macl (1|M0)              r180.0<1>:d   r1.8<0;1,0>:d     r5.4<0;1,0>:d    {Compacted}        //  ALU pipe: int; $353
(W)     mul (1|M0)               acc0.0<1>:d   r5.7<0;1,0>:d     r5.12<0;1,0>:uw                     //  ALU pipe: int; $353

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/numeric/arithmetic_tuple.hpp

// Line 410:  auto r = a * e.value();
        shl (16|M0)              r2.0<1>:d     r232.0<1;1,0>:d   1:w               {Compacted,I@5}   //  ALU pipe: int; $364

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/__spirv/spirv_vars.hpp

// Line 175:  return __spirv_BuiltInSubgroupId;
(W)     mov (1|M0)               r1.0<1>:d     r1.0<0;1,0>:ub                   {I@5}                //  ALU pipe: int; $339

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     macl (1|M0)              r4.0<1>:d     r5.7<0;1,0>:d     r5.6<0;1,0>:d                       //  ALU pipe: int; $355

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/container/tuple.hpp

// Line 108:  ESO(First const& first, Rest const&...) : first_{first} {}
        and (16|M0)              r175.0<1>:d   r232.0<1;1,0>:d   2147483616:d                        //  ALU pipe: int; $386

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/numeric/arithmetic_tuple.hpp

// Line 410:  auto r = a * e.value();
        and (16|M0)              r173.0<1>:d   r2.0<1;1,0>:d     32:w               {Compacted,I@4}  //  ALU pipe: int; $365

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 182:  int m_sg_start = sg_local_m_coord * SG_M;
(W)     shl (1|M0)               r1.2<1>:d     r1.0<0;1,0>:d     4:w               {Compacted,I@4}   //  ALU pipe: int; $343

// Line 183:  int n_sg_start = sg_local_n_coord * SG_N;
(W)     shl (1|M0)               r4.9<1>:d     r1.0<0;1,0>:d     5:w                                 //  ALU pipe: int; $348

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     mov (1|M0)               r1.0<1>:f     r8.0<0;1,0>:f                    {Compacted,I@1}      //  ALU pipe: float; $355
        shl (16|M0)              r8.0<1>:d     r7.0<1;1,0>:d     2:w               {Compacted,F@1}   //  ALU pipe: int; $390

// Line 182:  int m_sg_start = sg_local_m_coord * SG_M;
(W)     and (1|M0)               r135.15<1>:d  r1.2<0;1,0>:d     4064:w                              //  ALU pipe: int; $346
(W)     or (1|M0)                r236.6<1>:d   r1.2<0;1,0>:d     16:w                                //  ALU pipe: int; $454

// Line 228:  static_cast<int64_t>(v_head_id) * total_virtual_seqlen *
(W)     shl (1|M0)               r1.0<1>:q     r1.0<0;1,0>:q     7:w               {Compacted}       //  ALU pipe: int; $359
        mov (16|M0)              r2.0<2>:ud    r8.0<1;1,0>:ud                   {Compacted,I@4}      //  ALU pipe: int; $392
(W)     or (1|M0)                r1.3<1>:d     r135.15<0;1,0>:d  1:w               {I@4}             //  ALU pipe: int; $408
(W)     or (1|M0)                r1.4<1>:d     r135.15<0;1,0>:d  2:w                                 //  ALU pipe: int; $411

// Line 227:  auto A_ptr = A +
(W)     add (1|M0)               r180.1<1>:q   r1.0<0;1,0>:q     r4.1<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $361

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 117:  width = (shape<XMode::value>(src) * SBits) >> 3;
(W)     shl (1|M0)               r1.0<1>:d     r5.7<0;1,0>:d     1:w                                 //  ALU pipe: int; $368

// Line 119:  pitch = (stride<YMode::value>(src) * SBits) >> 3;
(W)     shl (1|M0)               r1.1<1>:d     r4.0<0;1,0>:d     1:w               {Compacted}       //  ALU pipe: int; $370

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     or (1|M0)                r1.5<1>:d     r135.15<0;1,0>:d  3:w                                 //  ALU pipe: int; $414
(W)     or (1|M0)                r1.6<1>:d     r135.15<0;1,0>:d  4:w                                 //  ALU pipe: int; $417
(W)     or (1|M0)                r1.7<1>:d     r135.15<0;1,0>:d  5:w                                 //  ALU pipe: int; $420
(W)     or (1|M0)                r1.11<1>:d    r135.15<0;1,0>:d  6:w                                 //  ALU pipe: int; $423

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 152:  width - 1,
(W)     add (2|M0)               r135.12<1>:d  r1.0<1;1,0>:d     -1:w               {I@5}            //  ALU pipe: int; $372

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp

// Line 345:  return (a + b - Int<1>{}) / b;
(W)     mov (1|M0)               r1.0<1>:hf    0x3E:hf                              {I@1}            //  ALU pipe: float; $378

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     or (1|M0)                r1.12<1>:d    r135.15<0;1,0>:d  7:w                                 //  ALU pipe: int; $426
(W)     or (1|M0)                r236.7<1>:d   r135.15<0;1,0>:d  8:w                                 //  ALU pipe: int; $429
(W)     or (1|M0)                r1.13<1>:d    r135.15<0;1,0>:d  9:w                                 //  ALU pipe: int; $433
(W)     or (1|M0)                r1.14<1>:d    r135.15<0;1,0>:d  10:w                                //  ALU pipe: int; $436

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp
(W&f0.0) sel (1|M0)              r1.0<1>:w     r1.0<0;1,0>:w     31:w               {F@1}            //  ALU pipe: int; $378

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r232.0<1;1,0>:ud  0x40:uw                             //  ALU pipe: int; $399
(W)     or (1|M0)                r1.15<1>:d    r135.15<0;1,0>:d  11:w                                //  ALU pipe: int; $439
(W)     or (1|M0)                r4.0<1>:d     r135.15<0;1,0>:d  12:w                                //  ALU pipe: int; $442

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp
(W)     mov (1|M0)               r1.0<2>:b     r1.0<0;1,0>:w                    {I@4}                //  ALU pipe: int; $379

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     or (1|M0)                r4.1<1>:d     r135.15<0;1,0>:d  13:w                                //  ALU pipe: int; $445
(W)     or (1|M0)                r4.2<1>:d     r135.15<0;1,0>:d  14:w                                //  ALU pipe: int; $448
(W)     or (1|M0)                r4.3<1>:d     r135.15<0;1,0>:d  15:w                                //  ALU pipe: int; $451

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               r238.28<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $399

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp

// Line 345:  return (a + b - Int<1>{}) / b;
(W)     mov (1|M0)               r1.0<1>:d     r1.0<0;1,0>:ub                   {I@5}                //  ALU pipe: int; $380

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     cmp (16|M0)   (gt)f0.0   null<1>:d     r5.7<0;1,0>:d     0:w                                 //  ALU pipe: int; $400
(W)     or (1|M0)                r236.5<1>:d   r1.2<0;1,0>:d     17:w                                //  ALU pipe: int; $458
(W)     or (1|M0)                r236.0<1>:d   r1.2<0;1,0>:d     18:w               {Compacted}      //  ALU pipe: int; $462

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp
(W)     add (1|M0)               r1.0<1>:d     r1.0<0;1,0>:d     r5.7<0;1,0>:d    {Compacted,I@4}    //  ALU pipe: int; $381

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     or (1|M0)                r235.15<1>:d  r1.2<0;1,0>:d     19:w                                //  ALU pipe: int; $466
(W)     or (1|M0)                r235.14<1>:d  r1.2<0;1,0>:d     20:w                                //  ALU pipe: int; $470
(W)     or (1|M0)                r235.13<1>:d  r1.2<0;1,0>:d     21:w                                //  ALU pipe: int; $474

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               r238.29<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $400

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/int_tuple.hpp

// Line 345:  return (a + b - Int<1>{}) / b;
(W)     asr (1|M0)               r135.10<1>:d  r1.0<0;1,0>:d     5:w               {I@5}             //  ALU pipe: int; $382

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     add (1|M0)               r1.0<1>:uq    r255.2<0;1,0>:uq  0x10:uw                             //  ALU pipe: int; $391
(W)     or (1|M0)                r235.12<1>:d  r1.2<0;1,0>:d     22:w                                //  ALU pipe: int; $478
(W)     or (1|M0)                r235.11<1>:d  r1.2<0;1,0>:d     23:w                                //  ALU pipe: int; $482
(W)     or (1|M0)                r235.10<1>:d  r1.2<0;1,0>:d     24:w                                //  ALU pipe: int; $486
(W)     or (1|M0)                r235.3<1>:d   r1.2<0;1,0>:d     25:w                                //  ALU pipe: int; $490
        add (16|M0)              r136.0<1>:uq  r1.0<0;1,0>:uq    r2.0<2;1,0>:d    {I@5}              //  ALU pipe: int; $392
(W)     or (1|M0)                r235.2<1>:d   r1.2<0;1,0>:d     26:w                                //  ALU pipe: int; $494
(W)     or (1|M0)                r235.1<1>:d   r1.2<0;1,0>:d     27:w                                //  ALU pipe: int; $498
(W)     or (1|M0)                r180.15<1>:d  r1.2<0;1,0>:d     28:w                                //  ALU pipe: int; $502
        and (16|M0)              r2.0<1>:ud    r136.1<2;1,0>:ud  0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $395
        mov (16|M0)              r138.0<2>:ud  r136.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $393
(W)     or (1|M0)                r180.14<1>:d  r1.2<0;1,0>:d     29:w                                //  ALU pipe: int; $506
        or (16|M0)               r138.1<2>:ud  r2.0<1;1,0>:ud    0x20000000:ud              {I@3}    //  ALU pipe: int; $396
        bfn.(s0&s1|s2) (16|M0)   r2.0<1>:ud    r4.9<0;0>:ud      r4.8<0;0>:ud      r7.0<1>:ud        //  ALU pipe: int; $403
(W)     or (1|M0)                r180.11<1>:d  r1.2<0;1,0>:d     30:w                                //  ALU pipe: int; $510
(W)     or (1|M0)                r180.10<1>:d  r1.2<0;1,0>:d     31:w                                //  ALU pipe: int; $514
(W)     mov (1|M0)               r1.1<1>:d     16:w                               {Compacted}        //  ALU pipe: int; $518
        cmp (16|M0)   (eq)f0.0   null<1>:d     r135.15<0;1,0>:d  r2.0<1;1,0>:d    {I@4}              //  ALU pipe: int; $406
        shl (16|M0)              r234.0<1>:d   r2.0<1;1,0>:d     2:w               {Compacted}       //  ALU pipe: int; $404
(W)     bfn.(s0&s1|s2) (1|M0)    r1.1<1>:ud    r4.9<0;0>:ud      r4.8<0;0>:ud      r1.1<0>:ud       {I@3} //  ALU pipe: int; $519

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/container/tuple.hpp

// Line 108:  ESO(First const& first, Rest const&...) : first_{first} {}
        and (16|M0)              r172.0<1>:d   r232.0<1;1,0>:d   2147483632:d                        //  ALU pipe: int; $385

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        or (16|M0)               r227.0<1>:d   r175.0<1;1,0>:d   8:w               {Compacted}       //  ALU pipe: int; $586

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               r238.30<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $406

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r135.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $407
        or (16|M0)               r226.0<1>:d   r175.0<1;1,0>:d   16:w               {Compacted}      //  ALU pipe: int; $587
        or (16|M0)               r225.0<1>:d   r175.0<1;1,0>:d   24:w               {Compacted}      //  ALU pipe: int; $588
        or (16|M0)               r174.0<1>:d   r173.0<1;1,0>:d   16:w               {Compacted}      //  ALU pipe: int; $401

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.31<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $407

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.3<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $409
(W)     xor (2|M0)               r180.4<1>:d   r235.4<1;1,0>:d   r236.8<0;1,0>:d                     //  ALU pipe: int; $595
(W)     shl (1|M0)               r252.0<1>:d   r236.6<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $455
(W)     shl (1|M0)               r6.0<1>:d     r236.7<0;1,0>:d   2:w                                 //  ALU pipe: int; $430
(W)     shl (1|M0)               r251.0<1>:d   r236.5<0;1,0>:d   2:w                                 //  ALU pipe: int; $459
(W)     shl (1|M0)               r250.0<1>:d   r236.0<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $463
(W)     shl (1|M0)               r249.0<1>:d   r235.15<0;1,0>:d  2:w                                 //  ALU pipe: int; $467

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.2<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $409

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.3<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $410
(W)     shl (1|M0)               r248.0<1>:d   r235.14<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $471
(W)     shl (1|M0)               r247.0<1>:d   r235.13<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $475
(W)     shl (1|M0)               r246.0<1>:d   r235.12<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $479
(W)     shl (1|M0)               r1.0<1>:d     r135.15<0;1,0>:d  2:w                                 //  ALU pipe: int; $405
(W)     shl (1|M0)               r245.0<1>:d   r235.11<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $483
(W)     shl (1|M0)               r244.0<1>:d   r235.10<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $487

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.3<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $410

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.4<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $412
(W)     shl (1|M0)               r243.0<1>:d   r235.3<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $491
(W)     shl (1|M0)               r242.0<1>:d   r235.2<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $495
(W)     shl (1|M0)               r241.0<1>:d   r235.1<0;1,0>:d   2:w               {Compacted}       //  ALU pipe: int; $499
(W)     shl (1|M0)               r240.0<1>:d   r180.15<0;1,0>:d  2:w                                 //  ALU pipe: int; $503
(W)     shl (1|M0)               r239.0<1>:d   r180.14<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $507
(W)     shl (1|M0)               r238.0<1>:d   r180.11<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $511

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.4<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $412

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.4<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $413
(W)     shl (1|M0)               r237.0<1>:d   r180.10<0;1,0>:d  2:w               {Compacted}       //  ALU pipe: int; $515

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.5<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $413

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.5<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $415

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.6<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $415

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.5<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $416

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.7<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $416

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.6<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $418

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.8<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $418

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.6<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $419

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.9<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $419

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.7<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $421

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.10<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $421

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.7<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $422

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.11<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $422

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.11<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $424

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.12<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $424

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.11<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $425

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.13<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $425

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.12<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $427

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.14<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $427

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.12<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $428

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.15<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $428

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.7<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $431

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.16<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $431

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.7<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $432

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.17<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $432

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.13<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $434

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.18<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $434

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.13<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $435

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.19<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $435

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.14<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $437

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.20<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $437

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.14<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $438

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.21<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $438

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.15<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $440

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.22<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $440

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.15<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $441

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.23<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $441

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.0<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $443

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.24<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $443

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.0<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $444

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.25<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $444

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.1<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $446

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.26<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $446

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.1<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $447

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.27<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $447

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.2<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $449

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.28<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $449

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.2<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $450

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.29<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $450

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.3<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $452

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.30<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $452

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.3<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $453

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r239.31<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $453

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.6<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $456

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.2<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $456

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.6<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $457

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.3<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $457

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.5<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $460

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.4<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $460

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.5<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $461

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.5<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $461

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.0<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $464

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.6<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $464

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.0<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $465

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.7<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $465

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.15<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $468

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.8<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $468

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $469

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.9<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $469

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.14<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $472

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.10<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $472

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.14<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $473

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.11<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $473

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.13<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $476

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.12<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $476

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.13<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $477

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.13<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $477

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.12<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $480

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.14<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $480

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.12<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $481

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.15<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $481

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.11<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $484

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.16<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $484

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.11<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $485

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.17<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $485

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.10<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $488

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.18<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $488

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.10<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $489

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.19<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $489

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.3<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $492

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.20<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $492

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.3<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $493

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.21<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $493

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.2<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $496

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.22<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $496

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.2<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $497

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.23<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $497

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.1<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $500

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.24<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $500

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.1<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $501

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.25<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $501

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r180.15<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $504

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.26<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $504

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r180.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $505

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.27<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $505

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r180.14<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $508

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.28<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $508

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r180.14<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $509

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.29<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $509

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r180.11<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $512

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.30<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $512

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r180.11<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $513

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r240.31<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $513

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r180.10<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $516

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.27<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $516

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r180.10<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $517
        add (16|M0)              r2.0<1>:d     r1.1<0;1,0>:d     r7.0<1;1,0>:d    {Compacted}        //  ALU pipe: int; $520
(W)     add (1|M0)               r1.1<1>:d     r235.5<0;1,0>:d   r1.10<0;1,0>:d                      //  ALU pipe: int; $592
        shl (16|M0)              r233.0<1>:d   r2.0<1;1,0>:d     2:w               {Compacted,I@2}   //  ALU pipe: int; $521

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.26<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $517

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r135.15<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $522
        cmp (16|M0)   (eq)f3.0   null<1>:d     r180.14<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $580
        cmp (16|M0)   (lt)f2.1   null<1>:d     r180.14<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $581
        cmp (16|M0)   (eq)f2.0   null<1>:d     r180.11<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $582

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.23<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $522

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r135.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $523
        cmp (16|M0)   (lt)f1.1   null<1>:d     r180.11<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $583
        cmp (16|M0)   (eq)f1.0   null<1>:d     r180.10<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $584
        cmp (16|M0)   (lt)f0.1   null<1>:d     r180.10<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $585

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.24<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $523

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.3<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $524
(W)     xor (1|M0)               r135.11<1>:d  r1.1<0;1,0>:d     r235.5<0;1,0>:d                     //  ALU pipe: int; $593

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.25<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $524

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.3<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $525

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.21<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $525

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.4<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $526

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.22<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $526

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.4<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $527

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.19<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $527

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.5<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $528

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.20<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $528

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.5<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $529

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.17<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $529

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.6<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $530

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.18<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $530

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.6<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $531

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.15<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $531

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.7<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $532

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.16<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $532

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.7<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $533

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.13<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $533

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.11<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $534

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.14<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $534

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.11<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $535

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.11<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $535

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.12<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $536

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.12<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $536

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.12<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $537

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.7<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $537

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.7<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $538

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.8<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $538

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.7<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $539

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.9<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $539

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.13<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $540

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.10<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $540

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.13<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $541

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.5<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $541

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.14<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $542

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.6<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $542

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.14<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $543

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.3<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $543

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r1.15<0;1,0>:d    r2.0<1;1,0>:d                       //  ALU pipe: int; $544

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.4<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $544

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r1.15<0;1,0>:ud   r2.0<1;1,0>:ud                      //  ALU pipe: int; $545

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.31<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $545

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.0<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $546

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r238.2<1>:uw  f0.0<0;1,0>:uw                                        //  ALU pipe: int; $546

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.0<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $547

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.29<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $547

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.1<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $548

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.30<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $548

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.1<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $549

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.27<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $549

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.2<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $550

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.28<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $550

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.2<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $551

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.25<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $551

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r4.3<0;1,0>:d     r2.0<1;1,0>:d                       //  ALU pipe: int; $552

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.26<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $552

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r4.3<0;1,0>:ud    r2.0<1;1,0>:ud                      //  ALU pipe: int; $553

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.18<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $553

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.6<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $554

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.19<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $554

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.6<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $555

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.22<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $555

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.5<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $556

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.23<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $556

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.5<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $557

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.24<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $557

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r236.0<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $558

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.25<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $558

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r236.0<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $559

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.26<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $559

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.15<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $560

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.27<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $560

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $561

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.28<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $561

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.14<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $562

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.29<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $562

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.14<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $563

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.30<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $563

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.13<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $564

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r236.31<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $564

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.13<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $565

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.10<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $565

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.12<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $566

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.11<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $566

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.12<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $567

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.12<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $567

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.11<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $568

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.13<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $568

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.11<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $569

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.14<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $569

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.10<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $570

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.15<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $570

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.10<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $571

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.16<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $571

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.3<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $572

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.17<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $572

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.3<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $573

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.18<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $573

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.2<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $574

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.19<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $574

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.2<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $575

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.20<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $575

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r235.1<0;1,0>:d   r2.0<1;1,0>:d                       //  ALU pipe: int; $576

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.21<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $576

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r235.1<0;1,0>:ud  r2.0<1;1,0>:ud                      //  ALU pipe: int; $577

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.22<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $577

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (eq)f0.0   null<1>:d     r180.15<0;1,0>:d  r2.0<1;1,0>:d                       //  ALU pipe: int; $578

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.23<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $578

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
        cmp (16|M0)   (lt)f0.0   null<1>:d     r180.15<0;1,0>:ud  r2.0<1;1,0>:ud                     //  ALU pipe: int; $579

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp
(W)     mov (1|M0)               r237.24<1>:uw  f0.0<0;1,0>:uw                                       //  ALU pipe: int; $579

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     cmp (16|M0)   (eq)f0.0   null<1>:d     r1.10<0;1,0>:d    0:w                                 //  ALU pipe: int; $589
// B018: Preds:{B099, B017},  Succs:{B019, B099}
_0_061:

// Line 190:  const int seq_start_offset = query_start_loc[batch_id];
(W)     shl (1|M0)               r1.1<1>:q     r180.13<0;1,0>:ud  2:w              {$11.dst}         //  ALU pipe: int; $604

// Line 191:  const int seq_end_offset = query_start_loc[batch_id + 1];
(W)     add (1|M0)               r180.13<1>:d  r180.13<0;1,0>:d  1:w                                 //  ALU pipe: int; $609

// Line 190:  const int seq_start_offset = query_start_loc[batch_id];
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r5.1<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $605
(W)     load.ugm.d32x2t.a64 (1|M0)  r4:1        [r4:1]             {I@1,$19} // ex_desc:0x0; desc:0x2109580 // $606

// Line 192:  const int seq_len = seq_end_offset - seq_start_offset;
(W)     add (1|M0)               r1.1<1>:d     r4.1<0;1,0>:d     -r4.0<0;1,0>:d   {$19.dst}          //  ALU pipe: int; $612

// Line 194:  const int current_chunks = (seq_len + chunk_size - 1) / chunk_size;
(W)     cmp (1|M0)    (lt)f3.1   null<1>:d     r1.1<0;1,0>:d     -63:w               {I@1}           //  ALU pipe: int; $615
(W)     mov (1|M0)               r1.2<1>:hf    0x7E:hf                              {I@1}            //  ALU pipe: float; $616
(W&f3.1) sel (1|M0)              r1.2<1>:w     r1.2<0;1,0>:w     63:w               {F@1}            //  ALU pipe: int; $616
(W)     mov (1|M0)               r1.4<2>:b     r1.2<0;1,0>:w                    {I@1}                //  ALU pipe: int; $617
(W)     mov (1|M0)               r1.1<1>:d     r1.4<0;1,0>:ub                   {I@1}                //  ALU pipe: int; $618
(W)     add3 (1|M0)              r1.1<1>:d     r4.1<0;0>:d       -r4.0<0;0>:d      r1.1<0>:d        {I@1} //  ALU pipe: int; $619
(W)     asr (1|M0)               r1.1<1>:d     r1.1<0;1,0>:d     6:w               {I@1}             //  ALU pipe: int; $620

// Line 195:  const int cumsum_chunks = pre_chunks + current_chunks;
(W)     add (1|M0)               r180.12<1>:d  r180.12<0;1,0>:d  r1.1<0;1,0>:d    {I@1}              //  ALU pipe: int; $623

// Line 197:  if (chunk_id >= cumsum_chunks) {
(W)     cmp (16|M0)   (lt)f3.1   null<1>:d     r135.14<0;1,0>:d  r180.12<0;1,0>:d {I@1}              //  ALU pipe: int; $626
(W&~f3.1) jmpi                               _0_062                                                  //  ALU pipe: int; $627
// B019: Preds:{B018},  Succs:{B020}
_L_k0_64_preHeader:
_0_063:
// B020: Preds:{B019, B098},  Succs:{B021, B024}

// Line 203:  const int chunk_start_offset = chunk_id * chunk_size;
(W)     shl (1|M0)               r4.2<1>:d     r135.14<0;1,0>:d  6:w               {$22.dst}         //  ALU pipe: int; $631

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 219:  __spirv_ControlBarrier(__spv::Scope::Workgroup, __spv::Scope::Workgroup,
        sync.nop                             null                             {Compacted,$28.src}    // $635
(W)     send.slm (1|M0)          r2       r253  null:0  0x0            0x0210001F           {$17} // wr:1+0, rd:1; fence.slm.none.group // $635
(W)     mov (8|M0)               null<1>:ud    r2.0<1;1,0>:ud                   {Compacted,$17.dst}  //  memory fence commit; ALU pipe: int; $636
(W)     mov (1|M0)               r2.2<1>:f     0x100:f                               {I@1}           //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $636
(W)     mov (2|M0)               r2.10<1>:ub   r253.11<0;1,0>:ub                {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $636
(W)     send.gtwy (1|M0)         null     r2  null:0  0x0            0x02000004           {I@1,$3} // wr:1+0, rd:0; signal barrier // $636
(W)     sync.bar                             0x0                                                     // $636

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.28<0;1,0>:uw                                     //  ALU pipe: int; $640

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 210:  for (int e = local_id; e < chunk_size; e += local_range) {
(~f3.1) goto (16|M0)                         _0_064            _0_064                                //  ALU pipe: int; $640
// B021: [inDivergent],  Preds:{B020},  Succs:{B022}
_0_065:
        mov (16|M0)              r7.0<1>:d     r232.0<1;1,0>:d                  {Compacted}          //  ALU pipe: int; $642
// B022: [inDivergent],  Preds:{B023, B021},  Succs:{B023, B024}
_0_066:

// Line 212:  a[(chunk_start_offset + e) + v_head_id * total_virtual_seqlen];
        or (16|M0)               acc0.0<1>:d   r4.2<0;1,0>:d     r7.0<1;1,0>:d    {I@1}              //  ALU pipe: int; $646
        add (16|M0)              r2.0<1>:d     acc0.0<1;1,0>:d   r180.0<0;1,0>:d  {$3.src}           //  ALU pipe: int; $647
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $649
        shl (16|M0)              r2.0<1>:q     r8.0<2;1,0>:d     2:w               {I@1}             //  ALU pipe: int; $649
        add (16|M0)              r8.0<1>:q     r2.0<1;1,0>:q     r5.0<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $650

// Line 211:  g_slm_ptr[e] =
        shl (16|M0)              r2.0<1>:d     r7.0<1;1,0>:d     2:w               {Compacted}       //  ALU pipe: int; $653

// Line 212:  a[(chunk_start_offset + e) + v_head_id * total_virtual_seqlen];
        load.ugm.d32.a64 (16|M0)  r3:1          [r8:2]             {I@2,$1} // ex_desc:0x0; desc:0x4100580 // $651

// Line 211:  g_slm_ptr[e] =
        store.slm.d32.a32 (16|M0)  [r2:1]       r3:1               {I@1,$1} // ex_desc:0x0; desc:0x2000504 // $654

// Line 210:  for (int e = local_id; e < chunk_size; e += local_range) {
        add (16|M0)              r2.0<1>:d     r7.0<1;1,0>:d     r6.3<0;1,0>:d    {Compacted,$1.src} //  ALU pipe: int; $656
        cmp (16|M0)   (lt)f3.1   null<1>:d     r2.0<1;1,0>:ud    0x40:uw              {I@1}          //  ALU pipe: int; $659
(~f3.1) goto (16|M0)                         _0_064            _0_064                                //  ALU pipe: int; $660
// B023: [inDivergent],  Preds:{B022},  Succs:{B022}
_0_067:
        mov (16|M0)              r7.0<1>:d     r2.0<1;1,0>:d                    {Compacted}          //  ALU pipe: int; $662
(W)     jmpi                                 _0_066                                                  // $663
// B024: Preds:{B022, B020},  Succs:{B025, B026}
_0_064:
        join (16|M0)                         L10216                                                  // 
L10216:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 219:  __spirv_ControlBarrier(__spv::Scope::Workgroup, __spv::Scope::Workgroup,
        sync.nop                             null                             {Compacted,$3.src}     // $668
(W)     send.slm (1|M0)          r2       r253  null:0  0x0            0x0210001F           {I@3,$20} // wr:1+0, rd:1; fence.slm.none.group // $668
(W)     mov (8|M0)               null<1>:ud    r2.0<1;1,0>:ud                   {Compacted,$20.dst}  //  memory fence commit; ALU pipe: int; $669
(W)     mov (1|M0)               r2.2<1>:f     0x100:f                               {I@1}           //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $669
(W)     mov (2|M0)               r2.10<1>:ub   r253.11<0;1,0>:ub                {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $669
(W)     send.gtwy (1|M0)         null     r2  null:0  0x0            0x02000004           {I@1,$25} // wr:1+0, rd:0; signal barrier // $669
(W)     sync.bar                             0x0                                                     // $669
(W)     mul (1|M0)               acc0.0<1>:ud  r235.0<0;1,0>:ud  r4.4<0;1,0>:uw                      //  ALU pipe: int; $671
(W)     asr (1|M0)               r1.1<1>:d     r4.2<0;1,0>:d     31:w               {$11.dst}        //  ALU pipe: int; $670
(W)     macl (1|M0)              r4.0<1>:ud    r235.0<0;1,0>:ud  r4.2<0;1,0>:ud   {Compacted}        //  ALU pipe: int; $672
(W)     mul (1|M0)               acc0.0<1>:ud  r235.0<0;1,0>:ud  r4.4<0;1,0>:uw                      //  ALU pipe: int; $672
(W)     mach (1|M0)              r3.0<1>:d     r235.0<0;1,0>:ud  r4.2<0;1,0>:ud                      //  ALU pipe: int; 
(W)     mul (1|M0)               acc0.0<1>:d   r235.0<0;1,0>:ud  r1.2<0;1,0>:uw   {I@4}              //  ALU pipe: int; $673
(W)     macl (1|M0)              r2.0<1>:d     r235.0<0;1,0>:ud  r1.1<0;1,0>:d    {$25.src}          //  ALU pipe: int; $674
(W)     mul (1|M0)               acc0.0<1>:d   r4.2<0;1,0>:ud    r180.2<0;1,0>:uw                    //  ALU pipe: int; $675 R{} IR{}{E:2,E:2,},  {BC=1}
(W)     add (1|M0)               r3.0<1>:d     r3.0<0;1,0>:d     r2.0<0;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $674
(W)     macl (1|M0)              r2.0<1>:d     r4.2<0;1,0>:ud    r180.1<0;1,0>:d                     //  ALU pipe: int; $677 R{} IR{}{E:2,E:2,},  {BC=1}
(W)     add (1|M0)               r4.1<1>:d     r3.0<0;1,0>:d     r2.0<0;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $677

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 217:  auto k_ptr = k +
(W)     shl (1|M0)               r1.1<1>:q     r4.0<0;1,0>:q     1:w               {Compacted,I@1}   //  ALU pipe: int; $685
(W)     add (1|M0)               r1.1<1>:q     r1.1<0;1,0>:q     r4.2<0;1,0>:q    {I@1}              //  ALU pipe: int; $686

// Line 220:  (v_head_id / kv_ratio) * head_k_dim;
(W&~f0.0) jmpi                               _0_068                                                  //  ALU pipe: int; $688
// B025: Preds:{B024},  Succs:{B027}
_0_069:
(W)     mov (1|M0)               r1.1<1>:d     -1:w                               {Compacted}        //  ALU pipe: int; $690
(W)     jmpi                                 _0_070                                                  // $691
// B026: Preds:{B024},  Succs:{B027}
_0_068:
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $693
(W)     mov (1|M0)               r1.7<1>:f     r135.11<0;1,0>:ud                {A@1}                //  ALU pipe: float; $694
(W)     mov (1|M0)               r1.5<1>:f     0xB4C00000:f                                          //  ALU pipe: float; $699
(W)     mov (1|M0)               r1.6<1>:f     r180.4<0;1,0>:ud                                      //  ALU pipe: float; $697
(W)     mov (1|M0)               r1.4<1>:ud    r1.7<0;1,0>:f                    {F@3}                //  ALU pipe: int; $695
(W)     add (1|M0)               r1.8<1>:d     r135.11<0;1,0>:d  -r1.4<0;1,0>:d   {I@1}              //  ALU pipe: int; $696
(W)     math.inv (1|M0)          r1.4<1>:f     r1.7<0;1,0>:f                    {I@1}                //  ALU pipe: math; $698
(W)     mad (1|M0)               r1.11<1>:f    r1.4<0;0>:f       r1.5<0;0>:f       r1.4<0>:f        {A@1} //  ALU pipe: float; $699
(W)     mov (1|M0)               r1.4<1>:ud    r1.6<0;1,0>:f                    {F@1}                //  ALU pipe: int; $701
(W)     mul (1|M0)               r1.5<1>:f     r1.6<0;1,0>:f     r1.11<0;1,0>:f                      //  ALU pipe: float; $700
(W)     add (1|M0)               r1.9<1>:d     r180.4<0;1,0>:d   -r1.4<0;1,0>:d   {I@1}              //  ALU pipe: int; $702
(W)     mov (1|M0)               r1.4<1>:f     r1.8<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $704
(W)     mov (1|M0)               r1.10<1>:ud   r1.5<0;1,0>:f                    {F@2}                //  ALU pipe: int; $703
(W)     mov (1|M0)               r1.5<1>:f     r1.9<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $704
(W)     mov (1|M0)               r1.8<1>:f     r1.10<0;1,0>:ud                                       //  ALU pipe: float; $706
(W)     mad (1|M0)               r1.6<1>:f     r1.6<0;0>:f       r1.8<0;0>:f       -r1.7<0>:f       {F@1} //  ALU pipe: float; $708
(W)     mad (1|M0)               r1.4<1>:f     r1.5<0;0>:f       r1.8<0;0>:f       -r1.4<0>:f        //  ALU pipe: float; $710
(W)     add (1|M0)               r1.4<1>:f     r1.6<0;1,0>:f     r1.4<0;1,0>:f    {F@1}              //  ALU pipe: float; $711
(W)     mul (1|M0)               r1.4<1>:f     r1.11<0;1,0>:f    r1.4<0;1,0>:f    {F@1}              //  ALU pipe: float; $712
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $713
(W)     mov (1|M0)               r1.4<1>:ud    r1.4<0;1,0>:f                    {A@1}                //  ALU pipe: int; $714
(W)     add (1|M0)               r1.4<1>:d     r1.4<0;1,0>:d     r1.10<0;1,0>:d   {I@1}              //  ALU pipe: int; $715
(W)     mul (1|M0)               acc0.0<1>:d   r1.4<0;1,0>:d     r135.22<0;1,0>:uw {I@1}             //  ALU pipe: int; $716
(W)     macl (1|M0)              r4.0<1>:d     r1.4<0;1,0>:d     r135.11<0;1,0>:d {Compacted}        //  ALU pipe: int; $717
(W)     add (1|M0)               r1.5<1>:d     r180.4<0;1,0>:d   -r4.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $717 R{} IR{}{E:2,E:2,},  {BC=1}
(W)     cmp (1|M0)    (ge)f3.1   r1.5<1>:ud    r1.5<0;1,0>:ud    r135.11<0;1,0>:ud {I@1}             //  ALU pipe: int; $718
(W)     add3 (1|M0)              r1.4<1>:d     r1.4<0;0>:d       r180.5<0;0>:d     -r1.5<0>:d       {I@1} //  ALU pipe: int; $719
(W)     bfn.(s0^s1^s2) (1|M0)    r1.1<1>:ud    r1.4<0;0>:ud      r235.5<0;0>:ud    r236.8<0>:ud     {I@1} //  ALU pipe: int; $720
// B027: Preds:{B026, B025},  Succs:{B028, B029}
_0_070:
(W)     mul (1|M0)               acc0.0<1>:d   r1.1<0;1,0>:d     r5.14<0;1,0>:uw  {I@1}              //  ALU pipe: int; $722

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (2|M0)               r3.5<1>:d     0:w                                                   //  ALU pipe: int; $839
(W)     mov (2|M0)               r2.5<1>:d     0:w                                                   //  ALU pipe: int; $850

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 219:  head_k_dim +
(W)     macl (1|M0)              r4.0<1>:d     r1.1<0;1,0>:d     r5.7<0;1,0>:d    {Compacted}        //  ALU pipe: int; $725

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r3.2<1>:d     r135.12<0;1,0>:d                                      //  ALU pipe: int; $836
(W)     mov (1|M0)               r3.3<1>:d     63:w                                                  //  ALU pipe: int; $837
(W)     mov (1|M0)               r3.4<1>:d     r135.13<0;1,0>:d                                      //  ALU pipe: int; $838
(W)     mov (1|M0)               r3.7<1>:d     3871:w                                                //  ALU pipe: int; $841

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 219:  head_k_dim +
(W)     shl (1|M0)               r1.2<1>:q     r4.0<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $725

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r2.2<1>:d     r135.12<0;1,0>:d                                      //  ALU pipe: int; $847
(W)     mov (1|M0)               r2.3<1>:d     63:w                                                  //  ALU pipe: int; $848
(W)     mov (1|M0)               r2.4<1>:d     r135.13<0;1,0>:d                                      //  ALU pipe: int; $849
(W)     mov (1|M0)               r2.7<1>:d     3871:w                                                //  ALU pipe: int; $852

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 219:  head_k_dim +
(W)     add (1|M0)               r177.0<1>:q   r1.1<0;1,0>:q     r1.2<0;1,0>:q    {Compacted,@5,$25.src} //  ALU pipe: int; $726

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r3.5<1>:d     0:w                                                   //  ALU pipe: int; $874

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r3.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $876

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r2.5<1>:d     0:w                                                   //  ALU pipe: int; $900

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r2.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $902

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r3.0<1>:q     r177.0<0;1,0>:q                  {I@5}                //  ALU pipe: int; $835
(W)     mov (1|M0)               r2.0<1>:q     r177.0<0;1,0>:q                                       //  ALU pipe: int; $846

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 230:  chunk_start_offset * chunk_size;
(W)     shl (1|M0)               r1.1<1>:d     r135.14<0;1,0>:d  12:w                                //  ALU pipe: int; $732

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.29<0;1,0>:uw                                     //  ALU pipe: int; $1017

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r135.2<1>:d   127:w                               {Compacted,$12.src} //  ALU pipe: int; $748

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r3:1]       {I@5,$14} // ex_desc:0x0; desc:0x2080203 // $880
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r2:1]       {I@4,$18} // ex_desc:0x0; desc:0x2080203 // $906

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r3.5<1>:d     32:w                               {$14.src}          //  ALU pipe: int; $927

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r3.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $929

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r2.5<1>:d     32:w                               {$18.src}          //  ALU pipe: int; $953

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r2.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $955

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 229:  chunk_size +
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     1:w               {I@7}             //  ALU pipe: int; $735

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r135.3<1>:d   63:w                                                  //  ALU pipe: int; $749

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r3:1]       {I@5,$23} // ex_desc:0x0; desc:0x2080203 // $933

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r3.5<1>:d     64:w                               {$23.src}          //  ALU pipe: int; $980

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r2:1]       {I@4,$12} // ex_desc:0x0; desc:0x2080203 // $959

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r3.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $982

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r2.5<1>:d     64:w                               {$12.src}          //  ALU pipe: int; $1006

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r2.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $1008

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r135.4<1>:d   127:w                               {Compacted}       //  ALU pipe: int; $750
(W)     mov (1|M0)               r135.5<1>:d   0:w                                                   //  ALU pipe: int; $751

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r3:1]       {I@5,$21} // ex_desc:0x0; desc:0x2080203 // $986

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r135.3<1>:uq  0x70F00000000:uq                                      //  ALU pipe: int; $752

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r2:1]       {I@4,$6} // ex_desc:0x0; desc:0x2080203 // $1012

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 150:  payload = __builtin_IB_subgroup_createBlock2DAddressPayload(
(W)     mov (1|M0)               r177.2<1>:d   r135.12<0;1,0>:d                                      //  ALU pipe: int; $797
(W)     mov (1|M0)               r177.3<1>:d   63:w                                                  //  ALU pipe: int; $798
(W)     mov (1|M0)               r177.4<1>:d   r135.13<0;1,0>:d                                      //  ALU pipe: int; $799
(W)     mov (2|M0)               r177.5<1>:d   0:w                                                   //  ALU pipe: int; $800
(W)     mov (1|M0)               r177.7<1>:f   0x11F0F:f                                             //  (0x00011f0f:f); ALU pipe: float; $802
(W)     mov (1|M0)               r176.2<1>:d   r135.12<0;1,0>:d                 {$20.src}            //  ALU pipe: int; $808
(W)     mov (1|M0)               r176.3<1>:d   63:w                                                  //  ALU pipe: int; $809
(W)     mov (1|M0)               r176.4<1>:d   r135.13<0;1,0>:d                                      //  ALU pipe: int; $810
(W)     mov (2|M0)               r176.5<1>:d   0:w                                                   //  ALU pipe: int; $811
(W)     mov (1|M0)               r176.7<1>:d   3847:w                                                //  ALU pipe: int; $813
(W)     mov (1|M0)               r176.0<1>:q   r177.0<0;1,0>:q                                       //  ALU pipe: int; $807

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 229:  chunk_size +
(W)     add (1|M0)               r135.0<1>:q   r180.1<0;1,0>:q   r1.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $736

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/gemm.hpp

// Line 119:  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
(W&f3.1) jmpi                                _0_071                                                  //  ALU pipe: int; $1017
// B028: Preds:{B027},  Succs:{B034}
_0_072:
        mov (16|M0)              r111.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1019
        mov (16|M0)              r112.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1020
        mov (16|M0)              r113.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1021
        mov (16|M0)              r114.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1022
        mov (16|M0)              r115.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1023
        mov (16|M0)              r116.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1024
        mov (16|M0)              r117.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1025
        mov (16|M0)              r118.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1026
        mov (16|M0)              r103.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1027
        mov (16|M0)              r104.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1028
        mov (16|M0)              r105.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1029
        mov (16|M0)              r106.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1030
        mov (16|M0)              r107.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1031
        mov (16|M0)              r108.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1032
        mov (16|M0)              r109.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1033
        mov (16|M0)              r110.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1034
        mov (16|M0)              r95.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1035
        mov (16|M0)              r96.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1036
        mov (16|M0)              r97.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1037
        mov (16|M0)              r98.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1038
        mov (16|M0)              r99.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1039
        mov (16|M0)              r100.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1040
        mov (16|M0)              r101.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1041
        mov (16|M0)              r102.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1042
        mov (16|M0)              r87.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1043
        mov (16|M0)              r88.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1044
        mov (16|M0)              r89.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1045
        mov (16|M0)              r90.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1046
        mov (16|M0)              r91.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1047
        mov (16|M0)              r92.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1048
        mov (16|M0)              r93.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1049
        mov (16|M0)              r94.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1050
        mov (16|M0)              r79.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1051
        mov (16|M0)              r80.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1052
        mov (16|M0)              r81.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1053
        mov (16|M0)              r82.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1054
        mov (16|M0)              r83.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1055
        mov (16|M0)              r84.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1056
        mov (16|M0)              r85.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1057
        mov (16|M0)              r86.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1058
        mov (16|M0)              r71.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1059
        mov (16|M0)              r72.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1060
        mov (16|M0)              r73.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1061
        mov (16|M0)              r74.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1062
        mov (16|M0)              r75.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1063
        mov (16|M0)              r76.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1064
        mov (16|M0)              r77.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1065
        mov (16|M0)              r78.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1066
        mov (16|M0)              r63.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1067
        mov (16|M0)              r64.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1068
        mov (16|M0)              r65.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1069
        mov (16|M0)              r66.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1070
        mov (16|M0)              r67.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1071
        mov (16|M0)              r68.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1072
        mov (16|M0)              r69.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1073
        mov (16|M0)              r70.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1074
        mov (16|M0)              r55.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1075
        mov (16|M0)              r56.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1076
        mov (16|M0)              r57.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1077
        mov (16|M0)              r58.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1078
        mov (16|M0)              r59.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1079
        mov (16|M0)              r60.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1080
        mov (16|M0)              r61.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1081
        mov (16|M0)              r62.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1082
(W)     jmpi                                 _0_073                                                  // $1083
// B029: Preds:{B027},  Succs:{B030}
_0_071:

// Line 125:  if (k_tile_prefetch < k_tile_count) {
        mov (16|M0)              r111.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1086
        mov (16|M0)              r112.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1087
        mov (16|M0)              r113.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1088
        mov (16|M0)              r114.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1089
        mov (16|M0)              r115.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1090
        mov (16|M0)              r116.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1091
        mov (16|M0)              r117.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1092
        mov (16|M0)              r118.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1093
        mov (16|M0)              r103.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1094
        mov (16|M0)              r104.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1095
        mov (16|M0)              r105.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1096
        mov (16|M0)              r106.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1097
        mov (16|M0)              r107.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1098
        mov (16|M0)              r108.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1099
        mov (16|M0)              r109.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1100
        mov (16|M0)              r110.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1101
        mov (16|M0)              r95.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1102
        mov (16|M0)              r96.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1103
        mov (16|M0)              r97.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1104
        mov (16|M0)              r98.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1105
        mov (16|M0)              r99.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1106
        mov (16|M0)              r100.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1107
        mov (16|M0)              r101.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1108
        mov (16|M0)              r102.0<1>:ud  0x0:ud                              {Compacted}       //  ALU pipe: int; $1109
        mov (16|M0)              r87.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1110
        mov (16|M0)              r88.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1111
        mov (16|M0)              r89.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1112
        mov (16|M0)              r90.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1113
        mov (16|M0)              r91.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1114
        mov (16|M0)              r92.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1115
        mov (16|M0)              r93.0<1>:ud   0x0:ud                              {Compacted}       //  ALU pipe: int; $1116
        mov (16|M0)              r94.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1117
        mov (16|M0)              r79.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1118
        mov (16|M0)              r80.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1119
        mov (16|M0)              r81.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1120
        mov (16|M0)              r82.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1121
        mov (16|M0)              r83.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1122
        mov (16|M0)              r84.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1123
        mov (16|M0)              r85.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1124
        mov (16|M0)              r86.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1125
        mov (16|M0)              r71.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1126
        mov (16|M0)              r72.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1127
        mov (16|M0)              r73.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1128
        mov (16|M0)              r74.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1129
        mov (16|M0)              r75.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1130
        mov (16|M0)              r76.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1131
        mov (16|M0)              r77.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1132
        mov (16|M0)              r78.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1133
        mov (16|M0)              r63.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1134
        mov (16|M0)              r64.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1135
        mov (16|M0)              r65.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1136
        mov (16|M0)              r66.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1137
        mov (16|M0)              r67.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1138
        mov (16|M0)              r68.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1139
        mov (16|M0)              r69.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1140
        mov (16|M0)              r70.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1141
        mov (16|M0)              r55.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1142
        mov (16|M0)              r56.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1143
        mov (16|M0)              r57.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1144
        mov (16|M0)              r58.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1145
        mov (16|M0)              r59.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1146
        mov (16|M0)              r60.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1147
        mov (16|M0)              r61.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1148
        mov (16|M0)              r62.0<1>:f    0x0:f                               {Compacted}       //  ALU pipe: float; $1149
(W)     mov (1|M0)               r1.2<1>:d     3:w                               {Compacted}         //  ALU pipe: int; $1150
(W)     mov (1|M0)               r1.1<1>:d     0:w                               {Compacted}         //  ALU pipe: int; $1151
// B030: Preds:{B033, B029},  Succs:{B031, B032}
_0_074:

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/util/xe_split_barrier.hpp

// Line 73:  __spirv_ControlBarrierArriveINTEL(scope, memory_scope, memory_semantics);
(W)     mov (1|M0)               r7.2<1>:f     0x100:f                                               //  signal barrier payload init (active only); (0x00000100:f); ALU pipe: float; $1158
(W)     mov (2|M0)               r7.10<1>:ub   r253.11<0;1,0>:ub                {F@1}                //  signal barrier payload (nprods, ncons); ALU pipe: int; $1158
(W)     send.gtwy (1|M0)         null     r7  null:0  0x0            0x02000004           {I@1,$22} // wr:1+0, rd:0; signal barrier // $1158

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/numeric/arithmetic_tuple.hpp

// Line 410:  auto r = a * e.value();
(W)     shl (1|M0)               r1.3<1>:d     r1.1<0;1,0>:d     5:w                                 //  ALU pipe: int; $1168

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r176.6<1>:d   r173.0<0;1,0>:d                                       //  ALU pipe: int; $1211
(W)     mov (1|M0)               r177.6<1>:d   r175.0<0;1,0>:d                                       //  ALU pipe: int; $1182

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/gemm.hpp

// Line 125:  if (k_tile_prefetch < k_tile_count) {
(W)     cmp (16|M0)   (lt)f3.1   null<1>:d     r1.2<0;1,0>:d     r135.10<0;1,0>:d                    //  ALU pipe: int; $1266

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r177.5<1>:d   r1.3<0;1,0>:d                    {I@4}                //  ALU pipe: int; $1180

// Line 170:  int32_t x = get<XMode::value>(coord) * Bits / Op::CopyBits;
(W)     shr (1|M0)               r1.3<1>:ud    r1.3<0;1,0>:ud    1:w                                 //  ALU pipe: int; $1206

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 82:  asm (
        sync.allrd                           ($15,$22)                                               // $1186
        load_block2d.ugm.d16.a64 (1|M0)  r7:31   [r177:1]           {I@2,$7} // ex_desc:0x0; desc:0x3F00203 // $1186

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r176.5<1>:d   r1.3<0;1,0>:d                    {I@1}                //  ALU pipe: int; $1209

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 130:  asm (
        sync.allrd                           ($3,$4,$8,$9,$16,$17,$29,$31)                           // $1215
        load_block2d.ugm.d32t.a64 (1|M0)  r127:8 [r176:1]          {I@1,$13} // ex_desc:0x0; desc:0x2808403 // $1215

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r176.5<1>:d   r1.3<0;1,0>:d                    {$13.src}            //  ALU pipe: int; $1223

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r176.6<1>:d   r174.0<0;1,0>:d                                       //  ALU pipe: int; $1225

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 130:  asm (
        sync.allrd                           ($24,$27)                                               // $1229
        load_block2d.ugm.d32t.a64 (1|M0)  r119:8 [r176:1]          {I@1,$0} // ex_desc:0x0; desc:0x2808403 // $1229

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 170:  int32_t x = get<XMode::value>(coord) * Bits / Op::CopyBits;
(W)     or (1|M0)                r176.5<1>:d   r1.3<0;1,0>:d     8:w               {$0.src}          //  ALU pipe: int; $1237

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r176.6<1>:d   r173.0<0;1,0>:d                                       //  ALU pipe: int; $1242

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 130:  asm (
        load_block2d.ugm.d32t.a64 (1|M0)  r47:8 [r176:1]           {I@1,$10} // ex_desc:0x0; desc:0x2808403 // $1246

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r176.6<1>:d   r174.0<0;1,0>:d                  {$10.src}            //  ALU pipe: int; $1256

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 130:  asm (
        load_block2d.ugm.d32t.a64 (1|M0)  r39:8 [r176:1]           {I@1,$2} // ex_desc:0x0; desc:0x2808403 // $1260

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/gemm.hpp

// Line 125:  if (k_tile_prefetch < k_tile_count) {
(W&~f3.1) jmpi                               _0_075                                                  //  ALU pipe: int; $1267
// B031: Preds:{B030},  Succs:{B032}
_0_076:

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/numeric/arithmetic_tuple.hpp

// Line 410:  auto r = a * e.value();
        sync.nop                             null                             {Compacted,$11.src}    // $1277
(W)     shl (1|M0)               r3.5<1>:d     r1.2<0;1,0>:d     5:w               {$21.src}         //  ALU pipe: int; $1277

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r3.6<1>:d     r172.0<0;1,0>:d                                       //  ALU pipe: int; $1292
        sync.nop                             null                             {Compacted,$26.src}    // $1318
(W)     mov (1|M0)               r2.6<1>:d     r172.0<0;1,0>:d                  {$6.src}             //  ALU pipe: int; $1318

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r2.5<1>:f     r3.5<0;1,0>:f                    {I@3}                //  ALU pipe: float; $1316

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 148:  asm (
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r3:1]       {I@2,$11} // ex_desc:0x0; desc:0x2080203 // $1296
        load_block2d.ugm.d16.a64.ca.ca (1|M0)  null:0 [r2:1]       {A@1,$26} // ex_desc:0x0; desc:0x2080203 // $1322
// B032: Preds:{B031, B030},  Succs:{B033, B034}
_0_075:

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/mma_xe.hpp

// Line 137:  CUTE_DECLARE_XE_DPAS_TT(f,   bf,   bf,   f)
        sync.allwr                           ($0,$13,$15)                                            // $2576
        dpas.8x8 (16|M0)         r55:f         r55:f             r127:bf           r7.0:bf          {Atomic,Compacted,$7.dst} // $2576 R{} IR{}{O:3,O:7,O:3,},  R{} IR{}{E:12,E:0,E:4,},  {BC=2}
        dpas.8x8 (16|M0)         r63:f         r63:f             r127:bf           r11.0:bf         {Atomic,Compacted} // $2593 R{} IR{}{O:7,O:7,O:5,},  R{} IR{}{E:0,E:0,E:6,},  {BC=2}
        dpas.8x8 (16|M0)         r71:f         r71:f             r127:bf           r15.0:bf         {Atomic,Compacted} // $2610 R{} IR{}{O:3,O:7,O:7,},  R{} IR{}{E:4,E:0,E:8,},  {BC=2}
        dpas.8x8 (16|M0)         r79:f         r79:f             r127:bf           r19.0:bf         {Atomic,Compacted} // $2627 R{} IR{}{O:7,O:7,O:1,},  R{} IR{}{E:8,E:0,E:10,},  {BC=2}
        dpas.8x8 (16|M0)         r111:f        r111:f            r119:bf           r19.0:bf         {Atomic,Compacted} // $2644 R{} IR{}{O:7,O:3,O:1,},  R{} IR{}{E:8,E:12,E:10,},  {BC=2}
        dpas.8x8 (16|M0)         r103:f        r103:f            r119:bf           r15.0:bf         {Atomic,Compacted} // $2661 R{} IR{}{O:3,O:3,O:7,},  R{} IR{}{E:4,E:12,E:8,},  {BC=2}
        dpas.8x8 (16|M0)         r95:f         r95:f             r119:bf           r11.0:bf         {Atomic,Compacted} // $2678 R{} IR{}{O:7,O:3,O:5,},  R{} IR{}{E:0,E:12,E:6,},  {BC=2}
        dpas.8x8 (16|M0)         r87:f         r87:f             r119:bf           r7.0:bf          {Compacted,$15} // $2695 R{} IR{}{O:3,O:3,O:3,},  R{} IR{}{E:12,E:12,E:4,},  {BC=3}
        sync.allwr                           ($2,$15)                                                // $2712
        dpas.8x8 (16|M0)         r55:f         r55:f             r47:bf            r23.0:bf         {Atomic,Compacted,$10.dst} // $2712 R{} IR{}{O:3,O:7,O:3,},  R{} IR{}{E:12,E:8,E:12,},  {BC=2}
        dpas.8x8 (16|M0)         r63:f         r63:f             r47:bf            r27.0:bf         {Atomic,Compacted} // $2729 R{} IR{}{O:7,O:7,O:5,},  R{} IR{}{E:0,E:8,E:14,},  {BC=2}
        dpas.8x8 (16|M0)         r71:f         r71:f             r47:bf            r31.0:bf         {Atomic,Compacted} // $2746 R{} IR{}{O:3,O:7,O:7,},  R{} IR{}{E:4,E:8,E:0,},  {BC=2}
        dpas.8x8 (16|M0)         r79:f         r79:f             r47:bf            r35.0:bf         {Atomic,Compacted} // $2763 R{} IR{}{O:7,O:7,O:1,},  R{} IR{}{E:8,E:8,E:2,},  {BC=2}
        dpas.8x8 (16|M0)         r111:f        r111:f            r39:bf            r35.0:bf         {Atomic,Compacted} // $2780 R{} IR{}{O:7,O:3,O:1,},  R{} IR{}{E:8,E:4,E:2,},  {BC=2}
        dpas.8x8 (16|M0)         r103:f        r103:f            r39:bf            r31.0:bf         {Atomic,Compacted} // $2797 R{} IR{}{O:3,O:3,O:7,},  R{} IR{}{E:4,E:4,E:0,},  {BC=2}
        dpas.8x8 (16|M0)         r95:f         r95:f             r39:bf            r27.0:bf         {Atomic,Compacted} // $2814 R{} IR{}{O:7,O:3,O:5,},  R{} IR{}{E:0,E:4,E:14,},  {BC=2}
        dpas.8x8 (16|M0)         r87:f         r87:f             r39:bf            r23.0:bf         {Compacted,$15} // $2831 R{} IR{}{O:3,O:3,O:3,},  R{} IR{}{E:12,E:4,E:12,},  {BC=3}

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/util/xe_split_barrier.hpp

// Line 78:  __spirv_ControlBarrierWaitINTEL(scope, memory_scope, memory_semantics);
(W)     sync.bar                             0x0                                                     // $2837

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/gemm.hpp

// Line 119:  for (int k_tile = 0; k_tile < k_tile_count; k_tile++, k_tile_prefetch++) {
(W)     add (1|M0)               r1.1<1>:d     r1.1<0;1,0>:d     1:w                                 //  ALU pipe: int; $2841
(W)     cmp (16|M0)   (lt)f3.1   null<1>:d     r1.1<0;1,0>:d     r135.10<0;1,0>:d {I@1}              //  ALU pipe: int; $2844
(W&~f3.1) jmpi                               _0_073                                                  //  ALU pipe: int; $2845
// B033: Preds:{B032},  Succs:{B030}
_0_077:
(W)     add (1|M0)               r1.2<1>:d     r1.2<0;1,0>:d     1:w                                 //  ALU pipe: int; $2847
(W)     jmpi                                 _0_074                                                  // $2850
// B034: [FCALL],  Preds:{B032, B028},  Succs:{B035}
_0_073:

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp
(W)     add3 (1|M0)              r1.1<1>:d     r135.15<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $2854 R{} IR{}{O:3,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        load.slm.d32.a32 (16|M0)  r10:1         [r234:1]           {$30} // ex_desc:0x0; desc:0x2100500 // $2861
        sync.allrd                           ($11,$21)                                               // $2867
(W)     load.slm.d32x8t.a32 (1|M0)  r3:1        [r1:1]             {I@1,$5} // ex_desc:0x0; desc:0x210C500 // $2867

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.30<0;1,0>:uw                                     //  ALU pipe: int; $2881

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {$5.src}          //  ALU pipe: int; $2857
(W)     add3 (1|M0)              r1.1<1>:d     r236.7<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3011 R{} IR{}{E:6,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,$15.src}    // $3186
(W)     load.slm.d32x1t.a32 (1|M0)  r26:1       [r252:1]           {$1} // ex_desc:0x0; desc:0x2108500 // $3186
(W)     load.slm.d32x1t.a32 (1|M0)  r24:1       [r251:1]           {$19} // ex_desc:0x0; desc:0x2108500 // $3205
(W)     load.slm.d32x1t.a32 (1|M0)  r22:1       [r250:1]           {$4} // ex_desc:0x0; desc:0x2108500 // $3224

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $2858
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3014
(W)     add3 (1|M0)              r1.1<1>:d     r236.6<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3163 R{} IR{}{E:6,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
(W)     load.slm.d32x1t.a32 (1|M0)  r16:1       [r249:1]           {$29} // ex_desc:0x0; desc:0x2108500 // $3243
(W)     load.slm.d32x1t.a32 (1|M0)  r25:1       [r248:1]           {$16} // ex_desc:0x0; desc:0x2108500 // $3284

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x8t.a64 (1|M0)  r7:1        [r4:1]             {I@3,$8} // ex_desc:0x0; desc:0x210C580 // $2864
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$8.src} //  ALU pipe: int; $3015

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,$5.dst}     // $2868
        add (16|M0)              acc0.0<1>:f   r3.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted,$30.dst} //  ALU pipe: float; $2868

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3166

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        sync.nop                             null                             {Compacted,$26.src}    // $2872
        mul (16|M0)              r2.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f               {$6.src} //  ALU pipe: float; $2872

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x8t.a64 (1|M0)  r9:1        [r4:1]             {I@2,$31} // ex_desc:0x0; desc:0x210C580 // $3016
(W)     add3 (1|M0)              r1.1<1>:d     r236.5<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3169 R{} IR{}{E:6,E:2,E:2,},  {BC=1}
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$31.src} //  ALU pipe: int; $3167

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        math.exp (16|M0)         r2.0<1>:f     r2.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2873

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r20:1       [r4:1]             {I@1,$27} // ex_desc:0x0; desc:0x2108580 // $3168
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w                                 //  ALU pipe: int; $3171
(W)     add3 (1|M0)              r1.1<1>:d     r236.0<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3174 R{} IR{}{E:6,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
(W)     load.slm.d32x1t.a32 (1|M0)  r23:1       [r247:1]           {$24} // ex_desc:0x0; desc:0x2108500 // $3303
(W)     load.slm.d32x1t.a32 (1|M0)  r21:1       [r246:1]           {$9} // ex_desc:0x0; desc:0x2108500 // $3322
(W)     load.slm.d32x1t.a32 (1|M0)  r40:1       [r244:1]           {$22} // ex_desc:0x0; desc:0x2108500 // $3382

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$27.src} //  ALU pipe: int; $3172
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3176
(W)     add3 (1|M0)              r1.1<1>:d     r235.15<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3179 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
(W)     load.slm.d32x1t.a32 (1|M0)  r38:1       [r243:1]           {$7} // ex_desc:0x0; desc:0x2108500 // $3401
(W)     load.slm.d32x1t.a32 (1|M0)  r36:1       [r242:1]           {$13} // ex_desc:0x0; desc:0x2108500 // $3420

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r19:1       [r4:1]             {I@3,$0} // ex_desc:0x0; desc:0x2108580 // $3173
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$0.src} //  ALU pipe: int; $3177
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3181
(W)     add3 (1|M0)              r1.1<1>:d     r235.14<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3261 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
(W)     load.slm.d32x1t.a32 (1|M0)  r30:1       [r241:1]           {$10} // ex_desc:0x0; desc:0x2108500 // $3439
(W)     load.slm.d32x1t.a32 (1|M0)  r41:1       [r240:1]           {$17} // ex_desc:0x0; desc:0x2108500 // $3480

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r18:1       [r4:1]             {I@3,$2} // ex_desc:0x0; desc:0x2108580 // $3178
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$2.src} //  ALU pipe: int; $3182
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3264
(W)     add3 (1|M0)              r1.1<1>:d     r235.13<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3267 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
(W)     load.slm.d32x1t.a32 (1|M0)  r39:1       [r239:1]           {$3} // ex_desc:0x0; desc:0x2108500 // $3481
(W)     load.slm.d32x1t.a32 (1|M0)  r37:1       [r238:1]           {$11} // ex_desc:0x0; desc:0x2108500 // $3482

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r17:1       [r4:1]             {I@3,$26} // ex_desc:0x0; desc:0x2108580 // $3183
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$26.src} //  ALU pipe: int; $3265
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3269
(W)     add3 (1|M0)              r1.1<1>:d     r235.12<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3272 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4149
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud              {F@1}           //  ALU pipe: int; $4149

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r15:1       [r4:1]             {I@5,$15} // ex_desc:0x0; desc:0x2108580 // $3266
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@4,$15.src} //  ALU pipe: int; $3270
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@4}             //  ALU pipe: int; $3274
(W)     add3 (1|M0)              r1.1<1>:d     r235.11<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3277 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4148
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4149

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r14:1       [r4:1]             {I@5,$20} // ex_desc:0x0; desc:0x2108580 // $3271
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@4,$20.src} //  ALU pipe: int; $3275
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@4}             //  ALU pipe: int; $3279
(W)     add3 (1|M0)              r1.1<1>:d     r235.10<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3359 R{} IR{}{O:5,E:2,E:2,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4149
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4149

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r13:1       [r4:1]             {I@5,$25} // ex_desc:0x0; desc:0x2108580 // $3276
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@4,$25.src} //  ALU pipe: int; $3280
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@4}             //  ALU pipe: int; $3362
(W)     add3 (1|M0)              r1.1<1>:d     r235.3<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3365 R{} IR{}{O:5,E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r12:1       [r4:1]             {I@3,$28} // ex_desc:0x0; desc:0x2108580 // $3281
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$28.src} //  ALU pipe: int; $3363
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3367
(W)     add3 (1|M0)              r1.1<1>:d     r235.2<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3370 R{} IR{}{O:5,E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r34:1       [r4:1]             {I@3,$14} // ex_desc:0x0; desc:0x2108580 // $3364
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$14.src} //  ALU pipe: int; $3368
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3372
(W)     add3 (1|M0)              r1.1<1>:d     r235.1<0;0>:d     r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3375 R{} IR{}{O:5,E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r33:1       [r4:1]             {I@3,$18} // ex_desc:0x0; desc:0x2108580 // $3369
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$18.src} //  ALU pipe: int; $3373
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3377
(W)     add3 (1|M0)              r1.1<1>:d     r180.15<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3457 R{} IR{r180,}{E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r32:1       [r4:1]             {I@3,$23} // ex_desc:0x0; desc:0x2108580 // $3374
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$23.src} //  ALU pipe: int; $3378
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3460
(W)     add3 (1|M0)              r1.1<1>:d     r180.14<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3463 R{} IR{r180,}{E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r31:1       [r4:1]             {I@3,$12} // ex_desc:0x0; desc:0x2108580 // $3379
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$12.src} //  ALU pipe: int; $3461
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3465
(W)     add3 (1|M0)              r1.1<1>:d     r180.11<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3468 R{} IR{r180,}{E:2,E:2,},  {BC=1}
(W)     load.ugm.d32x1t.a64 (1|M0)  r29:1       [r4:1]             {I@3,$21} // ex_desc:0x0; desc:0x2108580 // $3462
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$21.src} //  ALU pipe: int; $3466
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@2}             //  ALU pipe: int; $3470
(W)     add3 (1|M0)              r1.1<1>:d     r180.10<0;0>:d    r4.2<0;0>:d       r180.0<0>:d       //  ALU pipe: int; $3473 R{} IR{r180,}{E:2,E:2,},  {BC=1}

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $2876
        mul (16|M0)              acc0.0<1>:f   r2.0<1;1,0>:f     r7.0<0;1,0>:f    {Compacted,$8.dst} //  ALU pipe: float; $2876

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r28:1       [r4:1]             {I@3,$6} // ex_desc:0x0; desc:0x2108580 // $3467

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r55.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted,$15.dst} //  ALU pipe: float; $2879

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,@2,$6.src} //  ALU pipe: int; $3471

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2881

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.31<0;1,0>:uw                {F@1}                //  ALU pipe: int; $2883

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     shl (1|M0)               r1.1<1>:q     r1.1<0;1,0>:d     2:w               {I@3}             //  ALU pipe: int; $3475

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {I@1,$30} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4149

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r2.0<1>:f     acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $2883

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.1<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2886

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.2<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $2899

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2890
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2891

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.1<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2894

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r56.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2897

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2899

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.3<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $2901

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r133.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$9.src}        //  ALU pipe: float; $2901

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.2<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2904

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.4<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $2917

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2908
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2909

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.2<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2912

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r57.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2915

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2917

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.5<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $2919

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r124.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $2919

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.3<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2922

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.6<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $2935

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2926
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2927

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.3<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2930

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r58.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2933

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2935

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.7<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $2937

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r125.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$24.src}       //  ALU pipe: float; $2937

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.4<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2940

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.8<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $2953

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2944
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2945

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.4<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2948

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r59.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2951

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2953

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.9<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $2955

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r126.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$27.src}       //  ALU pipe: float; $2955

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.5<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $2958

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.10<0;1,0>:uw                {F@2}                //  ALU pipe: int; $2971

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2962
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2963

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.5<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2966

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r60.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2969

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2971

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.11<0;1,0>:uw                {F@1}                //  ALU pipe: int; $2973

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r127.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$31.src}       //  ALU pipe: float; $2973

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.6<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2976

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.12<0;1,0>:uw                {F@2}                //  ALU pipe: int; $2989

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2980
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2981

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.6<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2984

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r61.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $2987

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2989

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.13<0;1,0>:uw                {F@1}                //  ALU pipe: int; $2991

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r128.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$8.src}        //  ALU pipe: float; $2991

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.7<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $2994

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.14<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3007

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2998
        math.exp (16|M0)         r8.0<1>:f     r8.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $2999

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r7.7<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3002
(W)     load.slm.d32x8t.a32 (1|M0)  r8:1        [r6:1]             {F@1,$5} // ex_desc:0x0; desc:0x210C500 // $3019

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r62.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3005

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3007

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.15<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3009

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r129.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$16.src}       //  ALU pipe: float; $3009

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted,$5.dst} //  ALU pipe: float; $3020

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.16<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3033

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3024
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3025

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3028
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.0<0;1,0>:f    {Compacted,$31.dst} //  ALU pipe: float; $3028

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r63.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3031

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3033

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.17<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3035

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r130.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3035

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.1<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3038

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.18<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3051

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3042
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3043

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.1<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3046

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r64.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3049

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3051

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.19<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3053

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r131.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$4.src}        //  ALU pipe: float; $3053

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.2<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3056

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.20<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3069

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3060
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3061

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.2<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3064

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r65.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3067

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3069

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.21<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3071

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r132.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$17.src}       //  ALU pipe: float; $3071

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.3<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3074

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.22<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3087

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3078
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3079

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.3<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3082

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r66.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3085

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3087

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.23<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3089

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r134.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$3.src}        //  ALU pipe: float; $3089

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.4<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3092

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.24<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3105

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3096
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3097

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.4<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3100

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r67.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3103

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3105

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.25<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3107

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r176.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3107

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.5<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3110

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.26<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3123

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3114
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3115

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.5<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3118

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r68.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3121

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3123

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.27<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3125

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r177.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3125

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.6<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3128

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.28<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3141

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3132
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3133

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.6<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3136

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r69.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3139

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3141

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.29<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3143

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r178.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$14.src}       //  ALU pipe: float; $3143

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.7<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3146

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.30<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3159

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3150
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3151

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r9.7<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3154

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r70.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3157

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3159

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r239.31<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3161

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r179.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$18.src}       //  ALU pipe: float; $3161

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r26.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$1.dst} //  ALU pipe: float; $3187 R{} IR{}{E:5,E:5,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.2<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3200

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3191
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3192

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3195
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r20.0<0;1,0>:f   {Compacted,$27.dst} //  ALU pipe: float; $3195

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r71.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3198

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3200

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.3<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3202

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r181.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$23.src}       //  ALU pipe: float; $3202

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r24.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$19.dst} //  ALU pipe: float; $3206

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.4<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3219

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3210
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3211

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3214
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r19.0<0;1,0>:f   {Compacted,$0.dst} //  ALU pipe: float; $3214

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r72.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3217

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3219

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.5<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3221

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r182.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$12.src}       //  ALU pipe: float; $3221

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r22.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$4.dst} //  ALU pipe: float; $3225

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.6<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3238

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3229
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3230

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3233
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r18.0<0;1,0>:f   {Compacted,$2.dst} //  ALU pipe: float; $3233

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r73.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3236

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3238

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.7<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3240

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r183.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$21.src}       //  ALU pipe: float; $3240

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r16.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$29.dst} //  ALU pipe: float; $3244

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.8<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3257

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3248
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3249

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3252
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r17.0<0;1,0>:f   {Compacted,$26.dst} //  ALU pipe: float; $3252

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r74.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3255

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3257

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.9<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3259

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r184.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$6.src}        //  ALU pipe: float; $3259

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r25.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$16.dst} //  ALU pipe: float; $3285

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.10<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3298

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3289
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3290

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3293
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r15.0<0;1,0>:f   {Compacted,$15.dst} //  ALU pipe: float; $3293

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r75.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3296

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3298

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.11<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3300

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r185.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3300

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r23.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$24.dst} //  ALU pipe: float; $3304

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.12<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3317

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3308
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3309

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3312
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r14.0<0;1,0>:f   {Compacted,$20.dst} //  ALU pipe: float; $3312

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r76.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3315

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3317

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.13<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3319

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r186.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$30.src}       //  ALU pipe: float; $3319

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r21.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$9.dst} //  ALU pipe: float; $3323

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.14<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3336

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r11.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3327
        math.exp (16|M0)         r11.0<1>:f    r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3328

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3331
        mul (16|M0)              acc0.0<1>:f   r11.0<1;1,0>:f    r13.0<0;1,0>:f   {Compacted,$25.dst} //  ALU pipe: float; $3331
(W)     load.slm.d32x1t.a32 (1|M0)  r11:1       [r245:1]           {F@1,$1} // ex_desc:0x0; desc:0x2108500 // $3341

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r77.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3334

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3336

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.15<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3338

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r187.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$2.src}        //  ALU pipe: float; $3338

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r11.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$1.dst} //  ALU pipe: float; $3342

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.16<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3355

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r27.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3346
        math.exp (16|M0)         r27.0<1>:f    r27.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3347

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3350
        mul (16|M0)              acc0.0<1>:f   r27.0<1;1,0>:f    r12.0<0;1,0>:f   {Compacted,$28.dst} //  ALU pipe: float; $3350

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r78.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3353

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3355

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.17<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3357

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r188.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$10.src}       //  ALU pipe: float; $3357

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r40.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$22.dst} //  ALU pipe: float; $3383

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.18<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3396

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r27.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3387
        math.exp (16|M0)         r27.0<1>:f    r27.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3388

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3391
        mul (16|M0)              acc0.0<1>:f   r27.0<1;1,0>:f    r34.0<0;1,0>:f   {Compacted,$14.dst} //  ALU pipe: float; $3391

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r79.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3394

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3396

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.19<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3398

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r189.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$0.src}        //  ALU pipe: float; $3398

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r38.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$7.dst} //  ALU pipe: float; $3402

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.20<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3415

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r27.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3406
        math.exp (16|M0)         r27.0<1>:f    r27.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3407

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3410
        mul (16|M0)              acc0.0<1>:f   r27.0<1;1,0>:f    r33.0<0;1,0>:f   {Compacted,$18.dst} //  ALU pipe: float; $3410

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r80.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3413

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3415

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.21<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3417

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r190.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3417

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r36.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$13.dst} //  ALU pipe: float; $3421

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.22<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3434

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r27.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3425
        math.exp (16|M0)         r27.0<1>:f    r27.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3426

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3429
        mul (16|M0)              acc0.0<1>:f   r27.0<1;1,0>:f    r32.0<0;1,0>:f   {Compacted,$23.dst} //  ALU pipe: float; $3429

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r81.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3432

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3434

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.23<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3436

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r191.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$13.src}       //  ALU pipe: float; $3436

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r30.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$10.dst} //  ALU pipe: float; $3440

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.24<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3453

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r27.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3444
        math.exp (16|M0)         r27.0<1>:f    r27.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3445

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3448
        mul (16|M0)              acc0.0<1>:f   r27.0<1;1,0>:f    r31.0<0;1,0>:f   {Compacted,$12.dst} //  ALU pipe: float; $3448

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r27:1       [r4:1]             {F@1,$19} // ex_desc:0x0; desc:0x2108580 // $3472

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r82.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3451

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     add (1|M0)               r4.0<1>:q     r1.1<0;1,0>:q     r4.3<0;1,0>:q    {Compacted,$19.src} //  ALU pipe: int; $3476

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3453

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.25<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3455

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 257:  b[(chunk_start_offset + m_idx) +
(W)     load.ugm.d32x1t.a64 (1|M0)  r35:1       [r4:1]             {I@2,$4} // ex_desc:0x0; desc:0x2108580 // $3477

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,$4.src}     // $3483
(W)     load.slm.d32x1t.a32 (1|M0)  r4:1        [r237:1]           {$29} // ex_desc:0x0; desc:0x2108500 // $3483

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r2:1             {$28} // ex_desc:0x0; desc:0x40E0584 // $4144

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r192.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$7.src}        //  ALU pipe: float; $3455

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r41.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$17.dst} //  ALU pipe: float; $3484

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.26<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3497

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3488

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$29} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4149

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3489

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$29.src}    // $4149
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$30.src}            //  ALU pipe: int; $4149

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3492
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r29.0<0;1,0>:f   {Compacted,$21.dst} //  ALU pipe: float; $3492

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r83.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3495

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3497

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.27<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3499

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r193.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$22.src}       //  ALU pipe: float; $3499

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r39.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$3.dst} //  ALU pipe: float; $3502

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.28<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3515

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3506
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3507

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3510
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r28.0<0;1,0>:f   {Compacted,$6.dst} //  ALU pipe: float; $3510

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r84.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3513

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3515

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.29<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3517

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r194.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3517

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r37.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted,$11.dst} //  ALU pipe: float; $3520

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.30<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3533

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3524
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3525

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3528
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r27.0<0;1,0>:f   {Compacted,$19.dst} //  ALU pipe: float; $3528

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r85.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3531

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3533

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r240.31<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3535

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r195.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3535

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r4.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3538

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.27<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3551

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r10.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3542
        math.exp (16|M0)         r10.0<1>:f    r10.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3543

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        sync.nop                             null                             {Compacted,M@1}        // $3546
        mul (16|M0)              acc0.0<1>:f   r10.0<1;1,0>:f    r35.0<0;1,0>:f   {Compacted,$4.dst} //  ALU pipe: float; $3546
        load.slm.d32.a32 (16|M0)  r10:1         [r233:1]           {F@1,$16} // ex_desc:0x0; desc:0x2100500 // $3556

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r86.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3549

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3551

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.26<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3553

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r196.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3553

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted,$16.dst} //  ALU pipe: float; $3559

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.23<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3572

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3563
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3564

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.0<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3567

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r87.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3570

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3572

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.24<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3574

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r197.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3574

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.1<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3577

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.25<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3590

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3581
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3582

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.1<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3585

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r88.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3588

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3590

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.21<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3592

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r198.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3592

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.2<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3595

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.22<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3608

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3599
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3600

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.2<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3603

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r89.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3606

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3608

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.19<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3610

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r199.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3610

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.3<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3613

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.20<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3626

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3617
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3618

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.3<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3621

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r90.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3624

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3626

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.17<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3628

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r200.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3628

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.4<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3631

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.18<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3644

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3635
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3636

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.4<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3639

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r91.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3642

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3644

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.15<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3646

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r201.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$18.src}       //  ALU pipe: float; $3646

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.5<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3649

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.16<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3662

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3653
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3654

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.5<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3657

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r92.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3660

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3662

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.13<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3664

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r202.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$1.src}        //  ALU pipe: float; $3664

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.6<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3667

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.14<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3680

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r42.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3671
        math.exp (16|M0)         r42.0<1>:f    r42.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $3672

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r42.0<1;1,0>:f    r7.6<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3675

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r93.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3678

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3680

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.11<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3682

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r203.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3682

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r3.7<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3685

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.12<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3698

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3689
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3690

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r7.7<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3693

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r94.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3696

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3698

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.7<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3700

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r204.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$19.src}       //  ALU pipe: float; $3700

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3703

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.8<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3716

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3707
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3708

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.0<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3711

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r95.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3714

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3716

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.9<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3718

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r205.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3718

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.1<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3721

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.10<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3734

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3725
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3726

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.1<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3729

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r96.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3732

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3734

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.5<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3736

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r206.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3736

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.2<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3739

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.6<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3752

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3743
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3744

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.2<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3747

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r97.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3750

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3752

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.3<0;1,0>:uw                 {F@1}                //  ALU pipe: int; $3754

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r207.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3754

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.3<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3757

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.4<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3770

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3761
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3762

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.3<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3765

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r98.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3768

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3770

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.31<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3772

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r208.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3772

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.4<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3775

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r238.2<0;1,0>:uw                 {F@2}                //  ALU pipe: int; $3788

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3779
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3780

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.4<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3783

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r99.0<1;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3786

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3788

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.29<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3790

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r209.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$25.src}       //  ALU pipe: float; $3790

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.5<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3793

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.30<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3806

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3797
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3798

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.5<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3801

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r100.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3804

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3806

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.27<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3808

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r210.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3808

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.6<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3811

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.28<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3824

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3815
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3816

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.6<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3819

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r101.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3822

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3824

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.25<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3826

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r211.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3826

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r8.7<0;1,0>:f     -r10.0<1;1,0>:f                     //  ALU pipe: float; $3829

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.26<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3842

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3833
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3834

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r9.7<0;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $3837

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r102.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3840

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3842

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.18<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3844

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r212.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3844

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r26.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3847 R{} IR{}{E:5,E:5,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.19<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3860

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3851
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3852

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r20.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3855

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r103.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3858

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3860

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.22<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3862

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r213.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3862

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r24.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3865

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.23<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3878

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3869
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3870

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r19.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3873 R{} IR{}{O:1,O:1,},  {BC=1}

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r104.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3876

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3878

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.24<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3880

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r214.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3880

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r22.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3883

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.25<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3887
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3888

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r18.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3891

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r105.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3894

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.26<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3898

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r215.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3898

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r16.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3901

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.27<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3914

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3905
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3906

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r17.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3909

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r106.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3912

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3914

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.28<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3916

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r216.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3916

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r25.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3919

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.29<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3932

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3923
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3924

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r15.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3927

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r107.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3930

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3932

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.30<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3934

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r217.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3934

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r23.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3937

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r236.31<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3950

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3941
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3942

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r14.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3945

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r108.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3948

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3950

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.10<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3952

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r218.0<1>:f   acc0.0<1;1,0>:f   0x0:f               {$20.src}       //  ALU pipe: float; $3952

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r21.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3955

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.11<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3968

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3959
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3960

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r13.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3963

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r109.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3966

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3968

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.12<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3970

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r219.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3970

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r11.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3973

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.13<0;1,0>:uw                {F@2}                //  ALU pipe: int; $3986

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3977
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3978

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r12.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3981

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r110.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3984

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $3986

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.14<0;1,0>:uw                {F@1}                //  ALU pipe: int; $3988

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r220.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $3988

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r40.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $3991

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.15<0;1,0>:uw                {F@2}                //  ALU pipe: int; $4004

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $3995
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $3996

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r34.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $3999

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r111.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4002

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4004

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.16<0;1,0>:uw                {F@1}                //  ALU pipe: int; $4006

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r221.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4006

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r38.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4009

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.17<0;1,0>:uw                {F@2}                //  ALU pipe: int; $4022

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4013
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4014

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r33.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4017

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r112.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4020

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4022

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.18<0;1,0>:uw                {F@1}                //  ALU pipe: int; $4024

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r222.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4024

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r36.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4027

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.19<0;1,0>:uw                {F@2}                //  ALU pipe: int; $4040

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4031
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4032

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r32.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4035

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r113.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4038

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4040

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.20<0;1,0>:uw                {F@1}                //  ALU pipe: int; $4042

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r223.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4042

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r30.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4045

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.21<0;1,0>:uw                {F@2}                //  ALU pipe: int; $4058

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4049
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4050

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r31.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4053

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r114.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4056

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4058

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.22<0;1,0>:uw                {F@1}                //  ALU pipe: int; $4060

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r224.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4060

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r41.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4063

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.23<0;1,0>:uw                {F@2}                //  ALU pipe: int; $4076

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4067
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4068

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r29.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4071

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r115.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4074

// Line 263:  if (m_idx == n_idx) {
(~f3.1) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4076

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (1|M0)               f3.1<1>:uw    r237.24<0;1,0>:uw                {F@1}                //  ALU pipe: int; $4078

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 266:  if (m_idx < n_idx) {
(~f3.1) sel (16|M0)              r228.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4078

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r39.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4081

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4149

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4085
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4086

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r28.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4089

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r116.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4092

// Line 263:  if (m_idx == n_idx) {
(~f3.0) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4094

// Line 266:  if (m_idx < n_idx) {
(~f2.1) sel (16|M0)              r229.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4096

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r37.0<0;1,0>:f    -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4099

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4103
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4104

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r27.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4107

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4147

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r117.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4110

// Line 263:  if (m_idx == n_idx) {
(~f2.0) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4112

// Line 266:  if (m_idx < n_idx) {
(~f1.1) sel (16|M0)              r230.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4114

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        add (16|M0)              acc0.0<1>:f   r4.0<0;1,0>:f     -r10.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4117

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/native_math_functions.inc

// Line 35:  BUILTIN_NATIVE(ONE_ARG, exp)
        mul (16|M0)              r3.0<1>:f     acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $4121
        math.exp (16|M0)         r3.0<1>:f     r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: math; $4122

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 261:  sycl::native::exp(g_slm_ptr[(m_idx)] - g_slm_ptr[n_idx]) *
        mul (16|M0)              acc0.0<1>:f   r3.0<1;1,0>:f     r35.0<0;1,0>:f   {Compacted,M@1}    //  ALU pipe: float; $4125 R{} IR{}{O:1,O:1,},  {BC=1}

// Line 260:  tSrA_c(sn * SG_M + sm) *=
        mul (16|M0)              acc0.0<1>:f   r118.0<1;1,0>:f   acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $4128

// Line 263:  if (m_idx == n_idx) {
(~f1.0) sel (16|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $4130

// Line 266:  if (m_idx < n_idx) {
(~f0.1) sel (16|M0)              r231.0<1>:f   acc0.0<1;1,0>:f   0x0:f                               //  ALU pipe: float; $4132

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.allrd                           null                             {A@1}                  // $4149
        sync.allwr                           null                                                    // $4149
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4149
// B035: [FCALL],  Preds:{B034},  Succs:{B036}
_L_k0_0_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4149
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4149
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4149
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $4150
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                                      //  ALU pipe: int; $4150
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $4150
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4150
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4172
        mov (16|M0)              r168.0<1>:hf  r26.0<1;1,0>:hf                  {I@7}                //  ALU pipe: float; $4150

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$11} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4149
        sync.nop                             null                             {Compacted,$11.dst}    // $4149
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4149

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$15.dst}    // $4168
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r133:1           {$9} // ex_desc:0x0; desc:0x40E0584 // $4168

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4171
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4173
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4173
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4173
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4173

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$11} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4173
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4173

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$15.src}    // $4173
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$11.src}            //  ALU pipe: int; $4173
        sync.allrd                           null                             {A@1}                  // $4173
        sync.allwr                           null                                                    // $4173
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4173
// B036: [FCALL],  Preds:{B035},  Succs:{B037}
_L_k0_1_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4173
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4173
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4173
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4174
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4174
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4174
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4174
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4196
        mov (16|M0)              r168.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4174

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$26} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4173
        sync.nop                             null                             {Compacted,$26.dst}    // $4173
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4173

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$22.dst}    // $4192
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r124:1           {$7} // ex_desc:0x0; desc:0x40E0584 // $4192

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4195
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4197
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4197
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4197
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4197

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$26} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4197
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$22} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4197

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$22.src}    // $4197
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $4197
        sync.allrd                           null                             {A@1}                  // $4197
        sync.allwr                           null                                                    // $4197
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4197
// B037: [FCALL],  Preds:{B036},  Succs:{B038}
_L_k0_2_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4197
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4197
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4197
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4198
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4198
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4198
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4198
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4220
        mov (16|M0)              r169.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4198

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$13} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4197
        sync.nop                             null                             {Compacted,$13.dst}    // $4197
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4197

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$0.dst}     // $4216
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r125:1           {$24} // ex_desc:0x0; desc:0x40E0584 // $4216

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4219
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4221
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4221
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4221
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4221

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$13} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4221
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4221

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$0.src}     // $4221
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$13.src}            //  ALU pipe: int; $4221
        sync.allrd                           null                             {A@1}                  // $4221
        sync.allwr                           null                                                    // $4221
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4221
// B038: [FCALL],  Preds:{B037},  Succs:{B039}
_L_k0_3_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4221
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4221
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4221
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4222
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4222
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4222
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4222
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4244
        mov (16|M0)              r169.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4222

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$1} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4221
        sync.nop                             null                             {Compacted,$1.dst}     // $4221
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$19} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4221

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$19.dst}    // $4240
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r126:1           {$27} // ex_desc:0x0; desc:0x40E0584 // $4240

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4243
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4245
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4245
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4245
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4245

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$1} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4245
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$19} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4245

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$19.src}    // $4245
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$1.src}             //  ALU pipe: int; $4245
        sync.allrd                           null                             {A@1}                  // $4245
        sync.allwr                           null                                                    // $4245
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4245
// B039: [FCALL],  Preds:{B038},  Succs:{B040}
_L_k0_4_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4245
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4245
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4245
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4246
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4246
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4246
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4246
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4268
        mov (16|M0)              r170.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4246

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$28} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4245
        sync.nop                             null                             {Compacted,$28.dst}    // $4245
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$10} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4245

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$10.dst}    // $4264
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r127:1           {$31} // ex_desc:0x0; desc:0x40E0584 // $4264

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4267
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4269
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4269
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4269
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4269

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$28} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4269
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$10} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4269

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$10.src}    // $4269
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$28.src}            //  ALU pipe: int; $4269
        sync.allrd                           null                             {A@1}                  // $4269
        sync.allwr                           null                                                    // $4269
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4269
// B040: [FCALL],  Preds:{B039},  Succs:{B041}
_L_k0_5_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4269
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4269
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4269
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4270
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4270
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4270
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4270
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4292
        mov (16|M0)              r170.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4270

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$2} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4269
        sync.nop                             null                             {Compacted,$2.dst}     // $4269
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$30} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4269

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$30.dst}    // $4288
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r128:1           {$8} // ex_desc:0x0; desc:0x40E0584 // $4288

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4291
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4293
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4293
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4293
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4293

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$2} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4293
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$30} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4293

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$30.src}    // $4293
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$2.src}             //  ALU pipe: int; $4293
        sync.allrd                           null                             {A@1}                  // $4293
        sync.allwr                           null                                                    // $4293
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4293
// B041: [FCALL],  Preds:{B040},  Succs:{B042}
_L_k0_6_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4293
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4293
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4293
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4294
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4294
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4294
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4294
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4316
        mov (16|M0)              r171.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4294

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$5} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4293
        sync.nop                             null                             {Compacted,$5.dst}     // $4293
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$6} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4293

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$6.dst}     // $4312
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r129:1           {$16} // ex_desc:0x0; desc:0x40E0584 // $4312

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4315
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4317
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4317
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4317
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4317

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$5} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4317
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$6} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4317

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$6.src}     // $4317
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$5.src}             //  ALU pipe: int; $4317
        sync.allrd                           null                             {A@1}                  // $4317
        sync.allwr                           null                                                    // $4317
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4317
// B042: [FCALL],  Preds:{B041},  Succs:{B043}
_L_k0_7_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4317
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4317
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4317
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4318
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4318
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4318
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4318
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4340
        mov (16|M0)              r171.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4318

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$21} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4317
        sync.nop                             null                             {Compacted,$21.dst}    // $4317
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4317

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$12.dst}    // $4336
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r130:1           {$29} // ex_desc:0x0; desc:0x40E0584 // $4336

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4339
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4341
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4341
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4341
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4341

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$21} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4341
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4341

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$12.src}    // $4341
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$21.src}            //  ALU pipe: int; $4341
        sync.allrd                           null                             {A@1}                  // $4341
        sync.allwr                           null                                                    // $4341
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4341
// B043: [FCALL],  Preds:{B042},  Succs:{B044}
_L_k0_8_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4341
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4341
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4341
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4342
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4342
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4342
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4342
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4364
        mov (16|M0)              r164.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4342

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$9} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4341
        sync.nop                             null                             {Compacted,$9.dst}     // $4341
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$11} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4341

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$11.dst}    // $4360
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r131:1           {$4} // ex_desc:0x0; desc:0x40E0584 // $4360

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4363
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4365
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4365
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4365
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4365

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$9} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4365
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$11} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4365

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$11.src}    // $4365
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$9.src}             //  ALU pipe: int; $4365
        sync.allrd                           null                             {A@1}                  // $4365
        sync.allwr                           null                                                    // $4365
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4365
// B044: [FCALL],  Preds:{B043},  Succs:{B045}
_L_k0_9_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4365
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4365
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4365
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4366
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4366
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4366
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4366
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4388
        mov (16|M0)              r164.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4366

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$15} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4365
        sync.nop                             null                             {Compacted,$15.dst}    // $4365
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$7} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4365

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$7.dst}     // $4384
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r132:1           {$17} // ex_desc:0x0; desc:0x40E0584 // $4384

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4387
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4389
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4389
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4389
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4389

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$15} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4389
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$7} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4389

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$7.src}     // $4389
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$15.src}            //  ALU pipe: int; $4389
        sync.allrd                           null                             {A@1}                  // $4389
        sync.allwr                           null                                                    // $4389
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4389
// B045: [FCALL],  Preds:{B044},  Succs:{B046}
_L_k0_10_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4389
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4389
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4389
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4390
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4390
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4390
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4390
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4412
        mov (16|M0)              r165.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4390

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$26} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4389
        sync.nop                             null                             {Compacted,$26.dst}    // $4389
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4389

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$22.dst}    // $4408
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r134:1           {$3} // ex_desc:0x0; desc:0x40E0584 // $4408

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4411
(W)     mov (1|M0)               r180.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4413
(W)     mov (1|M0)               r180.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4413
(W)     mov (1|M0)               r180.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4413
(W)     mov (1|M0)               r180.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4413

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$26} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4413
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$22} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4413

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$22.src}    // $4413
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $4413
        sync.allrd                           null                             {A@1}                  // $4413
        sync.allwr                           null                                                    // $4413
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4413
// B046: [FCALL],  Preds:{B045},  Succs:{B047}
_L_k0_11_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4413
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4413
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4413
(W)     mov (1|M0)               f0.0<1>:ud    r180.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4414
(W)     mov (1|M0)               f1.0<1>:ud    r180.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4414
(W)     mov (1|M0)               f2.0<1>:ud    r180.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4414
(W)     mov (1|M0)               f3.0<1>:ud    r180.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4414
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4436
        mov (16|M0)              r165.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4414

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$24} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4413
        sync.nop                             null                             {Compacted,$24.dst}    // $4413
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$13} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4413

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$13.dst}    // $4432
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r176:1           {$20} // ex_desc:0x0; desc:0x40E0584 // $4432

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4435
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4437
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4437
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4437
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4437

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$24} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4437
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$13} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4437

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$13.src}    // $4437
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $4437
        sync.allrd                           null                             {A@1}                  // $4437
        sync.allwr                           null                                                    // $4437
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4437
// B047: [FCALL],  Preds:{B046},  Succs:{B048}
_L_k0_12_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4437
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4437
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4437
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4438
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4438
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4438
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4438
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4460
        mov (16|M0)              r166.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4438

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$0} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4437
        sync.nop                             null                             {Compacted,$0.dst}     // $4437
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$27} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4437

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$27.dst}    // $4456
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r177:1           {$25} // ex_desc:0x0; desc:0x40E0584 // $4456

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4459
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4461
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4461
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4461
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4461

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$0} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4461
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$27} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4461

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$27.src}    // $4461
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $4461
        sync.allrd                           null                             {A@1}                  // $4461
        sync.allwr                           null                                                    // $4461
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4461
// B048: [FCALL],  Preds:{B047},  Succs:{B049}
_L_k0_13_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4461
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4461
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4461
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4462
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4462
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4462
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4462
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4484
        mov (16|M0)              r166.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4462

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$1} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4461
        sync.nop                             null                             {Compacted,$1.dst}     // $4461
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$19} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4461

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$19.dst}    // $4480
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r178:1           {$14} // ex_desc:0x0; desc:0x40E0584 // $4480

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4483
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4485
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4485
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4485
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4485

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$1} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4485
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$19} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4485

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$19.src}    // $4485
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$1.src}             //  ALU pipe: int; $4485
        sync.allrd                           null                             {A@1}                  // $4485
        sync.allwr                           null                                                    // $4485
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4485
// B049: [FCALL],  Preds:{B048},  Succs:{B050}
_L_k0_14_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4485
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4485
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4485
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4486
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4486
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4486
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4486
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4508
        mov (16|M0)              r167.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4486

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$31} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4485
        sync.nop                             null                             {Compacted,$31.dst}    // $4485
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4485

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$28.dst}    // $4504
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r179:1           {$18} // ex_desc:0x0; desc:0x40E0584 // $4504

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4507
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4509
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4509
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4509
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4509

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$31} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4509
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4509

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$28.src}    // $4509
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$31.src}            //  ALU pipe: int; $4509
        sync.allrd                           null                             {A@1}                  // $4509
        sync.allwr                           null                                                    // $4509
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4509
// B050: [FCALL],  Preds:{B049},  Succs:{B051}
_L_k0_15_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4509
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4509
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4509
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4510
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4510
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4510
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4510
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4532
        mov (16|M0)              r167.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4510

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$8} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4509
        sync.nop                             null                             {Compacted,$8.dst}     // $4509
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$16} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4509

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$16.dst}    // $4528
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r181:1           {$23} // ex_desc:0x0; desc:0x40E0584 // $4528

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4531
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4533
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4533
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4533
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4533

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$8} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4533
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$16} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4533

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$16.src}    // $4533
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$8.src}             //  ALU pipe: int; $4533
        sync.allrd                           null                             {A@1}                  // $4533
        sync.allwr                           null                                                    // $4533
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4533
// B051: [FCALL],  Preds:{B050},  Succs:{B052}
_L_k0_16_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4533
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4533
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4533
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4534
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4534
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4534
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4534
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4556
        mov (16|M0)              r160.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4534

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$29} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4533
        sync.nop                             null                             {Compacted,$29.dst}    // $4533
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$4} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4533

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$4.dst}     // $4552
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r182:1           {$12} // ex_desc:0x0; desc:0x40E0584 // $4552

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4555
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4557
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4557
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4557
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4557

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$29} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4557
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4557

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$4.src}     // $4557
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$29.src}            //  ALU pipe: int; $4557
        sync.allrd                           null                             {A@1}                  // $4557
        sync.allwr                           null                                                    // $4557
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4557
// B052: [FCALL],  Preds:{B051},  Succs:{B053}
_L_k0_17_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4557
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4557
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4557
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4558
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4558
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4558
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4558
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4580
        mov (16|M0)              r160.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4558

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$9} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4557
        sync.nop                             null                             {Compacted,$9.dst}     // $4557
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$11} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4557

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$11.dst}    // $4576
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r183:1           {$21} // ex_desc:0x0; desc:0x40E0584 // $4576

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4579
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4581
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4581
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4581
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4581

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$9} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4581
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$11} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4581

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$11.src}    // $4581
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$9.src}             //  ALU pipe: int; $4581
        sync.allrd                           null                             {A@1}                  // $4581
        sync.allwr                           null                                                    // $4581
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4581
// B053: [FCALL],  Preds:{B052},  Succs:{B054}
_L_k0_18_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4581
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4581
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4581
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4582
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4582
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4582
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4582
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4604
        mov (16|M0)              r161.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4582

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$17} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4581
        sync.nop                             null                             {Compacted,$17.dst}    // $4581
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4581

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$15.dst}    // $4600
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r184:1           {$6} // ex_desc:0x0; desc:0x40E0584 // $4600

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4603
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4605
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4605
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4605
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4605

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$17} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4605
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4605

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$15.src}    // $4605
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$17.src}            //  ALU pipe: int; $4605
        sync.allrd                           null                             {A@1}                  // $4605
        sync.allwr                           null                                                    // $4605
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4605
// B054: [FCALL],  Preds:{B053},  Succs:{B055}
_L_k0_19_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4605
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4605
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4605
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4606
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4606
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4606
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4606
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4628
        mov (16|M0)              r161.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4606

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$3} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4605
        sync.nop                             null                             {Compacted,$3.dst}     // $4605
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4605

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$26.dst}    // $4624
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r185:1           {$5} // ex_desc:0x0; desc:0x40E0584 // $4624

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4627
(W)     mov (1|M0)               r235.6<1>:ud  f0.0<0;1,0>:ud                                        //  ALU pipe: int; $4629
(W)     mov (1|M0)               r235.7<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $4629
(W)     mov (1|M0)               r235.8<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4629
(W)     mov (1|M0)               r235.9<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4629

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$3} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4629
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4629

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$26.src}    // $4629
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$3.src}             //  ALU pipe: int; $4629
        sync.allrd                           null                             {A@1}                  // $4629
        sync.allwr                           null                                                    // $4629
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4629
// B055: [FCALL],  Preds:{B054},  Succs:{B056}
_L_k0_20_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4629
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4629
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4629
(W)     mov (1|M0)               f0.0<1>:ud    r235.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4630
(W)     mov (1|M0)               f1.0<1>:ud    r235.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $4630
(W)     mov (1|M0)               f2.0<1>:ud    r235.8<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4630
(W)     mov (1|M0)               f3.0<1>:ud    r235.9<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4630
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4652
        mov (16|M0)              r162.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4630

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$20} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4629
        sync.nop                             null                             {Compacted,$20.dst}    // $4629
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$25} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4629

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$25.dst}    // $4648
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r186:1           {$30} // ex_desc:0x0; desc:0x40E0584 // $4648

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4651
(W)     mov (1|M0)               r124.0<1>:ud  f0.0<0;1,0>:ud                   {Compacted,$7.src}   //  ALU pipe: int; $4653
(W)     mov (1|M0)               r124.1<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4653
(W)     mov (1|M0)               r124.2<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4653
(W)     mov (1|M0)               r124.3<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $4653

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$20} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4653
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$25} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4653

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$25.src}    // $4653
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$20.src}            //  ALU pipe: int; $4653
        sync.allrd                           null                             {A@1}                  // $4653
        sync.allwr                           null                                                    // $4653
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4653
// B056: [FCALL],  Preds:{B055},  Succs:{B057}
_L_k0_21_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4653
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4653
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4653
(W)     mov (1|M0)               f0.0<1>:ud    r124.0<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4654
(W)     mov (1|M0)               f1.0<1>:ud    r124.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4654
(W)     mov (1|M0)               f2.0<1>:ud    r124.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4654
(W)     mov (1|M0)               f3.0<1>:ud    r124.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4654
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4676
        mov (16|M0)              r162.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4654

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$14} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4653
        sync.nop                             null                             {Compacted,$14.dst}    // $4653
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$1} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4653

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$1.dst}     // $4672
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r187:1           {$2} // ex_desc:0x0; desc:0x40E0584 // $4672

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4675
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4677
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4677
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4677
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4677

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$14} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4677
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$1} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4677

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$1.src}     // $4677
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$14.src}            //  ALU pipe: int; $4677
        sync.allrd                           null                             {A@1}                  // $4677
        sync.allwr                           null                                                    // $4677
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4677
// B057: [FCALL],  Preds:{B056},  Succs:{B058}
_L_k0_22_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4677
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4677
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4677
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4678
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4678
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4678
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4678
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4700
        mov (16|M0)              r163.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4678

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$19} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4677
        sync.nop                             null                             {Compacted,$19.dst}    // $4677
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4677

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$18.dst}    // $4696
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r188:1           {$10} // ex_desc:0x0; desc:0x40E0584 // $4696

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4699
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4701
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4701
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4701
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4701

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$19} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4701
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4701

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$18.src}    // $4701
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$19.src}            //  ALU pipe: int; $4701
        sync.allrd                           null                             {A@1}                  // $4701
        sync.allwr                           null                                                    // $4701
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4701
// B058: [FCALL],  Preds:{B057},  Succs:{B059}
_L_k0_23_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4701
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4701
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4701
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4702
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4702
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4702
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4702
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4724
        mov (16|M0)              r163.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4702

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$31} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4701
        sync.nop                             null                             {Compacted,$31.dst}    // $4701
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4701

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$28.dst}    // $4720
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r189:1           {$0} // ex_desc:0x0; desc:0x40E0584 // $4720

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4723
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4725
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4725
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4725
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4725

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$31} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4725
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4725

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$28.src}    // $4725
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$31.src}            //  ALU pipe: int; $4725
        sync.allrd                           null                             {A@1}                  // $4725
        sync.allwr                           null                                                    // $4725
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4725
// B059: [FCALL],  Preds:{B058},  Succs:{B060}
_L_k0_24_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4725
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4725
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4725
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4726
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4726
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4726
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4726
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4748
        mov (16|M0)              r156.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4726

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$23} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4725
        sync.nop                             null                             {Compacted,$23.dst}    // $4725
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4725

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$12.dst}    // $4744
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r190:1           {$24} // ex_desc:0x0; desc:0x40E0584 // $4744

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4747
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4749
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4749
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4749
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4749

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$23} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4749
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4749

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$12.src}    // $4749
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$23.src}            //  ALU pipe: int; $4749
        sync.allrd                           null                             {A@1}                  // $4749
        sync.allwr                           null                                                    // $4749
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4749
// B060: [FCALL],  Preds:{B059},  Succs:{B061}
_L_k0_25_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4749
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4749
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4749
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4750
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4750
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4750
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4750
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4772
        mov (16|M0)              r156.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4750

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$29} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4749
        sync.nop                             null                             {Compacted,$29.dst}    // $4749
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$4} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4749

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$4.dst}     // $4768
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r191:1           {$13} // ex_desc:0x0; desc:0x40E0584 // $4768

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4771
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4773
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4773
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4773
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4773

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$29} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4773
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4773

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$4.src}     // $4773
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$29.src}            //  ALU pipe: int; $4773
        sync.allrd                           null                             {A@1}                  // $4773
        sync.allwr                           null                                                    // $4773
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4773
// B061: [FCALL],  Preds:{B060},  Succs:{B062}
_L_k0_26_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4773
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4773
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4773
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4774
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4774
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4774
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4774
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4796
        mov (16|M0)              r157.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4774

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$21} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4773
        sync.nop                             null                             {Compacted,$21.dst}    // $4773
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$9} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4773

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$9.dst}     // $4792
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r192:1           {$7} // ex_desc:0x0; desc:0x40E0584 // $4792

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4795
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4797
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4797
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4797
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4797

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$21} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4797
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$9} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4797

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$9.src}     // $4797
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$21.src}            //  ALU pipe: int; $4797
        sync.allrd                           null                             {A@1}                  // $4797
        sync.allwr                           null                                                    // $4797
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4797
// B062: [FCALL],  Preds:{B061},  Succs:{B063}
_L_k0_27_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4797
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4797
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4797
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4798
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4798
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4798
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4798
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4820
        mov (16|M0)              r157.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4798

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$6} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4797
        sync.nop                             null                             {Compacted,$6.dst}     // $4797
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$17} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4797

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$17.dst}    // $4816
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r193:1           {$22} // ex_desc:0x0; desc:0x40E0584 // $4816

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4819
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4821
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4821
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4821
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4821

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$6} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4821
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$17} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4821

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$17.src}    // $4821
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$6.src}             //  ALU pipe: int; $4821
        sync.allrd                           null                             {A@1}                  // $4821
        sync.allwr                           null                                                    // $4821
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4821
// B063: [FCALL],  Preds:{B062},  Succs:{B064}
_L_k0_28_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4821
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4821
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4821
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4822
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4822
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4822
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4822
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4844
        mov (16|M0)              r158.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4822

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$5} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4821
        sync.nop                             null                             {Compacted,$5.dst}     // $4821
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$3} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4821

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$3.dst}     // $4840
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r194:1           {$27} // ex_desc:0x0; desc:0x40E0584 // $4840

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4843
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4845
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4845
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4845
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4845

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$5} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4845
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$3} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4845

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$3.src}     // $4845
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$5.src}             //  ALU pipe: int; $4845
        sync.allrd                           null                             {A@1}                  // $4845
        sync.allwr                           null                                                    // $4845
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4845
// B064: [FCALL],  Preds:{B063},  Succs:{B065}
_L_k0_29_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4845
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4845
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4845
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4846
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4846
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4846
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4846
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4868
        mov (16|M0)              r158.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4846

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$30} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4845
        sync.nop                             null                             {Compacted,$30.dst}    // $4845
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$20} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4845

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$20.dst}    // $4864
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r195:1           {$8} // ex_desc:0x0; desc:0x40E0584 // $4864

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4867
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4869
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4869
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4869
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4869

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$30} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4869
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$20} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4869

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$20.src}    // $4869
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$30.src}            //  ALU pipe: int; $4869
        sync.allrd                           null                             {A@1}                  // $4869
        sync.allwr                           null                                                    // $4869
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4869
// B065: [FCALL],  Preds:{B064},  Succs:{B066}
_L_k0_30_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4869
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4869
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4869
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4870
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4870
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4870
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4870
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4892
        mov (16|M0)              r159.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4870

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$25} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4869
        sync.nop                             null                             {Compacted,$25.dst}    // $4869
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$2} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4869

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$2.dst}     // $4888
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r196:1           {$26} // ex_desc:0x0; desc:0x40E0584 // $4888

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4891
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4893
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4893
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4893
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4893

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$25} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4893
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$2} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4893

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$2.src}     // $4893
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$25.src}            //  ALU pipe: int; $4893
        sync.allrd                           null                             {A@1}                  // $4893
        sync.allwr                           null                                                    // $4893
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4893
// B066: [FCALL],  Preds:{B065},  Succs:{B067}
_L_k0_31_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4893
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4893
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4893
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4894
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4894
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4894
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4894
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4916
        mov (16|M0)              r159.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4894

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$14} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4893
        sync.nop                             null                             {Compacted,$14.dst}    // $4893
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$10} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4893

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$10.dst}    // $4912
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r197:1           {$16} // ex_desc:0x0; desc:0x40E0584 // $4912

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4915
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4917
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4917
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4917
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4917

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$14} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4917
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$10} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4917

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$10.src}    // $4917
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$14.src}            //  ALU pipe: int; $4917
        sync.allrd                           null                             {A@1}                  // $4917
        sync.allwr                           null                                                    // $4917
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4917
// B067: [FCALL],  Preds:{B066},  Succs:{B068}
_L_k0_32_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4917
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4917
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4917
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4918
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4918
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4918
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4918
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4940
        mov (16|M0)              r152.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4918

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$0} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4917
        sync.nop                             null                             {Compacted,$0.dst}     // $4917
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4917

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$28.dst}    // $4936
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r198:1           {$11} // ex_desc:0x0; desc:0x40E0584 // $4936

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4939
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4941
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4941
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4941
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4941

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$0} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4941
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4941

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$28.src}    // $4941
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $4941
        sync.allrd                           null                             {A@1}                  // $4941
        sync.allwr                           null                                                    // $4941
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4941
// B068: [FCALL],  Preds:{B067},  Succs:{B069}
_L_k0_33_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4941
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4941
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4941
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4942
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4942
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4942
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4942
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4964
        mov (16|M0)              r152.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4942

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$24} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4941
        sync.nop                             null                             {Compacted,$24.dst}    // $4941
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$23} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4941

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$23.dst}    // $4960
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r199:1           {$15} // ex_desc:0x0; desc:0x40E0584 // $4960

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $4963
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4965
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4965
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4965
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4965

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$24} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4965
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$23} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4965

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$23.src}    // $4965
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $4965
        sync.allrd                           null                             {A@1}                  // $4965
        sync.allwr                           null                                                    // $4965
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4965
// B069: [FCALL],  Preds:{B068},  Succs:{B070}
_L_k0_34_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4965
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4965
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4965
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4966
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4966
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4966
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4966
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $4988
        mov (16|M0)              r153.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $4966

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$13} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4965
        sync.nop                             null                             {Compacted,$13.dst}    // $4965
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$4} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4965

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$4.dst}     // $4984
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r200:1           {$9} // ex_desc:0x0; desc:0x40E0584 // $4984

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $4987
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4989
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4989
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $4989
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $4989

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$13} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $4989
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $4989

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$4.src}     // $4989
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$13.src}            //  ALU pipe: int; $4989
        sync.allrd                           null                             {A@1}                  // $4989
        sync.allwr                           null                                                    // $4989
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $4989
// B070: [FCALL],  Preds:{B069},  Succs:{B071}
_L_k0_35_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $4989
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $4989
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $4989
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4990
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4990
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4990
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $4990
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5012
        mov (16|M0)              r153.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $4990

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$7} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $4989
        sync.nop                             null                             {Compacted,$7.dst}     // $4989
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$21} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $4989

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$21.dst}    // $5008
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r201:1           {$18} // ex_desc:0x0; desc:0x40E0584 // $5008

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5011
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5013
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5013
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5013
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5013

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$7} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5013
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$21} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5013

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$21.src}    // $5013
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$7.src}             //  ALU pipe: int; $5013
        sync.allrd                           null                             {A@1}                  // $5013
        sync.allwr                           null                                                    // $5013
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5013
// B071: [FCALL],  Preds:{B070},  Succs:{B072}
_L_k0_36_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5013
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5013
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5013
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5014
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5014
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5014
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5014
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5036
        mov (16|M0)              r154.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5014

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$22} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5013
        sync.nop                             null                             {Compacted,$22.dst}    // $5013
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$6} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5013

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$6.dst}     // $5032
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r202:1           {$1} // ex_desc:0x0; desc:0x40E0584 // $5032

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5035
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5037
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5037
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5037
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5037

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$22} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5037
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$6} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5037

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$6.src}     // $5037
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$22.src}            //  ALU pipe: int; $5037
        sync.allrd                           null                             {A@1}                  // $5037
        sync.allwr                           null                                                    // $5037
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5037
// B072: [FCALL],  Preds:{B071},  Succs:{B073}
_L_k0_37_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5037
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5037
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5037
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5038
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5038
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5038
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5038
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5060
        mov (16|M0)              r154.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5038

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$27} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5037
        sync.nop                             null                             {Compacted,$27.dst}    // $5037
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$5} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5037

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$5.dst}     // $5056
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r203:1           {$12} // ex_desc:0x0; desc:0x40E0584 // $5056

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5059
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5061
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5061
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5061
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5061

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$27} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5061
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$5} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5061

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$5.src}     // $5061
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$27.src}            //  ALU pipe: int; $5061
        sync.allrd                           null                             {A@1}                  // $5061
        sync.allwr                           null                                                    // $5061
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5061
// B073: [FCALL],  Preds:{B072},  Succs:{B074}
_L_k0_38_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5061
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5061
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5061
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5062
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5062
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5062
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5062
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5084
        mov (16|M0)              r155.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5062

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$3} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5061
        sync.nop                             null                             {Compacted,$3.dst}     // $5061
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$8} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5061

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$8.dst}     // $5080
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r204:1           {$19} // ex_desc:0x0; desc:0x40E0584 // $5080

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5083
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5085
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5085
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5085
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5085

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$3} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5085
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$8} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5085

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$8.src}     // $5085
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$3.src}             //  ALU pipe: int; $5085
        sync.allrd                           null                             {A@1}                  // $5085
        sync.allwr                           null                                                    // $5085
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5085
// B074: [FCALL],  Preds:{B073},  Succs:{B075}
_L_k0_39_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5085
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5085
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5085
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5086
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5086
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5086
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5086
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5108
        mov (16|M0)              r155.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5086

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$20} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5085
        sync.nop                             null                             {Compacted,$20.dst}    // $5085
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5085

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$26.dst}    // $5104
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r205:1           {$31} // ex_desc:0x0; desc:0x40E0584 // $5104

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5107
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5109
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5109
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5109
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5109

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$20} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5109
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5109

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$26.src}    // $5109
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$20.src}            //  ALU pipe: int; $5109
        sync.allrd                           null                             {A@1}                  // $5109
        sync.allwr                           null                                                    // $5109
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5109
// B075: [FCALL],  Preds:{B074},  Succs:{B076}
_L_k0_40_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5109
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5109
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5109
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5110
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5110
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5110
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5110
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5132
        mov (16|M0)              r148.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5110

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$16} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5109
        sync.nop                             null                             {Compacted,$16.dst}    // $5109
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$14} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5109

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$14.dst}    // $5128
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r206:1           {$28} // ex_desc:0x0; desc:0x40E0584 // $5128

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5131
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5133
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5133
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5133
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5133

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$16} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5133
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$14} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5133

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$14.src}    // $5133
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $5133
        sync.allrd                           null                             {A@1}                  // $5133
        sync.allwr                           null                                                    // $5133
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5133
// B076: [FCALL],  Preds:{B075},  Succs:{B077}
_L_k0_41_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5133
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5133
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5133
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5134
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5134
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5134
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5134
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5156
        mov (16|M0)              r148.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5134

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$11} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5133
        sync.nop                             null                             {Compacted,$11.dst}    // $5133
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5133

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$0.dst}     // $5152
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r207:1           {$29} // ex_desc:0x0; desc:0x40E0584 // $5152

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5155
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5157
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5157
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5157
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5157

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$11} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5157
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5157

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$0.src}     // $5157
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$11.src}            //  ALU pipe: int; $5157
        sync.allrd                           null                             {A@1}                  // $5157
        sync.allwr                           null                                                    // $5157
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5157
// B077: [FCALL],  Preds:{B076},  Succs:{B078}
_L_k0_42_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5157
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5157
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5157
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5158
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5158
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5158
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5158
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5180
        mov (16|M0)              r149.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5158

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$15} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5157
        sync.nop                             null                             {Compacted,$15.dst}    // $5157
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$24} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5157

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$24.dst}    // $5176
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r208:1           {$17} // ex_desc:0x0; desc:0x40E0584 // $5176

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5179
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5181
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5181
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5181
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5181

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$15} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5181
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5181

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$24.src}    // $5181
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$15.src}            //  ALU pipe: int; $5181
        sync.allrd                           null                             {A@1}                  // $5181
        sync.allwr                           null                                                    // $5181
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5181
// B078: [FCALL],  Preds:{B077},  Succs:{B079}
_L_k0_43_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5181
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5181
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5181
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5182
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5182
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5182
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5182
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5204
        mov (16|M0)              r149.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5182

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$9} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5181
        sync.nop                             null                             {Compacted,$9.dst}     // $5181
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$13} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5181

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$13.dst}    // $5200
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r209:1           {$25} // ex_desc:0x0; desc:0x40E0584 // $5200

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5203
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5205
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5205
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5205
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5205

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$9} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5205
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$13} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5205

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$13.src}    // $5205
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$9.src}             //  ALU pipe: int; $5205
        sync.allrd                           null                             {A@1}                  // $5205
        sync.allwr                           null                                                    // $5205
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5205
// B079: [FCALL],  Preds:{B078},  Succs:{B080}
_L_k0_44_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5205
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5205
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5205
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5206
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5206
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5206
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5206
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5228
        mov (16|M0)              r150.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5206

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$4} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5205
        sync.nop                             null                             {Compacted,$4.dst}     // $5205
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5205

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$18.dst}    // $5224
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r210:1           {$23} // ex_desc:0x0; desc:0x40E0584 // $5224

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5227
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5229
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5229
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5229
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5229

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$4} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5229
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5229

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$18.src}    // $5229
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$4.src}             //  ALU pipe: int; $5229
        sync.allrd                           null                             {A@1}                  // $5229
        sync.allwr                           null                                                    // $5229
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5229
// B080: [FCALL],  Preds:{B079},  Succs:{B081}
_L_k0_45_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5229
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5229
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5229
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5230
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5230
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5230
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5230
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5252
        mov (16|M0)              r150.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5230

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$7} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5229
        sync.nop                             null                             {Compacted,$7.dst}     // $5229
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$21} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5229

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$21.dst}    // $5248
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r211:1           {$30} // ex_desc:0x0; desc:0x40E0584 // $5248

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5251
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5253
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5253
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5253
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5253

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$7} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5253
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$21} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5253

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$21.src}    // $5253
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$7.src}             //  ALU pipe: int; $5253
        sync.allrd                           null                             {A@1}                  // $5253
        sync.allwr                           null                                                    // $5253
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5253
// B081: [FCALL],  Preds:{B080},  Succs:{B082}
_L_k0_46_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5253
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5253
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5253
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5254
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5254
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5254
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5254
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5276
        mov (16|M0)              r151.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5254

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$1} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5253
        sync.nop                             null                             {Compacted,$1.dst}     // $5253
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5253

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$22.dst}    // $5272
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r212:1           {$10} // ex_desc:0x0; desc:0x40E0584 // $5272

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5275
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5277
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5277
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5277
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5277

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$1} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5277
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$22} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5277

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$22.src}    // $5277
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$1.src}             //  ALU pipe: int; $5277
        sync.allrd                           null                             {A@1}                  // $5277
        sync.allwr                           null                                                    // $5277
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5277
// B082: [FCALL],  Preds:{B081},  Succs:{B083}
_L_k0_47_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5277
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5277
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5277
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5278
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5278
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5278
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5278
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5300
        mov (16|M0)              r151.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5278

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$12} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5277
        sync.nop                             null                             {Compacted,$12.dst}    // $5277
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$27} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5277

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$27.dst}    // $5296
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r213:1           {$5} // ex_desc:0x0; desc:0x40E0584 // $5296

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5299
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5301
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5301
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5301
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5301

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$12} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5301
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$27} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5301

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$27.src}    // $5301
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$12.src}            //  ALU pipe: int; $5301
        sync.allrd                           null                             {A@1}                  // $5301
        sync.allwr                           null                                                    // $5301
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5301
// B083: [FCALL],  Preds:{B082},  Succs:{B084}
_L_k0_48_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5301
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5301
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5301
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5302
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5302
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5302
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5302
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5324
        mov (16|M0)              r144.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5302

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$19} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5301
        sync.nop                             null                             {Compacted,$19.dst}    // $5301
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$31} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5301

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$31.dst}    // $5320
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r214:1           {$2} // ex_desc:0x0; desc:0x40E0584 // $5320

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5323
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5325
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5325
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5325
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5325

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$19} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5325
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$31} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5325

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$31.src}    // $5325
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$19.src}            //  ALU pipe: int; $5325
        sync.allrd                           null                             {A@1}                  // $5325
        sync.allwr                           null                                                    // $5325
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5325
// B084: [FCALL],  Preds:{B083},  Succs:{B085}
_L_k0_49_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5325
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5325
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5325
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5326
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5326
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5326
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5326
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5348
        mov (16|M0)              r144.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5326

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$26} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5325
        sync.nop                             null                             {Compacted,$26.dst}    // $5325
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5325

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$28.dst}    // $5344
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r215:1           {$14} // ex_desc:0x0; desc:0x40E0584 // $5344

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5347
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5349
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5349
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5349
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5349

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$26} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5349
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5349

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$28.src}    // $5349
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $5349
        sync.allrd                           null                             {A@1}                  // $5349
        sync.allwr                           null                                                    // $5349
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5349
// B085: [FCALL],  Preds:{B084},  Succs:{B086}
_L_k0_50_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5349
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5349
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5349
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5350
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5350
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5350
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5350
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5372
        mov (16|M0)              r145.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5350

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$16} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5349
        sync.nop                             null                             {Compacted,$16.dst}    // $5349
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5349

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$29.dst}    // $5368
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r216:1           {$24} // ex_desc:0x0; desc:0x40E0584 // $5368

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5371
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5373
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5373
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5373
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5373

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$16} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5373
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$29} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5373

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$29.src}    // $5373
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $5373
        sync.allrd                           null                             {A@1}                  // $5373
        sync.allwr                           null                                                    // $5373
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5373
// B086: [FCALL],  Preds:{B085},  Succs:{B087}
_L_k0_51_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5373
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5373
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5373
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5374
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5374
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5374
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5374
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5396
        mov (16|M0)              r145.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5374

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$11} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5373
        sync.nop                             null                             {Compacted,$11.dst}    // $5373
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5373

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$0.dst}     // $5392
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r217:1           {$3} // ex_desc:0x0; desc:0x40E0584 // $5392

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5395
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5397
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5397
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5397
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5397

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$11} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5397
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5397

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$0.src}     // $5397
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$11.src}            //  ALU pipe: int; $5397
        sync.allrd                           null                             {A@1}                  // $5397
        sync.allwr                           null                                                    // $5397
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5397
// B087: [FCALL],  Preds:{B086},  Succs:{B088}
_L_k0_52_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5397
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5397
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5397
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5398
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5398
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5398
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5398
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5420
        mov (16|M0)              r146.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5398

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$17} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5397
        sync.nop                             null                             {Compacted,$17.dst}    // $5397
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5397

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$15.dst}    // $5416
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r218:1           {$20} // ex_desc:0x0; desc:0x40E0584 // $5416

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5419
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5421
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5421
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5421
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5421

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$17} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5421
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5421

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$15.src}    // $5421
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$17.src}            //  ALU pipe: int; $5421
        sync.allrd                           null                             {A@1}                  // $5421
        sync.allwr                           null                                                    // $5421
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5421
// B088: [FCALL],  Preds:{B087},  Succs:{B089}
_L_k0_53_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5421
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5421
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5421
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5422
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5422
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5422
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5422
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5444
        mov (16|M0)              r146.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5422

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$25} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5421
        sync.nop                             null                             {Compacted,$25.dst}    // $5421
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$9} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5421

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$9.dst}     // $5440
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r219:1           {$4} // ex_desc:0x0; desc:0x40E0584 // $5440

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5443
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5445
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5445
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5445
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5445

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$25} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5445
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$9} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5445

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$9.src}     // $5445
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$25.src}            //  ALU pipe: int; $5445
        sync.allrd                           null                             {A@1}                  // $5445
        sync.allwr                           null                                                    // $5445
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5445
// B089: [FCALL],  Preds:{B088},  Succs:{B090}
_L_k0_54_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5445
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5445
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5445
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5446
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5446
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5446
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5446
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5468
        mov (16|M0)              r147.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5446

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$23} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5445
        sync.nop                             null                             {Compacted,$23.dst}    // $5445
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$30} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5445

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$30.dst}    // $5464
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r220:1           {$6} // ex_desc:0x0; desc:0x40E0584 // $5464

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5467
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5469
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5469
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5469
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5469

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$23} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5469
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$30} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5469

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$30.src}    // $5469
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$23.src}            //  ALU pipe: int; $5469
        sync.allrd                           null                             {A@1}                  // $5469
        sync.allwr                           null                                                    // $5469
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5469
// B090: [FCALL],  Preds:{B089},  Succs:{B091}
_L_k0_55_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5469
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5469
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5469
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5470
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5470
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5470
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5470
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5492
        mov (16|M0)              r147.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5470

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$10} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5469
        sync.nop                             null                             {Compacted,$10.dst}    // $5469
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$1} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5469

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$1.dst}     // $5488
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r221:1           {$8} // ex_desc:0x0; desc:0x40E0584 // $5488

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5491
(W)     mov (1|M0)               r236.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5493
(W)     mov (1|M0)               r236.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5493
(W)     mov (1|M0)               r236.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5493
(W)     mov (1|M0)               r236.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5493

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$10} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5493
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$1} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5493

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$1.src}     // $5493
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$10.src}            //  ALU pipe: int; $5493
        sync.allrd                           null                             {A@1}                  // $5493
        sync.allwr                           null                                                    // $5493
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5493
// B091: [FCALL],  Preds:{B090},  Succs:{B092}
_L_k0_56_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5493
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5493
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5493
(W)     mov (1|M0)               f0.0<1>:ud    r236.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5494
(W)     mov (1|M0)               f1.0<1>:ud    r236.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5494
(W)     mov (1|M0)               f2.0<1>:ud    r236.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5494
(W)     mov (1|M0)               f3.0<1>:ud    r236.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5494
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5516
        mov (16|M0)              r140.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5494

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$5} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5493
        sync.nop                             null                             {Compacted,$5.dst}     // $5493
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5493

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$12.dst}    // $5512
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r222:1           {$27} // ex_desc:0x0; desc:0x40E0584 // $5512

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5515
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5517
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5517
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5517
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5517

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$5} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5517
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5517

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$12.src}    // $5517
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$5.src}             //  ALU pipe: int; $5517
        sync.allrd                           null                             {A@1}                  // $5517
        sync.allwr                           null                                                    // $5517
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5517
// B092: [FCALL],  Preds:{B091},  Succs:{B093}
_L_k0_57_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5517
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5517
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5517
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5518
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5518
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5518
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5518
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5540
        mov (16|M0)              r140.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5518

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$2} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5517
        sync.nop                             null                             {Compacted,$2.dst}     // $5517
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$19} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5517

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$19.dst}    // $5536
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r223:1           {$18} // ex_desc:0x0; desc:0x40E0584 // $5536

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5539
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5541
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5541
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5541
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5541

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$2} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5541
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$19} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5541

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$19.src}    // $5541
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$2.src}             //  ALU pipe: int; $5541
        sync.allrd                           null                             {A@1}                  // $5541
        sync.allwr                           null                                                    // $5541
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5541
// B093: [FCALL],  Preds:{B092},  Succs:{B094}
_L_k0_58_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5541
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5541
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5541
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5542
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5542
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5542
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5542
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5564
        mov (16|M0)              r141.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5542

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$31} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5541
        sync.nop                             null                             {Compacted,$31.dst}    // $5541
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$14} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5541

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$14.dst}    // $5560
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r224:1           {$21} // ex_desc:0x0; desc:0x40E0584 // $5560

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5563
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5565
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5565
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5565
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5565

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$31} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5565
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$14} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5565

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$14.src}    // $5565
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$31.src}            //  ALU pipe: int; $5565
        sync.allrd                           null                             {A@1}                  // $5565
        sync.allwr                           null                                                    // $5565
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5565
// B094: [FCALL],  Preds:{B093},  Succs:{B095}
_L_k0_59_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5565
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5565
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5565
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5566
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5566
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5566
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5566
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5588
        mov (16|M0)              r141.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5566

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$26} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5565
        sync.nop                             null                             {Compacted,$26.dst}    // $5565
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5565

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$28.dst}    // $5584
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r228:1           {$7} // ex_desc:0x0; desc:0x40E0584 // $5584

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5587
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5589
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5589
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5589
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5589

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$26} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5589
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5589

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$28.src}    // $5589
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $5589
        sync.allrd                           null                             {A@1}                  // $5589
        sync.allwr                           null                                                    // $5589
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5589
// B095: [FCALL],  Preds:{B094},  Succs:{B096}
_L_k0_60_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5589
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5589
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5589
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5590
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5590
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5590
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5590
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5612
        mov (16|M0)              r142.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5590

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$24} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5589
        sync.nop                             null                             {Compacted,$24.dst}    // $5589
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5589

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$29.dst}    // $5608
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r229:1           {$0} // ex_desc:0x0; desc:0x40E0584 // $5608

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5611
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5613
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5613
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5613
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5613

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$24} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5613
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$29} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5613

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$29.src}    // $5613
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $5613
        sync.allrd                           null                             {A@1}                  // $5613
        sync.allwr                           null                                                    // $5613
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5613
// B096: [FCALL],  Preds:{B095},  Succs:{B097}
_L_k0_61_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5613
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5613
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5613
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5614
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5614
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5614
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5614
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5636
        mov (16|M0)              r142.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5614

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@7,$3} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5613
        sync.nop                             null                             {Compacted,$3.dst}     // $5613
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$20} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5613

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$20.dst}    // $5632
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r230:1           {$16} // ex_desc:0x0; desc:0x40E0584 // $5632

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $5635
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5637
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5637
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5637
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5637

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$3} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5637
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$20} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5637

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$20.src}    // $5637
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$3.src}             //  ALU pipe: int; $5637
        sync.allrd                           null                             {A@1}                  // $5637
        sync.allwr                           null                                                    // $5637
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5637
// B097: [FCALL],  Preds:{B096},  Succs:{B098}
_L_k0_62_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5637
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5637
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5637
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5638
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5638
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5638
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5638
(W)     mov (1|M0)               r255.0<2>:ud  r135.4<0;1,0>:uq                                      //  ALU pipe: int; $5660
        mov (16|M0)              r143.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $5638

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@6,$17} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5637
        sync.nop                             null                             {Compacted,$17.dst}    // $5637
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5637

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cutlass/bfloat16.h
        sync.nop                             null                             {Compacted,$15.dst}    // $5656
        store.ugm.d32.a64.wb.wb (16|M0)  [r136:2] r231:1           {$13} // ex_desc:0x0; desc:0x40E0584 // $5656

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted,F@1}      //  ALU pipe: int; $5659
(W)     mov (1|M0)               r237.1<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5661
(W)     mov (1|M0)               r237.2<1>:ud  f1.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5661
(W)     mov (1|M0)               r237.3<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $5661
(W)     mov (1|M0)               r237.4<1>:ud  f3.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5661

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r1:1  {$17} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $5661
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0xFFC0] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[1*64] of ?; ; $5661

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$15.src}    // $5661
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$17.src}            //  ALU pipe: int; $5661
        sync.allrd                           null                             {A@1}                  // $5661
        sync.allwr                           null                                                    // $5661
        calla (16|M0)            r255.0        r255.0                           {A@1}                // $5661
// B098: Preds:{B097},  Succs:{B099, B020}
_L_k0_63_:

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r173.0<0;1,0>:d                                       //  ALU pipe: int; $5676

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r175.0<0;1,0>:d                                       //  ALU pipe: int; $5678

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 274:  chunk_id += global_chunk_range;
(W)     add (1|M0)               r135.14<1>:d  r135.14<0;1,0>:d  r236.10<0;1,0>:d                    //  ALU pipe: int; $5778

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $5661
(W)     mov (1|M0)               f3.0<1>:ud    r237.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $5662
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $5661

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r168:4          {I@4,$4} // ex_desc:0x0; desc:0x2000207 // $5682

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r173.0<0;1,0>:d                  {$4.src}             //  ALU pipe: int; $5689

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r227.0<0;1,0>:d                                       //  ALU pipe: int; $5691

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 202:  while (chunk_id < cumsum_chunks) {
(W)     cmp (16|M0)   (lt)f3.1   null<1>:d     r135.14<0;1,0>:d  r180.12<0;1,0>:d                    //  ALU pipe: int; $5781

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $5661
        mov (16|M0)              r143.16<1>:w  r26.0<1;1,0>:w                                        //  ALU pipe: int; $5662

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r164:4          {I@4,$25} // ex_desc:0x0; desc:0x2000207 // $5695

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r173.0<0;1,0>:d                  {$25.src}            //  ALU pipe: int; $5702

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r226.0<0;1,0>:d                                       //  ALU pipe: int; $5704

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r1:1       ss[a0.2][r254:1-0x10000]  {I@4,$11} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $5661
        sync.nop                             null                             {Compacted,$11.dst}    // $5661
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0xFFC0]  {$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[1*64] of ?; ; $5661

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        sync.nop                             null                             {Compacted,$22.dst}    // $5662
(W)     mov (1|M0)               f0.0<1>:ud    r237.1<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $5662
(W)     mov (1|M0)               f1.0<1>:ud    r237.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $5662

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r160:4          {I@3,$9} // ex_desc:0x0; desc:0x2000207 // $5708

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r173.0<0;1,0>:d                  {$9.src}             //  ALU pipe: int; $5715

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r225.0<0;1,0>:d                                       //  ALU pipe: int; $5717

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               f2.0<1>:ud    r237.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $5662

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 202:  while (chunk_id < cumsum_chunks) {
        sync.nop                             null                             {Compacted,$22.src}    // $5782
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$11.src}            //  ALU pipe: int; $5782

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r156:4          {I@3,$6} // ex_desc:0x0; desc:0x2000207 // $5721

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r174.0<0;1,0>:d                  {$6.src}             //  ALU pipe: int; $5728

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r175.0<0;1,0>:d                                       //  ALU pipe: int; $5730

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r152:4          {I@1,$23} // ex_desc:0x0; desc:0x2000207 // $5734

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r174.0<0;1,0>:d                  {$23.src}            //  ALU pipe: int; $5741

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r227.0<0;1,0>:d                                       //  ALU pipe: int; $5743

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r148:4          {I@1,$30} // ex_desc:0x0; desc:0x2000207 // $5747

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r174.0<0;1,0>:d                  {$30.src}            //  ALU pipe: int; $5754

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r226.0<0;1,0>:d                                       //  ALU pipe: int; $5756

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r144:4          {I@1,$8} // ex_desc:0x0; desc:0x2000207 // $5760

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/atom/copy_traits_xe_2d.hpp

// Line 172:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockX(payload, x);
(W)     mov (1|M0)               r135.5<1>:d   r174.0<0;1,0>:d                  {$8.src}             //  ALU pipe: int; $5767

// Line 173:  __builtin_IB_subgroup_setBlock2DAddressPayloadBlockY(payload, y);
(W)     mov (1|M0)               r135.6<1>:d   r225.0<0;1,0>:d                                       //  ALU pipe: int; $5769

// File: /root/project/vllm-xpu-kernels/.deps/cutlass-sycl-src/include/cute/arch/copy_xe_2d.hpp

// Line 170:  asm (
        store_block2d.ugm.d16.a64 (1|M0)  [r135:1] r140:4          {I@1,$12} // ex_desc:0x0; desc:0x2000207 // $5773

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp

// Line 202:  while (chunk_id < cumsum_chunks) {
(W&f3.1) jmpi                                _L_k0_64_preHeader                                      //  ALU pipe: int; $5782
// B099: Preds:{B098, B018},  Succs:{B100, B018}
_0_062:

// Line 189:  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
(W)     cmp (16|M0)   (lt)f3.1   null<1>:d     r180.13<0;1,0>:d  r5.5<0;1,0>:d    {$22.dst}          //  ALU pipe: int; $5786
(W&f3.1) jmpi                                _0_061                                                  //  ALU pipe: int; $5787
// B100: Preds:{B099, B016},  Succs:{}
_0_059:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (16|M0)              r240.0<1>:f   r253.0<1;1,0>:f                  {Compacted}          //  ALU pipe: float; $5791
(W)     send.gtwy (1|M0)         null     r240  null:0  0x0            0x02000010           {EOT,F@1,$13} // wr:1+0, rd:0; end of thread // $5791
L44992:
(W)     mov (16|M0)              null<1>:ud    0xD0DC6067:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0xC049E607:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x10:ud                                               // 


//.BankConflicts: 59
//.ByteRMWs: 3
//


//.numALUInst: 2853
//.accSubDef: 257
//.accSubUse: 257
//.accSubCandidateDef: 257
//.accSubCandidateUse: 257
//
//
//.singlePipeAtOneDistNum: 392
//.allAtOneDistNum: 91
//.syncInstCount: 222
//.tokenReuseCount: 228
//.AfterWriteTokenDepCount: 58
//.AfterReadTokenDepCount: 225
