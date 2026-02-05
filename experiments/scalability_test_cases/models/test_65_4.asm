
// Sample SLEEC rules 
asm test_65_4

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary_4

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {CAPABILITY1, CAPABILITY2, CAPABILITY3, CAPABILITY4, CAPABILITY5, CAPABILITY6, CAPABILITY7, CAPABILITY8, CAPABILITY9, CAPABILITY10, CAPABILITY11, CAPABILITY12, CAPABILITY13, CAPABILITY14, CAPABILITY15, CAPABILITY16, CAPABILITY17, CAPABILITY18, CAPABILITY19, CAPABILITY20, CAPABILITY21, CAPABILITY22, CAPABILITY23, CAPABILITY24, CAPABILITY25, CAPABILITY26, CAPABILITY27, CAPABILITY28, CAPABILITY29, CAPABILITY30, CAPABILITY31, CAPABILITY32, CAPABILITY33, CAPABILITY34, CAPABILITY35, CAPABILITY36, CAPABILITY37, CAPABILITY38, CAPABILITY39, CAPABILITY40, CAPABILITY41, CAPABILITY42, CAPABILITY43, CAPABILITY44, CAPABILITY45, CAPABILITY46, CAPABILITY47, CAPABILITY48, CAPABILITY49, CAPABILITY50, CAPABILITY51, CAPABILITY52, CAPABILITY53, CAPABILITY54, CAPABILITY55, CAPABILITY56, CAPABILITY57, CAPABILITY58, CAPABILITY59, CAPABILITY60, CAPABILITY61, CAPABILITY62, CAPABILITY63, CAPABILITY64, CAPABILITY65, CAPABILITY66, CAPABILITY67, CAPABILITY68, CAPABILITY69, CAPABILITY70, CAPABILITY71, CAPABILITY72, CAPABILITY73, CAPABILITY74, CAPABILITY75, CAPABILITY76, CAPABILITY77, CAPABILITY78, CAPABILITY79, CAPABILITY80, CAPABILITY81, CAPABILITY82, CAPABILITY83, CAPABILITY84, CAPABILITY85, CAPABILITY86, CAPABILITY87, CAPABILITY88, CAPABILITY89, CAPABILITY90, CAPABILITY91, CAPABILITY92, CAPABILITY93, CAPABILITY94, CAPABILITY95, CAPABILITY96, CAPABILITY97, CAPABILITY98, CAPABILITY99, CAPABILITY100, CAPABILITY101, CAPABILITY102, CAPABILITY103, CAPABILITY104, CAPABILITY105, CAPABILITY106, CAPABILITY107, CAPABILITY108, CAPABILITY109, CAPABILITY110, CAPABILITY111, CAPABILITY112, CAPABILITY113, CAPABILITY114, CAPABILITY115, CAPABILITY116, CAPABILITY117, CAPABILITY118, CAPABILITY119, CAPABILITY120, CAPABILITY121, CAPABILITY122, CAPABILITY123, CAPABILITY124, CAPABILITY125, CAPABILITY126, CAPABILITY127, CAPABILITY128, CAPABILITY129, CAPABILITY130, CAPABILITY131, CAPABILITY132, CAPABILITY133, CAPABILITY134, CAPABILITY135, CAPABILITY136, CAPABILITY137, CAPABILITY138, CAPABILITY139, CAPABILITY140, CAPABILITY141, CAPABILITY142, CAPABILITY143, CAPABILITY144, CAPABILITY145, CAPABILITY146, CAPABILITY147, CAPABILITY148, CAPABILITY149, CAPABILITY150, CAPABILITY151, CAPABILITY152, CAPABILITY153, CAPABILITY154, CAPABILITY155, CAPABILITY156, CAPABILITY157, CAPABILITY158, CAPABILITY159, CAPABILITY160, CAPABILITY161, CAPABILITY162, CAPABILITY163, CAPABILITY164, CAPABILITY165, CAPABILITY166, CAPABILITY167, CAPABILITY168, CAPABILITY169, CAPABILITY170, CAPABILITY171, CAPABILITY172, CAPABILITY173, CAPABILITY174, CAPABILITY175, CAPABILITY176, CAPABILITY177, CAPABILITY178, CAPABILITY179, CAPABILITY180, CAPABILITY181, CAPABILITY182, CAPABILITY183, CAPABILITY184, CAPABILITY185, CAPABILITY186, CAPABILITY187, CAPABILITY188, CAPABILITY189, CAPABILITY190, CAPABILITY191, CAPABILITY192, CAPABILITY193, CAPABILITY194, CAPABILITY195, CAPABILITY196, CAPABILITY197, CAPABILITY198, CAPABILITY199, CAPABILITY200, CAPABILITY201, CAPABILITY202, CAPABILITY203, CAPABILITY204, CAPABILITY205, CAPABILITY206, CAPABILITY207, CAPABILITY208, CAPABILITY209, CAPABILITY210, CAPABILITY211, CAPABILITY212, CAPABILITY213, CAPABILITY214, CAPABILITY215, CAPABILITY216, CAPABILITY217, CAPABILITY218, CAPABILITY219, CAPABILITY220, CAPABILITY221, CAPABILITY222, CAPABILITY223, CAPABILITY224, CAPABILITY225, CAPABILITY226, CAPABILITY227, CAPABILITY228, CAPABILITY229, CAPABILITY230, CAPABILITY231, CAPABILITY232, CAPABILITY233, CAPABILITY234, CAPABILITY235, CAPABILITY236, CAPABILITY237, CAPABILITY238, CAPABILITY239, CAPABILITY240, CAPABILITY241, CAPABILITY242, CAPABILITY243, CAPABILITY244, CAPABILITY245, CAPABILITY246, CAPABILITY247, CAPABILITY248, CAPABILITY249, CAPABILITY250, CAPABILITY251, CAPABILITY252, CAPABILITY253, CAPABILITY254, CAPABILITY255, CAPABILITY256, CAPABILITY257, CAPABILITY258, CAPABILITY259, CAPABILITY260}

	//functions
	//Events and sensed variables
	monitored condition1: Boolean
	monitored condition2: Boolean
	monitored condition3: Boolean
	monitored condition4: Boolean
	monitored condition5: Boolean
	monitored condition6: Boolean
	monitored condition7: Boolean
	monitored condition8: Boolean
	monitored condition9: Boolean
	monitored condition10: Boolean
	monitored condition11: Boolean
	monitored condition12: Boolean
	monitored condition13: Boolean
	monitored condition14: Boolean
	monitored condition15: Boolean
	monitored condition16: Boolean
	monitored condition17: Boolean
	monitored condition18: Boolean
	monitored condition19: Boolean
	monitored condition20: Boolean
	monitored condition21: Boolean
	monitored condition22: Boolean
	monitored condition23: Boolean
	monitored condition24: Boolean
	monitored condition25: Boolean
	monitored condition26: Boolean
	monitored condition27: Boolean
	monitored condition28: Boolean
	monitored condition29: Boolean
	monitored condition30: Boolean
	monitored condition31: Boolean
	monitored condition32: Boolean
	monitored condition33: Boolean
	monitored condition34: Boolean
	monitored condition35: Boolean
	monitored condition36: Boolean
	monitored condition37: Boolean
	monitored condition38: Boolean
	monitored condition39: Boolean
	monitored condition40: Boolean
	monitored condition41: Boolean
	monitored condition42: Boolean
	monitored condition43: Boolean
	monitored condition44: Boolean
	monitored condition45: Boolean
	monitored condition46: Boolean
	monitored condition47: Boolean
	monitored condition48: Boolean
	monitored condition49: Boolean
	monitored condition50: Boolean
	monitored condition51: Boolean
	monitored condition52: Boolean
	monitored condition53: Boolean
	monitored condition54: Boolean
	monitored condition55: Boolean
	monitored condition56: Boolean
	monitored condition57: Boolean
	monitored condition58: Boolean
	monitored condition59: Boolean
	monitored condition60: Boolean
	monitored condition61: Boolean
	monitored condition62: Boolean
	monitored condition63: Boolean
	monitored condition64: Boolean
	monitored condition65: Boolean
	monitored condition66: Boolean
	monitored condition67: Boolean
	monitored condition68: Boolean
	monitored condition69: Boolean
	monitored condition70: Boolean
	monitored condition71: Boolean
	monitored condition72: Boolean
	monitored condition73: Boolean
	monitored condition74: Boolean
	monitored condition75: Boolean
	monitored condition76: Boolean
	monitored condition77: Boolean
	monitored condition78: Boolean
	monitored condition79: Boolean
	monitored condition80: Boolean
	monitored condition81: Boolean
	monitored condition82: Boolean
	monitored condition83: Boolean
	monitored condition84: Boolean
	monitored condition85: Boolean
	monitored condition86: Boolean
	monitored condition87: Boolean
	monitored condition88: Boolean
	monitored condition89: Boolean
	monitored condition90: Boolean
	monitored condition91: Boolean
	monitored condition92: Boolean
	monitored condition93: Boolean
	monitored condition94: Boolean
	monitored condition95: Boolean
	monitored condition96: Boolean
	monitored condition97: Boolean
	monitored condition98: Boolean
	monitored condition99: Boolean
	monitored condition100: Boolean
	monitored condition101: Boolean
	monitored condition102: Boolean
	monitored condition103: Boolean
	monitored condition104: Boolean
	monitored condition105: Boolean
	monitored condition106: Boolean
	monitored condition107: Boolean
	monitored condition108: Boolean
	monitored condition109: Boolean
	monitored condition110: Boolean
	monitored condition111: Boolean
	monitored condition112: Boolean
	monitored condition113: Boolean
	monitored condition114: Boolean
	monitored condition115: Boolean
	monitored condition116: Boolean
	monitored condition117: Boolean
	monitored condition118: Boolean
	monitored condition119: Boolean
	monitored condition120: Boolean
	monitored condition121: Boolean
	monitored condition122: Boolean
	monitored condition123: Boolean
	monitored condition124: Boolean
	monitored condition125: Boolean
	monitored condition126: Boolean
	monitored condition127: Boolean
	monitored condition128: Boolean
	monitored condition129: Boolean
	monitored condition130: Boolean
	monitored condition131: Boolean
	monitored condition132: Boolean
	monitored condition133: Boolean
	monitored condition134: Boolean
	monitored condition135: Boolean
	monitored condition136: Boolean
	monitored condition137: Boolean
	monitored condition138: Boolean
	monitored condition139: Boolean
	monitored condition140: Boolean
	monitored condition141: Boolean
	monitored condition142: Boolean
	monitored condition143: Boolean
	monitored condition144: Boolean
	monitored condition145: Boolean
	monitored condition146: Boolean
	monitored condition147: Boolean
	monitored condition148: Boolean
	monitored condition149: Boolean
	monitored condition150: Boolean
	monitored condition151: Boolean
	monitored condition152: Boolean
	monitored condition153: Boolean
	monitored condition154: Boolean
	monitored condition155: Boolean
	monitored condition156: Boolean
	monitored condition157: Boolean
	monitored condition158: Boolean
	monitored condition159: Boolean
	monitored condition160: Boolean
	monitored condition161: Boolean
	monitored condition162: Boolean
	monitored condition163: Boolean
	monitored condition164: Boolean
	monitored condition165: Boolean
	monitored condition166: Boolean
	monitored condition167: Boolean
	monitored condition168: Boolean
	monitored condition169: Boolean
	monitored condition170: Boolean
	monitored condition171: Boolean
	monitored condition172: Boolean
	monitored condition173: Boolean
	monitored condition174: Boolean
	monitored condition175: Boolean
	monitored condition176: Boolean
	monitored condition177: Boolean
	monitored condition178: Boolean
	monitored condition179: Boolean
	monitored condition180: Boolean
	monitored condition181: Boolean
	monitored condition182: Boolean
	monitored condition183: Boolean
	monitored condition184: Boolean
	monitored condition185: Boolean
	monitored condition186: Boolean
	monitored condition187: Boolean
	monitored condition188: Boolean
	monitored condition189: Boolean
	monitored condition190: Boolean
	monitored condition191: Boolean
	monitored condition192: Boolean
	monitored condition193: Boolean
	monitored condition194: Boolean
	monitored condition195: Boolean
	monitored condition196: Boolean
	monitored condition197: Boolean
	monitored condition198: Boolean
	monitored condition199: Boolean
	monitored condition200: Boolean
	monitored condition201: Boolean
	monitored condition202: Boolean
	monitored condition203: Boolean
	monitored condition204: Boolean
	monitored condition205: Boolean
	monitored condition206: Boolean
	monitored condition207: Boolean
	monitored condition208: Boolean
	monitored condition209: Boolean
	monitored condition210: Boolean
	monitored condition211: Boolean
	monitored condition212: Boolean
	monitored condition213: Boolean
	monitored condition214: Boolean
	monitored condition215: Boolean
	monitored condition216: Boolean
	monitored condition217: Boolean
	monitored condition218: Boolean
	monitored condition219: Boolean
	monitored condition220: Boolean
	monitored condition221: Boolean
	monitored condition222: Boolean
	monitored condition223: Boolean
	monitored condition224: Boolean
	monitored condition225: Boolean
	monitored condition226: Boolean
	monitored condition227: Boolean
	monitored condition228: Boolean
	monitored condition229: Boolean
	monitored condition230: Boolean
	monitored condition231: Boolean
	monitored condition232: Boolean
	monitored condition233: Boolean
	monitored condition234: Boolean
	monitored condition235: Boolean
	monitored condition236: Boolean
	monitored condition237: Boolean
	monitored condition238: Boolean
	monitored condition239: Boolean
	monitored condition240: Boolean
	monitored condition241: Boolean
	monitored condition242: Boolean
	monitored condition243: Boolean
	monitored condition244: Boolean
	monitored condition245: Boolean
	monitored condition246: Boolean
	monitored condition247: Boolean
	monitored condition248: Boolean
	monitored condition249: Boolean
	monitored condition250: Boolean
	monitored condition251: Boolean
	monitored condition252: Boolean
	monitored condition253: Boolean
	monitored condition254: Boolean
	monitored condition255: Boolean
	monitored condition256: Boolean
	monitored condition257: Boolean
	monitored condition258: Boolean
	monitored condition259: Boolean
	monitored condition260: Boolean

	//Capabilities
	static capability1: Capability
	static capability2: Capability
	static capability3: Capability
	static capability4: Capability
	static capability5: Capability
	static capability6: Capability
	static capability7: Capability
	static capability8: Capability
	static capability9: Capability
	static capability10: Capability
	static capability11: Capability
	static capability12: Capability
	static capability13: Capability
	static capability14: Capability
	static capability15: Capability
	static capability16: Capability
	static capability17: Capability
	static capability18: Capability
	static capability19: Capability
	static capability20: Capability
	static capability21: Capability
	static capability22: Capability
	static capability23: Capability
	static capability24: Capability
	static capability25: Capability
	static capability26: Capability
	static capability27: Capability
	static capability28: Capability
	static capability29: Capability
	static capability30: Capability
	static capability31: Capability
	static capability32: Capability
	static capability33: Capability
	static capability34: Capability
	static capability35: Capability
	static capability36: Capability
	static capability37: Capability
	static capability38: Capability
	static capability39: Capability
	static capability40: Capability
	static capability41: Capability
	static capability42: Capability
	static capability43: Capability
	static capability44: Capability
	static capability45: Capability
	static capability46: Capability
	static capability47: Capability
	static capability48: Capability
	static capability49: Capability
	static capability50: Capability
	static capability51: Capability
	static capability52: Capability
	static capability53: Capability
	static capability54: Capability
	static capability55: Capability
	static capability56: Capability
	static capability57: Capability
	static capability58: Capability
	static capability59: Capability
	static capability60: Capability
	static capability61: Capability
	static capability62: Capability
	static capability63: Capability
	static capability64: Capability
	static capability65: Capability
	static capability66: Capability
	static capability67: Capability
	static capability68: Capability
	static capability69: Capability
	static capability70: Capability
	static capability71: Capability
	static capability72: Capability
	static capability73: Capability
	static capability74: Capability
	static capability75: Capability
	static capability76: Capability
	static capability77: Capability
	static capability78: Capability
	static capability79: Capability
	static capability80: Capability
	static capability81: Capability
	static capability82: Capability
	static capability83: Capability
	static capability84: Capability
	static capability85: Capability
	static capability86: Capability
	static capability87: Capability
	static capability88: Capability
	static capability89: Capability
	static capability90: Capability
	static capability91: Capability
	static capability92: Capability
	static capability93: Capability
	static capability94: Capability
	static capability95: Capability
	static capability96: Capability
	static capability97: Capability
	static capability98: Capability
	static capability99: Capability
	static capability100: Capability
	static capability101: Capability
	static capability102: Capability
	static capability103: Capability
	static capability104: Capability
	static capability105: Capability
	static capability106: Capability
	static capability107: Capability
	static capability108: Capability
	static capability109: Capability
	static capability110: Capability
	static capability111: Capability
	static capability112: Capability
	static capability113: Capability
	static capability114: Capability
	static capability115: Capability
	static capability116: Capability
	static capability117: Capability
	static capability118: Capability
	static capability119: Capability
	static capability120: Capability
	static capability121: Capability
	static capability122: Capability
	static capability123: Capability
	static capability124: Capability
	static capability125: Capability
	static capability126: Capability
	static capability127: Capability
	static capability128: Capability
	static capability129: Capability
	static capability130: Capability
	static capability131: Capability
	static capability132: Capability
	static capability133: Capability
	static capability134: Capability
	static capability135: Capability
	static capability136: Capability
	static capability137: Capability
	static capability138: Capability
	static capability139: Capability
	static capability140: Capability
	static capability141: Capability
	static capability142: Capability
	static capability143: Capability
	static capability144: Capability
	static capability145: Capability
	static capability146: Capability
	static capability147: Capability
	static capability148: Capability
	static capability149: Capability
	static capability150: Capability
	static capability151: Capability
	static capability152: Capability
	static capability153: Capability
	static capability154: Capability
	static capability155: Capability
	static capability156: Capability
	static capability157: Capability
	static capability158: Capability
	static capability159: Capability
	static capability160: Capability
	static capability161: Capability
	static capability162: Capability
	static capability163: Capability
	static capability164: Capability
	static capability165: Capability
	static capability166: Capability
	static capability167: Capability
	static capability168: Capability
	static capability169: Capability
	static capability170: Capability
	static capability171: Capability
	static capability172: Capability
	static capability173: Capability
	static capability174: Capability
	static capability175: Capability
	static capability176: Capability
	static capability177: Capability
	static capability178: Capability
	static capability179: Capability
	static capability180: Capability
	static capability181: Capability
	static capability182: Capability
	static capability183: Capability
	static capability184: Capability
	static capability185: Capability
	static capability186: Capability
	static capability187: Capability
	static capability188: Capability
	static capability189: Capability
	static capability190: Capability
	static capability191: Capability
	static capability192: Capability
	static capability193: Capability
	static capability194: Capability
	static capability195: Capability
	static capability196: Capability
	static capability197: Capability
	static capability198: Capability
	static capability199: Capability
	static capability200: Capability
	static capability201: Capability
	static capability202: Capability
	static capability203: Capability
	static capability204: Capability
	static capability205: Capability
	static capability206: Capability
	static capability207: Capability
	static capability208: Capability
	static capability209: Capability
	static capability210: Capability
	static capability211: Capability
	static capability212: Capability
	static capability213: Capability
	static capability214: Capability
	static capability215: Capability
	static capability216: Capability
	static capability217: Capability
	static capability218: Capability
	static capability219: Capability
	static capability220: Capability
	static capability221: Capability
	static capability222: Capability
	static capability223: Capability
	static capability224: Capability
	static capability225: Capability
	static capability226: Capability
	static capability227: Capability
	static capability228: Capability
	static capability229: Capability
	static capability230: Capability
	static capability231: Capability
	static capability232: Capability
	static capability233: Capability
	static capability234: Capability
	static capability235: Capability
	static capability236: Capability
	static capability237: Capability
	static capability238: Capability
	static capability239: Capability
	static capability240: Capability
	static capability241: Capability
	static capability242: Capability
	static capability243: Capability
	static capability244: Capability
	static capability245: Capability
	static capability246: Capability
	static capability247: Capability
	static capability248: Capability
	static capability249: Capability
	static capability250: Capability
	static capability251: Capability
	static capability252: Capability
	static capability253: Capability
	static capability254: Capability
	static capability255: Capability
	static capability256: Capability
	static capability257: Capability
	static capability258: Capability
	static capability259: Capability
	static capability260: Capability

	static id: Capability -> CapabilityID

	/* DOMAIN-GENERAL SIGNATURE */	
	out outObligation: CapabilityID -> Boolean //any due obligation (there could be more than one) is activated through a flag
	out outConstraint: CapabilityID -> Prod(TCType,Integer,TimerUnit,CapabilityID)

