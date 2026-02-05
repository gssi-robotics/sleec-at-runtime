
// Sample SLEEC rules 
asm test_40_18

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary_18

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {CAPABILITY1, CAPABILITY2, CAPABILITY3, CAPABILITY4, CAPABILITY5, CAPABILITY6, CAPABILITY7, CAPABILITY8, CAPABILITY9, CAPABILITY10, CAPABILITY11, CAPABILITY12, CAPABILITY13, CAPABILITY14, CAPABILITY15, CAPABILITY16, CAPABILITY17, CAPABILITY18, CAPABILITY19, CAPABILITY20, CAPABILITY21, CAPABILITY22, CAPABILITY23, CAPABILITY24, CAPABILITY25, CAPABILITY26, CAPABILITY27, CAPABILITY28, CAPABILITY29, CAPABILITY30, CAPABILITY31, CAPABILITY32, CAPABILITY33, CAPABILITY34, CAPABILITY35, CAPABILITY36, CAPABILITY37, CAPABILITY38, CAPABILITY39, CAPABILITY40, CAPABILITY41, CAPABILITY42, CAPABILITY43, CAPABILITY44, CAPABILITY45, CAPABILITY46, CAPABILITY47, CAPABILITY48, CAPABILITY49, CAPABILITY50, CAPABILITY51, CAPABILITY52, CAPABILITY53, CAPABILITY54, CAPABILITY55, CAPABILITY56, CAPABILITY57, CAPABILITY58, CAPABILITY59, CAPABILITY60, CAPABILITY61, CAPABILITY62, CAPABILITY63, CAPABILITY64, CAPABILITY65, CAPABILITY66, CAPABILITY67, CAPABILITY68, CAPABILITY69, CAPABILITY70, CAPABILITY71, CAPABILITY72, CAPABILITY73, CAPABILITY74, CAPABILITY75, CAPABILITY76, CAPABILITY77, CAPABILITY78, CAPABILITY79, CAPABILITY80, CAPABILITY81, CAPABILITY82, CAPABILITY83, CAPABILITY84, CAPABILITY85, CAPABILITY86, CAPABILITY87, CAPABILITY88, CAPABILITY89, CAPABILITY90, CAPABILITY91, CAPABILITY92, CAPABILITY93, CAPABILITY94, CAPABILITY95, CAPABILITY96, CAPABILITY97, CAPABILITY98, CAPABILITY99, CAPABILITY100, CAPABILITY101, CAPABILITY102, CAPABILITY103, CAPABILITY104, CAPABILITY105, CAPABILITY106, CAPABILITY107, CAPABILITY108, CAPABILITY109, CAPABILITY110, CAPABILITY111, CAPABILITY112, CAPABILITY113, CAPABILITY114, CAPABILITY115, CAPABILITY116, CAPABILITY117, CAPABILITY118, CAPABILITY119, CAPABILITY120, CAPABILITY121, CAPABILITY122, CAPABILITY123, CAPABILITY124, CAPABILITY125, CAPABILITY126, CAPABILITY127, CAPABILITY128, CAPABILITY129, CAPABILITY130, CAPABILITY131, CAPABILITY132, CAPABILITY133, CAPABILITY134, CAPABILITY135, CAPABILITY136, CAPABILITY137, CAPABILITY138, CAPABILITY139, CAPABILITY140, CAPABILITY141, CAPABILITY142, CAPABILITY143, CAPABILITY144, CAPABILITY145, CAPABILITY146, CAPABILITY147, CAPABILITY148, CAPABILITY149, CAPABILITY150, CAPABILITY151, CAPABILITY152, CAPABILITY153, CAPABILITY154, CAPABILITY155, CAPABILITY156, CAPABILITY157, CAPABILITY158, CAPABILITY159, CAPABILITY160, CAPABILITY161, CAPABILITY162, CAPABILITY163, CAPABILITY164, CAPABILITY165, CAPABILITY166, CAPABILITY167, CAPABILITY168, CAPABILITY169, CAPABILITY170, CAPABILITY171, CAPABILITY172, CAPABILITY173, CAPABILITY174, CAPABILITY175, CAPABILITY176, CAPABILITY177, CAPABILITY178, CAPABILITY179, CAPABILITY180, CAPABILITY181, CAPABILITY182, CAPABILITY183, CAPABILITY184, CAPABILITY185, CAPABILITY186, CAPABILITY187, CAPABILITY188, CAPABILITY189, CAPABILITY190, CAPABILITY191, CAPABILITY192, CAPABILITY193, CAPABILITY194, CAPABILITY195, CAPABILITY196, CAPABILITY197, CAPABILITY198, CAPABILITY199, CAPABILITY200, CAPABILITY201, CAPABILITY202, CAPABILITY203, CAPABILITY204, CAPABILITY205, CAPABILITY206, CAPABILITY207, CAPABILITY208, CAPABILITY209, CAPABILITY210, CAPABILITY211, CAPABILITY212, CAPABILITY213, CAPABILITY214, CAPABILITY215, CAPABILITY216, CAPABILITY217, CAPABILITY218, CAPABILITY219, CAPABILITY220, CAPABILITY221, CAPABILITY222, CAPABILITY223, CAPABILITY224, CAPABILITY225, CAPABILITY226, CAPABILITY227, CAPABILITY228, CAPABILITY229, CAPABILITY230, CAPABILITY231, CAPABILITY232, CAPABILITY233, CAPABILITY234, CAPABILITY235, CAPABILITY236, CAPABILITY237, CAPABILITY238, CAPABILITY239, CAPABILITY240, CAPABILITY241, CAPABILITY242, CAPABILITY243, CAPABILITY244, CAPABILITY245, CAPABILITY246, CAPABILITY247, CAPABILITY248, CAPABILITY249, CAPABILITY250, CAPABILITY251, CAPABILITY252, CAPABILITY253, CAPABILITY254, CAPABILITY255, CAPABILITY256, CAPABILITY257, CAPABILITY258, CAPABILITY259, CAPABILITY260, CAPABILITY261, CAPABILITY262, CAPABILITY263, CAPABILITY264, CAPABILITY265, CAPABILITY266, CAPABILITY267, CAPABILITY268, CAPABILITY269, CAPABILITY270, CAPABILITY271, CAPABILITY272, CAPABILITY273, CAPABILITY274, CAPABILITY275, CAPABILITY276, CAPABILITY277, CAPABILITY278, CAPABILITY279, CAPABILITY280, CAPABILITY281, CAPABILITY282, CAPABILITY283, CAPABILITY284, CAPABILITY285, CAPABILITY286, CAPABILITY287, CAPABILITY288, CAPABILITY289, CAPABILITY290, CAPABILITY291, CAPABILITY292, CAPABILITY293, CAPABILITY294, CAPABILITY295, CAPABILITY296, CAPABILITY297, CAPABILITY298, CAPABILITY299, CAPABILITY300, CAPABILITY301, CAPABILITY302, CAPABILITY303, CAPABILITY304, CAPABILITY305, CAPABILITY306, CAPABILITY307, CAPABILITY308, CAPABILITY309, CAPABILITY310, CAPABILITY311, CAPABILITY312, CAPABILITY313, CAPABILITY314, CAPABILITY315, CAPABILITY316, CAPABILITY317, CAPABILITY318, CAPABILITY319, CAPABILITY320, CAPABILITY321, CAPABILITY322, CAPABILITY323, CAPABILITY324, CAPABILITY325, CAPABILITY326, CAPABILITY327, CAPABILITY328, CAPABILITY329, CAPABILITY330, CAPABILITY331, CAPABILITY332, CAPABILITY333, CAPABILITY334, CAPABILITY335, CAPABILITY336, CAPABILITY337, CAPABILITY338, CAPABILITY339, CAPABILITY340, CAPABILITY341, CAPABILITY342, CAPABILITY343, CAPABILITY344, CAPABILITY345, CAPABILITY346, CAPABILITY347, CAPABILITY348, CAPABILITY349, CAPABILITY350, CAPABILITY351, CAPABILITY352, CAPABILITY353, CAPABILITY354, CAPABILITY355, CAPABILITY356, CAPABILITY357, CAPABILITY358, CAPABILITY359, CAPABILITY360, CAPABILITY361, CAPABILITY362, CAPABILITY363, CAPABILITY364, CAPABILITY365, CAPABILITY366, CAPABILITY367, CAPABILITY368, CAPABILITY369, CAPABILITY370, CAPABILITY371, CAPABILITY372, CAPABILITY373, CAPABILITY374, CAPABILITY375, CAPABILITY376, CAPABILITY377, CAPABILITY378, CAPABILITY379, CAPABILITY380, CAPABILITY381, CAPABILITY382, CAPABILITY383, CAPABILITY384, CAPABILITY385, CAPABILITY386, CAPABILITY387, CAPABILITY388, CAPABILITY389, CAPABILITY390, CAPABILITY391, CAPABILITY392, CAPABILITY393, CAPABILITY394, CAPABILITY395, CAPABILITY396, CAPABILITY397, CAPABILITY398, CAPABILITY399, CAPABILITY400, CAPABILITY401, CAPABILITY402, CAPABILITY403, CAPABILITY404, CAPABILITY405, CAPABILITY406, CAPABILITY407, CAPABILITY408, CAPABILITY409, CAPABILITY410, CAPABILITY411, CAPABILITY412, CAPABILITY413, CAPABILITY414, CAPABILITY415, CAPABILITY416, CAPABILITY417, CAPABILITY418, CAPABILITY419, CAPABILITY420, CAPABILITY421, CAPABILITY422, CAPABILITY423, CAPABILITY424, CAPABILITY425, CAPABILITY426, CAPABILITY427, CAPABILITY428, CAPABILITY429, CAPABILITY430, CAPABILITY431, CAPABILITY432, CAPABILITY433, CAPABILITY434, CAPABILITY435, CAPABILITY436, CAPABILITY437, CAPABILITY438, CAPABILITY439, CAPABILITY440, CAPABILITY441, CAPABILITY442, CAPABILITY443, CAPABILITY444, CAPABILITY445, CAPABILITY446, CAPABILITY447, CAPABILITY448, CAPABILITY449, CAPABILITY450, CAPABILITY451, CAPABILITY452, CAPABILITY453, CAPABILITY454, CAPABILITY455, CAPABILITY456, CAPABILITY457, CAPABILITY458, CAPABILITY459, CAPABILITY460, CAPABILITY461, CAPABILITY462, CAPABILITY463, CAPABILITY464, CAPABILITY465, CAPABILITY466, CAPABILITY467, CAPABILITY468, CAPABILITY469, CAPABILITY470, CAPABILITY471, CAPABILITY472, CAPABILITY473, CAPABILITY474, CAPABILITY475, CAPABILITY476, CAPABILITY477, CAPABILITY478, CAPABILITY479, CAPABILITY480, CAPABILITY481, CAPABILITY482, CAPABILITY483, CAPABILITY484, CAPABILITY485, CAPABILITY486, CAPABILITY487, CAPABILITY488, CAPABILITY489, CAPABILITY490, CAPABILITY491, CAPABILITY492, CAPABILITY493, CAPABILITY494, CAPABILITY495, CAPABILITY496, CAPABILITY497, CAPABILITY498, CAPABILITY499, CAPABILITY500, CAPABILITY501, CAPABILITY502, CAPABILITY503, CAPABILITY504, CAPABILITY505, CAPABILITY506, CAPABILITY507, CAPABILITY508, CAPABILITY509, CAPABILITY510, CAPABILITY511, CAPABILITY512, CAPABILITY513, CAPABILITY514, CAPABILITY515, CAPABILITY516, CAPABILITY517, CAPABILITY518, CAPABILITY519, CAPABILITY520, CAPABILITY521, CAPABILITY522, CAPABILITY523, CAPABILITY524, CAPABILITY525, CAPABILITY526, CAPABILITY527, CAPABILITY528, CAPABILITY529, CAPABILITY530, CAPABILITY531, CAPABILITY532, CAPABILITY533, CAPABILITY534, CAPABILITY535, CAPABILITY536, CAPABILITY537, CAPABILITY538, CAPABILITY539, CAPABILITY540, CAPABILITY541, CAPABILITY542, CAPABILITY543, CAPABILITY544, CAPABILITY545, CAPABILITY546, CAPABILITY547, CAPABILITY548, CAPABILITY549, CAPABILITY550, CAPABILITY551, CAPABILITY552, CAPABILITY553, CAPABILITY554, CAPABILITY555, CAPABILITY556, CAPABILITY557, CAPABILITY558, CAPABILITY559, CAPABILITY560, CAPABILITY561, CAPABILITY562, CAPABILITY563, CAPABILITY564, CAPABILITY565, CAPABILITY566, CAPABILITY567, CAPABILITY568, CAPABILITY569, CAPABILITY570, CAPABILITY571, CAPABILITY572, CAPABILITY573, CAPABILITY574, CAPABILITY575, CAPABILITY576, CAPABILITY577, CAPABILITY578, CAPABILITY579, CAPABILITY580, CAPABILITY581, CAPABILITY582, CAPABILITY583, CAPABILITY584, CAPABILITY585, CAPABILITY586, CAPABILITY587, CAPABILITY588, CAPABILITY589, CAPABILITY590, CAPABILITY591, CAPABILITY592, CAPABILITY593, CAPABILITY594, CAPABILITY595, CAPABILITY596, CAPABILITY597, CAPABILITY598, CAPABILITY599, CAPABILITY600, CAPABILITY601, CAPABILITY602, CAPABILITY603, CAPABILITY604, CAPABILITY605, CAPABILITY606, CAPABILITY607, CAPABILITY608, CAPABILITY609, CAPABILITY610, CAPABILITY611, CAPABILITY612, CAPABILITY613, CAPABILITY614, CAPABILITY615, CAPABILITY616, CAPABILITY617, CAPABILITY618, CAPABILITY619, CAPABILITY620, CAPABILITY621, CAPABILITY622, CAPABILITY623, CAPABILITY624, CAPABILITY625, CAPABILITY626, CAPABILITY627, CAPABILITY628, CAPABILITY629, CAPABILITY630, CAPABILITY631, CAPABILITY632, CAPABILITY633, CAPABILITY634, CAPABILITY635, CAPABILITY636, CAPABILITY637, CAPABILITY638, CAPABILITY639, CAPABILITY640, CAPABILITY641, CAPABILITY642, CAPABILITY643, CAPABILITY644, CAPABILITY645, CAPABILITY646, CAPABILITY647, CAPABILITY648, CAPABILITY649, CAPABILITY650, CAPABILITY651, CAPABILITY652, CAPABILITY653, CAPABILITY654, CAPABILITY655, CAPABILITY656, CAPABILITY657, CAPABILITY658, CAPABILITY659, CAPABILITY660, CAPABILITY661, CAPABILITY662, CAPABILITY663, CAPABILITY664, CAPABILITY665, CAPABILITY666, CAPABILITY667, CAPABILITY668, CAPABILITY669, CAPABILITY670, CAPABILITY671, CAPABILITY672, CAPABILITY673, CAPABILITY674, CAPABILITY675, CAPABILITY676, CAPABILITY677, CAPABILITY678, CAPABILITY679, CAPABILITY680, CAPABILITY681, CAPABILITY682, CAPABILITY683, CAPABILITY684, CAPABILITY685, CAPABILITY686, CAPABILITY687, CAPABILITY688, CAPABILITY689, CAPABILITY690, CAPABILITY691, CAPABILITY692, CAPABILITY693, CAPABILITY694, CAPABILITY695, CAPABILITY696, CAPABILITY697, CAPABILITY698, CAPABILITY699, CAPABILITY700, CAPABILITY701, CAPABILITY702, CAPABILITY703, CAPABILITY704, CAPABILITY705, CAPABILITY706, CAPABILITY707, CAPABILITY708, CAPABILITY709, CAPABILITY710, CAPABILITY711, CAPABILITY712, CAPABILITY713, CAPABILITY714, CAPABILITY715, CAPABILITY716, CAPABILITY717, CAPABILITY718, CAPABILITY719, CAPABILITY720}

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
	monitored condition261: Boolean
	monitored condition262: Boolean
	monitored condition263: Boolean
	monitored condition264: Boolean
	monitored condition265: Boolean
	monitored condition266: Boolean
	monitored condition267: Boolean
	monitored condition268: Boolean
	monitored condition269: Boolean
	monitored condition270: Boolean
	monitored condition271: Boolean
	monitored condition272: Boolean
	monitored condition273: Boolean
	monitored condition274: Boolean
	monitored condition275: Boolean
	monitored condition276: Boolean
	monitored condition277: Boolean
	monitored condition278: Boolean
	monitored condition279: Boolean
	monitored condition280: Boolean
	monitored condition281: Boolean
	monitored condition282: Boolean
	monitored condition283: Boolean
	monitored condition284: Boolean
	monitored condition285: Boolean
	monitored condition286: Boolean
	monitored condition287: Boolean
	monitored condition288: Boolean
	monitored condition289: Boolean
	monitored condition290: Boolean
	monitored condition291: Boolean
	monitored condition292: Boolean
	monitored condition293: Boolean
	monitored condition294: Boolean
	monitored condition295: Boolean
	monitored condition296: Boolean
	monitored condition297: Boolean
	monitored condition298: Boolean
	monitored condition299: Boolean
	monitored condition300: Boolean
	monitored condition301: Boolean
	monitored condition302: Boolean
	monitored condition303: Boolean
	monitored condition304: Boolean
	monitored condition305: Boolean
	monitored condition306: Boolean
	monitored condition307: Boolean
	monitored condition308: Boolean
	monitored condition309: Boolean
	monitored condition310: Boolean
	monitored condition311: Boolean
	monitored condition312: Boolean
	monitored condition313: Boolean
	monitored condition314: Boolean
	monitored condition315: Boolean
	monitored condition316: Boolean
	monitored condition317: Boolean
	monitored condition318: Boolean
	monitored condition319: Boolean
	monitored condition320: Boolean
	monitored condition321: Boolean
	monitored condition322: Boolean
	monitored condition323: Boolean
	monitored condition324: Boolean
	monitored condition325: Boolean
	monitored condition326: Boolean
	monitored condition327: Boolean
	monitored condition328: Boolean
	monitored condition329: Boolean
	monitored condition330: Boolean
	monitored condition331: Boolean
	monitored condition332: Boolean
	monitored condition333: Boolean
	monitored condition334: Boolean
	monitored condition335: Boolean
	monitored condition336: Boolean
	monitored condition337: Boolean
	monitored condition338: Boolean
	monitored condition339: Boolean
	monitored condition340: Boolean
	monitored condition341: Boolean
	monitored condition342: Boolean
	monitored condition343: Boolean
	monitored condition344: Boolean
	monitored condition345: Boolean
	monitored condition346: Boolean
	monitored condition347: Boolean
	monitored condition348: Boolean
	monitored condition349: Boolean
	monitored condition350: Boolean
	monitored condition351: Boolean
	monitored condition352: Boolean
	monitored condition353: Boolean
	monitored condition354: Boolean
	monitored condition355: Boolean
	monitored condition356: Boolean
	monitored condition357: Boolean
	monitored condition358: Boolean
	monitored condition359: Boolean
	monitored condition360: Boolean
	monitored condition361: Boolean
	monitored condition362: Boolean
	monitored condition363: Boolean
	monitored condition364: Boolean
	monitored condition365: Boolean
	monitored condition366: Boolean
	monitored condition367: Boolean
	monitored condition368: Boolean
	monitored condition369: Boolean
	monitored condition370: Boolean
	monitored condition371: Boolean
	monitored condition372: Boolean
	monitored condition373: Boolean
	monitored condition374: Boolean
	monitored condition375: Boolean
	monitored condition376: Boolean
	monitored condition377: Boolean
	monitored condition378: Boolean
	monitored condition379: Boolean
	monitored condition380: Boolean
	monitored condition381: Boolean
	monitored condition382: Boolean
	monitored condition383: Boolean
	monitored condition384: Boolean
	monitored condition385: Boolean
	monitored condition386: Boolean
	monitored condition387: Boolean
	monitored condition388: Boolean
	monitored condition389: Boolean
	monitored condition390: Boolean
	monitored condition391: Boolean
	monitored condition392: Boolean
	monitored condition393: Boolean
	monitored condition394: Boolean
	monitored condition395: Boolean
	monitored condition396: Boolean
	monitored condition397: Boolean
	monitored condition398: Boolean
	monitored condition399: Boolean
	monitored condition400: Boolean
	monitored condition401: Boolean
	monitored condition402: Boolean
	monitored condition403: Boolean
	monitored condition404: Boolean
	monitored condition405: Boolean
	monitored condition406: Boolean
	monitored condition407: Boolean
	monitored condition408: Boolean
	monitored condition409: Boolean
	monitored condition410: Boolean
	monitored condition411: Boolean
	monitored condition412: Boolean
	monitored condition413: Boolean
	monitored condition414: Boolean
	monitored condition415: Boolean
	monitored condition416: Boolean
	monitored condition417: Boolean
	monitored condition418: Boolean
	monitored condition419: Boolean
	monitored condition420: Boolean
	monitored condition421: Boolean
	monitored condition422: Boolean
	monitored condition423: Boolean
	monitored condition424: Boolean
	monitored condition425: Boolean
	monitored condition426: Boolean
	monitored condition427: Boolean
	monitored condition428: Boolean
	monitored condition429: Boolean
	monitored condition430: Boolean
	monitored condition431: Boolean
	monitored condition432: Boolean
	monitored condition433: Boolean
	monitored condition434: Boolean
	monitored condition435: Boolean
	monitored condition436: Boolean
	monitored condition437: Boolean
	monitored condition438: Boolean
	monitored condition439: Boolean
	monitored condition440: Boolean
	monitored condition441: Boolean
	monitored condition442: Boolean
	monitored condition443: Boolean
	monitored condition444: Boolean
	monitored condition445: Boolean
	monitored condition446: Boolean
	monitored condition447: Boolean
	monitored condition448: Boolean
	monitored condition449: Boolean
	monitored condition450: Boolean
	monitored condition451: Boolean
	monitored condition452: Boolean
	monitored condition453: Boolean
	monitored condition454: Boolean
	monitored condition455: Boolean
	monitored condition456: Boolean
	monitored condition457: Boolean
	monitored condition458: Boolean
	monitored condition459: Boolean
	monitored condition460: Boolean
	monitored condition461: Boolean
	monitored condition462: Boolean
	monitored condition463: Boolean
	monitored condition464: Boolean
	monitored condition465: Boolean
	monitored condition466: Boolean
	monitored condition467: Boolean
	monitored condition468: Boolean
	monitored condition469: Boolean
	monitored condition470: Boolean
	monitored condition471: Boolean
	monitored condition472: Boolean
	monitored condition473: Boolean
	monitored condition474: Boolean
	monitored condition475: Boolean
	monitored condition476: Boolean
	monitored condition477: Boolean
	monitored condition478: Boolean
	monitored condition479: Boolean
	monitored condition480: Boolean
	monitored condition481: Boolean
	monitored condition482: Boolean
	monitored condition483: Boolean
	monitored condition484: Boolean
	monitored condition485: Boolean
	monitored condition486: Boolean
	monitored condition487: Boolean
	monitored condition488: Boolean
	monitored condition489: Boolean
	monitored condition490: Boolean
	monitored condition491: Boolean
	monitored condition492: Boolean
	monitored condition493: Boolean
	monitored condition494: Boolean
	monitored condition495: Boolean
	monitored condition496: Boolean
	monitored condition497: Boolean
	monitored condition498: Boolean
	monitored condition499: Boolean
	monitored condition500: Boolean
	monitored condition501: Boolean
	monitored condition502: Boolean
	monitored condition503: Boolean
	monitored condition504: Boolean
	monitored condition505: Boolean
	monitored condition506: Boolean
	monitored condition507: Boolean
	monitored condition508: Boolean
	monitored condition509: Boolean
	monitored condition510: Boolean
	monitored condition511: Boolean
	monitored condition512: Boolean
	monitored condition513: Boolean
	monitored condition514: Boolean
	monitored condition515: Boolean
	monitored condition516: Boolean
	monitored condition517: Boolean
	monitored condition518: Boolean
	monitored condition519: Boolean
	monitored condition520: Boolean
	monitored condition521: Boolean
	monitored condition522: Boolean
	monitored condition523: Boolean
	monitored condition524: Boolean
	monitored condition525: Boolean
	monitored condition526: Boolean
	monitored condition527: Boolean
	monitored condition528: Boolean
	monitored condition529: Boolean
	monitored condition530: Boolean
	monitored condition531: Boolean
	monitored condition532: Boolean
	monitored condition533: Boolean
	monitored condition534: Boolean
	monitored condition535: Boolean
	monitored condition536: Boolean
	monitored condition537: Boolean
	monitored condition538: Boolean
	monitored condition539: Boolean
	monitored condition540: Boolean
	monitored condition541: Boolean
	monitored condition542: Boolean
	monitored condition543: Boolean
	monitored condition544: Boolean
	monitored condition545: Boolean
	monitored condition546: Boolean
	monitored condition547: Boolean
	monitored condition548: Boolean
	monitored condition549: Boolean
	monitored condition550: Boolean
	monitored condition551: Boolean
	monitored condition552: Boolean
	monitored condition553: Boolean
	monitored condition554: Boolean
	monitored condition555: Boolean
	monitored condition556: Boolean
	monitored condition557: Boolean
	monitored condition558: Boolean
	monitored condition559: Boolean
	monitored condition560: Boolean
	monitored condition561: Boolean
	monitored condition562: Boolean
	monitored condition563: Boolean
	monitored condition564: Boolean
	monitored condition565: Boolean
	monitored condition566: Boolean
	monitored condition567: Boolean
	monitored condition568: Boolean
	monitored condition569: Boolean
	monitored condition570: Boolean
	monitored condition571: Boolean
	monitored condition572: Boolean
	monitored condition573: Boolean
	monitored condition574: Boolean
	monitored condition575: Boolean
	monitored condition576: Boolean
	monitored condition577: Boolean
	monitored condition578: Boolean
	monitored condition579: Boolean
	monitored condition580: Boolean
	monitored condition581: Boolean
	monitored condition582: Boolean
	monitored condition583: Boolean
	monitored condition584: Boolean
	monitored condition585: Boolean
	monitored condition586: Boolean
	monitored condition587: Boolean
	monitored condition588: Boolean
	monitored condition589: Boolean
	monitored condition590: Boolean
	monitored condition591: Boolean
	monitored condition592: Boolean
	monitored condition593: Boolean
	monitored condition594: Boolean
	monitored condition595: Boolean
	monitored condition596: Boolean
	monitored condition597: Boolean
	monitored condition598: Boolean
	monitored condition599: Boolean
	monitored condition600: Boolean
	monitored condition601: Boolean
	monitored condition602: Boolean
	monitored condition603: Boolean
	monitored condition604: Boolean
	monitored condition605: Boolean
	monitored condition606: Boolean
	monitored condition607: Boolean
	monitored condition608: Boolean
	monitored condition609: Boolean
	monitored condition610: Boolean
	monitored condition611: Boolean
	monitored condition612: Boolean
	monitored condition613: Boolean
	monitored condition614: Boolean
	monitored condition615: Boolean
	monitored condition616: Boolean
	monitored condition617: Boolean
	monitored condition618: Boolean
	monitored condition619: Boolean
	monitored condition620: Boolean
	monitored condition621: Boolean
	monitored condition622: Boolean
	monitored condition623: Boolean
	monitored condition624: Boolean
	monitored condition625: Boolean
	monitored condition626: Boolean
	monitored condition627: Boolean
	monitored condition628: Boolean
	monitored condition629: Boolean
	monitored condition630: Boolean
	monitored condition631: Boolean
	monitored condition632: Boolean
	monitored condition633: Boolean
	monitored condition634: Boolean
	monitored condition635: Boolean
	monitored condition636: Boolean
	monitored condition637: Boolean
	monitored condition638: Boolean
	monitored condition639: Boolean
	monitored condition640: Boolean
	monitored condition641: Boolean
	monitored condition642: Boolean
	monitored condition643: Boolean
	monitored condition644: Boolean
	monitored condition645: Boolean
	monitored condition646: Boolean
	monitored condition647: Boolean
	monitored condition648: Boolean
	monitored condition649: Boolean
	monitored condition650: Boolean
	monitored condition651: Boolean
	monitored condition652: Boolean
	monitored condition653: Boolean
	monitored condition654: Boolean
	monitored condition655: Boolean
	monitored condition656: Boolean
	monitored condition657: Boolean
	monitored condition658: Boolean
	monitored condition659: Boolean
	monitored condition660: Boolean
	monitored condition661: Boolean
	monitored condition662: Boolean
	monitored condition663: Boolean
	monitored condition664: Boolean
	monitored condition665: Boolean
	monitored condition666: Boolean
	monitored condition667: Boolean
	monitored condition668: Boolean
	monitored condition669: Boolean
	monitored condition670: Boolean
	monitored condition671: Boolean
	monitored condition672: Boolean
	monitored condition673: Boolean
	monitored condition674: Boolean
	monitored condition675: Boolean
	monitored condition676: Boolean
	monitored condition677: Boolean
	monitored condition678: Boolean
	monitored condition679: Boolean
	monitored condition680: Boolean
	monitored condition681: Boolean
	monitored condition682: Boolean
	monitored condition683: Boolean
	monitored condition684: Boolean
	monitored condition685: Boolean
	monitored condition686: Boolean
	monitored condition687: Boolean
	monitored condition688: Boolean
	monitored condition689: Boolean
	monitored condition690: Boolean
	monitored condition691: Boolean
	monitored condition692: Boolean
	monitored condition693: Boolean
	monitored condition694: Boolean
	monitored condition695: Boolean
	monitored condition696: Boolean
	monitored condition697: Boolean
	monitored condition698: Boolean
	monitored condition699: Boolean
	monitored condition700: Boolean
	monitored condition701: Boolean
	monitored condition702: Boolean
	monitored condition703: Boolean
	monitored condition704: Boolean
	monitored condition705: Boolean
	monitored condition706: Boolean
	monitored condition707: Boolean
	monitored condition708: Boolean
	monitored condition709: Boolean
	monitored condition710: Boolean
	monitored condition711: Boolean
	monitored condition712: Boolean
	monitored condition713: Boolean
	monitored condition714: Boolean
	monitored condition715: Boolean
	monitored condition716: Boolean
	monitored condition717: Boolean
	monitored condition718: Boolean
	monitored condition719: Boolean
	monitored condition720: Boolean

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
	static capability261: Capability
	static capability262: Capability
	static capability263: Capability
	static capability264: Capability
	static capability265: Capability
	static capability266: Capability
	static capability267: Capability
	static capability268: Capability
	static capability269: Capability
	static capability270: Capability
	static capability271: Capability
	static capability272: Capability
	static capability273: Capability
	static capability274: Capability
	static capability275: Capability
	static capability276: Capability
	static capability277: Capability
	static capability278: Capability
	static capability279: Capability
	static capability280: Capability
	static capability281: Capability
	static capability282: Capability
	static capability283: Capability
	static capability284: Capability
	static capability285: Capability
	static capability286: Capability
	static capability287: Capability
	static capability288: Capability
	static capability289: Capability
	static capability290: Capability
	static capability291: Capability
	static capability292: Capability
	static capability293: Capability
	static capability294: Capability
	static capability295: Capability
	static capability296: Capability
	static capability297: Capability
	static capability298: Capability
	static capability299: Capability
	static capability300: Capability
	static capability301: Capability
	static capability302: Capability
	static capability303: Capability
	static capability304: Capability
	static capability305: Capability
	static capability306: Capability
	static capability307: Capability
	static capability308: Capability
	static capability309: Capability
	static capability310: Capability
	static capability311: Capability
	static capability312: Capability
	static capability313: Capability
	static capability314: Capability
	static capability315: Capability
	static capability316: Capability
	static capability317: Capability
	static capability318: Capability
	static capability319: Capability
	static capability320: Capability
	static capability321: Capability
	static capability322: Capability
	static capability323: Capability
	static capability324: Capability
	static capability325: Capability
	static capability326: Capability
	static capability327: Capability
	static capability328: Capability
	static capability329: Capability
	static capability330: Capability
	static capability331: Capability
	static capability332: Capability
	static capability333: Capability
	static capability334: Capability
	static capability335: Capability
	static capability336: Capability
	static capability337: Capability
	static capability338: Capability
	static capability339: Capability
	static capability340: Capability
	static capability341: Capability
	static capability342: Capability
	static capability343: Capability
	static capability344: Capability
	static capability345: Capability
	static capability346: Capability
	static capability347: Capability
	static capability348: Capability
	static capability349: Capability
	static capability350: Capability
	static capability351: Capability
	static capability352: Capability
	static capability353: Capability
	static capability354: Capability
	static capability355: Capability
	static capability356: Capability
	static capability357: Capability
	static capability358: Capability
	static capability359: Capability
	static capability360: Capability
	static capability361: Capability
	static capability362: Capability
	static capability363: Capability
	static capability364: Capability
	static capability365: Capability
	static capability366: Capability
	static capability367: Capability
	static capability368: Capability
	static capability369: Capability
	static capability370: Capability
	static capability371: Capability
	static capability372: Capability
	static capability373: Capability
	static capability374: Capability
	static capability375: Capability
	static capability376: Capability
	static capability377: Capability
	static capability378: Capability
	static capability379: Capability
	static capability380: Capability
	static capability381: Capability
	static capability382: Capability
	static capability383: Capability
	static capability384: Capability
	static capability385: Capability
	static capability386: Capability
	static capability387: Capability
	static capability388: Capability
	static capability389: Capability
	static capability390: Capability
	static capability391: Capability
	static capability392: Capability
	static capability393: Capability
	static capability394: Capability
	static capability395: Capability
	static capability396: Capability
	static capability397: Capability
	static capability398: Capability
	static capability399: Capability
	static capability400: Capability
	static capability401: Capability
	static capability402: Capability
	static capability403: Capability
	static capability404: Capability
	static capability405: Capability
	static capability406: Capability
	static capability407: Capability
	static capability408: Capability
	static capability409: Capability
	static capability410: Capability
	static capability411: Capability
	static capability412: Capability
	static capability413: Capability
	static capability414: Capability
	static capability415: Capability
	static capability416: Capability
	static capability417: Capability
	static capability418: Capability
	static capability419: Capability
	static capability420: Capability
	static capability421: Capability
	static capability422: Capability
	static capability423: Capability
	static capability424: Capability
	static capability425: Capability
	static capability426: Capability
	static capability427: Capability
	static capability428: Capability
	static capability429: Capability
	static capability430: Capability
	static capability431: Capability
	static capability432: Capability
	static capability433: Capability
	static capability434: Capability
	static capability435: Capability
	static capability436: Capability
	static capability437: Capability
	static capability438: Capability
	static capability439: Capability
	static capability440: Capability
	static capability441: Capability
	static capability442: Capability
	static capability443: Capability
	static capability444: Capability
	static capability445: Capability
	static capability446: Capability
	static capability447: Capability
	static capability448: Capability
	static capability449: Capability
	static capability450: Capability
	static capability451: Capability
	static capability452: Capability
	static capability453: Capability
	static capability454: Capability
	static capability455: Capability
	static capability456: Capability
	static capability457: Capability
	static capability458: Capability
	static capability459: Capability
	static capability460: Capability
	static capability461: Capability
	static capability462: Capability
	static capability463: Capability
	static capability464: Capability
	static capability465: Capability
	static capability466: Capability
	static capability467: Capability
	static capability468: Capability
	static capability469: Capability
	static capability470: Capability
	static capability471: Capability
	static capability472: Capability
	static capability473: Capability
	static capability474: Capability
	static capability475: Capability
	static capability476: Capability
	static capability477: Capability
	static capability478: Capability
	static capability479: Capability
	static capability480: Capability
	static capability481: Capability
	static capability482: Capability
	static capability483: Capability
	static capability484: Capability
	static capability485: Capability
	static capability486: Capability
	static capability487: Capability
	static capability488: Capability
	static capability489: Capability
	static capability490: Capability
	static capability491: Capability
	static capability492: Capability
	static capability493: Capability
	static capability494: Capability
	static capability495: Capability
	static capability496: Capability
	static capability497: Capability
	static capability498: Capability
	static capability499: Capability
	static capability500: Capability
	static capability501: Capability
	static capability502: Capability
	static capability503: Capability
	static capability504: Capability
	static capability505: Capability
	static capability506: Capability
	static capability507: Capability
	static capability508: Capability
	static capability509: Capability
	static capability510: Capability
	static capability511: Capability
	static capability512: Capability
	static capability513: Capability
	static capability514: Capability
	static capability515: Capability
	static capability516: Capability
	static capability517: Capability
	static capability518: Capability
	static capability519: Capability
	static capability520: Capability
	static capability521: Capability
	static capability522: Capability
	static capability523: Capability
	static capability524: Capability
	static capability525: Capability
	static capability526: Capability
	static capability527: Capability
	static capability528: Capability
	static capability529: Capability
	static capability530: Capability
	static capability531: Capability
	static capability532: Capability
	static capability533: Capability
	static capability534: Capability
	static capability535: Capability
	static capability536: Capability
	static capability537: Capability
	static capability538: Capability
	static capability539: Capability
	static capability540: Capability
	static capability541: Capability
	static capability542: Capability
	static capability543: Capability
	static capability544: Capability
	static capability545: Capability
	static capability546: Capability
	static capability547: Capability
	static capability548: Capability
	static capability549: Capability
	static capability550: Capability
	static capability551: Capability
	static capability552: Capability
	static capability553: Capability
	static capability554: Capability
	static capability555: Capability
	static capability556: Capability
	static capability557: Capability
	static capability558: Capability
	static capability559: Capability
	static capability560: Capability
	static capability561: Capability
	static capability562: Capability
	static capability563: Capability
	static capability564: Capability
	static capability565: Capability
	static capability566: Capability
	static capability567: Capability
	static capability568: Capability
	static capability569: Capability
	static capability570: Capability
	static capability571: Capability
	static capability572: Capability
	static capability573: Capability
	static capability574: Capability
	static capability575: Capability
	static capability576: Capability
	static capability577: Capability
	static capability578: Capability
	static capability579: Capability
	static capability580: Capability
	static capability581: Capability
	static capability582: Capability
	static capability583: Capability
	static capability584: Capability
	static capability585: Capability
	static capability586: Capability
	static capability587: Capability
	static capability588: Capability
	static capability589: Capability
	static capability590: Capability
	static capability591: Capability
	static capability592: Capability
	static capability593: Capability
	static capability594: Capability
	static capability595: Capability
	static capability596: Capability
	static capability597: Capability
	static capability598: Capability
	static capability599: Capability
	static capability600: Capability
	static capability601: Capability
	static capability602: Capability
	static capability603: Capability
	static capability604: Capability
	static capability605: Capability
	static capability606: Capability
	static capability607: Capability
	static capability608: Capability
	static capability609: Capability
	static capability610: Capability
	static capability611: Capability
	static capability612: Capability
	static capability613: Capability
	static capability614: Capability
	static capability615: Capability
	static capability616: Capability
	static capability617: Capability
	static capability618: Capability
	static capability619: Capability
	static capability620: Capability
	static capability621: Capability
	static capability622: Capability
	static capability623: Capability
	static capability624: Capability
	static capability625: Capability
	static capability626: Capability
	static capability627: Capability
	static capability628: Capability
	static capability629: Capability
	static capability630: Capability
	static capability631: Capability
	static capability632: Capability
	static capability633: Capability
	static capability634: Capability
	static capability635: Capability
	static capability636: Capability
	static capability637: Capability
	static capability638: Capability
	static capability639: Capability
	static capability640: Capability
	static capability641: Capability
	static capability642: Capability
	static capability643: Capability
	static capability644: Capability
	static capability645: Capability
	static capability646: Capability
	static capability647: Capability
	static capability648: Capability
	static capability649: Capability
	static capability650: Capability
	static capability651: Capability
	static capability652: Capability
	static capability653: Capability
	static capability654: Capability
	static capability655: Capability
	static capability656: Capability
	static capability657: Capability
	static capability658: Capability
	static capability659: Capability
	static capability660: Capability
	static capability661: Capability
	static capability662: Capability
	static capability663: Capability
	static capability664: Capability
	static capability665: Capability
	static capability666: Capability
	static capability667: Capability
	static capability668: Capability
	static capability669: Capability
	static capability670: Capability
	static capability671: Capability
	static capability672: Capability
	static capability673: Capability
	static capability674: Capability
	static capability675: Capability
	static capability676: Capability
	static capability677: Capability
	static capability678: Capability
	static capability679: Capability
	static capability680: Capability
	static capability681: Capability
	static capability682: Capability
	static capability683: Capability
	static capability684: Capability
	static capability685: Capability
	static capability686: Capability
	static capability687: Capability
	static capability688: Capability
	static capability689: Capability
	static capability690: Capability
	static capability691: Capability
	static capability692: Capability
	static capability693: Capability
	static capability694: Capability
	static capability695: Capability
	static capability696: Capability
	static capability697: Capability
	static capability698: Capability
	static capability699: Capability
	static capability700: Capability
	static capability701: Capability
	static capability702: Capability
	static capability703: Capability
	static capability704: Capability
	static capability705: Capability
	static capability706: Capability
	static capability707: Capability
	static capability708: Capability
	static capability709: Capability
	static capability710: Capability
	static capability711: Capability
	static capability712: Capability
	static capability713: Capability
	static capability714: Capability
	static capability715: Capability
	static capability716: Capability
	static capability717: Capability
	static capability718: Capability
	static capability719: Capability
	static capability720: Capability

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
		case capability261: CAPABILITY261
		case capability262: CAPABILITY262
		case capability263: CAPABILITY263
		case capability264: CAPABILITY264
		case capability265: CAPABILITY265
		case capability266: CAPABILITY266
		case capability267: CAPABILITY267
		case capability268: CAPABILITY268
		case capability269: CAPABILITY269
		case capability270: CAPABILITY270
		case capability271: CAPABILITY271
		case capability272: CAPABILITY272
		case capability273: CAPABILITY273
		case capability274: CAPABILITY274
		case capability275: CAPABILITY275
		case capability276: CAPABILITY276
		case capability277: CAPABILITY277
		case capability278: CAPABILITY278
		case capability279: CAPABILITY279
		case capability280: CAPABILITY280
		case capability281: CAPABILITY281
		case capability282: CAPABILITY282
		case capability283: CAPABILITY283
		case capability284: CAPABILITY284
		case capability285: CAPABILITY285
		case capability286: CAPABILITY286
		case capability287: CAPABILITY287
		case capability288: CAPABILITY288
		case capability289: CAPABILITY289
		case capability290: CAPABILITY290
		case capability291: CAPABILITY291
		case capability292: CAPABILITY292
		case capability293: CAPABILITY293
		case capability294: CAPABILITY294
		case capability295: CAPABILITY295
		case capability296: CAPABILITY296
		case capability297: CAPABILITY297
		case capability298: CAPABILITY298
		case capability299: CAPABILITY299
		case capability300: CAPABILITY300
		case capability301: CAPABILITY301
		case capability302: CAPABILITY302
		case capability303: CAPABILITY303
		case capability304: CAPABILITY304
		case capability305: CAPABILITY305
		case capability306: CAPABILITY306
		case capability307: CAPABILITY307
		case capability308: CAPABILITY308
		case capability309: CAPABILITY309
		case capability310: CAPABILITY310
		case capability311: CAPABILITY311
		case capability312: CAPABILITY312
		case capability313: CAPABILITY313
		case capability314: CAPABILITY314
		case capability315: CAPABILITY315
		case capability316: CAPABILITY316
		case capability317: CAPABILITY317
		case capability318: CAPABILITY318
		case capability319: CAPABILITY319
		case capability320: CAPABILITY320
		case capability321: CAPABILITY321
		case capability322: CAPABILITY322
		case capability323: CAPABILITY323
		case capability324: CAPABILITY324
		case capability325: CAPABILITY325
		case capability326: CAPABILITY326
		case capability327: CAPABILITY327
		case capability328: CAPABILITY328
		case capability329: CAPABILITY329
		case capability330: CAPABILITY330
		case capability331: CAPABILITY331
		case capability332: CAPABILITY332
		case capability333: CAPABILITY333
		case capability334: CAPABILITY334
		case capability335: CAPABILITY335
		case capability336: CAPABILITY336
		case capability337: CAPABILITY337
		case capability338: CAPABILITY338
		case capability339: CAPABILITY339
		case capability340: CAPABILITY340
		case capability341: CAPABILITY341
		case capability342: CAPABILITY342
		case capability343: CAPABILITY343
		case capability344: CAPABILITY344
		case capability345: CAPABILITY345
		case capability346: CAPABILITY346
		case capability347: CAPABILITY347
		case capability348: CAPABILITY348
		case capability349: CAPABILITY349
		case capability350: CAPABILITY350
		case capability351: CAPABILITY351
		case capability352: CAPABILITY352
		case capability353: CAPABILITY353
		case capability354: CAPABILITY354
		case capability355: CAPABILITY355
		case capability356: CAPABILITY356
		case capability357: CAPABILITY357
		case capability358: CAPABILITY358
		case capability359: CAPABILITY359
		case capability360: CAPABILITY360
		case capability361: CAPABILITY361
		case capability362: CAPABILITY362
		case capability363: CAPABILITY363
		case capability364: CAPABILITY364
		case capability365: CAPABILITY365
		case capability366: CAPABILITY366
		case capability367: CAPABILITY367
		case capability368: CAPABILITY368
		case capability369: CAPABILITY369
		case capability370: CAPABILITY370
		case capability371: CAPABILITY371
		case capability372: CAPABILITY372
		case capability373: CAPABILITY373
		case capability374: CAPABILITY374
		case capability375: CAPABILITY375
		case capability376: CAPABILITY376
		case capability377: CAPABILITY377
		case capability378: CAPABILITY378
		case capability379: CAPABILITY379
		case capability380: CAPABILITY380
		case capability381: CAPABILITY381
		case capability382: CAPABILITY382
		case capability383: CAPABILITY383
		case capability384: CAPABILITY384
		case capability385: CAPABILITY385
		case capability386: CAPABILITY386
		case capability387: CAPABILITY387
		case capability388: CAPABILITY388
		case capability389: CAPABILITY389
		case capability390: CAPABILITY390
		case capability391: CAPABILITY391
		case capability392: CAPABILITY392
		case capability393: CAPABILITY393
		case capability394: CAPABILITY394
		case capability395: CAPABILITY395
		case capability396: CAPABILITY396
		case capability397: CAPABILITY397
		case capability398: CAPABILITY398
		case capability399: CAPABILITY399
		case capability400: CAPABILITY400
		case capability401: CAPABILITY401
		case capability402: CAPABILITY402
		case capability403: CAPABILITY403
		case capability404: CAPABILITY404
		case capability405: CAPABILITY405
		case capability406: CAPABILITY406
		case capability407: CAPABILITY407
		case capability408: CAPABILITY408
		case capability409: CAPABILITY409
		case capability410: CAPABILITY410
		case capability411: CAPABILITY411
		case capability412: CAPABILITY412
		case capability413: CAPABILITY413
		case capability414: CAPABILITY414
		case capability415: CAPABILITY415
		case capability416: CAPABILITY416
		case capability417: CAPABILITY417
		case capability418: CAPABILITY418
		case capability419: CAPABILITY419
		case capability420: CAPABILITY420
		case capability421: CAPABILITY421
		case capability422: CAPABILITY422
		case capability423: CAPABILITY423
		case capability424: CAPABILITY424
		case capability425: CAPABILITY425
		case capability426: CAPABILITY426
		case capability427: CAPABILITY427
		case capability428: CAPABILITY428
		case capability429: CAPABILITY429
		case capability430: CAPABILITY430
		case capability431: CAPABILITY431
		case capability432: CAPABILITY432
		case capability433: CAPABILITY433
		case capability434: CAPABILITY434
		case capability435: CAPABILITY435
		case capability436: CAPABILITY436
		case capability437: CAPABILITY437
		case capability438: CAPABILITY438
		case capability439: CAPABILITY439
		case capability440: CAPABILITY440
		case capability441: CAPABILITY441
		case capability442: CAPABILITY442
		case capability443: CAPABILITY443
		case capability444: CAPABILITY444
		case capability445: CAPABILITY445
		case capability446: CAPABILITY446
		case capability447: CAPABILITY447
		case capability448: CAPABILITY448
		case capability449: CAPABILITY449
		case capability450: CAPABILITY450
		case capability451: CAPABILITY451
		case capability452: CAPABILITY452
		case capability453: CAPABILITY453
		case capability454: CAPABILITY454
		case capability455: CAPABILITY455
		case capability456: CAPABILITY456
		case capability457: CAPABILITY457
		case capability458: CAPABILITY458
		case capability459: CAPABILITY459
		case capability460: CAPABILITY460
		case capability461: CAPABILITY461
		case capability462: CAPABILITY462
		case capability463: CAPABILITY463
		case capability464: CAPABILITY464
		case capability465: CAPABILITY465
		case capability466: CAPABILITY466
		case capability467: CAPABILITY467
		case capability468: CAPABILITY468
		case capability469: CAPABILITY469
		case capability470: CAPABILITY470
		case capability471: CAPABILITY471
		case capability472: CAPABILITY472
		case capability473: CAPABILITY473
		case capability474: CAPABILITY474
		case capability475: CAPABILITY475
		case capability476: CAPABILITY476
		case capability477: CAPABILITY477
		case capability478: CAPABILITY478
		case capability479: CAPABILITY479
		case capability480: CAPABILITY480
		case capability481: CAPABILITY481
		case capability482: CAPABILITY482
		case capability483: CAPABILITY483
		case capability484: CAPABILITY484
		case capability485: CAPABILITY485
		case capability486: CAPABILITY486
		case capability487: CAPABILITY487
		case capability488: CAPABILITY488
		case capability489: CAPABILITY489
		case capability490: CAPABILITY490
		case capability491: CAPABILITY491
		case capability492: CAPABILITY492
		case capability493: CAPABILITY493
		case capability494: CAPABILITY494
		case capability495: CAPABILITY495
		case capability496: CAPABILITY496
		case capability497: CAPABILITY497
		case capability498: CAPABILITY498
		case capability499: CAPABILITY499
		case capability500: CAPABILITY500
		case capability501: CAPABILITY501
		case capability502: CAPABILITY502
		case capability503: CAPABILITY503
		case capability504: CAPABILITY504
		case capability505: CAPABILITY505
		case capability506: CAPABILITY506
		case capability507: CAPABILITY507
		case capability508: CAPABILITY508
		case capability509: CAPABILITY509
		case capability510: CAPABILITY510
		case capability511: CAPABILITY511
		case capability512: CAPABILITY512
		case capability513: CAPABILITY513
		case capability514: CAPABILITY514
		case capability515: CAPABILITY515
		case capability516: CAPABILITY516
		case capability517: CAPABILITY517
		case capability518: CAPABILITY518
		case capability519: CAPABILITY519
		case capability520: CAPABILITY520
		case capability521: CAPABILITY521
		case capability522: CAPABILITY522
		case capability523: CAPABILITY523
		case capability524: CAPABILITY524
		case capability525: CAPABILITY525
		case capability526: CAPABILITY526
		case capability527: CAPABILITY527
		case capability528: CAPABILITY528
		case capability529: CAPABILITY529
		case capability530: CAPABILITY530
		case capability531: CAPABILITY531
		case capability532: CAPABILITY532
		case capability533: CAPABILITY533
		case capability534: CAPABILITY534
		case capability535: CAPABILITY535
		case capability536: CAPABILITY536
		case capability537: CAPABILITY537
		case capability538: CAPABILITY538
		case capability539: CAPABILITY539
		case capability540: CAPABILITY540
		case capability541: CAPABILITY541
		case capability542: CAPABILITY542
		case capability543: CAPABILITY543
		case capability544: CAPABILITY544
		case capability545: CAPABILITY545
		case capability546: CAPABILITY546
		case capability547: CAPABILITY547
		case capability548: CAPABILITY548
		case capability549: CAPABILITY549
		case capability550: CAPABILITY550
		case capability551: CAPABILITY551
		case capability552: CAPABILITY552
		case capability553: CAPABILITY553
		case capability554: CAPABILITY554
		case capability555: CAPABILITY555
		case capability556: CAPABILITY556
		case capability557: CAPABILITY557
		case capability558: CAPABILITY558
		case capability559: CAPABILITY559
		case capability560: CAPABILITY560
		case capability561: CAPABILITY561
		case capability562: CAPABILITY562
		case capability563: CAPABILITY563
		case capability564: CAPABILITY564
		case capability565: CAPABILITY565
		case capability566: CAPABILITY566
		case capability567: CAPABILITY567
		case capability568: CAPABILITY568
		case capability569: CAPABILITY569
		case capability570: CAPABILITY570
		case capability571: CAPABILITY571
		case capability572: CAPABILITY572
		case capability573: CAPABILITY573
		case capability574: CAPABILITY574
		case capability575: CAPABILITY575
		case capability576: CAPABILITY576
		case capability577: CAPABILITY577
		case capability578: CAPABILITY578
		case capability579: CAPABILITY579
		case capability580: CAPABILITY580
		case capability581: CAPABILITY581
		case capability582: CAPABILITY582
		case capability583: CAPABILITY583
		case capability584: CAPABILITY584
		case capability585: CAPABILITY585
		case capability586: CAPABILITY586
		case capability587: CAPABILITY587
		case capability588: CAPABILITY588
		case capability589: CAPABILITY589
		case capability590: CAPABILITY590
		case capability591: CAPABILITY591
		case capability592: CAPABILITY592
		case capability593: CAPABILITY593
		case capability594: CAPABILITY594
		case capability595: CAPABILITY595
		case capability596: CAPABILITY596
		case capability597: CAPABILITY597
		case capability598: CAPABILITY598
		case capability599: CAPABILITY599
		case capability600: CAPABILITY600
		case capability601: CAPABILITY601
		case capability602: CAPABILITY602
		case capability603: CAPABILITY603
		case capability604: CAPABILITY604
		case capability605: CAPABILITY605
		case capability606: CAPABILITY606
		case capability607: CAPABILITY607
		case capability608: CAPABILITY608
		case capability609: CAPABILITY609
		case capability610: CAPABILITY610
		case capability611: CAPABILITY611
		case capability612: CAPABILITY612
		case capability613: CAPABILITY613
		case capability614: CAPABILITY614
		case capability615: CAPABILITY615
		case capability616: CAPABILITY616
		case capability617: CAPABILITY617
		case capability618: CAPABILITY618
		case capability619: CAPABILITY619
		case capability620: CAPABILITY620
		case capability621: CAPABILITY621
		case capability622: CAPABILITY622
		case capability623: CAPABILITY623
		case capability624: CAPABILITY624
		case capability625: CAPABILITY625
		case capability626: CAPABILITY626
		case capability627: CAPABILITY627
		case capability628: CAPABILITY628
		case capability629: CAPABILITY629
		case capability630: CAPABILITY630
		case capability631: CAPABILITY631
		case capability632: CAPABILITY632
		case capability633: CAPABILITY633
		case capability634: CAPABILITY634
		case capability635: CAPABILITY635
		case capability636: CAPABILITY636
		case capability637: CAPABILITY637
		case capability638: CAPABILITY638
		case capability639: CAPABILITY639
		case capability640: CAPABILITY640
		case capability641: CAPABILITY641
		case capability642: CAPABILITY642
		case capability643: CAPABILITY643
		case capability644: CAPABILITY644
		case capability645: CAPABILITY645
		case capability646: CAPABILITY646
		case capability647: CAPABILITY647
		case capability648: CAPABILITY648
		case capability649: CAPABILITY649
		case capability650: CAPABILITY650
		case capability651: CAPABILITY651
		case capability652: CAPABILITY652
		case capability653: CAPABILITY653
		case capability654: CAPABILITY654
		case capability655: CAPABILITY655
		case capability656: CAPABILITY656
		case capability657: CAPABILITY657
		case capability658: CAPABILITY658
		case capability659: CAPABILITY659
		case capability660: CAPABILITY660
		case capability661: CAPABILITY661
		case capability662: CAPABILITY662
		case capability663: CAPABILITY663
		case capability664: CAPABILITY664
		case capability665: CAPABILITY665
		case capability666: CAPABILITY666
		case capability667: CAPABILITY667
		case capability668: CAPABILITY668
		case capability669: CAPABILITY669
		case capability670: CAPABILITY670
		case capability671: CAPABILITY671
		case capability672: CAPABILITY672
		case capability673: CAPABILITY673
		case capability674: CAPABILITY674
		case capability675: CAPABILITY675
		case capability676: CAPABILITY676
		case capability677: CAPABILITY677
		case capability678: CAPABILITY678
		case capability679: CAPABILITY679
		case capability680: CAPABILITY680
		case capability681: CAPABILITY681
		case capability682: CAPABILITY682
		case capability683: CAPABILITY683
		case capability684: CAPABILITY684
		case capability685: CAPABILITY685
		case capability686: CAPABILITY686
		case capability687: CAPABILITY687
		case capability688: CAPABILITY688
		case capability689: CAPABILITY689
		case capability690: CAPABILITY690
		case capability691: CAPABILITY691
		case capability692: CAPABILITY692
		case capability693: CAPABILITY693
		case capability694: CAPABILITY694
		case capability695: CAPABILITY695
		case capability696: CAPABILITY696
		case capability697: CAPABILITY697
		case capability698: CAPABILITY698
		case capability699: CAPABILITY699
		case capability700: CAPABILITY700
		case capability701: CAPABILITY701
		case capability702: CAPABILITY702
		case capability703: CAPABILITY703
		case capability704: CAPABILITY704
		case capability705: CAPABILITY705
		case capability706: CAPABILITY706
		case capability707: CAPABILITY707
		case capability708: CAPABILITY708
		case capability709: CAPABILITY709
		case capability710: CAPABILITY710
		case capability711: CAPABILITY711
		case capability712: CAPABILITY712
		case capability713: CAPABILITY713
		case capability714: CAPABILITY714
		case capability715: CAPABILITY715
		case capability716: CAPABILITY716
		case capability717: CAPABILITY717
		case capability718: CAPABILITY718
		case capability719: CAPABILITY719
		case capability720: CAPABILITY720
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
	rule r_obligation261 = r_setObligation[capability261]
	rule r_obligation262 = r_setObligation[capability262]
	rule r_obligation263 = r_setObligation[capability263]
	rule r_obligation264 = r_setObligation[capability264]
	rule r_obligation265 = r_setObligation[capability265]
	rule r_obligation266 = r_setObligation[capability266]
	rule r_obligation267 = r_setObligation[capability267]
	rule r_obligation268 = r_setObligation[capability268]
	rule r_obligation269 = r_setObligation[capability269]
	rule r_obligation270 = r_setObligation[capability270]
	rule r_obligation271 = r_setObligation[capability271]
	rule r_obligation272 = r_setObligation[capability272]
	rule r_obligation273 = r_setObligation[capability273]
	rule r_obligation274 = r_setObligation[capability274]
	rule r_obligation275 = r_setObligation[capability275]
	rule r_obligation276 = r_setObligation[capability276]
	rule r_obligation277 = r_setObligation[capability277]
	rule r_obligation278 = r_setObligation[capability278]
	rule r_obligation279 = r_setObligation[capability279]
	rule r_obligation280 = r_setObligation[capability280]
	rule r_obligation281 = r_setObligation[capability281]
	rule r_obligation282 = r_setObligation[capability282]
	rule r_obligation283 = r_setObligation[capability283]
	rule r_obligation284 = r_setObligation[capability284]
	rule r_obligation285 = r_setObligation[capability285]
	rule r_obligation286 = r_setObligation[capability286]
	rule r_obligation287 = r_setObligation[capability287]
	rule r_obligation288 = r_setObligation[capability288]
	rule r_obligation289 = r_setObligation[capability289]
	rule r_obligation290 = r_setObligation[capability290]
	rule r_obligation291 = r_setObligation[capability291]
	rule r_obligation292 = r_setObligation[capability292]
	rule r_obligation293 = r_setObligation[capability293]
	rule r_obligation294 = r_setObligation[capability294]
	rule r_obligation295 = r_setObligation[capability295]
	rule r_obligation296 = r_setObligation[capability296]
	rule r_obligation297 = r_setObligation[capability297]
	rule r_obligation298 = r_setObligation[capability298]
	rule r_obligation299 = r_setObligation[capability299]
	rule r_obligation300 = r_setObligation[capability300]
	rule r_obligation301 = r_setObligation[capability301]
	rule r_obligation302 = r_setObligation[capability302]
	rule r_obligation303 = r_setObligation[capability303]
	rule r_obligation304 = r_setObligation[capability304]
	rule r_obligation305 = r_setObligation[capability305]
	rule r_obligation306 = r_setObligation[capability306]
	rule r_obligation307 = r_setObligation[capability307]
	rule r_obligation308 = r_setObligation[capability308]
	rule r_obligation309 = r_setObligation[capability309]
	rule r_obligation310 = r_setObligation[capability310]
	rule r_obligation311 = r_setObligation[capability311]
	rule r_obligation312 = r_setObligation[capability312]
	rule r_obligation313 = r_setObligation[capability313]
	rule r_obligation314 = r_setObligation[capability314]
	rule r_obligation315 = r_setObligation[capability315]
	rule r_obligation316 = r_setObligation[capability316]
	rule r_obligation317 = r_setObligation[capability317]
	rule r_obligation318 = r_setObligation[capability318]
	rule r_obligation319 = r_setObligation[capability319]
	rule r_obligation320 = r_setObligation[capability320]
	rule r_obligation321 = r_setObligation[capability321]
	rule r_obligation322 = r_setObligation[capability322]
	rule r_obligation323 = r_setObligation[capability323]
	rule r_obligation324 = r_setObligation[capability324]
	rule r_obligation325 = r_setObligation[capability325]
	rule r_obligation326 = r_setObligation[capability326]
	rule r_obligation327 = r_setObligation[capability327]
	rule r_obligation328 = r_setObligation[capability328]
	rule r_obligation329 = r_setObligation[capability329]
	rule r_obligation330 = r_setObligation[capability330]
	rule r_obligation331 = r_setObligation[capability331]
	rule r_obligation332 = r_setObligation[capability332]
	rule r_obligation333 = r_setObligation[capability333]
	rule r_obligation334 = r_setObligation[capability334]
	rule r_obligation335 = r_setObligation[capability335]
	rule r_obligation336 = r_setObligation[capability336]
	rule r_obligation337 = r_setObligation[capability337]
	rule r_obligation338 = r_setObligation[capability338]
	rule r_obligation339 = r_setObligation[capability339]
	rule r_obligation340 = r_setObligation[capability340]
	rule r_obligation341 = r_setObligation[capability341]
	rule r_obligation342 = r_setObligation[capability342]
	rule r_obligation343 = r_setObligation[capability343]
	rule r_obligation344 = r_setObligation[capability344]
	rule r_obligation345 = r_setObligation[capability345]
	rule r_obligation346 = r_setObligation[capability346]
	rule r_obligation347 = r_setObligation[capability347]
	rule r_obligation348 = r_setObligation[capability348]
	rule r_obligation349 = r_setObligation[capability349]
	rule r_obligation350 = r_setObligation[capability350]
	rule r_obligation351 = r_setObligation[capability351]
	rule r_obligation352 = r_setObligation[capability352]
	rule r_obligation353 = r_setObligation[capability353]
	rule r_obligation354 = r_setObligation[capability354]
	rule r_obligation355 = r_setObligation[capability355]
	rule r_obligation356 = r_setObligation[capability356]
	rule r_obligation357 = r_setObligation[capability357]
	rule r_obligation358 = r_setObligation[capability358]
	rule r_obligation359 = r_setObligation[capability359]
	rule r_obligation360 = r_setObligation[capability360]
	rule r_obligation361 = r_setObligation[capability361]
	rule r_obligation362 = r_setObligation[capability362]
	rule r_obligation363 = r_setObligation[capability363]
	rule r_obligation364 = r_setObligation[capability364]
	rule r_obligation365 = r_setObligation[capability365]
	rule r_obligation366 = r_setObligation[capability366]
	rule r_obligation367 = r_setObligation[capability367]
	rule r_obligation368 = r_setObligation[capability368]
	rule r_obligation369 = r_setObligation[capability369]
	rule r_obligation370 = r_setObligation[capability370]
	rule r_obligation371 = r_setObligation[capability371]
	rule r_obligation372 = r_setObligation[capability372]
	rule r_obligation373 = r_setObligation[capability373]
	rule r_obligation374 = r_setObligation[capability374]
	rule r_obligation375 = r_setObligation[capability375]
	rule r_obligation376 = r_setObligation[capability376]
	rule r_obligation377 = r_setObligation[capability377]
	rule r_obligation378 = r_setObligation[capability378]
	rule r_obligation379 = r_setObligation[capability379]
	rule r_obligation380 = r_setObligation[capability380]
	rule r_obligation381 = r_setObligation[capability381]
	rule r_obligation382 = r_setObligation[capability382]
	rule r_obligation383 = r_setObligation[capability383]
	rule r_obligation384 = r_setObligation[capability384]
	rule r_obligation385 = r_setObligation[capability385]
	rule r_obligation386 = r_setObligation[capability386]
	rule r_obligation387 = r_setObligation[capability387]
	rule r_obligation388 = r_setObligation[capability388]
	rule r_obligation389 = r_setObligation[capability389]
	rule r_obligation390 = r_setObligation[capability390]
	rule r_obligation391 = r_setObligation[capability391]
	rule r_obligation392 = r_setObligation[capability392]
	rule r_obligation393 = r_setObligation[capability393]
	rule r_obligation394 = r_setObligation[capability394]
	rule r_obligation395 = r_setObligation[capability395]
	rule r_obligation396 = r_setObligation[capability396]
	rule r_obligation397 = r_setObligation[capability397]
	rule r_obligation398 = r_setObligation[capability398]
	rule r_obligation399 = r_setObligation[capability399]
	rule r_obligation400 = r_setObligation[capability400]
	rule r_obligation401 = r_setObligation[capability401]
	rule r_obligation402 = r_setObligation[capability402]
	rule r_obligation403 = r_setObligation[capability403]
	rule r_obligation404 = r_setObligation[capability404]
	rule r_obligation405 = r_setObligation[capability405]
	rule r_obligation406 = r_setObligation[capability406]
	rule r_obligation407 = r_setObligation[capability407]
	rule r_obligation408 = r_setObligation[capability408]
	rule r_obligation409 = r_setObligation[capability409]
	rule r_obligation410 = r_setObligation[capability410]
	rule r_obligation411 = r_setObligation[capability411]
	rule r_obligation412 = r_setObligation[capability412]
	rule r_obligation413 = r_setObligation[capability413]
	rule r_obligation414 = r_setObligation[capability414]
	rule r_obligation415 = r_setObligation[capability415]
	rule r_obligation416 = r_setObligation[capability416]
	rule r_obligation417 = r_setObligation[capability417]
	rule r_obligation418 = r_setObligation[capability418]
	rule r_obligation419 = r_setObligation[capability419]
	rule r_obligation420 = r_setObligation[capability420]
	rule r_obligation421 = r_setObligation[capability421]
	rule r_obligation422 = r_setObligation[capability422]
	rule r_obligation423 = r_setObligation[capability423]
	rule r_obligation424 = r_setObligation[capability424]
	rule r_obligation425 = r_setObligation[capability425]
	rule r_obligation426 = r_setObligation[capability426]
	rule r_obligation427 = r_setObligation[capability427]
	rule r_obligation428 = r_setObligation[capability428]
	rule r_obligation429 = r_setObligation[capability429]
	rule r_obligation430 = r_setObligation[capability430]
	rule r_obligation431 = r_setObligation[capability431]
	rule r_obligation432 = r_setObligation[capability432]
	rule r_obligation433 = r_setObligation[capability433]
	rule r_obligation434 = r_setObligation[capability434]
	rule r_obligation435 = r_setObligation[capability435]
	rule r_obligation436 = r_setObligation[capability436]
	rule r_obligation437 = r_setObligation[capability437]
	rule r_obligation438 = r_setObligation[capability438]
	rule r_obligation439 = r_setObligation[capability439]
	rule r_obligation440 = r_setObligation[capability440]
	rule r_obligation441 = r_setObligation[capability441]
	rule r_obligation442 = r_setObligation[capability442]
	rule r_obligation443 = r_setObligation[capability443]
	rule r_obligation444 = r_setObligation[capability444]
	rule r_obligation445 = r_setObligation[capability445]
	rule r_obligation446 = r_setObligation[capability446]
	rule r_obligation447 = r_setObligation[capability447]
	rule r_obligation448 = r_setObligation[capability448]
	rule r_obligation449 = r_setObligation[capability449]
	rule r_obligation450 = r_setObligation[capability450]
	rule r_obligation451 = r_setObligation[capability451]
	rule r_obligation452 = r_setObligation[capability452]
	rule r_obligation453 = r_setObligation[capability453]
	rule r_obligation454 = r_setObligation[capability454]
	rule r_obligation455 = r_setObligation[capability455]
	rule r_obligation456 = r_setObligation[capability456]
	rule r_obligation457 = r_setObligation[capability457]
	rule r_obligation458 = r_setObligation[capability458]
	rule r_obligation459 = r_setObligation[capability459]
	rule r_obligation460 = r_setObligation[capability460]
	rule r_obligation461 = r_setObligation[capability461]
	rule r_obligation462 = r_setObligation[capability462]
	rule r_obligation463 = r_setObligation[capability463]
	rule r_obligation464 = r_setObligation[capability464]
	rule r_obligation465 = r_setObligation[capability465]
	rule r_obligation466 = r_setObligation[capability466]
	rule r_obligation467 = r_setObligation[capability467]
	rule r_obligation468 = r_setObligation[capability468]
	rule r_obligation469 = r_setObligation[capability469]
	rule r_obligation470 = r_setObligation[capability470]
	rule r_obligation471 = r_setObligation[capability471]
	rule r_obligation472 = r_setObligation[capability472]
	rule r_obligation473 = r_setObligation[capability473]
	rule r_obligation474 = r_setObligation[capability474]
	rule r_obligation475 = r_setObligation[capability475]
	rule r_obligation476 = r_setObligation[capability476]
	rule r_obligation477 = r_setObligation[capability477]
	rule r_obligation478 = r_setObligation[capability478]
	rule r_obligation479 = r_setObligation[capability479]
	rule r_obligation480 = r_setObligation[capability480]
	rule r_obligation481 = r_setObligation[capability481]
	rule r_obligation482 = r_setObligation[capability482]
	rule r_obligation483 = r_setObligation[capability483]
	rule r_obligation484 = r_setObligation[capability484]
	rule r_obligation485 = r_setObligation[capability485]
	rule r_obligation486 = r_setObligation[capability486]
	rule r_obligation487 = r_setObligation[capability487]
	rule r_obligation488 = r_setObligation[capability488]
	rule r_obligation489 = r_setObligation[capability489]
	rule r_obligation490 = r_setObligation[capability490]
	rule r_obligation491 = r_setObligation[capability491]
	rule r_obligation492 = r_setObligation[capability492]
	rule r_obligation493 = r_setObligation[capability493]
	rule r_obligation494 = r_setObligation[capability494]
	rule r_obligation495 = r_setObligation[capability495]
	rule r_obligation496 = r_setObligation[capability496]
	rule r_obligation497 = r_setObligation[capability497]
	rule r_obligation498 = r_setObligation[capability498]
	rule r_obligation499 = r_setObligation[capability499]
	rule r_obligation500 = r_setObligation[capability500]
	rule r_obligation501 = r_setObligation[capability501]
	rule r_obligation502 = r_setObligation[capability502]
	rule r_obligation503 = r_setObligation[capability503]
	rule r_obligation504 = r_setObligation[capability504]
	rule r_obligation505 = r_setObligation[capability505]
	rule r_obligation506 = r_setObligation[capability506]
	rule r_obligation507 = r_setObligation[capability507]
	rule r_obligation508 = r_setObligation[capability508]
	rule r_obligation509 = r_setObligation[capability509]
	rule r_obligation510 = r_setObligation[capability510]
	rule r_obligation511 = r_setObligation[capability511]
	rule r_obligation512 = r_setObligation[capability512]
	rule r_obligation513 = r_setObligation[capability513]
	rule r_obligation514 = r_setObligation[capability514]
	rule r_obligation515 = r_setObligation[capability515]
	rule r_obligation516 = r_setObligation[capability516]
	rule r_obligation517 = r_setObligation[capability517]
	rule r_obligation518 = r_setObligation[capability518]
	rule r_obligation519 = r_setObligation[capability519]
	rule r_obligation520 = r_setObligation[capability520]
	rule r_obligation521 = r_setObligation[capability521]
	rule r_obligation522 = r_setObligation[capability522]
	rule r_obligation523 = r_setObligation[capability523]
	rule r_obligation524 = r_setObligation[capability524]
	rule r_obligation525 = r_setObligation[capability525]
	rule r_obligation526 = r_setObligation[capability526]
	rule r_obligation527 = r_setObligation[capability527]
	rule r_obligation528 = r_setObligation[capability528]
	rule r_obligation529 = r_setObligation[capability529]
	rule r_obligation530 = r_setObligation[capability530]
	rule r_obligation531 = r_setObligation[capability531]
	rule r_obligation532 = r_setObligation[capability532]
	rule r_obligation533 = r_setObligation[capability533]
	rule r_obligation534 = r_setObligation[capability534]
	rule r_obligation535 = r_setObligation[capability535]
	rule r_obligation536 = r_setObligation[capability536]
	rule r_obligation537 = r_setObligation[capability537]
	rule r_obligation538 = r_setObligation[capability538]
	rule r_obligation539 = r_setObligation[capability539]
	rule r_obligation540 = r_setObligation[capability540]
	rule r_obligation541 = r_setObligation[capability541]
	rule r_obligation542 = r_setObligation[capability542]
	rule r_obligation543 = r_setObligation[capability543]
	rule r_obligation544 = r_setObligation[capability544]
	rule r_obligation545 = r_setObligation[capability545]
	rule r_obligation546 = r_setObligation[capability546]
	rule r_obligation547 = r_setObligation[capability547]
	rule r_obligation548 = r_setObligation[capability548]
	rule r_obligation549 = r_setObligation[capability549]
	rule r_obligation550 = r_setObligation[capability550]
	rule r_obligation551 = r_setObligation[capability551]
	rule r_obligation552 = r_setObligation[capability552]
	rule r_obligation553 = r_setObligation[capability553]
	rule r_obligation554 = r_setObligation[capability554]
	rule r_obligation555 = r_setObligation[capability555]
	rule r_obligation556 = r_setObligation[capability556]
	rule r_obligation557 = r_setObligation[capability557]
	rule r_obligation558 = r_setObligation[capability558]
	rule r_obligation559 = r_setObligation[capability559]
	rule r_obligation560 = r_setObligation[capability560]
	rule r_obligation561 = r_setObligation[capability561]
	rule r_obligation562 = r_setObligation[capability562]
	rule r_obligation563 = r_setObligation[capability563]
	rule r_obligation564 = r_setObligation[capability564]
	rule r_obligation565 = r_setObligation[capability565]
	rule r_obligation566 = r_setObligation[capability566]
	rule r_obligation567 = r_setObligation[capability567]
	rule r_obligation568 = r_setObligation[capability568]
	rule r_obligation569 = r_setObligation[capability569]
	rule r_obligation570 = r_setObligation[capability570]
	rule r_obligation571 = r_setObligation[capability571]
	rule r_obligation572 = r_setObligation[capability572]
	rule r_obligation573 = r_setObligation[capability573]
	rule r_obligation574 = r_setObligation[capability574]
	rule r_obligation575 = r_setObligation[capability575]
	rule r_obligation576 = r_setObligation[capability576]
	rule r_obligation577 = r_setObligation[capability577]
	rule r_obligation578 = r_setObligation[capability578]
	rule r_obligation579 = r_setObligation[capability579]
	rule r_obligation580 = r_setObligation[capability580]
	rule r_obligation581 = r_setObligation[capability581]
	rule r_obligation582 = r_setObligation[capability582]
	rule r_obligation583 = r_setObligation[capability583]
	rule r_obligation584 = r_setObligation[capability584]
	rule r_obligation585 = r_setObligation[capability585]
	rule r_obligation586 = r_setObligation[capability586]
	rule r_obligation587 = r_setObligation[capability587]
	rule r_obligation588 = r_setObligation[capability588]
	rule r_obligation589 = r_setObligation[capability589]
	rule r_obligation590 = r_setObligation[capability590]
	rule r_obligation591 = r_setObligation[capability591]
	rule r_obligation592 = r_setObligation[capability592]
	rule r_obligation593 = r_setObligation[capability593]
	rule r_obligation594 = r_setObligation[capability594]
	rule r_obligation595 = r_setObligation[capability595]
	rule r_obligation596 = r_setObligation[capability596]
	rule r_obligation597 = r_setObligation[capability597]
	rule r_obligation598 = r_setObligation[capability598]
	rule r_obligation599 = r_setObligation[capability599]
	rule r_obligation600 = r_setObligation[capability600]
	rule r_obligation601 = r_setObligation[capability601]
	rule r_obligation602 = r_setObligation[capability602]
	rule r_obligation603 = r_setObligation[capability603]
	rule r_obligation604 = r_setObligation[capability604]
	rule r_obligation605 = r_setObligation[capability605]
	rule r_obligation606 = r_setObligation[capability606]
	rule r_obligation607 = r_setObligation[capability607]
	rule r_obligation608 = r_setObligation[capability608]
	rule r_obligation609 = r_setObligation[capability609]
	rule r_obligation610 = r_setObligation[capability610]
	rule r_obligation611 = r_setObligation[capability611]
	rule r_obligation612 = r_setObligation[capability612]
	rule r_obligation613 = r_setObligation[capability613]
	rule r_obligation614 = r_setObligation[capability614]
	rule r_obligation615 = r_setObligation[capability615]
	rule r_obligation616 = r_setObligation[capability616]
	rule r_obligation617 = r_setObligation[capability617]
	rule r_obligation618 = r_setObligation[capability618]
	rule r_obligation619 = r_setObligation[capability619]
	rule r_obligation620 = r_setObligation[capability620]
	rule r_obligation621 = r_setObligation[capability621]
	rule r_obligation622 = r_setObligation[capability622]
	rule r_obligation623 = r_setObligation[capability623]
	rule r_obligation624 = r_setObligation[capability624]
	rule r_obligation625 = r_setObligation[capability625]
	rule r_obligation626 = r_setObligation[capability626]
	rule r_obligation627 = r_setObligation[capability627]
	rule r_obligation628 = r_setObligation[capability628]
	rule r_obligation629 = r_setObligation[capability629]
	rule r_obligation630 = r_setObligation[capability630]
	rule r_obligation631 = r_setObligation[capability631]
	rule r_obligation632 = r_setObligation[capability632]
	rule r_obligation633 = r_setObligation[capability633]
	rule r_obligation634 = r_setObligation[capability634]
	rule r_obligation635 = r_setObligation[capability635]
	rule r_obligation636 = r_setObligation[capability636]
	rule r_obligation637 = r_setObligation[capability637]
	rule r_obligation638 = r_setObligation[capability638]
	rule r_obligation639 = r_setObligation[capability639]
	rule r_obligation640 = r_setObligation[capability640]
	rule r_obligation641 = r_setObligation[capability641]
	rule r_obligation642 = r_setObligation[capability642]
	rule r_obligation643 = r_setObligation[capability643]
	rule r_obligation644 = r_setObligation[capability644]
	rule r_obligation645 = r_setObligation[capability645]
	rule r_obligation646 = r_setObligation[capability646]
	rule r_obligation647 = r_setObligation[capability647]
	rule r_obligation648 = r_setObligation[capability648]
	rule r_obligation649 = r_setObligation[capability649]
	rule r_obligation650 = r_setObligation[capability650]
	rule r_obligation651 = r_setObligation[capability651]
	rule r_obligation652 = r_setObligation[capability652]
	rule r_obligation653 = r_setObligation[capability653]
	rule r_obligation654 = r_setObligation[capability654]
	rule r_obligation655 = r_setObligation[capability655]
	rule r_obligation656 = r_setObligation[capability656]
	rule r_obligation657 = r_setObligation[capability657]
	rule r_obligation658 = r_setObligation[capability658]
	rule r_obligation659 = r_setObligation[capability659]
	rule r_obligation660 = r_setObligation[capability660]
	rule r_obligation661 = r_setObligation[capability661]
	rule r_obligation662 = r_setObligation[capability662]
	rule r_obligation663 = r_setObligation[capability663]
	rule r_obligation664 = r_setObligation[capability664]
	rule r_obligation665 = r_setObligation[capability665]
	rule r_obligation666 = r_setObligation[capability666]
	rule r_obligation667 = r_setObligation[capability667]
	rule r_obligation668 = r_setObligation[capability668]
	rule r_obligation669 = r_setObligation[capability669]
	rule r_obligation670 = r_setObligation[capability670]
	rule r_obligation671 = r_setObligation[capability671]
	rule r_obligation672 = r_setObligation[capability672]
	rule r_obligation673 = r_setObligation[capability673]
	rule r_obligation674 = r_setObligation[capability674]
	rule r_obligation675 = r_setObligation[capability675]
	rule r_obligation676 = r_setObligation[capability676]
	rule r_obligation677 = r_setObligation[capability677]
	rule r_obligation678 = r_setObligation[capability678]
	rule r_obligation679 = r_setObligation[capability679]
	rule r_obligation680 = r_setObligation[capability680]
	rule r_obligation681 = r_setObligation[capability681]
	rule r_obligation682 = r_setObligation[capability682]
	rule r_obligation683 = r_setObligation[capability683]
	rule r_obligation684 = r_setObligation[capability684]
	rule r_obligation685 = r_setObligation[capability685]
	rule r_obligation686 = r_setObligation[capability686]
	rule r_obligation687 = r_setObligation[capability687]
	rule r_obligation688 = r_setObligation[capability688]
	rule r_obligation689 = r_setObligation[capability689]
	rule r_obligation690 = r_setObligation[capability690]
	rule r_obligation691 = r_setObligation[capability691]
	rule r_obligation692 = r_setObligation[capability692]
	rule r_obligation693 = r_setObligation[capability693]
	rule r_obligation694 = r_setObligation[capability694]
	rule r_obligation695 = r_setObligation[capability695]
	rule r_obligation696 = r_setObligation[capability696]
	rule r_obligation697 = r_setObligation[capability697]
	rule r_obligation698 = r_setObligation[capability698]
	rule r_obligation699 = r_setObligation[capability699]
	rule r_obligation700 = r_setObligation[capability700]
	rule r_obligation701 = r_setObligation[capability701]
	rule r_obligation702 = r_setObligation[capability702]
	rule r_obligation703 = r_setObligation[capability703]
	rule r_obligation704 = r_setObligation[capability704]
	rule r_obligation705 = r_setObligation[capability705]
	rule r_obligation706 = r_setObligation[capability706]
	rule r_obligation707 = r_setObligation[capability707]
	rule r_obligation708 = r_setObligation[capability708]
	rule r_obligation709 = r_setObligation[capability709]
	rule r_obligation710 = r_setObligation[capability710]
	rule r_obligation711 = r_setObligation[capability711]
	rule r_obligation712 = r_setObligation[capability712]
	rule r_obligation713 = r_setObligation[capability713]
	rule r_obligation714 = r_setObligation[capability714]
	rule r_obligation715 = r_setObligation[capability715]
	rule r_obligation716 = r_setObligation[capability716]
	rule r_obligation717 = r_setObligation[capability717]
	rule r_obligation718 = r_setObligation[capability718]
	rule r_obligation719 = r_setObligation[capability719]
	rule r_obligation720 = r_setObligation[capability720]
	
	/*
	 * IF condition THEN obligation
	 * UNLESS condition IN WHICH CASE obligation
	 */
		rule r_Rule1 = 
		r_SLEEC[condition1, <<r_obligation1>>,
			condition2, <<r_obligation2>>,
			condition3, <<r_obligation3>>,
			condition4, <<r_obligation4>>,
			condition5, <<r_obligation5>>,
			condition6, <<r_obligation6>>,
			condition7, <<r_obligation7>>,
			condition8, <<r_obligation8>>,
			condition9, <<r_obligation9>>,
			condition10, <<r_obligation10>>,
			condition11, <<r_obligation11>>,
			condition12, <<r_obligation12>>,
			condition13, <<r_obligation13>>,
			condition14, <<r_obligation14>>,
			condition15, <<r_obligation15>>,
			condition16, <<r_obligation16>>,
			condition17, <<r_obligation17>>,
			condition18, <<r_obligation18>>
		]

	rule r_Rule2 = 
		r_SLEEC[condition19, <<r_obligation19>>,
			condition20, <<r_obligation20>>,
			condition21, <<r_obligation21>>,
			condition22, <<r_obligation22>>,
			condition23, <<r_obligation23>>,
			condition24, <<r_obligation24>>,
			condition25, <<r_obligation25>>,
			condition26, <<r_obligation26>>,
			condition27, <<r_obligation27>>,
			condition28, <<r_obligation28>>,
			condition29, <<r_obligation29>>,
			condition30, <<r_obligation30>>,
			condition31, <<r_obligation31>>,
			condition32, <<r_obligation32>>,
			condition33, <<r_obligation33>>,
			condition34, <<r_obligation34>>,
			condition35, <<r_obligation35>>,
			condition36, <<r_obligation36>>
		]

	rule r_Rule3 = 
		r_SLEEC[condition37, <<r_obligation37>>,
			condition38, <<r_obligation38>>,
			condition39, <<r_obligation39>>,
			condition40, <<r_obligation40>>,
			condition41, <<r_obligation41>>,
			condition42, <<r_obligation42>>,
			condition43, <<r_obligation43>>,
			condition44, <<r_obligation44>>,
			condition45, <<r_obligation45>>,
			condition46, <<r_obligation46>>,
			condition47, <<r_obligation47>>,
			condition48, <<r_obligation48>>,
			condition49, <<r_obligation49>>,
			condition50, <<r_obligation50>>,
			condition51, <<r_obligation51>>,
			condition52, <<r_obligation52>>,
			condition53, <<r_obligation53>>,
			condition54, <<r_obligation54>>
		]

	rule r_Rule4 = 
		r_SLEEC[condition55, <<r_obligation55>>,
			condition56, <<r_obligation56>>,
			condition57, <<r_obligation57>>,
			condition58, <<r_obligation58>>,
			condition59, <<r_obligation59>>,
			condition60, <<r_obligation60>>,
			condition61, <<r_obligation61>>,
			condition62, <<r_obligation62>>,
			condition63, <<r_obligation63>>,
			condition64, <<r_obligation64>>,
			condition65, <<r_obligation65>>,
			condition66, <<r_obligation66>>,
			condition67, <<r_obligation67>>,
			condition68, <<r_obligation68>>,
			condition69, <<r_obligation69>>,
			condition70, <<r_obligation70>>,
			condition71, <<r_obligation71>>,
			condition72, <<r_obligation72>>
		]

	rule r_Rule5 = 
		r_SLEEC[condition73, <<r_obligation73>>,
			condition74, <<r_obligation74>>,
			condition75, <<r_obligation75>>,
			condition76, <<r_obligation76>>,
			condition77, <<r_obligation77>>,
			condition78, <<r_obligation78>>,
			condition79, <<r_obligation79>>,
			condition80, <<r_obligation80>>,
			condition81, <<r_obligation81>>,
			condition82, <<r_obligation82>>,
			condition83, <<r_obligation83>>,
			condition84, <<r_obligation84>>,
			condition85, <<r_obligation85>>,
			condition86, <<r_obligation86>>,
			condition87, <<r_obligation87>>,
			condition88, <<r_obligation88>>,
			condition89, <<r_obligation89>>,
			condition90, <<r_obligation90>>
		]

	rule r_Rule6 = 
		r_SLEEC[condition91, <<r_obligation91>>,
			condition92, <<r_obligation92>>,
			condition93, <<r_obligation93>>,
			condition94, <<r_obligation94>>,
			condition95, <<r_obligation95>>,
			condition96, <<r_obligation96>>,
			condition97, <<r_obligation97>>,
			condition98, <<r_obligation98>>,
			condition99, <<r_obligation99>>,
			condition100, <<r_obligation100>>,
			condition101, <<r_obligation101>>,
			condition102, <<r_obligation102>>,
			condition103, <<r_obligation103>>,
			condition104, <<r_obligation104>>,
			condition105, <<r_obligation105>>,
			condition106, <<r_obligation106>>,
			condition107, <<r_obligation107>>,
			condition108, <<r_obligation108>>
		]

	rule r_Rule7 = 
		r_SLEEC[condition109, <<r_obligation109>>,
			condition110, <<r_obligation110>>,
			condition111, <<r_obligation111>>,
			condition112, <<r_obligation112>>,
			condition113, <<r_obligation113>>,
			condition114, <<r_obligation114>>,
			condition115, <<r_obligation115>>,
			condition116, <<r_obligation116>>,
			condition117, <<r_obligation117>>,
			condition118, <<r_obligation118>>,
			condition119, <<r_obligation119>>,
			condition120, <<r_obligation120>>,
			condition121, <<r_obligation121>>,
			condition122, <<r_obligation122>>,
			condition123, <<r_obligation123>>,
			condition124, <<r_obligation124>>,
			condition125, <<r_obligation125>>,
			condition126, <<r_obligation126>>
		]

	rule r_Rule8 = 
		r_SLEEC[condition127, <<r_obligation127>>,
			condition128, <<r_obligation128>>,
			condition129, <<r_obligation129>>,
			condition130, <<r_obligation130>>,
			condition131, <<r_obligation131>>,
			condition132, <<r_obligation132>>,
			condition133, <<r_obligation133>>,
			condition134, <<r_obligation134>>,
			condition135, <<r_obligation135>>,
			condition136, <<r_obligation136>>,
			condition137, <<r_obligation137>>,
			condition138, <<r_obligation138>>,
			condition139, <<r_obligation139>>,
			condition140, <<r_obligation140>>,
			condition141, <<r_obligation141>>,
			condition142, <<r_obligation142>>,
			condition143, <<r_obligation143>>,
			condition144, <<r_obligation144>>
		]

	rule r_Rule9 = 
		r_SLEEC[condition145, <<r_obligation145>>,
			condition146, <<r_obligation146>>,
			condition147, <<r_obligation147>>,
			condition148, <<r_obligation148>>,
			condition149, <<r_obligation149>>,
			condition150, <<r_obligation150>>,
			condition151, <<r_obligation151>>,
			condition152, <<r_obligation152>>,
			condition153, <<r_obligation153>>,
			condition154, <<r_obligation154>>,
			condition155, <<r_obligation155>>,
			condition156, <<r_obligation156>>,
			condition157, <<r_obligation157>>,
			condition158, <<r_obligation158>>,
			condition159, <<r_obligation159>>,
			condition160, <<r_obligation160>>,
			condition161, <<r_obligation161>>,
			condition162, <<r_obligation162>>
		]

	rule r_Rule10 = 
		r_SLEEC[condition163, <<r_obligation163>>,
			condition164, <<r_obligation164>>,
			condition165, <<r_obligation165>>,
			condition166, <<r_obligation166>>,
			condition167, <<r_obligation167>>,
			condition168, <<r_obligation168>>,
			condition169, <<r_obligation169>>,
			condition170, <<r_obligation170>>,
			condition171, <<r_obligation171>>,
			condition172, <<r_obligation172>>,
			condition173, <<r_obligation173>>,
			condition174, <<r_obligation174>>,
			condition175, <<r_obligation175>>,
			condition176, <<r_obligation176>>,
			condition177, <<r_obligation177>>,
			condition178, <<r_obligation178>>,
			condition179, <<r_obligation179>>,
			condition180, <<r_obligation180>>
		]

	rule r_Rule11 = 
		r_SLEEC[condition181, <<r_obligation181>>,
			condition182, <<r_obligation182>>,
			condition183, <<r_obligation183>>,
			condition184, <<r_obligation184>>,
			condition185, <<r_obligation185>>,
			condition186, <<r_obligation186>>,
			condition187, <<r_obligation187>>,
			condition188, <<r_obligation188>>,
			condition189, <<r_obligation189>>,
			condition190, <<r_obligation190>>,
			condition191, <<r_obligation191>>,
			condition192, <<r_obligation192>>,
			condition193, <<r_obligation193>>,
			condition194, <<r_obligation194>>,
			condition195, <<r_obligation195>>,
			condition196, <<r_obligation196>>,
			condition197, <<r_obligation197>>,
			condition198, <<r_obligation198>>
		]

	rule r_Rule12 = 
		r_SLEEC[condition199, <<r_obligation199>>,
			condition200, <<r_obligation200>>,
			condition201, <<r_obligation201>>,
			condition202, <<r_obligation202>>,
			condition203, <<r_obligation203>>,
			condition204, <<r_obligation204>>,
			condition205, <<r_obligation205>>,
			condition206, <<r_obligation206>>,
			condition207, <<r_obligation207>>,
			condition208, <<r_obligation208>>,
			condition209, <<r_obligation209>>,
			condition210, <<r_obligation210>>,
			condition211, <<r_obligation211>>,
			condition212, <<r_obligation212>>,
			condition213, <<r_obligation213>>,
			condition214, <<r_obligation214>>,
			condition215, <<r_obligation215>>,
			condition216, <<r_obligation216>>
		]

	rule r_Rule13 = 
		r_SLEEC[condition217, <<r_obligation217>>,
			condition218, <<r_obligation218>>,
			condition219, <<r_obligation219>>,
			condition220, <<r_obligation220>>,
			condition221, <<r_obligation221>>,
			condition222, <<r_obligation222>>,
			condition223, <<r_obligation223>>,
			condition224, <<r_obligation224>>,
			condition225, <<r_obligation225>>,
			condition226, <<r_obligation226>>,
			condition227, <<r_obligation227>>,
			condition228, <<r_obligation228>>,
			condition229, <<r_obligation229>>,
			condition230, <<r_obligation230>>,
			condition231, <<r_obligation231>>,
			condition232, <<r_obligation232>>,
			condition233, <<r_obligation233>>,
			condition234, <<r_obligation234>>
		]

	rule r_Rule14 = 
		r_SLEEC[condition235, <<r_obligation235>>,
			condition236, <<r_obligation236>>,
			condition237, <<r_obligation237>>,
			condition238, <<r_obligation238>>,
			condition239, <<r_obligation239>>,
			condition240, <<r_obligation240>>,
			condition241, <<r_obligation241>>,
			condition242, <<r_obligation242>>,
			condition243, <<r_obligation243>>,
			condition244, <<r_obligation244>>,
			condition245, <<r_obligation245>>,
			condition246, <<r_obligation246>>,
			condition247, <<r_obligation247>>,
			condition248, <<r_obligation248>>,
			condition249, <<r_obligation249>>,
			condition250, <<r_obligation250>>,
			condition251, <<r_obligation251>>,
			condition252, <<r_obligation252>>
		]

	rule r_Rule15 = 
		r_SLEEC[condition253, <<r_obligation253>>,
			condition254, <<r_obligation254>>,
			condition255, <<r_obligation255>>,
			condition256, <<r_obligation256>>,
			condition257, <<r_obligation257>>,
			condition258, <<r_obligation258>>,
			condition259, <<r_obligation259>>,
			condition260, <<r_obligation260>>,
			condition261, <<r_obligation261>>,
			condition262, <<r_obligation262>>,
			condition263, <<r_obligation263>>,
			condition264, <<r_obligation264>>,
			condition265, <<r_obligation265>>,
			condition266, <<r_obligation266>>,
			condition267, <<r_obligation267>>,
			condition268, <<r_obligation268>>,
			condition269, <<r_obligation269>>,
			condition270, <<r_obligation270>>
		]

	rule r_Rule16 = 
		r_SLEEC[condition271, <<r_obligation271>>,
			condition272, <<r_obligation272>>,
			condition273, <<r_obligation273>>,
			condition274, <<r_obligation274>>,
			condition275, <<r_obligation275>>,
			condition276, <<r_obligation276>>,
			condition277, <<r_obligation277>>,
			condition278, <<r_obligation278>>,
			condition279, <<r_obligation279>>,
			condition280, <<r_obligation280>>,
			condition281, <<r_obligation281>>,
			condition282, <<r_obligation282>>,
			condition283, <<r_obligation283>>,
			condition284, <<r_obligation284>>,
			condition285, <<r_obligation285>>,
			condition286, <<r_obligation286>>,
			condition287, <<r_obligation287>>,
			condition288, <<r_obligation288>>
		]

	rule r_Rule17 = 
		r_SLEEC[condition289, <<r_obligation289>>,
			condition290, <<r_obligation290>>,
			condition291, <<r_obligation291>>,
			condition292, <<r_obligation292>>,
			condition293, <<r_obligation293>>,
			condition294, <<r_obligation294>>,
			condition295, <<r_obligation295>>,
			condition296, <<r_obligation296>>,
			condition297, <<r_obligation297>>,
			condition298, <<r_obligation298>>,
			condition299, <<r_obligation299>>,
			condition300, <<r_obligation300>>,
			condition301, <<r_obligation301>>,
			condition302, <<r_obligation302>>,
			condition303, <<r_obligation303>>,
			condition304, <<r_obligation304>>,
			condition305, <<r_obligation305>>,
			condition306, <<r_obligation306>>
		]

	rule r_Rule18 = 
		r_SLEEC[condition307, <<r_obligation307>>,
			condition308, <<r_obligation308>>,
			condition309, <<r_obligation309>>,
			condition310, <<r_obligation310>>,
			condition311, <<r_obligation311>>,
			condition312, <<r_obligation312>>,
			condition313, <<r_obligation313>>,
			condition314, <<r_obligation314>>,
			condition315, <<r_obligation315>>,
			condition316, <<r_obligation316>>,
			condition317, <<r_obligation317>>,
			condition318, <<r_obligation318>>,
			condition319, <<r_obligation319>>,
			condition320, <<r_obligation320>>,
			condition321, <<r_obligation321>>,
			condition322, <<r_obligation322>>,
			condition323, <<r_obligation323>>,
			condition324, <<r_obligation324>>
		]

	rule r_Rule19 = 
		r_SLEEC[condition325, <<r_obligation325>>,
			condition326, <<r_obligation326>>,
			condition327, <<r_obligation327>>,
			condition328, <<r_obligation328>>,
			condition329, <<r_obligation329>>,
			condition330, <<r_obligation330>>,
			condition331, <<r_obligation331>>,
			condition332, <<r_obligation332>>,
			condition333, <<r_obligation333>>,
			condition334, <<r_obligation334>>,
			condition335, <<r_obligation335>>,
			condition336, <<r_obligation336>>,
			condition337, <<r_obligation337>>,
			condition338, <<r_obligation338>>,
			condition339, <<r_obligation339>>,
			condition340, <<r_obligation340>>,
			condition341, <<r_obligation341>>,
			condition342, <<r_obligation342>>
		]

	rule r_Rule20 = 
		r_SLEEC[condition343, <<r_obligation343>>,
			condition344, <<r_obligation344>>,
			condition345, <<r_obligation345>>,
			condition346, <<r_obligation346>>,
			condition347, <<r_obligation347>>,
			condition348, <<r_obligation348>>,
			condition349, <<r_obligation349>>,
			condition350, <<r_obligation350>>,
			condition351, <<r_obligation351>>,
			condition352, <<r_obligation352>>,
			condition353, <<r_obligation353>>,
			condition354, <<r_obligation354>>,
			condition355, <<r_obligation355>>,
			condition356, <<r_obligation356>>,
			condition357, <<r_obligation357>>,
			condition358, <<r_obligation358>>,
			condition359, <<r_obligation359>>,
			condition360, <<r_obligation360>>
		]

	rule r_Rule21 = 
		r_SLEEC[condition361, <<r_obligation361>>,
			condition362, <<r_obligation362>>,
			condition363, <<r_obligation363>>,
			condition364, <<r_obligation364>>,
			condition365, <<r_obligation365>>,
			condition366, <<r_obligation366>>,
			condition367, <<r_obligation367>>,
			condition368, <<r_obligation368>>,
			condition369, <<r_obligation369>>,
			condition370, <<r_obligation370>>,
			condition371, <<r_obligation371>>,
			condition372, <<r_obligation372>>,
			condition373, <<r_obligation373>>,
			condition374, <<r_obligation374>>,
			condition375, <<r_obligation375>>,
			condition376, <<r_obligation376>>,
			condition377, <<r_obligation377>>,
			condition378, <<r_obligation378>>
		]

	rule r_Rule22 = 
		r_SLEEC[condition379, <<r_obligation379>>,
			condition380, <<r_obligation380>>,
			condition381, <<r_obligation381>>,
			condition382, <<r_obligation382>>,
			condition383, <<r_obligation383>>,
			condition384, <<r_obligation384>>,
			condition385, <<r_obligation385>>,
			condition386, <<r_obligation386>>,
			condition387, <<r_obligation387>>,
			condition388, <<r_obligation388>>,
			condition389, <<r_obligation389>>,
			condition390, <<r_obligation390>>,
			condition391, <<r_obligation391>>,
			condition392, <<r_obligation392>>,
			condition393, <<r_obligation393>>,
			condition394, <<r_obligation394>>,
			condition395, <<r_obligation395>>,
			condition396, <<r_obligation396>>
		]

	rule r_Rule23 = 
		r_SLEEC[condition397, <<r_obligation397>>,
			condition398, <<r_obligation398>>,
			condition399, <<r_obligation399>>,
			condition400, <<r_obligation400>>,
			condition401, <<r_obligation401>>,
			condition402, <<r_obligation402>>,
			condition403, <<r_obligation403>>,
			condition404, <<r_obligation404>>,
			condition405, <<r_obligation405>>,
			condition406, <<r_obligation406>>,
			condition407, <<r_obligation407>>,
			condition408, <<r_obligation408>>,
			condition409, <<r_obligation409>>,
			condition410, <<r_obligation410>>,
			condition411, <<r_obligation411>>,
			condition412, <<r_obligation412>>,
			condition413, <<r_obligation413>>,
			condition414, <<r_obligation414>>
		]

	rule r_Rule24 = 
		r_SLEEC[condition415, <<r_obligation415>>,
			condition416, <<r_obligation416>>,
			condition417, <<r_obligation417>>,
			condition418, <<r_obligation418>>,
			condition419, <<r_obligation419>>,
			condition420, <<r_obligation420>>,
			condition421, <<r_obligation421>>,
			condition422, <<r_obligation422>>,
			condition423, <<r_obligation423>>,
			condition424, <<r_obligation424>>,
			condition425, <<r_obligation425>>,
			condition426, <<r_obligation426>>,
			condition427, <<r_obligation427>>,
			condition428, <<r_obligation428>>,
			condition429, <<r_obligation429>>,
			condition430, <<r_obligation430>>,
			condition431, <<r_obligation431>>,
			condition432, <<r_obligation432>>
		]

	rule r_Rule25 = 
		r_SLEEC[condition433, <<r_obligation433>>,
			condition434, <<r_obligation434>>,
			condition435, <<r_obligation435>>,
			condition436, <<r_obligation436>>,
			condition437, <<r_obligation437>>,
			condition438, <<r_obligation438>>,
			condition439, <<r_obligation439>>,
			condition440, <<r_obligation440>>,
			condition441, <<r_obligation441>>,
			condition442, <<r_obligation442>>,
			condition443, <<r_obligation443>>,
			condition444, <<r_obligation444>>,
			condition445, <<r_obligation445>>,
			condition446, <<r_obligation446>>,
			condition447, <<r_obligation447>>,
			condition448, <<r_obligation448>>,
			condition449, <<r_obligation449>>,
			condition450, <<r_obligation450>>
		]

	rule r_Rule26 = 
		r_SLEEC[condition451, <<r_obligation451>>,
			condition452, <<r_obligation452>>,
			condition453, <<r_obligation453>>,
			condition454, <<r_obligation454>>,
			condition455, <<r_obligation455>>,
			condition456, <<r_obligation456>>,
			condition457, <<r_obligation457>>,
			condition458, <<r_obligation458>>,
			condition459, <<r_obligation459>>,
			condition460, <<r_obligation460>>,
			condition461, <<r_obligation461>>,
			condition462, <<r_obligation462>>,
			condition463, <<r_obligation463>>,
			condition464, <<r_obligation464>>,
			condition465, <<r_obligation465>>,
			condition466, <<r_obligation466>>,
			condition467, <<r_obligation467>>,
			condition468, <<r_obligation468>>
		]

	rule r_Rule27 = 
		r_SLEEC[condition469, <<r_obligation469>>,
			condition470, <<r_obligation470>>,
			condition471, <<r_obligation471>>,
			condition472, <<r_obligation472>>,
			condition473, <<r_obligation473>>,
			condition474, <<r_obligation474>>,
			condition475, <<r_obligation475>>,
			condition476, <<r_obligation476>>,
			condition477, <<r_obligation477>>,
			condition478, <<r_obligation478>>,
			condition479, <<r_obligation479>>,
			condition480, <<r_obligation480>>,
			condition481, <<r_obligation481>>,
			condition482, <<r_obligation482>>,
			condition483, <<r_obligation483>>,
			condition484, <<r_obligation484>>,
			condition485, <<r_obligation485>>,
			condition486, <<r_obligation486>>
		]

	rule r_Rule28 = 
		r_SLEEC[condition487, <<r_obligation487>>,
			condition488, <<r_obligation488>>,
			condition489, <<r_obligation489>>,
			condition490, <<r_obligation490>>,
			condition491, <<r_obligation491>>,
			condition492, <<r_obligation492>>,
			condition493, <<r_obligation493>>,
			condition494, <<r_obligation494>>,
			condition495, <<r_obligation495>>,
			condition496, <<r_obligation496>>,
			condition497, <<r_obligation497>>,
			condition498, <<r_obligation498>>,
			condition499, <<r_obligation499>>,
			condition500, <<r_obligation500>>,
			condition501, <<r_obligation501>>,
			condition502, <<r_obligation502>>,
			condition503, <<r_obligation503>>,
			condition504, <<r_obligation504>>
		]

	rule r_Rule29 = 
		r_SLEEC[condition505, <<r_obligation505>>,
			condition506, <<r_obligation506>>,
			condition507, <<r_obligation507>>,
			condition508, <<r_obligation508>>,
			condition509, <<r_obligation509>>,
			condition510, <<r_obligation510>>,
			condition511, <<r_obligation511>>,
			condition512, <<r_obligation512>>,
			condition513, <<r_obligation513>>,
			condition514, <<r_obligation514>>,
			condition515, <<r_obligation515>>,
			condition516, <<r_obligation516>>,
			condition517, <<r_obligation517>>,
			condition518, <<r_obligation518>>,
			condition519, <<r_obligation519>>,
			condition520, <<r_obligation520>>,
			condition521, <<r_obligation521>>,
			condition522, <<r_obligation522>>
		]

	rule r_Rule30 = 
		r_SLEEC[condition523, <<r_obligation523>>,
			condition524, <<r_obligation524>>,
			condition525, <<r_obligation525>>,
			condition526, <<r_obligation526>>,
			condition527, <<r_obligation527>>,
			condition528, <<r_obligation528>>,
			condition529, <<r_obligation529>>,
			condition530, <<r_obligation530>>,
			condition531, <<r_obligation531>>,
			condition532, <<r_obligation532>>,
			condition533, <<r_obligation533>>,
			condition534, <<r_obligation534>>,
			condition535, <<r_obligation535>>,
			condition536, <<r_obligation536>>,
			condition537, <<r_obligation537>>,
			condition538, <<r_obligation538>>,
			condition539, <<r_obligation539>>,
			condition540, <<r_obligation540>>
		]

	rule r_Rule31 = 
		r_SLEEC[condition541, <<r_obligation541>>,
			condition542, <<r_obligation542>>,
			condition543, <<r_obligation543>>,
			condition544, <<r_obligation544>>,
			condition545, <<r_obligation545>>,
			condition546, <<r_obligation546>>,
			condition547, <<r_obligation547>>,
			condition548, <<r_obligation548>>,
			condition549, <<r_obligation549>>,
			condition550, <<r_obligation550>>,
			condition551, <<r_obligation551>>,
			condition552, <<r_obligation552>>,
			condition553, <<r_obligation553>>,
			condition554, <<r_obligation554>>,
			condition555, <<r_obligation555>>,
			condition556, <<r_obligation556>>,
			condition557, <<r_obligation557>>,
			condition558, <<r_obligation558>>
		]

	rule r_Rule32 = 
		r_SLEEC[condition559, <<r_obligation559>>,
			condition560, <<r_obligation560>>,
			condition561, <<r_obligation561>>,
			condition562, <<r_obligation562>>,
			condition563, <<r_obligation563>>,
			condition564, <<r_obligation564>>,
			condition565, <<r_obligation565>>,
			condition566, <<r_obligation566>>,
			condition567, <<r_obligation567>>,
			condition568, <<r_obligation568>>,
			condition569, <<r_obligation569>>,
			condition570, <<r_obligation570>>,
			condition571, <<r_obligation571>>,
			condition572, <<r_obligation572>>,
			condition573, <<r_obligation573>>,
			condition574, <<r_obligation574>>,
			condition575, <<r_obligation575>>,
			condition576, <<r_obligation576>>
		]

	rule r_Rule33 = 
		r_SLEEC[condition577, <<r_obligation577>>,
			condition578, <<r_obligation578>>,
			condition579, <<r_obligation579>>,
			condition580, <<r_obligation580>>,
			condition581, <<r_obligation581>>,
			condition582, <<r_obligation582>>,
			condition583, <<r_obligation583>>,
			condition584, <<r_obligation584>>,
			condition585, <<r_obligation585>>,
			condition586, <<r_obligation586>>,
			condition587, <<r_obligation587>>,
			condition588, <<r_obligation588>>,
			condition589, <<r_obligation589>>,
			condition590, <<r_obligation590>>,
			condition591, <<r_obligation591>>,
			condition592, <<r_obligation592>>,
			condition593, <<r_obligation593>>,
			condition594, <<r_obligation594>>
		]

	rule r_Rule34 = 
		r_SLEEC[condition595, <<r_obligation595>>,
			condition596, <<r_obligation596>>,
			condition597, <<r_obligation597>>,
			condition598, <<r_obligation598>>,
			condition599, <<r_obligation599>>,
			condition600, <<r_obligation600>>,
			condition601, <<r_obligation601>>,
			condition602, <<r_obligation602>>,
			condition603, <<r_obligation603>>,
			condition604, <<r_obligation604>>,
			condition605, <<r_obligation605>>,
			condition606, <<r_obligation606>>,
			condition607, <<r_obligation607>>,
			condition608, <<r_obligation608>>,
			condition609, <<r_obligation609>>,
			condition610, <<r_obligation610>>,
			condition611, <<r_obligation611>>,
			condition612, <<r_obligation612>>
		]

	rule r_Rule35 = 
		r_SLEEC[condition613, <<r_obligation613>>,
			condition614, <<r_obligation614>>,
			condition615, <<r_obligation615>>,
			condition616, <<r_obligation616>>,
			condition617, <<r_obligation617>>,
			condition618, <<r_obligation618>>,
			condition619, <<r_obligation619>>,
			condition620, <<r_obligation620>>,
			condition621, <<r_obligation621>>,
			condition622, <<r_obligation622>>,
			condition623, <<r_obligation623>>,
			condition624, <<r_obligation624>>,
			condition625, <<r_obligation625>>,
			condition626, <<r_obligation626>>,
			condition627, <<r_obligation627>>,
			condition628, <<r_obligation628>>,
			condition629, <<r_obligation629>>,
			condition630, <<r_obligation630>>
		]

	rule r_Rule36 = 
		r_SLEEC[condition631, <<r_obligation631>>,
			condition632, <<r_obligation632>>,
			condition633, <<r_obligation633>>,
			condition634, <<r_obligation634>>,
			condition635, <<r_obligation635>>,
			condition636, <<r_obligation636>>,
			condition637, <<r_obligation637>>,
			condition638, <<r_obligation638>>,
			condition639, <<r_obligation639>>,
			condition640, <<r_obligation640>>,
			condition641, <<r_obligation641>>,
			condition642, <<r_obligation642>>,
			condition643, <<r_obligation643>>,
			condition644, <<r_obligation644>>,
			condition645, <<r_obligation645>>,
			condition646, <<r_obligation646>>,
			condition647, <<r_obligation647>>,
			condition648, <<r_obligation648>>
		]

	rule r_Rule37 = 
		r_SLEEC[condition649, <<r_obligation649>>,
			condition650, <<r_obligation650>>,
			condition651, <<r_obligation651>>,
			condition652, <<r_obligation652>>,
			condition653, <<r_obligation653>>,
			condition654, <<r_obligation654>>,
			condition655, <<r_obligation655>>,
			condition656, <<r_obligation656>>,
			condition657, <<r_obligation657>>,
			condition658, <<r_obligation658>>,
			condition659, <<r_obligation659>>,
			condition660, <<r_obligation660>>,
			condition661, <<r_obligation661>>,
			condition662, <<r_obligation662>>,
			condition663, <<r_obligation663>>,
			condition664, <<r_obligation664>>,
			condition665, <<r_obligation665>>,
			condition666, <<r_obligation666>>
		]

	rule r_Rule38 = 
		r_SLEEC[condition667, <<r_obligation667>>,
			condition668, <<r_obligation668>>,
			condition669, <<r_obligation669>>,
			condition670, <<r_obligation670>>,
			condition671, <<r_obligation671>>,
			condition672, <<r_obligation672>>,
			condition673, <<r_obligation673>>,
			condition674, <<r_obligation674>>,
			condition675, <<r_obligation675>>,
			condition676, <<r_obligation676>>,
			condition677, <<r_obligation677>>,
			condition678, <<r_obligation678>>,
			condition679, <<r_obligation679>>,
			condition680, <<r_obligation680>>,
			condition681, <<r_obligation681>>,
			condition682, <<r_obligation682>>,
			condition683, <<r_obligation683>>,
			condition684, <<r_obligation684>>
		]

	rule r_Rule39 = 
		r_SLEEC[condition685, <<r_obligation685>>,
			condition686, <<r_obligation686>>,
			condition687, <<r_obligation687>>,
			condition688, <<r_obligation688>>,
			condition689, <<r_obligation689>>,
			condition690, <<r_obligation690>>,
			condition691, <<r_obligation691>>,
			condition692, <<r_obligation692>>,
			condition693, <<r_obligation693>>,
			condition694, <<r_obligation694>>,
			condition695, <<r_obligation695>>,
			condition696, <<r_obligation696>>,
			condition697, <<r_obligation697>>,
			condition698, <<r_obligation698>>,
			condition699, <<r_obligation699>>,
			condition700, <<r_obligation700>>,
			condition701, <<r_obligation701>>,
			condition702, <<r_obligation702>>
		]

	rule r_Rule40 = 
		r_SLEEC[condition703, <<r_obligation703>>,
			condition704, <<r_obligation704>>,
			condition705, <<r_obligation705>>,
			condition706, <<r_obligation706>>,
			condition707, <<r_obligation707>>,
			condition708, <<r_obligation708>>,
			condition709, <<r_obligation709>>,
			condition710, <<r_obligation710>>,
			condition711, <<r_obligation711>>,
			condition712, <<r_obligation712>>,
			condition713, <<r_obligation713>>,
			condition714, <<r_obligation714>>,
			condition715, <<r_obligation715>>,
			condition716, <<r_obligation716>>,
			condition717, <<r_obligation717>>,
			condition718, <<r_obligation718>>,
			condition719, <<r_obligation719>>,
			condition720, <<r_obligation720>>
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
			endpar
		endseq

default init s0:
