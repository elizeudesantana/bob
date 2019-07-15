#!/bin/bash
############################################################################################
#
#   Bob utilities script bash 
#
version="2019.01";                                                  # Versão do Programa
#
scriptFileVersion="1.0.0";                                          # Versão do script
#
# History:
#   1.0.0    script version inicial, [tela 1], configura screen e supre dependêncas.
#   2019.01  Dividido em diretorios criação de route e tipando de forma MVC (23/06/2019)
#
# Dependências:
#   function Dependencias()
#
# * Retorno: Carregado por bob_util.sh
# * Data: n/a
##           
# by: Elizeu de Santana -------------------------------------------------------------------

NerdFonts_Pomicons=("                   ﯎ ﯏ ﯐ ﯑ ﯒     ")
NerdFonts_Powerline=( "      " )
NerdFonts_PowerlineExtra=("                             ")
NerdFonts_Symbolsoriginal=("                          
                         ")
NerdFonts_Devicons=("                             
                                       
                                         
                                         
                                       
        ")              
NerdFonts_Fontawesome=("                                                
                                                             
                                                 
                                  
                                 
                                
                                    
                                       
                                                                
                                                                   
                                                                             
                                                                   
                                                                            
                                                                   
                                                                             
                                                                   
                             	                                                
                                                                  
                                                                             
                                                     
                                                                        
                                                                                               
                                                                  
                                                              
                                                             
                                                               
                                               
                                                   
                                                   
                                                         
                                                   
                                                     
                                  
                                  ")              
 


NerdFonts_Fontawesomeextension=("                          
                                                     
                                     
                                       
                             " " ")
NerdFonts_Octicons=("                                    
                                              
                                         
                                       
       ♥ ⚡")                      
NerdFonts_FontLinux=("                   ") #        
NerdFonts_FontPowerSymbols=("⏻ ⏼ ⏽ ⏾ ⭘ ")  
NerdFonts_MaterialDesignIcons=("                           
                                           
                                          
                                              
                                           
                                         
                                            
                                             
                                         
                                          
                                                 
                                                               
                                                                  
                                                                          
                                                                   
                                                                          
                                                                 
                                                                          
                                                                  
                                                                          
                                                                  
                                                                          
                                                                  
                                                                          
                                                                  
                                                                          
                                                                 
                                                                          
                                                                  
                                                                        
                                                                  
                                                                          
                                                               
                                                                       
                                                                 
                                                                          
                  
                          
                  
                          
                  
                          
                  
                          
                  
                          
                  
                          
                  
                          
                  
                          
                  
                          
  f8b1   f8b2   f8b3   f8b4   f8b5
                   
 f8b6   f8b7   f8b8   f8b9   f8ba
                             
  f8bb   f8bc   f8bd   f8be   f8bf
                   
 f8c0   f8c1   f8c2   f8c3   f8c4
                             
  f8c5   f8c6   f8c7   f8c8   f8c9
                   
 f8ca   f8cb   f8cc   f8cd   f8ce
                             
  f8cf   f8d0   f8d1   f8d2   f8d3
                   
 f8d4   f8d5   f8d6   f8d7   f8d8
                             
  f8d9   f8da   f8db   f8dc   f8dd
                   
 f8de   f8df   f8e0   f8e1   f8e2
                             
  f8e3   f8e4   f8e5   f8e6   f8e7
                   
 f8e8   f8e9   f8ea   f8eb   f8ec
                             
  f8ed   f8ee   f8ef   f8f0   f8f1
                   
 f8f2   f8f3   f8f4   f8f5   f8f6
                             
  f8f7   f8f8   f8f9   f8fa   f8fb
                   
 f8fc   f8fd   f8fe   f8ff   f900
                           豈  
  f901   f902   f903   f904   f905
 更    車    賈    滑    串  
 f906   f907   f908   f909   f90a
   句      龜      龜      契      金  
  f90b   f90c   f90d   f90e   f90f
 喇    奈    懶    癩    羅  
 f910   f911   f912   f913   f914
   蘿      螺      裸      邏      樂  
  f915   f916   f917   f918   f919
 洛    烙    珞    落    酪  
 f91a   f91b   f91c   f91d   f91e
   駱      亂      卵      欄      爛  
  f91f   f920   f921   f922   f923
 蘭    鸞    嵐    濫    藍  
 f924   f925   f926   f927   f928
   襤      拉      臘      蠟      廊  
  f929   f92a   f92b   f92c   f92d
 朗    浪    狼    郎    來  
 f92e   f92f   f930   f931   f932
   冷      勞      擄      櫓      爐  
  f933   f934   f935   f936   f937
 盧    老    蘆    虜    路  
 f938   f939   f93a   f93b   f93c
   露      魯      鷺      碌      祿  
  f93d   f93e   f93f   f940   f941
 綠    菉    錄    鹿    論  
 f942   f943   f944   f945   f946
   壟      弄      籠      聾      牢  
  f947   f948   f949   f94a   f94b
 磊    賂    雷    壘    屢  
 f94c   f94d   f94e   f94f   f950
   樓      淚      漏      累      縷  
  f951   f952   f953   f954   f955
 陋    勒    肋    凜    凌  
 f956   f957   f958   f959   f95a
   稜      綾      菱      陵      讀  
  f95b   f95c   f95d   f95e   f95f
 拏    樂    諾    丹    寧  
 f960   f961   f962   f963   f964
   怒      率      異      北      磻  
  f965   f966   f967   f968   f969
 便    復    不    泌    數  
 f96a   f96b   f96c   f96d   f96e
   索      參      塞      省      葉  
  f96f   f970   f971   f972   f973
 說    殺    辰    沈    拾  
 f974   f975   f976   f977   f978
   若      掠      略      亮      兩  
  f979   f97a   f97b   f97c   f97d
 凉    梁    糧    良    諒  
 f97e   f97f   f980   f981   f982
   量      勵      呂      女      廬  
 f983   f984   f985   f986   f987
 旅    濾    礪    閭    驪  
f988   f989   f98a   f98b   f98c
   麗      黎      力      曆      歷  
  f98d   f98e   f98f   f990   f991
 轢    年    憐    戀    撚  
 f992   f993   f994   f995   f996
   漣      煉      璉      秊      練  
  f997   f998   f999   f99a   f99b
 聯    輦    蓮    連    鍊  
 f99c   f99d   f99e   f99f   f9a0
   列      劣      咽      烈      裂  
  f9a1   f9a2   f9a3   f9a4   f9a5
 說    廉    念    捻    殮  
 f9a6   f9a7   f9a8   f9a9   f9aa
   簾      獵      令      囹      寧  
  f9ab   f9ac   f9ad   f9ae   f9af
 嶺    怜    玲    瑩    羚  
 f9b0   f9b1   f9b2   f9b3   f9b4
   聆      鈴      零      靈      領  
  f9b5   f9b6   f9b7   f9b8   f9b9
 例    禮    醴    隸    惡  
 f9ba   f9bb   f9bc   f9bd   f9be
   了      僚      寮      尿      料  
  f9bf   f9c0   f9c1   f9c2   f9c3
 樂    燎    療    蓼    遼  
 f9c4   f9c5   f9c6   f9c7   f9c8
   龍      暈      阮      劉      杻  
  f9c9   f9ca   f9cb   f9cc   f9cd
 柳    流    溜    琉    留  
 f9ce   f9cf   f9d0   f9d1   f9d2
   硫      紐      類      六      戮  
  f9d3   f9d4   f9d5   f9d6   f9d7
 陸    倫    崙    淪    輪  
 f9d8   f9d9   f9da   f9db   f9dc
   律      慄      栗      率      隆  
  f9dd   f9de   f9df   f9e0   f9e1
 利    吏    履    易    李  
 f9e2   f9e3   f9e4   f9e5   f9e6
   梨      泥      理      痢      罹  
  f9e7   f9e8   f9e9   f9ea   f9eb
 裏    裡    里    離    匿  
 f9ec   f9ed   f9ee   f9ef   f9f0
   溺      吝      燐      璘      藺  
  f9f1   f9f2   f9f3   f9f4   f9f5
 隣    鱗    麟    林    淋  
 f9f6   f9f7   f9f8   f9f9   f9fa
   臨      立      笠      粒      狀  
  f9fb   f9fc   f9fd   f9fe   f9ff
 炙    識    什    茶    刺  
 fa00   fa01   fa02   fa03   fa04
   切      度      拓      糖      宅  
  fa05   fa06   fa07   fa08   fa09
 洞    暴    輻    行    降  
 fa0a   fa0b   fa0c   fa0d   fa0e
   見      廓      兀      嗀      﨎  
  fa0f   fa10   fa11   fa12   fa13
 﨏    塚    﨑    晴    﨓  
 fa14   fa15   fa16   fa17   fa18
   﨔      凞      猪      益      礼  
  fa19   fa1a   fa1b   fa1c   fa1d
 神    祥    福    靖    精  
 fa1e   fa1f   fa20   fa21   fa22
   羽      﨟      蘒      﨡      諸  
  fa23   fa24   fa25   fa26   fa27
 﨣    﨤    逸    都    﨧  
 fa28   fa29   fa2a   fa2b   fa2c
   﨨      﨩      飯      飼      館  
  fa2d   fa2e   fa2f   fa30   fa31
 鶴    郞    隷    侮    僧  
 fa32   fa33   fa34   fa35   fa36
   免      勉      勤      卑      喝  
  fa37   fa38   fa39   fa3a   fa3b
 嘆    器    塀    墨    層  
 fa3c   fa3d   fa3e   fa3f   fa40
   屮      悔      慨      憎      懲  
  fa41   fa42   fa43   fa44   fa45
 敏    既    暑    梅    海  
 fa46   fa47   fa48   fa49   fa4a
   渚      漢      煮      爫      琢  
  fa4b   fa4c   fa4d   fa4e   fa4f
 碑    社    祉    祈    祐  
 fa50   fa51   fa52   fa53   fa54
   祖      祝      禍      禎      穀  
  fa55   fa56   fa57   fa58   fa59
 突    節    練    縉    繁  
 fa5a   fa5b   fa5c   fa5d   fa5e
   署      者      臭      艹      艹  
  fa5f   fa60   fa61   fa62   fa63
 著    褐    視    謁    謹  
 fa64   fa65   fa66   fa67   fa68
   賓      贈      辶      逸      難  
  fa69   fa6a   fa6b   fa6c   fa6d
 響    頻    恵    𤋮    舘  
 fa6e   fa6f   fa70   fa71   fa72
   﩮      﩯      並      况      全  
  fa73   fa74   fa75   fa76   fa77
 侀    充    冀    勇    勺  
 fa78   fa79   fa7a   fa7b   fa7c
   喝      啕      喙      嗢      塚  
  fa7d   fa7e   fa7f   fa80   fa81
 墳    奄    奔    婢    嬨  
 fa82   fa83   fa84   fa85   fa86
   廒      廙      彩      徭      惘  
  fa87   fa88   fa89   fa8a   fa8b
 慎    愈    憎    慠    懲  
 fa8c   fa8d   fa8e   fa8f   fa90
   戴      揄      搜      摒      敖  
  fa91   fa92   fa93   fa94   fa95
 晴    朗    望    杖    歹  
 fa96   fa97   fa98   fa99   fa9a
   殺      流      滛      滋      漢  
  fa9b   fa9c   fa9d   fa9e   fa9f
 瀞    煮    瞧    爵    犯  
 faa0   faa1   faa2   faa3   faa4
   猪      瑱      甆      画      瘝  
  faa5   faa6   faa7   faa8   faa9
 瘟    益    盛    直    睊  
 faaa   faab   faac   faad   faae
   着      磌      窱      節      类  
  faaf   fab0   fab1   fab2   fab3
 絛    練    缾    者    荒  
 fab4   fab5   fab6   fab7   fab8
   華      蝹      襁      覆      視  
  fab9   faba   fabb   fabc   fabd
 調    諸    請    謁    諾  
 fabe   fabf   fac0   fac1   fac2
   諭      謹      變      贈      輸  
  fac3   fac4   fac5   fac6   fac7
 遲    醙    鉶    陼    難  
 fac8   fac9   faca   facb   facc
   靖      韛      響      頋      頻  
  facd   face   facf   fad0   fad1
 鬒    龜    𢡊    𢡄    𣏕  
 fad2   fad3   fad4   fad5   fad6
   㮝      䀘      䀹      𥉉      𥳐  
  fad7   fad8   fad9   fada   fadb
 𧻓    齃    龎    﫚    﫛  
 fadc   fadd   fade   fadf   fae0
   﫜      﫝      﫞      﫟      﫠  
  fae1   fae2   fae3   fae4   fae5
 﫡    﫢    﫣    﫤    﫥  
 fae6   fae7   fae8   fae9   faea
   﫦      﫧      﫨      﫩      﫪  
  faeb   faec   faed   faee   faef
 﫫    﫬    﫭    﫮    﫯  
 faf0   faf1   faf2   faf3   faf4
   﫰      﫱      﫲      﫳      﫴  
  faf5   faf6   faf7   faf8   faf9
 﫵    﫶    﫷    﫸    﫹  
 fafa   fafb   fafc   fafd   fafe
   﫺      﫻      﫼      﫽      﫾  
  faff   fb00   fb01   fb02   fb03
 﫿    ﬀ    ﬁ    ﬂ    ﬃ  
 fb04   fb05   fb06   fb07   fb08
   ﬄ      ﬅ      ﬆ      ﬇      ﬈  
  fb09   fb0a   fb0b   fb0c   fb0d
 ﬉    ﬊    ﬋    ﬌    ﬍  
 fb0e   fb0f   fb10   fb11   fb12
   ﬎      ﬏      ﬐      ﬑      ﬒  
  fb13   fb14   fb15   fb16   fb17
 ﬓ    ﬔ    ﬕ    ﬖ    ﬗ  
 fb18   fb19   fb1a   fb1b   fb1c
   ﬘      ﬙      ﬚      ﬛      ﬜  
  fb1d   fb1e   fb1f   fb20   fb21
 יִ    ﬞ    ײַ    ﬠ    ﬡ  
 fb22   fb23   fb24   fb25   fb26
   ﬢ      ﬣ      ﬤ      ﬥ      ﬦ  
  fb27   fb28   fb29   fb2a   fb2b
 ﬧ    ﬨ    ﬩    שׁ    שׂ  
 fb2c   fb2d   fb2e   fb2f   fb30
   שּׁ      שּׂ      אַ      אָ      אּ  
  fb31   fb32   fb33   fb34   fb35
 בּ    גּ    דּ    הּ    וּ  
 fb36   fb37   fb38   fb39   fb3a
   זּ      ﬷      טּ      יּ      ךּ  
  fb3b   fb3c   fb3d   fb3e   fb3f
 כּ    לּ    ﬽    מּ    ﬿  
 fb40   fb41   fb42   fb43   fb44
   נּ      סּ      ﭂      ףּ      פּ  
  fb45   fb46   fb47   fb48   fb49
 ﭅    צּ    קּ    רּ    שּ  
 fb4a   fb4b   fb4c   fb4d   fb4e
   תּ      וֹ      בֿ      כֿ      פֿ  
  fb4f   fb50   fb51   fb52   fb53
 ﭏ    ﭐ    ﭑ    ﭒ    ﭓ  
 fb54   fb55   fb56   fb57   fb58
   ﭔ      ﭕ      ﭖ      ﭗ      ﭘ  
  fb59   fb5a   fb5b   fb5c   fb5d
 ﭙ    ﭚ    ﭛ    ﭜ    ﭝ  
 fb5e   fb5f   fb60   fb61   fb62
   ﭞ      ﭟ      ﭠ      ﭡ      ﭢ  
  fb63   fb64   fb65   fb66   fb67
 ﭣ    ﭤ    ﭥ    ﭦ    ﭧ  
 fb68   fb69   fb6a   fb6b   fb6c
   ﭨ      ﭩ      ﭪ      ﭫ      ﭬ  
  fb6d   fb6e   fb6f   fb70   fb71
 ﭭ    ﭮ    ﭯ    ﭰ    ﭱ  
 fb72   fb73   fb74   fb75   fb76
   ﭲ      ﭳ      ﭴ      ﭵ      ﭶ  
  fb77   fb78   fb79   fb7a   fb7b
 ﭷ    ﭸ    ﭹ    ﭺ    ﭻ  
 fb7c   fb7d   fb7e   fb7f   fb80
   ﭼ      ﭽ      ﭾ      ﭿ      ﮀ  
  fb81   fb82   fb83   fb84   fb85
 ﮁ    ﮂ    ﮃ    ﮄ    ﮅ  
 fb86   fb87   fb88   fb89   fb8a
   ﮆ      ﮇ      ﮈ      ﮉ      ﮊ  
  fb8b   fb8c   fb8d   fb8e   fb8f
 ﮋ    ﮌ    ﮍ    ﮎ    ﮏ  
 fb90   fb91   fb92   fb93   fb94
   ﮐ      ﮑ      ﮒ      ﮓ      ﮔ  
  fb95   fb96   fb97   fb98   fb99
 ﮕ    ﮖ    ﮗ    ﮘ    ﮙ  
 fb9a   fb9b   fb9c   fb9d   fb9e
   ﮚ      ﮛ      ﮜ      ﮝ      ﮞ  
  fb9f   fba0   fba1   fba2   fba3
 ﮟ    ﮠ    ﮡ    ﮢ    ﮣ  
 fba4   fba5   fba6   fba7   fba8
   ﮤ      ﮥ      ﮦ      ﮧ      ﮨ  
  fba9   fbaa   fbab   fbac   fbad
 ﮩ    ﮪ    ﮫ    ﮬ    ﮭ  
 fbae   fbaf   fbb0   fbb1   fbb2
   ﮮ      ﮯ      ﮰ      ﮱ      ﮲  
  fbb3   fbb4   fbb5   fbb6   fbb7
 ﮳    ﮴    ﮵    ﮶    ﮷  
 fbb8   fbb9   fbba   fbbb   fbbc
   ﮸      ﮹      ﮺      ﮻      ﮼  
  fbbd   fbbe   fbbf   fbc0   fbc1
 ﮽    ﮾    ﮿    ﯀    ﯁  
 fbc2   fbc3   fbc4   fbc5   fbc6
   ﯂      ﯃      ﯄      ﯅      ﯆  
  fbc7   fbc8   fbc9   fbca   fbcb
 ﯇    ﯈    ﯉    ﯊    ﯋  
 fbcc   fbcd   fbce   fbcf   fbd0
   ﯌      ﯍      ﯎      ﯏      ﯐  
  fbd1   fbd2   fbd3   fbd4   fbd5
 ﯑    ﯒    ﯓ    ﯔ    ﯕ  
 fbd6   fbd7   fbd8   fbd9   fbda
   ﯖ      ﯗ      ﯘ      ﯙ      ﯚ  
  fbdb   fbdc   fbdd   fbde   fbdf
 ﯛ    ﯜ    ﯝ    ﯞ    ﯟ  
 fbe0   fbe1   fbe2   fbe3   fbe4
   ﯠ      ﯡ      ﯢ      ﯣ      ﯤ  
  fbe5   fbe6   fbe7   fbe8   fbe9
 ﯥ    ﯦ    ﯧ    ﯨ    ﯩ  
 fbea   fbeb   fbec   fbed   fbee
   ﯪ      ﯫ      ﯬ      ﯭ      ﯮ  
  fbef   fbf0   fbf1   fbf2   fbf3
 ﯯ    ﯰ    ﯱ    ﯲ    ﯳ  
 fbf4   fbf5   fbf6   fbf7   fbf8
   ﯴ      ﯵ      ﯶ      ﯷ      ﯸ  
  fbf9   fbfa   fbfb   fbfc   fbfd
 ﯹ    ﯺ    ﯻ    ﯼ    ﯽ  
 fbfe   fbff   fc00   fc01   fc02
   ﯾ      ﯿ      ﰀ      ﰁ      ﰂ  
  fc03   fc04   fc05   fc06   fc07
 ﰃ    ﰄ    ﰅ    ﰆ    ﰇ  
 fc08   fc09   fc0a   fc0b   fc0c
   ﰈ      ﰉ      ﰊ      ﰋ      ﰌ  
  fc0d   fc0e   fc0f   fc10   fc11
 ﰍ    ﰎ    ﰏ    ﰐ    ﰑ  
 fc12   fc13   fc14   fc15   fc16
   ﰒ      ﰓ      ﰔ      ﰕ      ﰖ  
  fc17   fc18   fc19   fc1a   fc1b
 ﰗ    ﰘ    ﰙ    ﰚ    ﰛ  
 fc1c   fc1d   fc1e   fc1f   fc20
   ﰜ      ﰝ      ﰞ      ﰟ      ﰠ  
  fc21   fc22   fc23   fc24   fc25
 ﰡ    ﰢ    ﰣ    ﰤ    ﰥ  
 fc26   fc27   fc28   fc29   fc2a
   ﰦ      ﰧ      ﰨ      ﰩ      ﰪ  
  fc2b   fc2c   fc2d   fc2e   fc2f
 ﰫ    ﰬ    ﰭ    ﰮ    ﰯ  
 fc30   fc31   fc32   fc33   fc34
   ﰰ      ﰱ      ﰲ      ﰳ      ﰴ  
  fc35   fc36   fc37   fc38   fc39
 ﰵ    ﰶ    ﰷ    ﰸ    ﰹ  
 fc3a   fc3b   fc3c   fc3d   fc3e
   ﰺ      ﰻ      ﰼ      ﰽ      ﰾ  
 fc3f   fc40   fc41   fc42   fc43
 ﰿ    ﱀ    ﱁ    ﱂ    ﱃ  
 fc44   fc45   fc46   fc47   fc48
   ﱄ      ﱅ      ﱆ      ﱇ      ﱈ  
  fc49   fc4a   fc4b   fc4c   fc4d
 ﱉ    ﱊ    ﱋ    ﱌ    ﱍ  
 fc4e   fc4f   fc50   fc51   fc52
   ﱎ      ﱏ      ﱐ      ﱑ      ﱒ  
  fc53   fc54   fc55   fc56   fc57
 ﱓ    ﱔ    ﱕ    ﱖ    ﱗ  
 fc58   fc59   fc5a   fc5b   fc5c
   ﱘ      ﱙ      ﱚ      ﱛ      ﱜ  
  fc5d   fc5e   fc5f   fc60   fc61
 ﱝ    ﱞ    ﱟ    ﱠ    ﱡ  
 fc62   fc63   fc64   fc65   fc66
   ﱢ      ﱣ      ﱤ      ﱥ      ﱦ  
ﱧ    ﱨ    ﱩ    ﱪ    ﱫ  
ﱬ      ﱭ      ﱮ      ﱯ      ﱰ  
ﱱ    ﱲ    ﱳ    ﱴ    ﱵ  
ﱶ      ﱷ      ﱸ      ﱹ      ﱺ  
ﱻ    ﱼ    ﱽ    ﱾ    ﱿ  
ﲀ      ﲁ      ﲂ      ﲃ      ﲄ  
ﲅ    ﲆ    ﲇ    ﲈ    ﲉ  
ﲊ      ﲋ      ﲌ      ﲍ      ﲎ  
ﲏ    ﲐ    ﲑ    ﲒ    ﲓ  
ﲔ      ﲕ      ﲖ      ﲗ      ﲘ  
ﲙ    ﲚ    ﲛ    ﲜ    ﲝ  
ﲞ      ﲟ      ﲠ      ﲡ      ﲢ  
ﲣ    ﲤ    ﲥ    ﲦ    ﲧ  
ﲨ      ﲩ      ﲪ      ﲫ      ﲬ  
ﲭ    ﲮ    ﲯ    ﲰ    ﲱ  
ﲲ      ﲳ      ﲴ      ﲵ      ﲶ  
ﲷ    ﲸ    ﲹ    ﲺ    ﲻ  
ﲼ      ﲽ      ﲾ      ﲿ      ﳀ  
ﳁ    ﳂ    ﳃ    ﳄ    ﳅ  
ﳆ      ﳇ      ﳈ      ﳉ      ﳊ  
ﳋ    ﳌ    ﳍ    ﳎ    ﳏ  
ﳐ      ﳑ      ﳒ      ﳓ      ﳔ  
ﳕ    ﳖ    ﳗ    ﳘ    ﳙ  
ﳚ      ﳛ      ﳜ      ﳝ      ﳞ  
ﳟ    ﳠ    ﳡ    ﳢ    ﳣ  
ﳤ      ﳥ      ﳦ      ﳧ      ﳨ  
ﳩ    ﳪ    ﳫ    ﳬ    ﳭ  
ﳮ      ﳯ      ﳰ      ﳱ      ﳲ  
ﳳ    ﳴ    ﳵ    ﳶ    ﳷ  
ﳸ      ﳹ      ﳺ      ﳻ      ﳼ  
ﳽ    ﳾ    ﳿ    ﴀ    ﴁ  
ﴂ      ﴃ      ﴄ      ﴅ      ﴆ  
ﴇ    ﴈ    ﴉ    ﴊ    ﴋ  
ﴌ      ﴍ      ﴎ      ﴏ      ﴐ  
ﴑ    ﴒ    ﴓ    ﴔ    ﴕ  
 fd16   fd17   fd18   fd19   fd1a
   ﴖ      ﴗ      ﴘ      ﴙ      ﴚ  
  fd1b   fd1c   fd1d   fd1e   fd1f
 ﴛ    ﴜ    ﴝ    ﴞ    ﴟ  
 fd20   fd21   fd22   fd23   fd24
   ﴠ      ﴡ      ﴢ      ﴣ      ﴤ  
  fd25   fd26   fd27   fd28   fd29
 ﴥ    ﴦ    ﴧ    ﴨ    ﴩ  
 fd2a   fd2b   fd2c   fd2d   fd2e
   ﴪ      ﴫ      ﴬ      ﴭ      ﴮ  
  fd2f   fd30   fd31   fd32   fd33
 ﴯ    ﴰ    ﴱ    ﴲ    ﴳ  
 fd34   fd35   fd36   fd37   fd38
   ﴴ      ﴵ      ﴶ      ﴷ      ﴸ  
  fd39   fd3a   fd3b   fd3c   fd3d
 ﴹ    ﴺ    ﴻ    ﴼ    ﴽ  
 fd3e   fd3f   fd40   fd41   fd42
   ﴾      ﴿      ﵀      ﵁      ﵂  
  fd43   fd44   fd45   fd46       
 ﵃    ﵄    ﵅    ﵆ ")      
 


NerdFonts_All=( "
                          
                  
                          
                  
                          
  e0b7   e0b8   e0b9   e0ba   e0bb
                   
 e0bc   e0bd   e0be   e0bf   e0c0
                             
  e0c1   e0c2   e0c3   e0c4   e0c5
                   
 e0c6   e0c7   e0c8   e0cc   e0cd
                             
  e0ce   e0cf   e0d0   e0d1   e0d2
                   
 e0d4   e5fa   e5fb   e5fc   e5fd
                             
  e5fe   e5ff   e600   e601   e602
                   
 e603   e604   e605   e606   e607
                             
  e608   e609   e60a   e60b   e60c
                   
 e60d   e60e   e60f   e610   e611
                             
  e612   e613   e614   e615   e616
                   
 e617   e618   e619   e61a   e61b
                             
  e61c   e61d   e61e   e61f   e620
                   
 e621   e622   e623   e624   e625
                             
  e626   e627   e628   e629   e62a
                   
 e62b   e700   e701   e702   e703
                             
  e704   e705   e706   e707   e708
                   
 e709   e70a   e70b   e70c   e70d
                             
  e70e   e70f   e710   e711   e712
                   
 e713   e714   e715   e716   e717
                             
  e718   e719   e71a   e71b   e71c
                   
 e71d   e71e   e71f   e720   e721
                             
  e722   e723   e724   e725   e726
                   
 e727   e728   e729   e72a   e72b
                             
  e72c   e72d   e72e   e72f   e730
                   
 e731   e732   e733   e734   e735
                             
  e736   e737   e738   e739   e73a
                   
 e73b   e73c   e73d   e73e   e73f
                             
  e740   e741   e742   e743   e744
                   
 e745   e746   e747   e748   e749
                             
  e74a   e74b   e74c   e74d   e74e
                   
 e74f   e750   e751   e752   e753
                             
  e754   e755   e756   e757   e758
                   
 e759   e75a   e75b   e75c   e75d
                             
  e75e   e75f   e760   e761   e762
	                   
 e763   e764   e765   e766   e767
                             
  e768   e769   e76a   e76b   e76c
                   
 e76d   e76e   e76f   e770   e771
                             
  e772   e773   e774   e775   e776
                   
 e777   e778   e779   e77a   e77b
                             
  e77c   e77d   e77e   e77f   e780
                   
 e781   e782   e783   e784   e785
                             
  e786   e787   e788   e789   e78a
                   
 e78b   e78c   e78d   e78e   e78f
                             
  e790   e791   e792   e793   e794
                   
 e795   e796   e797   e798   e799
                             
  e79a   e79b   e79c   e79d   e79e
                   
 e79f   e7a0   e7a1   e7a2   e7a3
                             
  e7a4   e7a5   e7a6   e7a7   e7a8
                   
 e7a9   e7aa   e7ab   e7ac   e7ad
                             
  e7ae   e7af   e7b0   e7b1   e7b2
                   
 e7b3   e7b4   e7b5   e7b6   e7b7
                             
  e7b8   e7b9   e7ba   e7bb   e7bc
                   
 e7bd   e7be   e7bf   e7c0   e7c1
                             
  e7c2   e7c3   e7c4   e7c5   f000
                   
 f001   f002   f003   f004   f005
                             
  f006   f007   f008   f009   f00a
                   
 f00b   f00c   f00d   f00e   f00f
                             
  f010   f011   f012   f013   f014
                   
 f015   f016   f017   f018   f019
                             
  f01a   f01b   f01c   f01d   f01e
                   
 f01f   f020   f021   f022   f023
                             
  f024   f025   f026   f027   f028
                   
 f029   f02a   f02b   f02c   f02d
                             
  f02e   f02f   f030   f031   f032
                   
 f033   f034   f035   f036   f037
                             
  f038   f039   f03a   f03b   f03c
                   
 f03d   f03e   f03f   f040   f041
                             
  f042   f043   f044   f045   f046
                   
 f047   f048   f049   f04a   f04b
                             
  f04c   f04d   f04e   f04f   f050
                   
 f051   f052   f053   f054   f055
                             
  f056   f057   f058   f059   f05a
                   
 f05b   f05c   f05d   f05e   f05f
                             
  f060   f061   f062   f063   f064
                   
 f065   f066   f067   f068   f069
                             
  f06a   f06b   f06c   f06d   f06e
                   
 f06f   f070   f071   f072   f073
                             
  f074   f075   f076   f077   f078
                   
 f079   f07a   f07b   f07c   f07d
                             
  f07e   f07f   f080   f081   f082
                   
 f083   f084   f085   f086   f087
                             
  f088   f089   f08a   f08b   f08c
                   
 f08d   f08e   f08f   f090   f091
                             
  f092   f093   f094   f095   f096
                   
 f097   f098   f099   f09a   f09b
                             
  f09c   f09d   f09e   f09f   f0a0
                   
 f0a1   f0a2   f0a3   f0a4   f0a5
                             
  f0a6   f0a7   f0a8   f0a9   f0aa
                   
 f0ab   f0ac   f0ad   f0ae   f0af
                             
  f0b0   f0b1   f0b2   f0b3   f0b4
                   
 f0b5   f0b6   f0b7   f0b8   f0b9
                             
  f0ba   f0bb   f0bc   f0bd   f0be
                   
 f0bf   f0c0   f0c1   f0c2   f0c3
                             
  f0c4   f0c5   f0c6   f0c7   f0c8
                   
 f0c9   f0ca   f0cb   f0cc   f0cd
                             
  f0ce   f0cf   f0d0   f0d1   f0d2
                   
 f0d3   f0d4   f0d5   f0d6   f0d7
                             
  f0d8   f0d9   f0da   f0db   f0dc
                   
 f0dd   f0de   f0df   f0e0   f0e1
                             
  f0e2   f0e3   f0e4   f0e5   f0e6
                   
 f0e7   f0e8   f0e9   f0ea   f0eb
                             
  f0ec   f0ed   f0ee   f0ef   f0f0
                   
 f0f1   f0f2   f0f3   f0f4   f0f5
                             
  f0f6   f0f7   f0f8   f0f9   f0fa
                   
 f0fb   f0fc   f0fd   f0fe   f0ff
                             
  f100   f101   f102   f103   f104
                   
 f105   f106   f107   f108   f109
                             
  f10a   f10b   f10c   f10d   f10e
                   
 f10f   f110   f111   f112   f113
                             
  f114   f115   f116   f117   f118
                   
 f119   f11a   f11b   f11c   f11d
                             
  f11e   f11f   f120   f121   f122
                   
 f123   f124   f125   f126   f127
                             
  f128   f129   f12a   f12b   f12c
                   
 f12d   f12e   f12f   f130   f131
                             
  f132   f133   f134   f135   f136
                   
 f137   f138   f139   f13a   f13b
                             
  f13c   f13d   f13e   f13f   f140
                   
 f141   f142   f143   f144   f145
                             
  f146   f147   f148   f149   f14a
                   
 f14b   f14c   f14d   f14e   f14f
                             
  f150   f151   f152   f153   f154
                   
 f155   f156   f157   f158   f159
                             
  f15a   f15b   f15c   f15d   f15e
                   
 f15f   f160   f161   f162   f163
                             
  f164   f165   f166   f167   f168
                   
 f169   f16a   f16b   f16c   f16d
                             
  f16e   f16f   f170   f171   f172
                   
 f173   f174   f175   f176   f177
                             
  f178   f179   f17a   f17b   f17c
                   
 f17d   f17e   f17f   f180   f181
                             
  f182   f183   f184   f185   f186
                   
 f187   f188   f189   f18a   f18b
                             
  f18c   f18d   f18e   f18f   f190
                   
 f191   f192   f193   f194   f195
                             
  f196   f197   f198   f199   f19a
                   
 f19b   f19c   f19d   f19e   f19f
                             
  f1a0   f1a1   f1a2   f1a3   f1a4
                   
 f1a5   f1a6   f1a7   f1a8   f1a9
                            

  f1aa   f1ab   f1ac   f1ad   f1ae
                   

 f1af   f1b0   f1b1   f1b2   f1b3
                             

  f1b4   f1b5   f1b6   f1b7   f1b8
                   

 f1b9   f1ba   f1bb   f1bc   f1bd
                             
  f1be   f1bf   f1c0   f1c1   f1c2
                   
 f1c3   f1c4   f1c5   f1c6   f1c7
                             
  f1c8   f1c9   f1ca   f1cb   f1cc
                   
 f1cd   f1ce   f1cf   f1d0   f1d1
                             
  f1d2   f1d3   f1d4   f1d5   f1d6
                   
 f1d7   f1d8   f1d9   f1da   f1db
                             
  f1dc   f1dd   f1de   f1df   f1e0
                   
 f1e1   f1e2   f1e3   f1e4   f1e5
                             
  f1e6   f1e7   f1e8   f1e9   f1ea
                   
 f1eb   f1ec   f1ed   f1ee   f1ef
                             
  f1f0   f1f1   f1f2   f1f3   f1f4
                   
 f1f5   f1f6   f1f7   f1f8   f1f9
                             
  f1fa   f1fb   f1fc   f1fd   f1fe
                   
 f1ff   f200   f201   f202   f203
                             
  f204   f205   f206   f207   f208
                   
 f209   f20a   f20b   f20c   f20d
                             
  f20e   f20f   f210   f211   f212
                   
 f213   f214   f215   f216   f217
                             
  f218   f219   f21a   f21b   f21c
                   
 f21d   f21e   f21f   f220   f221
                             
  f222   f223   f224   f225   f226
                   
 f227   f228   f229   f22a   f22b
                             
  f22c   f22d   f22e   f22f   f230
                   
 f231   f232   f233   f234   f235
                             
  f236   f237   f238   f239   f23a
                     
 f23b   f23c   f23d   f23e   f23f
                             
  f240   f241   f242   f243   f244
                   
 f245   f246   f247   f248   f249
                             
  f24a   f24b   f24c   f24d   f24e
                   
 f24f   f250   f251   f252   f253
                       
  f254   f255   f256   f257   f258
                   
 f259   f25a   f25b   f25c   f25d
                             
  f25e   f25f   f260   f261   f262
                   
 f263   f264   f265   f266   f267
                             
  f268   f269   f26a   f26b   f26c
                   
 f26d   f26e   f26f   f270   f271
                             
  f272   f273   f274   f275   f276
                   
 f277   f278   f279   f27a   f27b
                             
  f27c   f27d   f27e   f27f   f280
                   
 f281   f282   f283   f284   f285
                             
  f286   f287   f288   f289   f28a
                   
 f28b   f28c   f28d   f28e   f28f
                             
  f290   f291   f292   f293   f294
                   
 f295   f296   f297   f298   f299
                             
  f29a   f29b   f29c   f29d   f29e
                   
 f29f   f2a0   f2a1   f2a2   f2a3
                        
  f2a4   f2a5   f2a6   f2a7   f2a8
                   
 f2a9   f2aa   f2ab   f2ac   f2ad
                             
  f2ae   f2af   f2b0   f2b1   f2b2
                   
 f2b3   f2b4   f2b5   f2b6   f2b7
                             
  f2b8   f2b9   f2ba   f2bb   f2bc
                   
 f2bd   f2be   f2bf   f2c0   f2c1
                             
  f2c2   f2c3   f2c4   f2c5   f2c6
                   
 f2c7   f2c8   f2c9   f2ca   f2cb
                             
  f2cc   f2cd   f2ce   f2cf   f2d0
                   
 f2d1   f2d2   f2d3   f2d4   f2d5
                             
  f2d6   f2d7   f2d8   f2d9   f2da
                   
 f2db   f2dc   f2dd   f2de   f2df
                             
  f2e0   e200   e201   e202   e203
                   
 e204   e205   e206   e207   e208
                             
  e209   e20a   e20b   e20c   e20d
                   
 e20e   e20f   e210   e211   e212
                             
  e213   e214   e215   e216   e217
                   
 e218   e219   e21a   e21b   e21c
                             
  e21d   e21e   e21f   e220   e221
                   
 e222   e223   e224   e225   e226
                             
  e227   e228   e229   e22a   e22b
                   
 e22c   e22d   e22e   e22f   e230
                             
  e231   e232   e233   e234   e235
                   
 e236   e237   e238   e239   e23a
                             
  e23b   e23c   e23d   e23e   e23f
                   
 e240   e241   e242   e243   e244
                             
  e245   e246   e247   e248   e249
                   
 e24a   e24b   e24c   e24d   e24e
                             
  e24f   e250   e251   e252   e253
                   
 e254   e255   e256   e257   e258
                             
  e259   e25a   e25b   e25c   e25d
                   
 e25e   e25f   e260   e261   e262
                             
  e263   e264   e265   e266   e267
                   
 e268   e269   e26a   e26b   e26c
                             
  e26d   e26e   e26f   e270   e271
                   
 e272   e273   e274   e275   e276
                             
  e277   e278   e279   e27a   e27b
                   
 e27c   e27d   e27e   e27f   e280
                             
  e281   e282   e283   e284   e285
                   

 e286   e287   e288   e289   e28a
                             

  e28b   e28c   e28d   e28e   e28f
                   
 e290   e291   e292   e293   e294
                             

  e295   e296   e297   e298   e299
                   
 
 e29a   e29b   e29c   e29d   e29e
                             
  e29f   e2a0   e2a1   e2a2   e2a3
                   
 e2a4   e2a5   e2a6   e2a7   e2a8
                             
  e2a9   f400   f401   f402   f403
                   
 f404   f405   f406   f407   f408
                             
  f409   f40a   f40b   f40c   f40d
                   
 f40e   f40f   f410   f411   f412
                             
  f413   f414   f415   f416   f417
                   
 f418   f419   f41a   f41b   f41c
                             
  f41d   f41e   f41f   f420   f421
                   
 f422   f423   f424   f425   f426
                             
  f427   f428   f429   f42a   f42b
                   
 f42c   f42d   f42e   f42f   f430
                             
  f431   f432   f433   f434   f435
                   
 f436   f437   f438   f439   f43a
                            
  f43b   f43c   f43d   f43e   f43f
                   
 f440   f441   f442   f443   f444
                             
  f445   f446   f447   f448   f449
                   
 f44a   f44b   f44c   f44d   f44e
                             
  f44f   f450   f451   f452   f453
                   
 f454   f455   f456   f457   f458
                             
  f459   f45a   f45b   f45c   f45d
                   
 f45e   f45f   f460   f461   f462
                             
  f463   f464   f465   f466   f467
                   
 f468   f469   f46a   f46b   f46c
                             
  f46d   f46e   f46f   f470   f471
                   
 f472   f473   f474   f475   f476
                             
  f477   f478   f479   f47a   f47b
                   
 f47c   f47d   f47e   f47f   f480
                             
  f481   f482   f483   f484   f485
                   
 f486   f487   f488   f489   f48a
                             
  f48b   f48c   f48d   f48e   f48f
                   
 f490   f491   f492   f493   f494
                             
  f495   f496   f497   f498   f499
                   
 f49a   f49b   f49c   f49d   f49e
                             
  f49f   f4a0   f4a1   f4a2   f4a3
                   
 f4a4   f4a5   f4a6   f4a7   f4a8
                             
  2665   26a1   f27c   f300   f301
 ♥    ⚡              
 f302   f303   f304   f305   f306
                             
  f307   f308   f309   f30a   f30b
                   
 f30c   f30d   f30e   f30f   f310
                             
  f311   f312   f313   23fb   23fc
             ⏻    ⏼  
 23fd   23fe   2b58   f500   f501
   ⏽      ⏾      ⭘              
  f502   f503   f504   f505   f506
                   
 f507   f508   f509   f50a   f50b
                             
  f50c   f50d   f50e   f50f   f510
                   
 f511   f512   f513   f514   f515
                             
  f516   f517   f518   f519   f51a
                   
 f51b   f51c   f51d   f51e   f51f
                             
  f520   f521   f522   f523   f524
                   
 f525   f526   f527   f528   f529
                             
  f52a   f52b   f52c   f52d   f52e
                   
 f52f   f530   f531   f532   f533
                             
  f534   f535   f536   f537   f538
                   
 f539   f53a   f53b   f53c   f53d
                             
  f53e   f53f   f540   f541   f542
                   
 f543   f544   f545   f546   f547
                             
  f548   f549   f54a   f54b   f54c
                   
 f54d   f54e   f54f   f550   f551
                             
  f552   f553   f554   f555   f556
                   
 f557   f558   f559   f55a   f55b
                             
  f55c   f55d   f55e   f55f   f560
                   
 f561   f562   f563   f564   f565
                             
  f566   f567   f568   f569   f56a
                   
 f56b   f56c   f56d   f56e   f56f
                             
  f570   f571   f572   f573   f574
                   
 f575   f576   f577   f578   f579
                             
  f57a   f57b   f57c   f57d   f57e
                   
 f57f   f580   f581   f582   f583
                             
  f584   f585   f586   f587   f588
                   
 f589   f58a   f58b   f58c   f58d
                             
  f58e   f58f   f590   f591   f592
                   
 f593   f594   f595   f596   f597
                             
  f598   f599   f59a   f59b   f59c
                   
 f59d   f59e   f59f   f5a0   f5a1
                             
  f5a2   f5a3   f5a4   f5a5   f5a6
                   
 f5a7   f5a8   f5a9   f5aa   f5ab
                             
  f5ac   f5ad   f5ae   f5af   f5b0
                   
 f5b1   f5b2   f5b3   f5b4   f5b5
                             
  f5b6   f5b7   f5b8   f5b9   f5ba
                   
 f5bb   f5bc   f5bd   f5be   f5bf
                             
  f5c0   f5c1   f5c2   f5c3   f5c4
                   
 f5c5   f5c6   f5c7   f5c8   f5c9
                             
  f5ca   f5cb   f5cc   f5cd   f5ce
                   
 f5cf   f5d0   f5d1   f5d2   f5d3
                             
  f5d4   f5d5   f5d6   f5d7   f5d8
                   
 f5d9   f5da   f5db   f5dc   f5dd
                             
  f5de   f5df   f5e0   f5e1   f5e2
                   
 f5e3   f5e4   f5e5   f5e6   f5e7
                             
  f5e8   f5e9   f5ea   f5eb   f5ec
                   
 f5ed   f5ee   f5ef   f5f0   f5f1
                             
  f5f2   f5f3   f5f4   f5f5   f5f6
                   
 f5f7   f5f8   f5f9   f5fa   f5fb
                             
  f5fc   f5fd   f5fe   f5ff   f600
                   
 f601   f602   f603   f604   f605
                             
  f606   f607   f608   f609   f60a
                   
 f60b   f60c   f60d   f60e   f60f
                             
  f610   f611   f612   f613   f614 
                   
 f615   f616   f617   f618   f619
                             
  f61a   f61b   f61c   f61d   f61e
                   
 f61f   f620   f621   f622   f623
                             
  f624   f625   f626   f627   f628
                   
 f629   f62a   f62b   f62c   f62d
                             
  f62e   f62f   f630   f631   f632
                   
 f633   f634   f635   f636   f637
                             
  f638   f639   f63a   f63b   f63c
                   
 f63d   f63e   f63f   f640   f641
                             
  f642   f643   f644   f645   f646
                   
 f647   f648   f649   f64a   f64b
                             
  f64c   f64d   f64e   f64f   f650
                   
 f651   f652   f653   f654   f655
                             
  f656   f657   f658   f659   f65a
                   
 f65b   f65c   f65d   f65e   f65f
                             
  f660   f661   f662   f663   f664
                   
 f665   f666   f667   f668   f669
                             
  f66a   f66b   f66c   f66d   f66e
                   
 f66f   f670   f671   f672   f673
                             
  f674   f675   f676   f677   f678
                   
 f679   f67a   f67b   f67c   f67d
                             
  f67e   f67f   f680   f681   f682
                   
 f683   f684   f685   f686   f687
                             
  f688   f689   f68a   f68b   f68c
                   
 f68d   f68e   f68f   f690   f691
                             
  f692   f693   f694   f695   f696
                   
 f697   f698   f699   f69a   f69b
                             
  f69c   f69d   f69e   f69f   f6a0
                   
 f6a1   f6a2   f6a3   f6a4   f6a5
                             
  f6a6   f6a7   f6a8   f6a9   f6aa
                   
 f6ab   f6ac   f6ad   f6ae   f6af
                             
  f6b0   f6b1   f6b2   f6b3   f6b4
                   
 f6b5   f6b6   f6b7   f6b8   f6b9
                             
  f6ba   f6bb   f6bc   f6bd   f6be
                   
 f6bf   f6c0   f6c1   f6c2   f6c3
                             
  f6c4   f6c5   f6c6   f6c7   f6c8
                   
 f6c9   f6ca   f6cb   f6cc   f6cd
                             
  f6ce   f6cf   f6d0   f6d1   f6d2
                   
 f6d3   f6d4   f6d5   f6d6   f6d7
                             
  f6d8   f6d9   f6da   f6db   f6dc
                   
 f6dd   f6de   f6df   f6e0   f6e1
                             
  f6e2   f6e3   f6e4   f6e5   f6e6
                   
 f6e7   f6e8   f6e9   f6ea   f6eb
                             
  f6ec   f6ed   f6ee   f6ef   f6f0
                   
 f6f1   f6f2   f6f3   f6f4   f6f5
                             
  f6f6   f6f7   f6f8   f6f9   f6fa
                   
 f6fb   f6fc   f6fd   f6fe   f6ff
                             
  f700   f701   f702   f703   f704
                   
 f705   f706   f707   f708   f709
                             
  f70a   f70b   f70c   f70d   f70e
                   
 f70f   f710   f711   f712   f713
                             
  f714   f715   f716   f717   f718
                   
 f719   f71a   f71b   f71c   f71d
                             

  f71e   f71f   f720   f721   f722
                   

 f723   f724   f725   f726   f727
                             
  f728   f729   f72a   f72b   f72c
                   
 f72d   f72e   f72f   f730   f731
                             
  f732   f733   f734   f735   f736
                   
 f737   f738   f739   f73a   f73b
                             
  f73c   f73d   f73e   f73f   f740
                   
 f741   f742   f743   f744   f745
                             
  f746   f747   f748   f749   f74a
                   
 f74b   f74c   f74d   f74e   f74f
                             
  f750   f751   f752   f753   f754
                   
 f755   f756   f757   f758   f759
                             
  f75a   f75b   f75c   f75d   f75e
                   
 f75f   f760   f761   f762   f763
                             
  f764   f765   f766   f767   f768
                   
 f769   f76a   f76b   f76c   f76d
                             
  f76e   f76f   f770   f771   f772
                   
 f773   f774   f775   f776   f777
                             
  f778   f779   f77a   f77b   f77c
                   
 f77d   f77e   f77f   f780   f781
                             
  f782   f783   f784   f785   f786
                   
 f787   f788   f789   f78a   f78b
                             
  f78c   f78d   f78e   f78f   f790
                   
 f791   f792   f793   f794   f795
                             
  f796   f797   f798   f799   f79a
                   
 f79b   f79c   f79d   f79e   f79f
                             
  f7a0   f7a1   f7a2   f7a3   f7a4
                   
 f7a5   f7a6   f7a7   f7a8   f7a9
                             
  f7aa   f7ab   f7ac   f7ad   f7ae
                   
 f7af   f7b0   f7b1   f7b2   f7b3
                             
  f7b4   f7b5   f7b6   f7b7   f7b8
                   
 f7b9   f7ba   f7bb   f7bc   f7bd
                             
  f7be   f7bf   f7c0   f7c1   f7c2
                   
 f7c3   f7c4   f7c5   f7c6   f7c7
                             
  f7c8   f7c9   f7ca   f7cb   f7cc
                   
 f7cd   f7ce   f7cf   f7d0   f7d1
                             
  f7d2   f7d3   f7d4   f7d5   f7d6
                   
 f7d7   f7d8   f7d9   f7da   f7db
                             
  f7dc   f7dd   f7de   f7df   f7e0
                   
 f7e1   f7e2   f7e3   f7e4   f7e5
                             
  f7e6   f7e7   f7e8   f7e9   f7ea
                   
 f7eb   f7ec   f7ed   f7ee   f7ef
                             
  f7f0   f7f1   f7f2   f7f3   f7f4
                   
 f7f5   f7f6   f7f7   f7f8   f7f9
                             
  f7fa   f7fb   f7fc   f7fd   f7fe
                   
 f7ff   f800   f801   f802   f803
                             
  f804   f805   f806   f807   f808
                   
 f809   f80a   f80b   f80c   f80d
                             
  f80e   f80f   f810   f811   f812
                   
 f813   f814   f815   f816   f817
                             
  f818   f819   f81a   f81b   f81c
                   
 f81d   f81e   f81f   f820   f821
                             
  f822   f823   f824   f825   f826
                   
 f827   f828   f829   f82a   f82b
                             
  f82c   f82d   f82e   f82f   f830
                   
 f831   f832   f833   f834   f835
                             
  f836   f837   f838   f839   f83a
                   
 f83b   f83c   f83d   f83e   f83f
                             
  f840   f841   f842   f843   f844
                   
 f845   f846   f847   f848   f849
                             
  f84a   f84b   f84c   f84d   f84e
                   
 f84f   f850   f851   f852   f853
                             
  f854   f855   f856   f857   f858
                   
 f859   f85a   f85b   f85c   f85d
                             
  f85e   f85f   f860   f861   f862
                   
 f863   f864   f865   f866   f867
                             
  f868   f869   f86a   f86b   f86c
                   
 f86d   f86e   f86f   f870   f871
                             
  f872   f873   f874   f875   f876
                   
 f877   f878   f879   f87a   f87b
                             
  f87c   f87d   f87e   f87f   f880
                   
 f881   f882   f883   f884   f885
                             
  f886   f887   f888   f889   f88a
                   
 f88b   f88c   f88d   f88e   f88f
                             
  f890   f891   f892   f893   f894
                   
 f895   f896   f897   f898   f899
                             
  f89a   f89b   f89c   f89d   f89e
                   
 f89f   f8a0   f8a1   f8a2   f8a3
                             
  f8a4   f8a5   f8a6   f8a7   f8a8
                   
 f8a9   f8aa   f8ab   f8ac   f8ad
                             
  f8ae   f8af   f8b0   f8b1   f8b2
                   
 f8b3   f8b4   f8b5   f8b6   f8b7
                             
  f8b8   f8b9   f8ba   f8bb   f8bc
                   
 f8bd   f8be   f8bf   f8c0   f8c1
                             
  f8c2   f8c3   f8c4   f8c5   f8c6
                   
 f8c7   f8c8   f8c9   f8ca   f8cb
                             
  f8cc   f8cd   f8ce   f8cf   f8d0
                   
 f8d1   f8d2   f8d3   f8d4   f8d5
                             
  f8d6   f8d7   f8d8   f8d9   f8da
                   
 f8db   f8dc   f8dd   f8de   f8df
                             
  f8e0   f8e1   f8e2   f8e3   f8e4
                   
 f8e5   f8e6   f8e7   f8e8   f8e9
                             
  f8ea   f8eb   f8ec   f8ed   f8ee
                   
 f8ef   f8f0   f8f1   f8f2   f8f3
                             
  f8f4   f8f5   f8f6   f8f7   f8f8
                   
 f8f9   f8fa   f8fb   f8fc   f8fd
                             
  f8fe   f8ff   f900   f901   f902
         豈    更    車  
 f903   f904   f905   f906   f907
   賈      滑      串      句      龜  
  f908   f909   f90a   f90b   f90c
 龜    契    金    喇    奈  
 f90d   f90e   f90f   f910   f911
   懶      癩      羅      蘿      螺  
  f912   f913   f914   f915   f916
 裸    邏    樂    洛    烙  
 f917   f918   f919   f91a   f91b
   珞      落      酪      駱      亂  
  f91c   f91d   f91e   f91f   f920
 卵    欄    爛    蘭    鸞  
 f921   f922   f923   f924   f925
   嵐      濫      藍      襤      拉  
  f926   f927   f928   f929   f92a
 臘    蠟    廊    朗    浪  
 f92b   f92c   f92d   f92e   f92f
   狼      郎      來      冷      勞  
  f930   f931   f932   f933   f934
 擄    櫓    爐    盧    老  
 f935   f936   f937   f938   f939
   蘆      虜      路      露      魯  
  f93a   f93b   f93c   f93d   f93e
 鷺    碌    祿    綠    菉  
 f93f   f940   f941   f942   f943
   錄      鹿      論      壟      弄  
  f944   f945   f946   f947   f948
 籠    聾    牢    磊    賂  
 f949   f94a   f94b   f94c   f94d
   雷      壘      屢      樓      淚  
  f94e   f94f   f950   f951   f952
 漏    累    縷    陋    勒  
 f953   f954   f955   f956   f957
   肋      凜      凌      稜      綾  
  f958   f959   f95a   f95b   f95c
 菱    陵    讀    拏    樂  
 f95d   f95e   f95f   f960   f961
   諾      丹      寧      怒      率  
  f962   f963   f964   f965   f966
 異    北    磻    便    復  
 f967   f968   f969   f96a   f96b
   不      泌      數      索      參  
  f96c   f96d   f96e   f96f   f970
 塞    省    葉    說    殺  
 f971   f972   f973   f974   f975
   辰      沈      拾      若      掠  
  f976   f977   f978   f979   f97a
 略    亮    兩    凉    梁  
 f97b   f97c   f97d   f97e   f97f
   糧      良      諒      量      勵  
  f980   f981   f982   f983   f984
 呂    女    廬    旅    濾  
 f985   f986   f987   f988   f989
   礪      閭      驪      麗      黎  
  f98a   f98b   f98c   f98d   f98e
 力    曆    歷    轢    年  
 f98f   f990   f991   f992   f993
   憐      戀      撚      漣      煉  
  f994   f995   f996   f997   f998
 璉    秊    練    聯    輦  
 f999   f99a   f99b   f99c   f99d
   蓮      連      鍊      列      劣  
  f99e   f99f   f9a0   f9a1   f9a2
 咽    烈    裂    說    廉  
 f9a3   f9a4   f9a5   f9a6   f9a7
   念      捻      殮      簾      獵  
  f9a8   f9a9   f9aa   f9ab   f9ac
 令    囹    寧    嶺    怜  
 f9ad   f9ae   f9af   f9b0   f9b1
   玲      瑩      羚      聆      鈴  
  f9b2   f9b3   f9b4   f9b5   f9b6
 零    靈    領    例    禮  
 f9b7   f9b8   f9b9   f9ba   f9bb
   醴      隸      惡      了      僚  
  f9bc   f9bd   f9be   f9bf   f9c0
 寮    尿    料    樂    燎  
 f9c1   f9c2   f9c3   f9c4   f9c5
   療      蓼      遼      龍      暈  
  f9c6   f9c7   f9c8   f9c9   f9ca
 阮    劉    杻    柳    流  
 f9cb   f9cc   f9cd   f9ce   f9cf
   溜      琉      留      硫      紐  
  f9d0   f9d1   f9d2   f9d3   f9d4
 類    六    戮    陸    倫  
 f9d5   f9d6   f9d7   f9d8   f9d9
   崙      淪      輪      律      慄  
  f9da   f9db   f9dc   f9dd   f9de
 栗    率    隆    利    吏  
 f9df   f9e0   f9e1   f9e2   f9e3
   履      易      李      梨      泥  
  f9e4   f9e5   f9e6   f9e7   f9e8
 理    痢    罹    裏    裡  
 f9e9   f9ea   f9eb   f9ec   f9ed
   里      離      匿      溺      吝  
  f9ee   f9ef   f9f0   f9f1   f9f2
 燐    璘    藺    隣    鱗  
 f9f3   f9f4   f9f5   f9f6   f9f7
   麟      林      淋      臨      立  
  f9f8   f9f9   f9fa   f9fb   f9fc
 笠    粒    狀    炙    識  
 f9fd   f9fe   f9ff   fa00   fa01
   什      茶      刺      切      度  
  fa02   fa03   fa04   fa05   fa06
 拓    糖    宅    洞    暴  
 fa07   fa08   fa09   fa0a   fa0b
   輻      行      降      見      廓  
  fa0c   fa0d   fa0e   fa0f   fa10
 兀    嗀    﨎    﨏    塚  
 fa11   fa12   fa13   fa14   fa15
   﨑      晴      﨓      﨔      凞  
  fa16   fa17   fa18   fa19   fa1a
 猪    益    礼    神    祥  
 fa1b   fa1c   fa1d   fa1e   fa1f
   福      靖      精      羽      﨟  
  fa20   fa21   fa22   fa23   fa24
 蘒    﨡    諸    﨣    﨤  
 fa25   fa26   fa27   fa28   fa29
   逸      都      﨧      﨨      﨩  
  fa2a   fa2b   fa2c   fa2d   fa2e
 飯    飼    館    鶴    郞  
 fa2f   fa30   fa31   fa32   fa33
   隷      侮      僧      免      勉  
  fa34   fa35   fa36   fa37   fa38
 勤    卑    喝    嘆    器  
 fa39   fa3a   fa3b   fa3c   fa3d
   塀      墨      層      屮      悔  
  fa3e   fa3f   fa40   fa41   fa42
 慨    憎    懲    敏    既  
 fa43   fa44   fa45   fa46   fa47
   暑      梅      海      渚      漢  
 fa48   fa49   fa4a   fa4b   fa4c
 煮    爫    琢    碑    社  
 fa4d   fa4e   fa4f   fa50   fa51
   祉      祈      祐      祖      祝  
  fa52   fa53   fa54   fa55   fa56
 禍    禎    穀    突    節  
 fa57   fa58   fa59   fa5a   fa5b
   練      縉      繁      署      者  
  fa5c   fa5d   fa5e   fa5f   fa60
 臭    艹    艹    著    褐  
 fa61   fa62   fa63   fa64   fa65
   視      謁      謹      賓      贈  
  fa66   fa67   fa68   fa69   fa6a
 辶    逸    難    響    頻  
 fa6b   fa6c   fa6d   fa6e   fa6f
   恵      𤋮      舘      﩮      﩯  
  fa70   fa71   fa72   fa73   fa74
 並    况    全    侀    充  
 fa75   fa76   fa77   fa78   fa79
   冀      勇      勺      喝      啕  
  fa7a   fa7b   fa7c   fa7d   fa7e
 喙    嗢    塚    墳    奄  
 fa7f   fa80   fa81   fa82   fa83
   奔      婢      嬨      廒      廙  
  fa84   fa85   fa86   fa87   fa88
 彩    徭    惘    慎    愈  
 fa89   fa8a   fa8b   fa8c   fa8d
   憎      慠      懲      戴      揄  
  fa8e   fa8f   fa90   fa91   fa92
 搜    摒    敖    晴    朗  
 fa93   fa94   fa95   fa96   fa97
   望      杖      歹      殺      流  
  fa98   fa99   fa9a   fa9b   fa9c
 滛    滋    漢    瀞    煮  
 fa9d   fa9e   fa9f   faa0   faa1
   瞧      爵      犯      猪      瑱  
  faa2   faa3   faa4   faa5   faa6
 甆    画    瘝    瘟    益  
 faa7   faa8   faa9   faaa   faab
   盛      直      睊      着      磌  
  faac   faad   faae   faaf   fab0
 窱    節    类    絛    練  
 fab1   fab2   fab3   fab4   fab5
   缾      者      荒      華      蝹  
  fab6   fab7   fab8   fab9   faba
 襁    覆    視    調    諸  
 fabb   fabc   fabd   fabe   fabf
   請      謁      諾      諭      謹  
  fac0   fac1   fac2   fac3   fac4
 變    贈    輸    遲    醙  
 fac5   fac6   fac7   fac8   fac9
   鉶      陼      難      靖      韛  
  faca   facb   facc   facd   face
 響    頋    頻    鬒    龜  
 facf   fad0   fad1   fad2   fad3
   𢡊      𢡄      𣏕      㮝      䀘  
  fad4   fad5   fad6   fad7   fad8
 䀹    𥉉    𥳐    𧻓    齃  
 fad9   fada   fadb   fadc   fadd
   龎      﫚      﫛      﫜      﫝  
  fade   fadf   fae0   fae1   fae2
 﫞    﫟    﫠    﫡    﫢  
 fae3   fae4   fae5   fae6   fae7
   﫣      﫤      﫥      﫦      﫧  
  fae8   fae9   faea   faeb   faec
 﫨    﫩    﫪    﫫    﫬  
 faed   faee   faef   faf0   faf1
   﫭      﫮      﫯      﫰      﫱  
  faf2   faf3   faf4   faf5   faf6
 﫲    﫳    﫴    﫵    﫶  
 faf7   faf8   faf9   fafa   fafb
   﫷      﫸      﫹      﫺      﫻  
  fafc   fafd   fafe   faff   fb00
 﫼    﫽    﫾    﫿    ﬀ  
 fb01   fb02   fb03   fb04   fb05
   ﬁ      ﬂ      ﬃ      ﬄ      ﬅ  
  fb06   fb07   fb08   fb09   fb0a
 ﬆ    ﬇    ﬈    ﬉    ﬊  
 fb0b   fb0c   fb0d   fb0e   fb0f
   ﬋      ﬌      ﬍      ﬎      ﬏  
  fb10   fb11   fb12   fb13   fb14
 ﬐    ﬑    ﬒    ﬓ    ﬔ  
 fb15   fb16   fb17   fb18   fb19
   ﬕ      ﬖ      ﬗ      ﬘      ﬙  
  fb1a   fb1b   fb1c   fb1d   fb1e
 ﬚    ﬛    ﬜    יִ    ﬞ  
 fb1f   fb20   fb21   fb22   fb23
   ײַ      ﬠ      ﬡ      ﬢ      ﬣ  
  fb24   fb25   fb26   fb27   fb28
 ﬤ    ﬥ    ﬦ    ﬧ    ﬨ  
 fb29   fb2a   fb2b   fb2c   fb2d
   ﬩      שׁ      שׂ      שּׁ      שּׂ  
  fb2e   fb2f   fb30   fb31   fb32
 אַ    אָ    אּ    בּ    גּ  
 fb33   fb34   fb35   fb36   fb37
   דּ      הּ      וּ      זּ      ﬷  
  fb38   fb39   fb3a   fb3b   fb3c
 טּ    יּ    ךּ    כּ    לּ  
 fb3d   fb3e   fb3f   fb40   fb41
   ﬽      מּ      ﬿      נּ      סּ  
  fb42   fb43   fb44   fb45   fb46
 ﭂    ףּ    פּ    ﭅    צּ  
 fb47   fb48   fb49   fb4a   fb4b
   קּ      רּ      שּ      תּ      וֹ  
  fb4c   fb4d   fb4e   fb4f   fb50
 בֿ    כֿ    פֿ    ﭏ    ﭐ  
 fb51   fb52   fb53   fb54   fb55
   ﭑ      ﭒ      ﭓ      ﭔ      ﭕ  
  fb56   fb57   fb58   fb59   fb5a
 ﭖ    ﭗ    ﭘ    ﭙ    ﭚ  
 fb5b   fb5c   fb5d   fb5e   fb5f
   ﭛ      ﭜ      ﭝ      ﭞ      ﭟ  
  fb60   fb61   fb62   fb63   fb64
 ﭠ    ﭡ    ﭢ    ﭣ    ﭤ  
 fb65   fb66   fb67   fb68   fb69
   ﭥ      ﭦ      ﭧ      ﭨ      ﭩ  
  fb6a   fb6b   fb6c   fb6d   fb6e
 ﭪ    ﭫ    ﭬ    ﭭ    ﭮ  
 fb6f   fb70   fb71   fb72   fb73
   ﭯ      ﭰ      ﭱ      ﭲ      ﭳ  
  fb74   fb75   fb76   fb77   fb78
 ﭴ    ﭵ    ﭶ    ﭷ    ﭸ  
 fb79   fb7a   fb7b   fb7c   fb7d
   ﭹ      ﭺ      ﭻ      ﭼ      ﭽ  
  fb7e   fb7f   fb80   fb81   fb82
 ﭾ    ﭿ    ﮀ    ﮁ    ﮂ  
 fb83   fb84   fb85   fb86   fb87
   ﮃ      ﮄ      ﮅ      ﮆ      ﮇ  
  fb88   fb89   fb8a   fb8b   fb8c
 ﮈ    ﮉ    ﮊ    ﮋ    ﮌ  
 fb8d   fb8e   fb8f   fb90   fb91
   ﮍ      ﮎ      ﮏ      ﮐ      ﮑ  
  fb92   fb93   fb94   fb95   fb96
 ﮒ    ﮓ    ﮔ    ﮕ    ﮖ  
 fb97   fb98   fb99   fb9a   fb9b
   ﮗ      ﮘ      ﮙ      ﮚ      ﮛ  
  fb9c   fb9d   fb9e   fb9f   fba0
 ﮜ    ﮝ    ﮞ    ﮟ    ﮠ  
 fba1   fba2   fba3   fba4   fba5
   ﮡ      ﮢ      ﮣ      ﮤ      ﮥ  
  fba6   fba7   fba8   fba9   fbaa
 ﮦ    ﮧ    ﮨ    ﮩ    ﮪ  
 fbab   fbac   fbad   fbae   fbaf
   ﮫ      ﮬ      ﮭ      ﮮ      ﮯ  

  fbb0   fbb1   fbb2   fbb3   fbb4
 ﮰ    ﮱ    ﮲    ﮳    ﮴  
 fbb5   fbb6   fbb7   fbb8   fbb9
   ﮵      ﮶      ﮷      ﮸      ﮹  
  fbba   fbbb   fbbc   fbbd   fbbe
 ﮺    ﮻    ﮼    ﮽    ﮾  
 fbbf   fbc0   fbc1   fbc2   fbc3
   ﮿      ﯀      ﯁      ﯂      ﯃  
  fbc4   fbc5   fbc6   fbc7   fbc8
 ﯄    ﯅    ﯆    ﯇    ﯈  
 fbc9   fbca   fbcb   fbcc   fbcd
   ﯉      ﯊      ﯋      ﯌      ﯍  
  fbce   fbcf   fbd0   fbd1   fbd2
 ﯎    ﯏    ﯐    ﯑    ﯒  
 fbd3   fbd4   fbd5   fbd6   fbd7
   ﯓ      ﯔ      ﯕ      ﯖ      ﯗ  
  fbd8   fbd9   fbda   fbdb   fbdc
 ﯘ    ﯙ    ﯚ    ﯛ    ﯜ  
 fbdd   fbde   fbdf   fbe0   fbe1
   ﯝ      ﯞ      ﯟ      ﯠ      ﯡ  
  fbe2   fbe3   fbe4   fbe5   fbe6
 ﯢ    ﯣ    ﯤ    ﯥ    ﯦ  
 fbe7   fbe8   fbe9   fbea   fbeb
   ﯧ      ﯨ      ﯩ      ﯪ      ﯫ  
  fbec   fbed   fbee   fbef   fbf0
 ﯬ    ﯭ    ﯮ    ﯯ    ﯰ  
 fbf1   fbf2   fbf3   fbf4   fbf5
   ﯱ      ﯲ      ﯳ      ﯴ      ﯵ  
  fbf6   fbf7   fbf8   fbf9   fbfa
 ﯶ    ﯷ    ﯸ    ﯹ    ﯺ  
 fbfb   fbfc   fbfd   fbfe   fbff
   ﯻ      ﯼ      ﯽ      ﯾ      ﯿ  
  fc00   fc01   fc02   fc03   fc04
 ﰀ    ﰁ    ﰂ    ﰃ    ﰄ  
 fc05   fc06   fc07   fc08   fc09
   ﰅ      ﰆ      ﰇ      ﰈ      ﰉ  
  fc0a   fc0b   fc0c   fc0d   fc0e
 ﰊ    ﰋ    ﰌ    ﰍ    ﰎ  
 fc0f   fc10   fc11   fc12   fc13
   ﰏ      ﰐ      ﰑ      ﰒ      ﰓ  
  fc14   fc15   fc16   fc17   fc18
 ﰔ    ﰕ    ﰖ    ﰗ    ﰘ  
 fc19   fc1a   fc1b   fc1c   fc1d
   ﰙ      ﰚ      ﰛ      ﰜ      ﰝ  
  fc1e   fc1f   fc20   fc21   fc22
 ﰞ    ﰟ    ﰠ    ﰡ    ﰢ  
 fc23   fc24   fc25   fc26   fc27
   ﰣ      ﰤ      ﰥ      ﰦ      ﰧ  
  fc28   fc29   fc2a   fc2b   fc2c
 ﰨ    ﰩ    ﰪ    ﰫ    ﰬ  
 fc2d   fc2e   fc2f   fc30   fc31
   ﰭ      ﰮ      ﰯ      ﰰ      ﰱ  
  fc32   fc33   fc34   fc35   fc36
 ﰲ    ﰳ    ﰴ    ﰵ    ﰶ  
 fc37   fc38   fc39   fc3a   fc3b
   ﰷ      ﰸ      ﰹ      ﰺ      ﰻ  
  fc3c   fc3d   fc3e   fc3f   fc40
 ﰼ    ﰽ    ﰾ    ﰿ    ﱀ  
 fc41   fc42   fc43   fc44   fc45
   ﱁ      ﱂ      ﱃ      ﱄ      ﱅ  
  fc46   fc47   fc48   fc49   fc4a
 ﱆ    ﱇ    ﱈ    ﱉ    ﱊ  
 fc4b   fc4c   fc4d   fc4e   fc4f
   ﱋ      ﱌ      ﱍ      ﱎ      ﱏ  
  fc50   fc51   fc52   fc53   fc54
 ﱐ    ﱑ    ﱒ    ﱓ    ﱔ  
 fc55   fc56   fc57   fc58   fc59
   ﱕ      ﱖ      ﱗ      ﱘ      ﱙ  
  fc5a   fc5b   fc5c   fc5d   fc5e
 ﱚ    ﱛ    ﱜ    ﱝ    ﱞ  
 fc5f   fc60   fc61   fc62   fc63
   ﱟ      ﱠ      ﱡ      ﱢ      ﱣ  
  fc64   fc65   fc66   fc67   fc68
 ﱤ    ﱥ    ﱦ    ﱧ    ﱨ  
 fc69   fc6a   fc6b   fc6c   fc6d
   ﱩ      ﱪ      ﱫ      ﱬ      ﱭ  
  fc6e   fc6f   fc70   fc71   fc72
 ﱮ    ﱯ    ﱰ    ﱱ    ﱲ  
 fc73   fc74   fc75   fc76   fc77
   ﱳ      ﱴ      ﱵ      ﱶ      ﱷ  
  fc78   fc79   fc7a   fc7b   fc7c
 ﱸ    ﱹ    ﱺ    ﱻ    ﱼ  
 fc7d   fc7e   fc7f   fc80   fc81
   ﱽ      ﱾ      ﱿ      ﲀ      ﲁ  
  fc82   fc83   fc84   fc85   fc86
 ﲂ    ﲃ    ﲄ    ﲅ    ﲆ  
 fc87   fc88   fc89   fc8a   fc8b
   ﲇ      ﲈ      ﲉ      ﲊ      ﲋ  
  fc8c   fc8d   fc8e   fc8f   fc90
 ﲌ    ﲍ    ﲎ    ﲏ    ﲐ  
 fc91   fc92   fc93   fc94   fc95
   ﲑ      ﲒ      ﲓ      ﲔ      ﲕ  
  fc96   fc97   fc98   fc99   fc9a
 ﲖ    ﲗ    ﲘ    ﲙ    ﲚ  
 fc9b   fc9c   fc9d   fc9e   fc9f
   ﲛ      ﲜ      ﲝ      ﲞ      ﲟ  
  fca0   fca1   fca2   fca3   fca4
 ﲠ    ﲡ    ﲢ    ﲣ    ﲤ  
 fca5   fca6   fca7   fca8   fca9
   ﲥ      ﲦ      ﲧ      ﲨ      ﲩ  
  fcaa   fcab   fcac   fcad   fcae
 ﲪ    ﲫ    ﲬ    ﲭ    ﲮ  
 fcaf   fcb0   fcb1   fcb2   fcb3
   ﲯ      ﲰ      ﲱ      ﲲ      ﲳ  
  fcb4   fcb5   fcb6   fcb7   fcb8
 ﲴ    ﲵ    ﲶ    ﲷ    ﲸ  
 fcb9   fcba   fcbb   fcbc   fcbd
   ﲹ      ﲺ      ﲻ      ﲼ      ﲽ  
  fcbe   fcbf   fcc0   fcc1   fcc2
 ﲾ    ﲿ    ﳀ    ﳁ    ﳂ  
 fcc3   fcc4   fcc5   fcc6   fcc7
   ﳃ      ﳄ      ﳅ      ﳆ      ﳇ  
  fcc8   fcc9   fcca   fccb   fccc
 ﳈ    ﳉ    ﳊ    ﳋ    ﳌ  
 fccd   fcce   fccf   fcd0   fcd1
   ﳍ      ﳎ      ﳏ      ﳐ      ﳑ  
  fcd2   fcd3   fcd4   fcd5   fcd6
 ﳒ    ﳓ    ﳔ    ﳕ    ﳖ  
 fcd7   fcd8   fcd9   fcda   fcdb
   ﳗ      ﳘ      ﳙ      ﳚ      ﳛ  
  fcdc   fcdd   fcde   fcdf   fce0
 ﳜ    ﳝ    ﳞ    ﳟ    ﳠ  
 fce1   fce2   fce3   fce4   fce5
   ﳡ      ﳢ      ﳣ      ﳤ      ﳥ  
  fce6   fce7   fce8   fce9   fcea
 ﳦ    ﳧ    ﳨ    ﳩ    ﳪ  
 fceb   fcec   fced   fcee   fcef
   ﳫ      ﳬ      ﳭ      ﳮ      ﳯ  
  fcf0   fcf1   fcf2   fcf3   fcf4
 ﳰ    ﳱ    ﳲ    ﳳ    ﳴ  
 fcf5   fcf6   fcf7   fcf8   fcf9
   ﳵ      ﳶ      ﳷ      ﳸ      ﳹ  
  fcfa   fcfb   fcfc   fcfd   fcfe
 ﳺ    ﳻ    ﳼ    ﳽ    ﳾ  
 fcff   fd00   fd01   fd02   fd03
   ﳿ      ﴀ      ﴁ      ﴂ      ﴃ  
  fd04   fd05   fd06   fd07   fd08
 ﴄ    ﴅ    ﴆ    ﴇ    ﴈ  
 fd09   fd0a   fd0b   fd0c   fd0d
   ﴉ      ﴊ      ﴋ      ﴌ      ﴍ  
  fd0e   fd0f   fd10   fd11   fd12
 ﴎ    ﴏ    ﴐ    ﴑ    ﴒ  
 fd13   fd14   fd15   fd16   fd17
   ﴓ      ﴔ      ﴕ      ﴖ      ﴗ  
  fd18   fd19   fd1a   fd1b   fd1c
 ﴘ    ﴙ    ﴚ    ﴛ    ﴜ  
 fd1d   fd1e   fd1f   fd20   fd21
   ﴝ      ﴞ      ﴟ      ﴠ      ﴡ  
  fd22   fd23   fd24   fd25   fd26
 ﴢ    ﴣ    ﴤ    ﴥ    ﴦ  
 fd27   fd28   fd29   fd2a   fd2b
   ﴧ      ﴨ      ﴩ      ﴪ      ﴫ  
  fd2c   fd2d   fd2e   fd2f   fd30
 ﴬ    ﴭ    ﴮ    ﴯ    ﴰ  
 fd31   fd32   fd33   fd34   fd35
   ﴱ      ﴲ      ﴳ      ﴴ      ﴵ  
  fd36   fd37   fd38   fd39   fd3a
 ﴶ    ﴷ    ﴸ    ﴹ    ﴺ  
 fd3b   fd3c   fd3d   fd3e   fd3f
   ﴻ      ﴼ      ﴽ      ﴾      ﴿  
  fd40   fd41   fd42   fd43   fd44
 ﵀    ﵁    ﵂    ﵃    ﵄  
 fd45   fd46   
   ﵅      ﵆   ")                                      

function Mostra_diretorio(){
    function devicons_get_directory_symbol {
      local symbol=""; echo "$symbol $1"
      return 0
    }

    function devicons_get_filetype_symbol {
        declare -A extensions=(
        [txt]=e
        [styl]=
        [scss]=
        [htm]=
        [html]=
        [slim]=
        [ejs]=
        [css]=
        [less]=
        [md]=
        [markdown]=
        [json]=
        [js]=
        [jsx]=
        [rb]=
        [php]=
        [py]=
        [pyc]=
        [pyo]=
        [pyd]=
        [coffee]=
        [mustache]=
        [hbs]=
        [conf]=
        [ini]=
        [yml]=
        [bat]=
        [jpg]=
        [jpeg]=
        [bmp]=
        [png]=
        [gif]=
        [ico]=
        [twig]=
        [cpp]=
        [c++]=
        [cxx]=
        [cc]=
        [cp]=
        [c]=
        [hs]=
        [lhs]=
        [lua]=
        [java]=
        [sh]=
        [fish]=
        [ml]=λ
        [mli]=λ
        [diff]=
        [db]=
        [sql]=
        [dump]=
        [clj]=
        [cljc]=
        [cljs]=
        [edn]=
        [scala]=
        [go]=
        [dart]=
        [xul]=
        [sln]=
        [suo]=
        [pl]=
        [pm]=
        [t]=
        [rss]=
        [f#]=
        [fsscript]=
        [fsx]=
        [fs]=
        [fsi]=
        [rs]=
        [rlib]=
        [d]=
        [erl]=
        [hrl]=
        [vim]=
        [ai]=
        [psd]=
        [psb]=
        [ts]=
        [jl]=
    )
    local filetype
    local default=
    local exist_check=1
    local input=$1
    local filename="$1"
    # using ## for possibly more than one "." (get after last one):
    local filetype="${filename##*.}"

    if [ ! -z "$filetype" ] && [ ${extensions[$filetype]+$exist_check} ]; then
    local symbol=${extensions[$filetype]}
    else
    local symbol=$default
    fi

    echo "$symbol $1"

    return 0
    }

    # for now wrap piped portion so uses the same 'subshell'
    # @todo fixme - dont use pipe
    find $1 -maxdepth 1 -type f -printf "%P\n" | sort | { while read line; do
       lines="$lines $(devicons_get_filetype_symbol $line) \n"
    done

    echo -en "$lines \n" | column -n
    }

    find $1 -maxdepth 1 -mindepth 1 -type d -printf "%P\n" | sort | { while read line; do
       lines="$lines $(devicons_get_directory_symbol $line) \n"
    done

    echo -en "$lines \n" | column -n
    }
}

# Nerd Fonts Version: 2.0.0
# Script Version: 1.0.0

# Given an array of decimal numbers print all unicode codepoint.
function print-decimal-unicode-range() {
  local originalSequence=("$@")
  local counter=0
  # Use alternating colors to see which symbols extend out of the bounding
  # box.
  local bgColorBorder='\033[48;5;8m'
  local bgColorCode='\033[48;5;246m'
  local alternateBgColorCode='\033[48;5;240m'
  local bgColorChar='\033[48;5;66m'
  local alternateBgColorChar='\033[48;5;60m'
  local underline='\033[4m'
  local currentColorCode="${bgColorCode}"
  local currentColorChar="${bgColorChar}"
  local reset_color='\033[0m'
  local allChars=""
  local allCodes=""
  local wrapAt=5
  local topLine="${bgColorBorder}╔══════╦══════╦══════╦══════╦══════╗${reset_color}"
  local bottomLine="${bgColorBorder}╚══════╩══════╩══════╩══════╩══════╝${reset_color}"
  local line="${bgColorBorder}╠══════╬══════╬══════╬══════╬══════╣${reset_color}"
  local bar="${bgColorBorder}║${reset_color}"
  local originalSequenceLength=${#originalSequence[@]}
  local leftoverSpaces=$((wrapAt - (originalSequenceLength % wrapAt)))

  # add fillers to array to maintain table:
  if [[ "$leftoverSpaces" < "$wrapAt" ]]; then
    # shellcheck disable=SC2034
    # needs rework without 'i' var?
    for i in $(seq 1 $leftoverSpaces); do
      originalSequence+=(0)
    done
  fi

  local sequenceLength=${#originalSequence[@]}

  printf "%b\\n" "$topLine"

  for decimalCode in "${originalSequence[@]}"; do
    local hexCode
    hexCode=$(printf '%x' "${decimalCode}")
    local code="${hexCode}"
    local char="\\u${hexCode}"

    # fill in placeholder cells properly formatted:
    if [ "${char}" = "\\u0" ]; then
      char=" "
      code="    "
    fi

    allCodes+="${currentColorCode} ${underline}${code}${reset_color}${currentColorCode} ${reset_color}$bar"
    allChars+="${currentColorChar}  ${char}   ${reset_color}$bar"
    counter=$((counter + 1))
    count=$(( (count + 1) % wrapAt))

    if [[ $count -eq 0 ]]; then

      if [[ "${currentColorCode}" = "${alternateBgColorCode}" ]]; then
        currentColorCode="${bgColorCode}"
        currentColorChar="${bgColorChar}"
      else
        currentColorCode="${alternateBgColorCode}"
        currentColorChar="${alternateBgColorChar}"
      fi

      printf "%b%b%b" "$bar" "$allCodes" "$reset_color"
      printf "\\n"
      printf "%b%b%b" "$bar" "$allChars" "$reset_color"
      printf "\\n"

      if [ "$counter" != "$sequenceLength" ]; then
        printf "%b\\n" "$line"
      fi

      allCodes=""
      allChars=""
    fi

  done

  printf "%b\\n" "$bottomLine"

}

function print-unicode-ranges() {
  echo ''

  local arr=($@)
  local len=$#
  local combinedRanges=()

  for ((j=0; j<len; j+=2)); do
    local start="${arr[$j]}"
    local end="${arr[(($j+1))]}"
    local startDecimal=$((16#$start))
    local endDecimal=$((16#$end))

    combinedRanges+=($(seq "${startDecimal}" "${endDecimal}"))

  done

  print-decimal-unicode-range "${combinedRanges[@]}"

}

function test-fonts() {
  # echo "Nerd Fonts - Pomicons"
  # print-unicode-ranges e000 e00d
  # echo; echo

  # echo "Nerd Fonts - Powerline"
  # print-unicode-ranges e0a0 e0a2 e0b0 e0b3
  # echo; echo

  # echo "Nerd Fonts - Powerline Extra"
  # print-unicode-ranges e0a3 e0a3 e0b4 e0c8 e0cc e0d2 e0d4 e0d4
  # echo; echo

  # echo "Nerd Fonts - Symbols original"
  # print-unicode-ranges e5fa e62b
  # echo; echo

  # echo "Nerd Fonts - Devicons"
  # print-unicode-ranges e700 e7c5
  # echo; echo

  # echo "Nerd Fonts - Font awesome"
  # print-unicode-ranges f000 f2e0
  # echo; echo

  # echo "Nerd Fonts - Font awesome extension"
  # print-unicode-ranges e200 e2a9
  # echo; echo

  # echo "Nerd Fonts - Octicons"
  # print-unicode-ranges f400 f4a8 2665 2665 26A1 26A1 f27c f27c
  # echo; echo

  # echo "Nerd Fonts - Font Linux"
  # print-unicode-ranges f300 f313
  # echo; echo

  # echo "Nerd Fonts - Font Power Symbols"
  # print-unicode-ranges 23fb 23fe 2b58 2b58
  # echo; echo

  # echo "Nerd Fonts - Material Design Icons"
  # print-unicode-ranges f500 fd46
  # echo; echo

  echo "Nerd Fonts - All"
  print-unicode-ranges e000 e00d e0a0 e0a2 e0b0 e0b3 e0a3 e0a3 e0b4 e0c8 e0cc e0d2 e0d4 e0d4 e5fa e62b e700 e7c5 f000 f2e0 e200 e2a9 f400 f4a8 2665 2665 26A1 26A1 f27c f27c f300 f313 23fb 23fe 2b58 2b58 f500 fd46

  echo; echo
}
#test-fonts