definitions:
/* DOMAIN-SPECIFIC DEFINITIONS*/

	function id($c in Capability) = 
		switch $c
		
		case capability1: CAPABILITY1
		case capability2: CAPABILITY2
		case capability3: CAPABILITY3
		case capability4: CAPABILITY4
		case capability5: CAPABILITY5
		case capability6: CAPABILITY6
		case capability7: CAPABILITY7
		case capability8: CAPABILITY8
		case capability9: CAPABILITY9
		case capability10: CAPABILITY10
		case capability11: CAPABILITY11
		case capability12: CAPABILITY12
		case capability13: CAPABILITY13
		case capability14: CAPABILITY14
		case capability15: CAPABILITY15
		case capability16: CAPABILITY16
		case capability17: CAPABILITY17
		case capability18: CAPABILITY18
		case capability19: CAPABILITY19
		case capability20: CAPABILITY20
		case capability21: CAPABILITY21
		case capability22: CAPABILITY22
		case capability23: CAPABILITY23
		case capability24: CAPABILITY24
		case capability25: CAPABILITY25
		case capability26: CAPABILITY26
		case capability27: CAPABILITY27
		case capability28: CAPABILITY28
		case capability29: CAPABILITY29
		case capability30: CAPABILITY30
		case capability31: CAPABILITY31
		case capability32: CAPABILITY32
		case capability33: CAPABILITY33
		case capability34: CAPABILITY34
		case capability35: CAPABILITY35
		case capability36: CAPABILITY36
		case capability37: CAPABILITY37
		case capability38: CAPABILITY38
		case capability39: CAPABILITY39
		case capability40: CAPABILITY40
		case capability41: CAPABILITY41
		case capability42: CAPABILITY42
		case capability43: CAPABILITY43
		case capability44: CAPABILITY44
		case capability45: CAPABILITY45
		case capability46: CAPABILITY46
		case capability47: CAPABILITY47
		case capability48: CAPABILITY48
		case capability49: CAPABILITY49
		case capability50: CAPABILITY50
		case capability51: CAPABILITY51
		case capability52: CAPABILITY52
		case capability53: CAPABILITY53
		case capability54: CAPABILITY54
		case capability55: CAPABILITY55
		case capability56: CAPABILITY56
		case capability57: CAPABILITY57
		case capability58: CAPABILITY58
		case capability59: CAPABILITY59
		case capability60: CAPABILITY60
		case capability61: CAPABILITY61
		case capability62: CAPABILITY62
		case capability63: CAPABILITY63
		case capability64: CAPABILITY64
		case capability65: CAPABILITY65
		case capability66: CAPABILITY66
		case capability67: CAPABILITY67
		case capability68: CAPABILITY68
		case capability69: CAPABILITY69
		case capability70: CAPABILITY70
		case capability71: CAPABILITY71
		case capability72: CAPABILITY72
		case capability73: CAPABILITY73
		case capability74: CAPABILITY74
		case capability75: CAPABILITY75
		case capability76: CAPABILITY76
		case capability77: CAPABILITY77
		case capability78: CAPABILITY78
		case capability79: CAPABILITY79
		case capability80: CAPABILITY80
		case capability81: CAPABILITY81
		case capability82: CAPABILITY82
		case capability83: CAPABILITY83
		case capability84: CAPABILITY84
		case capability85: CAPABILITY85
		case capability86: CAPABILITY86
		case capability87: CAPABILITY87
		case capability88: CAPABILITY88
		case capability89: CAPABILITY89
		case capability90: CAPABILITY90
		case capability91: CAPABILITY91
		case capability92: CAPABILITY92
		case capability93: CAPABILITY93
		case capability94: CAPABILITY94
		case capability95: CAPABILITY95
		case capability96: CAPABILITY96
		case capability97: CAPABILITY97
		case capability98: CAPABILITY98
		case capability99: CAPABILITY99
		case capability100: CAPABILITY100
		case capability101: CAPABILITY101
		case capability102: CAPABILITY102
		case capability103: CAPABILITY103
		case capability104: CAPABILITY104
		case capability105: CAPABILITY105
		case capability106: CAPABILITY106
		case capability107: CAPABILITY107
		case capability108: CAPABILITY108
		case capability109: CAPABILITY109
		case capability110: CAPABILITY110
		case capability111: CAPABILITY111
		case capability112: CAPABILITY112
		case capability113: CAPABILITY113
		case capability114: CAPABILITY114
		case capability115: CAPABILITY115
		case capability116: CAPABILITY116
		case capability117: CAPABILITY117
		case capability118: CAPABILITY118
		case capability119: CAPABILITY119
		case capability120: CAPABILITY120
		case capability121: CAPABILITY121
		case capability122: CAPABILITY122
		case capability123: CAPABILITY123
		case capability124: CAPABILITY124
		case capability125: CAPABILITY125
		case capability126: CAPABILITY126
		case capability127: CAPABILITY127
		case capability128: CAPABILITY128
		case capability129: CAPABILITY129
		case capability130: CAPABILITY130
		case capability131: CAPABILITY131
		case capability132: CAPABILITY132
		case capability133: CAPABILITY133
		case capability134: CAPABILITY134
		case capability135: CAPABILITY135
		case capability136: CAPABILITY136
		case capability137: CAPABILITY137
		case capability138: CAPABILITY138
		case capability139: CAPABILITY139
		case capability140: CAPABILITY140
		case capability141: CAPABILITY141
		case capability142: CAPABILITY142
		case capability143: CAPABILITY143
		case capability144: CAPABILITY144
		case capability145: CAPABILITY145
		case capability146: CAPABILITY146
		case capability147: CAPABILITY147
		case capability148: CAPABILITY148
		case capability149: CAPABILITY149
		case capability150: CAPABILITY150
		case capability151: CAPABILITY151
		case capability152: CAPABILITY152
		case capability153: CAPABILITY153
		case capability154: CAPABILITY154
		case capability155: CAPABILITY155
		case capability156: CAPABILITY156
		case capability157: CAPABILITY157
		case capability158: CAPABILITY158
		case capability159: CAPABILITY159
		case capability160: CAPABILITY160
		case capability161: CAPABILITY161
		case capability162: CAPABILITY162
		case capability163: CAPABILITY163
		case capability164: CAPABILITY164
		case capability165: CAPABILITY165
		case capability166: CAPABILITY166
		case capability167: CAPABILITY167
		case capability168: CAPABILITY168
		case capability169: CAPABILITY169
		case capability170: CAPABILITY170
		case capability171: CAPABILITY171
		case capability172: CAPABILITY172
		case capability173: CAPABILITY173
		case capability174: CAPABILITY174
		case capability175: CAPABILITY175
		case capability176: CAPABILITY176
		case capability177: CAPABILITY177
		case capability178: CAPABILITY178
		case capability179: CAPABILITY179
		case capability180: CAPABILITY180
		case capability181: CAPABILITY181
		case capability182: CAPABILITY182
		case capability183: CAPABILITY183
		case capability184: CAPABILITY184
		case capability185: CAPABILITY185
		case capability186: CAPABILITY186
		case capability187: CAPABILITY187
		case capability188: CAPABILITY188
		case capability189: CAPABILITY189
		case capability190: CAPABILITY190
		case capability191: CAPABILITY191
		case capability192: CAPABILITY192
		case capability193: CAPABILITY193
		case capability194: CAPABILITY194
		case capability195: CAPABILITY195
		case capability196: CAPABILITY196
		case capability197: CAPABILITY197
		case capability198: CAPABILITY198
		case capability199: CAPABILITY199
		case capability200: CAPABILITY200
		case capability201: CAPABILITY201
		case capability202: CAPABILITY202
		case capability203: CAPABILITY203
		case capability204: CAPABILITY204
		case capability205: CAPABILITY205
		case capability206: CAPABILITY206
		case capability207: CAPABILITY207
		case capability208: CAPABILITY208
		case capability209: CAPABILITY209
		case capability210: CAPABILITY210
		case capability211: CAPABILITY211
		case capability212: CAPABILITY212
		case capability213: CAPABILITY213
		case capability214: CAPABILITY214
		case capability215: CAPABILITY215
		case capability216: CAPABILITY216
		case capability217: CAPABILITY217
		case capability218: CAPABILITY218
		case capability219: CAPABILITY219
		case capability220: CAPABILITY220
		case capability221: CAPABILITY221
		case capability222: CAPABILITY222
		case capability223: CAPABILITY223
		case capability224: CAPABILITY224
		case capability225: CAPABILITY225
		case capability226: CAPABILITY226
		case capability227: CAPABILITY227
		case capability228: CAPABILITY228
		case capability229: CAPABILITY229
		case capability230: CAPABILITY230
		case capability231: CAPABILITY231
		case capability232: CAPABILITY232
		case capability233: CAPABILITY233
		case capability234: CAPABILITY234
		case capability235: CAPABILITY235
		case capability236: CAPABILITY236
		case capability237: CAPABILITY237
		case capability238: CAPABILITY238
		case capability239: CAPABILITY239
		case capability240: CAPABILITY240
		case capability241: CAPABILITY241
		case capability242: CAPABILITY242
		case capability243: CAPABILITY243
		case capability244: CAPABILITY244
		case capability245: CAPABILITY245
		case capability246: CAPABILITY246
		case capability247: CAPABILITY247
		case capability248: CAPABILITY248
		case capability249: CAPABILITY249
		case capability250: CAPABILITY250
		case capability251: CAPABILITY251
		case capability252: CAPABILITY252
		case capability253: CAPABILITY253
		case capability254: CAPABILITY254
		case capability255: CAPABILITY255
		case capability256: CAPABILITY256
		case capability257: CAPABILITY257
		case capability258: CAPABILITY258
		case capability259: CAPABILITY259
		case capability260: CAPABILITY260
		endswitch	
 
