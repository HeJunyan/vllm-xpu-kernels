//.kernel _ZTSN3gdn20causal_conv1d_kernelIN4sycl3_V13ext6oneapi8bfloat16ELi4ELb0EEE
//.platform XE2
//.thread_config numGRF=256, numAcc=8, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 2541918899 2680717705 -hashmovs1 0 19 "
//.full_options "-emitLocation -enableCoalesceScalarMoves -samplerHeaderWA -enablePreemptionR0Only -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -TotalGRFNum 256 -abortOnSpill 4 -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 100 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -generateDebugInfo -hashmovs 2541918899 2680717705 -hashmovs1 0 19 "
//.instCount 3516
//.RA type	GRAPH_COLORING_FF_RA
//.git-hash 2c5a85aeee1b0ddde5971fcb2e716b2732d974c5
//.spill size 256

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r253.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare %null (10)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (13)  rf=r size=4 type=ud align=2 words (r3.11)
//.declare %local_id_y (14)  rf=r size=4 type=ud align=2 words (r3.12)
//.declare %local_size_x (15)  rf=r size=4 type=ud align=2 words (r3.7)
//.declare %local_size_y (16)  rf=r size=4 type=ud align=2 words (r3.8)
//.declare %group_id_x (17)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (18)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (19)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (20)  rf=r size=4 type=ud align=2 words (r3.9)
//.declare %group_count_y (21)  rf=r size=4 type=ud align=2 words (r3.10)
//.declare %tsc (22)  rf=r size=20 type=ud align=2 words
//.declare %arg (23)  rf=r size=256 type=ud align=32 words (r26.0)
//.declare %retval (24)  rf=r size=128 type=ud align=32 words (r26.0) Output
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
//.declare V0034 (44)  rf=r size=8 type=uq align=4 words (r4.0)
//.declare V0035 (45)  rf=r size=8 type=uq align=4 words (r4.1)
//.declare V0036 (46)  rf=r size=8 type=uq align=4 words (r4.2)
//.declare V0037 (47)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V0038 (48)  rf=r size=8 type=uq align=4 words (r5.0)
//.declare V0039 (49)  rf=r size=8 type=uq align=4 words (r5.1)
//.declare V0040 (50)  rf=r size=8 type=uq align=4 words (r5.2)
//.declare V0041 (51)  rf=r size=8 type=uq align=4 words (r5.3)
//.declare V0042 (52)  rf=r size=8 type=uq align=4 words (r5.4)
//.declare V0043 (53)  rf=r size=8 type=uq align=4 words (r5.5)
//.declare V0044 (54)  rf=r size=8 type=uq align=4 words (r5.6)
//.declare V0045 (55)  rf=r size=4 type=d align=2 words (r6.8)
//.declare V0046 (56)  rf=r size=8 type=uq align=4 words (r5.7)
//.declare V0047 (57)  rf=r size=8 type=uq align=4 words (r6.0)
//.declare V0048 (58)  rf=r size=8 type=uq align=4 words (r6.1)
//.declare V0049 (59)  rf=r size=8 type=uq align=4 words (r6.2)
//.declare V0050 (60)  rf=r size=8 type=uq align=4 words (r6.3)
//.declare V0051 (61)  rf=r size=4 type=d align=2 words (r6.9)
//.declare V0052 (62)  rf=r size=4 type=d align=2 words (r6.10)
//.declare V0053 (63)  rf=r size=4 type=d align=2 words (r6.11)
//.declare V0054 (64)  rf=r size=4 type=d align=2 words (r6.12)
//.declare V0055 (65)  rf=r size=4 type=d align=2 words (r6.13)
//.declare V0056 (66)  rf=r size=4 type=d align=2 words (r6.14)
//.declare V0057 (67)  rf=r size=4 type=d align=2 words (r6.15)
//.declare V0058 (68)  rf=r size=4 type=d align=2 words (r7.0)
//.declare V0059 (69)  rf=r size=4 type=d align=2 words (r7.1)
//.declare V0061 (71)  rf=r size=32 type=d alias=+0 align=32 words (r253.0)
//.declare V0063 (73)  rf=r size=12 type=d align=2 words (r7.4)
//.declare V0064 (74)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0065 (75)  rf=r size=64 type=w align=32 words (r2.0)
//.declare V0066 (76)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V0067 (77)  rf=r size=8 type=uq align=4 words (r7.1)
//.declare V0100 (110)  rf=r size=512 type=f align=32 words (r8.0)
//.declare V0101 (111)  rf=r size=512 type=f align=32 words (r8.0)
//.declare V0102 (112)  rf=r size=256 type=d align=32 words (r12.0)
//.declare V0103 (113)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V0104 (114)  rf=r size=256 type=d align=32 words (r4.0)
//.declare V0106 (116)  rf=r size=768 type=d alias=%arg+0 align=32 words (r26.0)
//.declare V0108 (118)  rf=r size=512 type=d alias=%retval+0 align=32 words (r26.0)
//.declare V0110 (120)  rf=r size=8 type=uq alias=%sp+0 align=32 words (r255.3)
//.declare V0112 (122)  rf=r size=8 type=uq alias=%fp+0 align=32 words (r255.2)
//.declare V0113 (123)  rf=r size=4 type=ud align=2 words (r4.9)
//.declare V0115 (125)  rf=r size=4 type=ud align=2 words (r4.10)
//.declare V0117 (127)  rf=r size=4 type=ud align=2 words (r4.12)
//.declare V0118 (128)  rf=r size=4 type=ud align=2 words (r4.11)
//.declare V0119 (129)  rf=r size=4 type=ud align=32 words (r3.0)
//.declare V0121 (131)  rf=r size=8 type=uq align=32 words (r3.0)
//.declare V0122 (132)  rf=r size=8 type=uq align=32 words (r8.0)
//.declare V0123 (133)  rf=r size=8 type=uq align=4 words (r162.1)
//.declare V0124 (134)  rf=r size=8 type=uq align=4 words (r162.0)
//.declare V0126 (136)  rf=r size=64 type=uw alias=V0065+0 align=32 words (r2.0)
//.declare V0127 (137)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0129 (139)  rf=r size=64 type=uw alias=V0064+0 align=32 words (r1.0)
//.declare V0130 (140)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0131 (141)  rf=r size=4 type=d align=2 words (r4.8)
//.declare V0132 (142)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0133 (143)  rf=r size=128 type=d align=32 words (r142.0)
//.declare P01 (144)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0134 (145)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0135 (146)  rf=r size=128 type=d align=32 words (r148.0)
//.declare V0136 (147)  rf=r size=64 type=uw alias=V0134+0 align=32 words (r1.0)
//.declare V0137 (148)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0138 (149)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0139 (150)  rf=r size=256 type=uq align=32 words (r128.0)
//.declare V0140 (151)  rf=r size=8 type=uq align=4 words (r4.4)
//.declare V0143 (154)  rf=r size=8 type=d alias=V0048+0 align=4 words (r6.2)
//.declare V0144 (155)  rf=r size=8 type=uq align=4 words (r4.4)
//.declare V0147 (158)  rf=r size=8 type=d alias=V0144+0 align=4 words (r4.8)
//.declare P02 (159)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P03 (160)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0148 (161)  rf=r size=4 type=d align=2 words (r4.8)
//.declare V0149 (162)  rf=r size=8 type=q alias=V0048+0 align=4 words (r6.1)
//.declare V0151 (164)  rf=r size=32 type=ud alias=V0061+0 align=16 words (r253.0)
//.declare V0152 (165)  rf=r size=8 type=q align=4 words (r4.5)
//.declare V0153 (166)  rf=r size=8 type=q align=32 words (r2.0)
//.declare V0154 (167)  rf=r size=8 type=uq alias=V0153+0 align=32 words (r2.0)
//.declare V0155 (168)  rf=r size=4 type=d align=32 words (r1.0)
//.declare P04 (169)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0156 (170)  rf=r size=4 type=d align=2 words (r162.10)
//.declare V0157 (171)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0158 (172)  rf=r size=4 type=d align=2 words (r1.3)
//.declare V0159 (173)  rf=r size=4 type=d align=2 words (r1.2)
//.declare V0160 (174)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0161 (175)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0162 (176)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0163 (177)  rf=r size=4 type=d align=2 words (r1.5)
//.declare V0164 (178)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0165 (179)  rf=r size=4 type=ud alias=V0161+0 align=2 words (r1.1)
//.declare V0166 (180)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0167 (181)  rf=r size=4 type=ud alias=V0166+0 align=2 words (r4.9)
//.declare V0168 (182)  rf=r size=4 type=d alias=+0 align=2 words (r7.4)
//.declare V0169 (183)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0170 (184)  rf=r size=4 type=ud alias=V0163+0 align=2 words (r1.5)
//.declare V0171 (185)  rf=r size=4 type=f align=2 words (r1.6)
//.declare V0172 (186)  rf=r size=4 type=f align=2 words (r1.8)
//.declare V0173 (187)  rf=r size=4 type=f align=2 words (r1.6)
//.declare V0174 (188)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0175 (189)  rf=r size=4 type=ud alias=V0174+0 align=2 words (r4.9)
//.declare V0176 (190)  rf=r size=4 type=d alias=+4 align=2 words (r7.5)
//.declare V0177 (191)  rf=r size=4 type=d align=2 words (r1.7)
//.declare V0178 (192)  rf=r size=4 type=ud alias=V0177+0 align=2 words (r1.7)
//.declare V0179 (193)  rf=r size=4 type=f alias=+0 align=2 words (r4.12)
//.declare V0180 (194)  rf=r size=4 type=ud alias=V0168+0 align=2 words (r7.4)
//.declare V0181 (195)  rf=r size=4 type=f alias=+4 align=2 words (r4.13)
//.declare V0182 (196)  rf=r size=4 type=ud alias=V0176+0 align=2 words (r7.5)
//.declare V0183 (197)  rf=r size=4 type=f align=2 words (r1.6)
//.declare V0185 (199)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0187 (201)  rf=r size=4 type=f align=2 words (r4.9)
//.declare V0188 (202)  rf=r size=4 type=f align=2 words (r4.9)
//.declare V0189 (203)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0190 (204)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0191 (205)  rf=r size=4 type=ud alias=V0190+0 align=2 words (r4.9)
//.declare V0192 (206)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0193 (207)  rf=r size=4 type=d align=2 words (r1.6)
//.declare V0194 (208)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0195 (209)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0196 (210)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0197 (211)  rf=r size=4 type=ud alias=V0195+0 align=2 words (r4.9)
//.declare V0198 (212)  rf=r size=4 type=ud alias=V0196+0 align=2 words (r4.9)
//.declare  (213)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0199 (214)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0200 (215)  rf=r size=4 type=d align=2 words (r162.12)
//.declare V0201 (216)  rf=r size=4 type=d align=2 words (r4.9)
//.declare V0202 (217)  rf=r size=4 type=d align=2 words (r4.12)
//.declare P05 (218)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0203 (219)  rf=r size=128 type=d align=32 words (r140.0)
//.declare V0204 (220)  rf=r size=4 type=d align=2 words (r4.13)
//.declare V0205 (221)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0206 (222)  rf=r size=128 type=ud alias=V0133+0 align=32 words (r142.0)
//.declare V0207 (223)  rf=r size=128 type=ud alias=V0205+0 align=32 words (r14.0)
//.declare V0208 (224)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0209 (225)  rf=r size=4 type=d align=2 words (r4.11)
//.declare V0210 (226)  rf=r size=4 type=f align=2 words (r4.14)
//.declare V0211 (227)  rf=r size=4 type=ud alias=V0209+0 align=2 words (r4.11)
//.declare V0212 (228)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0213 (229)  rf=r size=4 type=ud alias=V0212+0 align=2 words (r4.10)
//.declare V0214 (230)  rf=r size=4 type=d align=2 words (r6.15)
//.declare V0215 (231)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V0216 (232)  rf=r size=4 type=f align=2 words (r4.15)
//.declare V0217 (233)  rf=r size=4 type=f align=2 words (r4.10)
//.declare V0218 (234)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V0219 (235)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0220 (236)  rf=r size=128 type=ud alias=V0219+0 align=32 words (r2.0)
//.declare V0221 (237)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0222 (238)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0223 (239)  rf=r size=128 type=ud alias=V0222+0 align=32 words (r12.0)
//.declare V0224 (240)  rf=r size=4 type=f align=2 words (r4.15)
//.declare V0225 (241)  rf=r size=4 type=ud alias=V0214+0 align=2 words (r6.15)
//.declare V0226 (242)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V0227 (243)  rf=r size=128 type=ud alias=V0221+0 align=32 words (r16.0)
//.declare V0228 (244)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0234 (250)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V0235 (251)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0236 (252)  rf=r size=128 type=ud alias=V0235+0 align=32 words (r2.0)
//.declare V0237 (253)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0238 (254)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0239 (255)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0240 (256)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0241 (257)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0242 (258)  rf=r size=128 type=ud alias=V0240+0 align=32 words (r2.0)
//.declare V0243 (259)  rf=r size=128 type=ud alias=V0241+0 align=32 words (r8.0)
//.declare  (260)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0244 (261)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0245 (262)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0246 (263)  rf=r size=128 type=d align=32 words (r146.0)
//.declare V0247 (264)  rf=r size=4 type=d align=2 words (r1.2)
//.declare V0248 (265)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0249 (266)  rf=r size=4 type=d align=2 words (r1.3)
//.declare V0250 (267)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0251 (268)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0252 (269)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0253 (270)  rf=r size=4 type=d align=2 words (r1.6)
//.declare V0254 (271)  rf=r size=4 type=f align=2 words (r1.5)
//.declare V0255 (272)  rf=r size=4 type=ud alias=V0251+0 align=2 words (r1.1)
//.declare V0256 (273)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0257 (274)  rf=r size=4 type=ud alias=V0256+0 align=2 words (r4.10)
//.declare V0258 (275)  rf=r size=4 type=d alias=+0 align=2 words (r7.4)
//.declare V0259 (276)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0260 (277)  rf=r size=4 type=ud alias=V0253+0 align=2 words (r1.6)
//.declare V0261 (278)  rf=r size=4 type=f align=2 words (r1.7)
//.declare V0262 (279)  rf=r size=4 type=f align=2 words (r1.9)
//.declare V0263 (280)  rf=r size=4 type=f align=2 words (r1.7)
//.declare V0264 (281)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0265 (282)  rf=r size=4 type=ud alias=V0264+0 align=2 words (r4.10)
//.declare V0266 (283)  rf=r size=4 type=d alias=+4 align=2 words (r7.5)
//.declare V0267 (284)  rf=r size=4 type=d align=2 words (r1.8)
//.declare V0268 (285)  rf=r size=4 type=ud alias=V0267+0 align=2 words (r1.8)
//.declare V0269 (286)  rf=r size=4 type=f alias=+0 align=2 words (r4.12)
//.declare V0270 (287)  rf=r size=4 type=ud alias=V0258+0 align=2 words (r7.4)
//.declare V0271 (288)  rf=r size=4 type=f alias=+4 align=2 words (r4.13)
//.declare V0272 (289)  rf=r size=4 type=ud alias=V0266+0 align=2 words (r7.5)
//.declare V0273 (290)  rf=r size=4 type=f align=2 words (r1.7)
//.declare V0275 (292)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0277 (294)  rf=r size=4 type=f align=2 words (r4.10)
//.declare V0278 (295)  rf=r size=4 type=f align=2 words (r4.10)
//.declare V0279 (296)  rf=r size=4 type=f align=2 words (r1.0)
//.declare V0280 (297)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0281 (298)  rf=r size=4 type=ud alias=V0280+0 align=2 words (r4.10)
//.declare V0282 (299)  rf=r size=4 type=d align=2 words (r1.5)
//.declare V0283 (300)  rf=r size=4 type=d align=2 words (r1.7)
//.declare V0284 (301)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0285 (302)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0286 (303)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0287 (304)  rf=r size=4 type=ud alias=V0285+0 align=2 words (r4.10)
//.declare V0288 (305)  rf=r size=4 type=ud alias=V0286+0 align=2 words (r4.10)
//.declare  (306)  rf=f16  size=2 type=uw align=1 words (f2.0)
//.declare V0289 (307)  rf=r size=4 type=d align=2 words (r4.10)
//.declare P06 (308)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0290 (309)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0291 (310)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0292 (311)  rf=r size=4 type=d align=2 words (r1.0)
//.declare V0293 (312)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0294 (313)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0295 (314)  rf=r size=4 type=d align=2 words (r4.11)
//.declare V0296 (315)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0297 (316)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0298 (317)  rf=r size=4 type=f align=2 words (r1.1)
//.declare V0299 (318)  rf=r size=4 type=ud alias=V0295+0 align=2 words (r4.11)
//.declare V0300 (319)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0301 (320)  rf=r size=4 type=ud alias=V0300+0 align=2 words (r4.10)
//.declare V0302 (321)  rf=r size=4 type=d align=2 words (r1.4)
//.declare V0303 (322)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V0304 (323)  rf=r size=128 type=ud alias=V0297+0 align=32 words (r14.0)
//.declare V0305 (324)  rf=r size=4 type=f align=2 words (r1.3)
//.declare V0306 (325)  rf=r size=4 type=f align=2 words (r1.3)
//.declare V0307 (326)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V0308 (327)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0309 (328)  rf=r size=128 type=ud alias=V0308+0 align=32 words (r2.0)
//.declare V0310 (329)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V0311 (330)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0312 (331)  rf=r size=128 type=ud alias=V0311+0 align=32 words (r16.0)
//.declare V0313 (332)  rf=r size=4 type=f align=2 words (r1.4)
//.declare V0314 (333)  rf=r size=4 type=ud alias=V0302+0 align=2 words (r1.4)
//.declare V0315 (334)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V0316 (335)  rf=r size=128 type=ud alias=V0310+0 align=32 words (r18.0)
//.declare V0317 (336)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0323 (342)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V0324 (343)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0325 (344)  rf=r size=128 type=ud alias=V0324+0 align=32 words (r2.0)
//.declare V0326 (345)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0327 (346)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0328 (347)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0329 (348)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0330 (349)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0331 (350)  rf=r size=128 type=ud alias=V0329+0 align=32 words (r2.0)
//.declare V0332 (351)  rf=r size=128 type=ud alias=V0330+0 align=32 words (r8.0)
//.declare  (352)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0333 (353)  rf=r size=128 type=d align=32 words (r2.0)
//.declare P07 (354)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0334 (355)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0335 (356)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0336 (357)  rf=r size=4 type=d align=32 words (r12.0)
//.declare V0337 (358)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0338 (359)  rf=r size=4 type=d align=2 words (r4.12)
//.declare V0339 (360)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0340 (361)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0341 (362)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0342 (363)  rf=r size=8 type=q alias=V0041+0 align=4 words (r5.3)
//.declare V0345 (366)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0346 (367)  rf=r size=256 type=uq alias=V0345+0 align=32 words (r8.0)
//.declare V0347 (368)  rf=r size=8 type=q alias=V0038+0 align=4 words (r5.0)
//.declare V0350 (371)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V0351 (372)  rf=r size=256 type=uq alias=V0350+0 align=32 words (r20.0)
//.declare V0353 (374)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare V0354 (375)  rf=r size=128 type=w alias=V0353+0 align=32 words (r14.0)
//.declare V0356 (377)  rf=r size=8 type=q align=4 words (r4.5)
//.declare V0357 (378)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0358 (379)  rf=r size=256 type=uq alias=V0357+0 align=32 words (r16.0)
//.declare V0360 (381)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare V0361 (382)  rf=r size=8 type=q alias=V0039+0 align=4 words (r5.1)
//.declare V0362 (383)  rf=r size=256 type=q align=32 words (r24.0)
//.declare V0363 (384)  rf=r size=256 type=uq alias=V0362+0 align=32 words (r24.0)
//.declare V0365 (386)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare V0366 (387)  rf=r size=128 type=w alias=V0365+0 align=32 words (r14.0)
//.declare V0368 (389)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare P08 (390)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0369 (391)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0373 (395)  rf=r size=256 type=q align=32 words (r14.0)
//.declare V0374 (396)  rf=r size=256 type=uq alias=V0373+0 align=32 words (r14.0)
//.declare V0376 (398)  rf=r size=128 type=ud align=32 words (r28.0)
//.declare V0377 (399)  rf=r size=128 type=w alias=V0376+0 align=32 words (r28.0)
//.declare  (400)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0378 (401)  rf=r size=256 type=q align=32 words (r22.0)
//.declare V0379 (402)  rf=r size=256 type=uq alias=V0378+0 align=32 words (r22.0)
//.declare V0381 (404)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare V0382 (405)  rf=r size=256 type=q align=32 words (r18.0)
//.declare V0383 (406)  rf=r size=256 type=uq alias=V0382+0 align=32 words (r18.0)
//.declare V0385 (408)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare V0386 (409)  rf=r size=128 type=w alias=V0385+0 align=32 words (r14.0)
//.declare V0388 (411)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare P09 (412)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0389 (413)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0393 (417)  rf=r size=256 type=q align=32 words (r14.0)
//.declare V0394 (418)  rf=r size=256 type=uq alias=V0393+0 align=32 words (r14.0)
//.declare V0396 (420)  rf=r size=128 type=ud align=32 words (r28.0)
//.declare V0397 (421)  rf=r size=128 type=w alias=V0396+0 align=32 words (r28.0)
//.declare V0398 (422)  rf=r size=256 type=q align=32 words (r22.0)
//.declare V0399 (423)  rf=r size=256 type=uq alias=V0398+0 align=32 words (r22.0)
//.declare V0401 (425)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare V0402 (426)  rf=r size=256 type=q align=32 words (r18.0)
//.declare V0403 (427)  rf=r size=256 type=uq alias=V0402+0 align=32 words (r18.0)
//.declare V0405 (429)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare V0406 (430)  rf=r size=128 type=w alias=V0405+0 align=32 words (r14.0)
//.declare V0408 (432)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare P10 (433)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0409 (434)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0413 (438)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0414 (439)  rf=r size=256 type=uq alias=V0413+0 align=32 words (r8.0)
//.declare V0416 (441)  rf=r size=128 type=ud align=32 words (r24.0)
//.declare V0417 (442)  rf=r size=128 type=w alias=V0416+0 align=32 words (r24.0)
//.declare  (443)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0418 (444)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0419 (445)  rf=r size=256 type=uq alias=V0418+0 align=32 words (r16.0)
//.declare V0421 (447)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0422 (448)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0423 (449)  rf=r size=256 type=uq alias=V0422+0 align=32 words (r12.0)
//.declare V0425 (451)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare V0426 (452)  rf=r size=128 type=w alias=V0425+0 align=32 words (r8.0)
//.declare V0428 (454)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0429 (455)  rf=r size=4 type=d align=2 words (r4.10)
//.declare P11 (456)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0430 (457)  rf=r size=4 type=d align=2 words (r162.11)
//.declare V0431 (458)  rf=r size=8 type=q alias=V0047+0 align=4 words (r6.0)
//.declare V0432 (459)  rf=r size=4 type=d align=2 words (r4.11)
//.declare V0433 (460)  rf=r size=4 type=d align=2 words (r4.10)
//.declare V0434 (461)  rf=r size=4 type=d align=2 words (r4.12)
//.declare V0435 (462)  rf=r size=4 type=d align=2 words (r4.12)
//.declare V0436 (463)  rf=r size=4 type=ud alias=V0434+0 align=2 words (r4.12)
//.declare V0437 (464)  rf=r size=4 type=ud alias=V0435+0 align=2 words (r4.12)
//.declare V0438 (465)  rf=r size=4 type=d align=2 words (r6.11)
//.declare V0440 (467)  rf=r size=4 type=ud alias=V0438+0 align=2 words (r6.11)
//.declare V0441 (468)  rf=r size=8 type=q align=4 words (r4.7)
//.declare V0442 (469)  rf=r size=8 type=q align=32 words (r2.0)
//.declare V0443 (470)  rf=r size=8 type=uq alias=V0442+0 align=32 words (r2.0)
//.declare V0444 (471)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0445 (472)  rf=r size=4 type=d align=2 words (r4.13)
//.declare P12 (473)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare P13 (474)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0446 (475)  rf=r size=8 type=q align=4 words (r4.5)
//.declare V0447 (476)  rf=r size=8 type=q align=4 words (r2.1)
//.declare V0448 (477)  rf=r size=8 type=q alias=V0049+0 align=4 words (r6.2)
//.declare V0449 (478)  rf=r size=8 type=q align=32 words (r2.0)
//.declare V0450 (479)  rf=r size=8 type=uq alias=V0449+0 align=32 words (r2.0)
//.declare V0451 (480)  rf=r size=4 type=d align=32 words (r22.0)
//.declare P14 (481)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0452 (482)  rf=r size=8 type=q align=32 words (r6.0)
//.declare V0453 (483)  rf=r size=8 type=uq alias=V0452+0 align=32 words (r6.0)
//.declare V0454 (484)  rf=r size=8 type=d align=32 words (r163.0)
//.declare P15 (485)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare P16 (486)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare P17 (487)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0455 (488)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0456 (489)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0457 (490)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0458 (491)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0459 (492)  rf=r size=8 type=q alias=V0040+0 align=4 words (r5.2)
//.declare V0462 (495)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0463 (496)  rf=r size=256 type=uq alias=V0462+0 align=32 words (r8.0)
//.declare V0464 (497)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0465 (498)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0466 (499)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0467 (500)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0468 (501)  rf=r size=8 type=q alias=V0037+0 align=4 words (r4.3)
//.declare V0471 (504)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0472 (505)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V0473 (506)  rf=r size=256 type=d alias=V0464+0 align=32 words (r12.0)
//.declare V0474 (507)  rf=r size=256 type=uq alias=V0471+0 align=32 words (r16.0)
//.declare V0475 (508)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0476 (509)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0477 (510)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0478 (511)  rf=r size=128 type=d align=32 words (r144.0)
//.declare V0479 (512)  rf=r size=128 type=d align=32 words (r166.0)
//.declare V0480 (513)  rf=r size=128 type=d align=32 words (r164.0)
//.declare V0481 (514)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0482 (515)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0483 (516)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0486 (519)  rf=r size=8 type=d alias=V0050+0 align=4 words (r6.6)
//.declare V0487 (520)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V0490 (523)  rf=r size=8 type=d alias=V0487+0 align=4 words (r4.6)
//.declare P18 (524)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P19 (525)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0491 (526)  rf=r size=4 type=d align=2 words (r162.4)
//.declare V0492 (527)  rf=r size=8 type=q alias=V0050+0 align=4 words (r6.3)
//.declare V0493 (528)  rf=r size=8 type=q align=32 words (r6.0)
//.declare V0494 (529)  rf=r size=8 type=uq alias=V0493+0 align=32 words (r6.0)
//.declare V0495 (530)  rf=r size=1 type=b align=32 words (r6.0)
//.declare V0496 (531)  rf=r size=4 type=ud align=32 words (r6.0)
//.declare V0497 (532)  rf=r size=4 type=b alias=V0496+0 align=32 words (r6.0)
//.declare V0498 (533)  rf=r size=2 type=w align=1 words (r4.12)
//.declare V0499 (534)  rf=r size=1 type=ub alias=V0495+0 align=32 words (r6.0)
//.declare P20 (535)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0501 (537)  rf=r size=256 type=ud alias=V0139+0 align=32 words (r128.0)
//.declare V0503 (539)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0505 (541)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0506 (542)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0507 (543)  rf=r size=256 type=uq align=32 words (r132.0)
//.declare V0508 (544)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V0509 (545)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0510 (546)  rf=r size=8 type=q alias=V0042+0 align=4 words (r5.4)
//.declare V0513 (549)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0514 (550)  rf=r size=256 type=uq alias=V0513+0 align=32 words (r16.0)
//.declare V0515 (551)  rf=r size=128 type=d align=32 words (r42.0)
//.declare V0516 (552)  rf=r size=128 type=d align=32 words (r40.0)
//.declare V0517 (553)  rf=r size=128 type=d align=32 words (r38.0)
//.declare V0518 (554)  rf=r size=128 type=d align=32 words (r24.0)
//.declare V0520 (556)  rf=r size=128 type=w alias=V0515+0 align=32 words (r42.0)
//.declare V0521 (557)  rf=r size=64 type=w align=32 words (r45.0)
//.declare V0522 (558)  rf=r size=64 type=w align=32 words (r44.0)
//.declare V0524 (560)  rf=r size=128 type=w alias=V0516+0 align=32 words (r40.0)
//.declare V0525 (561)  rf=r size=64 type=w align=32 words (r43.0)
//.declare V0526 (562)  rf=r size=64 type=w align=32 words (r42.0)
//.declare V0528 (564)  rf=r size=128 type=w alias=V0517+0 align=32 words (r38.0)
//.declare V0529 (565)  rf=r size=64 type=w align=32 words (r41.0)
//.declare V0530 (566)  rf=r size=64 type=w align=32 words (r40.0)
//.declare V0532 (568)  rf=r size=128 type=w alias=V0518+0 align=32 words (r24.0)
//.declare V0533 (569)  rf=r size=64 type=w align=32 words (r39.0)
//.declare V0534 (570)  rf=r size=64 type=w align=32 words (r38.0)
//.declare V0535 (571)  rf=r size=256 type=q alias=V0507+0 align=32 words (r132.0)
//.declare V0537 (573)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0538 (574)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0539 (575)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0540 (576)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0542 (578)  rf=r size=128 type=w alias=V0537+0 align=32 words (r14.0)
//.declare V0543 (579)  rf=r size=64 type=w align=32 words (r49.0)
//.declare V0544 (580)  rf=r size=64 type=w align=32 words (r48.0)
//.declare V0546 (582)  rf=r size=128 type=w alias=V0538+0 align=32 words (r12.0)
//.declare V0547 (583)  rf=r size=64 type=w align=32 words (r25.0)
//.declare V0548 (584)  rf=r size=64 type=w align=32 words (r24.0)
//.declare V0551 (587)  rf=r size=128 type=w alias=V0539+0 align=32 words (r10.0)
//.declare V0552 (588)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V0553 (589)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V0555 (591)  rf=r size=128 type=w alias=V0540+0 align=32 words (r8.0)
//.declare V0556 (592)  rf=r size=64 type=w align=32 words (r10.0)
//.declare V0557 (593)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0562 (598)  rf=r size=256 type=d align=32 words (r10.0)
//.declare V0564 (600)  rf=r size=256 type=uq align=32 words (r34.0)
//.declare V0568 (604)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V0570 (606)  rf=r size=256 type=q align=32 words (r30.0)
//.declare V0574 (610)  rf=r size=256 type=d align=32 words (r12.0)
//.declare V0576 (612)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V0580 (616)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V0582 (618)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0583 (619)  rf=r size=8 type=q alias=V0044+0 align=4 words (r5.6)
//.declare V0585 (621)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V0586 (622)  rf=r size=8 type=q align=4 words (r162.4)
//.declare V0587 (623)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V0588 (624)  rf=r size=128 type=d align=32 words (r26.0)
//.declare V0589 (625)  rf=r size=256 type=uq align=32 words (r124.0)
//.declare V0590 (626)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V0591 (627)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0593 (629)  rf=r size=768 type=uq alias=V0106+0 align=32 words (r26.0)
//.declare V0594 (630)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0595 (631)  rf=r size=512 type=w alias=V0108+0 align=32 words (r26.0)
//.declare V0597 (633)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0598 (634)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0600 (636)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0601 (637)  rf=r size=256 type=q alias=V0589+0 align=32 words (r124.0)
//.declare V0604 (640)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0605 (641)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0607 (643)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0610 (646)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0611 (647)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0613 (649)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0616 (652)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0617 (653)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0619 (655)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0622 (658)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (659)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0623 (660)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0625 (662)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0628 (665)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (666)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0629 (667)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0631 (669)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0634 (672)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (673)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0635 (674)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0637 (676)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0640 (679)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (680)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0641 (681)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0643 (683)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0646 (686)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0647 (687)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0649 (689)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0652 (692)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0653 (693)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0655 (695)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0658 (698)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0659 (699)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0661 (701)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0664 (704)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0665 (705)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0667 (707)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0670 (710)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (711)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0671 (712)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0673 (714)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0676 (717)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (718)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0677 (719)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0679 (721)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0682 (724)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (725)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0683 (726)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V0685 (728)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V0688 (731)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare  (732)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0689 (733)  rf=r size=4 type=d align=2 words (r4.15)
//.declare V0690 (734)  rf=r size=4 type=d align=2 words (r4.12)
//.declare V0691 (735)  rf=r size=4 type=d align=2 words (r6.0)
//.declare P21 (736)  rf=f1  size=2 type=uw align=1 words (f2.0)
//.declare V0692 (737)  rf=r size=4 type=d align=2 words (r4.6)
//.declare P22 (738)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P23 (739)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0693 (740)  rf=r size=4 type=d align=2 words (r4.13)
//.declare P24 (741)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0694 (742)  rf=r size=4 type=ud alias=V0692+0 align=2 words (r4.6)
//.declare V0695 (743)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V0696 (744)  rf=r size=4 type=d align=2 words (r4.14)
//.declare V0698 (746)  rf=r size=8 type=q align=4 words (r4.5)
//.declare V0699 (747)  rf=r size=4 type=d alias=+0 align=2 words (r4.8)
//.declare V0700 (748)  rf=r size=4 type=d alias=+4 align=2 words (r4.9)
//.declare V0701 (749)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0702 (750)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0703 (751)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0706 (754)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0707 (755)  rf=r size=256 type=uq alias=V0706+0 align=32 words (r8.0)
//.declare V0708 (756)  rf=r size=256 type=q align=32 words (r82.0)
//.declare V0709 (757)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0710 (758)  rf=r size=256 type=uq alias=V0709+0 align=32 words (r16.0)
//.declare V0711 (759)  rf=r size=256 type=q align=32 words (r78.0)
//.declare V0713 (761)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0715 (763)  rf=r size=4 type=ud alias=V0713+0 align=2 words (r6.0)
//.declare V0716 (764)  rf=r size=256 type=q align=32 words (r70.0)
//.declare V0717 (765)  rf=r size=4 type=d align=2 words (r6.4)
//.declare V0719 (767)  rf=r size=4 type=ud alias=V0717+0 align=2 words (r6.4)
//.declare V0720 (768)  rf=r size=256 type=q align=32 words (r66.0)
//.declare V0721 (769)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0723 (771)  rf=r size=4 type=ud alias=V0721+0 align=2 words (r6.1)
//.declare V0724 (772)  rf=r size=256 type=q align=32 words (r62.0)
//.declare V0725 (773)  rf=r size=4 type=d align=2 words (r6.5)
//.declare V0727 (775)  rf=r size=4 type=ud alias=V0725+0 align=2 words (r6.5)
//.declare V0728 (776)  rf=r size=256 type=q align=32 words (r58.0)
//.declare V0730 (778)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0731 (779)  rf=r size=256 type=uq alias=V0730+0 align=32 words (r8.0)
//.declare V0732 (780)  rf=r size=256 type=q align=32 words (r74.0)
//.declare V0733 (781)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0734 (782)  rf=r size=256 type=uq alias=V0733+0 align=32 words (r16.0)
//.declare V0735 (783)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0737 (785)  rf=r size=4 type=d align=2 words (r6.7)
//.declare V0739 (787)  rf=r size=4 type=ud alias=V0737+0 align=2 words (r6.7)
//.declare V0740 (788)  rf=r size=256 type=q align=32 words (r54.0)
//.declare V0741 (789)  rf=r size=4 type=d align=2 words (r6.8)
//.declare V0743 (791)  rf=r size=4 type=ud alias=V0741+0 align=2 words (r6.8)
//.declare V0744 (792)  rf=r size=256 type=q align=32 words (r50.0)
//.declare V0745 (793)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0747 (795)  rf=r size=4 type=ud alias=V0745+0 align=2 words (r6.1)
//.declare V0748 (796)  rf=r size=256 type=q align=32 words (r46.0)
//.declare V0753 (801)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V0755 (803)  rf=r size=256 type=uq alias=V0716+0 align=32 words (r70.0)
//.declare V0756 (804)  rf=r size=256 type=uq align=32 words (r42.0)
//.declare V0757 (805)  rf=r size=256 type=q align=32 words (r38.0)
//.declare V0758 (806)  rf=r size=256 type=uq alias=V0757+0 align=32 words (r38.0)
//.declare V0759 (807)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0760 (808)  rf=r size=256 type=q align=32 words (r34.0)
//.declare V0761 (809)  rf=r size=256 type=uq alias=V0760+0 align=32 words (r34.0)
//.declare V0762 (810)  rf=r size=256 type=q align=32 words (r38.0)
//.declare V0763 (811)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V0765 (813)  rf=r size=256 type=uq alias=V0759+0 align=32 words (r8.0)
//.declare V0767 (815)  rf=r size=64 type=w align=32 words (r34.0)
//.declare V0770 (818)  rf=r size=64 type=w align=32 words (r25.0)
//.declare V0773 (821)  rf=r size=64 type=w align=32 words (r24.0)
//.declare V0774 (822)  rf=r size=4 type=d align=2 words (r6.6)
//.declare V0776 (824)  rf=r size=4 type=ud alias=V0774+0 align=2 words (r6.6)
//.declare V0777 (825)  rf=r size=256 type=q align=32 words (r30.0)
//.declare V0778 (826)  rf=r size=64 type=w align=32 words (r2.0)
//.declare V0780 (828)  rf=r size=256 type=uq alias=V0762+0 align=32 words (r38.0)
//.declare V0782 (830)  rf=r size=64 type=w align=32 words (r11.0)
//.declare V0785 (833)  rf=r size=64 type=w align=32 words (r10.0)
//.declare V0788 (836)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0789 (837)  rf=r size=128 type=b align=32 words (r8.0)
//.declare V0790 (838)  rf=r size=128 type=w alias=V0789+0 align=32 words (r8.0)
//.declare V0791 (839)  rf=r size=128 type=d alias=V0789+0 align=32 words (r8.0)
//.declare V0792 (840)  rf=r size=256 type=uq alias=V0720+0 align=32 words (r66.0)
//.declare V0793 (841)  rf=r size=128 type=b align=32 words (r2.0)
//.declare V0794 (842)  rf=r size=128 type=w alias=V0793+0 align=32 words (r2.0)
//.declare V0795 (843)  rf=r size=128 type=d alias=V0793+0 align=32 words (r2.0)
//.declare V0796 (844)  rf=r size=256 type=uq alias=V0724+0 align=32 words (r62.0)
//.declare V0797 (845)  rf=r size=128 type=b align=32 words (r8.0)
//.declare V0798 (846)  rf=r size=128 type=w alias=V0797+0 align=32 words (r8.0)
//.declare V0799 (847)  rf=r size=128 type=d alias=V0797+0 align=32 words (r8.0)
//.declare V0800 (848)  rf=r size=256 type=uq alias=V0728+0 align=32 words (r58.0)
//.declare V0801 (849)  rf=r size=128 type=b align=32 words (r2.0)
//.declare V0802 (850)  rf=r size=128 type=w alias=V0801+0 align=32 words (r2.0)
//.declare V0803 (851)  rf=r size=128 type=d alias=V0801+0 align=32 words (r2.0)
//.declare V0804 (852)  rf=r size=256 type=uq alias=V0777+0 align=32 words (r30.0)
//.declare V0805 (853)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V0806 (854)  rf=r size=256 type=uq alias=V0805+0 align=32 words (r20.0)
//.declare V0807 (855)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0808 (856)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V0809 (857)  rf=r size=256 type=uq alias=V0808+0 align=32 words (r16.0)
//.declare V0810 (858)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V0811 (859)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V0813 (861)  rf=r size=256 type=uq alias=V0807+0 align=32 words (r8.0)
//.declare V0815 (863)  rf=r size=64 type=w align=32 words (r18.0)
//.declare V0818 (866)  rf=r size=64 type=w align=32 words (r17.0)
//.declare V0821 (869)  rf=r size=64 type=w align=32 words (r16.0)
//.declare V0822 (870)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0824 (872)  rf=r size=4 type=ud alias=V0822+0 align=2 words (r6.0)
//.declare V0825 (873)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0826 (874)  rf=r size=64 type=w align=32 words (r2.0)
//.declare V0828 (876)  rf=r size=256 type=uq alias=V0810+0 align=32 words (r20.0)
//.declare V0830 (878)  rf=r size=64 type=w align=32 words (r11.0)
//.declare V0833 (881)  rf=r size=64 type=w align=32 words (r10.0)
//.declare V0836 (884)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0838 (886)  rf=r size=256 type=uq alias=V0740+0 align=32 words (r54.0)
//.declare V0839 (887)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0840 (888)  rf=r size=128 type=w alias=V0839+0 align=32 words (r8.0)
//.declare V0842 (890)  rf=r size=256 type=uq alias=V0744+0 align=32 words (r50.0)
//.declare V0843 (891)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0844 (892)  rf=r size=128 type=w alias=V0843+0 align=32 words (r2.0)
//.declare V0846 (894)  rf=r size=256 type=uq alias=V0748+0 align=32 words (r46.0)
//.declare V0847 (895)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0848 (896)  rf=r size=128 type=w alias=V0847+0 align=32 words (r8.0)
//.declare V0850 (898)  rf=r size=256 type=uq alias=V0825+0 align=32 words (r12.0)
//.declare V0851 (899)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0852 (900)  rf=r size=128 type=w alias=V0851+0 align=32 words (r2.0)
//.declare P25 (901)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare P26 (902)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0853 (903)  rf=r size=4 type=d align=2 words (r6.4)
//.declare V0854 (904)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0855 (905)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V0856 (906)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0859 (909)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0860 (910)  rf=r size=256 type=uq alias=V0859+0 align=32 words (r12.0)
//.declare V0861 (911)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0862 (912)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0864 (914)  rf=r size=256 type=uq alias=V0861+0 align=32 words (r8.0)
//.declare V0866 (916)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V0869 (919)  rf=r size=64 type=w align=32 words (r14.0)
//.declare V0872 (922)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V0874 (924)  rf=r size=4 type=ud alias=V0695+0 align=2 words (r4.7)
//.declare V0875 (925)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0876 (926)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0877 (927)  rf=r size=256 type=uq alias=V0876+0 align=32 words (r8.0)
//.declare V0878 (928)  rf=r size=64 type=uw alias=V0862+0 align=32 words (r1.0)
//.declare V0879 (929)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0880 (930)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0882 (932)  rf=r size=4 type=ud alias=V0880+0 align=2 words (r6.0)
//.declare V0883 (933)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0884 (934)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0885 (935)  rf=r size=256 type=uq alias=V0884+0 align=32 words (r8.0)
//.declare V0886 (936)  rf=r size=64 type=uw alias=V0866+0 align=32 words (r13.0)
//.declare V0887 (937)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0888 (938)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0890 (940)  rf=r size=4 type=ud alias=V0888+0 align=2 words (r6.0)
//.declare V0891 (941)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0892 (942)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0893 (943)  rf=r size=256 type=uq alias=V0892+0 align=32 words (r8.0)
//.declare V0894 (944)  rf=r size=64 type=uw alias=V0869+0 align=32 words (r14.0)
//.declare V0895 (945)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0896 (946)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0898 (948)  rf=r size=4 type=ud alias=V0896+0 align=2 words (r6.0)
//.declare V0899 (949)  rf=r size=8 type=q align=4 words (r6.0)
//.declare V0900 (950)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0901 (951)  rf=r size=256 type=uq alias=V0900+0 align=32 words (r8.0)
//.declare V0902 (952)  rf=r size=64 type=uw alias=V0872+0 align=32 words (r12.0)
//.declare V0903 (953)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare P27 (954)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare P28 (955)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0904 (956)  rf=r size=4 type=d align=2 words (r6.0)
//.declare V0905 (957)  rf=r size=4 type=d align=2 words (r1.1)
//.declare V0907 (959)  rf=r size=8 type=q align=4 words (r6.2)
//.declare V0908 (960)  rf=r size=8 type=q align=32 words (r2.0)
//.declare V0909 (961)  rf=r size=8 type=uq alias=V0908+0 align=32 words (r2.0)
//.declare V0910 (962)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0911 (963)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0912 (964)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0915 (967)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0916 (968)  rf=r size=256 type=uq alias=V0915+0 align=32 words (r12.0)
//.declare V0917 (969)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0918 (970)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V0920 (972)  rf=r size=256 type=uq alias=V0917+0 align=32 words (r8.0)
//.declare V0922 (974)  rf=r size=64 type=w align=32 words (r14.0)
//.declare V0925 (977)  rf=r size=64 type=w align=32 words (r15.0)
//.declare V0928 (980)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V0930 (982)  rf=r size=8 type=q align=4 words (r6.2)
//.declare V0931 (983)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0932 (984)  rf=r size=256 type=uq alias=V0931+0 align=32 words (r8.0)
//.declare V0933 (985)  rf=r size=64 type=uw alias=V0918+0 align=32 words (r12.0)
//.declare V0934 (986)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0935 (987)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0937 (989)  rf=r size=8 type=q align=4 words (r6.2)
//.declare V0938 (990)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0939 (991)  rf=r size=256 type=uq alias=V0938+0 align=32 words (r8.0)
//.declare V0940 (992)  rf=r size=64 type=uw alias=V0922+0 align=32 words (r14.0)
//.declare V0941 (993)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0942 (994)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0944 (996)  rf=r size=8 type=q align=4 words (r6.2)
//.declare V0945 (997)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0946 (998)  rf=r size=256 type=uq alias=V0945+0 align=32 words (r8.0)
//.declare V0947 (999)  rf=r size=64 type=uw alias=V0925+0 align=32 words (r15.0)
//.declare V0948 (1000)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0949 (1001)  rf=r size=4 type=d align=2 words (r6.1)
//.declare V0951 (1003)  rf=r size=8 type=q align=4 words (r6.2)
//.declare V0952 (1004)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0953 (1005)  rf=r size=256 type=uq alias=V0952+0 align=32 words (r8.0)
//.declare V0954 (1006)  rf=r size=64 type=uw alias=V0928+0 align=32 words (r13.0)
//.declare V0955 (1007)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare P29 (1008)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0957 (1010)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V0959 (1012)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0960 (1013)  rf=r size=8 type=q align=32 words (r1.0)
//.declare V0961 (1014)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V0962 (1015)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V0965 (1018)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V0966 (1019)  rf=r size=256 type=uq alias=V0965+0 align=32 words (r12.0)
//.declare V0967 (1020)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0968 (1021)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V0970 (1023)  rf=r size=256 type=uq alias=V0967+0 align=32 words (r8.0)
//.declare V0972 (1025)  rf=r size=64 type=w align=32 words (r14.0)
//.declare V0975 (1028)  rf=r size=64 type=w align=32 words (r15.0)
//.declare V0978 (1031)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V0979 (1032)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V0981 (1034)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V0982 (1035)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0983 (1036)  rf=r size=256 type=uq alias=V0982+0 align=32 words (r8.0)
//.declare V0984 (1037)  rf=r size=64 type=uw alias=V0968+0 align=32 words (r12.0)
//.declare V0985 (1038)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0986 (1039)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V0988 (1041)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V0989 (1042)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0990 (1043)  rf=r size=256 type=uq alias=V0989+0 align=32 words (r8.0)
//.declare V0991 (1044)  rf=r size=64 type=uw alias=V0972+0 align=32 words (r14.0)
//.declare V0992 (1045)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V0993 (1046)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V0995 (1048)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V0996 (1049)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V0997 (1050)  rf=r size=256 type=uq alias=V0996+0 align=32 words (r8.0)
//.declare V0998 (1051)  rf=r size=64 type=uw alias=V0975+0 align=32 words (r15.0)
//.declare V0999 (1052)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1000 (1053)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1002 (1055)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1003 (1056)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1004 (1057)  rf=r size=256 type=uq alias=V1003+0 align=32 words (r8.0)
//.declare V1005 (1058)  rf=r size=64 type=uw alias=V0978+0 align=32 words (r13.0)
//.declare V1006 (1059)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare P30 (1060)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V1008 (1062)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1010 (1064)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V1011 (1065)  rf=r size=8 type=q align=32 words (r1.0)
//.declare V1012 (1066)  rf=r size=4 type=d align=32 words (r1.0)
//.declare V1013 (1067)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1016 (1070)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1017 (1071)  rf=r size=256 type=uq alias=V1016+0 align=32 words (r12.0)
//.declare V1018 (1072)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1019 (1073)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V1021 (1075)  rf=r size=256 type=uq alias=V1018+0 align=32 words (r8.0)
//.declare V1023 (1077)  rf=r size=64 type=w align=32 words (r14.0)
//.declare V1026 (1080)  rf=r size=64 type=w align=32 words (r15.0)
//.declare V1029 (1083)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V1030 (1084)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1032 (1086)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1033 (1087)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1034 (1088)  rf=r size=256 type=uq alias=V1033+0 align=32 words (r8.0)
//.declare V1035 (1089)  rf=r size=64 type=uw alias=V1019+0 align=32 words (r12.0)
//.declare V1036 (1090)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1037 (1091)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1039 (1093)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1040 (1094)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1041 (1095)  rf=r size=256 type=uq alias=V1040+0 align=32 words (r8.0)
//.declare V1042 (1096)  rf=r size=64 type=uw alias=V1023+0 align=32 words (r14.0)
//.declare V1043 (1097)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1044 (1098)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1046 (1100)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1047 (1101)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1048 (1102)  rf=r size=256 type=uq alias=V1047+0 align=32 words (r8.0)
//.declare V1049 (1103)  rf=r size=64 type=uw alias=V1026+0 align=32 words (r15.0)
//.declare V1050 (1104)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1051 (1105)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1053 (1107)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1054 (1108)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1055 (1109)  rf=r size=256 type=uq alias=V1054+0 align=32 words (r8.0)
//.declare V1056 (1110)  rf=r size=64 type=uw alias=V1029+0 align=32 words (r13.0)
//.declare V1057 (1111)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare P31 (1112)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V1059 (1114)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1061 (1116)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1062 (1117)  rf=r size=8 type=q align=32 words (r6.0)
//.declare V1063 (1118)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1064 (1119)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1067 (1122)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1068 (1123)  rf=r size=256 type=uq alias=V1067+0 align=32 words (r12.0)
//.declare V1069 (1124)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1070 (1125)  rf=r size=64 type=w align=32 words (r12.0)
//.declare V1072 (1127)  rf=r size=256 type=uq alias=V1069+0 align=32 words (r8.0)
//.declare V1074 (1129)  rf=r size=64 type=w align=32 words (r14.0)
//.declare V1077 (1132)  rf=r size=64 type=w align=32 words (r15.0)
//.declare V1080 (1135)  rf=r size=64 type=w align=32 words (r13.0)
//.declare V1081 (1136)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1083 (1138)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1084 (1139)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1085 (1140)  rf=r size=256 type=uq alias=V1084+0 align=32 words (r8.0)
//.declare V1086 (1141)  rf=r size=64 type=uw alias=V1070+0 align=32 words (r12.0)
//.declare V1087 (1142)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1088 (1143)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1090 (1145)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1091 (1146)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1092 (1147)  rf=r size=256 type=uq alias=V1091+0 align=32 words (r8.0)
//.declare V1093 (1148)  rf=r size=64 type=uw alias=V1074+0 align=32 words (r14.0)
//.declare V1094 (1149)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1095 (1150)  rf=r size=4 type=d align=2 words (r4.7)
//.declare V1097 (1152)  rf=r size=8 type=q align=4 words (r4.4)
//.declare V1098 (1153)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1099 (1154)  rf=r size=256 type=uq alias=V1098+0 align=32 words (r8.0)
//.declare V1100 (1155)  rf=r size=64 type=uw alias=V1077+0 align=32 words (r15.0)
//.declare V1101 (1156)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1102 (1157)  rf=r size=4 type=d align=2 words (r4.6)
//.declare V1104 (1159)  rf=r size=8 type=q align=4 words (r4.3)
//.declare V1105 (1160)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1106 (1161)  rf=r size=256 type=uq alias=V1105+0 align=32 words (r8.0)
//.declare V1107 (1162)  rf=r size=64 type=uw alias=V1080+0 align=32 words (r13.0)
//.declare V1108 (1163)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1109 (1164)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V1110 (1165)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1111 (1166)  rf=r size=256 type=uq align=32 words (r128.0)
//.declare V1112 (1167)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V1113 (1168)  rf=r size=256 type=q alias=V1111+0 align=32 words (r128.0)
//.declare V1120 (1175)  rf=r size=16 type=d align=32 words (r6.0)
//.declare V1121 (1176)  rf=r size=512 type=d align=32 words (r8.0)
//.declare V1123 (1178)  rf=r size=256 type=ud alias=V0589+0 align=32 words (r124.0)
//.declare V1125 (1180)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1127 (1182)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1128 (1183)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1129 (1184)  rf=r size=512 type=f alias=V0108+0 align=32 words (r26.0)
//.declare V1131 (1186)  rf=r size=256 type=ud alias=V0507+0 align=32 words (r132.0)
//.declare V1133 (1188)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1136 (1191)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1137 (1192)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1138 (1193)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1143 (1198)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1145 (1200)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1146 (1201)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1151 (1206)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1154 (1209)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1155 (1210)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1156 (1211)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1161 (1216)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1163 (1218)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1164 (1219)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1169 (1224)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1172 (1227)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1173 (1228)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1174 (1229)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1179 (1234)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1181 (1236)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1182 (1237)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1187 (1242)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1190 (1245)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1191 (1246)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1192 (1247)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1197 (1252)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1199 (1254)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1200 (1255)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1206 (1261)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1209 (1264)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1210 (1265)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1211 (1266)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1216 (1271)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1218 (1273)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1219 (1274)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1225 (1280)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1228 (1283)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1229 (1284)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1230 (1285)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1235 (1290)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1237 (1292)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1238 (1293)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1244 (1299)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1247 (1302)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1248 (1303)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1249 (1304)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1254 (1309)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1256 (1311)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1257 (1312)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1263 (1318)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1266 (1321)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1267 (1322)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1268 (1323)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1273 (1328)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1275 (1330)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1276 (1331)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1282 (1337)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1285 (1340)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1286 (1341)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1287 (1342)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1292 (1347)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1294 (1349)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1295 (1350)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1301 (1356)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1304 (1359)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1305 (1360)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1306 (1361)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1311 (1366)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1313 (1368)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1314 (1369)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1320 (1375)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1323 (1378)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1324 (1379)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1325 (1380)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1330 (1385)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1332 (1387)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1333 (1388)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1339 (1394)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1342 (1397)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1343 (1398)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1344 (1399)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1349 (1404)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1351 (1406)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1352 (1407)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1358 (1413)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1361 (1416)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1362 (1417)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1363 (1418)  rf=r size=128 type=f align=32 words (r142.0)
//.declare V1368 (1423)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1370 (1425)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1371 (1426)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1377 (1432)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1380 (1435)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1381 (1436)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1382 (1437)  rf=r size=128 type=f align=32 words (r138.0)
//.declare V1387 (1442)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1389 (1444)  rf=r size=128 type=f align=32 words (r148.0)
//.declare V1390 (1445)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1396 (1451)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1399 (1454)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1400 (1455)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1401 (1456)  rf=r size=128 type=f align=32 words (r136.0)
//.declare V1406 (1461)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1408 (1463)  rf=r size=128 type=f align=32 words (r148.0)
//.declare V1409 (1464)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1415 (1470)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1418 (1473)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1419 (1474)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1420 (1475)  rf=r size=128 type=f align=32 words (r132.0)
//.declare V1423 (1478)  rf=r size=8 type=d alias=V0043+0 align=4 words (r5.10)
//.declare V1424 (1479)  rf=r size=8 type=uq align=4 words (r4.3)
//.declare V1427 (1482)  rf=r size=8 type=d alias=V1424+0 align=4 words (r4.6)
//.declare P32 (1483)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P33 (1484)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1428 (1485)  rf=r size=8 type=q alias=V0043+0 align=4 words (r5.5)
//.declare V1435 (1492)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1436 (1493)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1441 (1498)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1442 (1499)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1447 (1504)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1448 (1505)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1453 (1510)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1454 (1511)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1455 (1512)  rf=r size=4 type=d align=2 words (r4.6)
//.declare P34 (1513)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1458 (1516)  rf=r size=256 type=q align=32 words (r30.0)
//.declare V1459 (1517)  rf=r size=128 type=d align=32 words (r34.0)
//.declare  (1518)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1461 (1520)  rf=r size=128 type=w alias=V1459+0 align=32 words (r34.0)
//.declare V1462 (1521)  rf=r size=64 type=w align=32 words (r38.0)
//.declare V1463 (1522)  rf=r size=64 type=w align=32 words (r41.0)
//.declare V1464 (1523)  rf=r size=64 type=w align=32 words (r8.0)
//.declare V1465 (1524)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1466 (1525)  rf=r size=128 type=w alias=V1465+0 align=32 words (r2.0)
//.declare  (1526)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1467 (1527)  rf=r size=128 type=d align=32 words (r24.0)
//.declare  (1528)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1469 (1530)  rf=r size=128 type=w alias=V1467+0 align=32 words (r24.0)
//.declare V1470 (1531)  rf=r size=64 type=w align=32 words (r10.0)
//.declare V1471 (1532)  rf=r size=64 type=w align=32 words (r40.0)
//.declare V1472 (1533)  rf=r size=64 type=w align=32 words (r8.0)
//.declare V1473 (1534)  rf=r size=128 type=ud align=32 words (r38.0)
//.declare V1474 (1535)  rf=r size=128 type=w alias=V1473+0 align=32 words (r38.0)
//.declare  (1536)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V1475 (1537)  rf=r size=128 type=d align=32 words (r14.0)
//.declare  (1538)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V1477 (1540)  rf=r size=128 type=w alias=V1475+0 align=32 words (r14.0)
//.declare V1478 (1541)  rf=r size=64 type=w align=32 words (r8.0)
//.declare V1479 (1542)  rf=r size=64 type=w align=32 words (r11.0)
//.declare V1480 (1543)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1481 (1544)  rf=r size=128 type=ud align=32 words (r20.0)
//.declare V1482 (1545)  rf=r size=128 type=w alias=V1481+0 align=32 words (r20.0)
//.declare  (1546)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V1483 (1547)  rf=r size=128 type=d align=32 words (r12.0)
//.declare  (1548)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V1485 (1550)  rf=r size=128 type=w alias=V1483+0 align=32 words (r12.0)
//.declare V1486 (1551)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V1487 (1552)  rf=r size=64 type=w align=32 words (r9.0)
//.declare V1491 (1556)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V1493 (1558)  rf=r size=256 type=uq alias=V1458+0 align=32 words (r30.0)
//.declare V1494 (1559)  rf=r size=256 type=uq align=32 words (r44.0)
//.declare V1496 (1561)  rf=r size=8 type=q align=4 words (r4.3)
//.declare V1497 (1562)  rf=r size=256 type=q align=32 words (r34.0)
//.declare V1501 (1566)  rf=r size=256 type=d align=32 words (r12.0)
//.declare V1503 (1568)  rf=r size=256 type=uq alias=V1497+0 align=32 words (r34.0)
//.declare V1504 (1569)  rf=r size=256 type=uq align=32 words (r40.0)
//.declare V1505 (1570)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1506 (1571)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1507 (1572)  rf=r size=128 type=ud align=32 words (r10.0)
//.declare V1508 (1573)  rf=r size=128 type=w alias=V1507+0 align=32 words (r10.0)
//.declare  (1574)  rf=r size=256 type=q align=32 words (r22.0)
//.declare V1512 (1578)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V1514 (1580)  rf=r size=256 type=uq alias=V1505+0 align=32 words (r12.0)
//.declare V1515 (1581)  rf=r size=256 type=uq align=32 words (r18.0)
//.declare V1516 (1582)  rf=r size=4 type=d align=2 words (r4.6)
//.declare P35 (1583)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1517 (1584)  rf=r size=4 type=d align=2 words (r4.6)
//.declare V1518 (1585)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1519 (1586)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1520 (1587)  rf=r size=8 type=q alias=V0046+0 align=4 words (r5.7)
//.declare V1523 (1590)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V1524 (1591)  rf=r size=128 type=d align=32 words (r24.0)
//.declare  (1592)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1526 (1594)  rf=r size=128 type=w alias=V1524+0 align=32 words (r24.0)
//.declare V1527 (1595)  rf=r size=64 type=w align=32 words (r11.0)
//.declare V1528 (1596)  rf=r size=64 type=w align=32 words (r40.0)
//.declare V1529 (1597)  rf=r size=64 type=w align=32 words (r5.0)
//.declare V1530 (1598)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1531 (1599)  rf=r size=128 type=w alias=V1530+0 align=32 words (r2.0)
//.declare  (1600)  rf=r size=256 type=q align=32 words (r7.0)
//.declare V1532 (1601)  rf=r size=128 type=d align=32 words (r34.0)
//.declare  (1602)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1534 (1604)  rf=r size=128 type=w alias=V1532+0 align=32 words (r34.0)
//.declare V1535 (1605)  rf=r size=64 type=w align=32 words (r8.0)
//.declare V1536 (1606)  rf=r size=64 type=w align=32 words (r10.0)
//.declare V1537 (1607)  rf=r size=64 type=w align=32 words (r5.0)
//.declare V1538 (1608)  rf=r size=128 type=ud align=32 words (r48.0)
//.declare V1539 (1609)  rf=r size=128 type=w alias=V1538+0 align=32 words (r48.0)
//.declare  (1610)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V1540 (1611)  rf=r size=128 type=d align=32 words (r32.0)
//.declare  (1612)  rf=r size=256 type=q align=32 words (r16.0)
//.declare V1542 (1614)  rf=r size=128 type=w alias=V1540+0 align=32 words (r32.0)
//.declare V1543 (1615)  rf=r size=64 type=w align=32 words (r5.0)
//.declare V1544 (1616)  rf=r size=64 type=w align=32 words (r9.0)
//.declare V1545 (1617)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1546 (1618)  rf=r size=128 type=ud align=32 words (r38.0)
//.declare V1547 (1619)  rf=r size=128 type=w alias=V1546+0 align=32 words (r38.0)
//.declare  (1620)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1548 (1621)  rf=r size=128 type=d align=32 words (r30.0)
//.declare  (1622)  rf=r size=256 type=q align=32 words (r20.0)
//.declare V1550 (1624)  rf=r size=128 type=w alias=V1548+0 align=32 words (r30.0)
//.declare V1551 (1625)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V1552 (1626)  rf=r size=64 type=w align=32 words (r7.0)
//.declare V1556 (1630)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V1558 (1632)  rf=r size=256 type=uq alias=V1523+0 align=32 words (r20.0)
//.declare V1559 (1633)  rf=r size=256 type=uq align=32 words (r44.0)
//.declare V1561 (1635)  rf=r size=8 type=q align=4 words (r4.3)
//.declare V1562 (1636)  rf=r size=256 type=q align=32 words (r30.0)
//.declare V1566 (1640)  rf=r size=256 type=d align=32 words (r34.0)
//.declare V1568 (1642)  rf=r size=256 type=uq alias=V1562+0 align=32 words (r30.0)
//.declare V1569 (1643)  rf=r size=256 type=uq align=32 words (r40.0)
//.declare V1570 (1644)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1571 (1645)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1572 (1646)  rf=r size=128 type=ud align=32 words (r10.0)
//.declare V1573 (1647)  rf=r size=128 type=w alias=V1572+0 align=32 words (r10.0)
//.declare  (1648)  rf=r size=256 type=q align=32 words (r22.0)
//.declare V1577 (1652)  rf=r size=256 type=d align=32 words (r8.0)
//.declare V1579 (1654)  rf=r size=256 type=uq alias=V1570+0 align=32 words (r12.0)
//.declare V1580 (1655)  rf=r size=256 type=uq align=32 words (r18.0)
//.declare P36 (1656)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1581 (1657)  rf=r size=4 type=f align=2 words (r4.7)
//.declare V1582 (1658)  rf=r size=4 type=f align=2 words (r4.6)
//.declare P37 (1659)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1584 (1661)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1587 (1664)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V1588 (1665)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1589 (1666)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P38 (1669)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P39 (1671)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1593 (1672)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1594 (1673)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1596 (1675)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1599 (1678)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1600 (1679)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1601 (1680)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P40 (1683)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P41 (1685)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1605 (1686)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1606 (1687)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1608 (1689)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1611 (1692)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1612 (1693)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1613 (1694)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P42 (1697)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P43 (1699)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1617 (1700)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1618 (1701)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1620 (1703)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1623 (1706)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1624 (1707)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1625 (1708)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P44 (1711)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P45 (1713)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1629 (1714)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1630 (1715)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P46 (1716)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1632 (1718)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1635 (1721)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V1636 (1722)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1637 (1723)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P47 (1726)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P48 (1728)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1641 (1729)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V1642 (1730)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1644 (1732)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1647 (1735)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1648 (1736)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1649 (1737)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P49 (1740)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P50 (1742)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1653 (1743)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1654 (1744)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1656 (1746)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1659 (1749)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1660 (1750)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1661 (1751)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P51 (1754)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P52 (1756)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1665 (1757)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1666 (1758)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1668 (1760)  rf=r size=128 type=f align=32 words (r2.0)
//.declare V1671 (1763)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V1672 (1764)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1673 (1765)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P53 (1768)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P54 (1770)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1677 (1771)  rf=r size=128 type=f align=32 words (r16.0)
//.declare V1678 (1772)  rf=r size=128 type=f align=32 words (r2.0)
//.declare P55 (1773)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P56 (1774)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V1679 (1775)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1680 (1776)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1681 (1777)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V1682 (1778)  rf=r size=128 type=d align=32 words (r124.0)
//.declare V1684 (1780)  rf=r size=256 type=ud alias=V1111+0 align=32 words (r128.0)
//.declare V1686 (1782)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1688 (1784)  rf=r size=64 type=w align=32 words (r127.0)
//.declare V1689 (1785)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1693 (1789)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1695 (1791)  rf=r size=64 type=w align=32 words (r126.0)
//.declare V1696 (1792)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1700 (1796)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1702 (1798)  rf=r size=64 type=w align=32 words (r132.0)
//.declare V1703 (1799)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1707 (1803)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1709 (1805)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1710 (1806)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1711 (1807)  rf=r size=8 type=q alias=V0036+0 align=4 words (r4.2)
//.declare V1714 (1810)  rf=r size=256 type=q align=32 words (r7.0)
//.declare V1716 (1812)  rf=r size=64 type=uw alias=V1709+0 align=32 words (r3.0)
//.declare V1720 (1816)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V1721 (1817)  rf=r size=128 type=d align=32 words (r22.0)
//.declare V1723 (1819)  rf=r size=64 type=uw alias=V1702+0 align=32 words (r132.0)
//.declare V1727 (1823)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V1728 (1824)  rf=r size=128 type=d align=32 words (r20.0)
//.declare V1729 (1825)  rf=r size=128 type=d align=32 words (r24.0)
//.declare V1731 (1827)  rf=r size=64 type=uw alias=V1695+0 align=32 words (r126.0)
//.declare V1735 (1831)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V1736 (1832)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V1737 (1833)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1738 (1834)  rf=r size=64 type=uw alias=V1688+0 align=32 words (r127.0)
//.declare V1739 (1835)  rf=r size=256 type=uq alias=V1714+0 align=32 words (r7.0)
//.declare V1740 (1836)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1741 (1837)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1742 (1838)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V1743 (1839)  rf=r size=128 type=d align=32 words (r124.0)
//.declare V1746 (1842)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1748 (1844)  rf=r size=64 type=w align=32 words (r127.0)
//.declare V1749 (1845)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1752 (1848)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1754 (1850)  rf=r size=64 type=w align=32 words (r126.0)
//.declare V1755 (1851)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1758 (1854)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1760 (1856)  rf=r size=64 type=w align=32 words (r132.0)
//.declare V1761 (1857)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1764 (1860)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1766 (1862)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1767 (1863)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1768 (1864)  rf=r size=8 type=q alias=V0035+0 align=4 words (r4.1)
//.declare V1771 (1867)  rf=r size=256 type=q align=32 words (r12.0)
//.declare V1773 (1869)  rf=r size=64 type=uw alias=V1766+0 align=32 words (r3.0)
//.declare V1777 (1873)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V1778 (1874)  rf=r size=128 type=d align=32 words (r22.0)
//.declare V1780 (1876)  rf=r size=64 type=uw alias=V1760+0 align=32 words (r132.0)
//.declare V1784 (1880)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V1785 (1881)  rf=r size=128 type=d align=32 words (r20.0)
//.declare V1786 (1882)  rf=r size=128 type=d align=32 words (r24.0)
//.declare V1788 (1884)  rf=r size=64 type=uw alias=V1754+0 align=32 words (r126.0)
//.declare V1792 (1888)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V1793 (1889)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V1794 (1890)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1795 (1891)  rf=r size=64 type=uw alias=V1748+0 align=32 words (r127.0)
//.declare V1796 (1892)  rf=r size=256 type=uq alias=V1771+0 align=32 words (r12.0)
//.declare V1797 (1893)  rf=r size=4 type=d align=32 words (r6.0)
//.declare V1798 (1894)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1799 (1895)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V1800 (1896)  rf=r size=128 type=d align=32 words (r124.0)
//.declare V1803 (1899)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1805 (1901)  rf=r size=64 type=w align=32 words (r127.0)
//.declare V1806 (1902)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1809 (1905)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1811 (1907)  rf=r size=64 type=w align=32 words (r126.0)
//.declare V1812 (1908)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1815 (1911)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1817 (1913)  rf=r size=64 type=w align=32 words (r128.0)
//.declare V1818 (1914)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1821 (1917)  rf=r size=128 type=ud align=32 words (r2.0)
//.declare V1823 (1919)  rf=r size=64 type=w align=32 words (r3.0)
//.declare V1824 (1920)  rf=r size=4 type=ud align=32 words (r255.0)
//.declare V1825 (1921)  rf=r size=8 type=q alias=V0034+0 align=4 words (r4.0)
//.declare V1828 (1924)  rf=r size=256 type=q align=32 words (r8.0)
//.declare V1830 (1926)  rf=r size=64 type=uw alias=V1823+0 align=32 words (r3.0)
//.declare V1834 (1930)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V1835 (1931)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V1837 (1933)  rf=r size=64 type=uw alias=V1817+0 align=32 words (r128.0)
//.declare V1841 (1937)  rf=r size=128 type=d align=32 words (r6.0)
//.declare V1842 (1938)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V1843 (1939)  rf=r size=128 type=d align=32 words (r20.0)
//.declare V1845 (1941)  rf=r size=64 type=uw alias=V1811+0 align=32 words (r126.0)
//.declare V1849 (1945)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V1850 (1946)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V1851 (1947)  rf=r size=128 type=d align=32 words (r2.0)
//.declare V1852 (1948)  rf=r size=64 type=uw alias=V1805+0 align=32 words (r127.0)
//.declare V1853 (1949)  rf=r size=256 type=uq alias=V1828+0 align=32 words (r8.0)
//.declare  (1950)  rf=r size=4 type=ud alias=SR+28 align=2 words (r254.7) Output
//.declare  (1951)  rf=r size=64 type=ud align=32 words (r240.0)
//.declare  (1952)  rf=r size=8 type=f align=8 words (r4.12)
//.declare  (1953)  rf=r size=8 type=ud align=8 words (r7.4)
//.declare  (1954)  rf=r size=8 type=f align=8 words (r4.12)
//.declare  (1955)  rf=r size=8 type=ud align=8 words (r7.4)
//.declare  (1956)  rf=r size=8 type=d align=8 words (r4.8)
//.declare  (1957)  rf=r size=4 type=d align=2 words (r4.8)
//.declare  (1958)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1959)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1960)  rf=r size=4 type=f align=2 words (r4.9)
//.declare  (1961)  rf=r size=4 type=f align=2 words (r4.10)
//.declare  (1962)  rf=r size=4 type=f align=2 words (r4.10)
//.declare  (1963)  rf=r size=4 type=f align=2 words (r4.10)
//.declare  (1964)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (1965)  rf=r size=128 type=ud align=32 words (r10.0)
//.declare  (1966)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (1967)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare  (1968)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare  (1969)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare  (1970)  rf=r size=128 type=ud align=32 words (r18.0)
//.declare  (1971)  rf=r size=128 type=ud align=32 words (r20.0)
//.declare  (1972)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1973)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (1974)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1975)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1976)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1977)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (1978)  rf=r size=2 type=w align=1 words (r4.12)
//.declare  (1979)  rf=r size=128 type=ud align=32 words (r16.0)
//.declare  (1980)  rf=r size=128 type=ud align=32 words (r20.0)
//.declare  (1981)  rf=r size=128 type=ud align=32 words (r12.0)
//.declare  (1982)  rf=r size=128 type=ud align=32 words (r14.0)
//.declare  (1983)  rf=r size=128 type=ud align=32 words (r44.0)
//.declare  (1984)  rf=r size=128 type=ud align=32 words (r28.0)
//.declare  (1985)  rf=r size=128 type=w align=32 words (r84.0)
//.declare  (1986)  rf=r size=128 type=w align=32 words (r82.0)
//.declare  (1987)  rf=r size=128 type=w align=32 words (r80.0)
//.declare  (1988)  rf=r size=128 type=w align=32 words (r78.0)
//.declare  (1989)  rf=r size=128 type=w align=32 words (r76.0)
//.declare  (1990)  rf=r size=128 type=w align=32 words (r74.0)
//.declare  (1991)  rf=r size=128 type=w alias=V0759+0 align=32 words (r8.0)
//.declare  (1992)  rf=r size=128 type=w alias=V0759+0 align=32 words (r8.0)
//.declare  (1999)  rf=r size=128 type=w alias=V0762+0 align=32 words (r38.0)
//.declare  (2000)  rf=r size=128 type=w alias=V0762+0 align=32 words (r38.0)
//.declare  (2007)  rf=r size=128 type=w alias=V0807+0 align=32 words (r8.0)
//.declare  (2008)  rf=r size=128 type=w alias=V0807+0 align=32 words (r8.0)
//.declare  (2015)  rf=r size=128 type=w alias=V0810+0 align=32 words (r20.0)
//.declare  (2016)  rf=r size=128 type=w alias=V0810+0 align=32 words (r20.0)
//.declare  (2023)  rf=r size=128 type=ud align=32 words (r10.0)
//.declare  (2024)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2025)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2026)  rf=r size=64 type=w align=32 words (r86.0)
//.declare  (2027)  rf=r size=64 type=w align=32 words (r34.0)
//.declare  (2028)  rf=r size=64 type=w align=32 words (r84.0)
//.declare  (2029)  rf=r size=64 type=w align=32 words (r24.0)
//.declare  (2030)  rf=r size=64 type=w align=32 words (r82.0)
//.declare  (2031)  rf=r size=64 type=w align=32 words (r10.0)
//.declare  (2032)  rf=r size=64 type=w align=32 words (r37.0)
//.declare  (2033)  rf=r size=64 type=w align=32 words (r8.0)
//.declare  (2034)  rf=r size=64 type=w align=32 words (r11.0)
//.declare  (2035)  rf=r size=64 type=w align=32 words (r36.0)
//.declare  (2036)  rf=r size=64 type=w align=32 words (r35.0)
//.declare  (2037)  rf=r size=64 type=w align=32 words (r38.0)
//.declare  (2038)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2039)  rf=r size=64 type=w align=32 words (r40.0)
//.declare  (2040)  rf=r size=64 type=w align=32 words (r9.0)
//.declare  (2041)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2042)  rf=r size=64 type=w align=32 words (r62.0)
//.declare  (2043)  rf=r size=64 type=w align=32 words (r18.0)
//.declare  (2044)  rf=r size=64 type=w align=32 words (r60.0)
//.declare  (2045)  rf=r size=64 type=w align=32 words (r16.0)
//.declare  (2046)  rf=r size=64 type=w align=32 words (r58.0)
//.declare  (2047)  rf=r size=64 type=w align=32 words (r10.0)
//.declare  (2048)  rf=r size=64 type=w align=32 words (r42.0)
//.declare  (2049)  rf=r size=64 type=w align=32 words (r8.0)
//.declare  (2050)  rf=r size=64 type=w align=32 words (r11.0)
//.declare  (2051)  rf=r size=64 type=w align=32 words (r20.0)
//.declare  (2052)  rf=r size=64 type=w align=32 words (r19.0)
//.declare  (2053)  rf=r size=64 type=w align=32 words (r22.0)
//.declare  (2054)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2055)  rf=r size=64 type=w align=32 words (r32.0)
//.declare  (2056)  rf=r size=64 type=w align=32 words (r9.0)
//.declare  (2057)  rf=r size=128 type=w alias=V0861+0 align=32 words (r8.0)
//.declare  (2058)  rf=r size=128 type=w alias=V0861+0 align=32 words (r8.0)
//.declare  (2065)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2066)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2067)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2068)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2069)  rf=r size=64 type=w align=32 words (r12.0)
//.declare  (2070)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2071)  rf=r size=64 type=w align=32 words (r12.0)
//.declare  (2072)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2073)  rf=r size=64 type=w align=32 words (r8.0)
//.declare  (2074)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2075)  rf=r size=128 type=w alias=V0917+0 align=32 words (r8.0)
//.declare  (2076)  rf=r size=128 type=w alias=V0917+0 align=32 words (r8.0)
//.declare  (2083)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2084)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2085)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2086)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2087)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2088)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2089)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2090)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2091)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2092)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2093)  rf=r size=128 type=w alias=V0967+0 align=32 words (r8.0)
//.declare  (2094)  rf=r size=128 type=w alias=V0967+0 align=32 words (r8.0)
//.declare  (2101)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2102)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2103)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2104)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2105)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2106)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2107)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2108)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2109)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2110)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2111)  rf=r size=128 type=w alias=V1018+0 align=32 words (r8.0)
//.declare  (2112)  rf=r size=128 type=w alias=V1018+0 align=32 words (r8.0)
//.declare  (2119)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2120)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2121)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2122)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2123)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2124)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2125)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2126)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2127)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2128)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2129)  rf=r size=128 type=w alias=V1069+0 align=32 words (r8.0)
//.declare  (2130)  rf=r size=128 type=w alias=V1069+0 align=32 words (r8.0)
//.declare  (2137)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2138)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2139)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2140)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2141)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2142)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2143)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2144)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2145)  rf=r size=64 type=w align=32 words (r2.0)
//.declare  (2146)  rf=r size=64 type=w align=32 words (r1.0)
//.declare  (2147)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2148)  rf=r size=128 type=ud align=32 words (r8.0)
//.declare  (2149)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2150)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2151)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2152)  rf=r size=128 type=ud align=32 words (r16.0)
//.declare  (2153)  rf=r size=128 type=ud align=32 words (r20.0)
//.declare  (2154)  rf=r size=128 type=ud align=32 words (r22.0)
//.declare  (2155)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2156)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2157)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2158)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2159)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2160)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2161)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2162)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2163)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2164)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2165)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2166)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2167)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2168)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2169)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2170)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2171)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2172)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (2173)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2174)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2175)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2176)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2177)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2178)  rf=r size=128 type=uw align=32 words (r1.0)
//.declare  (2181)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2182)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2185)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2186)  rf=r size=128 type=q align=32 words (r8.0)
//.declare  (2187)  rf=r size=128 type=q align=32 words (r20.0)
//.declare  (2188)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2191)  rf=r size=128 type=q align=32 words (r26.0)
//.declare  (2192)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2193)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2194)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2197)  rf=r size=128 type=q align=32 words (r26.0)
//.declare  (2198)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2199)  rf=r size=128 type=q align=32 words (r22.0)
//.declare  (2200)  rf=r size=128 type=q align=32 words (r20.0)
//.declare  (2203)  rf=r size=128 type=q align=32 words (r20.0)
//.declare  (2204)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2207)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2208)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2211)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2212)  rf=r size=128 type=q align=32 words (r8.0)
//.declare  (2213)  rf=r size=128 type=uq align=32 words (r138.0)
//.declare  (2214)  rf=r size=128 type=uq align=32 words (r136.0)
//.declare  (2217)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2218)  rf=r size=128 type=q align=32 words (r8.0)
//.declare  (2219)  rf=r size=128 type=q align=32 words (r186.0)
//.declare  (2220)  rf=r size=128 type=q align=32 words (r184.0)
//.declare  (2221)  rf=r size=128 type=q align=32 words (r198.0)
//.declare  (2222)  rf=r size=128 type=q align=32 words (r196.0)
//.declare  (2223)  rf=r size=128 type=q align=32 words (r210.0)
//.declare  (2224)  rf=r size=128 type=q align=32 words (r208.0)
//.declare  (2225)  rf=r size=128 type=b align=32 words (r46.0)
//.declare  (2226)  rf=r size=128 type=b align=32 words (r8.0)
//.declare  (2227)  rf=r size=128 type=b align=32 words (r44.0)
//.declare  (2228)  rf=r size=128 type=b align=32 words (r14.0)
//.declare  (2229)  rf=r size=128 type=b align=32 words (r42.0)
//.declare  (2230)  rf=r size=128 type=b align=32 words (r40.0)
//.declare  (2231)  rf=r size=128 type=b align=32 words (r38.0)
//.declare  (2232)  rf=r size=128 type=b align=32 words (r24.0)
//.declare  (2233)  rf=r size=128 type=q align=32 words (r170.0)
//.declare  (2234)  rf=r size=128 type=q align=32 words (r168.0)
//.declare  (2235)  rf=r size=128 type=q align=32 words (r174.0)
//.declare  (2236)  rf=r size=128 type=q align=32 words (r172.0)
//.declare  (2237)  rf=r size=128 type=q align=32 words (r178.0)
//.declare  (2238)  rf=r size=128 type=q align=32 words (r176.0)
//.declare  (2239)  rf=r size=128 type=q align=32 words (r182.0)
//.declare  (2240)  rf=r size=128 type=q align=32 words (r180.0)
//.declare  (2241)  rf=r size=128 type=q align=32 words (r190.0)
//.declare  (2242)  rf=r size=128 type=q align=32 words (r188.0)
//.declare  (2243)  rf=r size=128 type=q align=32 words (r194.0)
//.declare  (2244)  rf=r size=128 type=q align=32 words (r192.0)
//.declare  (2245)  rf=r size=128 type=q align=32 words (r202.0)
//.declare  (2246)  rf=r size=128 type=q align=32 words (r200.0)
//.declare  (2247)  rf=r size=128 type=q align=32 words (r206.0)
//.declare  (2248)  rf=r size=128 type=q align=32 words (r204.0)
//.declare  (2249)  rf=r size=128 type=q align=32 words (r214.0)
//.declare  (2250)  rf=r size=128 type=q align=32 words (r212.0)
//.declare  (2251)  rf=r size=128 type=q align=32 words (r218.0)
//.declare  (2252)  rf=r size=128 type=q align=32 words (r216.0)
//.declare  (2253)  rf=r size=128 type=q align=32 words (r222.0)
//.declare  (2254)  rf=r size=128 type=q align=32 words (r220.0)
//.declare  (2255)  rf=r size=128 type=q align=32 words (r226.0)
//.declare  (2256)  rf=r size=128 type=q align=32 words (r224.0)
//.declare  (2257)  rf=r size=128 type=q align=32 words (r230.0)
//.declare  (2258)  rf=r size=128 type=q align=32 words (r228.0)
//.declare  (2259)  rf=r size=128 type=q align=32 words (r234.0)
//.declare  (2260)  rf=r size=128 type=q align=32 words (r232.0)
//.declare  (2261)  rf=r size=128 type=q align=32 words (r238.0)
//.declare  (2262)  rf=r size=128 type=q align=32 words (r236.0)
//.declare  (2265)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2266)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2267)  rf=r size=128 type=b align=32 words (r24.0)
//.declare  (2268)  rf=r size=128 type=b align=32 words (r1.0)
//.declare  (2269)  rf=r size=128 type=q align=32 words (r84.0)
//.declare  (2270)  rf=r size=128 type=q align=32 words (r24.0)
//.declare  (2271)  rf=r size=128 type=q align=32 words (r82.0)
//.declare  (2272)  rf=r size=128 type=q align=32 words (r80.0)
//.declare  (2273)  rf=r size=128 type=q align=32 words (r78.0)
//.declare  (2274)  rf=r size=128 type=q align=32 words (r35.0)
//.declare  (2275)  rf=r size=128 type=q align=32 words (r76.0)
//.declare  (2276)  rf=r size=128 type=q align=32 words (r74.0)
//.declare  (2277)  rf=r size=128 type=q align=32 words (r72.0)
//.declare  (2278)  rf=r size=128 type=q align=32 words (r70.0)
//.declare  (2279)  rf=r size=128 type=q align=32 words (r44.0)
//.declare  (2280)  rf=r size=128 type=q align=32 words (r42.0)
//.declare  (2281)  rf=r size=128 type=q align=32 words (r60.0)
//.declare  (2282)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2283)  rf=r size=128 type=q align=32 words (r58.0)
//.declare  (2284)  rf=r size=128 type=q align=32 words (r44.0)
//.declare  (2285)  rf=r size=128 type=q align=32 words (r42.0)
//.declare  (2286)  rf=r size=128 type=q align=32 words (r40.0)
//.declare  (2287)  rf=r size=128 type=q align=32 words (r38.0)
//.declare  (2288)  rf=r size=128 type=q align=32 words (r36.0)
//.declare  (2289)  rf=r size=128 type=q align=32 words (r34.0)
//.declare  (2290)  rf=r size=128 type=q align=32 words (r32.0)
//.declare  (2291)  rf=r size=128 type=q align=32 words (r30.0)
//.declare  (2292)  rf=r size=128 type=q align=32 words (r24.0)
//.declare  (2295)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2296)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2297)  rf=r size=128 type=q align=32 words (r2.0)
//.declare  (2298)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2299)  rf=r size=128 type=q align=32 words (r2.0)
//.declare  (2300)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2301)  rf=r size=128 type=q align=32 words (r2.0)
//.declare  (2302)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2305)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2306)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2307)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2308)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2309)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2310)  rf=r size=128 type=q align=32 words (r17.0)
//.declare  (2311)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2312)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2315)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2316)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2317)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2318)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2319)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2320)  rf=r size=128 type=q align=32 words (r17.0)
//.declare  (2321)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2322)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2325)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2326)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2327)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2328)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2329)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2330)  rf=r size=128 type=q align=32 words (r17.0)
//.declare  (2331)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2332)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2335)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2336)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2337)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2338)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2339)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2340)  rf=r size=128 type=q align=32 words (r17.0)
//.declare  (2341)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2342)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2343)  rf=r size=128 type=q align=32 words (r152.0)
//.declare  (2344)  rf=r size=128 type=q align=32 words (r150.0)
//.declare  (2345)  rf=r size=128 type=q align=32 words (r156.0)
//.declare  (2346)  rf=r size=128 type=q align=32 words (r154.0)
//.declare  (2347)  rf=r size=128 type=q align=32 words (r160.0)
//.declare  (2348)  rf=r size=128 type=q align=32 words (r158.0)
//.declare  (2349)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2350)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2351)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2352)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2353)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2354)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2355)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2356)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2357)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2358)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2359)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2360)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2361)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2362)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2363)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2364)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2365)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2366)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2367)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2368)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2369)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2370)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2371)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2372)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2373)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2374)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2375)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2376)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2377)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2378)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2379)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2380)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2381)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2382)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2383)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2384)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2385)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2386)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2387)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2388)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2389)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2390)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2391)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2392)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2393)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2394)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2395)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2396)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2397)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2398)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2399)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2400)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2401)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2402)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2403)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2404)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2405)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2406)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2407)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2408)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2409)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2410)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2411)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2412)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2413)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2414)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2415)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2416)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2417)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2418)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2419)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2420)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2421)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2422)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2423)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2424)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2425)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2426)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2427)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2428)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2429)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2430)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2431)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2432)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2433)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2434)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2435)  rf=r size=128 type=uq align=32 words (r10.0)
//.declare  (2436)  rf=r size=128 type=uq align=32 words (r8.0)
//.declare  (2439)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (2440)  rf=r size=128 type=q align=32 words (r8.0)
//.declare  (2441)  rf=r size=128 type=q align=32 words (r148.0)
//.declare  (2442)  rf=r size=128 type=q align=32 words (r134.0)
//.declare  (2459)  rf=r size=128 type=q align=32 words (r38.0)
//.declare  (2460)  rf=r size=128 type=q align=32 words (r36.0)
//.declare  (2461)  rf=r size=128 type=b align=32 words (r14.0)
//.declare  (2462)  rf=r size=128 type=b align=32 words (r12.0)
//.declare  (2463)  rf=r size=128 type=b align=32 words (r38.0)
//.declare  (2464)  rf=r size=128 type=b align=32 words (r24.0)
//.declare  (2465)  rf=r size=128 type=b align=32 words (r16.0)
//.declare  (2466)  rf=r size=128 type=b align=32 words (r1.0)
//.declare  (2469)  rf=r size=128 type=q align=32 words (r9.0)
//.declare  (2470)  rf=r size=128 type=q align=32 words (r7.0)
//.declare  (2471)  rf=r size=128 type=b align=32 words (r36.0)
//.declare  (2472)  rf=r size=128 type=b align=32 words (r34.0)
//.declare  (2473)  rf=r size=128 type=b align=32 words (r38.0)
//.declare  (2474)  rf=r size=128 type=b align=32 words (r24.0)
//.declare  (2475)  rf=r size=128 type=b align=32 words (r16.0)
//.declare  (2476)  rf=r size=128 type=b align=32 words (r1.0)
//.declare  (2477)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2478)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2479)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2480)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2481)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2482)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2483)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2484)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2487)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2488)  rf=r size=128 type=q align=32 words (r11.0)
//.declare  (2489)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2490)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2491)  rf=r size=128 type=q align=32 words (r11.0)
//.declare  (2492)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2495)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2496)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2497)  rf=r size=128 type=q align=32 words (r11.0)
//.declare  (2498)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2501)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (2502)  rf=r size=128 type=q align=32 words (r13.0)
//.declare  (2503)  rf=r size=128 type=q align=32 words (r11.0)
//.declare  (2504)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2507)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2508)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2509)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2510)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2511)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2512)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2513)  rf=r size=128 type=uq align=32 words (r9.0)
//.declare  (2514)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2517)  rf=r size=128 type=q align=32 words (r9.0)
//.declare  (2518)  rf=r size=128 type=q align=32 words (r7.0)
//.declare  (2519)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2520)  rf=r size=128 type=q align=32 words (r9.0)
//.declare  (2521)  rf=r size=128 type=q align=32 words (r7.0)
//.declare  (2522)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2525)  rf=r size=128 type=q align=32 words (r18.0)
//.declare  (2526)  rf=r size=128 type=q align=32 words (r9.0)
//.declare  (2527)  rf=r size=128 type=q align=32 words (r7.0)
//.declare  (2528)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2531)  rf=r size=128 type=q align=32 words (r16.0)
//.declare  (2532)  rf=r size=128 type=q align=32 words (r9.0)
//.declare  (2533)  rf=r size=128 type=q align=32 words (r7.0)
//.declare  (2534)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2537)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2538)  rf=r size=128 type=uq align=32 words (r5.0)
//.declare  (2539)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2540)  rf=r size=128 type=uq align=32 words (r5.0)
//.declare  (2541)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2542)  rf=r size=128 type=uq align=32 words (r5.0)
//.declare  (2543)  rf=r size=128 type=uq align=32 words (r7.0)
//.declare  (2544)  rf=r size=128 type=uq align=32 words (r5.0)
//.declare  (2547)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2548)  rf=r size=128 type=q align=32 words (r5.0)
//.declare  (2549)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2550)  rf=r size=128 type=q align=32 words (r5.0)
//.declare  (2551)  rf=r size=128 type=q align=32 words (r3.0)
//.declare  (2552)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2555)  rf=r size=128 type=q align=32 words (r14.0)
//.declare  (2556)  rf=r size=128 type=q align=32 words (r5.0)
//.declare  (2557)  rf=r size=128 type=q align=32 words (r3.0)
//.declare  (2558)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2561)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (2562)  rf=r size=128 type=q align=32 words (r5.0)
//.declare  (2563)  rf=r size=128 type=q align=32 words (r3.0)
//.declare  (2564)  rf=r size=128 type=q align=32 words (r1.0)
//.declare  (2567)  rf=r size=128 type=ud alias=+0 align=32 words (r138.0)
//.declare  (2568)  rf=r size=128 type=ud alias=+0 align=32 words (r136.0)
//.declare  (2569)  rf=r size=128 type=w alias=+0 align=32 words (r46.0)
//.declare  (2570)  rf=r size=128 type=w alias=+0 align=32 words (r8.0)
//.declare  (2571)  rf=r size=128 type=d alias=+0 align=32 words (r46.0)
//.declare  (2572)  rf=r size=128 type=d alias=+0 align=32 words (r8.0)
//.declare  (2573)  rf=r size=128 type=w alias=+0 align=32 words (r44.0)
//.declare  (2574)  rf=r size=128 type=w alias=+0 align=32 words (r14.0)
//.declare  (2575)  rf=r size=128 type=d alias=+0 align=32 words (r44.0)
//.declare  (2576)  rf=r size=128 type=d alias=+0 align=32 words (r14.0)
//.declare  (2577)  rf=r size=128 type=w alias=+0 align=32 words (r42.0)
//.declare  (2578)  rf=r size=128 type=w alias=+0 align=32 words (r40.0)
//.declare  (2579)  rf=r size=128 type=d alias=+0 align=32 words (r42.0)
//.declare  (2580)  rf=r size=128 type=d alias=+0 align=32 words (r40.0)
//.declare  (2581)  rf=r size=128 type=w alias=+0 align=32 words (r38.0)
//.declare  (2582)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2583)  rf=r size=128 type=d alias=+0 align=32 words (r38.0)
//.declare  (2584)  rf=r size=128 type=d alias=+0 align=32 words (r24.0)
//.declare  (2585)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2586)  rf=r size=128 type=w alias=+0 align=32 words (r1.0)
//.declare  (2587)  rf=r size=128 type=d alias=+0 align=32 words (r24.0)
//.declare  (2588)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2589)  rf=r size=128 type=uq alias=+0 align=32 words (r84.0)
//.declare  (2590)  rf=r size=128 type=uq alias=+0 align=32 words (r24.0)
//.declare  (2591)  rf=r size=128 type=w alias=+0 align=32 words (r84.0)
//.declare  (2592)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2593)  rf=r size=128 type=uq alias=+0 align=32 words (r82.0)
//.declare  (2594)  rf=r size=128 type=uq alias=+0 align=32 words (r80.0)
//.declare  (2595)  rf=r size=128 type=w alias=+0 align=32 words (r82.0)
//.declare  (2596)  rf=r size=128 type=w alias=+0 align=32 words (r80.0)
//.declare  (2597)  rf=r size=128 type=uq alias=+0 align=32 words (r78.0)
//.declare  (2598)  rf=r size=128 type=uq alias=+0 align=32 words (r35.0)
//.declare  (2599)  rf=r size=128 type=w alias=+0 align=32 words (r78.0)
//.declare  (2600)  rf=r size=128 type=w alias=+0 align=32 words (r35.0)
//.declare  (2601)  rf=r size=128 type=uq alias=+0 align=32 words (r76.0)
//.declare  (2602)  rf=r size=128 type=uq alias=+0 align=32 words (r74.0)
//.declare  (2603)  rf=r size=128 type=w alias=+0 align=32 words (r76.0)
//.declare  (2604)  rf=r size=128 type=w alias=+0 align=32 words (r74.0)
//.declare  (2605)  rf=r size=128 type=uq alias=+0 align=32 words (r72.0)
//.declare  (2606)  rf=r size=128 type=uq alias=+0 align=32 words (r70.0)
//.declare  (2607)  rf=r size=128 type=w alias=+0 align=32 words (r72.0)
//.declare  (2608)  rf=r size=128 type=w alias=+0 align=32 words (r70.0)
//.declare  (2609)  rf=r size=128 type=uq alias=+0 align=32 words (r44.0)
//.declare  (2610)  rf=r size=128 type=uq alias=+0 align=32 words (r42.0)
//.declare  (2611)  rf=r size=128 type=w alias=+0 align=32 words (r44.0)
//.declare  (2612)  rf=r size=128 type=w alias=+0 align=32 words (r42.0)
//.declare  (2613)  rf=r size=128 type=uq alias=+0 align=32 words (r60.0)
//.declare  (2614)  rf=r size=128 type=uq alias=+0 align=32 words (r16.0)
//.declare  (2615)  rf=r size=128 type=w alias=+0 align=32 words (r60.0)
//.declare  (2616)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2617)  rf=r size=128 type=uq alias=+0 align=32 words (r58.0)
//.declare  (2618)  rf=r size=128 type=uq alias=+0 align=32 words (r44.0)
//.declare  (2619)  rf=r size=128 type=w alias=+0 align=32 words (r58.0)
//.declare  (2620)  rf=r size=128 type=w alias=+0 align=32 words (r44.0)
//.declare  (2621)  rf=r size=128 type=uq alias=+0 align=32 words (r42.0)
//.declare  (2622)  rf=r size=128 type=uq alias=+0 align=32 words (r40.0)
//.declare  (2623)  rf=r size=128 type=w alias=+0 align=32 words (r42.0)
//.declare  (2624)  rf=r size=128 type=w alias=+0 align=32 words (r40.0)
//.declare  (2625)  rf=r size=128 type=uq alias=+0 align=32 words (r38.0)
//.declare  (2626)  rf=r size=128 type=uq alias=+0 align=32 words (r36.0)
//.declare  (2627)  rf=r size=128 type=w alias=+0 align=32 words (r38.0)
//.declare  (2628)  rf=r size=128 type=w alias=+0 align=32 words (r36.0)
//.declare  (2629)  rf=r size=128 type=uq alias=+0 align=32 words (r34.0)
//.declare  (2630)  rf=r size=128 type=uq alias=+0 align=32 words (r32.0)
//.declare  (2631)  rf=r size=128 type=w alias=+0 align=32 words (r34.0)
//.declare  (2632)  rf=r size=128 type=w alias=+0 align=32 words (r32.0)
//.declare  (2633)  rf=r size=128 type=uq alias=+0 align=32 words (r30.0)
//.declare  (2634)  rf=r size=128 type=uq alias=+0 align=32 words (r24.0)
//.declare  (2635)  rf=r size=128 type=w alias=+0 align=32 words (r30.0)
//.declare  (2636)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2637)  rf=r size=128 type=uq alias=+0 align=32 words (r2.0)
//.declare  (2638)  rf=r size=128 type=uq alias=+0 align=32 words (r14.0)
//.declare  (2639)  rf=r size=128 type=w alias=+0 align=32 words (r2.0)
//.declare  (2640)  rf=r size=128 type=w alias=+0 align=32 words (r14.0)
//.declare  (2641)  rf=r size=128 type=uq alias=+0 align=32 words (r2.0)
//.declare  (2642)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2643)  rf=r size=128 type=w alias=+0 align=32 words (r2.0)
//.declare  (2644)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2645)  rf=r size=128 type=uq alias=+0 align=32 words (r2.0)
//.declare  (2646)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2647)  rf=r size=128 type=w alias=+0 align=32 words (r2.0)
//.declare  (2648)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2649)  rf=r size=128 type=uq alias=+0 align=32 words (r13.0)
//.declare  (2650)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2651)  rf=r size=128 type=w alias=+0 align=32 words (r13.0)
//.declare  (2652)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2653)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2654)  rf=r size=128 type=uq alias=+0 align=32 words (r17.0)
//.declare  (2655)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2656)  rf=r size=128 type=w alias=+0 align=32 words (r17.0)
//.declare  (2657)  rf=r size=128 type=uq alias=+0 align=32 words (r16.0)
//.declare  (2658)  rf=r size=128 type=uq alias=+0 align=32 words (r18.0)
//.declare  (2659)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2660)  rf=r size=128 type=w alias=+0 align=32 words (r18.0)
//.declare  (2661)  rf=r size=128 type=uq alias=+0 align=32 words (r13.0)
//.declare  (2662)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2663)  rf=r size=128 type=w alias=+0 align=32 words (r13.0)
//.declare  (2664)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2665)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2666)  rf=r size=128 type=uq alias=+0 align=32 words (r17.0)
//.declare  (2667)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2668)  rf=r size=128 type=w alias=+0 align=32 words (r17.0)
//.declare  (2669)  rf=r size=128 type=uq alias=+0 align=32 words (r16.0)
//.declare  (2670)  rf=r size=128 type=uq alias=+0 align=32 words (r18.0)
//.declare  (2671)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2672)  rf=r size=128 type=w alias=+0 align=32 words (r18.0)
//.declare  (2673)  rf=r size=128 type=uq alias=+0 align=32 words (r13.0)
//.declare  (2674)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2675)  rf=r size=128 type=w alias=+0 align=32 words (r13.0)
//.declare  (2676)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2677)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2678)  rf=r size=128 type=uq alias=+0 align=32 words (r17.0)
//.declare  (2679)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2680)  rf=r size=128 type=w alias=+0 align=32 words (r17.0)
//.declare  (2681)  rf=r size=128 type=uq alias=+0 align=32 words (r16.0)
//.declare  (2682)  rf=r size=128 type=uq alias=+0 align=32 words (r18.0)
//.declare  (2683)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2684)  rf=r size=128 type=w alias=+0 align=32 words (r18.0)
//.declare  (2685)  rf=r size=128 type=uq alias=+0 align=32 words (r13.0)
//.declare  (2686)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2687)  rf=r size=128 type=w alias=+0 align=32 words (r13.0)
//.declare  (2688)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2689)  rf=r size=128 type=uq alias=+0 align=32 words (r15.0)
//.declare  (2690)  rf=r size=128 type=uq alias=+0 align=32 words (r17.0)
//.declare  (2691)  rf=r size=128 type=w alias=+0 align=32 words (r15.0)
//.declare  (2692)  rf=r size=128 type=w alias=+0 align=32 words (r17.0)
//.declare  (2693)  rf=r size=128 type=uq alias=+0 align=32 words (r16.0)
//.declare  (2694)  rf=r size=128 type=uq alias=+0 align=32 words (r18.0)
//.declare  (2695)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2696)  rf=r size=128 type=w alias=+0 align=32 words (r18.0)
//.declare  (2697)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2698)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2699)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2700)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2701)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2702)  rf=r size=128 type=ud alias=+0 align=32 words (r170.0)
//.declare  (2703)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2704)  rf=r size=128 type=ud alias=+0 align=32 words (r168.0)
//.declare  (2705)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2706)  rf=r size=128 type=ud alias=+0 align=32 words (r186.0)
//.declare  (2707)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2708)  rf=r size=128 type=ud alias=+0 align=32 words (r184.0)
//.declare  (2709)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2710)  rf=r size=128 type=ud alias=+0 align=32 words (r174.0)
//.declare  (2711)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2712)  rf=r size=128 type=ud alias=+0 align=32 words (r172.0)
//.declare  (2713)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2714)  rf=r size=128 type=ud alias=+0 align=32 words (r198.0)
//.declare  (2715)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2716)  rf=r size=128 type=ud alias=+0 align=32 words (r196.0)
//.declare  (2717)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2718)  rf=r size=128 type=ud alias=+0 align=32 words (r178.0)
//.declare  (2719)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2720)  rf=r size=128 type=ud alias=+0 align=32 words (r176.0)
//.declare  (2721)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2722)  rf=r size=128 type=ud alias=+0 align=32 words (r210.0)
//.declare  (2723)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2724)  rf=r size=128 type=ud alias=+0 align=32 words (r208.0)
//.declare  (2725)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2726)  rf=r size=128 type=ud alias=+0 align=32 words (r182.0)
//.declare  (2727)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2728)  rf=r size=128 type=ud alias=+0 align=32 words (r180.0)
//.declare  (2729)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2730)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2731)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2732)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2733)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2734)  rf=r size=128 type=ud alias=+0 align=32 words (r190.0)
//.declare  (2735)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2736)  rf=r size=128 type=ud alias=+0 align=32 words (r188.0)
//.declare  (2737)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2738)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2739)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2740)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2741)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2742)  rf=r size=128 type=ud alias=+0 align=32 words (r194.0)
//.declare  (2743)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2744)  rf=r size=128 type=ud alias=+0 align=32 words (r192.0)
//.declare  (2745)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2746)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2747)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2748)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2749)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2750)  rf=r size=128 type=ud alias=+0 align=32 words (r202.0)
//.declare  (2751)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2752)  rf=r size=128 type=ud alias=+0 align=32 words (r200.0)
//.declare  (2753)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2754)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2755)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2756)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2757)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2758)  rf=r size=128 type=ud alias=+0 align=32 words (r206.0)
//.declare  (2759)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2760)  rf=r size=128 type=ud alias=+0 align=32 words (r204.0)
//.declare  (2761)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2762)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2763)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2764)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2765)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2766)  rf=r size=128 type=ud alias=+0 align=32 words (r214.0)
//.declare  (2767)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2768)  rf=r size=128 type=ud alias=+0 align=32 words (r212.0)
//.declare  (2769)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2770)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2771)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2772)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2773)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2774)  rf=r size=128 type=ud alias=+0 align=32 words (r218.0)
//.declare  (2775)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2776)  rf=r size=128 type=ud alias=+0 align=32 words (r216.0)
//.declare  (2777)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2778)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2779)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2780)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2781)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2782)  rf=r size=128 type=ud alias=+0 align=32 words (r222.0)
//.declare  (2783)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2784)  rf=r size=128 type=ud alias=+0 align=32 words (r220.0)
//.declare  (2785)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2786)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2787)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2788)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2789)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2790)  rf=r size=128 type=ud alias=+0 align=32 words (r226.0)
//.declare  (2791)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2792)  rf=r size=128 type=ud alias=+0 align=32 words (r224.0)
//.declare  (2793)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2794)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2795)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2796)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2797)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2798)  rf=r size=128 type=ud alias=+0 align=32 words (r230.0)
//.declare  (2799)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2800)  rf=r size=128 type=ud alias=+0 align=32 words (r228.0)
//.declare  (2801)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2802)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2803)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2804)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2805)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2806)  rf=r size=128 type=ud alias=+0 align=32 words (r234.0)
//.declare  (2807)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2808)  rf=r size=128 type=ud alias=+0 align=32 words (r232.0)
//.declare  (2809)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2810)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2811)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2812)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2813)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2814)  rf=r size=128 type=ud alias=+0 align=32 words (r238.0)
//.declare  (2815)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2816)  rf=r size=128 type=ud alias=+0 align=32 words (r236.0)
//.declare  (2817)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (2818)  rf=r size=128 type=ud alias=+0 align=32 words (r14.0)
//.declare  (2819)  rf=r size=128 type=ud alias=+0 align=32 words (r8.0)
//.declare  (2820)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (2821)  rf=r size=128 type=uq alias=+0 align=32 words (r148.0)
//.declare  (2822)  rf=r size=128 type=uq alias=+0 align=32 words (r134.0)
//.declare  (2823)  rf=r size=128 type=w alias=+0 align=32 words (r14.0)
//.declare  (2824)  rf=r size=128 type=w alias=+0 align=32 words (r12.0)
//.declare  (2825)  rf=r size=128 type=d alias=+0 align=32 words (r14.0)
//.declare  (2826)  rf=r size=128 type=d alias=+0 align=32 words (r12.0)
//.declare  (2827)  rf=r size=128 type=w alias=+0 align=32 words (r38.0)
//.declare  (2828)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2829)  rf=r size=128 type=d alias=+0 align=32 words (r38.0)
//.declare  (2830)  rf=r size=128 type=d alias=+0 align=32 words (r24.0)
//.declare  (2831)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2832)  rf=r size=128 type=w alias=+0 align=32 words (r1.0)
//.declare  (2833)  rf=r size=128 type=d alias=+0 align=32 words (r16.0)
//.declare  (2834)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2835)  rf=r size=128 type=w alias=+0 align=32 words (r36.0)
//.declare  (2836)  rf=r size=128 type=w alias=+0 align=32 words (r34.0)
//.declare  (2837)  rf=r size=128 type=d alias=+0 align=32 words (r36.0)
//.declare  (2838)  rf=r size=128 type=d alias=+0 align=32 words (r34.0)
//.declare  (2839)  rf=r size=128 type=w alias=+0 align=32 words (r38.0)
//.declare  (2840)  rf=r size=128 type=w alias=+0 align=32 words (r24.0)
//.declare  (2841)  rf=r size=128 type=d alias=+0 align=32 words (r38.0)
//.declare  (2842)  rf=r size=128 type=d alias=+0 align=32 words (r24.0)
//.declare  (2843)  rf=r size=128 type=w alias=+0 align=32 words (r16.0)
//.declare  (2844)  rf=r size=128 type=w alias=+0 align=32 words (r1.0)
//.declare  (2845)  rf=r size=128 type=d alias=+0 align=32 words (r16.0)
//.declare  (2846)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2847)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2848)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2849)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2850)  rf=r size=128 type=ud alias=+0 align=32 words (r152.0)
//.declare  (2851)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2852)  rf=r size=128 type=ud alias=+0 align=32 words (r150.0)
//.declare  (2853)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2854)  rf=r size=128 type=ud alias=+0 align=32 words (r156.0)
//.declare  (2855)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2856)  rf=r size=128 type=ud alias=+0 align=32 words (r154.0)
//.declare  (2857)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2858)  rf=r size=128 type=ud alias=+0 align=32 words (r160.0)
//.declare  (2859)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2860)  rf=r size=128 type=ud alias=+0 align=32 words (r158.0)
//.declare  (2861)  rf=r size=128 type=d alias=+0 align=32 words (r11.0)
//.declare  (2862)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2863)  rf=r size=128 type=d alias=+0 align=32 words (r11.0)
//.declare  (2864)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2865)  rf=r size=128 type=d alias=+0 align=32 words (r11.0)
//.declare  (2866)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2867)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2868)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2869)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2870)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2871)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2872)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2873)  rf=r size=128 type=ud alias=+0 align=32 words (r9.0)
//.declare  (2874)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2875)  rf=r size=128 type=d alias=+0 align=32 words (r7.0)
//.declare  (2876)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2877)  rf=r size=128 type=d alias=+0 align=32 words (r7.0)
//.declare  (2878)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2879)  rf=r size=128 type=d alias=+0 align=32 words (r7.0)
//.declare  (2880)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2881)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2882)  rf=r size=128 type=ud alias=+0 align=32 words (r5.0)
//.declare  (2883)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2884)  rf=r size=128 type=ud alias=+0 align=32 words (r5.0)
//.declare  (2885)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2886)  rf=r size=128 type=ud alias=+0 align=32 words (r5.0)
//.declare  (2887)  rf=r size=128 type=ud alias=+0 align=32 words (r7.0)
//.declare  (2888)  rf=r size=128 type=ud alias=+0 align=32 words (r5.0)
//.declare  (2889)  rf=r size=128 type=d alias=+0 align=32 words (r3.0)
//.declare  (2890)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2891)  rf=r size=128 type=d alias=+0 align=32 words (r3.0)
//.declare  (2892)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2893)  rf=r size=128 type=d alias=+0 align=32 words (r3.0)
//.declare  (2894)  rf=r size=128 type=d alias=+0 align=32 words (r1.0)
//.declare  (2895)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2896)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2897)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2898)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2899)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2900)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2901)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2902)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2903)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2904)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2905)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2906)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2907)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2908)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2909)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2910)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2911)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2912)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2913)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2914)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2915)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2916)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2917)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2918)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2919)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2920)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2921)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2922)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2923)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2924)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2925)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2926)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2927)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2928)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2929)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2930)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2931)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2932)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2933)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2934)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2935)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2936)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2937)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2938)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2939)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2940)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2941)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2942)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2943)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2944)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2945)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2946)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2947)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2948)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2949)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2950)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2951)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2952)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2953)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2954)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2955)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2956)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2957)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare  (2958)  rf=r size=8 type=ud align=2 words (r255.0)
//.declare be_fp (2959)  rf=r size=4 type=ud align=2 words (r255.3)
//.declare be_sp (2960)  rf=r size=4 type=ud align=2 words (r255.2)
//.declare SR (2961)  rf=r size=64 type=ud align=32 words (r254.0)
//.declare VCE_SAVE (2962)  rf=r size=8256 type=ud align=32 words (r124.0)
//.declare  (2963)  rf=r size=7872 type=ud align=32 words
//.declare  (2964)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2965)  rf=f128  size=16 type=uw align=1 words
//.declare  (2966)  rf=r size=7872 type=ud align=32 words
//.declare  (2967)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2968)  rf=f128  size=16 type=uw align=1 words
//.declare  (2969)  rf=r size=7872 type=ud align=32 words
//.declare  (2970)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2971)  rf=f128  size=16 type=uw align=1 words
//.declare  (2972)  rf=r size=7872 type=ud align=32 words
//.declare  (2973)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2974)  rf=f128  size=16 type=uw align=1 words
//.declare  (2975)  rf=r size=7872 type=ud align=32 words
//.declare  (2976)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2977)  rf=f128  size=16 type=uw align=1 words
//.declare  (2978)  rf=r size=7872 type=ud align=32 words
//.declare  (2979)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2980)  rf=f128  size=16 type=uw align=1 words
//.declare  (2981)  rf=r size=7872 type=ud align=32 words
//.declare  (2982)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2983)  rf=f128  size=16 type=uw align=1 words
//.declare  (2984)  rf=r size=7872 type=ud align=32 words
//.declare  (2985)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2986)  rf=f128  size=16 type=uw align=1 words
//.declare  (2987)  rf=r size=7872 type=ud align=32 words
//.declare  (2988)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2989)  rf=f128  size=16 type=uw align=1 words
//.declare  (2990)  rf=r size=7872 type=ud align=32 words
//.declare  (2991)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2992)  rf=f128  size=16 type=uw align=1 words
//.declare  (2993)  rf=r size=7872 type=ud align=32 words
//.declare  (2994)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2995)  rf=f128  size=16 type=uw align=1 words
//.declare  (2996)  rf=r size=7872 type=ud align=32 words
//.declare  (2997)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (2998)  rf=f128  size=16 type=uw align=1 words
//.declare  (2999)  rf=r size=7872 type=ud align=32 words
//.declare  (3000)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3001)  rf=f128  size=16 type=uw align=1 words
//.declare  (3002)  rf=r size=7872 type=ud align=32 words
//.declare  (3003)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3004)  rf=f128  size=16 type=uw align=1 words
//.declare  (3005)  rf=r size=7872 type=ud align=32 words
//.declare  (3006)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3007)  rf=f128  size=16 type=uw align=1 words
//.declare  (3008)  rf=r size=7872 type=ud align=32 words
//.declare  (3009)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3010)  rf=f128  size=16 type=uw align=1 words
//.declare  (3011)  rf=r size=7872 type=ud align=32 words
//.declare  (3012)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3013)  rf=f128  size=16 type=uw align=1 words
//.declare  (3014)  rf=r size=7872 type=ud align=32 words
//.declare  (3015)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3016)  rf=f128  size=16 type=uw align=1 words
//.declare  (3017)  rf=r size=7872 type=ud align=32 words
//.declare  (3018)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3019)  rf=f128  size=16 type=uw align=1 words
//.declare  (3020)  rf=r size=7872 type=ud align=32 words
//.declare  (3021)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3022)  rf=f128  size=16 type=uw align=1 words
//.declare  (3023)  rf=r size=7872 type=ud align=32 words
//.declare  (3024)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3025)  rf=f128  size=16 type=uw align=1 words
//.declare  (3026)  rf=r size=7872 type=ud align=32 words
//.declare  (3027)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3028)  rf=f128  size=16 type=uw align=1 words
//.declare  (3029)  rf=r size=7872 type=ud align=32 words
//.declare  (3030)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3031)  rf=f128  size=16 type=uw align=1 words
//.declare  (3032)  rf=r size=7872 type=ud align=32 words
//.declare  (3033)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3034)  rf=f128  size=16 type=uw align=1 words
//.declare  (3035)  rf=r size=7872 type=ud align=32 words
//.declare  (3036)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3037)  rf=f128  size=16 type=uw align=1 words
//.declare  (3038)  rf=r size=7872 type=ud align=32 words
//.declare  (3039)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3040)  rf=f128  size=16 type=uw align=1 words
//.declare  (3041)  rf=r size=7872 type=ud align=32 words
//.declare  (3042)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3043)  rf=f128  size=16 type=uw align=1 words
//.declare  (3044)  rf=r size=7872 type=ud align=32 words
//.declare  (3045)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3046)  rf=f128  size=16 type=uw align=1 words
//.declare  (3047)  rf=r size=7872 type=ud align=32 words
//.declare  (3048)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3049)  rf=f128  size=16 type=uw align=1 words
//.declare  (3050)  rf=r size=7872 type=ud align=32 words
//.declare  (3051)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3052)  rf=f128  size=16 type=uw align=1 words
//.declare  (3053)  rf=r size=7872 type=ud align=32 words
//.declare  (3054)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3055)  rf=f128  size=16 type=uw align=1 words
//.declare  (3056)  rf=r size=7872 type=ud align=32 words
//.declare  (3057)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3058)  rf=f128  size=16 type=uw align=1 words
//.declare  (3059)  rf=r size=7872 type=ud align=32 words
//.declare  (3060)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3061)  rf=f128  size=16 type=uw align=1 words
//.declare  (3062)  rf=r size=7872 type=ud align=32 words
//.declare  (3063)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3064)  rf=f128  size=16 type=uw align=1 words
//.declare  (3065)  rf=r size=7872 type=ud align=32 words
//.declare  (3066)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3067)  rf=f128  size=16 type=uw align=1 words
//.declare  (3068)  rf=r size=7872 type=ud align=32 words
//.declare  (3069)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3070)  rf=f128  size=16 type=uw align=1 words
//.declare  (3071)  rf=r size=7872 type=ud align=32 words
//.declare  (3072)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3073)  rf=f128  size=16 type=uw align=1 words
//.declare  (3074)  rf=r size=7872 type=ud align=32 words
//.declare  (3075)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3076)  rf=f128  size=16 type=uw align=1 words
//.declare  (3077)  rf=r size=7872 type=ud align=32 words
//.declare  (3078)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3079)  rf=f128  size=16 type=uw align=1 words
//.declare  (3080)  rf=r size=7872 type=ud align=32 words
//.declare  (3081)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3082)  rf=f128  size=16 type=uw align=1 words
//.declare  (3083)  rf=r size=7872 type=ud align=32 words
//.declare  (3084)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3085)  rf=f128  size=16 type=uw align=1 words
//.declare  (3086)  rf=r size=7872 type=ud align=32 words
//.declare  (3087)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3088)  rf=f128  size=16 type=uw align=1 words
//.declare  (3089)  rf=r size=7872 type=ud align=32 words
//.declare  (3090)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3091)  rf=f128  size=16 type=uw align=1 words
//.declare  (3092)  rf=r size=7872 type=ud align=32 words
//.declare  (3093)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3094)  rf=f128  size=16 type=uw align=1 words
//.declare  (3095)  rf=r size=7872 type=ud align=32 words
//.declare  (3096)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3097)  rf=f128  size=16 type=uw align=1 words
//.declare  (3098)  rf=r size=7872 type=ud align=32 words
//.declare  (3099)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3100)  rf=f128  size=16 type=uw align=1 words
//.declare  (3101)  rf=r size=7872 type=ud align=32 words
//.declare  (3102)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3103)  rf=f128  size=16 type=uw align=1 words
//.declare  (3104)  rf=r size=7872 type=ud align=32 words
//.declare  (3105)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3106)  rf=f128  size=16 type=uw align=1 words
//.declare  (3107)  rf=r size=7872 type=ud align=32 words
//.declare  (3108)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3109)  rf=f128  size=16 type=uw align=1 words
//.declare  (3110)  rf=r size=7872 type=ud align=32 words
//.declare  (3111)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3112)  rf=f128  size=16 type=uw align=1 words
//.declare  (3113)  rf=r size=7872 type=ud align=32 words
//.declare  (3114)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3115)  rf=f128  size=16 type=uw align=1 words
//.declare  (3116)  rf=r size=7872 type=ud align=32 words
//.declare  (3117)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3118)  rf=f128  size=16 type=uw align=1 words
//.declare  (3119)  rf=r size=7872 type=ud align=32 words
//.declare  (3120)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3121)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3122)  rf=r size=7872 type=ud align=32 words
//.declare  (3123)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3124)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3125)  rf=r size=7872 type=ud align=32 words
//.declare  (3126)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3127)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3128)  rf=r size=7872 type=ud align=32 words
//.declare  (3129)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3130)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3131)  rf=r size=7872 type=ud align=32 words
//.declare  (3132)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3133)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3134)  rf=r size=7872 type=ud align=32 words
//.declare  (3135)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3136)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3137)  rf=r size=7872 type=ud align=32 words
//.declare  (3138)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3139)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3140)  rf=r size=7872 type=ud align=32 words
//.declare  (3141)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3142)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3143)  rf=r size=7872 type=ud align=32 words
//.declare  (3144)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3145)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3146)  rf=r size=7872 type=ud align=32 words
//.declare  (3147)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3148)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3149)  rf=r size=7872 type=ud align=32 words
//.declare  (3150)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3151)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3152)  rf=r size=7872 type=ud align=32 words
//.declare  (3153)  rf=a size=32 type=uw align=1 words (a0.0)
//.declare  (3154)  rf=f128  size=16 type=uw align=1 words (f0.0)
//.declare  (3155)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare  (3156)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare  (3157)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare  (3158)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare  (3159)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3160)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3161)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3162)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3163)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3164)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3165)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3166)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3167)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3168)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3169)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3170)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3171)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3172)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3173)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3174)  rf=r size=16 type=ud align=2 words (r163.2)
//.declare  (3175)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3176)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3177)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3178)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3179)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3180)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3181)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3182)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3183)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3184)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3185)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3186)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3187)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3188)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3189)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3190)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3191)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3192)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3193)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3194)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3195)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3196)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3197)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3198)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3199)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3200)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3201)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3202)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3203)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3204)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3205)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3206)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3207)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3208)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3209)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3210)  rf=r size=16 type=ud align=2 words (r162.4)
//.declare  (3211)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3212)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3213)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3214)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3215)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3216)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3217)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3218)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3219)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3220)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3221)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3222)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3223)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3224)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3225)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3226)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3227)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3228)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3229)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3230)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3231)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3232)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3233)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3234)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3235)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3236)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3237)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3238)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3239)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3240)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3241)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3242)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3243)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3244)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3245)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3246)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3247)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3248)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3249)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3250)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3251)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3252)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3253)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3254)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3255)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3256)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3257)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3258)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3259)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3260)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3261)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3262)  rf=r size=128 type=ud align=32 words (r26.0)
//.declare  (3263)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3264)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3265)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3266)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3267)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3268)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3269)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3270)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3271)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3272)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3273)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3274)  rf=r size=64 type=ud align=32 words (r26.0)
//.declare  (3555)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3556)  rf=r size=4 type=ud align=32 words NoSpill Input_Output
//.declare  (3557)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3558)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3559)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3560)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3561)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3562)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3563)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3564)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3565)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3566)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3567)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3568)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3569)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3570)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3571)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3572)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3573)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3574)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3575)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3576)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3577)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3578)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3579)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3580)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3581)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3582)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3583)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3584)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3585)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3586)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3587)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3588)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3589)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3590)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3591)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3592)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3593)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3594)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3595)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3596)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3597)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3598)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3599)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3600)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3601)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3602)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3603)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3604)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3605)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3606)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3607)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3608)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3609)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3610)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3611)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3612)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3613)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3614)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3615)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3616)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3617)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3618)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3619)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3620)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3621)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3622)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3623)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3624)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3625)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3626)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3627)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3628)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3629)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3630)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3631)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3632)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3633)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3634)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3635)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3636)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3637)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3638)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3639)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3640)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3641)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3642)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3643)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3644)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3645)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3646)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3647)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3648)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3649)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3650)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3651)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3652)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3653)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3654)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3655)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3656)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3657)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3658)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3659)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3660)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3661)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3662)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3663)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3664)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3665)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3666)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3667)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3668)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3669)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3670)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3671)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3672)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3673)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3674)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3675)  rf=r size=256 type=ud align=32 words (r4.0)
//.declare  (3676)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3677)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3678)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3679)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3680)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3681)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3682)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare  (3683)  rf=r size=64 type=ud align=32 words (r4.0)
//.declare r0 (3684)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (3685)  rf=r size=64 type=ud align=32 words (r255.0)
//.declare inlineRegFromTDL (3686)  rf=r size=32 type=ud align=2 words (r1.0)
//.declare inlineRegExpectedLocation (3687)  rf=r size=32 type=ud align=2 words (r4.0)
//.declare  (3688)  rf=r size=128 type=ud align=32 words (r1.0)
//.declare  (3689)  rf=r size=64 type=ud align=32 words (r3.0)
//.declare  (3690)  rf=r size=128 type=ud align=32 words (r5.0)
//.declare  (3691)  rf=r size=32 type=ud align=2 words (r7.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0064    | :w x 32  |   0x40 | r1       | pti[tid]+0x0     |
// | V0065    | :w x 32  |   0x40 | r2       | pti[tid]+0x40    |
// | V0066    | :w x 32  |   0x40 | r3       | pti[tid]+0x80    |
// | V0034    | :uq      |    0x8 | r4       | inline+0x0       |
// | V0035    | :uq      |    0x8 | r4+0x8   | inline+0x8       |
// | V0036    | :uq      |    0x8 | r4+0x10  | inline+0x10      |
// | V0037    | :uq      |    0x8 | r4+0x18  | inline+0x18      |
// | V0038    | :uq      |    0x8 | r5       | cti+0x20         |
// | V0039    | :uq      |    0x8 | r5+0x8   | cti+0x28         |
// | V0040    | :uq      |    0x8 | r5+0x10  | cti+0x30         |
// | V0041    | :uq      |    0x8 | r5+0x18  | cti+0x38         |
// | V0042    | :uq      |    0x8 | r5+0x20  | cti+0x40         |
// | V0043    | :uq      |    0x8 | r5+0x28  | cti+0x48         |
// | V0044    | :uq      |    0x8 | r5+0x30  | cti+0x50         |
// | V0046    | :uq      |    0x8 | r5+0x38  | cti+0x58         |
// | V0047    | :uq      |    0x8 | r6       | cti+0x60         |
// | V0048    | :uq      |    0x8 | r6+0x8   | cti+0x68         |
// | V0049    | :uq      |    0x8 | r6+0x10  | cti+0x70         |
// | V0050    | :uq      |    0x8 | r6+0x18  | cti+0x78         |
// | V0045    | :d       |    0x4 | r6+0x20  | cti+0x80         |
// | V0051    | :d       |    0x4 | r6+0x24  | cti+0x84         |
// | V0052    | :d       |    0x4 | r6+0x28  | cti+0x88         |
// | V0053    | :d       |    0x4 | r6+0x2C  | cti+0x8C         |
// | V0054    | :d       |    0x4 | r6+0x30  | cti+0x90         |
// | V0055    | :d       |    0x4 | r6+0x34  | cti+0x94         |
// | V0056    | :d       |    0x4 | r6+0x38  | cti+0x98         |
// | V0057    | :d       |    0x4 | r6+0x3C  | cti+0x9C         |
// | V0058    | :d       |    0x4 | r7       | cti+0xA0         |
// | V0059    | :d       |    0x4 | r7+0x4   | cti+0xA4         |
// | V0067    | :uq      |    0x8 | r7+0x8   | cti+0xA8         |
// | V0063    | :d x 3   |    0xC | r7+0x10  | cti+0xB0         |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
per_thread_prolog:
(W)     mov (16|M0)              r255.0<1>:ud  0x0:ud                                                //  ALU pipe: int; 
(W)     and (1|M0)               r255.2<1>:ud  r0.0<0;1,0>:ud    0xFFFFFFC0:ud                       //  ALU pipe: int; 
(W)     and (1|M0)               r255.0<1>:uw  r0.4<0;1,0>:uw    0xFF:uw                             //  ALU pipe: int; 
(W)     add (1|M0)               r255.2<1>:ud  r255.2<0;1,0>:ud  0xA0:ud              {I@2}          //  ALU pipe: int; 
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
(W)     load.ugm.d32x32t.a32.ca.cc (1|M0)  r5:2 bti[255][r255:1]   {I@1,$2} // ex_desc:0xFF000000; desc:0x6229E500 // 
(W)     load.ugm.d32x8t.a32.ca.cc (1|M0)  r7:1  bti[255][r255:1+0x80]  {$3} // ex_desc:0xFF080000; desc:0x6219C500 // 
// B002: Preds:{B001},  Succs:{B003, B146}
// _main:
(W)     mov (16|M0)              r253.0<1>:ud  r0.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; 
        sync.nop                             null                             {Compacted,$3.src}     // 
(W)     mov (1|M0)               r255.3<1>:f   0x0:f                               {$2.src}          //  (0x00000000:f); ALU pipe: float; 
(W)     mov (16|M0)              r254.0<1>:f   r253.0<1;1,0>:f                  {Compacted,I@1}      //  ALU pipe: float; 
(W)     mov (1|M0)               r255.2<1>:f   0x100:f                                               //  (0x00000100:f); ALU pipe: float; 
(W)     and (1|M0)               r254.7<1>:ud  r253.5<0;1,0>:ud  0xFFFFFC00:ud              {F@2}    //  ALU pipe: int; 
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; 
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     and (1|M0)               r4.9<1>:ud    msg0.0<0;1,0>:ud  0xFF:uw              {A@1}          //  ALU pipe: int; $2
(W)     and (1|M0)               r4.10<1>:ud   sr0.0<0;1,0>:ud   0x7F:uw              {A@1}          //  ALU pipe: int; $3
(W)     and (1|M0)               r4.11<1>:ud   r4.10<0;1,0>:ud   7:w               {A@1}             //  ALU pipe: int; $5
(W)     asr (1|M0)               r4.12<1>:ud   r4.10<0;1,0>:ud   1:w                                 //  ALU pipe: int; $6
(W)     mov (1|M0)               r4.8<1>:d     -8:w                                                  //  ALU pipe: int; $7
(W)     shl (1|M0)               r4.9<1>:ud    r4.9<0;1,0>:ud    0x6:uw                              //  ALU pipe: int; $4
(W)     mov (1|M0)               r8.0<1>:uq    0x0:uw                                                //  ALU pipe: int; $13
(W)     mov (1|M0)               r162.2<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32: __devicelib_ConvertFToBF16INTEL; ALU pipe: int; $17
(W)     mov (1|M0)               r162.3<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32_HI: __devicelib_ConvertFToBF16INTEL; ALU pipe: int; $17
(W)     bfn.(s0&s1|s2) (1|M0)    r4.10<1>:ud   r4.12<0;0>:ud     r4.8<0;0>:ud      r4.11<0>:ud      {I@5} //  ALU pipe: int; $7

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 130:  local_group_id * elems_per_group + local_id * elems_per_item;
(W)     shl (1|M0)               r4.8<1>:d     r253.1<0;1,0>:d   10:w                                //  ALU pipe: int; $40
(W)     mov (1|M0)               r162.0<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32: __devicelib_ConvertBF16ToFINTEL; ALU pipe: int; $18
(W)     mov (1|M0)               r162.1<1>:ud  0x6E10CA2E:ud                                         //  R_SYM_ADDR_32_HI: __devicelib_ConvertBF16ToFINTEL; ALU pipe: int; $18
(W)     or (1|M0)                r4.9<1>:ud    r4.9<0;1,0>:ud    r4.10<0;1,0>:ud  {I@4}              //  ALU pipe: int; $8
(W)     mul (1|M0)               acc0.0<1>:ud  r4.9<0;1,0>:ud    0x1480:uw              {I@1}        //  ALU pipe: int; $9
(W)     macl (1|M0)              r3.0<1>:ud    r4.9<0;1,0>:ud    0x21480:ud              {$1.dst}    //  ALU pipe: int; $10
(W)     add (1|M0)               r255.3<1>:uq  r7.1<0;1,0>:uq    r3.0<0;1,0>:ud   {@1,$3.dst}        //  ALU pipe: int; $10
(W)     mov (1|M0)               r255.2<1>:uq  r255.3<0;1,0>:uq                 {I@1}                //  ALU pipe: int; $11
(W)     add (1|M0)               r255.3<1>:uq  r255.3<0;1,0>:uq  0xA90:uw                            //  ALU pipe: int; $12
(W)     mov (1|M0)               r3.0<1>:uq    r255.2<0;1,0>:uq                 {Compacted,I@2}      //  ALU pipe: int; $14
(W)     store.ugm.d64x1t.a64 (1|M0)  [r3:1]     r8:1               {I@1,$4} // ex_desc:0x0; desc:0x2008784 // $16

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/nd_item.hpp

// Line 118:  LinId = Index[0] * Extent[1] + Index[1];
        sync.nop                             null                             {Compacted,$4.src}     // $30
        mul (32|M0)              r8.0<1>:d     r7.4<0;1,0>:d     r2.0<1;1,0>:uw   {$0.dst}           //  ALU pipe: int; $30
        add (32|M0)              r10.0<1>:d    r8.0<1;1,0>:d     r1.0<1;1,0>:uw   {I@1}              //  ALU pipe: int; $36

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 130:  local_group_id * elems_per_group + local_id * elems_per_item;
        shl (32|M0)              r2.0<1>:d     r10.0<1;1,0>:d    2:w               {Compacted,I@1}   //  ALU pipe: int; $41
        add (32|M0)              r142.0<1>:d   r4.8<0;1,0>:d     r2.0<1;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $42

// Line 132:  if (qkvz_elems_id >= qkvz_elems) {
        cmp (32|M0)   (lt)f0.0   null<1>:d     r142.0<1;1,0>:d   r7.0<0;1,0>:d    {I@1}              //  ALU pipe: int; $45
(~f0.0) goto (32|M0)                         _0_105            _0_105                                //  ALU pipe: int; $46
// B003: [inDivergent],  Preds:{B002},  Succs:{B004, B005}
_0_106:
(W)     mov (8|M0)               r1.0<1>:w     0x76543210:v                                          //  ALU pipe: int; $48
(W)     add (1|M0)               r4.4<1>:uq    r255.2<0;1,0>:uq  0x10:uw                             //  ALU pipe: int; $55
(W)     add (8|M0)               r1.8<1>:w     r1.0<1;1,0>:w     8:w               {I@2}             //  ALU pipe: int; $49
(W)     add (16|M0)              r1.16<1>:w    r1.0<1;1,0>:w     16:w               {I@1}            //  ALU pipe: int; $50
        mov (32|M0)              r148.0<1>:d   r1.0<1;1,0>:uw                   {I@1}                //  ALU pipe: int; $52
        shl (32|M0)              r2.0<1>:d     r148.0<1;1,0>:d   2:w               {Compacted,I@1}   //  ALU pipe: int; $53
        add (32|M0)              r8.0<1>:d     r2.0<1;1,0>:d     2048:w               {I@1}          //  ALU pipe: int; $54
        mov (16|M0)              r1.0<2>:ud    r8.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $56
        add (16|M0)              r128.0<1>:uq  r4.4<0;1,0>:uq    r1.0<2;1,0>:d    {I@1}              //  ALU pipe: int; $56
        mov (16|M16)             r1.0<2>:ud    r9.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $56
        add (16|M16)             r130.0<1>:uq  r4.4<0;1,0>:uq    r1.0<2;1,0>:d    {I@1}              //  ALU pipe: int; $56

// Line 140:  (token_indx != nullptr) ? token_indx[token_id] : token_id;
(W)     mov (1|M0)               r4.4<1>:uq    0x0:uw                                                //  ALU pipe: int; $60
(W)     cmp (32|M0)   (eq)f0.0   null<1>:d     r6.2<0;1,0>:d     r4.8<0;1,0>:d    {@1,$2.dst}        //  ALU pipe: int; $63
(W&f0.0) cmp (32|M0)  (eq)f0.0   null<1>:d     r6.3<0;1,0>:d     r4.9<0;1,0>:d                       //  ALU pipe: int; $64
(W&~f0.0) jmpi                               _0_107                                                  //  ALU pipe: int; $66
// B004: [inDivergent],  Preds:{B003},  Succs:{B006}
_0_108:
(W)     mov (1|M0)               r4.8<1>:d     r253.6<0;1,0>:d                                       //  ALU pipe: int; $68
(W)     jmpi                                 _0_109                                                  // $69
// B005: [inDivergent],  Preds:{B003},  Succs:{B006}
_0_107:
(W)     shl (1|M0)               r4.5<1>:q     r253.6<0;1,0>:ud  2:w                                 //  ALU pipe: int; $78
(W)     add (1|M0)               r2.0<1>:q     r4.5<0;1,0>:q     r6.1<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $79
(W)     load.ugm.d32x1t.a64 (1|M0)  r1:1        [r2:1]             {I@1,$5} // ex_desc:0x0; desc:0x2108580 // $80
(W)     mov (1|M0)               r4.8<1>:d     r1.0<0;1,0>:d                    {$5.dst}             //  ALU pipe: int; $81
// B006: [inDivergent],  Preds:{B005, B004},  Succs:{B007, B008}
_0_109:

// Line 144:  const int v_dim = head_v_dim * num_v_heads / num_k_heads;
(W)     cmp (32|M0)   (eq)f1.0   null<1>:d     r6.12<0;1,0>:d    0:w                                 //  ALU pipe: int; $85
(W&~f1.0) jmpi                               _0_110                                                  //  ALU pipe: int; $86
// B007: [inDivergent],  Preds:{B006},  Succs:{B009}
_0_111:
(W)     mov (1|M0)               r162.10<1>:d  -1:w                                                  //  ALU pipe: int; $88
(W)     jmpi                                 _0_112                                                  // $89
// B008: [inDivergent],  Preds:{B006},  Succs:{B009}
_0_110:
(W)     mul (1|M0)               acc0.0<1>:d   r6.15<0;1,0>:d    r6.28<0;1,0>:uw                     //  ALU pipe: int; $91
(W)     asr (1|M0)               r1.3<1>:d     r6.12<0;1,0>:d    31:w                                //  ALU pipe: int; $92
(W)     macl (1|M0)              r1.0<1>:d     r6.15<0;1,0>:d    r6.14<0;1,0>:d                      //  ALU pipe: int; $92
(W)     add (1|M0)               r4.9<1>:d     r1.3<0;1,0>:d     r6.12<0;1,0>:d   {I@2}              //  ALU pipe: int; $94
(W)     asr (1|M0)               r1.2<1>:d     r1.0<0;1,0>:d     31:w               {Compacted,I@2}  //  ALU pipe: int; $93
(W)     xor (1|M0)               r1.1<1>:d     r4.9<0;1,0>:d     r1.3<0;1,0>:d    {I@2}              //  ALU pipe: int; $95
(W)     add (1|M0)               r4.9<1>:d     r1.2<0;1,0>:d     r1.0<0;1,0>:d    {I@2}              //  ALU pipe: int; $96
(W)     xor (1|M0)               r1.5<1>:d     r4.9<0;1,0>:d     r1.2<0;1,0>:d    {I@1}              //  ALU pipe: int; $97
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $98
(W)     mov (1|M0)               r1.4<1>:f     r1.1<0;1,0>:ud                   {A@1}                //  ALU pipe: float; $99
(W)     mov (1|M0)               r1.0<1>:f     r1.5<0;1,0>:ud                   {I@2}                //  ALU pipe: float; $102
(W)     mov (1|M0)               r4.9<1>:ud    r1.4<0;1,0>:f                    {F@2}                //  ALU pipe: int; $100
(W)     math.inv (1|M0)          r1.6<1>:f     r1.4<0;1,0>:f                                         //  ALU pipe: math; $103
(W)     add (1|M0)               r7.4<1>:d     r1.1<0;1,0>:d     -r4.9<0;1,0>:d   {I@1}              //  ALU pipe: int; $101
(W)     mov (1|M0)               r4.9<1>:f     0xB4C00000:f                               {I@1}      //  ALU pipe: float; $104
(W)     mov (1|M0)               r4.12<1>:f    r7.4<0;1,0>:ud                                        //  ALU pipe: float; $109
(W)     mad (1|M0)               r1.8<1>:f     r1.6<0;0>:f       r4.9<0;0>:f       r1.6<0>:f        {A@1} //  ALU pipe: float; $104
(W)     mov (1|M0)               r4.9<1>:ud    r1.0<0;1,0>:f                    {F@1}                //  ALU pipe: int; $106
(W)     mul (1|M0)               r1.6<1>:f     r1.0<0;1,0>:f     r1.8<0;1,0>:f                       //  ALU pipe: float; $105
(W)     add (1|M0)               r7.5<1>:d     r1.5<0;1,0>:d     -r4.9<0;1,0>:d   {I@1}              //  ALU pipe: int; $107
(W)     mov (1|M0)               r1.7<1>:ud    r1.6<0;1,0>:f                    {F@1}                //  ALU pipe: int; $108
(W)     mov (1|M0)               r4.13<1>:f    r7.5<0;1,0>:ud                   {I@2}                //  ALU pipe: float; $109
(W)     mov (1|M0)               r1.6<1>:f     r1.7<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $111
(W)     mad (1|M0)               r1.0<1>:f     r1.0<0;0>:f       r1.6<0;0>:f       -r1.4<0>:f       {F@1} //  ALU pipe: float; $113
(W)     mad (1|M0)               r4.9<1>:f     r4.13<0;0>:f      r1.6<0;0>:f       -r4.12<0>:f       //  ALU pipe: float; $115
(W)     add (1|M0)               r4.9<1>:f     r1.0<0;1,0>:f     r4.9<0;1,0>:f    {F@1}              //  ALU pipe: float; $116
(W)     mul (1|M0)               r1.0<1>:f     r1.8<0;1,0>:f     r4.9<0;1,0>:f    {Compacted,F@1}    //  ALU pipe: float; $117
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $118
(W)     mov (1|M0)               r4.9<1>:ud    r1.0<0;1,0>:f                    {A@1}                //  ALU pipe: int; $119
(W)     xor (1|M0)               r1.6<1>:d     r1.3<0;1,0>:d     r1.2<0;1,0>:d                       //  ALU pipe: int; $121
(W)     add (1|M0)               r1.4<1>:d     r4.9<0;1,0>:d     r1.7<0;1,0>:d    {I@2}              //  ALU pipe: int; $120
(W)     mul (1|M0)               acc0.0<1>:d   r1.4<0;1,0>:d     r1.2<0;1,0>:uw   {I@1}              //  ALU pipe: int; $122
(W)     macl (1|M0)              r1.0<1>:d     r1.4<0;1,0>:d     r1.1<0;1,0>:d    {Compacted}        //  ALU pipe: int; $123
(W)     add (1|M0)               r4.9<1>:d     r1.5<0;1,0>:d     -r1.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $123
(W)     cmp (1|M0)    (ge)f2.0   r4.9<1>:ud    r4.9<0;1,0>:ud    r1.1<0;1,0>:ud   {I@1}              //  ALU pipe: int; $124
(W)     add3 (1|M0)              r4.9<1>:d     r1.4<0;0>:d       r1.6<0;0>:d       -r4.9<0>:d       {I@1} //  ALU pipe: int; $125
(W)     bfn.(s0^s1^s2) (1|M0)    r162.10<1>:ud  r4.9<0;0>:ud     r1.3<0;0>:ud      r1.2<0>:ud       {I@1} //  ALU pipe: int; $126
// B009: [inDivergent],  Preds:{B008, B007},  Succs:{B010, B011}
_0_112:

// Line 146:  const int qkvz_dim = q_dim + k_dim + v_dim + z_dim;
(W)     shl (1|M0)               r162.12<1>:d  r6.13<0;1,0>:d    1:w                                 //  ALU pipe: int; $130
(W)     add3 (1|M0)              r4.12<1>:d    r162.12<0;0>:d    r162.10<0;0>:d    r162.10<0>:d     {I@1} //  ALU pipe: int; $132
(W)     add (1|M0)               r4.9<1>:d     r162.12<0;1,0>:d  r162.10<0;1,0>:d                    //  ALU pipe: int; $131

// Line 148:  int k_heads_id = qkvz_elems_id / qkvz_dim;
(W)     cmp (32|M0)   (eq)f2.0   null<1>:d     r4.12<0;1,0>:d    0:w               {I@2}             //  ALU pipe: int; $135
(W&~f2.0) jmpi                               _0_113                                                  //  ALU pipe: int; $136
// B010: [inDivergent],  Preds:{B009},  Succs:{B012}
_0_114:
        mov (32|M0)              r140.0<1>:d   -1:w                               {Compacted}        //  ALU pipe: int; $138
(W)     jmpi                                 _0_115                                                  // $139
// B011: [inDivergent],  Preds:{B009},  Succs:{B012}
_0_113:
(W)     asr (1|M0)               r4.13<1>:d    r4.12<0;1,0>:d    31:w                                //  ALU pipe: int; $141
        shr (32|M0)              r14.0<1>:ud   r142.0<1;1,0>:ud  31:w                                //  ALU pipe: int; $142
(W)     add3 (1|M0)              r4.10<1>:d    r4.13<0;0>:d      r4.9<0;0>:d       r162.10<0>:d     {I@2} //  ALU pipe: int; $143
(W)     xor (1|M0)               r4.11<1>:d    r4.10<0;1,0>:d    r4.13<0;1,0>:d   {I@1}              //  ALU pipe: int; $144
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $145
(W)     mov (1|M0)               r4.14<1>:f    r4.11<0;1,0>:ud                  {A@1}                //  ALU pipe: float; $146
        mov (32|M0)              r8.0<1>:f     r142.0<1;1,0>:ud                                      //  ALU pipe: float; $149
(W)     mov (1|M0)               r4.10<1>:ud   r4.14<0;1,0>:f                   {F@2}                //  ALU pipe: int; $147
(W)     math.inv (1|M0)          r4.15<1>:f    r4.14<0;1,0>:f                                        //  ALU pipe: math; $150
(W)     add (1|M0)               r6.15<1>:d    r4.11<0;1,0>:d    -r4.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $148
(W)     mov (1|M0)               r4.10<1>:f    0xB4C00000:f                               {I@1}      //  ALU pipe: float; $151
        mov (32|M0)              r2.0<1>:ud    r8.0<1;1,0>:f                    {F@2}                //  ALU pipe: int; $153
(W)     mad (1|M0)               r4.10<1>:f    r4.15<0;0>:f      r4.10<0;0>:f      r4.15<0>:f       {A@1} //  ALU pipe: float; $151
        add (32|M0)              r16.0<1>:d    r142.0<1;1,0>:d   -r2.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $154
        mul (32|M0)              r10.0<1>:f    r8.0<1;1,0>:f     r4.10<0;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $152
(W)     mov (1|M0)               r4.15<1>:f    r6.15<0;1,0>:ud                                       //  ALU pipe: float; $156
        mov (32|M0)              r12.0<1>:ud   r10.0<1;1,0>:f                   {F@2}                //  ALU pipe: int; $155
        mov (32|M0)              r10.0<1>:f    r16.0<1;1,0>:ud                  {I@1}                //  ALU pipe: float; $157
        mov (32|M0)              r2.0<1>:f     r12.0<1;1,0>:ud                                       //  ALU pipe: float; $158
        mad (32|M0)              acc0.0<1>:f   r8.0<1;0>:f       r2.0<1;0>:f       -r4.14<0>:f      {F@1} //  ALU pipe: float; $160 R{} IR{}{E:4,E:1,E:2,},  R{r4,} IR{}{O:4,O:1,},  {BC=1}
        mad (32|M0)              acc2.0<1>:f   r10.0<1;0>:f      r2.0<1;0>:f       -r4.15<0>:f       //  ALU pipe: float; $162
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   acc2.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $163
        mul (32|M0)              r8.0<1>:f     r4.10<0;1,0>:f    acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $164
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $165
        mov (32|M0)              r2.0<1>:ud    r8.0<1;1,0>:f                    {A@1}                //  ALU pipe: int; $166
        add (32|M0)              r10.0<1>:d    r2.0<1;1,0>:d     r12.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $167
        xor (32|M0)              r12.0<1>:d    r14.0<1;1,0>:d    r4.13<0;1,0>:d                      //  ALU pipe: int; $168
(W)     mul (16|M0)              acc0.0<1>:d   r10.0<1;1,0>:d    r4.22<0;1,0>:uw  {I@2}              //  ALU pipe: int; $169
        macl (16|M0)             r8.0<1>:d     r10.0<1;1,0>:d    r4.11<0;1,0>:d   {Compacted}        //  ALU pipe: int; $169
(W)     mul (16|M16)             acc0.0<1>:d   r11.0<1;1,0>:d    r4.22<0;1,0>:uw                     //  ALU pipe: int; $169
        macl (16|M16)            r9.0<1>:d     r11.0<1;1,0>:d    r4.11<0;1,0>:d   {Compacted}        //  ALU pipe: int; $170
        add (32|M0)              r2.0<1>:d     r142.0<1;1,0>:d   -r8.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $170
        cmp (32|M0)   (ge)f2.0   r8.0<1>:ud    r2.0<1;1,0>:ud    r4.11<0;1,0>:ud  {I@1}              //  ALU pipe: int; $171
        add3 (32|M0)             r2.0<1>:d     r10.0<1;0>:d      r12.0<1;0>:d      -r8.0<1>:d       {Compacted,I@1} //  ALU pipe: int; $172 R{} IR{}{E:5,E:6,E:4,},  R{} IR{}{O:5,O:6,O:4,},  {BC=2}
        bfn.(s0^s1^s2) (32|M0)   r140.0<1>:ud  r2.0<1;0>:ud      r4.13<0;0>:ud     r14.0<1>:ud      {I@1} //  ALU pipe: int; $173 R{} IR{}{E:1,E:2,E:7,},  R{r4,} IR{}{O:1,O:7,},  {BC=1}
// B012: [inDivergent],  Preds:{B011, B010},  Succs:{B013, B014}
_0_115:

// Line 149:  int qkvz_dim_id = qkvz_elems_id % qkvz_dim;
(W)     mul (16|M0)              acc0.0<1>:d   r140.0<1;1,0>:d   r4.24<0;1,0>:uw  {I@1}              //  ALU pipe: int; $177
        macl (16|M0)             r2.0<1>:d     r140.0<1;1,0>:d   r4.12<0;1,0>:d                      //  ALU pipe: int; $177
(W)     mul (16|M16)             acc0.0<1>:d   r141.0<1;1,0>:d   r4.24<0;1,0>:uw                     //  ALU pipe: int; $177
        macl (16|M16)            r3.0<1>:d     r141.0<1;1,0>:d   r4.12<0;1,0>:d                      //  ALU pipe: int; $178
        add (32|M0)              r146.0<1>:d   r142.0<1;1,0>:d   -r2.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $178

// Line 166:  if (qkvz_dim_id < (num_v_heads / num_k_heads)) {
(W&~f1.0) jmpi                               _0_116                                                  //  ALU pipe: int; $181
// B013: [inDivergent],  Preds:{B012},  Succs:{B015}
_0_117:
(W)     mov (1|M0)               r1.2<1>:d     -1:w                               {Compacted}        //  ALU pipe: int; $183
(W)     jmpi                                 _0_118                                                  // $184
// B014: [inDivergent],  Preds:{B012},  Succs:{B015}
_0_116:
(W)     asr (1|M0)               r1.4<1>:d     r6.12<0;1,0>:d    31:w                                //  ALU pipe: int; $186
(W)     asr (1|M0)               r1.3<1>:d     r6.14<0;1,0>:d    31:w                                //  ALU pipe: int; $187
(W)     add (1|M0)               r4.10<1>:d    r1.4<0;1,0>:d     r6.12<0;1,0>:d   {I@2}              //  ALU pipe: int; $188
(W)     xor (1|M0)               r1.1<1>:d     r4.10<0;1,0>:d    r1.4<0;1,0>:d    {I@1}              //  ALU pipe: int; $189
(W)     add (1|M0)               r4.10<1>:d    r1.3<0;1,0>:d     r6.14<0;1,0>:d                      //  ALU pipe: int; $190
(W)     xor (1|M0)               r1.6<1>:d     r4.10<0;1,0>:d    r1.3<0;1,0>:d    {I@1}              //  ALU pipe: int; $191
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $192
(W)     mov (1|M0)               r1.5<1>:f     r1.1<0;1,0>:ud                   {A@1}                //  ALU pipe: float; $193
(W)     mov (1|M0)               r1.0<1>:f     r1.6<0;1,0>:ud                   {I@2}                //  ALU pipe: float; $196
(W)     mov (1|M0)               r4.10<1>:ud   r1.5<0;1,0>:f                    {F@2}                //  ALU pipe: int; $194
(W)     math.inv (1|M0)          r1.7<1>:f     r1.5<0;1,0>:f                                         //  ALU pipe: math; $197
(W)     add (1|M0)               r7.4<1>:d     r1.1<0;1,0>:d     -r4.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $195
(W)     mov (1|M0)               r4.10<1>:f    0xB4C00000:f                               {I@1}      //  ALU pipe: float; $198
(W)     mov (1|M0)               r4.12<1>:f    r7.4<0;1,0>:ud                                        //  ALU pipe: float; $203
(W)     mad (1|M0)               r1.9<1>:f     r1.7<0;0>:f       r4.10<0;0>:f      r1.7<0>:f        {A@1} //  ALU pipe: float; $198
(W)     mov (1|M0)               r4.10<1>:ud   r1.0<0;1,0>:f                    {F@1}                //  ALU pipe: int; $200
(W)     mul (1|M0)               r1.7<1>:f     r1.0<0;1,0>:f     r1.9<0;1,0>:f                       //  ALU pipe: float; $199
(W)     add (1|M0)               r7.5<1>:d     r1.6<0;1,0>:d     -r4.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $201
(W)     mov (1|M0)               r1.8<1>:ud    r1.7<0;1,0>:f                    {F@1}                //  ALU pipe: int; $202
(W)     mov (1|M0)               r4.13<1>:f    r7.5<0;1,0>:ud                   {I@2}                //  ALU pipe: float; $203
(W)     mov (1|M0)               r1.7<1>:f     r1.8<0;1,0>:ud                   {I@1}                //  ALU pipe: float; $205
(W)     mad (1|M0)               r1.0<1>:f     r1.0<0;0>:f       r1.7<0;0>:f       -r1.5<0>:f       {F@1} //  ALU pipe: float; $207
(W)     mad (1|M0)               r4.10<1>:f    r4.13<0;0>:f      r1.7<0;0>:f       -r4.12<0>:f       //  ALU pipe: float; $209
(W)     add (1|M0)               r4.10<1>:f    r1.0<0;1,0>:f     r4.10<0;1,0>:f   {F@1}              //  ALU pipe: float; $210
(W)     mul (1|M0)               r1.0<1>:f     r1.9<0;1,0>:f     r4.10<0;1,0>:f   {Compacted,F@1}    //  ALU pipe: float; $211
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $212
(W)     mov (1|M0)               r4.10<1>:ud   r1.0<0;1,0>:f                    {A@1}                //  ALU pipe: int; $213
(W)     xor (1|M0)               r1.7<1>:d     r1.4<0;1,0>:d     r1.3<0;1,0>:d                       //  ALU pipe: int; $215
(W)     add (1|M0)               r1.5<1>:d     r4.10<0;1,0>:d    r1.8<0;1,0>:d    {I@2}              //  ALU pipe: int; $214
(W)     mul (1|M0)               acc0.0<1>:d   r1.5<0;1,0>:d     r1.2<0;1,0>:uw   {I@1}              //  ALU pipe: int; $216
(W)     macl (1|M0)              r1.0<1>:d     r1.5<0;1,0>:d     r1.1<0;1,0>:d                       //  ALU pipe: int; $217
(W)     add (1|M0)               r4.10<1>:d    r1.6<0;1,0>:d     -r1.0<0;1,0>:d   {I@1}              //  ALU pipe: int; $217
(W)     cmp (1|M0)    (ge)f2.0   r4.10<1>:ud   r4.10<0;1,0>:ud   r1.1<0;1,0>:ud   {I@1}              //  ALU pipe: int; $218
(W)     add3 (1|M0)              r4.10<1>:d    r1.5<0;0>:d       r1.7<0;0>:d       -r4.10<0>:d      {I@1} //  ALU pipe: int; $219
(W)     bfn.(s0^s1^s2) (1|M0)    r1.2<1>:ud    r4.10<0;0>:ud     r1.4<0;0>:ud      r1.3<0>:ud       {I@1} //  ALU pipe: int; $220
// B015: [inDivergent],  Preds:{B014, B013},  Succs:{B016, B024}
_0_118:
        cmp (32|M0)   (lt)f2.0   null<1>:d     r146.0<1;1,0>:d   r1.2<0;1,0>:d    {I@1}              //  ALU pipe: int; $222
(~f2.0) goto (32|M0)                         _0_119            _0_119                                //  ALU pipe: int; $223
// B016: [inDivergent],  Preds:{B015},  Succs:{B017, B018}
_0_120:

// Line 168:  token_id * num_v_heads + k_heads_id * num_v_heads / num_k_heads;
(W&~f1.0) jmpi                               _0_121                                                  //  ALU pipe: int; $226
// B017: [inDivergent],  Preds:{B016},  Succs:{B019}
_0_122:
        mov (32|M0)              r8.0<1>:d     -1:w                               {Compacted}        //  ALU pipe: int; $228
(W)     jmpi                                 _0_123                                                  // $229
// B018: [inDivergent],  Preds:{B016},  Succs:{B019}
_0_121:
(W)     mul (16|M0)              acc0.0<1>:d   r140.0<1;1,0>:d   r6.28<0;1,0>:uw                     //  ALU pipe: int; $231
(W)     asr (1|M0)               r1.0<1>:d     r6.12<0;1,0>:d    31:w               {Compacted}      //  ALU pipe: int; $232
        macl (16|M0)             r8.0<1>:d     r140.0<1;1,0>:d   r6.14<0;1,0>:d   {Compacted}        //  ALU pipe: int; $231
(W)     mul (16|M16)             acc0.0<1>:d   r141.0<1;1,0>:d   r6.28<0;1,0>:uw                     //  ALU pipe: int; $231
(W)     add (1|M0)               r4.10<1>:d    r1.0<0;1,0>:d     r6.12<0;1,0>:d   {I@3}              //  ALU pipe: int; $234
        macl (16|M16)            r9.0<1>:d     r141.0<1;1,0>:d   r6.14<0;1,0>:d   {Compacted}        //  ALU pipe: int; $232
(W)     xor (1|M0)               r4.11<1>:d    r4.10<0;1,0>:d    r1.0<0;1,0>:d    {I@2}              //  ALU pipe: int; $235
        asr (32|M0)              r12.0<1>:d    r8.0<1;1,0>:d     31:w               {Compacted,I@2}  //  ALU pipe: int; $233
        add (32|M0)              r2.0<1>:d     r12.0<1;1,0>:d    r8.0<1;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $236
        xor (32|M0)              r14.0<1>:d    r2.0<1;1,0>:d     r12.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $237
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $238
(W)     mov (1|M0)               r1.1<1>:f     r4.11<0;1,0>:ud                  {A@1}                //  ALU pipe: float; $239
        mov (32|M0)              r8.0<1>:f     r14.0<1;1,0>:ud                  {I@2}                //  ALU pipe: float; $242
(W)     mov (1|M0)               r4.10<1>:ud   r1.1<0;1,0>:f                    {F@2}                //  ALU pipe: int; $240
(W)     math.inv (1|M0)          r1.3<1>:f     r1.1<0;1,0>:f                                         //  ALU pipe: math; $243
(W)     add (1|M0)               r1.4<1>:d     r4.11<0;1,0>:d    -r4.10<0;1,0>:d  {I@1}              //  ALU pipe: int; $241
(W)     mov (1|M0)               r4.10<1>:f    0xB4C00000:f                               {I@1}      //  ALU pipe: float; $244
        mov (32|M0)              r2.0<1>:ud    r8.0<1;1,0>:f                    {F@2}                //  ALU pipe: int; $246
(W)     mad (1|M0)               r1.3<1>:f     r1.3<0;0>:f       r4.10<0;0>:f      r1.3<0>:f        {A@1} //  ALU pipe: float; $244
        add (32|M0)              r18.0<1>:d    r14.0<1;1,0>:d    -r2.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $247
        mul (32|M0)              r10.0<1>:f    r8.0<1;1,0>:f     r1.3<0;1,0>:f    {Compacted,F@1}    //  ALU pipe: float; $245
(W)     mov (1|M0)               r1.4<1>:f     r1.4<0;1,0>:ud                                        //  ALU pipe: float; $249
        mov (32|M0)              r16.0<1>:ud   r10.0<1;1,0>:f                   {F@2}                //  ALU pipe: int; $248
        mov (32|M0)              r10.0<1>:f    r18.0<1;1,0>:ud                  {I@1}                //  ALU pipe: float; $250
        mov (32|M0)              r2.0<1>:f     r16.0<1;1,0>:ud                                       //  ALU pipe: float; $251
        mad (32|M0)              acc0.0<1>:f   r8.0<1;0>:f       r2.0<1;0>:f       -r1.1<0>:f       {F@1} //  ALU pipe: float; $253
        mad (32|M0)              acc2.0<1>:f   r10.0<1;0>:f      r2.0<1;0>:f       -r1.4<0>:f        //  ALU pipe: float; $255
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   acc2.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $256
        mul (32|M0)              r8.0<1>:f     r1.3<0;1,0>:f     acc0.0<1;1,0>:f  {Compacted}        //  ALU pipe: float; $257
(W)     xor (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x30:uw              {A@1}          // $258
        mov (32|M0)              r2.0<1>:ud    r8.0<1;1,0>:f                    {A@1}                //  ALU pipe: int; $259
        add (32|M0)              r10.0<1>:d    r2.0<1;1,0>:d     r16.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $260
        xor (32|M0)              r16.0<1>:d    r1.0<0;1,0>:d     r12.0<1;1,0>:d   {Compacted}        //  ALU pipe: int; $261
(W)     mul (16|M0)              acc0.0<1>:d   r10.0<1;1,0>:d    r4.22<0;1,0>:uw  {I@2}              //  ALU pipe: int; $262
        macl (16|M0)             r8.0<1>:d     r10.0<1;1,0>:d    r4.11<0;1,0>:d   {Compacted}        //  ALU pipe: int; $262
(W)     mul (16|M16)             acc0.0<1>:d   r11.0<1;1,0>:d    r4.22<0;1,0>:uw                     //  ALU pipe: int; $262
        macl (16|M16)            r9.0<1>:d     r11.0<1;1,0>:d    r4.11<0;1,0>:d   {Compacted}        //  ALU pipe: int; $263
        add (32|M0)              r2.0<1>:d     r14.0<1;1,0>:d    -r8.0<1;1,0>:d   {Compacted,I@1}    //  ALU pipe: int; $263
        cmp (32|M0)   (ge)f1.0   r8.0<1>:ud    r2.0<1;1,0>:ud    r4.11<0;1,0>:ud  {I@1}              //  ALU pipe: int; $264
        add3 (32|M0)             r2.0<1>:d     r10.0<1;0>:d      r16.0<1;0>:d      -r8.0<1>:d       {Compacted,I@1} //  ALU pipe: int; $265 R{} IR{}{E:5,E:0,E:4,},  R{} IR{}{O:5,O:8,O:4,},  {BC=2}
        bfn.(s0^s1^s2) (32|M0)   r8.0<1>:ud    r2.0<1;0>:ud      r1.0<0;0>:ud      r12.0<1>:ud      {I@1} //  ALU pipe: int; $266
// B019: [inDivergent],  Preds:{B018, B017},  Succs:{B020, B024}
_0_123:

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(W)     cmp (32|M0)   (gt)f1.0   null<1>:d     r1.2<0;1,0>:d     0:w                                 //  ALU pipe: int; $272
(~f1.0) goto (32|M0)                         _0_119            _0_119                                //  ALU pipe: int; $273
// B020: [inDivergent],  Preds:{B019},  Succs:{B021, B024}
_0_124:

// Line 168:  token_id * num_v_heads + k_heads_id * num_v_heads / num_k_heads;
(W)     mul (1|M0)               acc0.0<1>:d   r253.6<0;1,0>:d   r6.28<0;1,0>:uw                     //  ALU pipe: int; $276

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
(W)     shl (1|M0)               r4.5<1>:q     r1.2<0;1,0>:d     1:w                                 //  ALU pipe: int; $307

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/integer_functions.inc

// Line 112:  BUILTIN_GENINT_SU(TWO_ARGS, min)
(W)     sel (1|M0)    (lt)f0.0   r4.12<1>:d    r1.2<0;1,0>:d     4:w                                 //  ALU pipe: int; $285

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 168:  token_id * num_v_heads + k_heads_id * num_v_heads / num_k_heads;
(W)     macl (1|M0)              r1.0<1>:d     r253.6<0;1,0>:d   r6.14<0;1,0>:d   {Compacted}        //  ALU pipe: int; $277

// Line 169:  int step_global = global_token_id * num_v_heads +
(W)     mul (1|M0)               acc0.0<1>:d   r4.8<0;1,0>:d     r6.28<0;1,0>:uw                     //  ALU pipe: int; $280
(W)     macl (1|M0)              r12.0<1>:d    r4.8<0;1,0>:d     r6.14<0;1,0>:d   {Compacted}        //  ALU pipe: int; $281

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add3 (32|M0)             r10.0<1>:d    r1.0<0;0>:d       r8.0<1;0>:d       r146.0<1>:d      {I@3} //  ALU pipe: int; $292

// Line 169:  int step_global = global_token_id * num_v_heads +
        add (32|M0)              r14.0<1>:d    r12.0<0;1,0>:d    r8.0<1;1,0>:d    {Compacted,I@2}    //  ALU pipe: int; $281

// Line 168:  token_id * num_v_heads + k_heads_id * num_v_heads / num_k_heads;
        add (32|M0)              r2.0<1>:d     r1.0<0;1,0>:d     r8.0<1;1,0>:d    {Compacted}        //  ALU pipe: int; $277

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (16|M0)              r8.0<2>:ud    r10.0<1;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $301
        mov (16|M16)             r12.0<2>:ud   r11.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $301

// Line 176:  mixed_ba[step_global * 2 + qkvz_dim_id + e];
        shl (32|M0)              r16.0<1>:d    r14.0<1;1,0>:d    1:w               {Compacted,I@4}   //  ALU pipe: int; $289

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $301
        shl (16|M16)             r8.0<1>:q     r12.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $301

// Line 176:  mixed_ba[step_global * 2 + qkvz_dim_id + e];
        add (32|M0)              r12.0<1>:d    r16.0<1;1,0>:d    r146.0<1;1,0>:d  {Compacted,I@3}    //  ALU pipe: int; $290

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M0)              r20.0<1>:q    r10.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $302

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r24.0<1>:q    r10.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $313

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M16)             r22.0<1>:q    r8.0<1;1,0>:q     r5.0<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $302

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r26.0<1>:q    r8.0<1;1,0>:q     r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $313

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (16|M16)             r10.0<2>:ud   r13.0<1;1,0>:ud                  {Compacted,I@5}      //  ALU pipe: int; $298
        mov (16|M0)              r8.0<2>:ud    r12.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $298

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(W)     cmp (32|M0)   (gt)f1.0   null<1>:d     r4.12<0;1,0>:d    1:w                                 //  ALU pipe: int; $320

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        shl (16|M16)             r12.0<1>:q    r10.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $298
        shl (16|M0)              r14.0<1>:q    r8.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $298
        add (16|M16)             r10.0<1>:q    r12.0<1;1,0>:q    r5.3<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $299
        add (16|M0)              r8.0<1>:q     r14.0<1;1,0>:q    r5.3<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $299

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r18.0<1>:q    r10.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $308

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        load.ugm.d16u32.a64 (32|M0)  r14:2      [r8:4]             {I@2,$6} // ex_desc:0x0; desc:0x8200B80 // $303

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r16.0<1>:q    r8.0<1;1,0>:q     r4.5<0;1,0>:q    {Compacted}        //  ALU pipe: int; $308

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (32|M0)              r12.0<1>:ud   r14.0<2;1,0>:uw                  {$6.dst}             //  ALU pipe: int; $310
        store.ugm.d16u32.a64 (32|M0)  [r20:4]   r12:2              {I@1,$7} // ex_desc:0x0; desc:0x8000B84 // $311

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        load.ugm.d16u32.a64 (32|M0)  r14:2      [r16:4]            {$8} // ex_desc:0x0; desc:0x8200B80 // $314
        sync.nop                             null                             {Compacted,$7.src}     // $316
        mov (32|M0)              r12.0<1>:ud   r14.0<2;1,0>:uw                  {$8.dst}             //  ALU pipe: int; $316
        store.ugm.d16u32.a64 (32|M0)  [r24:4]   r12:2              {I@1,$9} // ex_desc:0x0; desc:0x8000B84 // $317

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(~f1.0) goto (32|M0)                         _0_119            _0_119                                //  ALU pipe: int; $321
// B021: [inDivergent],  Preds:{B020},  Succs:{B022, B024}
_0_125:

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M0)              r12.0<1>:q    r8.0<1;1,0>:q     2:d               {$9.src}          //  ALU pipe: int; $330
        add (16|M16)             r14.0<1>:q    r10.0<1;1,0>:q    2:d                                 //  ALU pipe: int; $330
        add3 (32|M0)             r16.0<1>:d    r2.0<1;0>:d       r146.0<1;0>:d     1:w               //  ALU pipe: int; $325 R{} IR{}{E:1,E:1,},  R{} IR{}{O:1,O:9,},  {BC=1}
        load.ugm.d16u32.a64 (32|M0)  r28:2      [r12:4]            {I@2,$10} // ex_desc:0x0; desc:0x8200B80 // $330
        mov (16|M0)              r12.0<2>:ud   r16.0<1;1,0>:ud                  {Compacted,@1,$10.src} //  ALU pipe: int; $328
        mov (16|M16)             r14.0<2>:ud   r17.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $328
        add (16|M0)              r20.0<1>:q    r8.0<1;1,0>:q     2:w               {Compacted}       //  ALU pipe: int; $326
        shl (16|M0)              r26.0<1>:q    r12.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $328
        shl (16|M16)             r12.0<1>:q    r14.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $328

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r22.0<1>:q    r20.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $333 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M0)              r14.0<1>:q    r26.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $329
        add (16|M16)             r16.0<1>:q    r12.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $329

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r20.0<1>:q    r12.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $338

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M16)             r18.0<1>:q    r10.0<1;1,0>:q    2:w               {Compacted}       //  ALU pipe: int; $326

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(W)     cmp (32|M0)   (eq)f1.0   null<1>:d     r4.12<0;1,0>:d    2:w                                 //  ALU pipe: int; $345

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r24.0<1>:q    r18.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $333
        add (16|M0)              r18.0<1>:q    r26.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $338

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (32|M0)              r12.0<1>:ud   r28.0<2;1,0>:uw                  {$10.dst}            //  ALU pipe: int; $335
        store.ugm.d16u32.a64 (32|M0)  [r14:4]   r12:2              {I@1,$11} // ex_desc:0x0; desc:0x8000B84 // $336

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        load.ugm.d16u32.a64 (32|M0)  r14:2      [r22:4]            {$12} // ex_desc:0x0; desc:0x8200B80 // $339
        sync.nop                             null                             {Compacted,$11.src}    // $341
        mov (32|M0)              r12.0<1>:ud   r14.0<2;1,0>:uw                  {$12.dst}            //  ALU pipe: int; $341
        store.ugm.d16u32.a64 (32|M0)  [r18:4]   r12:2              {I@1,$13} // ex_desc:0x0; desc:0x8000B84 // $342

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(f1.0)  goto (32|M0)                         _0_119            _0_119                                //  ALU pipe: int; $346
// B022: [inDivergent],  Preds:{B021},  Succs:{B023, B024}
_0_126:

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        load.ugm.d16u32.a64 (32|M0)  r28:2      [r8:4+0x4]         {$14} // ex_desc:0x4000; desc:0x8200B80 // $355
        add3 (32|M0)             r12.0<1>:d    r2.0<1;0>:d       r146.0<1;0>:d     2:w               {$13.src} //  ALU pipe: int; $350 R{} IR{}{E:1,E:1,},  R{} IR{}{O:1,O:9,},  {BC=1}
        add (16|M0)              r16.0<1>:q    r8.0<1;1,0>:q     4:w               {Compacted}       //  ALU pipe: int; $351
        mov (16|M16)             r20.0<2>:ud   r13.0<1;1,0>:ud                  {Compacted,I@2}      //  ALU pipe: int; $353
        mov (16|M0)              r18.0<2>:ud   r12.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $353
        add (16|M16)             r14.0<1>:q    r10.0<1;1,0>:q    4:w               {Compacted}       //  ALU pipe: int; $351
        shl (16|M16)             r12.0<1>:q    r20.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $353
        shl (16|M0)              r26.0<1>:q    r18.0<2;1,0>:d    1:w               {I@3}             //  ALU pipe: int; $353

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r22.0<1>:q    r16.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted}        //  ALU pipe: int; $358
        add (16|M16)             r24.0<1>:q    r14.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $358
        add (16|M16)             r20.0<1>:q    r12.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $363

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M16)             r16.0<1>:q    r12.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted}        //  ALU pipe: int; $354
        add (16|M0)              r14.0<1>:q    r26.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted,I@5}    //  ALU pipe: int; $354

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(W)     cmp (32|M0)   (gt)f1.0   null<1>:d     r4.12<0;1,0>:d    3:w                                 //  ALU pipe: int; $370

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r18.0<1>:q    r26.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $363

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (32|M0)              r12.0<1>:ud   r28.0<2;1,0>:uw                  {$14.dst}            //  ALU pipe: int; $360
        store.ugm.d16u32.a64 (32|M0)  [r14:4]   r12:2              {I@1,$15} // ex_desc:0x0; desc:0x8000B84 // $361

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        load.ugm.d16u32.a64 (32|M0)  r14:2      [r22:4]            {$16} // ex_desc:0x0; desc:0x8200B80 // $364
        sync.nop                             null                             {Compacted,$15.src}    // $366
        mov (32|M0)              r12.0<1>:ud   r14.0<2;1,0>:uw                  {$16.dst}            //  ALU pipe: int; $366
        store.ugm.d16u32.a64 (32|M0)  [r18:4]   r12:2              {I@1,$17} // ex_desc:0x0; desc:0x8000B84 // $367

// Line 174:  for (int e = 0; e < ba_elems_per_item; ++e) {
(~f1.0) goto (32|M0)                         _0_119            _0_119                                //  ALU pipe: int; $371
// B023: [inDivergent],  Preds:{B022},  Succs:{B024}
_0_127:

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M0)              r12.0<1>:q    r8.0<1;1,0>:q     6:d               {$17.src}         //  ALU pipe: int; $380
        add (16|M16)             r14.0<1>:q    r10.0<1;1,0>:q    6:d                                 //  ALU pipe: int; $380
        add3 (32|M0)             r16.0<1>:d    r2.0<1;0>:d       r146.0<1;0>:d     3:w               //  ALU pipe: int; $375 R{} IR{}{E:1,E:1,},  R{} IR{}{O:1,O:9,},  {BC=1}
        load.ugm.d16u32.a64 (32|M0)  r24:2      [r12:4]            {I@2,$18} // ex_desc:0x0; desc:0x8200B80 // $380
        add (16|M16)             r20.0<1>:q    r10.0<1;1,0>:q    6:w               {Compacted}       //  ALU pipe: int; $376
        add (16|M0)              r22.0<1>:q    r8.0<1;1,0>:q     6:w               {Compacted}       //  ALU pipe: int; $376
        mov (16|M0)              r1.0<2>:ud    r16.0<1;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $378
        mov (16|M16)             r8.0<2>:ud    r17.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $378

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r18.0<1>:q    r20.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $383 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        shl (16|M0)              r20.0<1>:q    r1.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $378
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $378

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M0)              r16.0<1>:q    r22.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted}        //  ALU pipe: int; $383

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        add (16|M0)              r8.0<1>:q     r20.0<1;1,0>:q    r5.0<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $379
        add (16|M16)             r10.0<1>:q    r1.0<1;1,0>:q     r5.0<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $379

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        add (16|M16)             r14.0<1>:q    r1.0<1;1,0>:q     r5.1<0;1,0>:q    {Compacted,$18.src} //  ALU pipe: int; $388
        add (16|M0)              r12.0<1>:q    r20.0<1;1,0>:q    r5.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $388

// Line 175:  b_out[step_local + qkvz_dim_id + e] =
        mov (32|M0)              r2.0<1>:ud    r24.0<2;1,0>:uw                  {$18.dst}            //  ALU pipe: int; $385
        store.ugm.d16u32.a64 (32|M0)  [r8:4]    r2:2               {I@1,$19} // ex_desc:0x0; desc:0x8000B84 // $386

// Line 177:  a_out[step_local + qkvz_dim_id + e] = mixed_ba
        load.ugm.d16u32.a64 (32|M0)  r8:2       [r16:4]            {$20} // ex_desc:0x0; desc:0x8200B80 // $389
        sync.nop                             null                             {Compacted,$19.src}    // $391
        mov (32|M0)              r2.0<1>:ud    r8.0<2;1,0>:uw                   {$20.dst}            //  ALU pipe: int; $391
        store.ugm.d16u32.a64 (32|M0)  [r12:4]   r2:2               {I@1,$21} // ex_desc:0x0; desc:0x8000B84 // $392
// B024: [inDivergent],  Preds:{B023, B022, B021, B020, B019, B015},  Succs:{B025, B026}
_0_119:
        join (32|M0)                         _0_105                                                  // 
L4872:

// Line 194:  while (lo <= hi) {
(W)     cmp (32|M0)   (lt)f1.0   null<1>:d     r6.11<0;1,0>:d    1:w                                 //  ALU pipe: int; $399

// Line 188:  int batch_id = batch_size - 1;
(W)     add (1|M0)               r4.10<1>:d    r6.11<0;1,0>:d    -1:w                                //  ALU pipe: int; $396

// Line 194:  while (lo <= hi) {
(W&~f1.0) jmpi                               _0_128                                                  //  ALU pipe: int; $400
// B025: [inDivergent],  Preds:{B024},  Succs:{B028}
_0_129:
(W)     mov (1|M0)               r162.11<1>:d  r4.10<0;1,0>:d                   {I@2}                //  ALU pipe: int; $402
(W)     jmpi                                 _0_130                                                  // $403
// B026: [inDivergent],  Preds:{B024},  Succs:{B027}
_0_128:
(W)     mov (1|M0)               r162.11<1>:d  r4.10<0;1,0>:d                                        //  ALU pipe: int; $405
(W)     mov (1|M0)               r4.11<1>:d    0:w                                                   //  ALU pipe: int; $406
// B027: [inDivergent],  Preds:{B027, B026},  Succs:{B028, B027}
_0_131:

// Line 195:  const int mid = (lo + hi) >> 1;
(W)     add (1|M0)               r4.12<1>:d    r4.11<0;1,0>:d    r4.10<0;1,0>:d   {I@1}              //  ALU pipe: int; $411
(W)     shr (1|M0)               r4.12<1>:ud   r4.12<0;1,0>:ud   1:w               {I@1}             //  ALU pipe: int; $412

// Line 196:  if (token_id < query_start_loc[mid + 1]) {
(W)     add (1|M0)               r6.11<1>:d    r4.12<0;1,0>:d    1:w               {I@1}             //  ALU pipe: int; $415
(W)     add (1|M0)               r4.13<1>:d    r4.12<0;1,0>:d    -1:w                                //  ALU pipe: int; $420
(W)     shl (1|M0)               r4.7<1>:q     r6.11<0;1,0>:ud   2:w               {I@2}             //  ALU pipe: int; $417
(W)     add (1|M0)               r2.0<1>:q     r4.7<0;1,0>:q     r6.0<0;1,0>:q    {Compacted,@1,$21.src} //  ALU pipe: int; $418
(W)     load.ugm.d32x1t.a64 (1|M0)  r1:1        [r2:1]             {I@1,$22} // ex_desc:0x0; desc:0x2108580 // $419
(W)     cmp (32|M0)   (gt)f1.0   null<1>:d     r1.0<0;1,0>:d     r253.6<0;1,0>:d  {$22.dst}          //  ALU pipe: int; $421
(W&f1.0) mov (1|M0)              r4.10<1>:d    r4.13<0;1,0>:d                                        //  ALU pipe: int; $422
(W&~f1.0) mov (1|M0)             r4.11<1>:f    r6.11<0;1,0>:f                                        //  ALU pipe: float; $423
(W&f1.0) mov (1|M0)              r162.11<1>:d  r4.12<0;1,0>:d                                        //  ALU pipe: int; $424

// Line 194:  while (lo <= hi) {
(W)     cmp (32|M0)   (gt)f1.0   null<1>:d     r4.11<0;1,0>:d    r4.10<0;1,0>:d   {A@1}              //  ALU pipe: int; $427
(W&~f1.0) jmpi                               _0_131                                                  //  ALU pipe: int; $428
// B028: [inDivergent],  Preds:{B027, B025},  Succs:{B029, B146}
_0_130:

// Line 203:  seq_start_offset = query_start_loc[batch_id];
(W)     mov (1|M0)               r4.5<1>:q     r162.11<0;1,0>:d                 {I@3}                //  ALU pipe: int; $431
(W)     shl (1|M0)               r2.1<1>:q     r4.5<0;1,0>:q     2:w               {@1,$21.src}      //  ALU pipe: int; $432

// Line 208:  int states_id = cache_indices[batch_id];
(W)     add (1|M0)               r2.0<1>:q     r2.1<0;1,0>:q     r6.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $434
(W)     load.ugm.d32x1t.a64 (1|M0)  r22:1       [r2:1]             {I@1,$23} // ex_desc:0x0; desc:0x2108580 // $435

// Line 210:  if (states_id == pad_slot_id) {
(W)     cmp (32|M0)   (eq)f1.0   null<1>:d     r22.0<0;1,0>:d    r6.10<0;1,0>:d   {$23.dst}          //  ALU pipe: int; $438 R{} IR{}{E:3,E:3,},  {BC=1}
(f1.0)  goto (32|M0)                         _0_105            _0_105                                //  ALU pipe: int; $439
// B029: [inDivergent],  Preds:{B028},  Succs:{B030, B035}
_0_132:

// Line 203:  seq_start_offset = query_start_loc[batch_id];
(W)     add (1|M0)               r6.0<1>:q     r2.1<0;1,0>:q     r6.0<0;1,0>:q    {Compacted}        //  ALU pipe: int; $442

// Line 221:  if (qkvz_dim_id < q_dim) {
        cmp (32|M0)   (lt)f1.0   null<1>:d     r146.0<1;1,0>:d   r6.13<0;1,0>:d                      //  ALU pipe: int; $446

// Line 203:  seq_start_offset = query_start_loc[batch_id];
(W)     load.ugm.d32x2t.a64 (1|M0)  r163:1      [r6:1]             {I@2,$24} // ex_desc:0x0; desc:0x2109580 // $443

// Line 221:  if (qkvz_dim_id < q_dim) {
(f1.0)  goto (32|M0)                         _0_133            _0_133                                //  ALU pipe: int; $447
// B030: [inDivergent],  Preds:{B029},  Succs:{B031, B034}
_0_134:

// Line 226:  } else if (qkvz_dim_id < q_dim + k_dim) {
        cmp (32|M0)   (lt)f2.0   null<1>:d     r146.0<1;1,0>:d   r162.12<0;1,0>:d                    //  ALU pipe: int; $450 R{} IR{}{E:1,E:1,},  R{r162,} IR{} {BC=1}
(f2.0)  goto (32|M0)                         _0_135            _0_135                                //  ALU pipe: int; $451
// B031: [inDivergent],  Preds:{B030},  Succs:{B032, B033}
_0_136:

// Line 232:  } else if (qkvz_dim_id < q_dim + k_dim + v_dim) {
        cmp (32|M0)   (lt)f2.0   null<1>:d     r146.0<1;1,0>:d   r4.9<0;1,0>:d                       //  ALU pipe: int; $455

// Line 248:  if (is_z) {
(f2.0)  goto (32|M0)                         _0_137            _0_137                                //  ALU pipe: int; $457
// B032: [inDivergent],  Preds:{B031},  Succs:{B146}
_0_138:

// Line 250:  k_heads_id * z_dim + qkvz_dim_id - (q_dim + k_dim + v_dim);
(W)     mul (16|M0)              acc0.0<1>:d   r140.0<1;1,0>:d   r162.20<0;1,0>:uw                   //  ALU pipe: int; $460
        macl (16|M0)             r2.0<1>:d     r140.0<1;1,0>:d   r162.10<0;1,0>:d {Compacted}        //  ALU pipe: int; $460
(W)     mul (16|M16)             acc0.0<1>:d   r141.0<1;1,0>:d   r162.20<0;1,0>:uw                   //  ALU pipe: int; $460
        macl (16|M16)            r3.0<1>:d     r141.0<1;1,0>:d   r162.10<0;1,0>:d {Compacted}        //  ALU pipe: int; $461

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r4.8<0;1,0>:d     r7.0<0;1,0>:uw                      //  ALU pipe: int; $463
(W)     macl (1|M0)              r6.0<1>:d     r4.8<0;1,0>:d     r7.0<0;1,0>:d    {Compacted,$24.src} //  ALU pipe: int; $464

// Line 250:  k_heads_id * z_dim + qkvz_dim_id - (q_dim + k_dim + v_dim);
        add (32|M0)              r16.0<1>:d    r2.0<1;1,0>:d     r146.0<1;1,0>:d  {Compacted,I@3}    //  ALU pipe: int; $461 R{} IR{}{E:1,E:1,},  R{} IR{}{O:1,O:9,},  {BC=1}

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
        add (32|M0)              r8.0<1>:d     r6.0<0;1,0>:d     r142.0<1;1,0>:d  {Compacted,I@2}    //  ALU pipe: int; $464

// Line 254:  &z_out[global_token_id * num_k_heads * z_dim + z_elems_id], z_tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r4.8<0;1,0>:d     r6.24<0;1,0>:uw                     //  ALU pipe: int; $475

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
        mov (16|M0)              r1.0<2>:ud    r8.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $466

// Line 254:  &z_out[global_token_id * num_k_heads * z_dim + z_elems_id], z_tmp);
(W)     macl (1|M0)              r6.0<1>:d     r4.8<0;1,0>:d     r6.12<0;1,0>:d                      //  ALU pipe: int; $476

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
        shl (16|M0)              r14.0<1>:q    r1.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $466
        mov (16|M16)             r1.0<2>:ud    r9.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $466

// Line 254:  &z_out[global_token_id * num_k_heads * z_dim + z_elems_id], z_tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r6.0<0;1,0>:d     r162.20<0;1,0>:uw {I@3}             //  ALU pipe: int; $476

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
        add (16|M0)              r8.0<1>:q     r14.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $467
        sync.allrd                           ($13,$17)                                               // $466
        shl (16|M16)             r12.0<1>:q    r1.0<2;1,0>:d     1:w               {@3,$9.src}       //  ALU pipe: int; $466

// Line 254:  &z_out[global_token_id * num_k_heads * z_dim + z_elems_id], z_tmp);
(W)     macl (1|M0)              r6.0<1>:d     r6.0<0;1,0>:d     r162.10<0;1,0>:d {Compacted}        //  ALU pipe: int; $477

// Line 252:  load_vec(&mixed_qkvz[global_token_id * qkvz_elems + mixed_qkvz_id], z_tmp);
        add (16|M16)             r10.0<1>:q    r12.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $467

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r12:4         [r8:4]             {I@1,$25} // ex_desc:0x0; desc:0x8400780 // $472

// Line 254:  &z_out[global_token_id * num_k_heads * z_dim + z_elems_id], z_tmp);
        add3 (32|M0)             r8.0<1>:d     r6.0<0;0>:d       r16.0<1;0>:d      -r4.9<0>:d       {$25.src} //  ALU pipe: int; $477 R{} IR{}{E:3,E:0,E:2,},  R{r6,r4,} IR{} {BC=1}
        mov (16|M0)              r1.0<2>:ud    r8.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $481
        shl (16|M0)              r10.0<1>:q    r1.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $481
        mov (16|M16)             r1.0<2>:ud    r9.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $481
        add (16|M0)              r16.0<1>:q    r10.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $482
        shl (16|M16)             r8.0<1>:q     r1.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $481
        add (16|M16)             r18.0<1>:q    r8.0<1;1,0>:q     r4.3<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $482

// Line 111:  *reinterpret_cast<sycl::vec<T, elems_per_item>*>(ptr) = out;
        mov (16|M0)              r8.0<1>:d     r12.0<2;1,0>:d                   {Compacted,$25.dst}  //  ALU pipe: int; $485
        mov (16|M16)             r9.0<1>:d     r14.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $486
        mov (16|M0)              r10.0<1>:d    r12.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $487
        mov (16|M16)             r11.0<1>:d    r14.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $488
        store.ugm.d32x2.a64 (32|M0)  [r16:4]    r8:4               {I@1,$26} // ex_desc:0x0; desc:0x8001584 // $489
        goto (32|M0)                         _0_137            _0_105                                // $490
// B033: [inDivergent],  Preds:{B031},  Succs:{B036}
_0_137:
        join (32|M0)                         _0_135                                                  // 
L5792:

// Line 266:  reordered_elems_id = num_k_heads * (q_dim + k_dim) + k_heads_id * v_dim +
(W)     mul (1|M0)               acc0.0<1>:d   r162.12<0;1,0>:d  r6.24<0;1,0>:uw                     //  ALU pipe: int; $494

// Line 268:  }
        mov (32|M0)              r166.0<1>:d   0:w                               {Compacted}         //  ALU pipe: int; $501

// Line 266:  reordered_elems_id = num_k_heads * (q_dim + k_dim) + k_heads_id * v_dim +
(W)     macl (1|M0)              r6.0<1>:d     r162.12<0;1,0>:d  r6.12<0;1,0>:d   {$24.src}          //  ALU pipe: int; $495
(W)     mul (16|M0)              acc0.0<1>:d   r140.0<1;1,0>:d   r162.20<0;1,0>:uw                   //  ALU pipe: int; $495

// Line 268:  }
        mov (32|M0)              r164.0<1>:d   -1:w                               {Compacted}        //  ALU pipe: int; $502

// Line 266:  reordered_elems_id = num_k_heads * (q_dim + k_dim) + k_heads_id * v_dim +
        macl (16|M0)             r8.0<1>:d     r140.0<1;1,0>:d   r162.10<0;1,0>:d {Compacted,$26.src} //  ALU pipe: int; $495
(W)     mul (16|M16)             acc0.0<1>:d   r141.0<1;1,0>:d   r162.20<0;1,0>:uw                   //  ALU pipe: int; $495
        macl (16|M16)            r9.0<1>:d     r141.0<1;1,0>:d   r162.10<0;1,0>:d {Compacted}        //  ALU pipe: int; $496
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r8.0<1;1,0>:d    {Compacted,I@1}    //  ALU pipe: int; $496

// Line 267:  qkvz_dim_id - (q_dim + k_dim);
        add3 (32|M0)             r144.0<1>:d   r2.0<1;0>:d       r146.0<1;0>:d     -r162.12<0>:d    {I@1} //  ALU pipe: int; $498 R{} IR{}{E:1,E:1,E:1,},  R{r162,} IR{}{O:1,O:9,},  {BC=2}

// Line 268:  }
        goto (32|M0)                         _0_135            _0_139                                // $503
// B034: [inDivergent],  Preds:{B030},  Succs:{B036}
_0_135:
        join (32|M0)                         _0_133                                                  // 
L5944:

// Line 264:  num_k_heads * q_dim + k_heads_id * k_dim + qkvz_dim_id - q_dim;
        add (32|M0)              r2.0<1>:d     r140.0<1;1,0>:d   r6.12<0;1,0>:d                      //  ALU pipe: int; $506

// Line 265:  } else if (is_v) {
        mov (32|M0)              r166.0<1>:d   -1:w                               {Compacted}        //  ALU pipe: int; $511

// Line 264:  num_k_heads * q_dim + k_heads_id * k_dim + qkvz_dim_id - q_dim;
(W)     mul (16|M0)              acc0.0<1>:d   r2.0<1;1,0>:d     r6.26<0;1,0>:uw  {I@2}              //  ALU pipe: int; $507

// Line 265:  } else if (is_v) {
        mov (32|M0)              r164.0<1>:d   0:w                               {Compacted}         //  ALU pipe: int; $512

// Line 264:  num_k_heads * q_dim + k_heads_id * k_dim + qkvz_dim_id - q_dim;
        macl (16|M0)             r8.0<1>:d     r2.0<1;1,0>:d     r6.13<0;1,0>:d   {$26.src}          //  ALU pipe: int; $507
(W)     mul (16|M16)             acc0.0<1>:d   r3.0<1;1,0>:d     r6.26<0;1,0>:uw                     //  ALU pipe: int; $507
        macl (16|M16)            r9.0<1>:d     r3.0<1;1,0>:d     r6.13<0;1,0>:d                      //  ALU pipe: int; $508
        add3 (32|M0)             r144.0<1>:d   r8.0<1;0>:d       r146.0<1;0>:d     -r6.13<0>:d      {I@1} //  ALU pipe: int; $508 R{} IR{}{E:4,E:1,E:3,},  R{r6,} IR{}{O:4,O:9,},  {BC=1}

// Line 265:  } else if (is_v) {
        goto (32|M0)                         _0_133            _0_139                                // $513
// B035: [inDivergent],  Preds:{B029},  Succs:{B036}
_0_133:
        join (32|M0)                         _0_139                                                  // 
L6088:

// Line 261:  reordered_elems_id = k_heads_id * q_dim + qkvz_dim_id;
(W)     mul (16|M0)              acc0.0<1>:d   r140.0<1;1,0>:d   r6.26<0;1,0>:uw                     //  ALU pipe: int; $517

// Line 262:  } else if (is_k) {
        mov (32|M0)              r166.0<1>:d   0:w                               {Compacted}         //  ALU pipe: int; $521

// Line 261:  reordered_elems_id = k_heads_id * q_dim + qkvz_dim_id;
        macl (16|M0)             r2.0<1>:d     r140.0<1;1,0>:d   r6.13<0;1,0>:d                      //  ALU pipe: int; $517
(W)     mul (16|M16)             acc0.0<1>:d   r141.0<1;1,0>:d   r6.26<0;1,0>:uw                     //  ALU pipe: int; $517

// Line 262:  } else if (is_k) {
        mov (32|M0)              r164.0<1>:d   0:w                               {Compacted}         //  ALU pipe: int; $522

// Line 261:  reordered_elems_id = k_heads_id * q_dim + qkvz_dim_id;
        macl (16|M16)            r3.0<1>:d     r141.0<1;1,0>:d   r6.13<0;1,0>:d                      //  ALU pipe: int; $518
        add (32|M0)              r144.0<1>:d   r2.0<1;1,0>:d     r146.0<1;1,0>:d  {Compacted,I@1}    //  ALU pipe: int; $518 R{} IR{}{E:1,E:1,},  R{} IR{}{O:1,O:9,},  {BC=1}
// B036: [inDivergent],  Preds:{B035, B034, B033},  Succs:{B037, B038}
_0_139:
        join (32|M0)                         _0_105                                                  // 
L6192:

// Line 272:  (has_initial_state == nullptr ||
(W)     mov (1|M0)               r4.3<1>:uq    0x0:uw                                                //  ALU pipe: int; $528
(W)     cmp (32|M0)   (eq)f2.0   null<1>:d     r6.6<0;1,0>:d     r4.6<0;1,0>:d    {I@1}              //  ALU pipe: int; $531
(W&f2.0) cmp (32|M0)  (eq)f2.0   null<1>:d     r6.7<0;1,0>:d     r4.7<0;1,0>:d                       //  ALU pipe: int; $532
(W&~f2.0) jmpi                               _0_140                                                  //  ALU pipe: int; $534
// B037: [inDivergent],  Preds:{B036},  Succs:{B039}
_0_141:
(W)     mov (1|M0)               r162.4<1>:d   -1:w                               {Compacted}        //  ALU pipe: int; $536
(W)     jmpi                                 _0_142                                                  // $537
// B038: [inDivergent],  Preds:{B036},  Succs:{B039}
_0_140:

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
(W)     add (1|M0)               r6.0<1>:q     r6.3<0;1,0>:q     r4.5<0;1,0>:q    {Compacted,$24.src} //  ALU pipe: int; $540
(W)     load.ugm.d8u32.a64 (1|M0)  r6:1         [r6:2]             {I@1,$27} // ex_desc:0x0; desc:0x4100980 // $541
(W)     mov (1|M0)               r4.12<1>:w    r6.0<0;1,0>:ub                   {$27.dst}            //  ALU pipe: int; $543
(W)     cmp (32|M0)   (ne)f2.0   null<2>:w     r4.12<0;1,0>:w    0:w               {I@1}             //  ALU pipe: int; $544
(W)     mov (1|M0)               r4.12<1>:hf   0xFFFF:hf                              {I@1}          //  ALU pipe: float; $545
(W&f2.0) sel (1|M0)              r162.4<1>:d   r4.12<0;1,0>:w    0:w               {F@1}             //  ALU pipe: int; $545
// B039: [FCALL],  [inDivergent],  Preds:{B038, B037},  Succs:{B040}
_0_142:

// Line 283:  conv_weights[(reordered_elems_id + e) * Width + i];
        shl (32|M0)              r8.0<1>:d     r144.0<1;1,0>:d   2:w               {Compacted,$26.src} //  ALU pipe: int; $563

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
        shl (32|M0)              r10.0<1>:d    r148.0<1;1,0>:d   5:w               {Compacted}       //  ALU pipe: int; $557

// Line 282:  local_weights[Width * e + i] =
        sync.allrd                           ($13,$17)                                               // $569
        mov (16|M0)              r12.0<2>:ud   r8.0<1;1,0>:ud                   {Compacted,@2,$9.src} //  ALU pipe: int; $569
        mov (16|M16)             r14.0<2>:ud   r9.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $569
        add (32|M0)              r18.0<1>:d    r148.0<1;1,0>:d   32:w               {Compacted}      //  ALU pipe: int; $662

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
(W)     add (1|M0)               r4.3<1>:uq    r255.2<0;1,0>:uq  0x10:uw                             //  ALU pipe: int; $558
        mov (16|M0)              r16.0<2>:ud   r10.0<1;1,0>:ud                  {Compacted,I@5}      //  ALU pipe: int; $559
        mov (16|M16)             r20.0<2>:ud   r11.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $559

// Line 282:  local_weights[Width * e + i] =
        shl (16|M16)             r8.0<1>:q     r14.0<2;1,0>:d    1:w               {I@5}             //  ALU pipe: int; $569
        shl (16|M0)              r10.0<1>:q    r12.0<2;1,0>:d    1:w                                 //  ALU pipe: int; $569
        shl (32|M0)              r26.0<1>:d    r18.0<1;1,0>:d    5:w               {Compacted,I@6}   //  ALU pipe: int; $663

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
        add (16|M0)              r132.0<1>:uq  r4.3<0;1,0>:uq    r16.0<2;1,0>:d   {I@5}              //  ALU pipe: int; $559

// Line 282:  local_weights[Width * e + i] =
        add (16|M16)             r18.0<1>:q    r8.0<1;1,0>:q     r5.4<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $570
        add (16|M0)              r16.0<1>:q    r10.0<1;1,0>:q    r5.4<0;1,0>:q    {Compacted,I@4}    //  ALU pipe: int; $570

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
        add (16|M16)             r134.0<1>:uq  r4.3<0;1,0>:uq    r20.0<2;1,0>:d                      //  ALU pipe: int; $559 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}
        mov (16|M0)              r44.0<2>:ud   r26.0<1;1,0>:ud                  {Compacted,I@5}      //  ALU pipe: int; $665

// Line 282:  local_weights[Width * e + i] =
        load.ugm.d32.a64 (32|M0)  r42:2         [r16:4]            {I@3,$28} // ex_desc:0x0; desc:0x8200580 // $571
        load.ugm.d32.a64 (32|M0)  r40:2         [r16:4+0x4]        {$29} // ex_desc:0x4000; desc:0x8200580 // $572
        load.ugm.d32.a64 (32|M0)  r38:2         [r16:4+0x8]        {$30} // ex_desc:0x8000; desc:0x8200580 // $573
        load.ugm.d32.a64 (32|M0)  r24:2         [r16:4+0xC]        {$31} // ex_desc:0xC000; desc:0x8200580 // $574
        load.ugm.d32.a64 (32|M0)  r12:2         [r16:4+0x14]       {$0} // ex_desc:0x14000; desc:0x8200580 // $589
        load.ugm.d32.a64 (32|M0)  r10:2         [r16:4+0x18]       {$1} // ex_desc:0x18000; desc:0x8200580 // $590
        load.ugm.d32.a64 (32|M0)  r8:2          [r16:4+0x1C]       {$2} // ex_desc:0x1C000; desc:0x8200580 // $591
        load.ugm.d32.a64 (32|M0)  r14:2         [r16:4+0x10]       {$3} // ex_desc:0x10000; desc:0x8200580 // $588
(W)     add (1|M0)               r4.3<1>:uq    r255.2<0;1,0>:uq  0x10:uw                             //  ALU pipe: int; $664

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
        mov (16|M0)              r2.0<1>:ud    r128.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $548
        mov (16|M16)             r3.0<1>:ud    r130.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $548
        add (16|M0)              r124.0<1>:uq  r4.3<0;1,0>:uq    r44.0<2;1,0>:d   {I@3}              //  ALU pipe: int; $665

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r34.0<1>:uq   r132.0<1;1,0>:uq  0x4:uw                              //  ALU pipe: int; $615
        add (16|M16)             r36.0<1>:uq   r134.0<1;1,0>:uq  0x4:uw                              //  ALU pipe: int; $615

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $549

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
(W)     mul (1|M0)               acc0.0<1>:d   r22.0<0;1,0>:d    r6.16<0;1,0>:uw                     //  ALU pipe: int; $556 R{} IR{}{E:3,E:3,},  {BC=1}

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r30.0<1>:q    r132.0<1;1,0>:q   0x4:uw                              //  ALU pipe: int; $628
        add (16|M16)             r32.0<1>:q    r134.0<1;1,0>:q   0x4:uw                              //  ALU pipe: int; $628

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
(W)     macl (1|M0)              r6.0<1>:d     r22.0<0;1,0>:d    r6.8<0;1,0>:d    {Compacted,$24.src} //  ALU pipe: int; $557 R{} IR{}{E:3,E:3,},  {BC=1}

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r20.0<1>:q    r132.0<1;1,0>:q   0x4:uw                              //  ALU pipe: int; $641

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@6}    //  ALU pipe: int; $550

// Line 282:  local_weights[Width * e + i] =
        add (16|M16)             r22.0<1>:q    r134.0<1;1,0>:q   0x4:uw                              //  ALU pipe: int; $641

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $676

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
        mov (16|M0)              r138.0<2>:ud  r128.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $547
        mov (16|M16)             r136.0<2>:ud  r130.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $547

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r16.0<1>:q    r132.0<1;1,0>:q   0x4:uw              {$3.src}        //  ALU pipe: int; $654
        add (16|M16)             r18.0<1>:q    r134.0<1;1,0>:q   0x4:uw                              //  ALU pipe: int; $654

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud              {F@1}           //  ALU pipe: int; $676

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 273:  (has_initial_state != nullptr && has_initial_state[batch_id]));
        mov (16|M0)              r138.1<2>:ud  r2.0<1;1,0>:ud                   {Compacted,I@7}      //  ALU pipe: int; $552
        mov (16|M16)             r136.1<2>:ud  r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $552
        mov (16|M16)             r28.0<2>:ud   r27.0<1;1,0>:ud                  {Compacted}          //  ALU pipe: int; $665

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,I@2}   //  ALU pipe: float; $669

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
(W)     shl (1|M0)               r4.4<1>:q     r6.0<0;1,0>:d     1:w                                 //  ALU pipe: int; $659

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $675

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        add (16|M16)             r126.0<1>:uq  r4.3<0;1,0>:uq    r28.0<2;1,0>:d   {I@3}              //  ALU pipe: int; $665

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r186.0<1>:q   r132.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $585

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@4,$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $676

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 282:  local_weights[Width * e + i] =
        add (16|M0)              r198.0<1>:q   r132.0<1;1,0>:q   16:w               {Compacted}      //  ALU pipe: int; $596
        add (16|M0)              r210.0<1>:q   r132.0<1;1,0>:q   24:w               {Compacted}      //  ALU pipe: int; $603
        add (16|M16)             r184.0<1>:q   r134.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $585
        add (16|M16)             r196.0<1>:q   r134.0<1;1,0>:q   16:w               {Compacted}      //  ALU pipe: int; $596
        add (16|M16)             r208.0<1>:q   r134.0<1;1,0>:q   24:w               {Compacted}      //  ALU pipe: int; $603

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $674

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 282:  local_weights[Width * e + i] =
        mov (32|M0)              r45.0<1>:w    r42.0<2;1,0>:w                   {$28.dst}            //  ALU pipe: int; $575
        mov (32|M0)              r44.0<1>:w    r42.1<2;1,0>:w                                        //  ALU pipe: int; $576
        mov (32|M0)              r43.0<1>:w    r40.0<2;1,0>:w                   {$29.dst}            //  ALU pipe: int; $577
        mov (32|M0)              r42.0<1>:w    r40.1<2;1,0>:w                                        //  ALU pipe: int; $578
        mov (32|M0)              r41.0<1>:w    r38.0<2;1,0>:w                   {$30.dst}            //  ALU pipe: int; $581
        mov (32|M0)              r40.0<1>:w    r38.1<2;1,0>:w                                        //  ALU pipe: int; $582
        mov (32|M0)              r39.0<1>:w    r24.0<2;1,0>:w                   {$31.dst}            //  ALU pipe: int; $583
        mov (32|M0)              r38.0<1>:w    r24.1<2;1,0>:w                                        //  ALU pipe: int; $584
        mov (32|M0)              r25.0<1>:w    r12.0<2;1,0>:w                   {$0.dst}             //  ALU pipe: int; $594
        mov (32|M0)              r24.0<1>:w    r12.1<2;1,0>:w                                        //  ALU pipe: int; $595
        mov (32|M0)              r13.0<1>:w    r10.0<2;1,0>:w                   {$1.dst}             //  ALU pipe: int; $599
        mov (32|M0)              r12.0<1>:w    r10.1<2;1,0>:w                                        //  ALU pipe: int; $600
        mov (32|M0)              r1.0<1>:w     r8.1<2;1,0>:w                    {$2.dst}             //  ALU pipe: int; $602
        mov (32|M0)              r10.0<1>:w    r8.0<2;1,0>:w                                         //  ALU pipe: int; $601
        mov (32|M0)              r49.0<1>:w    r14.0<2;1,0>:w                   {$3.dst}             //  ALU pipe: int; $592
        mov (16|M0)              r46.0<4>:w    r45.0<1;1,0>:w                                        //  ALU pipe: int; $606
        mov (32|M0)              r48.0<1>:w    r14.1<2;1,0>:w                                        //  ALU pipe: int; $593
        mov (16|M16)             r8.0<4>:w     r45.16<1;1,0>:w                                       //  ALU pipe: int; $606
        mov (16|M0)              r46.1<4>:w    r44.0<1;1,0>:w                                        //  ALU pipe: int; $607
        mov (16|M16)             r8.1<4>:w     r44.16<1;1,0>:w                                       //  ALU pipe: int; $607
        mov (16|M16)             r14.0<4>:w    r41.16<1;1,0>:w                                       //  ALU pipe: int; $619
        mov (16|M0)              r46.2<4>:w    r43.0<1;1,0>:w                                        //  ALU pipe: int; $608
        mov (16|M16)             r8.2<4>:w     r43.16<1;1,0>:w                                       //  ALU pipe: int; $608
        mov (16|M0)              r44.0<4>:w    r41.0<1;1,0>:w                                        //  ALU pipe: int; $619
        mov (16|M16)             r14.1<4>:w    r40.16<1;1,0>:w                                       //  ALU pipe: int; $620
        mov (16|M0)              r46.3<4>:w    r42.0<1;1,0>:w                                        //  ALU pipe: int; $609
        mov (16|M16)             r8.3<4>:w     r42.16<1;1,0>:w                                       //  ALU pipe: int; $609
        mov (16|M0)              r44.1<4>:w    r40.0<1;1,0>:w                                        //  ALU pipe: int; $620
        mov (16|M0)              r42.0<4>:w    r49.0<1;1,0>:w                                        //  ALU pipe: int; $632
        mov (16|M16)             r40.0<4>:w    r49.16<1;1,0>:w                                       //  ALU pipe: int; $632
        mov (16|M0)              r42.1<4>:w    r48.0<1;1,0>:w                                        //  ALU pipe: int; $633
        mov (16|M16)             r40.1<4>:w    r48.16<1;1,0>:w                                       //  ALU pipe: int; $633
        mov (16|M16)             r14.2<4>:w    r39.16<1;1,0>:w                                       //  ALU pipe: int; $621
        mov (16|M0)              r44.2<4>:w    r39.0<1;1,0>:w                                        //  ALU pipe: int; $621
        mov (16|M0)              r42.2<4>:w    r25.0<1;1,0>:w                                        //  ALU pipe: int; $634
        mov (16|M16)             r40.2<4>:w    r25.16<1;1,0>:w                                       //  ALU pipe: int; $634
        mov (16|M16)             r14.3<4>:w    r38.16<1;1,0>:w                                       //  ALU pipe: int; $622
        mov (16|M0)              r44.3<4>:w    r38.0<1;1,0>:w                                        //  ALU pipe: int; $622
        mov (16|M0)              r42.3<4>:w    r24.0<1;1,0>:w                                        //  ALU pipe: int; $635
        mov (16|M16)             r40.3<4>:w    r24.16<1;1,0>:w                                       //  ALU pipe: int; $635
        mov (16|M0)              r38.0<4>:w    r13.0<1;1,0>:w                                        //  ALU pipe: int; $645
        mov (16|M16)             r24.0<4>:w    r13.16<1;1,0>:w                                       //  ALU pipe: int; $645
        mov (16|M0)              r38.1<4>:w    r12.0<1;1,0>:w                                        //  ALU pipe: int; $646
        mov (16|M16)             r24.1<4>:w    r12.16<1;1,0>:w                                       //  ALU pipe: int; $646
        mov (16|M0)              r38.2<4>:w    r10.0<1;1,0>:w                                        //  ALU pipe: int; $647
        mov (16|M16)             r24.2<4>:w    r10.16<1;1,0>:w                                       //  ALU pipe: int; $647
        mov (16|M16)             r11.0<1>:d    r8.0<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $611
        mov (16|M0)              r10.0<1>:d    r46.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $610
        mov (16|M16)             r13.0<1>:d    r8.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $613
        mov (16|M0)              r12.0<1>:d    r46.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $612
        store.ugm.d32.a64.wb.wb (32|M0)  [r132:4] r10:2            {I@3,$5} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $614
        mov (16|M0)              r8.0<1>:d     r44.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $623
        mov (16|M16)             r9.0<1>:d     r14.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $624
        store.ugm.d32.a64.wb.wb (32|M0)  [r34:4] r12:2             {I@3,$6} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $616
        mov (16|M0)              r10.0<1>:d    r44.1<2;1,0>:d                   {Compacted,$5.src}   //  ALU pipe: int; $625
        mov (16|M16)             r11.0<1>:d    r14.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $626
        mov (16|M0)              r38.3<4>:w    r1.0<1;1,0>:w                                         //  ALU pipe: int; $648
        mov (16|M16)             r24.3<4>:w    r1.16<1;1,0>:w                                        //  ALU pipe: int; $648
        mov (16|M0)              r12.0<1>:d    r42.0<2;1,0>:d                   {Compacted,$6.src}   //  ALU pipe: int; $636
        mov (16|M16)             r13.0<1>:d    r40.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $637
        store.ugm.d32.a64.wb.wb (32|M0)  [r132:4+0x8] r8:2         {I@7,$7} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $627
        mov (16|M0)              r14.0<1>:d    r42.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $638
        mov (16|M16)             r15.0<1>:d    r40.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $639
        store.ugm.d32.a64.wb.wb (32|M0)  [r30:4+0x8] r10:2         {I@7,$8} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $629
        mov (16|M0)              r8.0<1>:d     r38.0<2;1,0>:d                   {Compacted,@6,$7.src} //  ALU pipe: int; $649
        mov (16|M16)             r9.0<1>:d     r24.0<2;1,0>:d                   {Compacted,I@6}      //  ALU pipe: int; $650
        store.ugm.d32.a64.wb.wb (32|M0)  [r132:4+0x10] r12:2       {I@5,$9} // ex_desc:0x10000; desc:0x80E0584 //  address space: private; ; $640
        mov (16|M0)              r10.0<1>:d    r38.1<2;1,0>:d                   {Compacted,$8.src}   //  ALU pipe: int; $651
        mov (16|M16)             r11.0<1>:d    r24.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $652
        store.ugm.d32.a64.wb.wb (32|M0)  [r20:4+0x10] r14:2        {I@5,$10} // ex_desc:0x10000; desc:0x80E0584 //  address space: private; ; $642
        store.ugm.d32.a64.wb.wb (32|M0)  [r132:4+0x18] r8:2        {I@3,$11} // ex_desc:0x18000; desc:0x80E0584 //  address space: private; ; $653
        store.ugm.d32.a64.wb.wb (32|M0)  [r16:4+0x18] r10:2        {I@1,$12} // ex_desc:0x18000; desc:0x80E0584 //  address space: private; ; $655

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$13} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $670

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $674
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted,$24.dst}  //  ALU pipe: int; $676
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $676
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $676
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $676

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 274:  T* conv_states_ptr = conv_states + states_id * conv_states_stride_0;
(W)     add (1|M0)               r162.4<1>:q   r4.4<0;1,0>:q     r5.6<0;1,0>:q                       //  ALU pipe: int; $660

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$4.src}             //  ALU pipe: int; $676
        sync.allrd                           null                             {A@1}                  // $676
        sync.allwr                           null                                                    // $676
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $676
// B040: [FCALL],  [inDivergent],  Preds:{B039},  Succs:{B041}
_L_k0_0_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $676
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $676
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $676

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {$13.src}            //  ALU pipe: int; $679
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $679
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4] r2:2          {I@2,$14} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $680

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $676

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$15.dst}    // $679
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $679
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $679
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $679

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$14.src} //  ALU pipe: float; $685

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $691

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$16} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $686

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $690
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $690
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $692
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $692
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $692
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $692

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $692

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$15.src}            //  ALU pipe: int; $692
        sync.allrd                           null                             {A@1}                  // $692
        sync.allwr                           null                                                    // $692
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $692
// B041: [FCALL],  [inDivergent],  Preds:{B040},  Succs:{B042}
_L_k0_1_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $692
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $692
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $692

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$16.src}         //  ALU pipe: int; $696
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $695
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x8] r2:2      {I@2,$17} // ex_desc:0x8000; desc:0x80E0B84 //  address space: private; ; $697

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $692

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$18.dst}    // $695
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $695
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $695
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $695

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$17.src} //  ALU pipe: float; $702

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $708

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$19} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $703

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r170.0<1>:q   r124.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $695
        add (16|M16)             r168.0<1>:q   r126.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $695

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $707
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $707
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $709
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $709
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $709
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $709

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $709

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $709
        sync.allrd                           null                             {A@1}                  // $709
        sync.allwr                           null                                                    // $709
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $709
// B042: [FCALL],  [inDivergent],  Preds:{B041},  Succs:{B043}
_L_k0_2_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $709
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $709
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $709

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$19.src}         //  ALU pipe: int; $713
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $712
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x10] r2:2     {I@2,$20} // ex_desc:0x10000; desc:0x80E0B84 //  address space: private; ; $714

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$21} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $709

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$21.dst}    // $712
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $712
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $712
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $712

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$20.src} //  ALU pipe: float; $719

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $725

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$22} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $720

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r174.0<1>:q   r124.0<1;1,0>:q   16:w               {Compacted}      //  ALU pipe: int; $712
        add (16|M16)             r172.0<1>:q   r126.0<1;1,0>:q   16:w               {Compacted}      //  ALU pipe: int; $712

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $724
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $724
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $726
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $726
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $726
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $726

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$21} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $726

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$21.src}            //  ALU pipe: int; $726
        sync.allrd                           null                             {A@1}                  // $726
        sync.allwr                           null                                                    // $726
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $726
// B043: [FCALL],  [inDivergent],  Preds:{B042},  Succs:{B044}
_L_k0_3_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $726
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $726
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $726

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$22.src}         //  ALU pipe: int; $730
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $729
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x18] r2:2     {I@2,$23} // ex_desc:0x18000; desc:0x80E0B84 //  address space: private; ; $731

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$24} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $726

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$24.dst}    // $729
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $729
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $729
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $729

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$23.src} //  ALU pipe: float; $736

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $742

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$25} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $737

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r178.0<1>:q   r124.0<1;1,0>:q   24:w               {Compacted}      //  ALU pipe: int; $729
        add (16|M16)             r176.0<1>:q   r126.0<1;1,0>:q   24:w               {Compacted}      //  ALU pipe: int; $729

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $741
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $741
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $743
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $743
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $743
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $743

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $743

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $743
        sync.allrd                           null                             {A@1}                  // $743
        sync.allwr                           null                                                    // $743
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $743
// B044: [FCALL],  [inDivergent],  Preds:{B043},  Succs:{B045}
_L_k0_4_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $743
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $743
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $743

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$25.src}         //  ALU pipe: int; $747
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   2:d               {$11.src}         //  ALU pipe: int; $748

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $743

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$26.dst}    // $748
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   2:d               {$12.src}         //  ALU pipe: int; $748
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $746
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $746
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $746
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$27} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $748
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $746

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$27.src} //  ALU pipe: float; $753

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $759

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$28} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $754

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r182.0<1>:q   r124.0<1;1,0>:q   2:w               {Compacted}       //  ALU pipe: int; $746
        add (16|M16)             r180.0<1>:q   r126.0<1;1,0>:q   2:w               {Compacted}       //  ALU pipe: int; $746

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $758
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $758
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $760
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $760
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $760
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $760

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $760

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $760
        sync.allrd                           null                             {A@1}                  // $760
        sync.allwr                           null                                                    // $760
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $760
// B045: [FCALL],  [inDivergent],  Preds:{B044},  Succs:{B046}
_L_k0_5_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $760
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $760
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $760

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$28.src}         //  ALU pipe: int; $764
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   10:d                                //  ALU pipe: int; $765

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $760

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$29.dst}    // $765
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   10:d                                //  ALU pipe: int; $765
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $763
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $763
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $763
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$30} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $765
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $763

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$30.src} //  ALU pipe: float; $770

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $776

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$31} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $771

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r190.0<1>:q   r124.0<1;1,0>:q   10:w               {Compacted}      //  ALU pipe: int; $763
        add (16|M16)             r188.0<1>:q   r126.0<1;1,0>:q   10:w               {Compacted}      //  ALU pipe: int; $763

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $775
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $775
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $777
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $777
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $777
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $777

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$29} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $777

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$29.src}            //  ALU pipe: int; $777
        sync.allrd                           null                             {A@1}                  // $777
        sync.allwr                           null                                                    // $777
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $777
// B046: [FCALL],  [inDivergent],  Preds:{B045},  Succs:{B047}
_L_k0_6_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $777
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $777
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $777

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$31.src}         //  ALU pipe: int; $781
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   18:d                                //  ALU pipe: int; $782

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $777

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$0.dst}     // $782
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   18:d                                //  ALU pipe: int; $782
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $780
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $780
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $780
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$1} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $782
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $780

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$1.src} //  ALU pipe: float; $787

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $793

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$2} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $788

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r194.0<1>:q   r124.0<1;1,0>:q   18:w               {Compacted}      //  ALU pipe: int; $780
        add (16|M16)             r192.0<1>:q   r126.0<1;1,0>:q   18:w               {Compacted}      //  ALU pipe: int; $780

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $792
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $792
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $794
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $794
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $794
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $794

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $794

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $794
        sync.allrd                           null                             {A@1}                  // $794
        sync.allwr                           null                                                    // $794
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $794
// B047: [FCALL],  [inDivergent],  Preds:{B046},  Succs:{B048}
_L_k0_7_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $794
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $794
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $794

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$2.src}          //  ALU pipe: int; $798
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   26:d                                //  ALU pipe: int; $799

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$3} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $794

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$3.dst}     // $799
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   26:d                                //  ALU pipe: int; $799
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $797
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $797
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $797
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$4} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $799
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $797

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$4.src} //  ALU pipe: float; $804

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $810

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$5} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $805

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r202.0<1>:q   r124.0<1;1,0>:q   26:w               {Compacted}      //  ALU pipe: int; $797
        add (16|M16)             r200.0<1>:q   r126.0<1;1,0>:q   26:w               {Compacted}      //  ALU pipe: int; $797

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $809
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $809
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $811
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $811
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $811
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $811

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$3} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $811

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$3.src}             //  ALU pipe: int; $811
        sync.allrd                           null                             {A@1}                  // $811
        sync.allwr                           null                                                    // $811
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $811
// B048: [FCALL],  [inDivergent],  Preds:{B047},  Succs:{B049}
_L_k0_8_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $811
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $811
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $811

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$5.src}          //  ALU pipe: int; $815
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $814
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x4] r2:2      {I@2,$6} // ex_desc:0x4000; desc:0x80E0B84 //  address space: private; ; $816

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$7} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $811

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$7.dst}     // $814
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $814
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $814
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $814

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$6.src} //  ALU pipe: float; $821

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $827

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$8} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $822

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r206.0<1>:q   r124.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $814
        add (16|M16)             r204.0<1>:q   r126.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $814

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $826
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $826
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $828
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $828
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $828
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $828

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$7} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $828

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$7.src}             //  ALU pipe: int; $828
        sync.allrd                           null                             {A@1}                  // $828
        sync.allwr                           null                                                    // $828
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $828
// B049: [FCALL],  [inDivergent],  Preds:{B048},  Succs:{B050}
_L_k0_9_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $828
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $828
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $828

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$8.src}          //  ALU pipe: int; $832
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $831
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0xC] r2:2      {I@2,$11} // ex_desc:0xC000; desc:0x80E0B84 //  address space: private; ; $833

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $828

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$12.dst}    // $831
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $831
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $831
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $831

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$11.src} //  ALU pipe: float; $838

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $844

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$13} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $839

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r214.0<1>:q   r124.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $831
        add (16|M16)             r212.0<1>:q   r126.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $831

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $843
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $843
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $845
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $845
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $845
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $845

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $845

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$12.src}            //  ALU pipe: int; $845
        sync.allrd                           null                             {A@1}                  // $845
        sync.allwr                           null                                                    // $845
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $845
// B050: [FCALL],  [inDivergent],  Preds:{B049},  Succs:{B051}
_L_k0_10_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $845
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $845
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $845

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$13.src}         //  ALU pipe: int; $849
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $848
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x14] r2:2     {I@2,$14} // ex_desc:0x14000; desc:0x80E0B84 //  address space: private; ; $850

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$15} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $845

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$15.dst}    // $848
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $848
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $848
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $848

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$14.src} //  ALU pipe: float; $855

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $861

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$16} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $856

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r218.0<1>:q   r124.0<1;1,0>:q   20:w               {Compacted}      //  ALU pipe: int; $848
        add (16|M16)             r216.0<1>:q   r126.0<1;1,0>:q   20:w               {Compacted}      //  ALU pipe: int; $848

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $860
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $860
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $862
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $862
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $862
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $862

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$15} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $862

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$15.src}            //  ALU pipe: int; $862
        sync.allrd                           null                             {A@1}                  // $862
        sync.allwr                           null                                                    // $862
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $862
// B051: [FCALL],  [inDivergent],  Preds:{B050},  Succs:{B052}
_L_k0_11_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $862
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $862
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $862

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$16.src}         //  ALU pipe: int; $866
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $865
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r124:4+0x1C] r2:2     {I@2,$17} // ex_desc:0x1C000; desc:0x80E0B84 //  address space: private; ; $867

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $862

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$18.dst}    // $865
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $865
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $865
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $865

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$17.src} //  ALU pipe: float; $872

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $878

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$19} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $873

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r222.0<1>:q   r124.0<1;1,0>:q   28:w               {Compacted}      //  ALU pipe: int; $865
        add (16|M16)             r220.0<1>:q   r126.0<1;1,0>:q   28:w               {Compacted}      //  ALU pipe: int; $865

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $877
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $877
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $879
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $879
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $879
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $879

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $879

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $879
        sync.allrd                           null                             {A@1}                  // $879
        sync.allwr                           null                                                    // $879
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $879
// B052: [FCALL],  [inDivergent],  Preds:{B051},  Succs:{B053}
_L_k0_12_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $879
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $879
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $879

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$19.src}         //  ALU pipe: int; $883
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   6:d                                 //  ALU pipe: int; $884

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$20} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $879

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$20.dst}    // $884
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   6:d                                 //  ALU pipe: int; $884
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $882
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $882
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $882
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$21} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $884
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $882

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$21.src} //  ALU pipe: float; $889

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $895

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$22} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $890

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r226.0<1>:q   r124.0<1;1,0>:q   6:w               {Compacted}       //  ALU pipe: int; $882
        add (16|M16)             r224.0<1>:q   r126.0<1;1,0>:q   6:w               {Compacted}       //  ALU pipe: int; $882

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $894
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $894
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $896
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $896
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $896
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$20} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$20.src}            //  ALU pipe: int; $896
        sync.allrd                           null                             {A@1}                  // $896
        sync.allwr                           null                                                    // $896
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $896
// B053: [FCALL],  [inDivergent],  Preds:{B052},  Succs:{B054}
_L_k0_13_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $896
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $896
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $896

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$22.src}         //  ALU pipe: int; $900
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   14:d                                //  ALU pipe: int; $901

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$23} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$23.dst}    // $901
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   14:d                                //  ALU pipe: int; $901
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $899
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $899
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $899
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$24} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $901
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $899

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$24.src} //  ALU pipe: float; $906

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $912

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$25} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $907

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r230.0<1>:q   r124.0<1;1,0>:q   14:w               {Compacted}      //  ALU pipe: int; $899
        add (16|M16)             r228.0<1>:q   r126.0<1;1,0>:q   14:w               {Compacted}      //  ALU pipe: int; $899

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $911
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $911
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $913
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $913
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $913
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $913

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$23} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $913

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$23.src}            //  ALU pipe: int; $913
        sync.allrd                           null                             {A@1}                  // $913
        sync.allwr                           null                                                    // $913
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $913
// B054: [FCALL],  [inDivergent],  Preds:{B053},  Succs:{B055}
_L_k0_14_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $913
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $913
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $913

// Line 55:  value = from_float(rhs);
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {@7,$25.src}         //  ALU pipe: int; $917
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   22:d                                //  ALU pipe: int; $918

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $913

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        sync.nop                             null                             {Compacted,$26.dst}    // $918
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   22:d                                //  ALU pipe: int; $918
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $916
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $916
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $916
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$27} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $918
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $916

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        mov (32|M0)              r2.0<1>:f     0x0:f                               {Compacted,$27.src} //  ALU pipe: float; $923

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $929

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 293:  local_input[Width * e + i] = 0.0f;
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {F@1,$28} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $924

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M0)              r234.0<1>:q   r124.0<1;1,0>:q   22:w               {Compacted}      //  ALU pipe: int; $916
        add (16|M16)             r232.0<1>:q   r126.0<1;1,0>:q   22:w               {Compacted}      //  ALU pipe: int; $916

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r136.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $928
        mov (16|M0)              r26.0<1>:uq   r138.0<1;1,0>:uq                 {Compacted}          //  ALU pipe: int; $928
(W)     mov (1|M0)               r163.2<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $930
(W)     mov (1|M0)               r163.3<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $930
(W)     mov (1|M0)               r163.4<1>:ud  f2.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $930
(W)     mov (1|M0)               r163.5<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $930

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $930

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $930
        sync.allrd                           null                             {A@1}                  // $930
        sync.allwr                           null                                                    // $930
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $930
// B055: [inDivergent],  Preds:{B054},  Succs:{B056, B064}
_L_k0_15_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $930
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $930
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $930

// Line 55:  value = from_float(rhs);
(W)     mov (1|M0)               f2.0<1>:ud    r163.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $933
        mov (32|M0)              r2.0<1>:ud    r26.0<1;1,0>:uw                  {$28.src}            //  ALU pipe: int; $934
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   30:d                                //  ALU pipe: int; $935

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $930

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 297:  int seq_cu_len = token_id - seq_start_offset + 1;
        sync.nop                             null                             {Compacted,$29.dst}    // $940
(W)     add (1|M0)               r4.15<1>:d    r253.6<0;1,0>:d   -r163.0<0;1,0>:d {$29.dst}          //  ALU pipe: int; $940

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   30:d                                //  ALU pipe: int; $935
        add (16|M0)              r238.0<1>:q   r124.0<1;1,0>:q   30:w               {Compacted}      //  ALU pipe: int; $933

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 298:  int input_load_len = seq_cu_len >= Width ? Width : seq_cu_len;
(W)     sel (1|M0)    (lt)f0.0   r4.12<1>:d    r4.15<0;1,0>:d    3:w               {I@3}             //  ALU pipe: int; $943
(W)     cmp (1|M0)    (gt)f2.0   null<1>:d     r4.15<0;1,0>:d    2:w                                 //  ALU pipe: int; $948

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@4,$30} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $935

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 299:  int states_load_len = seq_cu_len >= Width ? 0 : Width - input_load_len;
(W)     add (1|M0)               r6.0<1>:d     -r4.12<0;1,0>:d   3:w               {Compacted,I@2}   //  ALU pipe: int; $946

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
        add (16|M16)             r236.0<1>:q   r126.0<1;1,0>:q   30:w               {Compacted}      //  ALU pipe: int; $933
(W)     mov (1|M0)               f0.0<1>:ud    r163.2<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $933
(W)     mov (1|M0)               f1.0<1>:ud    r163.3<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $933

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 299:  int states_load_len = seq_cu_len >= Width ? 0 : Width - input_load_len;
(W&~f2.0) sel (1|M0)             r4.6<1>:d     r6.0<0;1,0>:d     0:w               {I@4}             //  ALU pipe: int; $950
(W)     cmp (32|M0)   (ne)f2.0   null<1>:d     r162.4<0;1,0>:d   0:w                                 //  ALU pipe: int; $952

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 55:  value = from_float(rhs);
(W)     mov (1|M0)               f3.0<1>:ud    r163.5<0;1,0>:ud                                      //  ALU pipe: int; $933

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 300:  if (states_load_len != 0 && has_init_conv_states) {
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                                      //  ALU pipe: int; $958
(W&f2.0) cmp (32|M0)  (gt)f2.0   null<1>:d     r4.6<0;1,0>:d     0:w               {I@4}             //  ALU pipe: int; $954
(W&~f2.0) jmpi                               _0_143                                                  //  ALU pipe: int; $958
// B056: [inDivergent],  Preds:{B055},  Succs:{B057, B058}
_0_144:

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     cmp (32|M0)   (lt)f2.0   null<1>:ud    r4.6<0;1,0>:ud    0x8:uw                              //  ALU pipe: int; $962
(W)     and (1|M0)               r4.13<1>:d    r4.6<0;1,0>:d     7:w                                 //  ALU pipe: int; $961
(W&~f2.0) jmpi                               _0_145                                                  //  ALU pipe: int; $963
// B057: [inDivergent],  Preds:{B056},  Succs:{B060}
_0_146:
(W)     mov (1|M0)               r4.7<1>:d     0:w                                                   //  ALU pipe: int; $965
(W)     jmpi                                 _0_147                                                  // $966
// B058: [inDivergent],  Preds:{B056},  Succs:{B059}
_0_145:
(W)     and (1|M0)               r4.14<1>:d    r4.6<0;1,0>:d     -8:w                                //  ALU pipe: int; $968
(W)     shl (1|M0)               r4.5<1>:q     r7.1<0;1,0>:d     1:w                                 //  ALU pipe: int; $970
(W)     mov (2|M0)               r4.8<1>:d     0:w                                                   //  ALU pipe: int; $971
// B059: [inDivergent],  Preds:{B059, B058},  Succs:{B060, B059}
_0_148:

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     add3 (1|M0)              r6.1<1>:d     r4.8<0;0>:d       -r4.6<0;0>:d      3:w               {I@1} //  ALU pipe: int; $976

// Line 310:  local_input[Width * e + i] = tmp[e];
(W)     shl (1|M0)               r6.0<1>:d     r4.8<0;1,0>:d     1:w               {Compacted}       //  ALU pipe: int; $996
(W)     add (1|M0)               r4.8<1>:d     r4.8<0;1,0>:d     8:w                                 //  ALU pipe: int; $1006

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     add (1|M0)               r4.9<1>:d     r4.9<0;1,0>:d     8:w                                 //  ALU pipe: int; $1184

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     mul (1|M0)               acc0.0<1>:d   r6.1<0;1,0>:d     r7.2<0;1,0>:uw   {I@4}              //  ALU pipe: int; $977

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r70.0<1>:q    r124.0<1;1,0>:q   r6.0<0;1,0>:ud   {I@4}              //  ALU pipe: int; $998

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     macl (1|M0)              r1.0<1>:d     r6.1<0;1,0>:d     r7.1<0;1,0>:d    {Compacted}        //  ALU pipe: int; $978

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M16)             r72.0<1>:q    r126.0<1;1,0>:q   r6.0<0;1,0>:ud                      //  ALU pipe: int; $998
        add (16|M0)              r42.0<1>:uq   r70.0<1;1,0>:uq   0x4:uw              {I@3}           //  ALU pipe: int; $1062

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        sync.nop                             null                             {Compacted,$0.src}     // $978
        add (32|M0)              r2.0<1>:d     r1.0<0;1,0>:d     r144.0<1;1,0>:d  {Compacted,@3,$30.src} //  ALU pipe: int; $978

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M16)             r44.0<1>:uq   r72.0<1;1,0>:uq   0x4:uw              {I@3}           //  ALU pipe: int; $1062

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        mov (16|M0)              r10.0<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $980
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted,$31.src}  //  ALU pipe: int; $980

// Line 310:  local_input[Width * e + i] = tmp[e];
(W)     or (1|M0)                r6.4<1>:d     r6.0<0;1,0>:d     8:w               {Compacted}       //  ALU pipe: int; $1001

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        shl (16|M0)              r12.0<1>:q    r10.0<2;1,0>:d    1:w               {@3,$9.src}       //  ALU pipe: int; $980
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $980

// Line 310:  local_input[Width * e + i] = tmp[e];
(W)     shl (1|M0)               r6.1<1>:d     r4.8<0;1,0>:d     1:w                                 //  ALU pipe: int; $1007

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r8.0<1>:q     r162.4<0;1,0>:q   r12.0<1;1,0>:q   {Compacted,I@3}    //  ALU pipe: int; $981
        add (16|M16)             r10.0<1>:q    r162.4<0;1,0>:q   r1.0<1;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $981

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r66.0<1>:q    r124.0<1;1,0>:q   r6.4<0;1,0>:ud                      //  ALU pipe: int; $1003

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r16.0<1>:q    r8.0<1;1,0>:q     r4.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $988
        add (16|M16)             r18.0<1>:q    r10.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $988

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r82:4         [r8:4]             {$1} // ex_desc:0x0; desc:0x8400780 // $986

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r8.0<1>:q     r16.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,@2,$1.src} //  ALU pipe: int; $1020
        add (16|M16)             r10.0<1>:q    r18.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1020

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r78:4         [r16:4]            {$2} // ex_desc:0x0; desc:0x8400780 // $990

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r16.0<1>:q    r8.0<1;1,0>:q     r4.5<0;1,0>:q    {Compacted,@2,$2.src} //  ALU pipe: int; $1027
        add (16|M16)             r18.0<1>:q    r10.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1027

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r74:4         [r8:4]             {$3} // ex_desc:0x0; desc:0x8400780 // $1025

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r38.0<1>:q    r16.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1066

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r16:4]            {I@2,$4} // ex_desc:0x0; desc:0x8400780 // $1029

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M16)             r40.0<1>:q    r18.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted}        //  ALU pipe: int; $1066
        add (16|M0)              r34.0<1>:q    r38.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1073

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M16)             r68.0<1>:q    r126.0<1;1,0>:q   r6.4<0;1,0>:ud                      //  ALU pipe: int; $1003

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M16)             r36.0<1>:q    r40.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $1073
        add (16|M0)              r20.0<1>:q    r34.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,@3,$10.src} //  ALU pipe: int; $1121

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r62.0<1>:q    r124.0<1;1,0>:q   r6.1<0;1,0>:ud                      //  ALU pipe: int; $1009

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M16)             r22.0<1>:q    r36.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $1121 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M16)             r64.0<1>:q    r126.0<1;1,0>:q   r6.1<0;1,0>:ud                      //  ALU pipe: int; $1009
(W)     add (1|M0)               r6.5<1>:d     r6.0<0;1,0>:d     24:w                                //  ALU pipe: int; $1012
(W)     add (1|M0)               r6.6<1>:d     r6.0<0;1,0>:d     32:w                                //  ALU pipe: int; $1087

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        add (16|M0)              r16.0<1>:q    r20.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,@6,$4.src} //  ALU pipe: int; $1128 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}
        add (16|M16)             r18.0<1>:q    r22.0<1;1,0>:q    r4.5<0;1,0>:q    {Compacted,I@5}    //  ALU pipe: int; $1128

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r58.0<1>:q    r124.0<1;1,0>:q   r6.5<0;1,0>:ud   {I@4}              //  ALU pipe: int; $1014
        add (16|M16)             r60.0<1>:q    r126.0<1;1,0>:q   r6.5<0;1,0>:ud                      //  ALU pipe: int; $1014
        add (16|M0)              r30.0<1>:q    r124.0<1;1,0>:q   r6.6<0;1,0>:ud   {I@5}              //  ALU pipe: int; $1089
        add (16|M16)             r32.0<1>:q    r126.0<1;1,0>:q   r6.6<0;1,0>:ud                      //  ALU pipe: int; $1089
(W)     or (1|M0)                r6.7<1>:d     r6.0<0;1,0>:d     12:w                                //  ALU pipe: int; $1035
(W)     add (1|M0)               r6.8<1>:d     r6.0<0;1,0>:d     20:w                                //  ALU pipe: int; $1040
(W)     add (1|M0)               r6.1<1>:d     r6.0<0;1,0>:d     28:w               {Compacted}      //  ALU pipe: int; $1045
(W)     add (1|M0)               r6.0<1>:d     r6.0<0;1,0>:d     36:w               {Compacted}      //  ALU pipe: int; $1142

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     cmp (32|M0)   (eq)f2.0   null<1>:d     r4.9<0;1,0>:d     r4.14<0;1,0>:d                      //  ALU pipe: int; $1185

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r54.0<1>:q    r124.0<1;1,0>:q   r6.7<0;1,0>:ud   {I@5}              //  ALU pipe: int; $1037
        add (16|M16)             r56.0<1>:q    r126.0<1;1,0>:q   r6.7<0;1,0>:ud                      //  ALU pipe: int; $1037
        add (16|M0)              r50.0<1>:q    r124.0<1;1,0>:q   r6.8<0;1,0>:ud   {I@6}              //  ALU pipe: int; $1042
        add (16|M16)             r52.0<1>:q    r126.0<1;1,0>:q   r6.8<0;1,0>:ud                      //  ALU pipe: int; $1042
        add (16|M0)              r46.0<1>:q    r124.0<1;1,0>:q   r6.1<0;1,0>:ud   {I@7}              //  ALU pipe: int; $1047
        add (16|M16)             r48.0<1>:q    r126.0<1;1,0>:q   r6.1<0;1,0>:ud                      //  ALU pipe: int; $1047
        add (16|M0)              r12.0<1>:q    r124.0<1;1,0>:q   r6.0<0;1,0>:ud   {I@7}              //  ALU pipe: int; $1144
        add (16|M16)             r14.0<1>:q    r126.0<1;1,0>:q   r6.0<0;1,0>:ud                      //  ALU pipe: int; $1144

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     mov (1|M0)               r4.7<1>:d     r4.8<0;1,0>:d                                         //  ALU pipe: int; $1186

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r24.0<4>:w    r82.0<1;1,0>:q                   {$1.dst}             //  ALU pipe: int; $993
        mov (16|M16)             r1.0<4>:w     r84.0<1;1,0>:q                                        //  ALU pipe: int; $993
        mov (16|M0)              r84.0<4>:w    r78.0<1;1,0>:q                   {$2.dst}             //  ALU pipe: int; $1017
        mov (16|M16)             r82.0<4>:w    r80.0<1;1,0>:q                                        //  ALU pipe: int; $1017
        mov (16|M0)              r24.1<4>:w    r84.0<4;1,0>:w                   {I@2}                //  ALU pipe: int; $1017
        mov (16|M0)              r80.0<4>:w    r74.0<1;1,0>:q                   {$3.dst}             //  ALU pipe: int; $1032
        mov (16|M16)             r78.0<4>:w    r76.0<1;1,0>:q                                        //  ALU pipe: int; $1032
        mov (16|M16)             r74.0<4>:w    r10.0<1;1,0>:q                   {$4.dst}             //  ALU pipe: int; $1050
        mov (16|M0)              r24.2<4>:w    r80.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1032
        mov (16|M0)              r76.0<4>:w    r8.0<1;1,0>:q                                         //  ALU pipe: int; $1050
        mov (16|M16)             r1.1<4>:w     r82.0<4;1,0>:w                                        //  ALU pipe: int; $1017
        mov (16|M16)             r1.2<4>:w     r78.0<4;1,0>:w                   {I@5}                //  ALU pipe: int; $1032
        mov (16|M16)             r1.3<4>:w     r74.0<4;1,0>:w                   {I@5}                //  ALU pipe: int; $1050

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (16|M0)              r8.0<1>:d     r24.0<2;1,0>:d                   {Compacted,I@5}      //  ALU pipe: int; $1057

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r24.3<4>:w    r76.0<4;1,0>:w                   {I@5}                //  ALU pipe: int; $1050

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (16|M16)             r9.0<1>:d     r1.0<2;1,0>:d                    {Compacted,I@3}      //  ALU pipe: int; $1058
        mov (16|M16)             r11.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $1060
        mov (16|M0)              r10.0<1>:d    r24.1<2;1,0>:d                   {Compacted,I@3}      //  ALU pipe: int; $1059
        store.ugm.d32.a64.wb.wb (32|M0)  [r70:4] r8:2              {I@3,$5} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1061
        store.ugm.d32.a64.wb.wb (32|M0)  [r42:4] r10:2             {I@1,$6} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1063

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r38:4]            {$7} // ex_desc:0x0; desc:0x8400780 // $1071
        load.ugm.d64.a64 (32|M0)  r38:4         [r34:4]            {$8} // ex_desc:0x0; desc:0x8400780 // $1075
        shr (16|M0)              r84.0<1>:uq   r8.0<1;1,0>:uq    16:w               {$7.dst}         //  ALU pipe: int; $1079
        shr (16|M16)             r24.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1079
        shr (16|M0)              r82.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1081
        shr (16|M0)              r78.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1083
        sync.nop                             null                             {Compacted,$5.src}     // $1095
        shr (16|M16)             r70.0<1>:uq   r40.0<1;1,0>:uq   32:w               {$8.dst}         //  ALU pipe: int; $1095
        shr (16|M16)             r42.0<1>:uq   r40.0<1;1,0>:uq   48:w               {$6.src}         //  ALU pipe: int; $1097
        mov (16|M0)              r34.0<2>:w    r84.0<4;1,0>:w                   {I@6}                //  ALU pipe: int; $1080
        shr (16|M16)             r35.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1083
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                                         //  ALU pipe: int; $1078
        mov (16|M16)             r86.0<2>:w    r10.0<4;1,0>:w                                        //  ALU pipe: int; $1078
        mov (16|M16)             r84.0<2>:w    r24.0<4;1,0>:w                   {I@7}                //  ALU pipe: int; $1080
        shr (16|M16)             r80.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1081
        shr (16|M0)              r76.0<1>:uq   r38.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1093
        shr (16|M16)             r74.0<1>:uq   r40.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1093
        mov (16|M0)              r24.0<2>:w    r82.0<4;1,0>:w                                        //  ALU pipe: int; $1082
        mov (16|M0)              r8.0<2>:w     r38.0<4;1,0>:w                                        //  ALU pipe: int; $1092
        mov (16|M0)              r10.0<2>:w    r78.0<4;1,0>:w                                        //  ALU pipe: int; $1084
        mov (16|M16)             r11.0<2>:w    r40.0<4;1,0>:w                                        //  ALU pipe: int; $1092
        mov (16|M16)             r1.0<2>:w     r70.0<4;1,0>:w                                        //  ALU pipe: int; $1096
        mov (16|M16)             r9.0<2>:w     r42.0<4;1,0>:w                                        //  ALU pipe: int; $1098
        mov (16|M16)             r37.0<2>:w    r35.0<4;1,0>:w                                        //  ALU pipe: int; $1084
        mov (16|M0)              r3.0<1>:w     r2.0<2;1,0>:w                                         //  ALU pipe: int; $1078
        mov (16|M16)             r3.16<1>:w    r86.0<2;1,0>:w                                        //  ALU pipe: int; $1079
        mov (16|M0)              r25.0<1>:w    r24.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1082
        mov (16|M0)              r36.0<2>:w    r76.0<4;1,0>:w                                        //  ALU pipe: int; $1094
        mov (16|M16)             r35.0<2>:w    r74.0<4;1,0>:w                                        //  ALU pipe: int; $1094
        mov (16|M0)              r2.0<1>:w     r8.0<2;1,0>:w                    {I@7}                //  ALU pipe: int; $1092
        mov (16|M16)             r2.16<1>:w    r11.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1093
        mov (16|M0)              r24.0<1>:w    r10.0<2;1,0>:w                                        //  ALU pipe: int; $1084
        shr (16|M0)              r72.0<1>:uq   r38.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1095
        mov (16|M0)              r34.0<1>:w    r34.0<2;1,0>:w                                        //  ALU pipe: int; $1080
        mov (16|M16)             r10.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1097
        mov (16|M16)             r34.16<1>:w   r84.0<2;1,0>:w                                        //  ALU pipe: int; $1081

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (16|M16)             r1.16<1>:w    r9.0<2;1,0>:w                                         //  ALU pipe: int; $1101

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        shr (16|M0)              r44.0<1>:uq   r38.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1097

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r8.0<2>:w     r3.0<1;1,0>:w                                         //  ALU pipe: int; $1101

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r82.0<2>:w    r80.0<4;1,0>:w                                        //  ALU pipe: int; $1082
        mov (16|M0)              r11.0<1>:w    r36.0<2;1,0>:w                                        //  ALU pipe: int; $1094
        mov (16|M16)             r11.16<1>:w   r35.0<2;1,0>:w                                        //  ALU pipe: int; $1095

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r8.1<2>:w     r2.0<1;1,0>:w                                         //  ALU pipe: int; $1102

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r38.0<2>:w    r72.0<4;1,0>:w                   {I@7}                //  ALU pipe: int; $1096

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r2.0<2>:w     r34.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $1106

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r40.0<2>:w    r44.0<4;1,0>:w                   {I@7}                //  ALU pipe: int; $1098
        mov (16|M16)             r25.16<1>:w   r82.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1083

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r2.1<2>:w     r11.0<1;1,0>:w                   {I@6}                //  ALU pipe: int; $1107
        mov (16|M16)             r24.16<1>:w   r37.0<2;1,0>:w                                        //  ALU pipe: int; $1087

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r10.0<1>:w    r38.0<2;1,0>:w                   {I@6}                //  ALU pipe: int; $1096

// Line 310:  local_input[Width * e + i] = tmp[e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r66:4] r8:2              {$11} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1103

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r1.0<1>:w     r40.0<2;1,0>:w                   {I@5}                //  ALU pipe: int; $1098

// Line 310:  local_input[Width * e + i] = tmp[e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r62:4] r2:2              {I@4,$12} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1108
        mov (32|M0)              r8.0<2>:w     r25.0<1;1,0>:w                   {$11.src}            //  ALU pipe: int; $1111
        mov (32|M0)              r2.0<2>:w     r24.0<1;1,0>:w                   {@4,$12.src}         //  ALU pipe: int; $1116
        mov (32|M0)              r8.1<2>:w     r10.0<1;1,0>:w                   {I@4}                //  ALU pipe: int; $1112
        mov (32|M0)              r2.1<2>:w     r1.0<1;1,0>:w                    {I@4}                //  ALU pipe: int; $1117
        store.ugm.d32.a64.wb.wb (32|M0)  [r58:4] r8:2              {I@2,$13} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1113
        store.ugm.d32.a64.wb.wb (32|M0)  [r30:4] r2:2              {I@1,$14} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1118

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r20:4]            {$15} // ex_desc:0x0; desc:0x8400780 // $1126
        load.ugm.d64.a64 (32|M0)  r20:4         [r16:4]            {$16} // ex_desc:0x0; desc:0x8400780 // $1130
        sync.nop                             null                             {Compacted,$13.src}    // $1134
        shr (16|M0)              r60.0<1>:uq   r8.0<1;1,0>:uq    16:w               {$15.dst}        //  ALU pipe: int; $1134
        shr (16|M16)             r16.0<1>:uq   r10.0<1;1,0>:uq   16:w               {$16.src}        //  ALU pipe: int; $1134
        shr (16|M0)              r58.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1136
        shr (16|M0)              r42.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1138
        sync.nop                             null                             {Compacted,$14.src}    // $1150
        shr (16|M16)             r32.0<1>:uq   r22.0<1;1,0>:uq   32:w               {$16.dst}        //  ALU pipe: int; $1150
        shr (16|M16)             r24.0<1>:uq   r22.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1152
        mov (16|M0)              r18.0<2>:w    r60.0<4;1,0>:w                   {I@6}                //  ALU pipe: int; $1135
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                                         //  ALU pipe: int; $1133
        mov (16|M16)             r62.0<2>:w    r10.0<4;1,0>:w                                        //  ALU pipe: int; $1133
        mov (16|M16)             r60.0<2>:w    r16.0<4;1,0>:w                   {I@7}                //  ALU pipe: int; $1135
        shr (16|M16)             r44.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1136
        shr (16|M16)             r40.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1138
        shr (16|M0)              r38.0<1>:uq   r20.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1148
        shr (16|M16)             r36.0<1>:uq   r22.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1148
        mov (16|M0)              r16.0<2>:w    r58.0<4;1,0>:w                                        //  ALU pipe: int; $1137
        mov (16|M0)              r8.0<2>:w     r20.0<4;1,0>:w                                        //  ALU pipe: int; $1147
        mov (16|M0)              r10.0<2>:w    r42.0<4;1,0>:w                                        //  ALU pipe: int; $1139
        mov (16|M16)             r11.0<2>:w    r22.0<4;1,0>:w                                        //  ALU pipe: int; $1147
        mov (16|M16)             r1.0<2>:w     r32.0<4;1,0>:w                                        //  ALU pipe: int; $1151
        mov (16|M16)             r9.0<2>:w     r24.0<4;1,0>:w                                        //  ALU pipe: int; $1153
        shr (16|M0)              r34.0<1>:uq   r20.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1150
        shr (16|M0)              r30.0<1>:uq   r20.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1152
        mov (16|M0)              r3.0<1>:w     r2.0<2;1,0>:w                                         //  ALU pipe: int; $1133
        mov (16|M16)             r3.16<1>:w    r62.0<2;1,0>:w                                        //  ALU pipe: int; $1134
        mov (16|M16)             r19.0<2>:w    r36.0<4;1,0>:w                   {I@7}                //  ALU pipe: int; $1149
        mov (16|M0)              r17.0<1>:w    r16.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1137
        mov (16|M0)              r20.0<2>:w    r38.0<4;1,0>:w                                        //  ALU pipe: int; $1149
        mov (16|M0)              r2.0<1>:w     r8.0<2;1,0>:w                                         //  ALU pipe: int; $1147
        mov (16|M16)             r2.16<1>:w    r11.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1148
        mov (16|M0)              r16.0<1>:w    r10.0<2;1,0>:w                                        //  ALU pipe: int; $1139
        mov (16|M0)              r18.0<1>:w    r18.0<2;1,0>:w                                        //  ALU pipe: int; $1135
        mov (16|M16)             r10.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1152
        mov (16|M16)             r18.16<1>:w   r60.0<2;1,0>:w                                        //  ALU pipe: int; $1136

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (16|M16)             r1.16<1>:w    r9.0<2;1,0>:w                                         //  ALU pipe: int; $1156
        mov (32|M0)              r8.0<2>:w     r3.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $1156

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r58.0<2>:w    r44.0<4;1,0>:w                                        //  ALU pipe: int; $1137
        mov (16|M0)              r11.0<1>:w    r20.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1149
        mov (16|M16)             r11.16<1>:w   r19.0<2;1,0>:w                                        //  ALU pipe: int; $1150

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r8.1<2>:w     r2.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $1157

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r42.0<2>:w    r40.0<4;1,0>:w                                        //  ALU pipe: int; $1139
        mov (16|M0)              r22.0<2>:w    r34.0<4;1,0>:w                                        //  ALU pipe: int; $1151

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r2.0<2>:w     r18.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $1163

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r32.0<2>:w    r30.0<4;1,0>:w                                        //  ALU pipe: int; $1153
        mov (16|M16)             r17.16<1>:w   r58.0<2;1,0>:w                   {I@7}                //  ALU pipe: int; $1138

// Line 310:  local_input[Width * e + i] = tmp[e];
        mov (32|M0)              r2.1<2>:w     r11.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $1164
        mov (16|M16)             r16.16<1>:w   r42.0<2;1,0>:w                   {I@6}                //  ALU pipe: int; $1142

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r10.0<1>:w    r22.0<2;1,0>:w                   {I@6}                //  ALU pipe: int; $1151

// Line 310:  local_input[Width * e + i] = tmp[e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r54:4] r8:2              {$17} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1160

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r1.0<1>:w     r32.0<2;1,0>:w                   {I@5}                //  ALU pipe: int; $1153

// Line 310:  local_input[Width * e + i] = tmp[e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r50:4] r2:2              {I@4,$18} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1167
        mov (32|M0)              r8.0<2>:w     r17.0<1;1,0>:w                   {$17.src}            //  ALU pipe: int; $1170
        mov (32|M0)              r2.0<2>:w     r16.0<1;1,0>:w                   {@4,$18.src}         //  ALU pipe: int; $1177
        mov (32|M0)              r8.1<2>:w     r10.0<1;1,0>:w                   {I@4}                //  ALU pipe: int; $1171
        mov (32|M0)              r2.1<2>:w     r1.0<1;1,0>:w                    {I@4}                //  ALU pipe: int; $1178
        store.ugm.d32.a64.wb.wb (32|M0)  [r46:4] r8:2              {I@2,$31} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1174
        store.ugm.d32.a64.wb.wb (32|M0)  [r12:4] r2:2              {I@1,$0} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1181

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W&~f2.0) jmpi                               _0_148                                                  //  ALU pipe: int; $1187
// B060: [inDivergent],  Preds:{B059, B057},  Succs:{B061, B064}
_0_147:

// Line 119:  for (int e = 0; e < elems_per_item; ++e) {
(W)     cmp (32|M0)   (eq)f2.0   null<1>:d     r4.13<0;1,0>:d    0:w                                 //  ALU pipe: int; $1190
(W&f2.0) jmpi                                _0_143                                                  //  ALU pipe: int; $1191
// B061: [inDivergent],  Preds:{B060},  Succs:{B062}
_0_149:

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     mov (1|M0)               r6.4<1>:d     0:w                               {Compacted}         //  ALU pipe: int; $1194
// B062: [inDivergent],  Preds:{B063, B061},  Succs:{B063, B064}
_0_150:

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     add3 (1|M0)              r6.0<1>:d     r4.7<0;0>:d       -r4.6<0;0>:d      3:w               //  ALU pipe: int; $1198

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     add (1|M0)               r6.4<1>:d     r6.4<0;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1251

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     mul (1|M0)               acc0.0<1>:d   r6.0<0;1,0>:d     r7.2<0;1,0>:uw   {I@2}              //  ALU pipe: int; $1199

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W)     cmp (32|M0)   (eq)f2.0   null<1>:d     r6.4<0;1,0>:d     r4.13<0;1,0>:d   {I@2}              //  ALU pipe: int; $1252

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
(W)     macl (1|M0)              r6.0<1>:d     r6.0<0;1,0>:d     r7.1<0;1,0>:d    {Compacted}        //  ALU pipe: int; $1200
        sync.allrd                           ($0,$19)                                                // $1200
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r144.0<1;1,0>:d  {Compacted,@1,$30.src} //  ALU pipe: int; $1200

// Line 310:  local_input[Width * e + i] = tmp[e];
(W)     shl (1|M0)               r6.0<1>:q     r4.7<0;1,0>:ud    1:w                                 //  ALU pipe: int; $1221

// Line 305:  &conv_states_ptr[(Width - 1 - states_load_len + i) * conv_elems +
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,@2,$31.src} //  ALU pipe: int; $1202
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $1202
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1202
        add (16|M0)              r12.0<1>:q    r162.4<0;1,0>:q   r10.0<1;1,0>:q   {Compacted,@2,$9.src} //  ALU pipe: int; $1203
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1202
        add (16|M16)             r14.0<1>:q    r162.4<0;1,0>:q   r1.0<1;1,0>:q    {Compacted,@1,$10.src} //  ALU pipe: int; $1203

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r12:4]            {I@1,$20} // ex_desc:0x0; desc:0x8400780 // $1208
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                    {$20.dst}            //  ALU pipe: int; $1211
        shr (16|M16)             r14.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1212
        mov (16|M0)              r1.0<1>:w     r2.0<2;1,0>:w                    {I@2}                //  ALU pipe: int; $1211
        mov (16|M16)             r2.0<2>:w     r10.0<4;1,0>:w                                        //  ALU pipe: int; $1211
        mov (16|M16)             r1.16<1>:w    r2.0<2;1,0>:w                    {I@1}                //  ALU pipe: int; $1212
        shr (16|M0)              r2.0<1>:uq    r8.0<1;1,0>:uq    16:w                                //  ALU pipe: int; $1212
        mov (16|M0)              r12.0<2>:w    r2.0<4;1,0>:w                    {I@1}                //  ALU pipe: int; $1213
        mov (16|M16)             r2.0<2>:w     r14.0<4;1,0>:w                                        //  ALU pipe: int; $1213
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1214
        mov (16|M0)              r13.0<1>:w    r12.0<2;1,0>:w                   {I@3}                //  ALU pipe: int; $1213
        mov (16|M16)             r13.16<1>:w   r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1214
        shr (16|M0)              r2.0<1>:uq    r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1214
        mov (16|M0)              r12.0<2>:w    r2.0<4;1,0>:w                    {I@1}                //  ALU pipe: int; $1215
        mov (16|M16)             r2.0<2>:w     r15.0<4;1,0>:w                                        //  ALU pipe: int; $1215
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1216
        mov (16|M0)              r14.0<1>:w    r12.0<2;1,0>:w                   {I@3}                //  ALU pipe: int; $1215
        mov (16|M16)             r14.16<1>:w   r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1216
        shr (16|M0)              r2.0<1>:uq    r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1216

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M16)             r10.0<1>:q    r6.0<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1222

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r8.0<2>:w     r2.0<4;1,0>:w                    {I@2}                //  ALU pipe: int; $1217
        mov (16|M16)             r2.0<2>:w     r15.0<4;1,0>:w                                        //  ALU pipe: int; $1217
        mov (16|M0)              r12.0<1>:w    r8.0<2;1,0>:w                    {I@2}                //  ALU pipe: int; $1217

// Line 310:  local_input[Width * e + i] = tmp[e];
        add (16|M0)              r8.0<1>:q     r6.0<0;1,0>:q     r124.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1222
(W)     add (1|M0)               r6.0<1>:d     r4.7<0;1,0>:d     4:w                                 //  ALU pipe: int; $1227
        mov (16|M16)             r12.16<1>:w   r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1221
        mov (32|M0)              r2.0<1>:ud    r1.0<1;1,0>:uw                                        //  ALU pipe: int; $1223
(W)     shl (1|M0)               r6.0<1>:q     r6.0<0;1,0>:ud    1:w               {I@3}             //  ALU pipe: int; $1229
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@2,$21} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1224
        add (16|M0)              r8.0<1>:q     r6.0<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$21.src} //  ALU pipe: int; $1230
        add (16|M16)             r10.0<1>:q    r6.0<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1230
(W)     add (1|M0)               r6.0<1>:d     r4.7<0;1,0>:d     8:w                                 //  ALU pipe: int; $1235
        mov (32|M0)              r2.0<1>:ud    r13.0<1;1,0>:uw                                       //  ALU pipe: int; $1231
(W)     shl (1|M0)               r6.0<1>:q     r6.0<0;1,0>:ud    1:w               {I@2}             //  ALU pipe: int; $1237
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@2,$22} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1232
        add (16|M0)              r8.0<1>:q     r6.0<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$22.src} //  ALU pipe: int; $1238
        add (16|M16)             r10.0<1>:q    r6.0<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1238
(W)     add (1|M0)               r6.0<1>:d     r4.7<0;1,0>:d     12:w                                //  ALU pipe: int; $1243
        mov (32|M0)              r2.0<1>:ud    r14.0<1;1,0>:uw                                       //  ALU pipe: int; $1239
(W)     shl (1|M0)               r6.0<1>:q     r6.0<0;1,0>:ud    1:w               {I@2}             //  ALU pipe: int; $1245
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@2,$23} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1240
        add (16|M0)              r8.0<1>:q     r6.0<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$23.src} //  ALU pipe: int; $1246
        add (16|M16)             r10.0<1>:q    r6.0<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1246
        mov (32|M0)              r2.0<1>:ud    r12.0<1;1,0>:uw                                       //  ALU pipe: int; $1247
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@1,$19} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1248

// Line 302:  for (int i = 0; i < states_load_len; ++i) {
(W&f2.0) jmpi                                _0_143                                                  //  ALU pipe: int; $1253
// B063: [inDivergent],  Preds:{B062},  Succs:{B062}
_0_151:
(W)     add (1|M0)               r4.7<1>:d     r4.7<0;1,0>:d     1:w                                 //  ALU pipe: int; $1255
(W)     jmpi                                 _0_150                                                  // $1258
// B064: [inDivergent],  Preds:{B062, B060, B055},  Succs:{B065, B081}
_0_143:

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W)     cmp (32|M0)   (lt)f2.0   null<1>:d     r4.12<0;1,0>:d    0:w                                 //  ALU pipe: int; $1262
(W&f2.0) jmpi                                _0_152                                                  //  ALU pipe: int; $1263
// B065: [inDivergent],  Preds:{B064},  Succs:{B066, B067}
_0_153:

// Line 317:  const int load_local = token_id - input_load_len + 1 + i;
(W)     add (1|M0)               r6.0<1>:d     r253.6<0;1,0>:d   -r4.12<0;1,0>:d                     //  ALU pipe: int; $1266

// Line 319:  (token_indx != nullptr) ? token_indx[load_local] : load_local;
(W&~f0.0) jmpi                               _0_154                                                  //  ALU pipe: int; $1269
// B066: [inDivergent],  Preds:{B065},  Succs:{B068}
_0_155:
(W)     mov (1|M0)               r1.1<1>:d     r6.0<0;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $1271
(W)     jmpi                                 _0_156                                                  // $1272
// B067: [inDivergent],  Preds:{B065},  Succs:{B068}
_0_154:
(W)     shl (1|M0)               r6.2<1>:q     r6.0<0;1,0>:d     2:w                                 //  ALU pipe: int; $1275
        sync.allrd                           ($0,$19)                                                // $1276
(W)     add (1|M0)               r2.0<1>:q     r6.2<0;1,0>:q     r6.1<0;1,0>:q    {Compacted,@1,$30.src} //  ALU pipe: int; $1276
(W)     load.ugm.d32x1t.a64 (1|M0)  r1:1        [r2:1]             {I@1,$24} // ex_desc:0x0; desc:0x2108580 // $1277
(W)     mov (1|M0)               r1.1<1>:d     r1.0<0;1,0>:d                    {Compacted,$24.dst}  //  ALU pipe: int; $1278
// B068: [inDivergent],  Preds:{B067, B066},  Succs:{B069, B081}
_0_156:

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r1.1<0;1,0>:d     r7.0<0;1,0>:uw   {I@1}              //  ALU pipe: int; $1282

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r6.2<1>:q     r4.6<0;1,0>:d     1:w                                 //  ALU pipe: int; $1304
(W)     add (1|M0)               r6.1<1>:d     r4.6<0;1,0>:d     4:w                                 //  ALU pipe: int; $1309

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     macl (1|M0)              r1.0<1>:d     r1.1<0;1,0>:d     r7.0<0;1,0>:d    {Compacted}        //  ALU pipe: int; $1283

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W)     cmp (32|M0)   (gt)f2.0   null<1>:d     r4.15<0;1,0>:d    0:w                                 //  ALU pipe: int; $1334

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
        sync.allrd                           ($0,$19)                                                // $1283
        add (32|M0)              r2.0<1>:d     r1.0<0;1,0>:d     r142.0<1;1,0>:d  {Compacted,@2,$30.src} //  ALU pipe: int; $1283
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,@1,$31.src} //  ALU pipe: int; $1285
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $1285
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1285
        add (16|M0)              r12.0<1>:q    r10.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,@2,$9.src} //  ALU pipe: int; $1286
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1285
        add (16|M16)             r14.0<1>:q    r1.0<1;1,0>:q     r5.2<0;1,0>:q    {Compacted,@1,$10.src} //  ALU pipe: int; $1286

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r12:4]            {I@1,$25} // ex_desc:0x0; desc:0x8400780 // $1291
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                    {$25.dst}            //  ALU pipe: int; $1294
        mov (16|M16)             r1.0<2>:w     r10.0<4;1,0>:w                                        //  ALU pipe: int; $1294
        shr (16|M0)              r13.0<1>:uq   r8.0<1;1,0>:uq    16:w                                //  ALU pipe: int; $1295
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1295
        mov (16|M0)              r12.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1294
        mov (16|M16)             r12.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1295
        mov (16|M0)              r2.0<2>:w     r13.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1296
        mov (16|M16)             r1.0<2>:w     r15.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1296
        shr (16|M16)             r17.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1297
        shr (16|M0)              r15.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1297
        mov (16|M0)              r14.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1296
        mov (16|M16)             r14.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1297
        mov (16|M0)              r2.0<2>:w     r15.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1298
        mov (16|M16)             r1.0<2>:w     r17.0<4;1,0>:w                                        //  ALU pipe: int; $1298
        shr (16|M0)              r16.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1299
        mov (16|M0)              r15.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1298
        shr (16|M16)             r18.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1299
        mov (16|M0)              r2.0<2>:w     r16.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1300

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        add (16|M0)              r8.0<1>:q     r6.2<0;1,0>:q     r124.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1305
        add (16|M16)             r10.0<1>:q    r6.2<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1305

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r13.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1300

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        mov (32|M0)              r2.0<1>:ud    r12.0<1;1,0>:uw                                       //  ALU pipe: int; $1306
(W)     shl (1|M0)               r6.2<1>:q     r6.1<0;1,0>:d     1:w                                 //  ALU pipe: int; $1312
(W)     add (1|M0)               r6.1<1>:d     r4.6<0;1,0>:d     8:w                                 //  ALU pipe: int; $1317
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$26} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1307
        add (16|M0)              r8.0<1>:q     r6.2<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@2,$26.src} //  ALU pipe: int; $1313
        add (16|M16)             r10.0<1>:q    r6.2<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1313
        mov (32|M0)              r2.0<1>:ud    r14.0<1;1,0>:uw                                       //  ALU pipe: int; $1314

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r15.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1299

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r6.2<1>:q     r6.1<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1320

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r1.0<2>:w     r18.0<4;1,0>:w                                        //  ALU pipe: int; $1300
(W)     add (1|M0)               r6.1<1>:d     r4.6<0;1,0>:d     12:w                                //  ALU pipe: int; $1325

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@5,$27} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1315
        add (16|M0)              r8.0<1>:q     r6.2<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@3,$27.src} //  ALU pipe: int; $1321
        add (16|M16)             r10.0<1>:q    r6.2<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1321
        mov (32|M0)              r2.0<1>:ud    r15.0<1;1,0>:uw                                       //  ALU pipe: int; $1322
        mov (16|M16)             r13.16<1>:w   r1.0<2;1,0>:w                    {I@5}                //  ALU pipe: int; $1304
(W)     shl (1|M0)               r6.2<1>:q     r6.1<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1328
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$28} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1323
        add (16|M0)              r8.0<1>:q     r6.2<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$28.src} //  ALU pipe: int; $1329
        add (16|M16)             r10.0<1>:q    r6.2<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1329
        mov (32|M0)              r2.0<1>:ud    r13.0<1;1,0>:uw                                       //  ALU pipe: int; $1330
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@1,$29} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1331

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W&~f2.0) jmpi                               _0_152                                                  //  ALU pipe: int; $1335
// B069: [inDivergent],  Preds:{B068},  Succs:{B070, B071}
_0_157:

// Line 319:  (token_indx != nullptr) ? token_indx[load_local] : load_local;
(W&f0.0) jmpi                                _0_158                                                  //  ALU pipe: int; $1339
// B070: [inDivergent],  Preds:{B069},  Succs:{B072}
_0_159:
(W)     shl (1|M0)               r4.4<1>:q     r6.0<0;1,0>:d     2:w                                 //  ALU pipe: int; $1342
(W)     add (1|M0)               r1.0<1>:q     r4.4<0;1,0>:q     r6.1<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1343
(W)     load.ugm.d32x1t.a64 (1|M0)  r1:1        [r1:1+0x4]         {I@1,$1} // ex_desc:0x4000; desc:0x2108580 // $1345
(W)     jmpi                                 _0_160                                                  // $1346
// B071: [inDivergent],  Preds:{B069},  Succs:{B072}
_0_158:

// Line 317:  const int load_local = token_id - input_load_len + 1 + i;
(W)     add3 (1|M0)              r1.0<1>:d     r253.6<0;0>:d     -r4.12<0;0>:d     1:w               //  ALU pipe: int; $1349
// B072: [inDivergent],  Preds:{B071, B070},  Succs:{B073, B081}
_0_160:

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r1.0<0;1,0>:d     r7.0<0;1,0>:uw   {@1,$1.dst}        //  ALU pipe: int; $1355

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     1:w                                 //  ALU pipe: int; $1376

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W)     cmp (32|M0)   (gt)f2.0   null<1>:d     r4.12<0;1,0>:d    1:w                                 //  ALU pipe: int; $1410

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     macl (1|M0)              r1.0<1>:d     r1.0<0;1,0>:d     r7.0<0;1,0>:d    {Compacted}        //  ALU pipe: int; $1356

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $1380
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     5:w                                 //  ALU pipe: int; $1385

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
        add (32|M0)              r2.0<1>:d     r1.0<0;1,0>:d     r142.0<1;1,0>:d  {Compacted,@3,$29.src} //  ALU pipe: int; $1356
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1358
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $1358
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1358
        add (16|M0)              r12.0<1>:q    r10.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1359
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1358
        add (16|M16)             r14.0<1>:q    r1.0<1;1,0>:q     r5.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1359

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r12:4]            {I@1,$2} // ex_desc:0x0; desc:0x8400780 // $1364
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                    {$2.dst}             //  ALU pipe: int; $1367
        mov (16|M16)             r1.0<2>:w     r10.0<4;1,0>:w                                        //  ALU pipe: int; $1367
        shr (16|M0)              r13.0<1>:uq   r8.0<1;1,0>:uq    16:w                                //  ALU pipe: int; $1368
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1368
        mov (16|M0)              r12.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1367
        mov (16|M16)             r12.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1368
        mov (16|M0)              r2.0<2>:w     r13.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1369
        mov (16|M16)             r1.0<2>:w     r15.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1369
        shr (16|M16)             r17.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1370
        shr (16|M0)              r15.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1370
        mov (16|M0)              r14.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1369
        mov (16|M16)             r14.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1370
        mov (16|M0)              r2.0<2>:w     r15.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1371
        mov (16|M16)             r1.0<2>:w     r17.0<4;1,0>:w                                        //  ALU pipe: int; $1371
        shr (16|M0)              r16.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1372
        mov (16|M0)              r15.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1371
        shr (16|M16)             r18.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1372
        mov (16|M0)              r2.0<2>:w     r16.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1373

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1381
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1381

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r13.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1373

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        mov (32|M0)              r2.0<1>:ud    r12.0<1;1,0>:uw                                       //  ALU pipe: int; $1382
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w                                 //  ALU pipe: int; $1388
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     9:w                                 //  ALU pipe: int; $1393
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$3} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1383
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@2,$3.src} //  ALU pipe: int; $1389
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1389
        mov (32|M0)              r2.0<1>:ud    r14.0<1;1,0>:uw                                       //  ALU pipe: int; $1390

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r15.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1372

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1396

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r1.0<2>:w     r18.0<4;1,0>:w                                        //  ALU pipe: int; $1373
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     13:w                                //  ALU pipe: int; $1401

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@5,$4} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1391
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@3,$4.src} //  ALU pipe: int; $1397
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1397
        mov (32|M0)              r2.0<1>:ud    r15.0<1;1,0>:uw                                       //  ALU pipe: int; $1398

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
        mov (16|M16)             r13.16<1>:w   r1.0<2;1,0>:w                    {I@5}                //  ALU pipe: int; $1376

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1404
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$5} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1399
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$5.src} //  ALU pipe: int; $1405
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1405
        mov (32|M0)              r2.0<1>:ud    r13.0<1;1,0>:uw                                       //  ALU pipe: int; $1406
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@1,$6} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1407

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W&~f2.0) jmpi                               _0_152                                                  //  ALU pipe: int; $1411
// B073: [inDivergent],  Preds:{B072},  Succs:{B074, B075}
_0_161:

// Line 319:  (token_indx != nullptr) ? token_indx[load_local] : load_local;
(W&f0.0) jmpi                                _0_162                                                  //  ALU pipe: int; $1415
// B074: [inDivergent],  Preds:{B073},  Succs:{B076}
_0_163:
(W)     shl (1|M0)               r4.4<1>:q     r6.0<0;1,0>:d     2:w                                 //  ALU pipe: int; $1418
(W)     add (1|M0)               r1.0<1>:q     r4.4<0;1,0>:q     r6.1<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1419
(W)     load.ugm.d32x1t.a64 (1|M0)  r1:1        [r1:1+0x8]         {I@1,$7} // ex_desc:0x8000; desc:0x2108580 // $1421
(W)     jmpi                                 _0_164                                                  // $1422
// B075: [inDivergent],  Preds:{B073},  Succs:{B076}
_0_162:

// Line 317:  const int load_local = token_id - input_load_len + 1 + i;
(W)     add3 (1|M0)              r1.0<1>:d     r253.6<0;0>:d     -r4.12<0;0>:d     2:w               //  ALU pipe: int; $1425
// B076: [inDivergent],  Preds:{B075, B074},  Succs:{B077, B081}
_0_164:

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r1.0<0;1,0>:d     r7.0<0;1,0>:uw   {@1,$7.dst}        //  ALU pipe: int; $1431

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     2:w                                 //  ALU pipe: int; $1452

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W)     cmp (32|M0)   (gt)f2.0   null<1>:d     r4.12<0;1,0>:d    2:w                                 //  ALU pipe: int; $1486

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     macl (1|M0)              r1.0<1>:d     r1.0<0;1,0>:d     r7.0<0;1,0>:d    {Compacted}        //  ALU pipe: int; $1432

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $1456
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     6:w                                 //  ALU pipe: int; $1461

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
        add (32|M0)              r2.0<1>:d     r1.0<0;1,0>:d     r142.0<1;1,0>:d  {Compacted,@3,$6.src} //  ALU pipe: int; $1432
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1434
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $1434
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1434
        add (16|M0)              r12.0<1>:q    r10.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1435
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1434
        add (16|M16)             r14.0<1>:q    r1.0<1;1,0>:q     r5.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1435

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r12:4]            {I@1,$8} // ex_desc:0x0; desc:0x8400780 // $1440
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                    {$8.dst}             //  ALU pipe: int; $1443
        mov (16|M16)             r1.0<2>:w     r10.0<4;1,0>:w                                        //  ALU pipe: int; $1443
        shr (16|M0)              r13.0<1>:uq   r8.0<1;1,0>:uq    16:w                                //  ALU pipe: int; $1444
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1444
        mov (16|M0)              r12.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1443
        mov (16|M16)             r12.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1444
        mov (16|M0)              r2.0<2>:w     r13.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1445
        mov (16|M16)             r1.0<2>:w     r15.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1445
        shr (16|M16)             r17.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1446
        shr (16|M0)              r15.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1446
        mov (16|M0)              r14.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1445
        mov (16|M16)             r14.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1446
        mov (16|M0)              r2.0<2>:w     r15.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1447
        mov (16|M16)             r1.0<2>:w     r17.0<4;1,0>:w                                        //  ALU pipe: int; $1447
        shr (16|M0)              r16.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1448
        mov (16|M0)              r15.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1447
        shr (16|M16)             r18.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1448
        mov (16|M0)              r2.0<2>:w     r16.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1449

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1457
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1457

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r13.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1449

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        mov (32|M0)              r2.0<1>:ud    r12.0<1;1,0>:uw                                       //  ALU pipe: int; $1458
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w                                 //  ALU pipe: int; $1464
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     10:w                                //  ALU pipe: int; $1469
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$11} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1459
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@2,$11.src} //  ALU pipe: int; $1465
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1465
        mov (32|M0)              r2.0<1>:ud    r14.0<1;1,0>:uw                                       //  ALU pipe: int; $1466

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r15.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1448

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1472

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r1.0<2>:w     r18.0<4;1,0>:w                                        //  ALU pipe: int; $1449
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     14:w                                //  ALU pipe: int; $1477

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@5,$12} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1467
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@3,$12.src} //  ALU pipe: int; $1473
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1473
        mov (32|M0)              r2.0<1>:ud    r15.0<1;1,0>:uw                                       //  ALU pipe: int; $1474

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
        mov (16|M16)             r13.16<1>:w   r1.0<2;1,0>:w                    {I@5}                //  ALU pipe: int; $1452

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1480
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$13} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1475
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@1,$13.src} //  ALU pipe: int; $1481
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1481
        mov (32|M0)              r2.0<1>:ud    r13.0<1;1,0>:uw                                       //  ALU pipe: int; $1482
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@1,$14} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1483

// Line 316:  for (int i = 0; i < input_load_len; ++i) {
(W&~f2.0) jmpi                               _0_152                                                  //  ALU pipe: int; $1487
// B077: [inDivergent],  Preds:{B076},  Succs:{B078, B079}
_0_165:

// Line 319:  (token_indx != nullptr) ? token_indx[load_local] : load_local;
(W&f0.0) jmpi                                _0_166                                                  //  ALU pipe: int; $1491
// B078: [inDivergent],  Preds:{B077},  Succs:{B080}
_0_167:
(W)     shl (1|M0)               r4.4<1>:q     r6.0<0;1,0>:d     2:w                                 //  ALU pipe: int; $1494
(W)     add (1|M0)               r6.0<1>:q     r4.4<0;1,0>:q     r6.1<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1495
(W)     load.ugm.d32x1t.a64 (1|M0)  r6:1        [r6:1+0xC]         {I@1,$15} // ex_desc:0xC000; desc:0x2108580 // $1497
(W)     jmpi                                 _0_168                                                  // $1498
// B079: [inDivergent],  Preds:{B077},  Succs:{B080}
_0_166:

// Line 317:  const int load_local = token_id - input_load_len + 1 + i;
(W)     add3 (1|M0)              r6.0<1>:d     r253.6<0;0>:d     -r4.12<0;0>:d     3:w               //  ALU pipe: int; $1501
// B080: [inDivergent],  Preds:{B079, B078},  Succs:{B081}
_0_168:

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     mul (1|M0)               acc0.0<1>:d   r6.0<0;1,0>:d     r7.0<0;1,0>:uw   {@1,$15.dst}       //  ALU pipe: int; $1507

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     3:w                                 //  ALU pipe: int; $1528

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
(W)     macl (1|M0)              r6.0<1>:d     r6.0<0;1,0>:d     r7.0<0;1,0>:d    {Compacted}        //  ALU pipe: int; $1508

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1532
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     7:w                                 //  ALU pipe: int; $1537

// Line 321:  load_vec(&mixed_qkvz[load_global * qkvz_elems + mixed_qkvz_id], tmp);
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r142.0<1;1,0>:d  {Compacted,@3,$14.src} //  ALU pipe: int; $1508
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1510
        shl (16|M0)              r10.0<1>:q    r8.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $1510
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1510
        add (16|M0)              r12.0<1>:q    r10.0<1;1,0>:q    r5.2<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $1511
        shl (16|M16)             r1.0<1>:q     r8.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $1510
        add (16|M16)             r14.0<1>:q    r1.0<1;1,0>:q     r5.2<0;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $1511

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        load.ugm.d64.a64 (32|M0)  r8:4          [r12:4]            {I@1,$16} // ex_desc:0x0; desc:0x8400780 // $1516
        mov (16|M0)              r2.0<2>:w     r8.0<4;1,0>:w                    {$16.dst}            //  ALU pipe: int; $1519
        mov (16|M16)             r1.0<2>:w     r10.0<4;1,0>:w                                        //  ALU pipe: int; $1519
        shr (16|M0)              r13.0<1>:uq   r8.0<1;1,0>:uq    16:w                                //  ALU pipe: int; $1520
        shr (16|M16)             r15.0<1>:uq   r10.0<1;1,0>:uq   16:w                                //  ALU pipe: int; $1520
        mov (16|M0)              r12.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1519
        mov (16|M16)             r12.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1520
        mov (16|M0)              r2.0<2>:w     r13.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1521
        mov (16|M16)             r1.0<2>:w     r15.0<4;1,0>:w                   {I@4}                //  ALU pipe: int; $1521
        shr (16|M16)             r17.0<1>:uq   r10.0<1;1,0>:uq   32:w                                //  ALU pipe: int; $1522
        shr (16|M0)              r15.0<1>:uq   r8.0<1;1,0>:uq    32:w                                //  ALU pipe: int; $1522
        mov (16|M0)              r14.0<1>:w    r2.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1521
        mov (16|M16)             r14.16<1>:w   r1.0<2;1,0>:w                    {I@4}                //  ALU pipe: int; $1522
        mov (16|M0)              r2.0<2>:w     r15.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1523
        mov (16|M16)             r1.0<2>:w     r17.0<4;1,0>:w                                        //  ALU pipe: int; $1523
        shr (16|M0)              r16.0<1>:uq   r8.0<1;1,0>:uq    48:w                                //  ALU pipe: int; $1524
        mov (16|M0)              r15.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1523
        shr (16|M16)             r18.0<1>:uq   r10.0<1;1,0>:uq   48:w                                //  ALU pipe: int; $1524
        mov (16|M0)              r2.0<2>:w     r16.0<4;1,0>:w                   {I@3}                //  ALU pipe: int; $1525

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1533
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1533

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M0)              r13.0<1>:w    r2.0<2;1,0>:w                    {I@3}                //  ALU pipe: int; $1525

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        mov (32|M0)              r2.0<1>:ud    r12.0<1;1,0>:uw                                       //  ALU pipe: int; $1534
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w                                 //  ALU pipe: int; $1540
(W)     add (1|M0)               r4.7<1>:d     r4.6<0;1,0>:d     11:w                                //  ALU pipe: int; $1545
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$17} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1535
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@2,$17.src} //  ALU pipe: int; $1541
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1541
        mov (32|M0)              r2.0<1>:ud    r14.0<1;1,0>:uw                                       //  ALU pipe: int; $1542

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r15.16<1>:w   r1.0<2;1,0>:w                                         //  ALU pipe: int; $1524

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
(W)     shl (1|M0)               r4.4<1>:q     r4.7<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1548
(W)     add (1|M0)               r4.6<1>:d     r4.6<0;1,0>:d     15:w                                //  ALU pipe: int; $1553

// Line 117:  *reinterpret_cast<const sycl::vec<T, elems_per_item>*>(ptr);
        mov (16|M16)             r1.0<2>:w     r18.0<4;1,0>:w                                        //  ALU pipe: int; $1525

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@5,$18} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1543
        add (16|M0)              r8.0<1>:q     r4.4<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@3,$18.src} //  ALU pipe: int; $1549
        add (16|M16)             r10.0<1>:q    r4.4<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1549
        mov (32|M0)              r2.0<1>:ud    r15.0<1;1,0>:uw                                       //  ALU pipe: int; $1550
(W)     shl (1|M0)               r4.3<1>:q     r4.6<0;1,0>:d     1:w               {I@5}             //  ALU pipe: int; $1556

// Line 323:  for (int e = 0; e < elems_per_item; ++e) {
        mov (16|M16)             r13.16<1>:w   r1.0<2;1,0>:w                    {I@5}                //  ALU pipe: int; $1528

// Line 324:  local_input[Width * e + states_load_len + i] = tmp[e];
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@3,$20} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1551
        add (16|M0)              r8.0<1>:q     r4.3<0;1,0>:q     r124.0<1;1,0>:q  {Compacted,@2,$20.src} //  ALU pipe: int; $1557
        add (16|M16)             r10.0<1>:q    r4.3<0;1,0>:q     r126.0<1;1,0>:q  {Compacted}        //  ALU pipe: int; $1557
        mov (32|M0)              r2.0<1>:ud    r13.0<1;1,0>:uw                  {I@3}                //  ALU pipe: int; $1558
        store.ugm.d16u32.a64.wb.wb (32|M0)  [r8:4] r2:2            {I@1,$21} // ex_desc:0x0; desc:0x80E0B84 //  address space: private; ; $1559
// B081: [FCALL],  [inDivergent],  Preds:{B080, B076, B072, B068, B064},  Succs:{B082}
_0_152:
        sync.allrd                           ($6,$14,$19,$21,$29,$31)                                // $1562
        shl (32|M0)              r8.0<1>:d     r148.0<1;1,0>:d   4:w               {Compacted,$30.src} //  ALU pipe: int; $1562
(W)     add (1|M0)               r4.3<1>:uq    r255.2<0;1,0>:uq  0x10:uw                             //  ALU pipe: int; $1564

// Line 331:  res[i] = 0.0f;
(W)     mov (4|M0)               r6.0<1>:d     0:w                               {Compacted}         //  ALU pipe: int; $1578
        add (32|M0)              r2.0<1>:d     r8.0<1;1,0>:d     2176:w               {@3,$0.src}    //  ALU pipe: int; $1563
        mov (32|M0)              r10.0<1>:d    r6.1<0;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $1580
        mov (16|M0)              r8.0<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1565

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r124.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1588

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 331:  res[i] = 0.0f;
        mov (32|M0)              r12.0<1>:d    r6.2<0;1,0>:d                    {Compacted,$9.src}   //  ALU pipe: int; $1581
        add (16|M0)              r128.0<1>:uq  r4.3<0;1,0>:uq    r8.0<2;1,0>:d    {I@3}              //  ALU pipe: int; $1565
        mov (16|M16)             r8.0<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1565

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r3.0<1>:ud    r126.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1588

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 331:  res[i] = 0.0f;
        mov (32|M0)              r14.0<1>:d    r6.3<0;1,0>:d                    {Compacted,$10.src}  //  ALU pipe: int; $1582

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $1589

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        add (16|M16)             r130.0<1>:uq  r4.3<0;1,0>:uq    r8.0<2;1,0>:d                       //  ALU pipe: int; $1565

// Line 331:  res[i] = 0.0f;
        mov (32|M0)              r8.0<1>:f     r6.0<0;1,0>:f                    {Compacted,I@1}      //  ALU pipe: float; $1579

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud                       //  ALU pipe: int; $1590

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1597

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 331:  res[i] = 0.0f;
        store.ugm.d32x4.a64.wb.wb (32|M0)  [r128:4] r8:8           {F@1,$22} // ex_desc:0x0; desc:0x80E3584 //  address space: private; ; $1583

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1597

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r124.0<2;1,0>:ud                 {Compacted,$22.src}  //  ALU pipe: int; $1587
        mov (16|M16)             r8.0<2>:ud    r126.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1587
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@5}      //  ALU pipe: int; $1592
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1592

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1596

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@7,$23} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1597

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 331:  res[i] = 0.0f;
        add (16|M0)              r152.0<1>:q   r128.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $1571
        add (16|M0)              r156.0<1>:q   r128.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $1574
        add (16|M0)              r160.0<1>:q   r128.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $1577
        add (16|M16)             r150.0<1>:q   r130.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $1571
        add (16|M16)             r154.0<1>:q   r130.0<1;1,0>:q   8:w               {Compacted}       //  ALU pipe: int; $1574
        add (16|M16)             r158.0<1>:q   r130.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $1577

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@7}      //  ALU pipe: int; $1595
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@7}      //  ALU pipe: int; $1595
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1597
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1597
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1597
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1597
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$23.src}            //  ALU pipe: int; $1597
        sync.allrd                           null                             {A@1}                  // $1597
        sync.allwr                           null                                                    // $1597
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1597
// B082: [FCALL],  [inDivergent],  Preds:{B081},  Succs:{B083}
_L_k0_16_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1597
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1597
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1597

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r132.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1602
        mov (16|M16)             r3.0<1>:ud    r134.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1602

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1598
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1598

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@5,$24} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1597

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$24.dst}    // $1603
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@3}    //  ALU pipe: int; $1603

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1598

// Line 68:  operator float() const { return to_float(value); }
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1604

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1598

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r132.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1601
        mov (16|M16)             r8.0<2>:ud    r134.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1601
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@4}      //  ALU pipe: int; $1606
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1606

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1610
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1598
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1609
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1609
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1611
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1611
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1611
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1611

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1611

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $1611
        sync.allrd                           null                             {A@1}                  // $1611
        sync.allwr                           null                                                    // $1611
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1611
// B083: [FCALL],  [inDivergent],  Preds:{B082},  Succs:{B084}
_L_k0_17_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1611
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1611
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1611

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4]           {I@7,$25} // ex_desc:0x0; desc:0x8280580 //  address space: private; ; $1615
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1615
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1615

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1611

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$26.dst}    // $1615
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1615
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1615

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r170.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1621

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1630
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1631
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1631
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1631
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1631

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$25.dst} //  ALU pipe: float; $1616 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r168.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1621

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {$27} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1617

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r170.1<2;1,0>:ud                 {Compacted,$27.src}  //  ALU pipe: int; $1622
        mov (16|M16)             r3.0<1>:ud    r168.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1622
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1623
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1624
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1626
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1626

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1629
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1629

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1631

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $1631
        sync.allrd                           null                             {A@1}                  // $1631
        sync.allwr                           null                                                    // $1631
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1631
// B084: [FCALL],  [inDivergent],  Preds:{B083},  Succs:{B085}
_L_k0_18_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1631
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1631
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1631

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r186.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1636
        mov (16|M16)             r3.0<1>:ud    r184.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1636

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1632
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1632

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@5,$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1631

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$28.dst}    // $1637
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@3}    //  ALU pipe: int; $1637

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1632

// Line 68:  operator float() const { return to_float(value); }
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1638

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1632

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r186.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1635
        mov (16|M16)             r8.0<2>:ud    r184.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1635
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@4}      //  ALU pipe: int; $1640
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1640

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1644
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1632
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1643
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1643
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1645
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1645
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1645
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1645

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1645

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$28.src}            //  ALU pipe: int; $1645
        sync.allrd                           null                             {A@1}                  // $1645
        sync.allwr                           null                                                    // $1645
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1645
// B085: [FCALL],  [inDivergent],  Preds:{B084},  Succs:{B086}
_L_k0_19_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1645
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1645
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1645

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x4]       {I@7,$29} // ex_desc:0x4000; desc:0x8280580 //  address space: private; ; $1649
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1649
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1649

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$30} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1645

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$30.dst}    // $1649
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1649
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1649

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r174.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1655

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1664
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1665
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1665
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1665
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1665

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$29.dst} //  ALU pipe: float; $1650 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r172.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1655

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x4] r2:2         {$31} // ex_desc:0x4000; desc:0x80E0584 //  address space: private; ; $1651

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r174.1<2;1,0>:ud                 {Compacted,$31.src}  //  ALU pipe: int; $1656
        mov (16|M16)             r3.0<1>:ud    r172.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1656
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1657
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1658
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1660
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1660

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1663
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1663

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$30} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1665

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$30.src}            //  ALU pipe: int; $1665
        sync.allrd                           null                             {A@1}                  // $1665
        sync.allwr                           null                                                    // $1665
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1665
// B086: [FCALL],  [inDivergent],  Preds:{B085},  Succs:{B087}
_L_k0_20_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1665
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1665
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1665

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r198.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1670
        mov (16|M16)             r3.0<1>:ud    r196.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1670

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1666
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1666

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@5,$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1665

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$0.dst}     // $1671
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@3}    //  ALU pipe: int; $1671

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1666

// Line 68:  operator float() const { return to_float(value); }
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1672

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1666

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r198.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1669
        mov (16|M16)             r8.0<2>:ud    r196.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1669
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@4}      //  ALU pipe: int; $1674
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1674

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1678
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1666
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1677
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1677
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1679
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1679
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1679
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1679

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1679

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $1679
        sync.allrd                           null                             {A@1}                  // $1679
        sync.allwr                           null                                                    // $1679
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1679
// B087: [FCALL],  [inDivergent],  Preds:{B086},  Succs:{B088}
_L_k0_21_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1679
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1679
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1679

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x8]       {I@7,$1} // ex_desc:0x8000; desc:0x8280580 //  address space: private; ; $1683
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1683
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1683

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$2} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1679

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$2.dst}     // $1683
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1683
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1683

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r178.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1689

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1698
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1699
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1699
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1699
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1699

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$1.dst} //  ALU pipe: float; $1684 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r176.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1689

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x8] r2:2         {$3} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $1685

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r178.1<2;1,0>:ud                 {Compacted,$3.src}   //  ALU pipe: int; $1690
        mov (16|M16)             r3.0<1>:ud    r176.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1690
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1691
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1692
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1694
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1694

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1697
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1697

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$2} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1699

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$2.src}             //  ALU pipe: int; $1699
        sync.allrd                           null                             {A@1}                  // $1699
        sync.allwr                           null                                                    // $1699
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1699
// B088: [FCALL],  [inDivergent],  Preds:{B087},  Succs:{B089}
_L_k0_22_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1699
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1699
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1699

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r210.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1704
        mov (16|M16)             r3.0<1>:ud    r208.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1704

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1700
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1700

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@5,$4} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1699

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$4.dst}     // $1705
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@3}    //  ALU pipe: int; $1705

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1700

// Line 68:  operator float() const { return to_float(value); }
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1706

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1700

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r210.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1703
        mov (16|M16)             r8.0<2>:ud    r208.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1703
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@4}      //  ALU pipe: int; $1708
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1708

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1712
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1700
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1711
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1711
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1713
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1713
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1713
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1713

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1713

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$4.src}             //  ALU pipe: int; $1713
        sync.allrd                           null                             {A@1}                  // $1713
        sync.allwr                           null                                                    // $1713
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1713
// B089: [FCALL],  [inDivergent],  Preds:{B088},  Succs:{B090}
_L_k0_23_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1713
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1713
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1713

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0xC]       {I@7,$5} // ex_desc:0xC000; desc:0x8280580 //  address space: private; ; $1717
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1717
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1717

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$6} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1713

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$6.dst}     // $1717
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1717
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1717

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r182.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1723

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1732
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1733
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1733
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1733
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1733

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$5.dst} //  ALU pipe: float; $1718 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r180.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1723

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0xC] r2:2         {$7} // ex_desc:0xC000; desc:0x80E0584 //  address space: private; ; $1719

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r182.1<2;1,0>:ud                 {Compacted,$7.src}   //  ALU pipe: int; $1724
        mov (16|M16)             r3.0<1>:ud    r180.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1724
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1725
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1726
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1728
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1728

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1731
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1731

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$6} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1733

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$6.src}             //  ALU pipe: int; $1733
        sync.allrd                           null                             {A@1}                  // $1733
        sync.allwr                           null                                                    // $1733
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1733
// B090: [FCALL],  [inDivergent],  Preds:{B089},  Succs:{B091}
_L_k0_24_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1733
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1733
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1733

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   2:w               {Compacted}       //  ALU pipe: int; $1737
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   2:w               {Compacted}       //  ALU pipe: int; $1737

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1734

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1739

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$8} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1733

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$8.dst}     // $1739
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1739

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1734
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1734
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1734

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1740
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1738
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1741
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1738
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1743
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1743

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1747
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1734
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1746
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1746
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1748
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1748
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1748
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1748

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$8} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1748

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$8.src}             //  ALU pipe: int; $1748
        sync.allrd                           null                             {A@1}                  // $1748
        sync.allwr                           null                                                    // $1748
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1748
// B091: [FCALL],  [inDivergent],  Preds:{B090},  Succs:{B092}
_L_k0_25_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1748
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1748
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1748

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4]           {I@7,$9} // ex_desc:0x0; desc:0x8280580 //  address space: private; ; $1752
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1752
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1752

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$10} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1748

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$10.dst}    // $1752
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1752
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1752

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r190.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1758

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1767
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1768
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1768
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1768
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1768

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$9.dst} //  ALU pipe: float; $1753 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r188.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1758

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {$11} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1754

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r190.1<2;1,0>:ud                 {Compacted,$11.src}  //  ALU pipe: int; $1759
        mov (16|M16)             r3.0<1>:ud    r188.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1759
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1760
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1761
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1763
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1763

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1766
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1766

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$10} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1768

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$10.src}            //  ALU pipe: int; $1768
        sync.allrd                           null                             {A@1}                  // $1768
        sync.allwr                           null                                                    // $1768
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1768
// B092: [FCALL],  [inDivergent],  Preds:{B091},  Succs:{B093}
_L_k0_26_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1768
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1768
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1768

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   10:w               {Compacted}      //  ALU pipe: int; $1772
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   10:w               {Compacted}      //  ALU pipe: int; $1772

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1769

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1774

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1768

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$12.dst}    // $1774
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1774

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1769
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1769
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1769

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1775
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1773
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1776
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1773
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1778
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1778

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1782
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1769
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1781
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1781
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1783
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1783
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1783
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1783

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1783

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$12.src}            //  ALU pipe: int; $1783
        sync.allrd                           null                             {A@1}                  // $1783
        sync.allwr                           null                                                    // $1783
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1783
// B093: [FCALL],  [inDivergent],  Preds:{B092},  Succs:{B094}
_L_k0_27_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1783
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1783
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1783

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x4]       {I@7,$13} // ex_desc:0x4000; desc:0x8280580 //  address space: private; ; $1787
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1787
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1787

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$14} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1783

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$14.dst}    // $1787
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1787
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1787

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r194.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1793

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1802
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1803
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1803
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1803
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1803

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$13.dst} //  ALU pipe: float; $1788 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r192.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1793

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x4] r2:2         {$15} // ex_desc:0x4000; desc:0x80E0584 //  address space: private; ; $1789

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r194.1<2;1,0>:ud                 {Compacted,$15.src}  //  ALU pipe: int; $1794
        mov (16|M16)             r3.0<1>:ud    r192.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1794
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1795
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1796
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1798
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1798

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1801
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1801

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$14} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1803

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$14.src}            //  ALU pipe: int; $1803
        sync.allrd                           null                             {A@1}                  // $1803
        sync.allwr                           null                                                    // $1803
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1803
// B094: [FCALL],  [inDivergent],  Preds:{B093},  Succs:{B095}
_L_k0_28_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1803
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1803
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1803

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   18:w               {Compacted}      //  ALU pipe: int; $1807
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   18:w               {Compacted}      //  ALU pipe: int; $1807

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1804

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1809

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$16} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1803

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$16.dst}    // $1809
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1809

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1804
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1804
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1804

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1810
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1808
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1811
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1808
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1813
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1813

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1817
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1804
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1816
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1816
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1818
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1818
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1818
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1818

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$16} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1818

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $1818
        sync.allrd                           null                             {A@1}                  // $1818
        sync.allwr                           null                                                    // $1818
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1818
// B095: [FCALL],  [inDivergent],  Preds:{B094},  Succs:{B096}
_L_k0_29_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1818
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1818
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1818

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x8]       {I@7,$17} // ex_desc:0x8000; desc:0x8280580 //  address space: private; ; $1822
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1822
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1822

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1818

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$18.dst}    // $1822
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1822
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1822

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r202.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1828

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1837
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1838
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1838
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1838
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1838

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$17.dst} //  ALU pipe: float; $1823 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r200.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1828

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x8] r2:2         {$19} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $1824

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r202.1<2;1,0>:ud                 {Compacted,$19.src}  //  ALU pipe: int; $1829
        mov (16|M16)             r3.0<1>:ud    r200.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1829
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1830
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1831
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1833
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1833

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1836
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1836

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1838

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $1838
        sync.allrd                           null                             {A@1}                  // $1838
        sync.allwr                           null                                                    // $1838
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1838
// B096: [FCALL],  [inDivergent],  Preds:{B095},  Succs:{B097}
_L_k0_30_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1838
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1838
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1838

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   26:w               {Compacted}      //  ALU pipe: int; $1842
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   26:w               {Compacted}      //  ALU pipe: int; $1842

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1839

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1844

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$20} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1838

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$20.dst}    // $1844
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1844

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1839
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1839
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1839

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1845
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1843
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1846
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1843
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1848
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1848

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1852
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1839
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1851
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1851
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1853
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1853
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1853
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1853

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$20} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1853

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$20.src}            //  ALU pipe: int; $1853
        sync.allrd                           null                             {A@1}                  // $1853
        sync.allwr                           null                                                    // $1853
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1853
// B097: [FCALL],  [inDivergent],  Preds:{B096},  Succs:{B098}
_L_k0_31_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1853
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1853
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1853

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0xC]       {I@7,$21} // ex_desc:0xC000; desc:0x8280580 //  address space: private; ; $1857
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1857
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1857

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1853

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$22.dst}    // $1857
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1857
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1857

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r206.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1863

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1872
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1873
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1873
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1873
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1873

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$21.dst} //  ALU pipe: float; $1858 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r204.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1863

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0xC] r2:2         {$23} // ex_desc:0xC000; desc:0x80E0584 //  address space: private; ; $1859

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r206.1<2;1,0>:ud                 {Compacted,$23.src}  //  ALU pipe: int; $1864
        mov (16|M16)             r3.0<1>:ud    r204.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1864
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1865
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1866
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1868
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1868

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1871
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1871

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$22} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1873

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$22.src}            //  ALU pipe: int; $1873
        sync.allrd                           null                             {A@1}                  // $1873
        sync.allwr                           null                                                    // $1873
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1873
// B098: [FCALL],  [inDivergent],  Preds:{B097},  Succs:{B099}
_L_k0_32_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1873
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1873
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1873

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $1877
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $1877

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1874

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1879

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$24} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1873

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$24.dst}    // $1879
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1879

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1874
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1874
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1874

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1880
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1878
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1881
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1878
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1883
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1883

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1887
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1874
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1886
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1886
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1888
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1888
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1888
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1888

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1888

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $1888
        sync.allrd                           null                             {A@1}                  // $1888
        sync.allwr                           null                                                    // $1888
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1888
// B099: [FCALL],  [inDivergent],  Preds:{B098},  Succs:{B100}
_L_k0_33_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1888
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1888
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1888

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4]           {I@7,$25} // ex_desc:0x0; desc:0x8280580 //  address space: private; ; $1892
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1892
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1892

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1888

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$26.dst}    // $1892
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1892
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1892

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r214.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1898

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1907
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1908
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1908
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1908
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1908

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$25.dst} //  ALU pipe: float; $1893 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r212.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1898

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r2:2             {$27} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $1894

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r214.1<2;1,0>:ud                 {Compacted,$27.src}  //  ALU pipe: int; $1899
        mov (16|M16)             r3.0<1>:ud    r212.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1899
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1900
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1901
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1903
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1903

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1906
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1906

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1908

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $1908
        sync.allrd                           null                             {A@1}                  // $1908
        sync.allwr                           null                                                    // $1908
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1908
// B100: [FCALL],  [inDivergent],  Preds:{B099},  Succs:{B101}
_L_k0_34_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1908
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1908
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1908

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $1912
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   12:w               {Compacted}      //  ALU pipe: int; $1912

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1909

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1914

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$28} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1908

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$28.dst}    // $1914
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1914

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1909
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1909
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1909

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1915
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1913
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1916
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1913
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1918
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1918

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1922
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1909
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1921
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1921
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1923
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1923
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1923
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1923

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1923

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$28.src}            //  ALU pipe: int; $1923
        sync.allrd                           null                             {A@1}                  // $1923
        sync.allwr                           null                                                    // $1923
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1923
// B101: [FCALL],  [inDivergent],  Preds:{B100},  Succs:{B102}
_L_k0_35_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1923
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1923
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1923

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x4]       {I@7,$29} // ex_desc:0x4000; desc:0x8280580 //  address space: private; ; $1927
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1927
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1927

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$30} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1923

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$30.dst}    // $1927
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1927
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1927

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r218.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1933

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1942
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1943
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1943
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1943
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1943

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$29.dst} //  ALU pipe: float; $1928 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r216.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1933

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x4] r2:2         {$31} // ex_desc:0x4000; desc:0x80E0584 //  address space: private; ; $1929

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r218.1<2;1,0>:ud                 {Compacted,$31.src}  //  ALU pipe: int; $1934
        mov (16|M16)             r3.0<1>:ud    r216.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1934
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1935
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1936
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1938
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1938

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1941
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1941

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$30} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1943

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$30.src}            //  ALU pipe: int; $1943
        sync.allrd                           null                             {A@1}                  // $1943
        sync.allwr                           null                                                    // $1943
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1943
// B102: [FCALL],  [inDivergent],  Preds:{B101},  Succs:{B103}
_L_k0_36_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1943
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1943
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1943

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   20:w               {Compacted}      //  ALU pipe: int; $1947
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   20:w               {Compacted}      //  ALU pipe: int; $1947

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1944

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1949

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1943

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$0.dst}     // $1949
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1949

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1944
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1944
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1944

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1950
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1948
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1951
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1948
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1953
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1953

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1957
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1944
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1956
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1956
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1958
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1958
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1958
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1958

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1958

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $1958
        sync.allrd                           null                             {A@1}                  // $1958
        sync.allwr                           null                                                    // $1958
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1958
// B103: [FCALL],  [inDivergent],  Preds:{B102},  Succs:{B104}
_L_k0_37_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1958
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1958
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1958

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0x8]       {I@7,$1} // ex_desc:0x8000; desc:0x8280580 //  address space: private; ; $1962
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1962
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1962

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$2} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1958

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$2.dst}     // $1962
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1962
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1962

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r222.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1968

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1977
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1978
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1978
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1978
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1978

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$1.dst} //  ALU pipe: float; $1963 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r220.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $1968

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x8] r2:2         {$3} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $1964

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r222.1<2;1,0>:ud                 {Compacted,$3.src}   //  ALU pipe: int; $1969
        mov (16|M16)             r3.0<1>:ud    r220.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1969
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $1970
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $1971
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $1973
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1973

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $1976
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1976

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$2} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1978

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$2.src}             //  ALU pipe: int; $1978
        sync.allrd                           null                             {A@1}                  // $1978
        sync.allwr                           null                                                    // $1978
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1978
// B104: [FCALL],  [inDivergent],  Preds:{B103},  Succs:{B105}
_L_k0_38_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1978
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1978
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1978

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   28:w               {Compacted}      //  ALU pipe: int; $1982
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   28:w               {Compacted}      //  ALU pipe: int; $1982

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1979

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1984

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$4} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1978

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$4.dst}     // $1984
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $1984

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $1979
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1979
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1979

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $1985
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1983
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $1986
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $1983
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $1988
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1988

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $1992
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $1979
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $1991
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $1991
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $1993
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $1993
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $1993
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $1993

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$4} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $1993

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$4.src}             //  ALU pipe: int; $1993
        sync.allrd                           null                             {A@1}                  // $1993
        sync.allwr                           null                                                    // $1993
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $1993
// B105: [FCALL],  [inDivergent],  Preds:{B104},  Succs:{B106}
_L_k0_39_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $1993
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $1993
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $1993

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r8:2    [r128:4+0xC]       {I@7,$5} // ex_desc:0xC000; desc:0x8280580 //  address space: private; ; $1997
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $1997
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $1997

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$6} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $1993

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$6.dst}     // $1997
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $1997
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $1997

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r226.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2003

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2012
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2013
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2013
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2013
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2013

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r2.0<1>:f     r8.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$5.dst} //  ALU pipe: float; $1998 R{} IR{}{E:4,E:4,E:5,},  R{} IR{}{O:4,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r8.0<2>:ud    r224.0<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $2003

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0xC] r2:2         {$7} // ex_desc:0xC000; desc:0x80E0584 //  address space: private; ; $1999

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r226.1<2;1,0>:ud                 {Compacted,$7.src}   //  ALU pipe: int; $2004
        mov (16|M16)             r3.0<1>:ud    r224.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2004
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $2005
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $2006
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $2008
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2008

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $2011
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2011

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$6} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2013

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$6.src}             //  ALU pipe: int; $2013
        sync.allrd                           null                             {A@1}                  // $2013
        sync.allwr                           null                                                    // $2013
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2013
// B106: [FCALL],  [inDivergent],  Preds:{B105},  Succs:{B107}
_L_k0_40_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2013
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2013
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2013

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   6:w               {Compacted}       //  ALU pipe: int; $2017
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   6:w               {Compacted}       //  ALU pipe: int; $2017

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2014

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2019

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$8} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2013

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$8.dst}     // $2019
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2019

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $2014
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2014
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2014

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $2020
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2018
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2021
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2018
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2023
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2023

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2027
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $2014
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2026
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $2026
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2028
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2028
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2028
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2028

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$8} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2028

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$8.src}             //  ALU pipe: int; $2028
        sync.allrd                           null                             {A@1}                  // $2028
        sync.allwr                           null                                                    // $2028
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2028
// B107: [FCALL],  [inDivergent],  Preds:{B106},  Succs:{B108}
_L_k0_41_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2028
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2028
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2028

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4]           {$9} // ex_desc:0x0; desc:0x8280580 //  address space: private; ; $2032
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2032
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2032

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$10} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2028

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$10.dst}    // $2032
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2032
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2032

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r230.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2038
        mov (16|M16)             r8.0<2>:ud    r228.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2038

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2047
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2048
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2048
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2048
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2048

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r142.0<1>:f   r2.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$9.dst} //  ALU pipe: float; $2033 R{} IR{}{E:1,E:4,E:5,},  R{} IR{}{O:1,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r230.1<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $2039
        mov (16|M16)             r3.0<1>:ud    r228.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2039

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r142:2           {$11} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $2034

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $2040
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $2041
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $2043
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2043

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $2046
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2046

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$10} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2048

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$10.src}            //  ALU pipe: int; $2048
        sync.allrd                           null                             {A@1}                  // $2048
        sync.allwr                           null                                                    // $2048
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2048
// B108: [FCALL],  [inDivergent],  Preds:{B107},  Succs:{B109}
_L_k0_42_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2048
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2048
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2048

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   14:w               {Compacted}      //  ALU pipe: int; $2052
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   14:w               {Compacted}      //  ALU pipe: int; $2052

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2049

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2054

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2048

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$12.dst}    // $2054
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2054

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $2049
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2049
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2049

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $2055
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2053
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2056
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2053
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2058
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2058

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2062
        mov (32|M0)              r136.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $2049
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2061
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $2061
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2063
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2063
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2063
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2063

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2063

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$12.src}            //  ALU pipe: int; $2063
        sync.allrd                           null                             {A@1}                  // $2063
        sync.allwr                           null                                                    // $2063
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2063
// B109: [FCALL],  [inDivergent],  Preds:{B108},  Succs:{B110}
_L_k0_43_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2063
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2063
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2063

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0x4]       {$13} // ex_desc:0x4000; desc:0x8280580 //  address space: private; ; $2067
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2067
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2067

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$14} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2063

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$14.dst}    // $2067
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2067
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2067

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r234.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2073
        mov (16|M16)             r8.0<2>:ud    r232.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2073

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2082
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2083
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2083
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2083
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2083

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r138.0<1>:f   r2.0<1;0>:f       r136.0<1;0>:f     r26.0<1>:f       {Compacted,$13.dst} //  ALU pipe: float; $2068 R{} IR{}{E:1,E:4,E:5,},  R{} IR{}{O:1,O:4,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r234.1<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $2074
        mov (16|M16)             r3.0<1>:ud    r232.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2074

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x4] r138:2       {$15} // ex_desc:0x4000; desc:0x80E0584 //  address space: private; ; $2069

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $2075
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $2076
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $2078
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2078

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $2081
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2081

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$14} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2083

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$14.src}            //  ALU pipe: int; $2083
        sync.allrd                           null                             {A@1}                  // $2083
        sync.allwr                           null                                                    // $2083
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2083
// B110: [FCALL],  [inDivergent],  Preds:{B109},  Succs:{B111}
_L_k0_44_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2083
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2083
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2083

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   22:w               {Compacted}      //  ALU pipe: int; $2087
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   22:w               {Compacted}      //  ALU pipe: int; $2087

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2084

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2089

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$16} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2083

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$16.dst}    // $2089
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2089

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $2084
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2084
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2084

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $2090
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2088
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2091
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2088
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2093
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2093

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2097
        mov (32|M0)              r148.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $2084
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2096
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $2096
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2098
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2098
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2098
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2098

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$16} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2098

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $2098
        sync.allrd                           null                             {A@1}                  // $2098
        sync.allwr                           null                                                    // $2098
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2098
// B111: [FCALL],  [inDivergent],  Preds:{B110},  Succs:{B112}
_L_k0_45_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2098
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2098
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2098

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0x8]       {$17} // ex_desc:0x8000; desc:0x8280580 //  address space: private; ; $2102
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2102
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2102

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$18} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2098

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        sync.nop                             null                             {Compacted,$18.dst}    // $2102
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2102
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2102

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r10.0<2>:ud   r238.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2108
        mov (16|M16)             r8.0<2>:ud    r236.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2108

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2117
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2118
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2118
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2118
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2118

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r136.0<1>:f   r2.0<1;0>:f       r148.0<1;0>:f     r26.0<1>:f       {Compacted,$17.dst} //  ALU pipe: float; $2103 R{} IR{}{E:1,E:2,E:5,},  R{} IR{}{O:1,O:10,O:13,},  {BC=2}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r238.1<2;1,0>:ud                 {Compacted,F@1}      //  ALU pipe: int; $2109
        mov (16|M16)             r3.0<1>:ud    r236.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2109

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x8] r136:2       {$19} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $2104

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@1}    //  ALU pipe: int; $2110
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@1}    //  ALU pipe: int; $2111
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $2113
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2113

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,I@2}      //  ALU pipe: int; $2116
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2116

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2118

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $2118
        sync.allrd                           null                             {A@1}                  // $2118
        sync.allwr                           null                                                    // $2118
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2118
// B112: [FCALL],  [inDivergent],  Preds:{B111},  Succs:{B113}
_L_k0_46_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2118
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2118
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2118

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r14.0<1>:q    r132.0<1;1,0>:q   30:w               {Compacted}      //  ALU pipe: int; $2122
        add (16|M16)             r12.0<1>:q    r134.0<1;1,0>:q   30:w               {Compacted}      //  ALU pipe: int; $2122

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2119

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r2.0<1>:ud    r14.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2124

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {$20} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2118

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        sync.nop                             null                             {Compacted,$20.dst}    // $2124
        mov (16|M16)             r3.0<1>:ud    r12.1<2;1,0>:ud                  {Compacted,I@3}      //  ALU pipe: int; $2124

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                                      //  ALU pipe: int; $2119
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2119
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2119

// Line 68:  operator float() const { return to_float(value); }
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@4}    //  ALU pipe: int; $2125
        mov (16|M0)              r10.0<2>:ud   r14.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2123
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2126
        mov (16|M16)             r8.0<2>:ud    r12.0<2;1,0>:ud                  {Compacted}          //  ALU pipe: int; $2123
        mov (16|M0)              r10.1<2>:ud   r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2128
        mov (16|M16)             r8.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2128

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2132
        mov (32|M0)              r148.0<1>:f   r26.0<1;1,0>:f                   {Compacted}          //  ALU pipe: float; $2119
        mov (16|M16)             r28.0<1>:uq   r8.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2131
        mov (16|M0)              r26.0<1>:uq   r10.0<1;1,0>:uq                  {Compacted,F@1}      //  ALU pipe: int; $2131
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2133
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2133
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2133
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2133

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$20} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2133

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$20.src}            //  ALU pipe: int; $2133
        sync.allrd                           null                             {A@1}                  // $2133
        sync.allwr                           null                                                    // $2133
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2133
// B113: [inDivergent],  Preds:{B112},  Succs:{B114, B119}
_L_k0_47_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2133
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2133
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2133

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0xC]       {$21} // ex_desc:0xC000; desc:0x8280580 //  address space: private; ; $2137
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2137
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2137

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2133

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 342:  if (conv_bias != nullptr) {
        sync.nop                             null                             {Compacted,$22.dst}    // $2144
(W)     mov (1|M0)               r4.3<1>:uq    0x0:uw                              {$22.dst}         //  ALU pipe: int; $2144

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2137
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2137

// Line 342:  if (conv_bias != nullptr) {
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                                      //  ALU pipe: int; $2150

// Line 337:  res[e] += static_cast<float>(local_input[Width * e + i]) *
        mad (32|M0)              r132.0<1>:f   r2.0<1;0>:f       r148.0<1;0>:f     r26.0<1>:f       {Compacted,$21.dst} //  ALU pipe: float; $2138 R{} IR{}{E:1,E:2,E:5,},  R{} IR{}{O:1,O:10,O:13,},  {BC=2}
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0xC] r132:2       {F@1,$23} // ex_desc:0xC000; desc:0x80E0584 //  address space: private; ; $2139

// Line 342:  if (conv_bias != nullptr) {
(W)     cmp (32|M0)   (eq)f0.0   null<1>:d     r5.10<0;1,0>:d    r4.6<0;1,0>:d    {I@4}              //  ALU pipe: int; $2147
(W&f0.0) cmp (32|M0)  (eq)f0.0   null<1>:d     r5.11<0;1,0>:d    r4.7<0;1,0>:d                       //  ALU pipe: int; $2148
(W&f0.0) jmpi                                _0_169                                                  //  ALU pipe: int; $2150
// B114: [FCALL],  [inDivergent],  Preds:{B113},  Succs:{B115}
_0_170:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r1.0<2>:ud    r144.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2160

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2167
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2167
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2166

// Line 68:  operator float() const { return to_float(value); }
        shl (16|M0)              r10.0<1>:q    r1.0<2;1,0>:d     1:w               {I@4}             //  ALU pipe: int; $2160
        mov (16|M16)             r1.0<2>:ud    r145.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2160

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2167

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r148.0<1>:q   r10.0<1;1,0>:q    r5.5<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $2161
        shl (16|M16)             r8.0<1>:q     r1.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $2160

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2167

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M0)              r26.0<1>:uq   r148.0<1;1,0>:uq                 {Compacted,I@2}      //  ALU pipe: int; $2162
        add (16|M16)             r134.0<1>:q   r8.0<1;1,0>:q     r5.5<0;1,0>:q    {Compacted,I@2}    //  ALU pipe: int; $2161

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2167
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2167
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2167

// Line 68:  operator float() const { return to_float(value); }
        mov (16|M16)             r28.0<1>:uq   r134.0<1;1,0>:uq                 {Compacted,I@4}      //  ALU pipe: int; $2162

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $2167
        sync.allrd                           null                             {A@1}                  // $2167
        sync.allwr                           null                                                    // $2167
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2167
// B115: [FCALL],  [inDivergent],  Preds:{B114},  Succs:{B116}
_L_k0_48_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2167
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2167
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2167

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4]           {$25} // ex_desc:0x0; desc:0x8280580 //  address space: private; ; $2171
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2171
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2171

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$26} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2167

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$26.dst}    // $2171
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2171
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2171

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2182

// Line 68:  operator float() const { return to_float(value); }
        add (16|M16)             r28.0<1>:q    r134.0<1;1,0>:q   2:w               {Compacted}       //  ALU pipe: int; $2177

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2183
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2183
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2183
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2183

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$11.src}    // $2172
        add (32|M0)              r142.0<1>:f   r2.0<1;1,0>:f     r26.0<1;1,0>:f   {Compacted,$25.dst} //  ALU pipe: float; $2172

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r26.0<1>:q    r148.0<1;1,0>:q   2:w               {Compacted,F@1}   //  ALU pipe: int; $2177

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4] r142:2           {$27} // ex_desc:0x0; desc:0x80E0584 //  address space: private; ; $2173

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$26} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2183

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; $2183
        sync.allrd                           null                             {A@1}                  // $2183
        sync.allwr                           null                                                    // $2183
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2183
// B116: [FCALL],  [inDivergent],  Preds:{B115},  Succs:{B117}
_L_k0_49_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2183
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2183
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2183

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0x4]       {$28} // ex_desc:0x4000; desc:0x8280580 //  address space: private; ; $2187
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2187
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2187

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2183

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$29.dst}    // $2187
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2187
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2187

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2198

// Line 68:  operator float() const { return to_float(value); }
        add (16|M16)             r28.0<1>:q    r134.0<1;1,0>:q   4:w               {Compacted}       //  ALU pipe: int; $2193

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2199
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2199
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2199
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2199

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$15.src}    // $2188
        add (32|M0)              r138.0<1>:f   r2.0<1;1,0>:f     r26.0<1;1,0>:f   {Compacted,$28.dst} //  ALU pipe: float; $2188

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r26.0<1>:q    r148.0<1;1,0>:q   4:w               {Compacted,F@1}   //  ALU pipe: int; $2193

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x4] r138:2       {$30} // ex_desc:0x4000; desc:0x80E0584 //  address space: private; ; $2189

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$29} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2199

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$29.src}            //  ALU pipe: int; $2199
        sync.allrd                           null                             {A@1}                  // $2199
        sync.allwr                           null                                                    // $2199
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2199
// B117: [FCALL],  [inDivergent],  Preds:{B116},  Succs:{B118}
_L_k0_50_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2199
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2199
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2199

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0x8]       {$31} // ex_desc:0x8000; desc:0x8280580 //  address space: private; ; $2203
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2203
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2203

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@3,$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2199

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$0.dst}     // $2203
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2203
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                                      //  ALU pipe: int; $2203

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.0<0;1,0>:uq                                      //  ALU pipe: int; $2214

// Line 68:  operator float() const { return to_float(value); }
        add (16|M16)             r28.0<1>:q    r134.0<1;1,0>:q   6:w               {Compacted}       //  ALU pipe: int; $2209

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r162.4<1>:ud  f0.0<0;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2215
(W)     mov (1|M0)               r162.5<1>:ud  f1.0<0;1,0>:ud                                        //  ALU pipe: int; $2215
(W)     mov (1|M0)               r162.6<1>:ud  f2.0<0;1,0>:ud                                        //  ALU pipe: int; $2215
(W)     mov (1|M0)               r162.7<1>:ud  f3.0<0;1,0>:ud                                        //  ALU pipe: int; $2215

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$19.src}    // $2204
        add (32|M0)              r136.0<1>:f   r2.0<1;1,0>:f     r26.0<1;1,0>:f   {Compacted,$31.dst} //  ALU pipe: float; $2204

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 68:  operator float() const { return to_float(value); }
        add (16|M0)              r26.0<1>:q    r148.0<1;1,0>:q   6:w               {Compacted,F@1}   //  ALU pipe: int; $2209

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0x8] r136:2       {$1} // ex_desc:0x8000; desc:0x80E0584 //  address space: private; ; $2205

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {$0} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2215

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$0.src}             //  ALU pipe: int; $2215
        sync.allrd                           null                             {A@1}                  // $2215
        sync.allwr                           null                                                    // $2215
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2215
// B118: [inDivergent],  Preds:{B117},  Succs:{B119}
_L_k0_51_:

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        load.ugm.d32.a64.ca.ca (32|M0)  r2:2    [r128:4+0xC]       {$2} // ex_desc:0xC000; desc:0x8280580 //  address space: private; ; $2219

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 202:  return __devicelib_ConvertBF16ToFINTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2215
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2215
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2215

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
(W)     mov (1|M0)               f0.0<1>:ud    r162.4<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2219
(W)     mov (1|M0)               f1.0<1>:ud    r162.5<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2219
(W)     mov (1|M0)               f2.0<1>:ud    r162.6<0;1,0>:ud                 {Compacted,I@7}      //  ALU pipe: int; $2219
(W)     mov (1|M0)               f3.0<1>:ud    r162.7<0;1,0>:ud                 {I@7}                //  ALU pipe: int; $2219

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@5,$3} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2215
        sync.nop                             null                             {Compacted,$3.dst}     // 
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$3.src}             //  ALU pipe: int; 

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 345:  res[e] += conv_bias[reordered_elems_id + e];
        sync.nop                             null                             {Compacted,$23.src}    // $2220
        add (32|M0)              r132.0<1>:f   r2.0<1;1,0>:f     r26.0<1;1,0>:f   {Compacted,$2.dst} //  ALU pipe: float; $2220
        store.ugm.d32.a64.wb.wb (32|M0)  [r128:4+0xC] r132:2       {F@1,$4} // ex_desc:0xC000; desc:0x80E0584 //  address space: private; ; $2221
// B119: [inDivergent],  Preds:{B118, B113},  Succs:{B120, B121}
_0_169:

// Line 350:  if (seq_end_offset - seq_start_offset > 1) {
(W)     add (1|M0)               r4.6<1>:d     r163.1<0;1,0>:d   -r163.0<0;1,0>:d {$3.dst}           //  ALU pipe: int; $2228
(W)     cmp (32|M0)   (gt)f0.0   null<1>:d     r4.6<0;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $2229
(W&f0.0) jmpi                                _0_171                                                  //  ALU pipe: int; $2230
// B120: [inDivergent],  Preds:{B119},  Succs:{B123}
_0_172:

// Line 370:  conv_states_ptr[i * conv_elems + reordered_elems_id + e] =
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   2:d                                 //  ALU pipe: int; $2237
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   2:d                                 //  ALU pipe: int; $2237
        add (16|M0)              r12.0<1>:q    r124.0<1;1,0>:q   10:d                                //  ALU pipe: int; $2244
        add (16|M16)             r14.0<1>:q    r126.0<1;1,0>:q   10:d                                //  ALU pipe: int; $2244
        add (16|M0)              r16.0<1>:q    r124.0<1;1,0>:q   18:d                                //  ALU pipe: int; $2251
        add (16|M16)             r18.0<1>:q    r126.0<1;1,0>:q   18:d                                //  ALU pipe: int; $2251
        add (16|M0)              r20.0<1>:q    r124.0<1;1,0>:q   26:d                                //  ALU pipe: int; $2258
        add (16|M16)             r22.0<1>:q    r126.0<1;1,0>:q   26:d                                //  ALU pipe: int; $2258
        load.ugm.d32.a64.ca.ca (32|M0)  r34:2   [r8:4]             {I@7,$5} // ex_desc:0x0; desc:0x8280580 // $2237
        load.ugm.d32.a64.ca.ca (32|M0)  r24:2   [r12:4]            {I@5,$6} // ex_desc:0x0; desc:0x8280580 // $2244
        load.ugm.d32.a64.ca.ca (32|M0)  r14:2   [r16:4]            {I@3,$7} // ex_desc:0x0; desc:0x8280580 // $2251
        load.ugm.d32.a64.ca.ca (32|M0)  r12:2   [r20:4]            {I@1,$8} // ex_desc:0x0; desc:0x8280580 // $2258
        mov (16|M0)              r1.0<2>:ud    r144.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2235
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   6:d               {$5.src}          //  ALU pipe: int; $2240
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   6:d                                 //  ALU pipe: int; $2240
        shl (16|M0)              r38.0<1>:q    r1.0<2;1,0>:d     1:w               {I@3}             //  ALU pipe: int; $2235
        mov (16|M16)             r16.0<2>:ud   r145.0<1;1,0>:ud                 {Compacted,$7.src}   //  ALU pipe: int; $2235
        load.ugm.d16u32.a64.ca.ca (32|M0)  r2:2 [r8:4]             {I@2,$9} // ex_desc:0x0; desc:0x8280B80 // $2240
        add (16|M0)              r30.0<1>:q    r162.4<0;1,0>:q   r38.0<1;1,0>:q   {Compacted}        //  ALU pipe: int; $2236
        mov (32|M0)              r38.0<1>:w    r34.0<2;1,0>:w                   {$5.dst}             //  ALU pipe: int; $2238
        mov (32|M0)              r41.0<1>:w    r34.1<2;1,0>:w                                        //  ALU pipe: int; $2239
        sync.nop                             null                             {Compacted,$9.src}     // $2245
        mov (32|M0)              r10.0<1>:w    r24.0<2;1,0>:w                   {$6.dst}             //  ALU pipe: int; $2245
        mov (32|M0)              r40.0<1>:w    r24.1<2;1,0>:w                                        //  ALU pipe: int; $2246
        mov (32|M0)              r8.0<1>:w     r14.0<2;1,0>:w                   {$7.dst}             //  ALU pipe: int; $2252
        mov (32|M0)              r11.0<1>:w    r14.1<2;1,0>:w                                        //  ALU pipe: int; $2253
        mov (32|M0)              r1.0<1>:w     r12.0<2;1,0>:w                   {$8.dst}             //  ALU pipe: int; $2259
        mov (32|M0)              r9.0<1>:w     r12.1<2;1,0>:w                                        //  ALU pipe: int; $2260
        shl (16|M16)             r36.0<1>:q    r16.0<2;1,0>:d    1:w               {I@7}             //  ALU pipe: int; $2235
        mov (16|M0)              r14.0<4>:w    r38.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $2261
        mov (16|M16)             r12.0<4>:w    r38.16<1;1,0>:w                                       //  ALU pipe: int; $2261
        mov (16|M0)              r14.1<4>:w    r10.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $2262
        mov (16|M16)             r12.1<4>:w    r10.16<1;1,0>:w                                       //  ALU pipe: int; $2262
        mov (16|M0)              r38.0<4>:w    r41.0<1;1,0>:w                                        //  ALU pipe: int; $2279
        mov (16|M0)              r14.2<4>:w    r8.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $2263
        mov (16|M16)             r12.2<4>:w    r8.16<1;1,0>:w                                        //  ALU pipe: int; $2263
        mov (16|M0)              r38.1<4>:w    r40.0<1;1,0>:w                                        //  ALU pipe: int; $2280
        mov (16|M0)              r14.3<4>:w    r1.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $2264
        mov (16|M16)             r12.3<4>:w    r1.16<1;1,0>:w                                        //  ALU pipe: int; $2264
        mov (16|M0)              r38.2<4>:w    r11.0<1;1,0>:w                                        //  ALU pipe: int; $2281
        mov (16|M16)             r24.0<4>:w    r41.16<1;1,0>:w                                       //  ALU pipe: int; $2279
        mov (16|M0)              r38.3<4>:w    r9.0<1;1,0>:w                                         //  ALU pipe: int; $2282
(W)     shl (1|M0)               r4.3<1>:q     r7.1<0;1,0>:d     1:w                                 //  ALU pipe: int; $2275
        add (16|M0)              r20.0<1>:q    r124.0<1;1,0>:q   14:d                                //  ALU pipe: int; $2247
        add (16|M16)             r22.0<1>:q    r126.0<1;1,0>:q   14:d                                //  ALU pipe: int; $2247
        add (16|M16)             r32.0<1>:q    r162.4<0;1,0>:q   r36.0<1;1,0>:q   {Compacted}        //  ALU pipe: int; $2236
        mov (16|M16)             r24.1<4>:w    r40.16<1;1,0>:w                                       //  ALU pipe: int; $2280
        mov (16|M16)             r24.2<4>:w    r11.16<1;1,0>:w                                       //  ALU pipe: int; $2281
        add (16|M16)             r18.0<1>:q    r126.0<1;1,0>:q   22:d                                //  ALU pipe: int; $2254
        add (16|M0)              r16.0<1>:q    r124.0<1;1,0>:q   22:d                                //  ALU pipe: int; $2254
        mov (16|M16)             r24.3<4>:w    r9.16<1;1,0>:w                                        //  ALU pipe: int; $2282
        mov (16|M0)              r8.0<1>:d     r14.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2265
        mov (16|M0)              r10.0<1>:d    r14.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2267
        mov (16|M16)             r11.0<1>:d    r12.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2268
        mov (16|M16)             r9.0<1>:d     r12.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2266
        mov (16|M0)              r14.0<1>:d    r38.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2285
        mov (16|M0)              r12.0<1>:d    r38.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2283
        load.ugm.d16u32.a64.ca.ca (32|M0)  r38:2 [r20:4]           {I@1,$10} // ex_desc:0x0; desc:0x8280B80 // $2247
        add (16|M0)              r34.0<1>:q    r30.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2276
        add (16|M16)             r36.0<1>:q    r32.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2276
        add (16|M0)              r44.0<1>:uq   r30.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2270
        add (16|M16)             r46.0<1>:uq   r32.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2270
        load.ugm.d16u32.a64.ca.ca (32|M0)  r20:2 [r16:4]           {$12} // ex_desc:0x0; desc:0x8280B80 // $2254
        mov (16|M16)             r13.0<1>:d    r24.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2284
        store.ugm.d32.a64 (32|M0)  [r30:4]      r8:2               {$13} // ex_desc:0x0; desc:0x8000584 // $2269
        mov (16|M16)             r15.0<1>:d    r24.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2286
        add (16|M0)              r40.0<1>:uq   r34.0<1;1,0>:uq   0x4:uw              {I@6}           //  ALU pipe: int; $2288
        add (16|M16)             r42.0<1>:uq   r36.0<1;1,0>:uq   0x4:uw              {I@6}           //  ALU pipe: int; $2288
        store.ugm.d32.a64 (32|M0)  [r44:4]      r10:2              {I@5,$14} // ex_desc:0x0; desc:0x8000584 // $2271
        store.ugm.d32.a64 (32|M0)  [r34:4]      r12:2              {I@4,$16} // ex_desc:0x0; desc:0x8000584 // $2287
        store.ugm.d32.a64 (32|M0)  [r40:4]      r14:2              {I@1,$17} // ex_desc:0x0; desc:0x8000584 // $2289
        add (16|M0)              r22.0<1>:q    r124.0<1;1,0>:q   30:d               {$10.src}        //  ALU pipe: int; $2295
        add (16|M16)             r24.0<1>:q    r126.0<1;1,0>:q   30:d                                //  ALU pipe: int; $2295
        sync.nop                             null                             {Compacted,$13.src}    // $2241
        mov (32|M0)              r8.0<1>:w     r2.0<2;1,0>:w                    {$9.dst}             //  ALU pipe: int; $2241
        mov (32|M0)              r3.0<1>:w     r20.0<2;1,0>:w                   {$12.dst}            //  ALU pipe: int; $2255
        mov (16|M0)              r16.0<4>:w    r8.0<1;1,0>:w                    {I@2}                //  ALU pipe: int; $2297
        mov (16|M16)             r1.0<4>:w     r8.16<1;1,0>:w                                        //  ALU pipe: int; $2297
        mov (32|M0)              r8.0<1>:w     r38.0<2;1,0>:w                   {$10.dst}            //  ALU pipe: int; $2248
        add (16|M0)              r12.0<1>:q    r34.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted,$16.src} //  ALU pipe: int; $2292
        mov (16|M0)              r16.1<4>:w    r8.0<1;1,0>:w                    {I@2}                //  ALU pipe: int; $2298
        mov (16|M16)             r1.1<4>:w     r8.16<1;1,0>:w                                        //  ALU pipe: int; $2298
        mov (16|M0)              r16.2<4>:w    r3.0<1;1,0>:w                                         //  ALU pipe: int; $2299
        mov (16|M16)             r1.2<4>:w     r3.16<1;1,0>:w                                        //  ALU pipe: int; $2299
        add (16|M16)             r14.0<1>:q    r36.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted,$17.src} //  ALU pipe: int; $2292 R{} IR{}{E:2,E:2,},  R{r4,} IR{} {BC=1}
        mov (16|M0)              r8.0<1>:d     r16.0<2;1,0>:d                   {Compacted,I@3}      //  ALU pipe: int; $2301
        mov (16|M16)             r9.0<1>:d     r1.0<2;1,0>:d                    {Compacted,I@3}      //  ALU pipe: int; $2302
        add (16|M0)              r18.0<1>:uq   r12.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2306
        add (16|M16)             r20.0<1>:uq   r14.0<1;1,0>:uq   0x4:uw              {I@4}           //  ALU pipe: int; $2306
        load.ugm.d16u32.a64.ca.ca (32|M0)  r10:2 [r22:4]           {$18} // ex_desc:0x0; desc:0x8280B80 //  address space: private; ; $2295
        store.ugm.d32.a64 (32|M0)  [r12:4]      r8:2               {I@3,$20} // ex_desc:0x0; desc:0x8000584 // $2305
        mov (32|M0)              r3.0<1>:w     r10.0<2;1,0>:w                   {$18.dst}            //  ALU pipe: int; $2296
        mov (16|M0)              r16.3<4>:w    r3.0<1;1,0>:w                    {I@1}                //  ALU pipe: int; $2300
        mov (16|M16)             r1.3<4>:w     r3.16<1;1,0>:w                                        //  ALU pipe: int; $2300
        mov (16|M0)              r10.0<1>:d    r16.1<2;1,0>:d                   {Compacted,I@2}      //  ALU pipe: int; $2303
        mov (16|M16)             r11.0<1>:d    r1.1<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2304
        store.ugm.d32.a64 (32|M0)  [r18:4]      r10:2              {I@1,$21} // ex_desc:0x0; desc:0x8000584 // $2307
(W)     jmpi                                 _0_173                                                  // $2309
// B121: [inDivergent],  Preds:{B119},  Succs:{B122, B123}
_0_171:

// Line 353:  if (seq_end_offset - 1 == token_id) {
(W)     add (1|M0)               r4.6<1>:d     r163.1<0;1,0>:d   -1:w                                //  ALU pipe: int; $2312
(W)     cmp (32|M0)   (eq)f0.0   null<1>:d     r4.6<0;1,0>:d     r253.6<0;1,0>:d  {I@1}              //  ALU pipe: int; $2313
(W&~f0.0) jmpi                               _0_173                                                  //  ALU pipe: int; $2314
// B122: [inDivergent],  Preds:{B121},  Succs:{B123}
_0_174:

// Line 359:  [batch_id * (Width - 1) * conv_elems + i * conv_elems +
(W)     mul (1|M0)               r4.6<1>:d     r162.11<0;1,0>:d  3:w                                 //  ALU pipe: int; $2317

// Line 360:  reordered_elems_id + e] = local_input[Width * e + i + 1];
        add (16|M0)              r8.0<1>:q     r124.0<1;1,0>:q   2:d                                 //  ALU pipe: int; $2329
        add (16|M16)             r10.0<1>:q    r126.0<1;1,0>:q   2:d                                 //  ALU pipe: int; $2329
        add (16|M0)              r12.0<1>:q    r124.0<1;1,0>:q   10:d                                //  ALU pipe: int; $2336
        add (16|M16)             r14.0<1>:q    r126.0<1;1,0>:q   10:d                                //  ALU pipe: int; $2336
        add (16|M0)              r16.0<1>:q    r124.0<1;1,0>:q   18:d                                //  ALU pipe: int; $2343
        add (16|M16)             r18.0<1>:q    r126.0<1;1,0>:q   18:d                                //  ALU pipe: int; $2343
        add (16|M0)              r20.0<1>:q    r124.0<1;1,0>:q   26:d                                //  ALU pipe: int; $2350
        add (16|M16)             r22.0<1>:q    r126.0<1;1,0>:q   26:d                                //  ALU pipe: int; $2350

// Line 359:  [batch_id * (Width - 1) * conv_elems + i * conv_elems +
(W)     mul (1|M0)               acc0.0<1>:d   r4.6<0;1,0>:d     r7.2<0;1,0>:uw   {I@7}              //  ALU pipe: int; $2320

// Line 360:  reordered_elems_id + e] = local_input[Width * e + i + 1];
        load.ugm.d32.a64.ca.ca (32|M0)  r24:2   [r8:4]             {I@7,$22} // ex_desc:0x0; desc:0x8280580 // $2329
        load.ugm.d32.a64.ca.ca (32|M0)  r34:2   [r12:4]            {I@6,$24} // ex_desc:0x0; desc:0x8280580 // $2336

// Line 359:  [batch_id * (Width - 1) * conv_elems + i * conv_elems +
(W)     macl (1|M0)              r6.0<1>:d     r4.6<0;1,0>:d     r7.1<0;1,0>:d    {Compacted}        //  ALU pipe: int; $2321

// Line 360:  reordered_elems_id + e] = local_input[Width * e + i + 1];
        load.ugm.d32.a64.ca.ca (32|M0)  r32:2   [r16:4]            {I@5,$25} // ex_desc:0x0; desc:0x8280580 // $2343
        load.ugm.d32.a64.ca.ca (32|M0)  r30:2   [r20:4]            {I@3,$26} // ex_desc:0x0; desc:0x8280580 // $2350

// Line 359:  [batch_id * (Width - 1) * conv_elems + i * conv_elems +
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r144.0<1;1,0>:d  {Compacted,I@1}    //  ALU pipe: int; $2321

// Line 360:  reordered_elems_id + e] = local_input[Width * e + i + 1];
(W)     shl (1|M0)               r4.3<1>:q     r7.1<0;1,0>:d     1:w                                 //  ALU pipe: int; $2367
        add (16|M16)             r9.0<1>:q     r126.0<1;1,0>:q   6:d               {$22.src}         //  ALU pipe: int; $2332
        add (16|M0)              r7.0<1>:q     r124.0<1;1,0>:q   6:d                                 //  ALU pipe: int; $2332
        mov (16|M16)             r22.0<2>:ud   r3.0<1;1,0>:ud                   {Compacted,@4,$26.src} //  ALU pipe: int; $2327
        mov (16|M0)              r20.0<2>:ud   r2.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2327
        load.ugm.d16u32.a64.ca.ca (32|M0)  r2:2 [r7:4]             {I@1,$28} // ex_desc:0x0; desc:0x8280B80 // $2332
        shl (16|M16)             r7.0<1>:q     r22.0<2;1,0>:d    1:w               {$28.src}         //  ALU pipe: int; $2327
        shl (16|M0)              r9.0<1>:q     r20.0<2;1,0>:d    1:w                                 //  ALU pipe: int; $2327
        mov (32|M0)              r11.0<1>:w    r24.0<2;1,0>:w                   {$22.dst}            //  ALU pipe: int; $2330
        add (16|M16)             r22.0<1>:q    r7.0<1;1,0>:q     r5.7<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $2328
        add (16|M0)              r20.0<1>:q    r9.0<1;1,0>:q     r5.7<0;1,0>:q    {Compacted,I@3}    //  ALU pipe: int; $2328
        mov (32|M0)              r8.0<1>:w     r34.0<2;1,0>:w                   {$24.dst}            //  ALU pipe: int; $2337
        mov (32|M0)              r40.0<1>:w    r24.1<2;1,0>:w                                        //  ALU pipe: int; $2331
        mov (32|M0)              r5.0<1>:w     r32.0<2;1,0>:w                   {$25.dst}            //  ALU pipe: int; $2344
        mov (32|M0)              r1.0<1>:w     r30.0<2;1,0>:w                   {$26.dst}            //  ALU pipe: int; $2351
        mov (32|M0)              r10.0<1>:w    r34.1<2;1,0>:w                                        //  ALU pipe: int; $2338
        mov (32|M0)              r9.0<1>:w     r32.1<2;1,0>:w                                        //  ALU pipe: int; $2345
        mov (16|M0)              r36.0<4>:w    r11.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $2353
        mov (32|M0)              r7.0<1>:w     r30.1<2;1,0>:w                                        //  ALU pipe: int; $2352
        mov (16|M16)             r34.0<4>:w    r11.16<1;1,0>:w                                       //  ALU pipe: int; $2353
        mov (16|M0)              r36.1<4>:w    r8.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $2354
        mov (16|M16)             r34.1<4>:w    r8.16<1;1,0>:w                                        //  ALU pipe: int; $2354
        mov (16|M0)              r38.0<4>:w    r40.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $2371
        mov (16|M0)              r36.2<4>:w    r5.0<1;1,0>:w                    {I@7}                //  ALU pipe: int; $2355
        mov (16|M16)             r34.2<4>:w    r5.16<1;1,0>:w                                        //  ALU pipe: int; $2355
        mov (16|M0)              r38.1<4>:w    r10.0<1;1,0>:w                   {I@7}                //  ALU pipe: int; $2372
        mov (16|M0)              r36.3<4>:w    r1.0<1;1,0>:w                                         //  ALU pipe: int; $2356
        mov (16|M16)             r34.3<4>:w    r1.16<1;1,0>:w                                        //  ALU pipe: int; $2356
        mov (16|M16)             r24.0<4>:w    r40.16<1;1,0>:w                                       //  ALU pipe: int; $2371
        mov (16|M0)              r38.2<4>:w    r9.0<1;1,0>:w                                         //  ALU pipe: int; $2373
        mov (16|M16)             r24.1<4>:w    r10.16<1;1,0>:w                                       //  ALU pipe: int; $2372
        mov (16|M0)              r38.3<4>:w    r7.0<1;1,0>:w                                         //  ALU pipe: int; $2374
        add (16|M0)              r12.0<1>:q    r124.0<1;1,0>:q   22:d                                //  ALU pipe: int; $2346
        add (16|M16)             r14.0<1>:q    r126.0<1;1,0>:q   22:d                                //  ALU pipe: int; $2346
        add (16|M0)              r16.0<1>:q    r124.0<1;1,0>:q   14:d                                //  ALU pipe: int; $2339
        add (16|M16)             r18.0<1>:q    r126.0<1;1,0>:q   14:d                                //  ALU pipe: int; $2339
        mov (16|M16)             r24.2<4>:w    r9.16<1;1,0>:w                                        //  ALU pipe: int; $2373
        mov (16|M16)             r24.3<4>:w    r7.16<1;1,0>:w                                        //  ALU pipe: int; $2374
        mov (16|M0)              r8.0<1>:d     r36.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2357
        mov (16|M16)             r9.0<1>:d     r34.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2358
        add (16|M16)             r32.0<1>:q    r22.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2368
        add (16|M0)              r30.0<1>:q    r20.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2368
        mov (16|M16)             r11.0<1>:d    r34.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2360
        mov (16|M0)              r10.0<1>:d    r36.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2359
        add (16|M16)             r46.0<1>:uq   r22.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2362
        add (16|M0)              r44.0<1>:uq   r20.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2362
        mov (16|M0)              r34.0<1>:d    r38.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2375
        mov (16|M0)              r36.0<1>:d    r38.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2377
        load.ugm.d16u32.a64.ca.ca (32|M0)  r48:2 [r16:4]           {$29} // ex_desc:0x0; desc:0x8280B80 // $2339
        load.ugm.d16u32.a64.ca.ca (32|M0)  r38:2 [r12:4]           {I@1,$31} // ex_desc:0x0; desc:0x8280B80 // $2346
        mov (16|M16)             r35.0<1>:d    r24.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2376
        store.ugm.d32.a64 (32|M0)  [r20:4]      r8:2               {$0} // ex_desc:0x0; desc:0x8000584 // $2361
        add (16|M16)             r42.0<1>:uq   r32.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2380
        add (16|M0)              r40.0<1>:uq   r30.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2380
        mov (16|M16)             r37.0<1>:d    r24.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2378
        store.ugm.d32.a64 (32|M0)  [r44:4]      r10:2              {$2} // ex_desc:0x0; desc:0x8000584 // $2363
        store.ugm.d32.a64 (32|M0)  [r30:4]      r34:2              {I@4,$3} // ex_desc:0x0; desc:0x8000584 // $2379
        store.ugm.d32.a64 (32|M0)  [r40:4]      r36:2              {I@1,$5} // ex_desc:0x0; desc:0x8000584 // $2381
        add (16|M0)              r22.0<1>:q    r124.0<1;1,0>:q   30:d               {$0.src}         //  ALU pipe: int; $2387
        add (16|M16)             r24.0<1>:q    r126.0<1;1,0>:q   30:d                                //  ALU pipe: int; $2387
        mov (32|M0)              r5.0<1>:w     r2.0<2;1,0>:w                    {$28.dst}            //  ALU pipe: int; $2333
        mov (32|M0)              r3.0<1>:w     r38.0<2;1,0>:w                   {$31.dst}            //  ALU pipe: int; $2347
        mov (16|M0)              r16.0<4>:w    r5.0<1;1,0>:w                    {@2,$29.src}         //  ALU pipe: int; $2389
        mov (16|M16)             r1.0<4>:w     r5.16<1;1,0>:w                                        //  ALU pipe: int; $2389
        mov (32|M0)              r5.0<1>:w     r48.0<2;1,0>:w                   {$29.dst}            //  ALU pipe: int; $2340
        add (16|M0)              r12.0<1>:q    r30.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2384
        mov (16|M0)              r16.1<4>:w    r5.0<1;1,0>:w                    {I@2}                //  ALU pipe: int; $2390
        mov (16|M16)             r1.1<4>:w     r5.16<1;1,0>:w                                        //  ALU pipe: int; $2390
        mov (16|M0)              r16.2<4>:w    r3.0<1;1,0>:w                                         //  ALU pipe: int; $2391
        mov (16|M16)             r1.2<4>:w     r3.16<1;1,0>:w                                        //  ALU pipe: int; $2391
        add (16|M16)             r14.0<1>:q    r32.0<1;1,0>:q    r4.3<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2384
        mov (16|M0)              r8.0<1>:d     r16.0<2;1,0>:d                   {Compacted,I@3}      //  ALU pipe: int; $2393
        mov (16|M16)             r9.0<1>:d     r1.0<2;1,0>:d                    {Compacted,I@3}      //  ALU pipe: int; $2394
        add (16|M0)              r18.0<1>:uq   r12.0<1;1,0>:uq   0x4:uw                              //  ALU pipe: int; $2398
        add (16|M16)             r20.0<1>:uq   r14.0<1;1,0>:uq   0x4:uw              {I@4}           //  ALU pipe: int; $2398
        load.ugm.d16u32.a64.ca.ca (32|M0)  r10:2 [r22:4]           {$6} // ex_desc:0x0; desc:0x8280B80 //  address space: private; ; $2387
        store.ugm.d32.a64 (32|M0)  [r12:4]      r8:2               {I@3,$7} // ex_desc:0x0; desc:0x8000584 // $2397
        mov (32|M0)              r3.0<1>:w     r10.0<2;1,0>:w                   {$6.dst}             //  ALU pipe: int; $2388
        mov (16|M0)              r16.3<4>:w    r3.0<1;1,0>:w                    {I@1}                //  ALU pipe: int; $2392
        mov (16|M16)             r1.3<4>:w     r3.16<1;1,0>:w                                        //  ALU pipe: int; $2392
        mov (16|M0)              r10.0<1>:d    r16.1<2;1,0>:d                   {Compacted,I@2}      //  ALU pipe: int; $2395
        mov (16|M16)             r11.0<1>:d    r1.1<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2396
        store.ugm.d32.a64 (32|M0)  [r18:4]      r10:2              {I@1,$8} // ex_desc:0x0; desc:0x8000584 // $2399
// B123: [inDivergent],  Preds:{B122, B121, B120},  Succs:{B124, B126}
_0_173:
(W)     cmp (32|M0)   (lt)f0.0   null<1>:d     r6.9<0;1,0>:d     1:w                                 //  ALU pipe: int; $2402
(W)     mov (1|M0)               r4.7<1>:f     0xB5BFBE8E:f                                          //  ALU pipe: float; $2403
(W)     mov (1|M0)               r4.6<1>:f     0xBF317200:f                                          //  ALU pipe: float; $2404
(W&f0.0) jmpi                                _0_175                                                  //  ALU pipe: int; $2405
// B124: [inDivergent],  Preds:{B123},  Succs:{B125, B128}
_0_176:
(W)     cmp (32|M0)   (eq)f0.0   null<1>:d     r6.9<0;1,0>:d     1:w                                 //  ALU pipe: int; $2407
(W&~f0.0) jmpi                               _0_177                                                  //  ALU pipe: int; $2408
// B125: [inDivergent],  Preds:{B124},  Succs:{B128}
_0_178:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r142.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2412
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2413
        cmp (32|M0)   (gt)f0.0   null<1>:f     r142.0<1;1,0>:f   0x42D20000:f               {I@1}    //  ALU pipe: float; $2425
        mad (32|M0)              acc0.0<1>:f   -r142.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2414 R{} IR{}{E:7,E:1,E:2,},  R{r4,} IR{}{O:7,O:1,},  {BC=1}
        sync.nop                             null                             {Compacted,$7.src}     // $2417
        math.exp (32|M0)         r8.0<1>:f     r2.0<1;1,0>:f                    {$20.src}            //  ALU pipe: math; $2417
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2415
        sync.nop                             null                             {Compacted,$8.src}     // $2416
        mul (32|M0)              r10.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f               {$21.src} //  ALU pipe: float; $2416
        math.exp (32|M0)         r2.0<1>:f     r10.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2418
        mul (32|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2419

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2422
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2428

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r142.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2431

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2434

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r138.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2440

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r8.0<1;1,0>:f                    {F@2}                //  ALU pipe: math; $2435
        mul (32|M0)              r8.0<1>:f     r142.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2436

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2441
        cmp (32|M0)   (gt)f0.0   null<1>:f     r138.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2453
        mad (32|M0)              acc0.0<1>:f   -r138.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2442 R{} IR{}{E:5,E:1,E:2,},  R{r4,} IR{}{O:5,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2445
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2443
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2444
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2446
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2447

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2450
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2456

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r138.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2459

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2462

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r136.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2468

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@2}                //  ALU pipe: math; $2463
        mul (32|M0)              r10.0<1>:f    r138.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2464

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2469
        cmp (32|M0)   (gt)f0.0   null<1>:f     r136.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2481
        mad (32|M0)              acc0.0<1>:f   -r136.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2470 R{} IR{}{E:4,E:1,E:2,},  R{r4,} IR{}{O:4,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2473
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2471
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2472
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2474
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2475

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2478
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2484

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r136.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2487

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2490

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r132.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2496

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@2}                //  ALU pipe: math; $2491
        mul (32|M0)              r12.0<1>:f    r136.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2492

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2497
        cmp (32|M0)   (gt)f0.0   null<1>:f     r132.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2509
        mad (32|M0)              acc0.0<1>:f   -r132.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2498 R{} IR{}{E:2,E:1,E:2,},  R{r4,} IR{}{O:2,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2501
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2499
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2500
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2502
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2503

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2506
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2512

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r132.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2515

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2518
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2519
        mul (32|M0)              r14.0<1>:f    r132.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2520
        store.ugm.d32x4.a64.wb.wb (32|M0)  [r128:4] r8:8           {F@1,$9} // ex_desc:0x0; desc:0x80E3584 //  address space: private; ; $2521

// Line 389:  if (is_q) {
(W)     jmpi                                 _0_177                                                  // $2524
// B126: [inDivergent],  Preds:{B123},  Succs:{B127, B128}
_0_175:
(W)     cmp (32|M0)   (eq)f0.0   null<1>:d     r6.9<0;1,0>:d     0:w                                 //  ALU pipe: int; $2526
(W&~f0.0) jmpi                               _0_177                                                  //  ALU pipe: int; $2527
// B127: [inDivergent],  Preds:{B126},  Succs:{B128}
_0_179:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r142.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2532
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2533
        cmp (32|M0)   (gt)f0.0   null<1>:f     r142.0<1;1,0>:f   0x42D20000:f               {I@1}    //  ALU pipe: float; $2545
        mad (32|M0)              acc0.0<1>:f   -r142.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2534 R{} IR{}{E:7,E:1,E:2,},  R{r4,} IR{}{O:7,O:1,},  {BC=1}
        sync.nop                             null                             {Compacted,$7.src}     // $2537
        math.exp (32|M0)         r8.0<1>:f     r2.0<1;1,0>:f                    {$20.src}            //  ALU pipe: math; $2537
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2535
        sync.nop                             null                             {Compacted,$8.src}     // $2536
        mul (32|M0)              r10.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f               {$21.src} //  ALU pipe: float; $2536
        math.exp (32|M0)         r2.0<1>:f     r10.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2538
        mul (32|M0)              acc0.0<1>:f   r8.0<1;1,0>:f     r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2539

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2542
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2548

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r142.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2551

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r8.0<1>:f     acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2554

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r138.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2560

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r8.0<1;1,0>:f                    {F@2}                //  ALU pipe: math; $2555
        mul (32|M0)              r8.0<1>:f     r142.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2556

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2561
        cmp (32|M0)   (gt)f0.0   null<1>:f     r138.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2573
        mad (32|M0)              acc0.0<1>:f   -r138.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2562 R{} IR{}{E:5,E:1,E:2,},  R{r4,} IR{}{O:5,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2565
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2563
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2564
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2566
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2567

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2570
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2576

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r138.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2579

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2582

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r136.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2588

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@2}                //  ALU pipe: math; $2583
        mul (32|M0)              r10.0<1>:f    r138.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2584

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2589
        cmp (32|M0)   (gt)f0.0   null<1>:f     r136.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2601
        mad (32|M0)              acc0.0<1>:f   -r136.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2590 R{} IR{}{E:4,E:1,E:2,},  R{r4,} IR{}{O:4,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2593
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2591
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2592
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2594
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2595

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2598
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2604

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r136.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2607

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2610

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        mul (32|M0)              acc0.0<1>:f   r132.0<1;1,0>:f   0xBFB8AA3B:f                        //  ALU pipe: float; $2616

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@2}                //  ALU pipe: math; $2611
        mul (32|M0)              r12.0<1>:f    r136.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2612

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        rndz (32|M0)             r2.0<1>:f     acc0.0<1;1,0>:f                                       //  ALU pipe: float; $2617
        cmp (32|M0)   (gt)f0.0   null<1>:f     r132.0<1;1,0>:f   0x42D20000:f                        //  ALU pipe: float; $2629
        mad (32|M0)              acc0.0<1>:f   -r132.0<1;0>:f    r2.0<1;0>:f       r4.6<0>:f        {F@2} //  ALU pipe: float; $2618 R{} IR{}{E:2,E:1,E:2,},  R{r4,} IR{}{O:2,O:1,},  {BC=1}
        math.exp (32|M0)         r16.0<1>:f    r2.0<1;1,0>:f                                         //  ALU pipe: math; $2621
        mad (32|M0)              acc0.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r4.7<0>:f        {Compacted} //  ALU pipe: float; $2619
        mul (32|M0)              r18.0<1>:f    acc0.0<1;1,0>:f   0x3FB8AA3B:f                        //  ALU pipe: float; $2620
        math.exp (32|M0)         r2.0<1>:f     r18.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2622
        mul (32|M0)              acc0.0<1>:f   r16.0<1;1,0>:f    r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2623

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
        add (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f               {Compacted} //  ALU pipe: float; $2626
(~f0.0) sel (32|M0)              acc0.0<1>:f   acc0.0<1;1,0>:f   0x3F800000:f                        //  ALU pipe: float; $2632

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/builtins/math_functions.inc

// Line 180:  BUILTIN_GENF_NATIVE_OPT(ONE_ARG, exp)
        cmp (32|M0)   (lt)f0.0   null<1>:f     r132.0<1;1,0>:f   0xC2D20000:f                        //  ALU pipe: float; $2635

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 88:  x = x / (1.0f + sycl::exp(-x * beta));
(~f0.0) sel (32|M0)              r16.0<1>:f    acc0.0<1;1,0>:f   0x7F800000:f                        //  ALU pipe: float; $2638
        math.inv (32|M0)         r2.0<1>:f     r16.0<1;1,0>:f                   {F@1}                //  ALU pipe: math; $2639
        mul (32|M0)              r14.0<1>:f    r132.0<1;1,0>:f   r2.0<1;1,0>:f    {Compacted,M@1}    //  ALU pipe: float; $2640
        store.ugm.d32x4.a64.wb.wb (32|M0)  [r128:4] r8:8           {F@1,$10} // ex_desc:0x0; desc:0x80E3584 //  address space: private; ; $2641
// B128: [inDivergent],  Preds:{B127, B126, B125, B124},  Succs:{B129, B141}
_0_177:

// Line 389:  if (is_q) {
(f1.0)  goto (32|M0)                         _0_180            _0_180                                //  ALU pipe: int; $2645
// B129: [inDivergent],  Preds:{B128},  Succs:{B130, B136}
_0_181:
        cmp (32|M0)   (ne)f0.0   null<1>:d     r166.0<1;1,0>:d   0:w                                 //  ALU pipe: int; $2647

// Line 394:  } else if (is_k) {
(f0.0)  goto (32|M0)                         _0_182            _0_182                                //  ALU pipe: int; $2649
// B130: [inDivergent],  Preds:{B129},  Succs:{B131, B146}
_0_183:
        cmp (32|M0)   (ne)f0.0   null<1>:d     r164.0<1;1,0>:d   0:w                                 //  ALU pipe: int; $2651

// Line 399:  } else if (is_v) {
(~f0.0) goto (32|M0)                         _0_182            _0_105                                //  ALU pipe: int; $2653
// B131: [FCALL],  [inDivergent],  Preds:{B130},  Succs:{B132}
_0_185:

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
(W)     mul (1|M0)               acc0.0<1>:d   r253.6<0;1,0>:d   r6.24<0;1,0>:uw                     //  ALU pipe: int; $2656

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2672
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2672

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
(W)     macl (1|M0)              r6.0<1>:d     r253.6<0;1,0>:d   r6.12<0;1,0>:d                      //  ALU pipe: int; $2657

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2671

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r140.0<1;1,0>:d  {Compacted,I@2}    //  ALU pipe: int; $2657
(W)     mul (16|M0)              acc0.0<1>:d   r2.0<1;1,0>:d     r162.20<0;1,0>:uw {I@1}             //  ALU pipe: int; $2658 R{} IR{}{E:1,E:1,},  {BC=1}
        sync.allrd                           ($7,$9,$10)                                             // $2658
        macl (16|M0)             r8.0<1>:d     r2.0<1;1,0>:d     r162.10<0;1,0>:d {Compacted,$20.src} //  ALU pipe: int; $2658 R{} IR{}{E:1,E:1,},  {BC=1}
(W)     mul (16|M16)             acc0.0<1>:d   r3.0<1;1,0>:d     r162.20<0;1,0>:uw                   //  ALU pipe: int; $2658

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (16|M0)              r2.0<1>:ud    r128.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2664

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 402:  qkvz_dim_id - (q_dim + k_dim)],
        macl (16|M16)            r9.0<1>:d     r3.0<1;1,0>:d     r162.10<0;1,0>:d {Compacted}        //  ALU pipe: int; $2660

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (16|M16)             r3.0<1>:ud    r130.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2664

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        add3 (32|M0)             r124.0<1>:d   r8.0<1;0>:d       r146.0<1;0>:d     -r162.12<0>:d    {I@2} //  ALU pipe: int; $2660 R{} IR{}{E:4,E:1,E:1,},  R{r162,} IR{}{O:4,O:9,},  {BC=1}

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2665
        sync.nop                             null                             {Compacted,$8.src}     // $2663
        mov (16|M0)              r9.0<2>:ud    r128.0<2;1,0>:ud                 {Compacted,$21.src}  //  ALU pipe: int; $2663
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2666
        mov (16|M16)             r7.0<2>:ud    r130.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2663
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2668
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2668

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2670

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$12} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2672

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2670
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$12.src}            //  ALU pipe: int; $2672
        sync.allrd                           null                             {A@1}                  // $2672
        sync.allwr                           null                                                    // $2672
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2672
// B132: [FCALL],  [inDivergent],  Preds:{B131},  Succs:{B133}
_L_k0_52_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2672
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2672
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2672
        mov (16|M0)              r2.0<1>:ud    r152.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2678
        mov (16|M16)             r3.0<1>:ud    r150.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2678
        mov (16|M0)              r9.0<2>:ud    r152.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2677

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$13} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2672

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        sync.nop                             null                             {Compacted,$13.dst}    // $2679
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2679
        mov (16|M16)             r7.0<2>:ud    r150.0<2;1,0>:ud                 {Compacted,$13.dst}  //  ALU pipe: int; $2677
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2680

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2685
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2682
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2682
        mov (32|M0)              r127.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2673
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2684

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$16} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2686

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2684
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $2686
        sync.allrd                           null                             {A@1}                  // $2686
        sync.allwr                           null                                                    // $2686
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2686
// B133: [FCALL],  [inDivergent],  Preds:{B132},  Succs:{B134}
_L_k0_53_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2686
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2686
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2686
        mov (16|M0)              r2.0<1>:ud    r156.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2692
        mov (16|M16)             r3.0<1>:ud    r154.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2692
        mov (16|M0)              r9.0<2>:ud    r156.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2691

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$17} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2686

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        sync.nop                             null                             {Compacted,$17.dst}    // $2693
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2693
        mov (16|M16)             r7.0<2>:ud    r154.0<2;1,0>:ud                 {Compacted,$17.dst}  //  ALU pipe: int; $2691
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2694

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2699
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2696
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2696
        mov (32|M0)              r126.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2687
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2698

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$18} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2700

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2698
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $2700
        sync.allrd                           null                             {A@1}                  // $2700
        sync.allwr                           null                                                    // $2700
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2700
// B134: [FCALL],  [inDivergent],  Preds:{B133},  Succs:{B135}
_L_k0_54_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2700
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2700
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2700
        mov (16|M0)              r2.0<1>:ud    r160.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2706
        mov (16|M16)             r3.0<1>:ud    r158.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2706
        mov (16|M0)              r9.0<2>:ud    r160.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2705

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$22} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2700

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        sync.nop                             null                             {Compacted,$22.dst}    // $2707
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2707
        mov (16|M16)             r7.0<2>:ud    r158.0<2;1,0>:ud                 {Compacted,$22.dst}  //  ALU pipe: int; $2705
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2708

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2713
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2710
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2710
        sync.nop                             null                             {Compacted,$4.src}     // $2701
        mov (32|M0)              r132.0<1>:hf  r26.0<1;1,0>:hf                  {$23.src}            //  ALU pipe: float; $2701
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2712

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$24} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2714

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2712
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $2714
        sync.allrd                           null                             {A@1}                  // $2714
        sync.allwr                           null                                                    // $2714
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2714
// B135: [inDivergent],  Preds:{B134},  Succs:{B146}
_L_k0_55_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2714
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2714
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2714

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
        mov (16|M0)              r1.0<2>:ud    r124.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2720

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (32|M0)              r3.0<1>:hf    r26.0<1;1,0>:hf                  {I@7}                //  ALU pipe: float; $2715

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@2,$25} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2714

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
        sync.nop                             null                             {Compacted,$25.dst}    // $2720
        shl (16|M0)              r13.0<1>:q    r1.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $2720
        mov (16|M16)             r1.0<2>:ud    r125.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2720

// Line 404:  }
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$25.src}            //  ALU pipe: int; $2748

// Line 401:  &v_out[token_id * num_k_heads * v_dim + k_heads_id * v_dim +
        shl (16|M16)             r11.0<1>:q    r1.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $2720
        mov (16|M0)              r1.0<4>:uw    r3.0<1;1,0>:uw                   {F@1}                //  ALU pipe: int; $2723
        mov (16|M0)              r15.0<1>:q    r1.0<4;1,0>:uw                   {I@1}                //  ALU pipe: int; $2723
        mov (16|M16)             r1.0<4>:uw    r3.16<1;1,0>:uw                                       //  ALU pipe: int; $2723
        add (16|M0)              r7.0<1>:q     r13.0<1;1,0>:q    r4.2<0;1,0>:q    {Compacted,$25.dst} //  ALU pipe: int; $2721
        mov (16|M16)             r13.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2723
        add (16|M16)             r9.0<1>:q     r11.0<1;1,0>:q    r4.2<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2721
        shl (16|M0)              r11.0<1>:q    r15.0<1;1,0>:q    48:w               {Compacted}      //  ALU pipe: int; $2724
        shl (16|M16)             r1.0<1>:q     r13.0<1;1,0>:q    48:w               {Compacted,I@3}  //  ALU pipe: int; $2724
        mov (16|M0)              r16.0<1>:d    r11.0<2;1,0>:d                   {Compacted,I@2}      //  ALU pipe: int; $2725
        mov (16|M16)             r17.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2726
        mov (16|M16)             r23.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2728
        mov (16|M0)              r1.0<4>:uw    r132.0<1;1,0>:uw                                      //  ALU pipe: int; $2729
        mov (16|M0)              r22.0<1>:d    r11.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2727
        mov (16|M0)              r18.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2729
        mov (16|M16)             r1.0<4>:uw    r132.16<1;1,0>:uw                                     //  ALU pipe: int; $2729
        shl (16|M0)              r11.0<1>:q    r18.0<1;1,0>:q    32:w               {Compacted,I@2}  //  ALU pipe: int; $2730
        mov (16|M16)             r13.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2729
        mov (16|M0)              r20.0<1>:d    r11.1<2;1,0>:d                   {Compacted,I@2}      //  ALU pipe: int; $2733
        shl (16|M16)             r1.0<1>:q     r13.0<1;1,0>:q    32:w               {Compacted,I@2}  //  ALU pipe: int; $2730
        mov (16|M0)              r14.0<1>:d    r11.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2731
        mov (16|M16)             r15.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2732
        mov (16|M16)             r21.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2734
        mov (16|M0)              r1.0<4>:uw    r126.0<1;1,0>:uw                                      //  ALU pipe: int; $2736
        or (32|M0)               r24.0<1>:d    r16.0<1;1,0>:d    r14.0<1;1,0>:d   {Compacted,I@3}    //  ALU pipe: int; $2735
        mov (16|M0)              r15.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2736
        mov (16|M16)             r1.0<4>:uw    r126.16<1;1,0>:uw                                     //  ALU pipe: int; $2736
        shl (16|M0)              r11.0<1>:q    r15.0<1;1,0>:q    16:w               {Compacted,I@2}  //  ALU pipe: int; $2737
        mov (16|M16)             r13.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2736
        mov (16|M0)              r18.0<1>:d    r11.0<2;1,0>:d                   {Compacted,I@2}      //  ALU pipe: int; $2738
        shl (16|M16)             r1.0<1>:q     r13.0<1;1,0>:q    16:w               {Compacted,I@2}  //  ALU pipe: int; $2737
        mov (16|M0)              r16.0<1>:d    r11.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $2740
        mov (16|M16)             r19.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2739
        mov (16|M16)             r17.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2741
        mov (32|M0)              r2.0<1>:d     r127.0<1;1,0>:uw                                      //  ALU pipe: int; $2743
        bfn.(s0|s1|s2) (32|M0)   r14.0<1>:ud   r22.0<1;0>:ud     r20.0<1;0>:ud     r16.0<1>:ud      {I@2} //  ALU pipe: int; $2742 R{} IR{}{E:3,E:2,E:0,},  R{} IR{}{O:11,O:10,O:8,},  {BC=2}
        bfn.(s0|s1|s2) (32|M0)   r12.0<1>:ud   r24.0<1;0>:ud     r18.0<1;0>:ud     r2.0<1>:ud       {I@2} //  ALU pipe: int; $2744 R{} IR{}{E:4,E:1,E:1,},  R{} IR{}{O:12,O:9,O:1,},  {BC=2}

// Line 101:  *reinterpret_cast<sycl::vec<T, elems_per_item>*>(ptr) = out;
        store.ugm.d32x2.a64 (32|M0)  [r7:4]     r12:4              {I@1,$26} // ex_desc:0x0; desc:0x8001584 // $2746

// Line 404:  }
        goto (32|M0)                         _0_182            _0_105                                // $2748
// B136: [FCALL],  [inDivergent],  Preds:{B129},  Succs:{B137}
_0_182:
        join (32|M0)                         _0_180                                                  // 
L42824:

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
(W)     mul (1|M0)               acc0.0<1>:d   r253.6<0;1,0>:d   r6.24<0;1,0>:uw                     //  ALU pipe: int; $2751

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2767
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2767

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
(W)     macl (1|M0)              r6.0<1>:d     r253.6<0;1,0>:d   r6.12<0;1,0>:d                      //  ALU pipe: int; $2752

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2766

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r140.0<1;1,0>:d  {Compacted,I@2}    //  ALU pipe: int; $2752
(W)     mul (16|M0)              acc0.0<1>:d   r2.0<1;1,0>:d     r6.26<0;1,0>:uw  {I@1}              //  ALU pipe: int; $2753
        sync.allrd                           ($7,$9,$10,$26)                                         // $2753
        macl (16|M0)             r8.0<1>:d     r2.0<1;1,0>:d     r6.13<0;1,0>:d   {$20.src}          //  ALU pipe: int; $2753
(W)     mul (16|M16)             acc0.0<1>:d   r3.0<1;1,0>:d     r6.26<0;1,0>:uw                     //  ALU pipe: int; $2753
        mov (16|M0)              r2.0<1>:ud    r128.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2758

// Line 397:  qkvz_dim_id - q_dim],
        macl (16|M16)            r9.0<1>:d     r3.0<1;1,0>:d     r6.13<0;1,0>:d                      //  ALU pipe: int; $2755
        mov (16|M16)             r3.0<1>:ud    r130.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2758
        add3 (32|M0)             r124.0<1>:d   r8.0<1;0>:d       r146.0<1;0>:d     -r6.13<0>:d      {I@2} //  ALU pipe: int; $2755 R{} IR{}{E:4,E:1,E:3,},  R{r6,} IR{}{O:4,O:9,},  {BC=1}
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2759
        sync.nop                             null                             {Compacted,$8.src}     // $2757
        mov (16|M0)              r9.0<2>:ud    r128.0<2;1,0>:ud                 {Compacted,$21.src}  //  ALU pipe: int; $2757
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2760
        mov (16|M16)             r7.0<2>:ud    r130.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2757
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2762
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2762

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2765

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$28} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2767

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2765
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$28.src}            //  ALU pipe: int; $2767
        sync.allrd                           null                             {A@1}                  // $2767
        sync.allwr                           null                                                    // $2767
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2767
// B137: [FCALL],  [inDivergent],  Preds:{B136},  Succs:{B138}
_L_k0_56_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2767
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2767
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2767

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r152.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2772
        mov (16|M16)             r3.0<1>:ud    r150.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2772
        mov (16|M0)              r9.0<2>:ud    r152.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2771

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$29} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2767

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$29.dst}    // $2773
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2773
        mov (16|M16)             r7.0<2>:ud    r150.0<2;1,0>:ud                 {Compacted,$29.dst}  //  ALU pipe: int; $2771
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2774

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2780

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2776
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2776

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (32|M0)              r127.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2768
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2779

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$31} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2781

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2779
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$31.src}            //  ALU pipe: int; $2781
        sync.allrd                           null                             {A@1}                  // $2781
        sync.allwr                           null                                                    // $2781
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2781
// B138: [FCALL],  [inDivergent],  Preds:{B137},  Succs:{B139}
_L_k0_57_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2781
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2781
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2781

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r156.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2786
        mov (16|M16)             r3.0<1>:ud    r154.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2786
        mov (16|M0)              r9.0<2>:ud    r156.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2785

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$0} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2781

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$0.dst}     // $2787
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2787
        mov (16|M16)             r7.0<2>:ud    r154.0<2;1,0>:ud                 {Compacted,$0.dst}   //  ALU pipe: int; $2785
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2788

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2794

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2790
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2790

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (32|M0)              r126.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2782
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2793

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$6} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2795

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2793
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$6.src}             //  ALU pipe: int; $2795
        sync.allrd                           null                             {A@1}                  // $2795
        sync.allwr                           null                                                    // $2795
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2795
// B139: [FCALL],  [inDivergent],  Preds:{B138},  Succs:{B140}
_L_k0_58_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2795
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2795
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2795

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r160.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2800
        mov (16|M16)             r3.0<1>:ud    r158.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2800
        mov (16|M0)              r9.0<2>:ud    r160.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2799

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@4,$12} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2795

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$12.dst}    // $2801
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2801
        mov (16|M16)             r7.0<2>:ud    r158.0<2;1,0>:ud                 {Compacted,$12.dst}  //  ALU pipe: int; $2799
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2802

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2808

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r9.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2804
        mov (16|M16)             r7.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2804

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        sync.nop                             null                             {Compacted,$4.src}     // $2796
        mov (32|M0)              r132.0<1>:hf  r26.0<1;1,0>:hf                  {$23.src}            //  ALU pipe: float; $2796
        mov (16|M0)              r26.0<1>:uq   r9.0<1;1,0>:uq                   {Compacted,A@1}      //  ALU pipe: int; $2807

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x64t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:4  {I@2,$13} // ex_desc:a0.2; desc:0x4200F504 //  spill to FP[0*64] of ?; ; $2809

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M16)             r28.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted}          //  ALU pipe: int; $2807
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$13.src}            //  ALU pipe: int; $2809
        sync.allrd                           null                             {A@1}                  // $2809
        sync.allwr                           null                                                    // $2809
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2809
// B140: [inDivergent],  Preds:{B139},  Succs:{B146}
_L_k0_59_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2809
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2809
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2809

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
        mov (16|M0)              r1.0<2>:ud    r124.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2815

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (32|M0)              r3.0<1>:hf    r26.0<1;1,0>:hf                  {I@7}                //  ALU pipe: float; $2810

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x64t.a32 (1|M0)  r4:4       ss[a0.2][r254:1-0x10000]  {I@2,$16} // ex_desc:a0.2; desc:0x4240F500 //  fill from FP[0*64] of ?; ; $2809

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
        sync.nop                             null                             {Compacted,$16.dst}    // $2815
        shl (16|M0)              r9.0<1>:q     r1.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $2815
        mov (16|M16)             r1.0<2>:ud    r125.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2815

// Line 399:  } else if (is_v) {
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$16.src}            //  ALU pipe: int; $2843

// Line 396:  &k_out[token_id * num_k_heads * k_dim + k_heads_id * k_dim +
        shl (16|M16)             r7.0<1>:q     r1.0<2;1,0>:d     1:w               {@2,$16.dst}      //  ALU pipe: int; $2815
        mov (16|M0)              r1.0<4>:uw    r3.0<1;1,0>:uw                   {F@1}                //  ALU pipe: int; $2818
        mov (16|M0)              r16.0<1>:q    r1.0<4;1,0>:uw                   {I@1}                //  ALU pipe: int; $2818
        mov (16|M16)             r1.0<4>:uw    r3.16<1;1,0>:uw                                       //  ALU pipe: int; $2818
        add (16|M0)              r12.0<1>:q    r9.0<1;1,0>:q     r4.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2816
        mov (16|M16)             r9.0<1>:q     r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2818
        add (16|M16)             r14.0<1>:q    r7.0<1;1,0>:q     r4.1<0;1,0>:q    {Compacted}        //  ALU pipe: int; $2816
        shl (16|M0)              r7.0<1>:q     r16.0<1;1,0>:q    48:w               {Compacted}      //  ALU pipe: int; $2819
        shl (16|M16)             r1.0<1>:q     r9.0<1;1,0>:q     48:w               {Compacted,I@3}  //  ALU pipe: int; $2819
        mov (16|M0)              r16.0<1>:d    r7.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2820
        mov (16|M16)             r17.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2821
        mov (16|M16)             r23.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2823
        mov (16|M0)              r1.0<4>:uw    r132.0<1;1,0>:uw                                      //  ALU pipe: int; $2824
        mov (16|M0)              r22.0<1>:d    r7.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2822
        mov (16|M0)              r18.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2824
        mov (16|M16)             r1.0<4>:uw    r132.16<1;1,0>:uw                                     //  ALU pipe: int; $2824
        shl (16|M0)              r7.0<1>:q     r18.0<1;1,0>:q    32:w               {Compacted,I@2}  //  ALU pipe: int; $2825
        mov (16|M16)             r9.0<1>:q     r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2824
        mov (16|M0)              r20.0<1>:d    r7.1<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2828
        shl (16|M16)             r1.0<1>:q     r9.0<1;1,0>:q     32:w               {Compacted,I@2}  //  ALU pipe: int; $2825
        mov (16|M0)              r10.0<1>:d    r7.0<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2826
        mov (16|M16)             r11.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2827
        mov (16|M16)             r21.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2829
        mov (16|M0)              r1.0<4>:uw    r126.0<1;1,0>:uw                                      //  ALU pipe: int; $2831
        or (32|M0)               r24.0<1>:d    r16.0<1;1,0>:d    r10.0<1;1,0>:d   {Compacted,I@3}    //  ALU pipe: int; $2830
        mov (16|M0)              r16.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2831
        mov (16|M16)             r1.0<4>:uw    r126.16<1;1,0>:uw                                     //  ALU pipe: int; $2831
        shl (16|M0)              r7.0<1>:q     r16.0<1;1,0>:q    16:w               {Compacted,I@2}  //  ALU pipe: int; $2832
        mov (16|M16)             r9.0<1>:q     r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2831
        mov (16|M0)              r18.0<1>:d    r7.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2833
        shl (16|M16)             r1.0<1>:q     r9.0<1;1,0>:q     16:w               {Compacted,I@2}  //  ALU pipe: int; $2832
        mov (16|M0)              r16.0<1>:d    r7.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2835
        mov (16|M16)             r19.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2834
        mov (16|M16)             r17.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2836
        mov (32|M0)              r2.0<1>:d     r127.0<1;1,0>:uw                                      //  ALU pipe: int; $2838
        bfn.(s0|s1|s2) (32|M0)   r10.0<1>:ud   r22.0<1;0>:ud     r20.0<1;0>:ud     r16.0<1>:ud      {I@2} //  ALU pipe: int; $2837 R{} IR{}{E:3,E:2,E:0,},  R{} IR{}{O:11,O:10,O:8,},  {BC=2}
        bfn.(s0|s1|s2) (32|M0)   r8.0<1>:ud    r24.0<1;0>:ud     r18.0<1;0>:ud     r2.0<1>:ud       {I@2} //  ALU pipe: int; $2839 R{} IR{}{E:4,E:1,E:1,},  R{} IR{}{O:12,O:9,O:1,},  {BC=2}

// Line 101:  *reinterpret_cast<sycl::vec<T, elems_per_item>*>(ptr) = out;
        store.ugm.d32x2.a64 (32|M0)  [r12:4]    r8:4               {I@1,$17} // ex_desc:0x0; desc:0x8001584 // $2841

// Line 399:  } else if (is_v) {
        goto (32|M0)                         _0_180            _0_105                                // $2843
// B141: [FCALL],  [inDivergent],  Preds:{B128},  Succs:{B142}
_0_180:
        join (32|M0)                         _0_105                                                  // 
L44648:

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
(W)     mul (1|M0)               acc0.0<1>:d   r253.6<0;1,0>:d   r6.24<0;1,0>:uw                     //  ALU pipe: int; $2846

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2861
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2861

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
(W)     macl (1|M0)              r6.0<1>:d     r253.6<0;1,0>:d   r6.12<0;1,0>:d                      //  ALU pipe: int; $2847

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2860

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
        add (32|M0)              r2.0<1>:d     r6.0<0;1,0>:d     r140.0<1;1,0>:d  {Compacted,I@2}    //  ALU pipe: int; $2847

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:1  {$18} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $2861

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$18.src}            //  ALU pipe: int; $2861

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
(W)     mul (16|M0)              acc0.0<1>:d   r2.0<1;1,0>:d     r6.26<0;1,0>:uw  {I@2}              //  ALU pipe: int; $2848
        sync.allrd                           ($7,$9,$10,$17,$26)                                     // $2848
        macl (16|M0)             r8.0<1>:d     r2.0<1;1,0>:d     r6.13<0;1,0>:d   {$20.src}          //  ALU pipe: int; $2848
(W)     mul (16|M16)             acc0.0<1>:d   r3.0<1;1,0>:d     r6.26<0;1,0>:uw                     //  ALU pipe: int; $2848
        mov (16|M0)              r2.0<1>:ud    r128.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2852
        macl (16|M16)            r9.0<1>:d     r3.0<1;1,0>:d     r6.13<0;1,0>:d                      //  ALU pipe: int; $2849
        mov (16|M16)             r3.0<1>:ud    r130.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2852
        mov (16|M16)             r5.0<2>:ud    r130.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2851
        add (32|M0)              r124.0<1>:d   r8.0<1;1,0>:d     r146.0<1;1,0>:d  {Compacted,I@3}    //  ALU pipe: int; $2849
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@3}    //  ALU pipe: int; $2853
        mov (16|M0)              r7.0<2>:ud    r128.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2851
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2854
        mov (16|M0)              r7.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $2856
        mov (16|M16)             r5.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2856

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (16|M0)              r26.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2859
        mov (16|M16)             r28.0<1>:uq   r5.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $2859
        sync.allrd                           null                             {A@1}                  // $2861
        sync.allwr                           null                                                    // $2861
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2861
// B142: [FCALL],  [inDivergent],  Preds:{B141},  Succs:{B143}
_L_k0_60_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2861
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2861
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2861

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r152.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2866
        mov (16|M16)             r3.0<1>:ud    r150.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2866
        mov (16|M0)              r7.0<2>:ud    r152.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2865

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r4:1       ss[a0.2][r254:1-0x10000]  {I@4,$22} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $2861

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$22.dst}    // $2867
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2867
        mov (16|M16)             r5.0<2>:ud    r150.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2865
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2868

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2874

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r7.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2870
        mov (16|M16)             r5.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2870

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (32|M0)              r127.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2862
        mov (16|M16)             r28.0<1>:uq   r5.0<1;1,0>:uq                   {Compacted,I@1}      //  ALU pipe: int; $2873
        mov (16|M0)              r26.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted,F@1}      //  ALU pipe: int; $2873

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:1  {$22} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $2875

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$22.src}            //  ALU pipe: int; $2875
        sync.allrd                           null                             {A@1}                  // $2875
        sync.allwr                           null                                                    // $2875
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2875
// B143: [FCALL],  [inDivergent],  Preds:{B142},  Succs:{B144}
_L_k0_61_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2875
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2875
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2875

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r156.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2880
        mov (16|M16)             r3.0<1>:ud    r154.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2880
        mov (16|M0)              r7.0<2>:ud    r156.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2879

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r4:1       ss[a0.2][r254:1-0x10000]  {I@4,$24} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $2875

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$24.dst}    // $2881
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2881
        mov (16|M16)             r5.0<2>:ud    r154.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2879
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2882

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2888

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r7.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2884
        mov (16|M16)             r5.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2884

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        mov (32|M0)              r126.0<1>:hf  r26.0<1;1,0>:hf                                       //  ALU pipe: float; $2876
        mov (16|M16)             r28.0<1>:uq   r5.0<1;1,0>:uq                   {Compacted,I@1}      //  ALU pipe: int; $2887
        mov (16|M0)              r26.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted,F@1}      //  ALU pipe: int; $2887

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:1  {$24} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $2889

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$24.src}            //  ALU pipe: int; $2889
        sync.allrd                           null                             {A@1}                  // $2889
        sync.allwr                           null                                                    // $2889
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2889
// B144: [FCALL],  [inDivergent],  Preds:{B143},  Succs:{B145}
_L_k0_62_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2889
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2889
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2889

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r2.0<1>:ud    r160.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2894
        mov (16|M16)             r3.0<1>:ud    r158.1<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2894
        mov (16|M0)              r7.0<2>:ud    r160.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2893

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r4:1       ss[a0.2][r254:1-0x10000]  {I@4,$25} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $2889

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        sync.nop                             null                             {Compacted,$25.dst}    // $2895
        and (32|M0)              r2.0<1>:ud    r2.0<1;1,0>:ud    0x1FFFFFFF:ud              {I@2}    //  ALU pipe: int; $2895
        mov (16|M16)             r5.0<2>:ud    r158.0<2;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2893
        or (32|M0)               r2.0<1>:ud    r2.0<1;1,0>:ud    0x20000000:ud              {I@2}    //  ALU pipe: int; $2896

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               r255.0<2>:ud  r162.1<0;1,0>:uq                                      //  ALU pipe: int; $2902

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp
        mov (16|M0)              r7.1<2>:ud    r2.0<1;1,0>:ud                   {Compacted,I@2}      //  ALU pipe: int; $2898
        mov (16|M16)             r5.1<2>:ud    r3.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $2898

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp
        sync.allrd                           ($1,$4,$15,$19,$23,$27,$30)                             // $2890
        mov (32|M0)              r128.0<1>:hf  r26.0<1;1,0>:hf                  {$11.src}            //  ALU pipe: float; $2890
        mov (16|M16)             r28.0<1>:uq   r5.0<1;1,0>:uq                   {Compacted,I@1}      //  ALU pipe: int; $2901
        mov (16|M0)              r26.0<1>:uq   r7.0<1;1,0>:uq                   {Compacted,F@1}      //  ALU pipe: int; $2901

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     store.ugm.d32x16t.a32 (1|M0)  ss[a0.2][r254:1-0x10000] r4:1  {$25} // ex_desc:a0.2; desc:0x4200D504 //  spill to FP[0*64] of ?; ; $2903

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$25.src}            //  ALU pipe: int; $2903
        sync.allrd                           null                             {A@1}                  // $2903
        sync.allwr                           null                                                    // $2903
        calla (32|M0)            r255.0        r255.0                           {A@1}                // $2903
// B145: [inDivergent],  Preds:{B144},  Succs:{B146}
_L_k0_63_:
(W)     mov (1|M0)               r254.6<1>:ud  a0.2<0;1,0>:ud                                        //  ALU pipe: int; $2903
(W)     shr (1|M0)               a0.2<1>:ud    r254.7<0;1,0>:ud  0x4:ud                              //  ALU pipe: int; $2903
(W)     add (1|M0)               r254.0<1>:ud  r255.3<0;1,0>:ud  0x10000:ud                          //  ALU pipe: int; $2903

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
        mov (16|M0)              r1.0<2>:ud    r124.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2909

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/ext/oneapi/bfloat16.hpp

// Line 253:  return __devicelib_ConvertFToBF16INTEL(a);
        mov (32|M0)              r3.0<1>:hf    r26.0<1;1,0>:hf                  {I@7}                //  ALU pipe: float; $2904

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     load.ugm.d32x16t.a32 (1|M0)  r4:1       ss[a0.2][r254:1-0x10000]  {I@2,$26} // ex_desc:a0.2; desc:0x4210D500 //  fill from FP[0*64] of ?; ; $2903

// File: /root/project/vllm-xpu-kernels/csrc/xpu/gdn_attn/causal_conv1d.hpp

// Line 391:  &q_out[token_id * num_k_heads * q_dim + k_heads_id * q_dim +
        sync.nop                             null                             {Compacted,$26.dst}    // $2909
        shl (16|M0)              r12.0<1>:q    r1.0<2;1,0>:d     1:w               {I@1}             //  ALU pipe: int; $2909
        mov (16|M16)             r1.0<2>:ud    r125.0<1;1,0>:ud                 {Compacted}          //  ALU pipe: int; $2909
(W)     mov (1|M0)               a0.2<1>:ud    r254.6<0;1,0>:ud                 {$26.src}            //  ALU pipe: int; 
        shl (16|M16)             r5.0<1>:q     r1.0<2;1,0>:d     1:w               {I@2}             //  ALU pipe: int; $2909
        mov (16|M0)              r1.0<4>:uw    r3.0<1;1,0>:uw                   {F@1}                //  ALU pipe: int; $2912
        add (16|M0)              r8.0<1>:q     r12.0<1;1,0>:q    r4.0<0;1,0>:q    {Compacted,$26.dst} //  ALU pipe: int; $2910
        mov (16|M0)              r12.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2912
        mov (16|M16)             r1.0<4>:uw    r3.16<1;1,0>:uw                                       //  ALU pipe: int; $2912
        sync.nop                             null                             {Compacted,$8.src}     // $2910
        add (16|M16)             r10.0<1>:q    r5.0<1;1,0>:q     r4.0<0;1,0>:q    {Compacted,$21.src} //  ALU pipe: int; $2910
        shl (16|M0)              r3.0<1>:q     r12.0<1;1,0>:q    48:w               {Compacted,I@3}  //  ALU pipe: int; $2913
        mov (16|M16)             r5.0<1>:q     r1.0<4;1,0>:uw                   {I@3}                //  ALU pipe: int; $2912
        mov (16|M0)              r12.0<1>:d    r3.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2914
        shl (16|M16)             r1.0<1>:q     r5.0<1;1,0>:q     48:w               {Compacted,I@2}  //  ALU pipe: int; $2913
        mov (16|M0)              r18.0<1>:d    r3.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2916
        mov (16|M16)             r13.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2915
        mov (16|M16)             r19.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2917
        mov (16|M0)              r1.0<4>:uw    r128.0<1;1,0>:uw                                      //  ALU pipe: int; $2918
        mov (16|M0)              r14.0<1>:q    r1.0<4;1,0>:uw                   {I@1}                //  ALU pipe: int; $2918
        mov (16|M16)             r1.0<4>:uw    r128.16<1;1,0>:uw                                     //  ALU pipe: int; $2918
        shl (16|M0)              r3.0<1>:q     r14.0<1;1,0>:q    32:w               {Compacted,I@2}  //  ALU pipe: int; $2919
        mov (16|M16)             r5.0<1>:q     r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2918
        mov (16|M0)              r16.0<1>:d    r3.1<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2922
        shl (16|M16)             r1.0<1>:q     r5.0<1;1,0>:q     32:w               {Compacted,I@2}  //  ALU pipe: int; $2919
        mov (16|M0)              r6.0<1>:d     r3.0<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2920
        mov (16|M16)             r7.0<1>:d     r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2921
        mov (16|M16)             r17.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2923
        mov (16|M0)              r1.0<4>:uw    r126.0<1;1,0>:uw                                      //  ALU pipe: int; $2925
        or (32|M0)               r20.0<1>:d    r12.0<1;1,0>:d    r6.0<1;1,0>:d    {Compacted,I@3}    //  ALU pipe: int; $2924
        mov (16|M0)              r12.0<1>:q    r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2925
        mov (16|M16)             r1.0<4>:uw    r126.16<1;1,0>:uw                                     //  ALU pipe: int; $2925
        shl (16|M0)              r3.0<1>:q     r12.0<1;1,0>:q    16:w               {Compacted,I@2}  //  ALU pipe: int; $2926
        mov (16|M16)             r5.0<1>:q     r1.0<4;1,0>:uw                   {I@2}                //  ALU pipe: int; $2925
        mov (16|M0)              r14.0<1>:d    r3.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2927
        shl (16|M16)             r1.0<1>:q     r5.0<1;1,0>:q     16:w               {Compacted,I@2}  //  ALU pipe: int; $2926
        mov (16|M0)              r12.0<1>:d    r3.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2929
        mov (16|M16)             r15.0<1>:d    r1.0<2;1,0>:d                    {Compacted,I@2}      //  ALU pipe: int; $2928
        mov (16|M16)             r13.0<1>:d    r1.1<2;1,0>:d                    {Compacted}          //  ALU pipe: int; $2930
        mov (32|M0)              r2.0<1>:d     r127.0<1;1,0>:uw                                      //  ALU pipe: int; $2932
        bfn.(s0|s1|s2) (32|M0)   r6.0<1>:ud    r18.0<1;0>:ud     r16.0<1;0>:ud     r12.0<1>:ud      {I@2} //  ALU pipe: int; $2931 R{} IR{}{E:1,E:0,E:6,},  R{} IR{}{O:9,O:8,O:6,},  {BC=2}
        bfn.(s0|s1|s2) (32|M0)   r4.0<1>:ud    r20.0<1;0>:ud     r14.0<1;0>:ud     r2.0<1>:ud       {I@2} //  ALU pipe: int; $2933 R{} IR{}{E:2,E:7,E:1,},  R{} IR{}{O:10,O:7,O:1,},  {BC=2}

// Line 101:  *reinterpret_cast<sycl::vec<T, elems_per_item>*>(ptr) = out;
        store.ugm.d32x2.a64 (32|M0)  [r8:4]     r4:4               {I@1,$28} // ex_desc:0x0; desc:0x8001584 // $2935
// B146: Preds:{B145, B140, B135, B130, B032, B028, B002},  Succs:{}
_0_105:
        join (32|M0)                         L46456                                                  // 
L46456:

// File: /opt/intel/oneapi/compiler/2025.3/include/sycl/detail/kernel_launch_helper.hpp

// Line 119:  }
(W)     mov (16|M0)              r240.0<1>:f   r253.0<1;1,0>:f                  {Compacted}          //  ALU pipe: float; $2942
(W)     send.gtwy (1|M0)         null     r240  null:0  0x0            0x02000010           {EOT,F@1,$29} // wr:1+0, rd:0; end of thread // $2942
L46480:
(W)     mov (16|M0)              null<1>:ud    0x97829AB3:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x9FC88189:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x13:ud                                               // 


//.BankConflicts: 81
//.ByteRMWs: 0
//


//.numALUInst: 3055
//.accSubDef: 54
//.accSubUse: 54
//.accSubCandidateDef: 54
//.accSubCandidateUse: 54
//
//
//.singlePipeAtOneDistNum: 330
//.allAtOneDistNum: 96
//.syncInstCount: 90
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 91
//.AfterReadTokenDepCount: 266
