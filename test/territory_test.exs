defmodule Cldr.TerritoryTest do
  use ExUnit.Case
  alias Cldr.Territory

  doctest Cldr.Territory
  doctest TestBackend.Cldr.Territory

  @available_territories [:"001", :"002", :"003", :"005", :"009", :"011", :"013", :"014", :"015", :"017", :"018", :"019", :"021", :"029", :"030", :"034",
                          :"035", :"039", :"053", :"054", :"057", :"061", :"142", :"143", :"145", :"150", :"151", :"154", :"155", :"202", :"419", :AC,
                          :AD, :AE, :AF, :AG, :AI, :AL, :AM, :AO, :AQ, :AR, :AS, :AT, :AU, :AW, :AX, :AZ, :BA, :BB, :BD, :BE, :BF, :BG, :BH, :BI, :BJ,
                          :BL, :BM, :BN, :BO, :BQ, :BR, :BS, :BT, :BV, :BW, :BY, :BZ, :CA, :CC, :CD, :CF, :CG, :CH, :CI, :CK, :CL, :CM, :CN, :CO, :CP,
                          :CR, :CU, :CV, :CW, :CX, :CY, :CZ, :DE, :DG, :DJ, :DK, :DM, :DO, :DZ, :EA, :EC, :EE, :EG, :EH, :ER, :ES, :ET, :EU, :EZ, :FI,
                          :FJ, :FK, :FM, :FO, :FR, :GA, :GB, :GD, :GE, :GF, :GG, :GH, :GI, :GL, :GM, :GN, :GP, :GQ, :GR, :GS, :GT, :GU, :GW, :GY, :HK,
                          :HM, :HN, :HR, :HT, :HU, :IC, :ID, :IE, :IL, :IM, :IN, :IO, :IQ, :IR, :IS, :IT, :JE, :JM, :JO, :JP, :KE, :KG, :KH, :KI, :KM,
                          :KN, :KP, :KR, :KW, :KY, :KZ, :LA, :LB, :LC, :LI, :LK, :LR, :LS, :LT, :LU, :LV, :LY, :MA, :MC, :MD, :ME, :MF, :MG, :MH, :MK,
                          :ML, :MM, :MN, :MO, :MP, :MQ, :MR, :MS, :MT, :MU, :MV, :MW, :MX, :MY, :MZ, :NA, :NC, :NE, :NF, :NG, :NI, :NL, :NO, :NP, :NR,
                          :NU, :NZ, :OM, :PA, :PE, :PF, :PG, :PH, :PK, :PL, :PM, :PN, :PR, :PS, :PT, :PW, :PY, :QA, :QO, :RE, :RO, :RS, :RU, :RW, :SA,
                          :SB, :SC, :SD, :SE, :SG, :SH, :SI, :SJ, :SK, :SL, :SM, :SN, :SO, :SR, :SS, :ST, :SV, :SX, :SY, :SZ, :TA, :TC, :TD, :TF, :TG,
                          :TH, :TJ, :TK, :TL, :TM, :TN, :TO, :TR, :TT, :TV, :TW, :TZ, :UA, :UG, :UM, :UN, :US, :UY, :UZ, :VA, :VC, :VE, :VG, :VI, :VN,
                          :VU, :WF, :WS, :XA, :XB, :XK, :YE, :YT, :ZA, :ZM, :ZW, :ZZ]

 @available_subdivions [:ad02, :ad03, :ad04, :ad05, :ad06, :ad07, :ad08, :aeaj, :aeaz, :aedu, :aefu,
                       :aerk, :aesh, :aeuq, :afbal, :afbam, :afbdg, :afbds, :afbgl, :afday, :affra,
                       :affyb, :afgha, :afgho, :afhel, :afher, :afjow, :afkab, :afkan, :afkap, :afkdz,
                       :afkho, :afknr, :aflag, :aflog, :afnan, :afnim, :afnur, :afpan, :afpar, :afpia,
                       :afpka, :afsam, :afsar, :aftak, :afuru, :afwar, :afzab, :ag03, :ag04, :ag05,
                       :ag06, :ag07, :ag08, :ag10, :ag11, :al01, :al02, :al03, :al04, :al05, :al06,
                       :al07, :al08, :al09, :al10, :al11, :al12, :albr, :albu, :aldi, :aldl, :aldr,
                       :aldv, :alel, :aler, :alfr, :algj, :algr, :alha, :alka, :alkb, :alkc, :alko,
                       :alkr, :alku, :allb, :alle, :allu, :almk, :almm, :almr, :almt, :alpg, :alpq,
                       :alpr, :alpu, :alsh, :alsk, :alsr, :alte, :altp, :altr, :alvl, :amag, :amar,
                       :amav, :amer, :amgr, :amkt, :amlo, :amsh, :amsu, :amtv, :amvd, :aobgo, :aobgu,
                       :aobie, :aocab, :aoccu, :aocnn, :aocno, :aocus, :aohua, :aohui, :aolno, :aolsu,
                       :aolua, :aomal, :aomox, :aonam, :aouig, :aozai, :ara, :arb, :arc, :ard, :are,
                       :arf, :arg, :arh, :arj, :ark, :arl, :arm, :arn, :arp, :arq, :arr, :ars, :art,
                       :aru, :arv, :arw, :arx, :ary, :arz, :as, :at1, :at2, :at3, :at4, :at5, :at6,
                       :at7, :at8, :at9, :auact, :aunsw, :aunt, :auqld, :ausa, :autas, :auvic, :auwa,
                       :aw, :ax, :azabs, :azaga, :azagc, :azagm, :azags, :azagu, :azast, :azba,
                       :azbab, :azbal, :azbar, :azbey, :azbil, :azcab, :azcal, :azcul, :azdas, :azfuz,
                       :azga, :azgad, :azgor, :azgoy, :azgyg, :azhac, :azimi, :azism, :azkal, :azkan,
                       :azkur, :azla, :azlac, :azlan, :azler, :azmas, :azmi, :azna, :aznef, :aznv,
                       :aznx, :azogu, :azord, :azqab, :azqax, :azqaz, :azqba, :azqbi, :azqob, :azqus,
                       :azsa, :azsab, :azsad, :azsah, :azsak, :azsal, :azsar, :azsat, :azsbn, :azsiy,
                       :azskr, :azsm, :azsmi, :azsmx, :azsr, :azsus, :aztar, :aztov, :azuca, :azxa,
                       :azxac, :azxci, :azxiz, :azxvd, :azyar, :azye, :azyev, :azzan, :azzaq, :azzar,
                       :ba01, :ba02, :ba03, :ba04, :ba05, :ba06, :ba07, :ba08, :ba09, :ba10, :babih,
                       :babrc, :basrp, :bb01, :bb02, :bb03, :bb04, :bb05, :bb06, :bb07, :bb08, :bb09,
                       :bb10, :bb11, :bd01, :bd02, :bd03, :bd04, :bd05, :bd06, :bd07, :bd08, :bd09,
                       :bd10, :bd11, :bd12, :bd13, :bd14, :bd15, :bd16, :bd17, :bd18, :bd19, :bd20,
                       :bd21, :bd22, :bd23, :bd24, :bd25, :bd26, :bd27, :bd28, :bd29, :bd30, :bd31,
                       :bd32, :bd33, :bd34, :bd35, :bd36, :bd37, :bd38, :bd39, :bd40, :bd41, :bd42,
                       :bd43, :bd44, :bd45, :bd46, :bd47, :bd48, :bd49, :bd50, :bd51, :bd52, :bd53,
                       :bd54, :bd55, :bd56, :bd57, :bd58, :bd59, :bd60, :bd61, :bd62, :bd63, :bd64,
                       :bda, :bdb, :bdc, :bdd, :bde, :bdf, :bdg, :bdh, :bebru, :bevan, :bevbr, :bevlg,
                       :bevli, :bevov, :bevwv, :bewal, :bewbr, :bewht, :bewlg, :bewlx, :bewna, :bf01,
                       :bf02, :bf03, :bf04, :bf05, :bf06, :bf07, :bf08, :bf09, :bf10, :bf11, :bf12,
                       :bf13, :bfbal, :bfbam, :bfban, :bfbaz, :bfbgr, :bfblg, :bfblk, :bfcom, :bfgan,
                       :bfgna, :bfgou, :bfhou, :bfiob, :bfkad, :bfken, :bfkmd, :bfkmp, :bfkop, :bfkos,
                       :bfkot, :bfkow, :bfler, :bflor, :bfmou, :bfnam, :bfnao, :bfnay, :bfnou, :bfoub,
                       :bfoud, :bfpas, :bfpon, :bfsen, :bfsis, :bfsmt, :bfsng, :bfsom, :bfsor, :bftap,
                       :bftui, :bfyag, :bfyat, :bfzir, :bfzon, :bfzou, :bg01, :bg02, :bg03, :bg04,
                       :bg05, :bg06, :bg07, :bg08, :bg09, :bg10, :bg11, :bg12, :bg13, :bg14, :bg15,
                       :bg16, :bg17, :bg18, :bg19, :bg20, :bg21, :bg22, :bg23, :bg24, :bg25, :bg26,
                       :bg27, :bg28, :bh13, :bh14, :bh15, :bh16, :bh17, :bibb, :bibl, :bibm, :bibr,
                       :bica, :bici, :bigi, :biki, :bikr, :biky, :bima, :bimu, :bimw, :bimy, :bing,
                       :birm, :birt, :biry, :bjak, :bjal, :bjaq, :bjbo, :bjco, :bjdo, :bjko, :bjli,
                       :bjmo, :bjou, :bjpl, :bjzo, :bl, :bnbe, :bnbm, :bnte, :bntu, :bob, :boc, :boh,
                       :bol, :bon, :boo, :bop, :bos, :bot, :bqbo, :bqsa, :bqse, :brac, :bral, :bram,
                       :brap, :brba, :brce, :brdf, :bres, :brgo, :brma, :brmg, :brms, :brmt, :brpa,
                       :brpb, :brpe, :brpi, :brpr, :brrj, :brrn, :brro, :brrr, :brrs, :brsc, :brse,
                       :brsp, :brto, :bsak, :bsbi, :bsbp, :bsby, :bsce, :bsci, :bsck, :bsco, :bscs,
                       :bseg, :bsex, :bsfp, :bsgc, :bshi, :bsht, :bsin, :bsli, :bsmc, :bsmg, :bsmi,
                       :bsne, :bsno, :bsnp, :bsns, :bsrc, :bsri, :bssa, :bsse, :bsso, :bsss, :bssw,
                       :bswg, :bt11, :bt12, :bt13, :bt14, :bt15, :bt21, :bt22, :bt23, :bt24, :bt31,
                       :bt32, :bt33, :bt34, :bt41, :bt42, :bt43, :bt44, :bt45, :btga, :btty, :bwce,
                       :bwch, :bwfr, :bwga, :bwgh, :bwjw, :bwkg, :bwkl, :bwkw, :bwlo, :bwne, :bwnw,
                       :bwse, :bwso, :bwsp, :bwst, :bybr, :byhm, :byho, :byhr, :byma, :bymi, :byvi,
                       :bzbz, :bzcy, :bzczl, :bzow, :bzsc, :bztol, :caab, :cabc, :camb, :canb, :canl,
                       :cans, :cant, :canu, :caon, :cape, :caqc, :cask, :cayt, :cdbc, :cdbn, :cdbu,
                       :cdeq, :cdhk, :cdhl, :cdhu, :cdit, :cdka, :cdkc, :cdke, :cdkg, :cdkl, :cdkn,
                       :cdks, :cdkw, :cdlo, :cdlu, :cdma, :cdmn, :cdmo, :cdnk, :cdnu, :cdor, :cdsa,
                       :cdsk, :cdsu, :cdta, :cdto, :cdtu, :cfac, :cfbb, :cfbgf, :cfbk, :cfhk, :cfhm,
                       :cfhs, :cfkb, :cfkg, :cflb, :cfmb, :cfmp, :cfnm, :cfop, :cfse, :cfuk, :cfvk,
                       :cg11, :cg12, :cg13, :cg14, :cg15, :cg16, :cg2, :cg5, :cg7, :cg8, :cg9, :cgbzv,
                       :chag, :chai, :char, :chbe, :chbl, :chbs, :chfr, :chge, :chgl, :chgr, :chju,
                       :chlu, :chne, :chnw, :chow, :chsg, :chsh, :chso, :chsz, :chtg, :chti, :chur,
                       :chvd, :chvs, :chzg, :chzh, :ci01, :ci02, :ci03, :ci04, :ci05, :ci06, :ci07,
                       :ci08, :ci09, :ci10, :ci11, :ci12, :ci13, :ci14, :ci15, :ci16, :ci17, :ci18,
                       :ci19, :ciab, :cibs, :cicm, :cidn, :cigd, :cilc, :cilg, :cimg, :cism, :cisv,
                       :civb, :ciwr, :ciym, :cizz, :clai, :clan, :clap, :clar, :clat, :clbi, :clco,
                       :clli, :clll, :cllr, :clma, :clml, :clnb, :clrm, :clta, :clvs, :cmad, :cmce,
                       :cmen, :cmes, :cmlt, :cmno, :cmnw, :cmou, :cmsu, :cmsw, :cn71, :cn91, :cn92,
                       :cnah, :cnbj, :cncq, :cnfj, :cngd, :cngs, :cngx, :cngz, :cnha, :cnhb, :cnhe,
                       :cnhi, :cnhk, :cnhl, :cnhn, :cnjl, :cnjs, :cnjx, :cnln, :cnmo, :cnnm, :cnnx,
                       :cnqh, :cnsc, :cnsd, :cnsh, :cnsn, :cnsx, :cntj, :cntw, :cnxj, :cnxz, :cnyn,
                       :cnzj, :coama, :coant, :coara, :coatl, :cobol, :coboy, :cocal, :cocaq, :cocas,
                       :cocau, :coces, :cocho, :cocor, :cocun, :codc, :cogua, :coguv, :cohui, :colag,
                       :comag, :comet, :conar, :consa, :coput, :coqui, :coris, :cosan, :cosap, :cosuc,
                       :cotol, :covac, :covau, :covid, :cp, :cra, :crc, :crg, :crh, :crl, :crp, :crsj,
                       :cu01, :cu03, :cu04, :cu05, :cu06, :cu07, :cu08, :cu09, :cu10, :cu11, :cu12,
                       :cu13, :cu14, :cu15, :cu16, :cu99, :cvb, :cvbr, :cvbv, :cvca, :cvcf, :cvcr,
                       :cvma, :cvmo, :cvpa, :cvpn, :cvpr, :cvrb, :cvrg, :cvrs, :cvs, :cvsd, :cvsf,
                       :cvsl, :cvsm, :cvso, :cvss, :cvsv, :cvta, :cvts, :cw, :cy01, :cy02, :cy03,
                       :cy04, :cy05, :cy06, :cz10, :cz101, :cz102, :cz103, :cz104, :cz105, :cz106,
                       :cz107, :cz108, :cz109, :cz110, :cz111, :cz112, :cz113, :cz114, :cz115, :cz116,
                       :cz117, :cz118, :cz119, :cz120, :cz121, :cz122, :cz20, :cz201, :cz202, :cz203,
                       :cz204, :cz205, :cz206, :cz207, :cz208, :cz209, :cz20a, :cz20b, :cz20c, :cz31,
                       :cz311, :cz312, :cz313, :cz314, :cz315, :cz316, :cz317, :cz32, :cz321, :cz322,
                       :cz323, :cz324, :cz325, :cz326, :cz327, :cz41, :cz411, :cz412, :cz413, :cz42,
                       :cz421, :cz422, :cz423, :cz424, :cz425, :cz426, :cz427, :cz51, :cz511, :cz512,
                       :cz513, :cz514, :cz52, :cz521, :cz522, :cz523, :cz524, :cz525, :cz53, :cz531,
                       :cz532, :cz533, :cz534, :cz63, :cz631, :cz632, :cz633, :cz634, :cz635, :cz64,
                       :cz641, :cz642, :cz643, :cz644, :cz645, :cz646, :cz647, :cz71, :cz711, :cz712,
                       :cz713, :cz714, :cz715, :cz72, :cz721, :cz722, :cz723, :cz724, :cz80, :cz801,
                       :cz802, :cz803, :cz804, :cz805, :cz806, :debb, :debe, :debw, :deby, :dehb,
                       :dehe, :dehh, :demv, :deni, :denw, :derp, :desh, :desl, :desn, :dest, :deth,
                       :djar, :djas, :djdi, :djdj, :djob, :djta, :dk81, :dk82, :dk83, :dk84, :dk85,
                       :dm02, :dm03, :dm04, :dm05, :dm06, :dm07, :dm08, :dm09, :dm10, :dm11, :do01,
                       :do02, :do03, :do04, :do05, :do06, :do07, :do08, :do09, :do10, :do11, :do12,
                       :do13, :do14, :do15, :do16, :do17, :do18, :do19, :do20, :do21, :do22, :do23,
                       :do24, :do25, :do26, :do27, :do28, :do29, :do30, :do31, :do32, :do33, :do34,
                       :do35, :do36, :do37, :do38, :do39, :do40, :do41, :do42, :dz01, :dz02, :dz03,
                       :dz04, :dz05, :dz06, :dz07, :dz08, :dz09, :dz10, :dz11, :dz12, :dz13, :dz14,
                       :dz15, :dz16, :dz17, :dz18, :dz19, :dz20, :dz21, :dz22, :dz23, :dz24, :dz25,
                       :dz26, :dz27, :dz28, :dz29, :dz30, :dz31, :dz32, :dz33, :dz34, :dz35, :dz36,
                       :dz37, :dz38, :dz39, :dz40, :dz41, :dz42, :dz43, :dz44, :dz45, :dz46, :dz47,
                       :dz48, :eca, :ecb, :ecc, :ecd, :ece, :ecf, :ecg, :ech, :eci, :ecl, :ecm, :ecn,
                       :eco, :ecp, :ecr, :ecs, :ecsd, :ecse, :ect, :ecu, :ecw, :ecx, :ecy, :ecz,
                       :ee130, :ee141, :ee142, :ee171, :ee184, :ee191, :ee198, :ee205, :ee214, :ee245,
                       :ee247, :ee251, :ee255, :ee272, :ee283, :ee284, :ee291, :ee293, :ee296, :ee303,
                       :ee305, :ee317, :ee321, :ee338, :ee353, :ee37, :ee39, :ee424, :ee430, :ee431,
                       :ee432, :ee44, :ee441, :ee442, :ee446, :ee45, :ee478, :ee480, :ee486, :ee49,
                       :ee50, :ee503, :ee51, :ee511, :ee514, :ee52, :ee528, :ee557, :ee56, :ee567,
                       :ee57, :ee586, :ee59, :ee60, :ee615, :ee618, :ee622, :ee624, :ee638, :ee64,
                       :ee65, :ee651, :ee653, :ee661, :ee663, :ee668, :ee67, :ee68, :ee689, :ee698,
                       :ee70, :ee708, :ee71, :ee712, :ee714, :ee719, :ee726, :ee732, :ee735, :ee74,
                       :ee78, :ee784, :ee79, :ee792, :ee793, :ee796, :ee803, :ee809, :ee81, :ee82,
                       :ee824, :ee834, :ee84, :ee855, :ee86, :ee87, :ee890, :ee897, :ee899, :ee901,
                       :ee903, :ee907, :ee917, :ee919, :ee928, :egalx, :egasn, :egast, :egba, :egbh,
                       :egbns, :egc, :egdk, :egdt, :egfym, :eggh, :eggz, :egis, :egjs, :egkb, :egkfs,
                       :egkn, :eglx, :egmn, :egmnf, :egmt, :egpts, :egshg, :egshr, :egsin, :egsuz,
                       :egwad, :eran, :erdk, :erdu, :ergb, :erma, :ersk, :esa, :esab, :esal, :esan,
                       :esar, :esas, :esav, :esb, :esba, :esbi, :esbu, :esc, :esca, :escb, :escc,
                       :esce, :escl, :escm, :escn, :esco, :escr, :escs, :esct, :escu, :esex, :esga,
                       :esgc, :esgi, :esgr, :esgu, :esh, :eshu, :esib, :esj, :esl, :esle, :eslo,
                       :eslu, :esm, :esma, :esmc, :esmd, :esml, :esmu, :esna, :esnc, :eso, :esor,
                       :esp, :espm, :espo, :espv, :esri, :ess, :essa, :esse, :essg, :esso, :esss,
                       :est, :este, :estf, :esto, :esv, :esva, :esvc, :esvi, :esz, :esza, :etaa,
                       :etaf, :etam, :etbe, :etdd, :etga, :etha, :etor, :etsn, :etso, :etti, :fi01,
                       :fi02, :fi03, :fi04, :fi05, :fi06, :fi07, :fi08, :fi09, :fi10, :fi11, :fi12,
                       :fi13, :fi14, :fi15, :fi16, :fi17, :fi18, :fi19, :fj01, :fj02, :fj03, :fj04,
                       :fj05, :fj06, :fj07, :fj08, :fj09, :fj10, :fj11, :fj12, :fj13, :fj14, :fjc,
                       :fje, :fjn, :fjr, :fjw, :fmksa, :fmpni, :fmtrk, :fmyap, :fr01, :fr02, :fr03,
                       :fr04, :fr05, :fr06, :fr07, :fr08, :fr09, :fr10, :fr11, :fr12, :fr13, :fr14,
                       :fr15, :fr16, :fr17, :fr18, :fr19, :fr20r, :fr21, :fr22, :fr23, :fr24, :fr25,
                       :fr26, :fr27, :fr28, :fr29, :fr2a, :fr2b, :fr30, :fr31, :fr32, :fr33, :fr34,
                       :fr35, :fr36, :fr37, :fr38, :fr39, :fr40, :fr41, :fr42, :fr43, :fr44, :fr45,
                       :fr46, :fr47, :fr48, :fr49, :fr50, :fr51, :fr52, :fr53, :fr54, :fr55, :fr56,
                       :fr57, :fr58, :fr59, :fr60, :fr61, :fr62, :fr63, :fr64, :fr65, :fr66, :fr67,
                       :fr68, :fr69, :fr70, :fr71, :fr72, :fr73, :fr74, :fr75, :fr76, :fr77, :fr78,
                       :fr79, :fr80, :fr81, :fr82, :fr83, :fr84, :fr85, :fr86, :fr87, :fr88, :fr89,
                       :fr90, :fr91, :fr92, :fr93, :fr94, :fr95, :fr971, :fr972, :fr973, :fr974,
                       :fr976, :frara, :frbfc, :frbl, :frbre, :frcor, :frcp, :frcvl, :frges, :frgf,
                       :frgp, :frgua, :frhdf, :fridf, :frlre, :frmay, :frmf, :frmq, :frnaq, :frnc,
                       :frnor, :frocc, :frpac, :frpdl, :frpf, :frpm, :frre, :frtf, :frwf, :fryt, :ga1,
                       :ga2, :ga3, :ga4, :ga5, :ga6, :ga7, :ga8, :ga9, :gbabc, :gbabd, :gbabe, :gbagb,
                       :gbagy, :gband, :gbann, :gbans, :gbant, :gbard, :gbarm, :gbbas, :gbbbd, :gbbcp,
                       :gbbdf, :gbbdg, :gbben, :gbbex, :gbbfs, :gbbge, :gbbgw, :gbbir, :gbbkm, :gbbla,
                       :gbbly, :gbbmh, :gbbnb, :gbbne, :gbbnh, :gbbns, :gbbol, :gbbpl, :gbbrc, :gbbrd,
                       :gbbry, :gbbst, :gbbur, :gbcam, :gbcay, :gbcbf, :gbccg, :gbcgn, :gbcgv, :gbche,
                       :gbchw, :gbckf, :gbckt, :gbcld, :gbclk, :gbclr, :gbcma, :gbcmd, :gbcmn, :gbcon,
                       :gbcov, :gbcrf, :gbcry, :gbcsr, :gbcwy, :gbdal, :gbdby, :gbden, :gbder, :gbdev,
                       :gbdgn, :gbdgy, :gbdnc, :gbdnd, :gbdor, :gbdow, :gbdrs, :gbdry, :gbdud, :gbdur,
                       :gbeal, :gbeaw, :gbeay, :gbedh, :gbedu, :gbeln, :gbels, :gbenf, :gbeng, :gberw,
                       :gbery, :gbess, :gbesx, :gbfal, :gbfer, :gbfif, :gbfln, :gbfmo, :gbgat, :gbgbn,
                       :gbglg, :gbgls, :gbgre, :gbgwn, :gbhal, :gbham, :gbhav, :gbhck, :gbhef, :gbhil,
                       :gbhld, :gbhmf, :gbhns, :gbhpl, :gbhrt, :gbhrw, :gbhry, :gbios, :gbiow, :gbisl,
                       :gbivc, :gbkec, :gbken, :gbkhl, :gbkir, :gbktt, :gbkwl, :gblan, :gblbc, :gblbh,
                       :gblce, :gblds, :gblec, :gblew, :gblin, :gbliv, :gblmv, :gblnd, :gblrn, :gblsb,
                       :gblut, :gbman, :gbmdb, :gbmdw, :gbmea, :gbmft, :gbmik, :gbmln, :gbmon, :gbmrt,
                       :gbmry, :gbmty, :gbmul, :gbmyl, :gbnay, :gbnbl, :gbndn, :gbnel, :gbnet, :gbnfk,
                       :gbngm, :gbnir, :gbnlk, :gbnln, :gbnmd, :gbnsm, :gbnta, :gbnth, :gbntl, :gbntt,
                       :gbnty, :gbnwm, :gbnwp, :gbnyk, :gbnym, :gbold, :gbomh, :gbork, :gboxf, :gbpem,
                       :gbpkn, :gbply, :gbpol, :gbpor, :gbpow, :gbpte, :gbrcc, :gbrch, :gbrct, :gbrdb,
                       :gbrdg, :gbrfw, :gbric, :gbrot, :gbrut, :gbsaw, :gbsay, :gbscb, :gbsct, :gbsfk,
                       :gbsft, :gbsgc, :gbshf, :gbshn, :gbshr, :gbskp, :gbslf, :gbslg, :gbslk, :gbsnd,
                       :gbsol, :gbsom, :gbsos, :gbsry, :gbstb, :gbste, :gbstg, :gbsth, :gbstn, :gbsts,
                       :gbstt, :gbsty, :gbswa, :gbswd, :gbswk, :gbtam, :gbtfw, :gbthr, :gbtob, :gbtof,
                       :gbtrf, :gbtwh, :gbukm, :gbvgl, :gbwar, :gbwbk, :gbwdu, :gbwft, :gbwgn, :gbwil,
                       :gbwkf, :gbwll, :gbwln, :gbwls, :gbwlv, :gbwnd, :gbwnm, :gbwok, :gbwor, :gbwrl,
                       :gbwrt, :gbwrx, :gbwsm, :gbwsx, :gbyor, :gbzet, :gd01, :gd02, :gd03, :gd04,
                       :gd05, :gd06, :gd10, :geab, :geaj, :gegu, :geim, :geka, :gekk, :gemm, :gerl,
                       :gesj, :gesk, :gesz, :getb, :gf, :ghaa, :ghaf, :ghah, :ghba, :ghbe, :ghbo,
                       :ghcp, :ghep, :ghne, :ghnp, :ghot, :ghsv, :ghtv, :ghue, :ghuw, :ghwn, :ghwp,
                       :glav, :glku, :glqa, :glqe, :glqt, :glsm, :gmb, :gml, :gmm, :gmn, :gmu, :gmw,
                       :gnb, :gnbe, :gnbf, :gnbk, :gnc, :gnco, :gnd, :gndb, :gndi, :gndl, :gndu, :gnf,
                       :gnfa, :gnfo, :gnfr, :gnga, :gngu, :gnk, :gnka, :gnkb, :gnkd, :gnke, :gnkn,
                       :gnko, :gnks, :gnl, :gnla, :gnle, :gnlo, :gnm, :gnmc, :gnmd, :gnml, :gnmm,
                       :gnn, :gnnz, :gnpi, :gnsi, :gnte, :gnto, :gnyo, :gp, :gqan, :gqbn, :gqbs, :gqc,
                       :gqcs, :gqdj, :gqi, :gqkn, :gqli, :gqwn, :gr01, :gr03, :gr04, :gr05, :gr06,
                       :gr07, :gr11, :gr12, :gr13, :gr14, :gr15, :gr16, :gr17, :gr21, :gr22, :gr23,
                       :gr24, :gr31, :gr32, :gr33, :gr34, :gr41, :gr42, :gr43, :gr44, :gr51, :gr52,
                       :gr53, :gr54, :gr55, :gr56, :gr57, :gr58, :gr59, :gr61, :gr62, :gr63, :gr64,
                       :gr69, :gr71, :gr72, :gr73, :gr81, :gr82, :gr83, :gr84, :gr85, :gr91, :gr92,
                       :gr93, :gr94, :gra, :gra1, :grb, :grc, :grd, :gre, :grf, :grg, :grh, :gri,
                       :grj, :grk, :grl, :grm, :gtav, :gtbv, :gtcm, :gtcq, :gtes, :gtgu, :gthu, :gtiz,
                       :gtja, :gtju, :gtpe, :gtpr, :gtqc, :gtqz, :gtre, :gtsa, :gtsm, :gtso, :gtsr,
                       :gtsu, :gtto, :gtza, :gu, :gwba, :gwbl, :gwbm, :gwbs, :gwca, :gwga, :gwl, :gwn,
                       :gwoi, :gwqu, :gws, :gwto, :gyba, :gycu, :gyde, :gyeb, :gyes, :gyma, :gypm,
                       :gypt, :gyud, :gyut, :hk, :hnat, :hnch, :hncl, :hncm, :hncp, :hncr, :hnep,
                       :hnfm, :hngd, :hnib, :hnin, :hnle, :hnlp, :hnoc, :hnol, :hnsb, :hnva, :hnyo,
                       :hr01, :hr02, :hr03, :hr04, :hr05, :hr06, :hr07, :hr08, :hr09, :hr10, :hr11,
                       :hr12, :hr13, :hr14, :hr15, :hr16, :hr17, :hr18, :hr19, :hr20, :hr21, :htar,
                       :htce, :htga, :htnd, :htne, :htni, :htno, :htou, :htsd, :htse, :huba, :hubc,
                       :hube, :hubk, :hubu, :hubz, :hucs, :hude, :hudu, :hueg, :huer, :hufe, :hugs,
                       :hugy, :huhb, :huhe, :huhv, :hujn, :huke, :hukm, :hukv, :humi, :hunk, :huno,
                       :huny, :hupe, :hups, :husd, :husf, :hush, :husk, :husn, :huso, :huss, :hust,
                       :husz, :hutb, :huto, :huva, :huve, :huvm, :huza, :huze, :ic, :idac, :idba,
                       :idbb, :idbe, :idbt, :idgo, :idja, :idjb, :idji, :idjk, :idjt, :idjw, :idka,
                       :idkb, :idki, :idkr, :idks, :idkt, :idku, :idla, :idma, :idml, :idmu, :idnb,
                       :idnt, :idnu, :idpa, :idpb, :idpp, :idri, :idsa, :idsb, :idsg, :idsl, :idsm,
                       :idsn, :idsr, :idss, :idst, :idsu, :idyo, :iec, :iece, :iecn, :ieco, :iecw,
                       :ied, :iedl, :ieg, :ieke, :iekk, :ieky, :iel, :ield, :ielh, :ielk, :ielm,
                       :iels, :iem, :iemh, :iemn, :iemo, :ieoy, :iern, :ieso, :ieta, :ieu, :iewd,
                       :iewh, :ieww, :iewx, :ild, :ilha, :iljm, :ilm, :ilta, :ilz, :inan, :inap,
                       :inar, :inas, :inbr, :inch, :inct, :indd, :indh, :indl, :indn, :inga, :ingj,
                       :inhp, :inhr, :injh, :injk, :inka, :inkl, :inla, :inld, :inmh, :inml, :inmn,
                       :inmp, :inmz, :innl, :inor, :inpb, :inpy, :inrj, :insk, :intg, :intn, :intr,
                       :inup, :inut, :inwb, :iqan, :iqar, :iqba, :iqbb, :iqbg, :iqda, :iqdi, :iqdq,
                       :iqka, :iqki, :iqma, :iqmu, :iqna, :iqni, :iqqa, :iqsd, :iqsu, :iqwa, :ir00,
                       :ir01, :ir02, :ir03, :ir04, :ir05, :ir06, :ir07, :ir08, :ir09, :ir10, :ir11,
                       :ir12, :ir13, :ir14, :ir15, :ir16, :ir17, :ir18, :ir19, :ir20, :ir21, :ir22,
                       :ir23, :ir24, :ir25, :ir26, :ir27, :ir28, :ir29, :ir30, :ir31, :ir32, :is0,
                       :is1, :is2, :is3, :is4, :is5, :is6, :is7, :is8, :isakh, :isakn, :isaku, :isarn,
                       :isasa, :isbfj, :isbla, :isblo, :isbog, :isbol, :isdab, :isdav, :isdju, :iseom,
                       :iseyf, :isfjd, :isfjl, :isfla, :isfld, :isflr, :isgar, :isgog, :isgrn, :isgru,
                       :isgry, :ishaf, :ishel, :ishrg, :ishru, :ishut, :ishuv, :ishva, :ishve, :isisa,
                       :iskal, :iskjo, :iskop, :islan, :ismos, :ismyr, :isnor, :isrge, :isrgy, :isrhh,
                       :isrkn, :isrkv, :issbh, :issbt, :issdn, :issdv, :issel, :issey, :issfa, :isshf,
                       :isskf, :isskg, :issko, :issku, :issnf, :issog, :issol, :isssf, :issss, :isstr,
                       :issty, :issvg, :istal, :isthg, :istjo, :isvem, :isver, :isvop, :it21, :it23,
                       :it25, :it32, :it34, :it36, :it42, :it45, :it52, :it55, :it57, :it62, :it65,
                       :it67, :it72, :it75, :it77, :it78, :it82, :it88, :itag, :ital, :itan, :itao,
                       :itap, :itaq, :itar, :itat, :itav, :itba, :itbg, :itbi, :itbl, :itbn, :itbo,
                       :itbr, :itbs, :itbt, :itbz, :itca, :itcb, :itce, :itch, :itci, :itcl, :itcn,
                       :itco, :itcr, :itcs, :itct, :itcz, :iten, :itfc, :itfe, :itfg, :itfi, :itfm,
                       :itfr, :itge, :itgo, :itgr, :itim, :itis, :itkr, :itlc, :itle, :itli, :itlo,
                       :itlt, :itlu, :itmb, :itmc, :itme, :itmi, :itmn, :itmo, :itms, :itmt, :itna,
                       :itno, :itnu, :itog, :itor, :itot, :itpa, :itpc, :itpd, :itpe, :itpg, :itpi,
                       :itpn, :itpo, :itpr, :itpt, :itpu, :itpv, :itpz, :itra, :itrc, :itre, :itrg,
                       :itri, :itrm, :itrn, :itro, :itsa, :itsd, :itsi, :itso, :itsp, :itsr, :itss,
                       :itsu, :itsv, :itta, :itte, :ittn, :itto, :ittp, :ittr, :itts, :ittv, :itud,
                       :itva, :itvb, :itvc, :itve, :itvi, :itvr, :itvs, :itvt, :itvv, :jm01, :jm02,
                       :jm03, :jm04, :jm05, :jm06, :jm07, :jm08, :jm09, :jm10, :jm11, :jm12, :jm13,
                       :jm14, :joaj, :joam, :joaq, :joat, :joaz, :joba, :joir, :joja, :joka, :joma,
                       :jomd, :jomn, :jp01, :jp02, :jp03, :jp04, :jp05, :jp06, :jp07, :jp08, :jp09,
                       :jp10, :jp11, :jp12, :jp13, :jp14, :jp15, :jp16, :jp17, :jp18, :jp19, :jp20,
                       :jp21, :jp22, :jp23, :jp24, :jp25, :jp26, :jp27, :jp28, :jp29, :jp30, :jp31,
                       :jp32, :jp33, :jp34, :jp35, :jp36, :jp37, :jp38, :jp39, :jp40, :jp41, :jp42,
                       :jp43, :jp44, :jp45, :jp46, :jp47, :ke01, :ke02, :ke03, :ke04, :ke05, :ke06,
                       :ke07, :ke08, :ke09, :ke10, :ke11, :ke12, :ke13, :ke14, :ke15, :ke16, :ke17,
                       :ke18, :ke19, :ke20, :ke21, :ke22, :ke23, :ke24, :ke25, :ke26, :ke27, :ke28,
                       :ke29, :ke30, :ke31, :ke32, :ke33, :ke34, :ke35, :ke36, :ke37, :ke38, :ke39,
                       :ke40, :ke41, :ke42, :ke43, :ke44, :ke45, :ke46, :ke47, :kgb, :kgc, :kggb,
                       :kggo, :kgj, :kgn, :kgo, :kgt, :kgy, :kh1, :kh10, :kh11, :kh12, :kh13, :kh14,
                       :kh15, :kh16, :kh17, :kh18, :kh19, :kh2, :kh20, :kh21, :kh22, :kh23, :kh24,
                       :kh25, :kh3, :kh4, :kh5, :kh6, :kh7, :kh8, :kh9, :kig, :kil, :kip, :kma, :kmg,
                       :kmm, :kn01, :kn02, :kn03, :kn04, :kn05, :kn06, :kn07, :kn08, :kn09, :kn10,
                       :kn11, :kn12, :kn13, :kn15, :knk, :knn, :kp01, :kp02, :kp03, :kp04, :kp05,
                       :kp06, :kp07, :kp08, :kp09, :kp10, :kp13, :kp14, :kr11, :kr26, :kr27, :kr28,
                       :kr29, :kr30, :kr31, :kr41, :kr42, :kr43, :kr44, :kr45, :kr46, :kr47, :kr48,
                       :kr49, :kr50, :kwah, :kwfa, :kwha, :kwja, :kwku, :kwmu, :kzakm, :kzakt, :kzala,
                       :kzalm, :kzast, :kzaty, :kzbay, :kzkar, :kzkus, :kzkzy, :kzman, :kzpav, :kzsev,
                       :kzshy, :kzvos, :kzyuz, :kzzap, :kzzha, :laat, :labk, :labl, :lach, :laho,
                       :lakh, :lalm, :lalp, :laou, :laph, :lasl, :lasv, :lavi, :lavt, :laxa, :laxe,
                       :laxi, :laxs, :lbak, :lbas, :lbba, :lbbh, :lbbi, :lbja, :lbjl, :lbna, :lc01,
                       :lc02, :lc03, :lc05, :lc06, :lc07, :lc08, :lc10, :lc11, :lc12, :li01, :li02,
                       :li03, :li04, :li05, :li06, :li07, :li08, :li09, :li10, :li11, :lk1, :lk11,
                       :lk12, :lk13, :lk2, :lk21, :lk22, :lk23, :lk3, :lk31, :lk32, :lk33, :lk4,
                       :lk41, :lk42, :lk43, :lk44, :lk45, :lk5, :lk51, :lk52, :lk53, :lk6, :lk61,
                       :lk62, :lk7, :lk71, :lk72, :lk8, :lk81, :lk82, :lk9, :lk91, :lk92, :lrbg,
                       :lrbm, :lrcm, :lrgb, :lrgg, :lrgk, :lrgp, :lrlo, :lrmg, :lrmo, :lrmy, :lrni,
                       :lrrg, :lrri, :lrsi, :lsa, :lsb, :lsc, :lsd, :lse, :lsf, :lsg, :lsh, :lsj,
                       :lsk, :lt01, :lt02, :lt03, :lt04, :lt05, :lt06, :lt07, :lt08, :lt09, :lt10,
                       :lt11, :lt12, :lt13, :lt14, :lt15, :lt16, :lt17, :lt18, :lt19, :lt20, :lt21,
                       :lt22, :lt23, :lt24, :lt25, :lt26, :lt27, :lt28, :lt29, :lt30, :lt31, :lt32,
                       :lt33, :lt34, :lt35, :lt36, :lt37, :lt38, :lt39, :lt40, :lt41, :lt42, :lt43,
                       :lt44, :lt45, :lt46, :lt47, :lt48, :lt49, :lt50, :lt51, :lt52, :lt53, :lt54,
                       :lt55, :lt56, :lt57, :lt58, :lt59, :lt60, :ltal, :ltkl, :ltku, :ltmr, :ltpn,
                       :ltsa, :ltta, :ltte, :ltut, :ltvl, :luca, :lucl, :ludi, :luec, :lues, :lugr,
                       :lulu, :lume, :lurd, :lurm, :luvd, :luwi, :lv001, :lv002, :lv003, :lv004,
                       :lv005, :lv006, :lv007, :lv008, :lv009, :lv010, :lv011, :lv012, :lv013, :lv014,
                       :lv015, :lv016, :lv017, :lv018, :lv019, :lv020, :lv021, :lv022, :lv023, :lv024,
                       :lv025, :lv026, :lv027, :lv028, :lv029, :lv030, :lv031, :lv032, :lv033, :lv034,
                       :lv035, :lv036, :lv037, :lv038, :lv039, :lv040, :lv041, :lv042, :lv043, :lv044,
                       :lv045, :lv046, :lv047, :lv048, :lv049, :lv050, :lv051, :lv052, :lv053, :lv054,
                       :lv055, :lv056, :lv057, :lv058, :lv059, :lv060, :lv061, :lv062, :lv063, :lv064,
                       :lv065, :lv066, :lv067, :lv068, :lv069, :lv070, :lv071, :lv072, :lv073, :lv074,
                       :lv075, :lv076, :lv077, :lv078, :lv079, :lv080, :lv081, :lv082, :lv083, :lv084,
                       :lv085, :lv086, :lv087, :lv088, :lv089, :lv090, :lv091, :lv092, :lv093, :lv094,
                       :lv095, :lv096, :lv097, :lv098, :lv099, :lv100, :lv101, :lv102, :lv103, :lv104,
                       :lv105, :lv106, :lv107, :lv108, :lv109, :lv110, :lvdgv, :lvjel, :lvjkb, :lvjur,
                       :lvlpx, :lvrez, :lvrix, :lvven, :lvvmr, :lyba, :lybu, :lydr, :lygt, :lyja,
                       :lyjg, :lyji, :lyju, :lykf, :lymb, :lymi, :lymj, :lymq, :lynl, :lynq, :lysb,
                       :lysr, :lytb, :lywa, :lywd, :lyws, :lyza, :ma01, :ma02, :ma03, :ma04, :ma05,
                       :ma06, :ma07, :ma08, :ma09, :ma10, :ma11, :ma12, :ma13, :ma14, :ma15, :ma16,
                       :maagd, :maaou, :maasz, :maazi, :mabem, :maber, :mabes, :mabod, :mabom, :mabrr,
                       :macas, :mache, :machi, :macht, :madri, :maerr, :maesi, :maesm, :mafah, :mafes,
                       :mafig, :mafqh, :mague, :maguf, :mahaj, :mahao, :mahoc, :maifr, :maine, :majdi,
                       :majra, :maken, :makes, :makhe, :makhn, :makho, :malaa, :malar, :mamar, :mamdf,
                       :mamed, :mamek, :mamid, :mammd, :mammn, :mamoh, :mamou, :manad, :manou, :maoua,
                       :maoud, :maouj, :maouz, :marab, :mareh, :masaf, :masal, :masef, :maset, :masib,
                       :masif, :masik, :masil, :maskh, :masyb, :mataf, :matai, :matao, :matar, :matat,
                       :mataz, :matet, :matin, :matiz, :matng, :matnt, :mayus, :mazag, :mccl, :mcco,
                       :mcfo, :mcga, :mcje, :mcla, :mcma, :mcmc, :mcmg, :mcmo, :mcmu, :mcph, :mcsd,
                       :mcso, :mcsp, :mcsr, :mcvr, :mdan, :mdba, :mdbd, :mdbr, :mdbs, :mdca, :mdcl,
                       :mdcm, :mdcr, :mdcs, :mdct, :mdcu, :mddo, :mddr, :mddu, :mded, :mdfa, :mdfl,
                       :mdga, :mdgl, :mdhi, :mdia, :mdle, :mdni, :mdoc, :mdor, :mdre, :mdri, :mdsd,
                       :mdsi, :mdsn, :mdso, :mdst, :mdsv, :mdta, :mdte, :mdun, :me01, :me02, :me03,
                       :me04, :me05, :me06, :me07, :me08, :me09, :me10, :me11, :me12, :me13, :me14,
                       :me15, :me16, :me17, :me18, :me19, :me20, :me21, :me22, :me23, :me24, :mf,
                       :mga, :mgd, :mgf, :mgm, :mgt, :mgu, :mhalk, :mhall, :mharn, :mhaur, :mhebo,
                       :mheni, :mhjab, :mhjal, :mhkil, :mhkwa, :mhl, :mhlae, :mhlib, :mhlik, :mhmaj,
                       :mhmal, :mhmej, :mhmil, :mhnmk, :mhnmu, :mhron, :mht, :mhuja, :mhuti, :mhwth,
                       :mhwtj, :mk01, :mk02, :mk03, :mk04, :mk05, :mk06, :mk07, :mk08, :mk09, :mk10,
                       :mk101, :mk102, :mk103, :mk104, :mk105, :mk106, :mk107, :mk108, :mk109, :mk11,
                       :mk12, :mk13, :mk14, :mk15, :mk16, :mk17, :mk18, :mk19, :mk20, :mk201, :mk202,
                       :mk203, :mk204, :mk205, :mk206, :mk207, :mk208, :mk209, :mk21, :mk210, :mk211,
                       :mk22, :mk23, :mk24, :mk25, :mk26, :mk27, :mk28, :mk29, :mk30, :mk301, :mk303,
                       :mk304, :mk307, :mk308, :mk31, :mk310, :mk311, :mk312, :mk313, :mk32, :mk33,
                       :mk34, :mk35, :mk36, :mk37, :mk38, :mk39, :mk40, :mk401, :mk402, :mk403,
                       :mk404, :mk405, :mk406, :mk407, :mk408, :mk409, :mk41, :mk410, :mk42, :mk43,
                       :mk44, :mk45, :mk46, :mk47, :mk48, :mk49, :mk50, :mk501, :mk502, :mk503,
                       :mk504, :mk505, :mk506, :mk507, :mk508, :mk509, :mk51, :mk52, :mk53, :mk54,
                       :mk55, :mk56, :mk57, :mk58, :mk59, :mk60, :mk601, :mk602, :mk603, :mk604,
                       :mk605, :mk606, :mk607, :mk608, :mk609, :mk61, :mk62, :mk63, :mk64, :mk65,
                       :mk66, :mk67, :mk68, :mk69, :mk70, :mk701, :mk702, :mk703, :mk704, :mk705,
                       :mk706, :mk71, :mk72, :mk73, :mk74, :mk75, :mk76, :mk77, :mk78, :mk79, :mk80,
                       :mk801, :mk802, :mk803, :mk804, :mk805, :mk806, :mk807, :mk808, :mk809, :mk81,
                       :mk810, :mk811, :mk812, :mk813, :mk814, :mk815, :mk816, :mk817, :mk82, :mk83,
                       :mk84, :mk85, :ml1, :ml10, :ml2, :ml3, :ml4, :ml5, :ml6, :ml7, :ml8, :ml9,
                       :mlbko, :mm01, :mm02, :mm03, :mm04, :mm05, :mm06, :mm07, :mm11, :mm12, :mm13,
                       :mm14, :mm15, :mm16, :mm17, :mm18, :mn035, :mn037, :mn039, :mn041, :mn043,
                       :mn046, :mn047, :mn049, :mn051, :mn053, :mn055, :mn057, :mn059, :mn061, :mn063,
                       :mn064, :mn065, :mn067, :mn069, :mn071, :mn073, :mn1, :mo, :mp, :mq, :mr01,
                       :mr02, :mr03, :mr04, :mr05, :mr06, :mr07, :mr08, :mr09, :mr10, :mr11, :mr12,
                       :mr13, :mr14, :mr15, :mt01, :mt02, :mt03, :mt04, :mt05, :mt06, :mt07, :mt08,
                       :mt09, :mt10, :mt11, :mt12, :mt13, :mt14, :mt15, :mt16, :mt17, :mt18, :mt19,
                       :mt20, :mt21, :mt22, :mt23, :mt24, :mt25, :mt26, :mt27, :mt28, :mt29, :mt30,
                       :mt31, :mt32, :mt33, :mt34, :mt35, :mt36, :mt37, :mt38, :mt39, :mt40, :mt41,
                       :mt42, :mt43, :mt44, :mt45, :mt46, :mt47, :mt48, :mt49, :mt50, :mt51, :mt52,
                       :mt53, :mt54, :mt55, :mt56, :mt57, :mt58, :mt59, :mt60, :mt61, :mt62, :mt63,
                       :mt64, :mt65, :mt66, :mt67, :mt68, :muag, :mubl, :mubr, :mucc, :mucu, :mufl,
                       :mugp, :mumo, :mupa, :mupl, :mupu, :mupw, :muqb, :muro, :murr, :musa, :muvp,
                       :mv00, :mv01, :mv02, :mv03, :mv04, :mv05, :mv07, :mv08, :mv12, :mv13, :mv14,
                       :mv17, :mv20, :mv23, :mv24, :mv25, :mv26, :mv27, :mv28, :mv29, :mvce, :mvmle,
                       :mvnc, :mvno, :mvsc, :mvsu, :mvun, :mvus, :mwba, :mwbl, :mwc, :mwck, :mwcr,
                       :mwct, :mwde, :mwdo, :mwkr, :mwks, :mwli, :mwlk, :mwmc, :mwmg, :mwmh, :mwmu,
                       :mwmw, :mwmz, :mwn, :mwnb, :mwne, :mwni, :mwnk, :mwns, :mwnu, :mwph, :mwru,
                       :mws, :mwsa, :mwth, :mwzo, :mxagu, :mxbcn, :mxbcs, :mxcam, :mxchh, :mxchp,
                       :mxcmx, :mxcoa, :mxcol, :mxdif, :mxdur, :mxgro, :mxgua, :mxhid, :mxjal, :mxmex,
                       :mxmic, :mxmor, :mxnay, :mxnle, :mxoax, :mxpue, :mxque, :mxroo, :mxsin, :mxslp,
                       :mxson, :mxtab, :mxtam, :mxtla, :mxver, :mxyuc, :mxzac, :my01, :my02, :my03,
                       :my04, :my05, :my06, :my07, :my08, :my09, :my10, :my11, :my12, :my13, :my14,
                       :my15, :my16, :mza, :mzb, :mzg, :mzi, :mzl, :mzmpm, :mzn, :mzp, :mzq, :mzs,
                       :mzt, :naca, :naer, :naha, :naka, :nake, :nakh, :naku, :nakw, :naod, :naoh,
                       :naon, :naos, :naot, :naow, :nc, :ne1, :ne2, :ne3, :ne4, :ne5, :ne6, :ne7,
                       :ne8, :ngab, :ngad, :ngak, :ngan, :ngba, :ngbe, :ngbo, :ngby, :ngcr, :ngde,
                       :ngeb, :nged, :ngek, :ngen, :ngfc, :nggo, :ngim, :ngji, :ngkd, :ngke, :ngkn,
                       :ngko, :ngkt, :ngkw, :ngla, :ngna, :ngni, :ngog, :ngon, :ngos, :ngoy, :ngpl,
                       :ngri, :ngso, :ngta, :ngyo, :ngza, :nian, :nias, :nibo, :nica, :nici, :nico,
                       :nies, :nigr, :niji, :nile, :nimd, :nimn, :nims, :nimt, :nins, :niri, :nisj,
                       :nlaw, :nlbq1, :nlbq2, :nlbq3, :nlcw, :nldr, :nlfl, :nlfr, :nlge, :nlgr, :nlli,
                       :nlnb, :nlnh, :nlov, :nlsx, :nlut, :nlze, :nlzh, :no01, :no02, :no03, :no04,
                       :no05, :no06, :no07, :no08, :no09, :no10, :no11, :no12, :no14, :no15, :no16,
                       :no17, :no18, :no19, :no20, :no21, :no22, :no23, :no30, :no34, :no38, :no42,
                       :no46, :no50, :no54, :np1, :np2, :np3, :np4, :np5, :npba, :npbh, :npdh, :npga,
                       :npja, :npka, :npko, :nplu, :npma, :npme, :npna, :npp1, :npp2, :npp3, :npp4,
                       :npp5, :npp6, :npp7, :npra, :npsa, :npse, :nr01, :nr02, :nr03, :nr04, :nr05,
                       :nr06, :nr07, :nr08, :nr09, :nr10, :nr11, :nr12, :nr13, :nr14, :nzauk, :nzbop,
                       :nzcan, :nzcit, :nzgis, :nzhkb, :nzmbh, :nzmwt, :nznsn, :nzntl, :nzota, :nzstl,
                       :nztas, :nztki, :nzwgn, :nzwko, :nzwtc, :ombj, :ombs, :ombu, :omda, :omma,
                       :ommu, :omsj, :omss, :omwu, :omza, :omzu, :pa1, :pa10, :pa2, :pa3, :pa4, :pa5,
                       :pa6, :pa7, :pa8, :pa9, :paem, :paky, :panb, :peama, :peanc, :peapu, :peare,
                       :peaya, :pecaj, :pecal, :pecus, :pehuc, :pehuv, :peica, :pejun, :pelal, :pelam,
                       :pelim, :pelma, :pelor, :pemdd, :pemoq, :pepas, :pepiu, :pepun, :pesam, :petac,
                       :petum, :peuca, :pf, :pgcpk, :pgcpm, :pgebr, :pgehg, :pgepw, :pgesw, :pggpk,
                       :pghla, :pgjwk, :pgmba, :pgmpl, :pgmpm, :pgmrl, :pgncd, :pgnik, :pgnpp, :pgnsb,
                       :pgsan, :pgshm, :pgwbk, :pgwhm, :pgwpd, :ph00, :ph01, :ph02, :ph03, :ph05,
                       :ph06, :ph07, :ph08, :ph09, :ph10, :ph11, :ph12, :ph13, :ph14, :ph15, :ph40,
                       :ph41, :phabr, :phagn, :phags, :phakl, :phalb, :phant, :phapa, :phaur, :phban,
                       :phbas, :phben, :phbil, :phboh, :phbtg, :phbtn, :phbuk, :phbul, :phcag, :phcam,
                       :phcan, :phcap, :phcas, :phcat, :phcav, :phceb, :phcom, :phdao, :phdas, :phdav,
                       :phdin, :phdvo, :pheas, :phgui, :phifu, :phili, :philn, :phils, :phisa, :phkal,
                       :phlag, :phlan, :phlas, :phley, :phlun, :phmad, :phmag, :phmas, :phmdc, :phmdr,
                       :phmou, :phmsc, :phmsr, :phnco, :phnec, :phner, :phnsa, :phnue, :phnuv, :phpam,
                       :phpan, :phplw, :phque, :phqui, :phriz, :phrom, :phsar, :phsco, :phsig, :phsle,
                       :phslu, :phsor, :phsuk, :phsun, :phsur, :phtar, :phtaw, :phwsa, :phzan, :phzas,
                       :phzmb, :phzsi, :pkba, :pkgb, :pkis, :pkjk, :pkkp, :pkpb, :pksd, :pkta, :pl02,
                       :pl04, :pl06, :pl08, :pl10, :pl12, :pl14, :pl16, :pl18, :pl20, :pl22, :pl24,
                       :pl26, :pl28, :pl30, :pl32, :pm, :pr, :psbth, :psdeb, :psgza, :pshbn, :psjem,
                       :psjen, :psjrh, :pskys, :psnbs, :psngz, :psqqa, :psrbh, :psrfh, :psslt, :pstbs,
                       :pstkm, :pt01, :pt02, :pt03, :pt04, :pt05, :pt06, :pt07, :pt08, :pt09, :pt10,
                       :pt11, :pt12, :pt13, :pt14, :pt15, :pt16, :pt17, :pt18, :pt20, :pt30, :pw002,
                       :pw004, :pw010, :pw050, :pw100, :pw150, :pw212, :pw214, :pw218, :pw222, :pw224,
                       :pw226, :pw227, :pw228, :pw350, :pw370, :py1, :py10, :py11, :py12, :py13,
                       :py14, :py15, :py16, :py19, :py2, :py3, :py4, :py5, :py6, :py7, :py8, :py9,
                       :pyasu, :qada, :qakh, :qams, :qara, :qash, :qaus, :qawa, :qaza, :re, :roab,
                       :roag, :roar, :rob, :robc, :robh, :robn, :robr, :robt, :robv, :robz, :rocj,
                       :rocl, :rocs, :roct, :rocv, :rodb, :rodj, :rogj, :rogl, :rogr, :rohd, :rohr,
                       :roif, :roil, :rois, :romh, :romm, :roms, :ront, :root, :roph, :rosb, :rosj,
                       :rosm, :rosv, :rotl, :rotm, :rotr, :rovl, :rovn, :rovs, :rs00, :rs01, :rs02,
                       :rs03, :rs04, :rs05, :rs06, :rs07, :rs08, :rs09, :rs10, :rs11, :rs12, :rs13,
                       :rs14, :rs15, :rs16, :rs17, :rs18, :rs19, :rs20, :rs21, :rs22, :rs23, :rs24,
                       :rs25, :rs26, :rs27, :rs28, :rs29, :rskm, :rsvo, :ruad, :rual, :rualt, :ruamu,
                       :ruark, :ruast, :ruba, :rubel, :rubry, :rubu, :ruce, :ruche, :ruchu, :rucu,
                       :ruda, :ruin, :ruirk, :ruiva, :rukam, :rukb, :rukc, :rukda, :rukem, :rukgd,
                       :rukgn, :rukha, :rukhm, :rukir, :rukk, :rukl, :ruklu, :ruko, :rukos, :rukr,
                       :rukrs, :rukya, :rulen, :rulip, :rumag, :rume, :rumo, :rumos, :rumow, :rumur,
                       :runen, :rungr, :runiz, :runvs, :ruoms, :ruore, :ruorl, :ruper, :rupnz, :rupri,
                       :rupsk, :ruros, :rurya, :rusa, :rusak, :rusam, :rusar, :ruse, :rusmo, :ruspe,
                       :rusta, :rusve, :ruta, :rutam, :rutom, :rutul, :rutve, :ruty, :rutyu, :ruud,
                       :ruuly, :ruvgg, :ruvla, :ruvlg, :ruvor, :ruyan, :ruyar, :ruyev, :ruzab, :rw01,
                       :rw02, :rw03, :rw04, :rw05, :sa01, :sa02, :sa03, :sa04, :sa05, :sa06, :sa07,
                       :sa08, :sa09, :sa10, :sa11, :sa12, :sa14, :sbce, :sbch, :sbct, :sbgu, :sbis,
                       :sbmk, :sbml, :sbrb, :sbte, :sbwe, :sc01, :sc02, :sc03, :sc04, :sc05, :sc06,
                       :sc07, :sc08, :sc09, :sc10, :sc11, :sc12, :sc13, :sc14, :sc15, :sc16, :sc17,
                       :sc18, :sc19, :sc20, :sc21, :sc22, :sc23, :sc24, :sc25, :sc26, :sc27, :sddc,
                       :sdde, :sddn, :sdds, :sddw, :sdgd, :sdgk, :sdgz, :sdka, :sdkh, :sdkn, :sdks,
                       :sdnb, :sdno, :sdnr, :sdnw, :sdrs, :sdsi, :seab, :seac, :sebd, :sec, :sed,
                       :see, :sef, :seg, :seh, :sei, :sek, :sem, :sen, :seo, :ses, :set, :seu, :sew,
                       :sex, :sey, :sez, :sg01, :sg02, :sg03, :sg04, :sg05, :shac, :shhl, :shta,
                       :si001, :si002, :si003, :si004, :si005, :si006, :si007, :si008, :si009, :si010,
                       :si011, :si012, :si013, :si014, :si015, :si016, :si017, :si018, :si019, :si020,
                       :si021, :si022, :si023, :si024, :si025, :si026, :si027, :si028, :si029, :si030,
                       :si031, :si032, :si033, :si034, :si035, :si036, :si037, :si038, :si039, :si040,
                       :si041, :si042, :si043, :si044, :si045, :si046, :si047, :si048, :si049, :si050,
                       :si051, :si052, :si053, :si054, :si055, :si056, :si057, :si058, :si059, :si060,
                       :si061, :si062, :si063, :si064, :si065, :si066, :si067, :si068, :si069, :si070,
                       :si071, :si072, :si073, :si074, :si075, :si076, :si077, :si078, :si079, :si080,
                       :si081, :si082, :si083, :si084, :si085, :si086, :si087, :si088, :si089, :si090,
                       :si091, :si092, :si093, :si094, :si095, :si096, :si097, :si098, :si099, :si100,
                       :si101, :si102, :si103, :si104, :si105, :si106, :si107, :si108, :si109, :si110,
                       :si111, :si112, :si113, :si114, :si115, :si116, :si117, :si118, :si119, :si120,
                       :si121, :si122, :si123, :si124, :si125, :si126, :si127, :si128, :si129, :si130,
                       :si131, :si132, :si133, :si134, :si135, :si136, :si137, :si138, :si139, :si140,
                       :si141, :si142, :si143, :si144, :si146, :si147, :si148, :si149, :si150, :si151,
                       :si152, :si153, :si154, :si155, :si156, :si157, :si158, :si159, :si160, :si161,
                       :si162, :si163, :si164, :si165, :si166, :si167, :si168, :si169, :si170, :si171,
                       :si172, :si173, :si174, :si175, :si176, :si177, :si178, :si179, :si180, :si181,
                       :si182, :si183, :si184, :si185, :si186, :si187, :si188, :si189, :si190, :si191,
                       :si192, :si193, :si194, :si195, :si196, :si197, :si198, :si199, :si200, :si201,
                       :si202, :si203, :si204, :si205, :si206, :si207, :si208, :si209, :si210, :si211,
                       :si212, :si213, :skbc, :skbl, :skki, :skni, :skpv, :skta, :sktc, :skzi, :sle,
                       :sln, :slnw, :sls, :slw, :sm01, :sm02, :sm03, :sm04, :sm05, :sm06, :sm07,
                       :sm08, :sm09, :sndb, :sndk, :snfk, :snka, :snkd, :snke, :snkl, :snlg, :snmt,
                       :snse, :snsl, :sntc, :snth, :snzg, :soaw, :sobk, :sobn, :sobr, :soby, :soga,
                       :soge, :sohi, :sojd, :sojh, :somu, :sonu, :sosa, :sosd, :sosh, :soso, :soto,
                       :sowo, :srbr, :srcm, :srcr, :srma, :srni, :srpm, :srpr, :srsa, :srsi, :srwa,
                       :ssbn, :ssbw, :ssec, :ssee, :ssew, :ssjg, :sslk, :ssnu, :ssuy, :sswr, :st01,
                       :st02, :st03, :st04, :st05, :st06, :stp, :sts, :svah, :svca, :svch, :svcu,
                       :svli, :svmo, :svpa, :svsa, :svsm, :svso, :svss, :svsv, :svun, :svus, :sx,
                       :sydi, :sydr, :sydy, :syha, :syhi, :syhl, :syhm, :syid, :syla, :syqu, :syra,
                       :syrd, :sysu, :syta, :szhh, :szlu, :szma, :szsh, :ta, :tdba, :tdbg, :tdbo,
                       :tdcb, :tdee, :tdeo, :tdgr, :tdhl, :tdka, :tdlc, :tdlo, :tdlr, :tdma, :tdmc,
                       :tdme, :tdmo, :tdnd, :tdod, :tdsa, :tdsi, :tdta, :tdti, :tdwf, :tf, :tgc, :tgk,
                       :tgm, :tgp, :tgs, :th10, :th11, :th12, :th13, :th14, :th15, :th16, :th17,
                       :th18, :th19, :th20, :th21, :th22, :th23, :th24, :th25, :th26, :th27, :th30,
                       :th31, :th32, :th33, :th34, :th35, :th36, :th37, :th38, :th39, :th40, :th41,
                       :th42, :th43, :th44, :th45, :th46, :th47, :th48, :th49, :th50, :th51, :th52,
                       :th53, :th54, :th55, :th56, :th57, :th58, :th60, :th61, :th62, :th63, :th64,
                       :th65, :th66, :th67, :th70, :th71, :th72, :th73, :th74, :th75, :th76, :th77,
                       :th80, :th81, :th82, :th83, :th84, :th85, :th86, :th90, :th91, :th92, :th93,
                       :th94, :th95, :th96, :ths, :tjdu, :tjgb, :tjkt, :tjra, :tjsu, :tlal, :tlan,
                       :tlba, :tlbo, :tlco, :tldi, :tler, :tlla, :tlli, :tlmf, :tlmt, :tloe, :tlvi,
                       :tma, :tmb, :tmd, :tml, :tmm, :tms, :tn11, :tn12, :tn13, :tn14, :tn21, :tn22,
                       :tn23, :tn31, :tn32, :tn33, :tn34, :tn41, :tn42, :tn43, :tn51, :tn52, :tn53,
                       :tn61, :tn71, :tn72, :tn73, :tn81, :tn82, :tn83, :to01, :to02, :to03, :to04,
                       :to05, :tr01, :tr02, :tr03, :tr04, :tr05, :tr06, :tr07, :tr08, :tr09, :tr10,
                       :tr11, :tr12, :tr13, :tr14, :tr15, :tr16, :tr17, :tr18, :tr19, :tr20, :tr21,
                       :tr22, :tr23, :tr24, :tr25, :tr26, :tr27, :tr28, :tr29, :tr30, :tr31, :tr32,
                       :tr33, :tr34, :tr35, :tr36, :tr37, :tr38, :tr39, :tr40, :tr41, :tr42, :tr43,
                       :tr44, :tr45, :tr46, :tr47, :tr48, :tr49, :tr50, :tr51, :tr52, :tr53, :tr54,
                       :tr55, :tr56, :tr57, :tr58, :tr59, :tr60, :tr61, :tr62, :tr63, :tr64, :tr65,
                       :tr66, :tr67, :tr68, :tr69, :tr70, :tr71, :tr72, :tr73, :tr74, :tr75, :tr76,
                       :tr77, :tr78, :tr79, :tr80, :tr81, :ttari, :ttcha, :ttctt, :ttdmn, :ttmrc,
                       :ttped, :ttpos, :ttprt, :ttptf, :ttsfo, :ttsge, :ttsip, :ttsjl, :tttob, :tttup,
                       :tvfun, :tvnit, :tvnkf, :tvnkl, :tvnma, :tvnmg, :tvnui, :tvvai, :tw, :twcha,
                       :twcyi, :twcyq, :twhsq, :twhsz, :twhua, :twila, :twkee, :twkhh, :twkin, :twlie,
                       :twmia, :twnan, :twnwt, :twpen, :twpif, :twtao, :twtnn, :twtpe, :twttt, :twtxg,
                       :twyun, :tz01, :tz02, :tz03, :tz04, :tz05, :tz06, :tz07, :tz08, :tz09, :tz10,
                       :tz11, :tz12, :tz13, :tz14, :tz15, :tz16, :tz17, :tz18, :tz19, :tz20, :tz21,
                       :tz22, :tz23, :tz24, :tz25, :tz26, :tz27, :tz28, :tz29, :tz30, :tz31, :ua05,
                       :ua07, :ua09, :ua12, :ua14, :ua18, :ua21, :ua23, :ua26, :ua30, :ua32, :ua35,
                       :ua40, :ua43, :ua46, :ua48, :ua51, :ua53, :ua56, :ua59, :ua61, :ua63, :ua65,
                       :ua68, :ua71, :ua74, :ua77, :ug101, :ug102, :ug103, :ug104, :ug105, :ug106,
                       :ug107, :ug108, :ug109, :ug110, :ug111, :ug112, :ug113, :ug114, :ug115, :ug116,
                       :ug117, :ug118, :ug119, :ug120, :ug121, :ug122, :ug123, :ug124, :ug125, :ug126,
                       :ug201, :ug202, :ug203, :ug204, :ug205, :ug206, :ug207, :ug208, :ug209, :ug210,
                       :ug211, :ug212, :ug213, :ug214, :ug215, :ug216, :ug217, :ug218, :ug219, :ug220,
                       :ug221, :ug222, :ug223, :ug224, :ug225, :ug226, :ug227, :ug228, :ug229, :ug230,
                       :ug231, :ug232, :ug233, :ug234, :ug235, :ug236, :ug237, :ug301, :ug302, :ug303,
                       :ug304, :ug305, :ug306, :ug307, :ug308, :ug309, :ug310, :ug311, :ug312, :ug313,
                       :ug314, :ug315, :ug316, :ug317, :ug318, :ug319, :ug320, :ug321, :ug322, :ug323,
                       :ug324, :ug325, :ug326, :ug327, :ug328, :ug329, :ug330, :ug331, :ug332, :ug333,
                       :ug334, :ug335, :ug336, :ug337, :ug401, :ug402, :ug403, :ug404, :ug405, :ug406,
                       :ug407, :ug408, :ug409, :ug410, :ug411, :ug412, :ug413, :ug414, :ug415, :ug416,
                       :ug417, :ug418, :ug419, :ug420, :ug421, :ug422, :ug423, :ug424, :ug425, :ug426,
                       :ug427, :ug428, :ug429, :ug430, :ug431, :ug432, :ug433, :ug434, :ug435, :ugc,
                       :uge, :ugn, :ugw, :um, :um67, :um71, :um76, :um79, :um81, :um84, :um86, :um89,
                       :um95, :usak, :usal, :usar, :usas, :usaz, :usca, :usco, :usct, :usdc, :usde,
                       :usfl, :usga, :usgu, :ushi, :usia, :usid, :usil, :usin, :usks, :usky, :usla,
                       :usma, :usmd, :usme, :usmi, :usmn, :usmo, :usmp, :usms, :usmt, :usnc, :usnd,
                       :usne, :usnh, :usnj, :usnm, :usnv, :usny, :usoh, :usok, :usor, :uspa, :uspr,
                       :usri, :ussc, :ussd, :ustn, :ustx, :usum, :usut, :usva, :usvi, :usvt, :uswa,
                       :uswi, :uswv, :uswy, :uyar, :uyca, :uycl, :uyco, :uydu, :uyfd, :uyfs, :uyla,
                       :uyma, :uymo, :uypa, :uyrn, :uyro, :uyrv, :uysa, :uysj, :uyso, :uyta, :uytt,
                       :uzan, :uzbu, :uzfa, :uzji, :uzng, :uznw, :uzqa, :uzqr, :uzsa, :uzsi, :uzsu,
                       :uztk, :uzto, :uzxo, :vc01, :vc02, :vc03, :vc04, :vc05, :vc06, :vea, :veb,
                       :vec, :ved, :vee, :vef, :veg, :veh, :vei, :vej, :vek, :vel, :vem, :ven, :veo,
                       :vep, :ver, :ves, :vet, :veu, :vev, :vew, :vex, :vey, :vez, :vi, :vn01, :vn02,
                       :vn03, :vn04, :vn05, :vn06, :vn07, :vn09, :vn13, :vn14, :vn18, :vn20, :vn21,
                       :vn22, :vn23, :vn24, :vn25, :vn26, :vn27, :vn28, :vn29, :vn30, :vn31, :vn32,
                       :vn33, :vn34, :vn35, :vn36, :vn37, :vn39, :vn40, :vn41, :vn43, :vn44, :vn45,
                       :vn46, :vn47, :vn49, :vn50, :vn51, :vn52, :vn53, :vn54, :vn55, :vn56, :vn57,
                       :vn58, :vn59, :vn61, :vn63, :vn66, :vn67, :vn68, :vn69, :vn70, :vn71, :vn72,
                       :vn73, :vnct, :vndn, :vnhn, :vnhp, :vnsg, :vumap, :vupam, :vusam, :vusee,
                       :vutae, :vutob, :wf, :wfal, :wfsg, :wfuv, :wsaa, :wsal, :wsat, :wsfa, :wsge,
                       :wsgi, :wspa, :wssa, :wstu, :wsvf, :wsvs, :yeab, :yead, :yeam, :yeba, :yeda,
                       :yedh, :yehd, :yehj, :yehu, :yeib, :yeja, :yela, :yema, :yemr, :yemw, :yera,
                       :yesa, :yesd, :yesh, :yesn, :yesu, :yeta, :yt, :zaec, :zafs, :zagp, :zagt,
                       :zakzn, :zalp, :zamp, :zanc, :zanl, :zanw, :zawc, :zm01, :zm02, :zm03, :zm04,
                       :zm05, :zm06, :zm07, :zm08, :zm09, :zm10, :zwbu, :zwha, :zwma, :zwmc, :zwme,
                       :zwmi, :zwmn, :zwms, :zwmv, :zwmw]

 @info %{
    currency: [
      USD: %{from: ~D[1792-01-01]},
      USS: %{tender: false, to: ~D[2014-03-01]},
      USN: %{tender: false}
    ],
    gdp: 19490000000000,
    language_population: %{
      "cad" => %{population_percent: 0},
      "cho" => %{population_percent: 0.0033},
      "chr" => %{population_percent: 0.0077, writing_percent: 5},
      "cic" => %{population_percent: 0},
      "dak" => %{population_percent: 0.0059},
      "de" => %{population_percent: 0.47},
      "en" => %{official_status: "de_facto_official", population_percent: 96},
      "es" => %{official_status: "official_regional", population_percent: 9.6},
      "esu" => %{population_percent: 0.0063},
      "fil" => %{population_percent: 0.42},
      "fr" => %{population_percent: 0.56},
      "frc" => %{population_percent: 0.0084},
      "haw" => %{official_status: "official_regional", population_percent: 0.0089},
      "ik" => %{population_percent: 0.0024, writing_percent: 5},
      "it" => %{population_percent: 0.34},
      "ko" => %{population_percent: 0.3},
      "lkt" => %{population_percent: 0.0025},
      "mus" => %{population_percent: 0.0012},
      "nv" => %{population_percent: 0.05},
      "osa" => %{population_percent: 0},
      "pdc" => %{population_percent: 0.039},
      "ru" => %{population_percent: 0.24},
      "vi" => %{population_percent: 0.34},
      "yi" => %{population_percent: 0.049},
      "zh-Hant" => %{population_percent: 0.69}
    },
    literacy_percent: 99,
    measurement_system: %{
      default: :ussystem,
      paper_size: :us_letter,
      temperature: :ussystem
    },
    population: 332639000
  }

  @eu [:AT, :BE, :CY, :CZ, :DE, :DK, :EE, :ES, :FI, :FR, :GR, :HR, :HU, :IE, :IT,
       :LT, :LU, :LV, :MT, :NL, :PL, :PT, :SE, :SI, :SK, :BG, :RO]

  @parants [:"154", :EU, :UN]

  @us Cldr.Locale.new!("en", TestBackend.Cldr)

  @bs Cldr.Locale.new!("BS", TestBackend.Cldr)

  Cldr.Locale.new!("HE", TestBackend.Cldr)

  test "available_styles/0" do
    assert [:short, :standard, :variant] == Territory.available_styles()
  end

  describe "available_territories/2" do
    test "with valid params" do
      assert @available_territories == Territory.available_territories(TestBackend.Cldr)
    end
  end

  describe "available_subdivisions/2" do
    test "locales without subdivisions" do
      assert [] == Territory.available_subdivisions(TestBackend.Cldr)
    end

    test "locales with subdivisions" do
      assert @available_subdivions == TestBackend.Cldr.Territory.available_subdivisions(@us)
    end
  end

  describe "from_territory_code/1" do
    test "with valid params" do
      assert {:ok, "United States"} == Territory.from_territory_code(:US, TestBackend.Cldr)
      assert {:ok, "United States"} == Territory.from_territory_code("us", TestBackend.Cldr)
      assert {:ok, "United States"} == Territory.from_territory_code(@us, TestBackend.Cldr)
      assert {:ok, "US"} == Territory.from_territory_code(:US, TestBackend.Cldr, [style: :short])
      assert {:ok, "US"} == Territory.from_territory_code("US", TestBackend.Cldr, [style: :short])
      assert {:ok, "Sjedinjene Države"} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: "bs"])
      assert {:ok, "SAD"} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: "bs", style: :short])
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.from_territory_code(:ZZ, TestBackend.Cldr)
      assert {:error, {Cldr.InvalidLanguageError, "The language \"zzz\" is invalid"}} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: "zzz", style: :short])
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: :zzz, style: :short])
      assert {:error, {Cldr.UnknownStyleError, "The style \"zzz\" is unknown"}} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: "en", style: "zzz"])
      assert {:error, {Cldr.UnknownStyleError, "The style :zzz is unknown"}} == Territory.from_territory_code(:US, TestBackend.Cldr, [locale: "en", style: :zzz])
    end
  end

  describe "from_territory_code!/1" do
    test "with valid params" do
      assert "United States" == Territory.from_territory_code!(:US, TestBackend.Cldr)
      assert "United States" == Territory.from_territory_code!("US", TestBackend.Cldr)
      assert "United States" == Territory.from_territory_code!(@us, TestBackend.Cldr)
      assert "US" == Territory.from_territory_code!(:US, TestBackend.Cldr, [style: :short])
      assert "US" == Territory.from_territory_code!("us", TestBackend.Cldr, [style: :short])
      assert "Sjedinjene Države" == Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: "bs"])
      assert "SAD" == Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: "bs", style: :short])
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.from_territory_code!(:ZZ, TestBackend.Cldr)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory \"yy\" is unknown", fn ->
        Territory.from_territory_code!("yy", TestBackend.Cldr)
      end
      assert_raise Cldr.InvalidLanguageError, "The language \"zzz\" is invalid", fn ->
        Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: "zzz", style: :short])
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: :zzz, style: :short])
      end
      assert_raise Cldr.UnknownStyleError, "The style \"zzz\" is unknown", fn ->
        Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: "en", style: "zzz"])
      end
      assert_raise Cldr.UnknownStyleError, "The style :zzz is unknown", fn ->
        Territory.from_territory_code!(:US, TestBackend.Cldr, [locale: "en", style: :zzz])
      end
    end
  end

  describe "from_subdivision_code/1" do
    test "with valid params" do
      assert {:ok, "Ontario"} == Territory.from_subdivision_code("CAON", TestBackend.Cldr, [locale: "en"])
      assert {:ok, "אונטריו"} == Territory.from_subdivision_code("caon", TestBackend.Cldr, [locale: "he"])
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownSubdivisionError, "The locale \"en-001\" has no subdivisions."}} == Territory.from_subdivision_code("CAON", TestBackend.Cldr)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.from_subdivision_code(:ZZ, TestBackend.Cldr)
      assert {:error, {Cldr.InvalidLanguageError, "The language \"zzz\" is invalid"}} == Territory.from_subdivision_code("CAON", TestBackend.Cldr, [locale: "zzz"])
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.from_subdivision_code("CAON", TestBackend.Cldr, [locale: :zzz])
    end
  end

  describe "from_subdivision_code!/1" do
    test "with valid params" do
      assert "Ontario" == Territory.from_subdivision_code!("caon", TestBackend.Cldr, [locale: "en"])
      assert "אונטריו" == Territory.from_subdivision_code!("caon", TestBackend.Cldr, [locale: "he"])
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownSubdivisionError, "The locale \"en-001\" has no subdivisions.", fn ->
        Territory.from_subdivision_code!("CAON", TestBackend.Cldr)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.from_subdivision_code!(:ZZ, TestBackend.Cldr)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory \"yy\" is unknown", fn ->
        Territory.from_subdivision_code!("yy", TestBackend.Cldr)
      end
      assert_raise Cldr.InvalidLanguageError, "The language \"zzz\" is invalid", fn ->
        Territory.from_subdivision_code!("CAON", TestBackend.Cldr, [locale: "zzz"])
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.from_subdivision_code!("CAON", TestBackend.Cldr, [locale: :zzz])
      end
    end
  end

  describe "from_language_tag/1" do
    test "with valid params" do
      assert {:ok, "United States"} == Territory.from_language_tag(@us, TestBackend.Cldr)
      assert {:ok, "US"} == Territory.from_language_tag(@us, TestBackend.Cldr, [style: :short])
      assert {:ok, "Bosna i Hercegovina"} == Territory.from_language_tag(@bs, TestBackend.Cldr)
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownLanguageTagError, "The tag :ZZ is not a valid `LanguageTag.t`"}} == Territory.from_language_tag(:ZZ, TestBackend.Cldr)
      assert {:error, {Cldr.UnknownLanguageTagError, "The tag \"zzz\" is not a valid `LanguageTag.t`"}} == Territory.from_language_tag("zzz", TestBackend.Cldr, [style: :short])
      assert {:error, {Cldr.UnknownLanguageTagError, "The tag :zzz is not a valid `LanguageTag.t`"}} == Territory.from_language_tag(:zzz, TestBackend.Cldr, [style: :short])
      assert {:error, {Cldr.UnknownStyleError, "The style \"zzz\" is unknown"}} == Territory.from_territory_code(@bs, TestBackend.Cldr, [style: "zzz"])
      assert {:error, {Cldr.UnknownStyleError, "The style :zzz is unknown"}} == Territory.from_territory_code(@us, TestBackend.Cldr, [style: :zzz])
    end
  end

  describe "from_language_tag!/1" do
    test "with valid params" do
      assert "United States" == Territory.from_language_tag!(@us, TestBackend.Cldr)
      assert "US" == Territory.from_language_tag!(@us, TestBackend.Cldr, [style: :short])
      assert "Bosna i Hercegovina" == Territory.from_language_tag!(@bs, TestBackend.Cldr)
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownLanguageTagError, "The tag :ZZ is not a valid `LanguageTag.t`", fn ->
        Territory.from_language_tag!(:ZZ, TestBackend.Cldr)
      end
      assert_raise Cldr.UnknownLanguageTagError, "The tag \"yy\" is not a valid `LanguageTag.t`", fn ->
        Territory.from_language_tag!("yy", TestBackend.Cldr, [style: :short])
      end
      assert_raise Cldr.UnknownLanguageTagError, "The tag \"zzz\" is not a valid `LanguageTag.t`", fn ->
        Territory.from_language_tag!("zzz", TestBackend.Cldr, [style: :short])
      end
      assert_raise Cldr.UnknownLanguageTagError, "The tag :zzz is not a valid `LanguageTag.t`", fn ->
        Territory.from_language_tag!(:zzz, TestBackend.Cldr, [style: :short])
      end
      assert_raise Cldr.UnknownStyleError, "The style \"zzz\" is unknown", fn ->
        Territory.from_territory_code!(@bs, TestBackend.Cldr, [style: "zzz"])
      end
      assert_raise Cldr.UnknownStyleError, "The style :zzz is unknown", fn ->
        Territory.from_territory_code!(@us, TestBackend.Cldr, [style: :zzz])
      end
    end
  end

  describe "translate_territory/3" do
    test "with valid params" do
      assert {:ok, "Sjedinjene Države"} == Territory.translate_territory("United States", "en", TestBackend.Cldr, "bs")
      assert {:ok, "Sjedinjene Države"} == Territory.translate_territory("US", "en", TestBackend.Cldr, "bs")
      assert {:ok, "Sjedinjene Države"} == Territory.translate_territory("US", @us, TestBackend.Cldr, "bs")
      assert {:ok, "United States"} == Territory.translate_territory("Sjedinjene Države", "bs", TestBackend.Cldr, "en")
      assert {:ok, "United States"} == Territory.translate_territory("Sjedinjene Države", "bs", TestBackend.Cldr, @us)
      assert {:ok, "United States"} == Territory.translate_territory("SAD", "bs", TestBackend.Cldr, "en")
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownLocaleError, "The locale \"zzz\" is not known."}} == Territory.translate_territory("US", "zzz", TestBackend.Cldr, "bs")
      assert {:error, {Cldr.UnknownLocaleError, "The locale \"zzz\" is not known."}} == Territory.translate_territory("US", "en", TestBackend.Cldr, "zzz")
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.translate_territory("US", :zzz, TestBackend.Cldr, "bs")
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.translate_territory("US", "en", TestBackend.Cldr, :zzz)
    end
  end

  describe "translate_territory!/3" do
    test "with valid params" do
      assert "Sjedinjene Države" == Territory.translate_territory!("United States", "en", TestBackend.Cldr, "bs")
      assert "Sjedinjene Države" == Territory.translate_territory!("US", "en", TestBackend.Cldr, "bs")
      assert "Sjedinjene Države" == Territory.translate_territory!("US", @us, TestBackend.Cldr, "bs")
      assert "United States" == Territory.translate_territory!("Sjedinjene Države", "bs", TestBackend.Cldr, "en")
      assert "United States" == Territory.translate_territory!("Sjedinjene Države", "bs", TestBackend.Cldr, @us)
      assert "United States" == Territory.translate_territory!("SAD", "bs", TestBackend.Cldr, "en")
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownLocaleError, "The locale \"zzz\" is not known.", fn ->
        Territory.translate_territory!("US", "zzz", TestBackend.Cldr, "bs")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale \"zzz\" is not known.", fn ->
        Territory.translate_territory!("US", "en", TestBackend.Cldr, "zzz")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.translate_territory!("US", :zzz, TestBackend.Cldr, "bs")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.translate_territory!("US", "en", TestBackend.Cldr, :zzz)
      end
    end
  end

  describe "translate_subdivision/3" do
    test "with valid params" do
      assert {:ok, "אונטריו"} == Territory.translate_subdivision("Ontario", "en", TestBackend.Cldr, "he")
      assert {:ok, "אונטריו"} == Territory.translate_subdivision("Ontario", @us, TestBackend.Cldr, "he")
      assert {:ok, "Ontario"} == Territory.translate_subdivision("אונטריו", "he", TestBackend.Cldr, "en")
      assert {:ok, "Ontario"} == Territory.translate_subdivision("אונטריו", "he", TestBackend.Cldr, @us)
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownSubdivisionError, "The locale \"en-001\" has no subdivisions."}} == Territory.translate_subdivision("Ontario", "en-001", TestBackend.Cldr, "bs")
      assert {:error, {Cldr.UnknownLocaleError, "The locale \"zzz\" is not known."}} == Territory.translate_subdivision("CAON", "zzz", TestBackend.Cldr, "bs")
      assert {:error, {Cldr.UnknownLocaleError, "The locale \"zzz\" is not known."}} == Territory.translate_subdivision("CAON", "en", TestBackend.Cldr, "zzz")
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.translate_subdivision("CAON", :zzz, TestBackend.Cldr, "bs")
      assert {:error, {Cldr.UnknownLocaleError, "The locale :zzz is not known."}} == Territory.translate_subdivision("CAON", "en", TestBackend.Cldr, :zzz)
    end
  end

  describe "translate_subdivision!/3" do
    test "with valid params" do
      assert "אונטריו" == Territory.translate_subdivision!("Ontario", "en", TestBackend.Cldr, "he")
      assert "אונטריו" == Territory.translate_subdivision!("Ontario", @us, TestBackend.Cldr, "he")
      assert "Ontario" == Territory.translate_subdivision!("אונטריו", "he", TestBackend.Cldr, "en")
      assert "Ontario" == Territory.translate_subdivision!("אונטריו", "he", TestBackend.Cldr, @us)
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownSubdivisionError, "The locale \"en-001\" has no subdivisions.", fn ->
        Territory.translate_subdivision!("Ontario", "en-001", TestBackend.Cldr, "bs")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale \"zzz\" is not known.", fn ->
        Territory.translate_subdivision!("CAON", "zzz", TestBackend.Cldr, "bs")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale \"zzz\" is not known.", fn ->
        Territory.translate_subdivision!("CAON", "en", TestBackend.Cldr, "zzz")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.translate_subdivision!("CAON", :zzz, TestBackend.Cldr, "bs")
      end
      assert_raise Cldr.UnknownLocaleError, "The locale :zzz is not known.", fn ->
        Territory.translate_subdivision!("CAON", "en", TestBackend.Cldr, :zzz)
      end
    end
  end

  describe "translate_language_tag/2" do
    test "with valid params" do
      assert {:ok, "Sjedinjene Države"} == Territory.translate_language_tag(@us, TestBackend.Cldr, locale: @bs)
      assert {:ok, "SAD"} == Territory.translate_language_tag(@us, TestBackend.Cldr, [locale: @bs, style: :short])
      assert {:ok, "United States"} == Territory.translate_language_tag(@us, TestBackend.Cldr)
      assert {:ok, "US"} == Territory.translate_language_tag(@us, TestBackend.Cldr, [style: :short])
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownLanguageTagError, "The tag \"zzz\" is not a valid `LanguageTag.t`"}} == Territory.translate_language_tag(@us, TestBackend.Cldr, locale: "zzz")
      assert {:error, {Cldr.UnknownLanguageTagError, "The tag \"US\" is not a valid `LanguageTag.t`"}} == Territory.translate_language_tag("US", TestBackend.Cldr, locale: @bs)
      assert {:error, {Cldr.UnknownStyleError, "The style \"zzz\" is unknown"}} == Territory.translate_language_tag(@bs, TestBackend.Cldr, [locale: @us, style: "zzz"])
      assert {:error, {Cldr.UnknownStyleError, "The style :zzz is unknown"}} == Territory.translate_language_tag(@us, TestBackend.Cldr, [locale: @bs, style: :zzz])
    end
  end

  describe "translate_language_tag!/2" do
    test "with valid params" do
      assert "Sjedinjene Države" == Territory.translate_language_tag!(@us, TestBackend.Cldr, locale: @bs)
      assert "SAD" == Territory.translate_language_tag!(@us, TestBackend.Cldr, [locale: @bs, style: :short])
      assert "United States" == Territory.translate_language_tag!(@us, TestBackend.Cldr)
      assert "US" == Territory.translate_language_tag!(@us, TestBackend.Cldr, [style: :short])
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownLanguageTagError, "The tag \"zzz\" is not a valid `LanguageTag.t`", fn ->
        Territory.translate_language_tag!(@us, TestBackend.Cldr, locale: "zzz")
      end
      assert_raise Cldr.UnknownLanguageTagError,"The tag \"US\" is not a valid `LanguageTag.t`", fn ->
        Territory.translate_language_tag!("US", TestBackend.Cldr, locale: @bs)
      end
      assert_raise Cldr.UnknownStyleError, "The style \"zzz\" is unknown", fn ->
        Territory.translate_language_tag!(@bs, TestBackend.Cldr, [locale: @us, style: "zzz"])
      end
      assert_raise Cldr.UnknownStyleError, "The style :zzz is unknown", fn ->
        Territory.translate_language_tag!(@us, TestBackend.Cldr, [locale: @bs, style: :zzz])
      end
    end
  end

  describe "parent/2" do
    test "with valid params" do
      assert {:ok, [:"155", :EU, :EZ, :UN]} == Territory.parent(:FR)
      assert {:ok, @parants} == Territory.parent("dk")
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.parent(:ZZ)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :dx is unknown"}} == Territory.parent(:dx)
      assert {:error, {Cldr.UnknownChildrenError, "The territory :\"001\" has no parent(s)"}} == Territory.parent(:"001")
    end
  end

  describe "parent!/2" do
    test "with valid params" do
      assert @parants == Territory.parent!(:DK)
    end

    test "parents for gb is no longer EU" do
      assert [:"154", :UN] == Territory.parent!("gb")
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.parent!(:ZZ)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :dx is unknown", fn ->
        Territory.parent!(:dx)
      end
      assert_raise Cldr.UnknownChildrenError,  "The territory :\"001\" has no parent(s)", fn ->
        Territory.parent!(:"001")
      end
    end
  end

  describe "children/2" do
    test "with valid params" do
      assert {:ok, @eu} == Territory.children(:EU)
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.children(:ZZ)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ex is unknown"}} == Territory.children(:ex)
      assert {:error, {Cldr.UnknownParentError, "The territory :DK has no children"}} == Territory.children("dk")
    end
  end

  describe "children!/2" do
    test "with valid params" do
      assert @eu == Territory.children!(:EU)
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.children!(:ZZ)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :ex is unknown", fn ->
        Territory.children!(:ex)
      end
      assert_raise Cldr.UnknownParentError, "The territory :DK has no children", fn ->
        Territory.children!("dk")
      end
    end
  end

  describe "contains?/2" do
    test "with valid params" do
      assert true == Cldr.Territory.contains?(:EU, :DK)
    end

    test "with invalid params" do
      assert false == Cldr.Territory.contains?(:DK, :EU)
      assert false == Cldr.Territory.contains?(:dk, :EU)
      assert false == Cldr.Territory.contains?(:DK, :eu)
    end
  end

  describe "info/1" do
    test "with valid params" do
      assert {:ok, @info} == Territory.info(:US)
      assert {:ok, @info} == Territory.info("us")
      assert {:ok, @info} == Territory.info("US")
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownTerritoryError, "The territory \"ZZ\" is unknown"}} == Territory.info("ZZ")
      assert {:error, {Cldr.UnknownTerritoryError, "The territory \"zz\" is unknown"}} == Territory.info("zz")
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ux is unknown"}} == Territory.info(:ux)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.info(:ZZ)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :zz is unknown"}} == Territory.info(:zz)
    end
  end

  describe "info!/1" do
    test "with valid params" do
      assert @info == Cldr.Territory.info!(:US)
      assert @info == Cldr.Territory.info!("us")
      assert @info == Cldr.Territory.info!("US")
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownTerritoryError, "The territory \"ZZ\" is unknown", fn ->
        Territory.info!("ZZ")
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory \"zz\" is unknown", fn ->
        Territory.info!("zz")
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :ux is unknown", fn ->
        Territory.info!(:ux)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.info!(:ZZ)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :zz is unknown", fn ->
        Territory.info!(:zz)
      end
    end
  end

  describe "to_unicode_flag/1" do
    test "with valid params" do
      assert {:ok, "🇺🇸"} == Territory.to_unicode_flag(:US)
      assert {:ok, "🇪🇺"} == Territory.to_unicode_flag(:EU)
    end

    test "with invalid params" do
      assert {:error, {Cldr.UnknownFlagError, "The territory :EZ has no flag"}} == Territory.to_unicode_flag(:EZ)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory \"zz\" is unknown"}} == Territory.to_unicode_flag("zz")
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :xs is unknown"}} == Territory.to_unicode_flag(:xs)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :ZZ is unknown"}} == Territory.to_unicode_flag(:ZZ)
      assert {:error, {Cldr.UnknownTerritoryError, "The territory :zz is unknown"}} == Territory.to_unicode_flag(:zz)
    end
  end

  describe "to_unicode_flag!/1" do
    test "with valid params" do
      assert "🇺🇸" == Cldr.Territory.to_unicode_flag!(:US)
      assert "🇩🇰" == Cldr.Territory.to_unicode_flag!(:DK)
      assert "🇪🇺" == Cldr.Territory.to_unicode_flag!(:EU)
    end

    test "with invalid params" do
      assert_raise Cldr.UnknownFlagError, "The territory :EZ has no flag", fn ->
        Territory.to_unicode_flag!(:EZ)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory \"zzzzz\" is unknown", fn ->
        Territory.to_unicode_flag!("zzzzz")
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :xs is unknown", fn ->
        Territory.to_unicode_flag!(:xs)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :ZZ is unknown", fn ->
        Territory.to_unicode_flag!(:ZZ)
      end
      assert_raise Cldr.UnknownTerritoryError, "The territory :zz is unknown", fn ->
        Territory.to_unicode_flag!(:zz)
      end
    end
  end

end