/* DOMAIN-GENERAL DEFINITIONS */	
 
    //with no time constraint
	rule r_setObligation($c in Capability) = 
	par  
		constraint($c) := none
		//prepare out locations
		outObligation(id($c)) := true //true if doObligation is true 
		outConstraint(id($c)) := undef 
	endpar


	
	//overloading with an alternative obligation in case of constraint unsatisfied
	rule r_setObligation($c in Capability, $type in TCType, $t in Integer, $u in TimerUnit, $alt in Capability) = 
	par 
		r_setTimeConstraint[$c,$type,$t,$u]
		if isDef($alt) then otherwiseC($c) := $alt endif
		//prepare out locations
		outObligation(id($c)) := true 
		outConstraint(id($c)) := ($type,$t,$u,id($alt))
	endpar	

	//default: no obligation to do
	rule r_doNothing = r_setObligation[doNothing]


	/* DOMAIN-SPECIFIC CONTROL RULES*/ 

	rule r_obligation1 = r_setObligation[capability1]
	rule r_obligation2 = r_setObligation[capability2]
	rule r_obligation3 = r_setObligation[capability3]
	rule r_obligation4 = r_setObligation[capability4]
	rule r_obligation5 = r_setObligation[capability5]
	rule r_obligation6 = r_setObligation[capability6]
	rule r_obligation7 = r_setObligation[capability7]
	rule r_obligation8 = r_setObligation[capability8]
	rule r_obligation9 = r_setObligation[capability9]
	rule r_obligation10 = r_setObligation[capability10]
	rule r_obligation11 = r_setObligation[capability11]
	rule r_obligation12 = r_setObligation[capability12]
	rule r_obligation13 = r_setObligation[capability13]
	rule r_obligation14 = r_setObligation[capability14]
	rule r_obligation15 = r_setObligation[capability15]
	rule r_obligation16 = r_setObligation[capability16]
	rule r_obligation17 = r_setObligation[capability17]
	rule r_obligation18 = r_setObligation[capability18]
	rule r_obligation19 = r_setObligation[capability19]
	rule r_obligation20 = r_setObligation[capability20]
	rule r_obligation21 = r_setObligation[capability21]
	rule r_obligation22 = r_setObligation[capability22]
	rule r_obligation23 = r_setObligation[capability23]
	rule r_obligation24 = r_setObligation[capability24]
	rule r_obligation25 = r_setObligation[capability25]
	rule r_obligation26 = r_setObligation[capability26]
	rule r_obligation27 = r_setObligation[capability27]
	rule r_obligation28 = r_setObligation[capability28]
	rule r_obligation29 = r_setObligation[capability29]
	rule r_obligation30 = r_setObligation[capability30]
	rule r_obligation31 = r_setObligation[capability31]
	rule r_obligation32 = r_setObligation[capability32]
	rule r_obligation33 = r_setObligation[capability33]
	rule r_obligation34 = r_setObligation[capability34]
	rule r_obligation35 = r_setObligation[capability35]
	rule r_obligation36 = r_setObligation[capability36]
	rule r_obligation37 = r_setObligation[capability37]
	rule r_obligation38 = r_setObligation[capability38]
	rule r_obligation39 = r_setObligation[capability39]
	rule r_obligation40 = r_setObligation[capability40]
	rule r_obligation41 = r_setObligation[capability41]
	rule r_obligation42 = r_setObligation[capability42]
	rule r_obligation43 = r_setObligation[capability43]
	rule r_obligation44 = r_setObligation[capability44]
	rule r_obligation45 = r_setObligation[capability45]
	rule r_obligation46 = r_setObligation[capability46]
	rule r_obligation47 = r_setObligation[capability47]
	rule r_obligation48 = r_setObligation[capability48]
	rule r_obligation49 = r_setObligation[capability49]
	rule r_obligation50 = r_setObligation[capability50]
	rule r_obligation51 = r_setObligation[capability51]
	rule r_obligation52 = r_setObligation[capability52]
	rule r_obligation53 = r_setObligation[capability53]
	rule r_obligation54 = r_setObligation[capability54]
	rule r_obligation55 = r_setObligation[capability55]
	rule r_obligation56 = r_setObligation[capability56]
	rule r_obligation57 = r_setObligation[capability57]
	rule r_obligation58 = r_setObligation[capability58]
	rule r_obligation59 = r_setObligation[capability59]
	rule r_obligation60 = r_setObligation[capability60]
	rule r_obligation61 = r_setObligation[capability61]
	rule r_obligation62 = r_setObligation[capability62]
	rule r_obligation63 = r_setObligation[capability63]
	rule r_obligation64 = r_setObligation[capability64]
	rule r_obligation65 = r_setObligation[capability65]
	rule r_obligation66 = r_setObligation[capability66]
	rule r_obligation67 = r_setObligation[capability67]
	rule r_obligation68 = r_setObligation[capability68]
	rule r_obligation69 = r_setObligation[capability69]
	rule r_obligation70 = r_setObligation[capability70]
	rule r_obligation71 = r_setObligation[capability71]
	rule r_obligation72 = r_setObligation[capability72]
	rule r_obligation73 = r_setObligation[capability73]
	rule r_obligation74 = r_setObligation[capability74]
	rule r_obligation75 = r_setObligation[capability75]
	rule r_obligation76 = r_setObligation[capability76]
	rule r_obligation77 = r_setObligation[capability77]
	rule r_obligation78 = r_setObligation[capability78]
	rule r_obligation79 = r_setObligation[capability79]
	rule r_obligation80 = r_setObligation[capability80]
	rule r_obligation81 = r_setObligation[capability81]
	rule r_obligation82 = r_setObligation[capability82]
	rule r_obligation83 = r_setObligation[capability83]
	rule r_obligation84 = r_setObligation[capability84]
	rule r_obligation85 = r_setObligation[capability85]
	rule r_obligation86 = r_setObligation[capability86]
	rule r_obligation87 = r_setObligation[capability87]
	rule r_obligation88 = r_setObligation[capability88]
	rule r_obligation89 = r_setObligation[capability89]
	rule r_obligation90 = r_setObligation[capability90]
	rule r_obligation91 = r_setObligation[capability91]
	rule r_obligation92 = r_setObligation[capability92]
	rule r_obligation93 = r_setObligation[capability93]
	rule r_obligation94 = r_setObligation[capability94]
	rule r_obligation95 = r_setObligation[capability95]
	rule r_obligation96 = r_setObligation[capability96]
	rule r_obligation97 = r_setObligation[capability97]
	rule r_obligation98 = r_setObligation[capability98]
	rule r_obligation99 = r_setObligation[capability99]
	rule r_obligation100 = r_setObligation[capability100]
	rule r_obligation101 = r_setObligation[capability101]
	rule r_obligation102 = r_setObligation[capability102]
	rule r_obligation103 = r_setObligation[capability103]
	rule r_obligation104 = r_setObligation[capability104]
	rule r_obligation105 = r_setObligation[capability105]
	rule r_obligation106 = r_setObligation[capability106]
	rule r_obligation107 = r_setObligation[capability107]
	rule r_obligation108 = r_setObligation[capability108]
	rule r_obligation109 = r_setObligation[capability109]
	rule r_obligation110 = r_setObligation[capability110]
	rule r_obligation111 = r_setObligation[capability111]
	rule r_obligation112 = r_setObligation[capability112]
	rule r_obligation113 = r_setObligation[capability113]
	rule r_obligation114 = r_setObligation[capability114]
	rule r_obligation115 = r_setObligation[capability115]
	rule r_obligation116 = r_setObligation[capability116]
	rule r_obligation117 = r_setObligation[capability117]
	rule r_obligation118 = r_setObligation[capability118]
	rule r_obligation119 = r_setObligation[capability119]
	rule r_obligation120 = r_setObligation[capability120]
	rule r_obligation121 = r_setObligation[capability121]
	rule r_obligation122 = r_setObligation[capability122]
	rule r_obligation123 = r_setObligation[capability123]
	rule r_obligation124 = r_setObligation[capability124]
	rule r_obligation125 = r_setObligation[capability125]
	rule r_obligation126 = r_setObligation[capability126]
	rule r_obligation127 = r_setObligation[capability127]
	rule r_obligation128 = r_setObligation[capability128]
	rule r_obligation129 = r_setObligation[capability129]
	rule r_obligation130 = r_setObligation[capability130]
	rule r_obligation131 = r_setObligation[capability131]
	rule r_obligation132 = r_setObligation[capability132]
	rule r_obligation133 = r_setObligation[capability133]
	rule r_obligation134 = r_setObligation[capability134]
	rule r_obligation135 = r_setObligation[capability135]
	rule r_obligation136 = r_setObligation[capability136]
	rule r_obligation137 = r_setObligation[capability137]
	rule r_obligation138 = r_setObligation[capability138]
	rule r_obligation139 = r_setObligation[capability139]
	rule r_obligation140 = r_setObligation[capability140]
	rule r_obligation141 = r_setObligation[capability141]
	rule r_obligation142 = r_setObligation[capability142]
	rule r_obligation143 = r_setObligation[capability143]
	rule r_obligation144 = r_setObligation[capability144]
	rule r_obligation145 = r_setObligation[capability145]
	rule r_obligation146 = r_setObligation[capability146]
	rule r_obligation147 = r_setObligation[capability147]
	rule r_obligation148 = r_setObligation[capability148]
	rule r_obligation149 = r_setObligation[capability149]
	rule r_obligation150 = r_setObligation[capability150]
	rule r_obligation151 = r_setObligation[capability151]
	rule r_obligation152 = r_setObligation[capability152]
	rule r_obligation153 = r_setObligation[capability153]
	rule r_obligation154 = r_setObligation[capability154]
	rule r_obligation155 = r_setObligation[capability155]
	rule r_obligation156 = r_setObligation[capability156]
	rule r_obligation157 = r_setObligation[capability157]
	rule r_obligation158 = r_setObligation[capability158]
	rule r_obligation159 = r_setObligation[capability159]
	rule r_obligation160 = r_setObligation[capability160]
	rule r_obligation161 = r_setObligation[capability161]
	rule r_obligation162 = r_setObligation[capability162]
	rule r_obligation163 = r_setObligation[capability163]
	rule r_obligation164 = r_setObligation[capability164]
	rule r_obligation165 = r_setObligation[capability165]
	rule r_obligation166 = r_setObligation[capability166]
	rule r_obligation167 = r_setObligation[capability167]
	rule r_obligation168 = r_setObligation[capability168]
	rule r_obligation169 = r_setObligation[capability169]
	rule r_obligation170 = r_setObligation[capability170]
	rule r_obligation171 = r_setObligation[capability171]
	rule r_obligation172 = r_setObligation[capability172]
	rule r_obligation173 = r_setObligation[capability173]
	rule r_obligation174 = r_setObligation[capability174]
	rule r_obligation175 = r_setObligation[capability175]
	rule r_obligation176 = r_setObligation[capability176]
	rule r_obligation177 = r_setObligation[capability177]
	rule r_obligation178 = r_setObligation[capability178]
	rule r_obligation179 = r_setObligation[capability179]
	rule r_obligation180 = r_setObligation[capability180]
	rule r_obligation181 = r_setObligation[capability181]
	rule r_obligation182 = r_setObligation[capability182]
	rule r_obligation183 = r_setObligation[capability183]
	rule r_obligation184 = r_setObligation[capability184]
	rule r_obligation185 = r_setObligation[capability185]
	rule r_obligation186 = r_setObligation[capability186]
	rule r_obligation187 = r_setObligation[capability187]
	rule r_obligation188 = r_setObligation[capability188]
	rule r_obligation189 = r_setObligation[capability189]
	rule r_obligation190 = r_setObligation[capability190]
	rule r_obligation191 = r_setObligation[capability191]
	rule r_obligation192 = r_setObligation[capability192]
	rule r_obligation193 = r_setObligation[capability193]
	rule r_obligation194 = r_setObligation[capability194]
	rule r_obligation195 = r_setObligation[capability195]
	rule r_obligation196 = r_setObligation[capability196]
	rule r_obligation197 = r_setObligation[capability197]
	rule r_obligation198 = r_setObligation[capability198]
	rule r_obligation199 = r_setObligation[capability199]
	rule r_obligation200 = r_setObligation[capability200]
	rule r_obligation201 = r_setObligation[capability201]
	rule r_obligation202 = r_setObligation[capability202]
	rule r_obligation203 = r_setObligation[capability203]
	rule r_obligation204 = r_setObligation[capability204]
	rule r_obligation205 = r_setObligation[capability205]
	rule r_obligation206 = r_setObligation[capability206]
	rule r_obligation207 = r_setObligation[capability207]
	rule r_obligation208 = r_setObligation[capability208]
	rule r_obligation209 = r_setObligation[capability209]
	rule r_obligation210 = r_setObligation[capability210]
	rule r_obligation211 = r_setObligation[capability211]
	rule r_obligation212 = r_setObligation[capability212]
	rule r_obligation213 = r_setObligation[capability213]
	rule r_obligation214 = r_setObligation[capability214]
	rule r_obligation215 = r_setObligation[capability215]
	rule r_obligation216 = r_setObligation[capability216]
	rule r_obligation217 = r_setObligation[capability217]
	rule r_obligation218 = r_setObligation[capability218]
	rule r_obligation219 = r_setObligation[capability219]
	rule r_obligation220 = r_setObligation[capability220]
	rule r_obligation221 = r_setObligation[capability221]
	rule r_obligation222 = r_setObligation[capability222]
	rule r_obligation223 = r_setObligation[capability223]
	rule r_obligation224 = r_setObligation[capability224]
	rule r_obligation225 = r_setObligation[capability225]
	rule r_obligation226 = r_setObligation[capability226]
	rule r_obligation227 = r_setObligation[capability227]
	rule r_obligation228 = r_setObligation[capability228]
	rule r_obligation229 = r_setObligation[capability229]
	rule r_obligation230 = r_setObligation[capability230]
	rule r_obligation231 = r_setObligation[capability231]
	rule r_obligation232 = r_setObligation[capability232]
	rule r_obligation233 = r_setObligation[capability233]
	rule r_obligation234 = r_setObligation[capability234]
	rule r_obligation235 = r_setObligation[capability235]
	rule r_obligation236 = r_setObligation[capability236]
	rule r_obligation237 = r_setObligation[capability237]
	rule r_obligation238 = r_setObligation[capability238]
	rule r_obligation239 = r_setObligation[capability239]
	rule r_obligation240 = r_setObligation[capability240]
	rule r_obligation241 = r_setObligation[capability241]
	rule r_obligation242 = r_setObligation[capability242]
	rule r_obligation243 = r_setObligation[capability243]
	rule r_obligation244 = r_setObligation[capability244]
	rule r_obligation245 = r_setObligation[capability245]
	rule r_obligation246 = r_setObligation[capability246]
	rule r_obligation247 = r_setObligation[capability247]
	rule r_obligation248 = r_setObligation[capability248]
	rule r_obligation249 = r_setObligation[capability249]
	rule r_obligation250 = r_setObligation[capability250]
	rule r_obligation251 = r_setObligation[capability251]
	rule r_obligation252 = r_setObligation[capability252]
	rule r_obligation253 = r_setObligation[capability253]
	rule r_obligation254 = r_setObligation[capability254]
	rule r_obligation255 = r_setObligation[capability255]
	rule r_obligation256 = r_setObligation[capability256]
	rule r_obligation257 = r_setObligation[capability257]
	rule r_obligation258 = r_setObligation[capability258]
	rule r_obligation259 = r_setObligation[capability259]
	rule r_obligation260 = r_setObligation[capability260]
	
	/*
	 * IF condition THEN obligation
	 * UNLESS condition IN WHICH CASE obligation
	 */
		rule r_Rule1 = 
		r_SLEEC[condition1, <<r_obligation1>>,
			condition2, <<r_obligation2>>,
			condition3, <<r_obligation3>>,
			condition4, <<r_obligation4>>
		]

	rule r_Rule2 = 
		r_SLEEC[condition5, <<r_obligation5>>,
			condition6, <<r_obligation6>>,
			condition7, <<r_obligation7>>,
			condition8, <<r_obligation8>>
		]

	rule r_Rule3 = 
		r_SLEEC[condition9, <<r_obligation9>>,
			condition10, <<r_obligation10>>,
			condition11, <<r_obligation11>>,
			condition12, <<r_obligation12>>
		]

	rule r_Rule4 = 
		r_SLEEC[condition13, <<r_obligation13>>,
			condition14, <<r_obligation14>>,
			condition15, <<r_obligation15>>,
			condition16, <<r_obligation16>>
		]

	rule r_Rule5 = 
		r_SLEEC[condition17, <<r_obligation17>>,
			condition18, <<r_obligation18>>,
			condition19, <<r_obligation19>>,
			condition20, <<r_obligation20>>
		]

	rule r_Rule6 = 
		r_SLEEC[condition21, <<r_obligation21>>,
			condition22, <<r_obligation22>>,
			condition23, <<r_obligation23>>,
			condition24, <<r_obligation24>>
		]

	rule r_Rule7 = 
		r_SLEEC[condition25, <<r_obligation25>>,
			condition26, <<r_obligation26>>,
			condition27, <<r_obligation27>>,
			condition28, <<r_obligation28>>
		]

	rule r_Rule8 = 
		r_SLEEC[condition29, <<r_obligation29>>,
			condition30, <<r_obligation30>>,
			condition31, <<r_obligation31>>,
			condition32, <<r_obligation32>>
		]

	rule r_Rule9 = 
		r_SLEEC[condition33, <<r_obligation33>>,
			condition34, <<r_obligation34>>,
			condition35, <<r_obligation35>>,
			condition36, <<r_obligation36>>
		]

	rule r_Rule10 = 
		r_SLEEC[condition37, <<r_obligation37>>,
			condition38, <<r_obligation38>>,
			condition39, <<r_obligation39>>,
			condition40, <<r_obligation40>>
		]

	rule r_Rule11 = 
		r_SLEEC[condition41, <<r_obligation41>>,
			condition42, <<r_obligation42>>,
			condition43, <<r_obligation43>>,
			condition44, <<r_obligation44>>
		]

	rule r_Rule12 = 
		r_SLEEC[condition45, <<r_obligation45>>,
			condition46, <<r_obligation46>>,
			condition47, <<r_obligation47>>,
			condition48, <<r_obligation48>>
		]

	rule r_Rule13 = 
		r_SLEEC[condition49, <<r_obligation49>>,
			condition50, <<r_obligation50>>,
			condition51, <<r_obligation51>>,
			condition52, <<r_obligation52>>
		]

	rule r_Rule14 = 
		r_SLEEC[condition53, <<r_obligation53>>,
			condition54, <<r_obligation54>>,
			condition55, <<r_obligation55>>,
			condition56, <<r_obligation56>>
		]

	rule r_Rule15 = 
		r_SLEEC[condition57, <<r_obligation57>>,
			condition58, <<r_obligation58>>,
			condition59, <<r_obligation59>>,
			condition60, <<r_obligation60>>
		]

	rule r_Rule16 = 
		r_SLEEC[condition61, <<r_obligation61>>,
			condition62, <<r_obligation62>>,
			condition63, <<r_obligation63>>,
			condition64, <<r_obligation64>>
		]

	rule r_Rule17 = 
		r_SLEEC[condition65, <<r_obligation65>>,
			condition66, <<r_obligation66>>,
			condition67, <<r_obligation67>>,
			condition68, <<r_obligation68>>
		]

	rule r_Rule18 = 
		r_SLEEC[condition69, <<r_obligation69>>,
			condition70, <<r_obligation70>>,
			condition71, <<r_obligation71>>,
			condition72, <<r_obligation72>>
		]

	rule r_Rule19 = 
		r_SLEEC[condition73, <<r_obligation73>>,
			condition74, <<r_obligation74>>,
			condition75, <<r_obligation75>>,
			condition76, <<r_obligation76>>
		]

	rule r_Rule20 = 
		r_SLEEC[condition77, <<r_obligation77>>,
			condition78, <<r_obligation78>>,
			condition79, <<r_obligation79>>,
			condition80, <<r_obligation80>>
		]

	rule r_Rule21 = 
		r_SLEEC[condition81, <<r_obligation81>>,
			condition82, <<r_obligation82>>,
			condition83, <<r_obligation83>>,
			condition84, <<r_obligation84>>
		]

	rule r_Rule22 = 
		r_SLEEC[condition85, <<r_obligation85>>,
			condition86, <<r_obligation86>>,
			condition87, <<r_obligation87>>,
			condition88, <<r_obligation88>>
		]

	rule r_Rule23 = 
		r_SLEEC[condition89, <<r_obligation89>>,
			condition90, <<r_obligation90>>,
			condition91, <<r_obligation91>>,
			condition92, <<r_obligation92>>
		]

	rule r_Rule24 = 
		r_SLEEC[condition93, <<r_obligation93>>,
			condition94, <<r_obligation94>>,
			condition95, <<r_obligation95>>,
			condition96, <<r_obligation96>>
		]

	rule r_Rule25 = 
		r_SLEEC[condition97, <<r_obligation97>>,
			condition98, <<r_obligation98>>,
			condition99, <<r_obligation99>>,
			condition100, <<r_obligation100>>
		]

	rule r_Rule26 = 
		r_SLEEC[condition101, <<r_obligation101>>,
			condition102, <<r_obligation102>>,
			condition103, <<r_obligation103>>,
			condition104, <<r_obligation104>>
		]

	rule r_Rule27 = 
		r_SLEEC[condition105, <<r_obligation105>>,
			condition106, <<r_obligation106>>,
			condition107, <<r_obligation107>>,
			condition108, <<r_obligation108>>
		]

	rule r_Rule28 = 
		r_SLEEC[condition109, <<r_obligation109>>,
			condition110, <<r_obligation110>>,
			condition111, <<r_obligation111>>,
			condition112, <<r_obligation112>>
		]

	rule r_Rule29 = 
		r_SLEEC[condition113, <<r_obligation113>>,
			condition114, <<r_obligation114>>,
			condition115, <<r_obligation115>>,
			condition116, <<r_obligation116>>
		]

	rule r_Rule30 = 
		r_SLEEC[condition117, <<r_obligation117>>,
			condition118, <<r_obligation118>>,
			condition119, <<r_obligation119>>,
			condition120, <<r_obligation120>>
		]

	rule r_Rule31 = 
		r_SLEEC[condition121, <<r_obligation121>>,
			condition122, <<r_obligation122>>,
			condition123, <<r_obligation123>>,
			condition124, <<r_obligation124>>
		]

	rule r_Rule32 = 
		r_SLEEC[condition125, <<r_obligation125>>,
			condition126, <<r_obligation126>>,
			condition127, <<r_obligation127>>,
			condition128, <<r_obligation128>>
		]

	rule r_Rule33 = 
		r_SLEEC[condition129, <<r_obligation129>>,
			condition130, <<r_obligation130>>,
			condition131, <<r_obligation131>>,
			condition132, <<r_obligation132>>
		]

	rule r_Rule34 = 
		r_SLEEC[condition133, <<r_obligation133>>,
			condition134, <<r_obligation134>>,
			condition135, <<r_obligation135>>,
			condition136, <<r_obligation136>>
		]

	rule r_Rule35 = 
		r_SLEEC[condition137, <<r_obligation137>>,
			condition138, <<r_obligation138>>,
			condition139, <<r_obligation139>>,
			condition140, <<r_obligation140>>
		]

	rule r_Rule36 = 
		r_SLEEC[condition141, <<r_obligation141>>,
			condition142, <<r_obligation142>>,
			condition143, <<r_obligation143>>,
			condition144, <<r_obligation144>>
		]

	rule r_Rule37 = 
		r_SLEEC[condition145, <<r_obligation145>>,
			condition146, <<r_obligation146>>,
			condition147, <<r_obligation147>>,
			condition148, <<r_obligation148>>
		]

	rule r_Rule38 = 
		r_SLEEC[condition149, <<r_obligation149>>,
			condition150, <<r_obligation150>>,
			condition151, <<r_obligation151>>,
			condition152, <<r_obligation152>>
		]

	rule r_Rule39 = 
		r_SLEEC[condition153, <<r_obligation153>>,
			condition154, <<r_obligation154>>,
			condition155, <<r_obligation155>>,
			condition156, <<r_obligation156>>
		]

	rule r_Rule40 = 
		r_SLEEC[condition157, <<r_obligation157>>,
			condition158, <<r_obligation158>>,
			condition159, <<r_obligation159>>,
			condition160, <<r_obligation160>>
		]

	rule r_Rule41 = 
		r_SLEEC[condition161, <<r_obligation161>>,
			condition162, <<r_obligation162>>,
			condition163, <<r_obligation163>>,
			condition164, <<r_obligation164>>
		]

	rule r_Rule42 = 
		r_SLEEC[condition165, <<r_obligation165>>,
			condition166, <<r_obligation166>>,
			condition167, <<r_obligation167>>,
			condition168, <<r_obligation168>>
		]

	rule r_Rule43 = 
		r_SLEEC[condition169, <<r_obligation169>>,
			condition170, <<r_obligation170>>,
			condition171, <<r_obligation171>>,
			condition172, <<r_obligation172>>
		]

	rule r_Rule44 = 
		r_SLEEC[condition173, <<r_obligation173>>,
			condition174, <<r_obligation174>>,
			condition175, <<r_obligation175>>,
			condition176, <<r_obligation176>>
		]

	rule r_Rule45 = 
		r_SLEEC[condition177, <<r_obligation177>>,
			condition178, <<r_obligation178>>,
			condition179, <<r_obligation179>>,
			condition180, <<r_obligation180>>
		]

	rule r_Rule46 = 
		r_SLEEC[condition181, <<r_obligation181>>,
			condition182, <<r_obligation182>>,
			condition183, <<r_obligation183>>,
			condition184, <<r_obligation184>>
		]

	rule r_Rule47 = 
		r_SLEEC[condition185, <<r_obligation185>>,
			condition186, <<r_obligation186>>,
			condition187, <<r_obligation187>>,
			condition188, <<r_obligation188>>
		]

	rule r_Rule48 = 
		r_SLEEC[condition189, <<r_obligation189>>,
			condition190, <<r_obligation190>>,
			condition191, <<r_obligation191>>,
			condition192, <<r_obligation192>>
		]

	rule r_Rule49 = 
		r_SLEEC[condition193, <<r_obligation193>>,
			condition194, <<r_obligation194>>,
			condition195, <<r_obligation195>>,
			condition196, <<r_obligation196>>
		]

	rule r_Rule50 = 
		r_SLEEC[condition197, <<r_obligation197>>,
			condition198, <<r_obligation198>>,
			condition199, <<r_obligation199>>,
			condition200, <<r_obligation200>>
		]

	rule r_Rule51 = 
		r_SLEEC[condition201, <<r_obligation201>>,
			condition202, <<r_obligation202>>,
			condition203, <<r_obligation203>>,
			condition204, <<r_obligation204>>
		]

	rule r_Rule52 = 
		r_SLEEC[condition205, <<r_obligation205>>,
			condition206, <<r_obligation206>>,
			condition207, <<r_obligation207>>,
			condition208, <<r_obligation208>>
		]

	rule r_Rule53 = 
		r_SLEEC[condition209, <<r_obligation209>>,
			condition210, <<r_obligation210>>,
			condition211, <<r_obligation211>>,
			condition212, <<r_obligation212>>
		]

	rule r_Rule54 = 
		r_SLEEC[condition213, <<r_obligation213>>,
			condition214, <<r_obligation214>>,
			condition215, <<r_obligation215>>,
			condition216, <<r_obligation216>>
		]

	rule r_Rule55 = 
		r_SLEEC[condition217, <<r_obligation217>>,
			condition218, <<r_obligation218>>,
			condition219, <<r_obligation219>>,
			condition220, <<r_obligation220>>
		]

	rule r_Rule56 = 
		r_SLEEC[condition221, <<r_obligation221>>,
			condition222, <<r_obligation222>>,
			condition223, <<r_obligation223>>,
			condition224, <<r_obligation224>>
		]

	rule r_Rule57 = 
		r_SLEEC[condition225, <<r_obligation225>>,
			condition226, <<r_obligation226>>,
			condition227, <<r_obligation227>>,
			condition228, <<r_obligation228>>
		]

	rule r_Rule58 = 
		r_SLEEC[condition229, <<r_obligation229>>,
			condition230, <<r_obligation230>>,
			condition231, <<r_obligation231>>,
			condition232, <<r_obligation232>>
		]

	rule r_Rule59 = 
		r_SLEEC[condition233, <<r_obligation233>>,
			condition234, <<r_obligation234>>,
			condition235, <<r_obligation235>>,
			condition236, <<r_obligation236>>
		]

	rule r_Rule60 = 
		r_SLEEC[condition237, <<r_obligation237>>,
			condition238, <<r_obligation238>>,
			condition239, <<r_obligation239>>,
			condition240, <<r_obligation240>>
		]

	rule r_Rule61 = 
		r_SLEEC[condition241, <<r_obligation241>>,
			condition242, <<r_obligation242>>,
			condition243, <<r_obligation243>>,
			condition244, <<r_obligation244>>
		]

	rule r_Rule62 = 
		r_SLEEC[condition245, <<r_obligation245>>,
			condition246, <<r_obligation246>>,
			condition247, <<r_obligation247>>,
			condition248, <<r_obligation248>>
		]

	rule r_Rule63 = 
		r_SLEEC[condition249, <<r_obligation249>>,
			condition250, <<r_obligation250>>,
			condition251, <<r_obligation251>>,
			condition252, <<r_obligation252>>
		]

	rule r_Rule64 = 
		r_SLEEC[condition253, <<r_obligation253>>,
			condition254, <<r_obligation254>>,
			condition255, <<r_obligation255>>,
			condition256, <<r_obligation256>>
		]

	rule r_Rule65 = 
		r_SLEEC[condition257, <<r_obligation257>>,
			condition258, <<r_obligation258>>,
			condition259, <<r_obligation259>>,
			condition260, <<r_obligation260>>
		]

	
/* DOMAIN-GENERAL RULES*/
	
	//reset of all locations that contribute to the out location output
	rule r_Reset =
	 	forall $c in Capability do 
	 		par
				//info($c) := (undef,undef,undef,undef,undef)
				outConstraint(id($c)) := undef //(undef,undef,undef,undef)
				//doObligation($c) := false //NEW
			    outObligation(id($c)) := false //NEW
				constraint($c) := undef
				otherwiseC($c) := undef
			endpar
			
	main rule r_Main =  
		seq	
			r_Reset[] //reset of out locations in sequential order, otherwise the function resetting updates will not be visible to the other rules in one machine step
			par
				r_Rule1[]
			r_Rule2[]
			r_Rule3[]
			r_Rule4[]
			r_Rule5[]
			r_Rule6[]
			r_Rule7[]
			r_Rule8[]
			r_Rule9[]
			r_Rule10[]
			r_Rule11[]
			r_Rule12[]
			r_Rule13[]
			r_Rule14[]
			r_Rule15[]
			r_Rule16[]
			r_Rule17[]
			r_Rule18[]
			r_Rule19[]
			r_Rule20[]
			r_Rule21[]
			r_Rule22[]
			r_Rule23[]
			r_Rule24[]
			r_Rule25[]
			r_Rule26[]
			r_Rule27[]
			r_Rule28[]
			r_Rule29[]
			r_Rule30[]
			r_Rule31[]
			r_Rule32[]
			r_Rule33[]
			r_Rule34[]
			r_Rule35[]
			r_Rule36[]
			r_Rule37[]
			r_Rule38[]
			r_Rule39[]
			r_Rule40[]
			r_Rule41[]
			r_Rule42[]
			r_Rule43[]
			r_Rule44[]
			r_Rule45[]
			r_Rule46[]
			r_Rule47[]
			r_Rule48[]
			r_Rule49[]
			r_Rule50[]
			r_Rule51[]
			r_Rule52[]
			r_Rule53[]
			r_Rule54[]
			r_Rule55[]
			r_Rule56[]
			r_Rule57[]
			r_Rule58[]
			r_Rule59[]
			r_Rule60[]
			r_Rule61[]
			r_Rule62[]
			r_Rule63[]
			r_Rule64[]
			r_Rule65[]
			endpar
		endseq

default init s0:
