% clear all;
figure(200);
clf;
hold on;

sdpvar x1 x2 x3
%% 9
% vc = - 16.387240970337053624916734406725*x1^4 + 0.072806644513557158826522197614395*x1^3*x2 + 0.091533983795781703740601642493857*x1^3*x3 + 0.018223339539972210898710613946605*x1^3 + 8.9840852191718933994479812099598*x1^2*x2^2 - 0.069996364223982782126753932061547*x1^2*x2*x3 - 0.027045474050267873100672488817509*x1^2*x2 + 23.428333321140883072075666859746*x1^2*x3^2 - 0.01038785454937741353775848551777*x1^2*x3 - 3.1083165511141781500725755904568*x1^2 - 0.046151719880338525070495592217412*x1*x2^3 - 0.022142984720169709561554682863971*x1*x2^2*x3 - 0.00065043915756250270197164065066886*x1*x2^2 + 0.013300368737128830110005850428934*x1*x2*x3^2 + 0.00057644758384851901584361444363935*x1*x2*x3 - 0.037571753724208532820849626432391*x1*x2 - 0.061465198223074390959652646415634*x1*x3^3 - 0.0049598939006770346310526420552378*x1*x3^2 - 0.006762392171450171650393112798838*x1*x3 - 0.000022928370121278729816755373449588*x1 - 6.961080840533535152303556969855*x2^4 + 0.044167741262580231809131703357707*x2^3*x3 + 0.0084600504508629513489292861549984*x2^3 + 8.055711020131942845523553842213*x2^2*x3^2 - 0.018168836642266358860631214611203*x2^2*x3 - 4.8789767558250440870892816747073*x2^2 - 0.0095225742957828971024802910960716*x2*x3^3 + 0.018199268538001772688161850055621*x2*x3^2 + 0.035122737599509741557302078263092*x2*x3 + 0.0000036758800734351956396967712331625*x2 - 19.351446211502562277928518597037*x3^4 + 0.017327267995806621553311899219807*x3^3 - 0.026188589919085684259991708699999*x3^2 - 0.0000024358648401914177825805518651237*x3 + 124.05445645349054473172145662829;
%% 10
% vc = - 44.772712594439965982928697485477*x1^4 + 0.39779241615002258747324503929121*x1^3*x2 + 0.38794352829978778762765045939886*x1^3*x3 + 0.1595117768509153599598704431628*x1^3 + 19.481894621993610883237124653533*x1^2*x2^2 - 0.50749696579024317077966088618268*x1^2*x2*x3 - 0.14730406658519354379244248320902*x1^2*x2 + 69.074765336465191012393916025758*x1^2*x3^2 - 0.094920882494672384477318871631724*x1^2*x3 - 1.9897742760982770615640902178711*x1^2 - 0.16544585278069628975217142397014*x1*x2^3 - 0.11239563800482542388348150552702*x1*x2^2*x3 - 0.023391196929841581719777821035677*x1*x2^2 - 0.15701136187383449294152626407595*x1*x2*x3^2 + 0.0030282946463061361647151059628413*x1*x2*x3 - 0.051273336253807616502697896976315*x1*x2 - 0.25248198027437235291259298719524*x1*x3^3 - 0.12065371165429641941990723807976*x1*x3^2 - 0.0091585411181952687542651148078221*x1*x3 - 0.000016502267234495791994397864699273*x1 - 8.3750337762065090174701253999956*x2^4 + 0.18574845136426104685867244370456*x2^3*x3 + 0.037008952948874282440350214073987*x2^3 - 0.10327698192827190759590649804522*x2^2*x3^2 - 0.0067042712118845822905077724840339*x2^2*x3 - 3.7323453765097598378019938536454*x2^2 + 0.16985746035364188144534125513019*x2*x3^3 + 0.10734924519205805981680867944306*x2*x3^2 + 0.12562707357992197731988426312455*x2*x3 + 0.000013720163435987002572657815491208*x2 - 37.736221250284856409962230827659*x3^4 + 0.087219201288037631614180611450138*x3^3 - 0.029867959138343423003414400795918*x3^2 - 0.0000056394961497726908450671065575754*x3 + 127.9396284781832235921683604829;
%% 11
% vc = - 41.38033322271083846999317756854*x1^4 + 0.46178315232506161880365880278987*x1^3*x2 + 0.41968095882042116828714028997638*x1^3*x3 + 0.15257520105836225310369513863407*x1^3 + 17.893916635410647586468257941306*x1^2*x2^2 - 0.61393833859689517229440980372601*x1^2*x2*x3 - 0.16267814901974078645174870416668*x1^2*x2 + 63.357410314248973293160815956071*x1^2*x3^2 - 0.081382995652806947028956585654669*x1^2*x3 - 1.148876942591293470741220517084*x1^2 - 0.31439108392076253739588764801738*x1*x2^3 - 0.2455870021638915934314439937225*x1*x2^2*x3 - 0.019382311929433699432268056739304*x1*x2^2 + 0.040372023642908545781882168057564*x1*x2*x3^2 + 0.0038676793874992602788320805728972*x1*x2*x3 - 0.13040139487406046669981662944338*x1*x2 - 0.055596775049390763367984646947662*x1*x3^3 - 0.1170572175444076212791344460129*x1*x3^2 - 0.070057908931041384947846495379054*x1*x3 - 0.000037247065793929831536545477232991*x1 - 9.0880552384783985786498305969872*x2^4 + 0.38019345833621454033846021047793*x2^3*x3 + 0.057743016511274010416077118179601*x2^3 + 1.3301177768524470312883067890652*x2^2*x3^2 - 0.012159294754557363818503468166909*x2^2*x3 - 1.9038710311947613096350551131763*x2^2 - 0.13605488403563695265496846786846*x2*x3^3 + 0.1004800779637695096191407628794*x2*x3^2 + 0.3099190727283837598626803355728*x2*x3 + 0.000071529019724213675789949162808767*x2 - 34.932655746761980708470218814909*x3^4 + 0.077959810867187923077992195430852*x3^3 - 0.045031781529395874252852394192814*x3^2 - 0.000022054411033319758981803906938701*x3 + 142.07730797358212271319644059986;
%% 12
% vc = - 43.69367155282072445743324351497*x1^4 + 0.47172705246471707818400886935706*x1^3*x2 + 0.47370664536740975103512596433575*x1^3*x3 + 0.17637901689469215327221718325745*x1^3 + 18.42171689046023885794056695886*x1^2*x2^2 - 0.91910993626722548022200953710126*x1^2*x2*x3 - 0.18214135396459321669659914277872*x1^2*x2 + 66.908301106374779010366182774305*x1^2*x3^2 - 0.077624859106818738796462753271044*x1^2*x3 - 0.54837292945274618283235668059206*x1^2 - 0.39307192752087610765343583807407*x1*x2^3 - 0.30872684896610802507410653561237*x1*x2^2*x3 - 0.01486265472436557565083514731441*x1*x2^2 + 0.093774798138311132866817843023455*x1*x2*x3^2 + 0.0068990068814425873841567060651414*x1*x2*x3 - 0.047086509945479922134570216485372*x1*x2 + 0.027850614561519031892045106246769*x1*x3^3 - 0.1441823518526094416447591584074*x1*x3^2 - 0.083540926348822819313966192567023*x1*x3 - 0.000057657257143971711403889618408058*x1 - 9.4845477133801647795507960836403*x2^4 + 0.72370511415362748230961642548209*x2^3*x3 + 0.080990715739998941913313501572702*x2^3 + 1.1135491768692595826450997265056*x2^2*x3^2 - 0.017293691425934905325778601081765*x2^2*x3 - 0.87015641779731300875511124104378*x2^2 - 0.54661262058068948999078884298797*x2*x3^3 + 0.094961850982256942876880145831819*x2*x3^2 + 0.51942726326486743371191323603853*x2*x3 + 0.00011403487451554701365575433813504*x2 - 36.390932637968724350230331765488*x3^4 + 0.083200950442485335778464161649026*x3^3 - 0.21118711309237153672668796389189*x3^2 - 0.000095754319876749632162171721461164*x3 + 159.25397590042609863303368911147;
%% 13
% vc = - 51.154251842819860485178651288152*x1^4 + 0.55938804558725474525004983661347*x1^3*x2 + 0.59411051084045873871275489364052*x1^3*x3 + 0.27088372456170767277328081945598*x1^3 + 19.442071271598315718165395082906*x1^2*x2^2 - 1.3572899972939553858708450206905*x1^2*x2*x3 - 0.28092403129138326933755820391525*x1^2*x2 + 80.607643871909019139820884447545*x1^2*x3^2 - 0.14027164782800122244665885773429*x1^2*x3 - 0.32085412160694332106558590567147*x1^2 - 0.63063124619600541276298599768779*x1*x2^3 - 0.52490448872469008811947333015269*x1*x2^2*x3 + 0.13789859902211221154288978141267*x1*x2^2 + 0.23262819085529801155232121345762*x1*x2*x3^2 + 0.20025166829975243887318470115133*x1*x2*x3 + 0.012822997777962563334397394498865*x1*x2 + 0.17300501530675255201785489589383*x1*x3^3 - 0.20397765542555704176841402386344*x1*x3^2 - 0.065819655433480214745678438248433*x1*x3 - 0.000054929941957575337306909912804542*x1 - 9.6507429303423499789005290949717*x2^4 + 0.93656163291765304190761298741563*x2^3*x3 + 0.19144923059185237068646756597445*x2^3 + 0.248764383813932427047532769393*x2^2*x3^2 + 0.00351883696609614059908066607818*x2^2*x3 - 0.49792526916529261660215865958889*x2^2 - 0.63645446097127611473354136251146*x2*x3^3 + 0.041135496405993982049764667863201*x2*x3^2 + 0.4402536117959696682078174490016*x2*x3 + 0.00010040335690925355615482628124369*x2 - 42.558753164038641614297375781462*x3^4 + 0.084101539302198949354938406486326*x3^3 - 0.19076547946620753259949765379133*x3^2 - 0.00009036103055836463356260968016187*x3 + 173.95943853960605451902665663511;
%% 14
% vc = - 58.581159854286759980368515243754*x1^4 + 0.72989848593263728648850019453675*x1^3*x2 + 0.75906505570551563444325893215137*x1^3*x3 + 0.28842920991140313935474637219158*x1^3 + 20.70822738828511333508686220739*x1^2*x2^2 - 1.6864556288223877533738459533197*x1^2*x2*x3 - 0.39933854450053823947897058133094*x1^2*x2 + 94.291648797787232183509331662208*x1^2*x3^2 - 0.21879247628612868981079486729868*x1^2*x3 - 0.24983278144416365407209923432674*x1^2 - 0.94700005831719591409267877679667*x1*x2^3 - 0.79711723742035844875175598645001*x1*x2^2*x3 + 0.34540060012303575032177604953176*x1*x2^2 + 0.40336604385398605598922472381673*x1*x2*x3^2 + 0.45931112024992354347929790492344*x1*x2*x3 + 0.026557937077024054012275300351575*x1*x2 + 0.30934153701473443565106435926282*x1*x3^3 - 0.17737820934924256044418200417567*x1*x3^2 - 0.040042376652222266830705166285043*x1*x3 - 0.000065150652621702188080701767525227*x1 - 9.8868135048559686595126549946144*x2^4 + 1.15311580836521576642894615361*x2^3*x3 + 0.33731772804541465538008537805581*x2^3 - 0.75244700064285074958547738788184*x2^2*x3^2 + 0.047190563318095311851063655694816*x2^2*x3 - 0.38334575837438267242873735085595*x2^2 - 0.88205779723936972303022230335046*x2*x3^3 - 0.027017538205511001242475899175588*x2*x3^2 + 0.36154819532916909752273681988299*x2*x3 + 0.000087792405981231694321424707805335*x2 - 48.709463460473436668962676776573*x3^4 + 0.07593361714853084920573422778034*x3^3 - 0.15191721706141653180921480270626*x3^2 - 0.000074811002341451548927446502101901*x3 + 191.99736317578981470433063805103;
%% 15
% vc = - 65.570799739625755364613723941147*x1^4 + 0.94733174055169822036504001516732*x1^3*x2 + 0.96244214651806370142139712697826*x1^3*x3 + 0.2459267790329056624365478000982*x1^3 + 22.179230442279855850529202143662*x1^2*x2^2 - 1.9316781208006392756004743205267*x1^2*x2*x3 - 0.53362775017707264613164852562477*x1^2*x2 + 106.93442663388707103422348154709*x1^2*x3^2 - 0.30737934171904657265628202367225*x1^2*x3 - 0.25309013994685153337016458863218*x1^2 - 1.2521731447439734541404732226511*x1*x2^3 - 1.0588485127240945260496118862648*x1*x2^2*x3 + 0.59152593905642880667272720529581*x1*x2^2 + 0.52861871310653463229556336955284*x1*x2*x3^2 + 0.74964853286411448074488816928351*x1*x2*x3 + 0.028615798007013561188305317273262*x1*x2 + 0.38916070649015077620447300432716*x1*x3^3 - 0.095383589470101198815044085677073*x1*x3^2 - 0.013441974461442081356654654200611*x1*x3 - 0.000089119687785667244211799953301778*x1 - 10.158118124148769467751662887167*x2^4 + 1.3435236452845027432800861788564*x2^3*x3 + 0.49153642974064271076173326946446*x2^3 - 1.9159950734987676312925941601861*x2^2*x3^2 + 0.091237032551221466936119952606532*x2^2*x3 - 0.37449522679495278465466867601208*x2^2 - 1.2041597947857138883875904866727*x2*x3^3 - 0.08339421228367800698055845032286*x2*x3^2 + 0.28951114138882194648516588131315*x2*x3 + 0.000073845287080001218663755091498047*x2 - 54.337359675789826951586292125285*x3^4 + 0.081597432830207372589370606874581*x3^3 - 0.09495779029326813225342363011805*x3^2 - 0.000046485793847200269001893047082774*x3 + 215.3345898145113039845455205068;
%% 16
% vc = - 70.266469985865384728640492539853*x1^4 + 1.1114686349814648647083004107117*x1^3*x2 + 1.1164847044178867196961846275371*x1^3*x3 + 0.17328117959287603344620265488629*x1^3 + 23.002048435682020510739675955847*x1^2*x2^2 - 2.2470194144967061689044385275338*x1^2*x2*x3 - 0.62280833817753877834633158272482*x1^2*x2 + 115.42969162341810829275345895439*x1^2*x3^2 - 0.36764387579581153664420867244189*x1^2*x3 - 0.20041020479748825056098837649188*x1^2 - 1.5236676583824466657546281567193*x1*x2^3 - 1.297324453519579812166284682462*x1*x2^2*x3 + 0.80816353748033931125860362953972*x1*x2^2 + 0.67101890212721815309748762956588*x1*x2*x3^2 + 1.0341468513014839825103763359948*x1*x2*x3 + 0.031508893441771178289823041041018*x1*x2 + 0.49518107777428654880935710025369*x1*x3^3 + 0.047455706427080669718154837255497*x1*x3^2 + 0.0068733449161339325861330706857188*x1*x3 - 0.000082713537553485644098459628192899*x1 - 10.503309401820301260954693134408*x2^4 + 1.5218601443558115171583722258219*x2^3*x3 + 0.61210273671323378597008968426962*x2^3 - 2.2322786182240119678965584171237*x2^2*x3^2 + 0.12742189452856705900174461021379*x2^2*x3 - 0.39118125525644686923953941004584*x2^2 - 1.424253147434952682104380983219*x2*x3^3 - 0.14889214715906184949290036456659*x2*x3^2 + 0.20785146956393396600049072731053*x2*x3 + 0.000057822822029160510118143967428495*x2 - 58.363228401425097047194867627695*x3^4 + 0.063198513191176600156673259789386*x3^3 - 0.089131101199514242705568278779538*x3^2 - 0.000037663004866621200129959273761315*x3 + 242.56888848434240912865789141506;
%% 17
% vc = - 80.246833079258763632424233946949*x1^4 + 1.2729965105535117064761152505525*x1^3*x2 + 1.2883361223855795962833781231893*x1^3*x3 + 0.083596044853977716226900440688041*x1^3 + 24.709172467296426134453213308007*x1^2*x2^2 - 2.4855913863781169403921467164764*x1^2*x2*x3 - 0.71953031583212978539165760594187*x1^2*x2 + 133.67706973374757239980681333691*x1^2*x3^2 - 0.43847320739645456733057926612673*x1^2*x3 - 0.16057481623289721062164403520001*x1^2 - 1.754368883287898306377883272944*x1*x2^3 - 1.5302550654223965320710476589738*x1*x2^2*x3 + 1.0402603829984014005560766236158*x1*x2^2 + 0.77180955321417465953004466427956*x1*x2*x3^2 + 1.3509884393325721774203884706367*x1*x2*x3 + 0.039076685723778856185184338301042*x1*x2 + 0.57506591207747992378074286534684*x1*x3^3 + 0.21551073813739932139021959756064*x1*x3^2 + 0.025163577179697953906112317667976*x1*x3 - 0.000075118790727561656275779178315588*x1 - 10.934932561940494011309965571854*x2^4 + 1.6367939335011023604948832144146*x2^3*x3 + 0.72491409332702128054393142519984*x2^3 - 3.2520431579315669523566612042487*x2^2*x3^2 + 0.17532522219280058384249798564269*x2^2*x3 - 0.44019840342760452323034314758843*x2^2 - 1.595840235375243443272097465524*x2*x3^3 - 0.20183977566328914488025247919722*x2*x3^2 + 0.082027455123232964617763229853153*x2*x3 + 0.000034176718409293113480878351095882*x2 - 67.001957117993455881332920398563*x3^4 + 0.04482260876798001281162697750915*x3^3 - 0.036784928704269387322867146394856*x3^2 - 0.000008598816766933529187112196512377*x3 + 270.34693240325992746875272132456;
%% 18
% vc = - 88.915916364913044844797695986927*x1^4 + 1.4502695734525761217525996471522*x1^3*x2 + 1.4804325587670776886994872256764*x1^3*x3 - 0.034029844198500407148610946705958*x1^3 + 25.689649108351549244844136410393*x1^2*x2^2 - 2.7487634148727928540267839707667*x1^2*x2*x3 - 0.8248849668655638955883091512078*x1^2*x2 + 149.99190033852715941975475288928*x1^2*x3^2 - 0.55464474228951865519832153950119*x1^2*x3 - 0.11674570704810789678607108044162*x1^2 - 2.0102705841214434379082831583219*x1*x2^3 - 1.8038334614304976089016463447479*x1*x2^2*x3 + 1.2844015037812415158668954973109*x1*x2^2 + 0.88133784986112762016574606604991*x1*x2*x3^2 + 1.678363610441937270323364828073*x1*x2*x3 + 0.055968420847045660670993072471902*x1*x2 + 0.67372670153897173950241494821967*x1*x3^3 + 0.41189488674612895202642448566621*x1*x3^2 + 0.047187634476674865380285694982376*x1*x3 - 0.000057943440395003441496010049283072*x1 - 11.284104285647133636416583613027*x2^4 + 1.661089634292586492136933884467*x2^3*x3 + 0.82893079139680059252981436657137*x2^3 - 3.7461621124840887020468471746426*x2^2*x3^2 + 0.2715346242743819638043589748122*x2^2*x3 - 0.50904112279935076479375766211888*x2^2 - 1.7177528283181515700306363214622*x2*x3^3 - 0.25580107570323218357799532896024*x2*x3^2 - 0.007745726587541633921529804496231*x2*x3 + 0.000022441307317874731709975155702352*x2 - 74.966841663435900500189745798707*x3^4 + 0.0056265994059690998402301076453114*x3^3 - 0.02798968802966841570856182386251*x3^2 + 0.0000053791001873251435778976528578887*x3 + 303.87207883121084250888088718057;
%% 19
% vc = - 97.066325806275855825333565007895*x1^4 + 1.6078302925704157644304359564558*x1^3*x2 + 1.6656249249720589400425296844332*x1^3*x3 - 0.057158551093334224180164682138638*x1^3 + 27.300659660280043539160033105873*x1^2*x2^2 - 3.0657743316371632857908480218612*x1^2*x2*x3 - 0.93081234396025203103874900989467*x1^2*x2 + 164.45837748237246955795853864402*x1^2*x3^2 - 0.64386170164548894856437755152001*x1^2*x3 - 0.075304450903209654843983855698752*x1^2 - 2.2015303154357059867152202059515*x1*x2^3 - 2.0370244844101272896352838870371*x1*x2^2*x3 + 1.3565497286276173571906156212208*x1*x2^2 + 0.94448506785091379533980671112658*x1*x2*x3^2 + 1.9555291344793750418773470300948*x1*x2*x3 + 0.075229500154274861478675973103236*x1*x2 + 0.74983813249905018061269856843865*x1*x3^3 + 0.63538038562709031609188059519511*x1*x3^2 + 0.048976107795433904135151692571526*x1*x3 - 0.000040618674545160217003066105423414*x1 - 11.764625854828846485133908572607*x2^4 + 1.8558901240294849444012470485177*x2^3*x3 + 0.90264231238464209816640959616052*x2^3 - 4.3974299186642058501206520304549*x2^2*x3^2 + 0.3388126958921404696667423195322*x2^2*x3 - 0.52504149529972665710886303713778*x2^2 - 1.9085493341426078561795520727173*x2*x3^3 - 0.26199867248176234024725772542297*x2*x3^2 - 0.10889359012614666100127180925483*x2*x3 + 0.000011859483997888528233953346624485*x2 - 82.00058865342811031950986944139*x3^4 - 0.011160121557786671295242619805776*x3^3 - 0.031424283114011325457326506693789*x3^2 + 0.0000085640613093210348329229614217084*x3 + 335.69013962756201863157912157476;
%% 20
% vc = - 116.69133866660165210760169429705*x1^4 + 1.7779812391789076020387483367813*x1^3*x2 + 1.8524753412415331244034177871072*x1^3*x3 - 0.096072330314987824939620963959896*x1^3 + 30.219344717074548611890350002795*x1^2*x2^2 - 3.3410148270728092789738639112329*x1^2*x2*x3 - 1.0302103631859063082032434977009*x1^2*x2 + 200.62252127784395838716591242701*x1^2*x3^2 - 0.73912903686316555607049849641044*x1^2*x3 - 0.061194619684189523189932202740238*x1^2 - 2.4414149025402505088777616037987*x1*x2^3 - 2.2855558473202939318014159653103*x1*x2^2*x3 + 1.4572927871844443270532565293252*x1*x2^2 + 1.0561868031815155877239931214717*x1*x2*x3^2 + 2.3069577901064319824797621549806*x1*x2*x3 + 0.090611623605450788976334308699734*x1*x2 + 0.84572929259677243063464402439422*x1*x3^3 + 0.92768961328539856214803194234264*x1*x3^2 + 0.059194972327597843164692648088021*x1*x3 - 0.000039516233393262729998822446741968*x1 - 12.293621185161285325193603057414*x2^4 + 1.9303496368454753362442488651141*x2^3*x3 + 0.98988287033040689433249781359336*x2^3 - 6.3407769937809543847606619237922*x2^2*x3^2 + 0.43617645658552017806641742936336*x2^2*x3 - 0.56863118054670613865653194807237*x2^2 - 2.1028240253513672541885171085596*x2*x3^3 - 0.29463150387892139692169735099014*x2*x3^2 - 0.20596591491094778936243869793543*x2*x3 + 0.0000077835145343095969906353423506395*x2 - 99.282955756697788274323102086782*x3^4 - 0.058894588868246069979228707325092*x3^3 - 0.041431591655979281563215721462257*x3^2 + 0.000014908363879165616335247673829301*x3 + 376.14269540322817420019418932498;
%% 21
% vc = - 130.08946482756545037773321382701*x1^4 + 2.0335901578958917035322429001098*x1^3*x2 + 2.1129698036475259570465823344421*x1^3*x3 - 0.093622135021701385904080439104291*x1^3 + 32.723859057769978164742497028783*x1^2*x2^2 - 3.8994576226200052815329399891198*x1^2*x2*x3 - 1.1711152555070649672330773682916*x1^2*x2 + 224.56469279620429801980208139867*x1^2*x3^2 - 0.88301159968781739451060275314376*x1^2*x3 - 0.055938640049612284310676102450088*x1^2 - 2.7937132298937994434595566417556*x1*x2^3 - 2.6447494320918036869727529847296*x1*x2^2*x3 + 1.557282985517323359303532015474*x1*x2^2 + 1.213118271396462333200361172203*x1*x2*x3^2 + 2.7416003837299518508530127292033*x1*x2*x3 + 0.10754777195937685607685097011199*x1*x2 + 0.99659317496598143204522557425662*x1*x3^3 + 1.2629522640435872915531945182011*x1*x3^2 + 0.070857332840036674204142741473333*x1*x3 - 0.000038584400590393053002199325041133*x1 - 13.43596902663365177943433081964*x2^4 + 2.1208677499704631230770246475004*x2^3*x3 + 1.1109540166715980991085643836414*x2^3 - 6.6224512026357427174616532283835*x2^2*x3^2 + 0.57362108724827121086775605363073*x2^2*x3 - 0.63461055437050328809078791891807*x2^2 - 2.2920746594390446482236711744918*x2*x3^3 - 0.33636962926361568815281088973279*x2*x3^2 - 0.2989125863142218508805569854303*x2*x3 + 0.000009015320229850143577267178318646*x2 - 111.37997319760061998294986551628*x3^4 - 0.11271484863628440653560147666212*x3^3 - 0.057490144510559226809220945142442*x3^2 + 0.000018728103700554380280562591365445*x3 + 433.2209438976663022913271561265;
%% 22
% vc = - 156.22251399227076262832270003855*x1^4 + 2.3983387231406574358061334351078*x1^3*x2 + 2.522848163391832709834261549986*x1^3*x3 - 0.032292188413654256129436959099621*x1^3 + 37.774237544355599993650685064495*x1^2*x2^2 - 4.7073808190613348756414779927582*x1^2*x2*x3 - 1.3377388330370638680477668458479*x1^2*x2 + 271.22811897785055634813033975661*x1^2*x3^2 - 1.1238975204413450548202035861323*x1^2*x3 - 0.055258815067800316767065993417418*x1^2 - 3.3101549041923981064883264480159*x1*x2^3 - 3.1209039988017046596269210567698*x1*x2^2*x3 + 1.688288753542509068594767995819*x1*x2^2 + 1.4425927945858605383477879513521*x1*x2*x3^2 + 3.3125612497391458965978472406277*x1*x2*x3 + 0.13644877225390900088441981097276*x1*x2 + 1.1416157034149032600822692984366*x1*x3^3 + 1.6393116627506143512249536797754*x1*x3^2 + 0.084044698114289495549655839568004*x1*x3 - 0.00005789819782853771775029891322184*x1 - 15.219317656074981215397201594897*x2^4 + 2.5003589871283433687665365141584*x2^3*x3 + 1.2988601430652459978176693766727*x2^3 - 8.2744247030141107046574688865803*x2^2*x3^2 + 0.73078088329111023924156143038999*x2^2*x3 - 0.7173103773545397299216119790799*x2^2 - 2.6140412110235256015755567204906*x2*x3^3 - 0.44142197101078928245243560013478*x2*x3^2 - 0.41601742819143017193539435538696*x2*x3 + 0.0000089249329121306622916200146367061*x2 - 134.22999804950748625742562580854*x3^4 - 0.11318108905523631413370111431504*x3^3 - 0.082871213428805781675556829668494*x3^2 + 0.000028313759669765639002654913913837*x3 + 512.27542532053359991550678387284;
%% 23
% vc = - 195.70421555448209005589887965471*x1^4 + 2.77633122640460738850265443034*x1^3*x2 + 2.8859130717763603612979750323575*x1^3*x3 - 0.062869310081692150737886493061524*x1^3 + 42.984350369977249783914885483682*x1^2*x2^2 - 5.0949046616049287194982753135264*x1^2*x2*x3 - 1.5358877615059909338413035584381*x1^2*x2 + 344.5659242542757851879287045449*x1^2*x3^2 - 1.3242117613218427063515036934405*x1^2*x3 - 0.057780747838266463545231488296849*x1^2 - 3.8130090293973131210236715560313*x1*x2^3 - 3.5595130747625143285972626472358*x1*x2^2*x3 + 1.7733787987805418318032479874091*x1*x2^2 + 1.6421630943708294125826796516776*x1*x2*x3^2 + 3.8754402184505529760372155578807*x1*x2*x3 + 0.15771700711957947760311071760952*x1*x2 + 1.2881612025274287169906983763212*x1*x3^3 + 2.1470285858346702667631689109839*x1*x3^2 + 0.10377449453525852685054076118831*x1*x3 - 0.000067292091092346833038941034121905*x1 - 16.174360974762500120505137601867*x2^4 + 2.5753834289224348808033937530126*x2^3*x3 + 1.4737306788532145152004204646801*x2^3 - 11.605570532636237501833420537878*x2^2*x3^2 + 0.93882921830899612736232029419625*x2^2*x3 - 0.78243492807595660387676161917625*x2^2 - 3.0083192875029416413212857150938*x2*x3^3 - 0.50425207499247248765783524504513*x2*x3^2 - 0.54378052423759870581676523215719*x2*x3 + 0.000010118735348867782819232835622714*x2 - 169.67678106916932279091270174831*x3^4 - 0.20316840620951831519747088350414*x3^3 - 0.1221017707548461977973275338627*x3^2 + 0.000035724238047701280327882872311918*x3 + 587.85378915718331427342491224408;
%% 24
% vc = - 273.39650242684382419611210934818*x1^4 + 3.2589263027938537575778354948852*x1^3*x2 + 3.3562511580000289335146135272225*x1^3*x3 - 0.015310159136399738993850050405854*x1^3 + 49.560606565764210529323463561013*x1^2*x2^2 - 5.6863118500645093433831789297983*x1^2*x2*x3 - 1.839760885155375058630511375668*x1^2*x2 + 492.75971320250397411655285395682*x1^2*x3^2 - 1.5992531329666697104130435036495*x1^2*x3 - 0.06476811099359396084462758835798*x1^2 - 4.4810995274363758511526611982845*x1*x2^3 - 4.1790204996910276236121717374772*x1*x2^2*x3 + 1.897106711113640820087766769575*x1*x2^2 + 1.9410588550273071284379966527922*x1*x2*x3^2 + 4.6231191532671704891299668815918*x1*x2*x3 + 0.178092708725241050116139263082*x1*x2 + 1.5480254619169324659111453001969*x1*x3^3 + 2.7257282965782598793680335802492*x1*x3^2 + 0.12158874575605656265242515701175*x1*x3 - 0.000081013903294964385772697346155269*x1 - 16.986346934193537805413143360056*x2^4 + 2.7918880650780653063236513844458*x2^3*x3 + 1.7519110948437255359522168873809*x2^3 - 16.66612225822484916193388926331*x2^2*x3^2 + 1.182358264011557746897551623988*x2^2*x3 - 0.87342702549842854420347748600761*x2^2 - 3.6388353511441993148878282227088*x2*x3^3 - 0.58096981620094623188776949973544*x2*x3^2 - 0.69804408467847633978919930086704*x2*x3 + 0.000012981585341486740300303084905131*x2 - 241.85695481156326991367677692324*x3^4 - 0.27175859700355692316620093151869*x3^3 - 0.16597403855979686593258293214603*x3^2 + 0.000041307146010535933280515691334855*x3 + 694.5013932663647437948384322226;
%% 25
% vc = - 749.74723076123996179376263171434*x1^4 + 3.9053220160776418445891522424063*x1^3*x2 + 4.1076627387021140691558684920892*x1^3*x3 - 0.23761440156724664141130176631123*x1^3 + 105.12719302182441083459707442671*x1^2*x2^2 - 6.9925267589225104103434205171652*x1^2*x2*x3 - 1.9989359263781458775355304169352*x1^2*x2 + 1389.0118652368278162612114101648*x1^2*x3^2 - 1.4826743223991132314409924219945*x1^2*x3 - 0.075059375069380637746085938033502*x1^2 - 5.305202246348010852727838937426*x1*x2^3 - 4.9309433695561901700443740992341*x1*x2^2*x3 + 2.0460105950855362877405241306406*x1*x2^2 + 2.2588197283060820197420071053784*x1*x2*x3^2 + 5.513883463740765655813902412774*x1*x2*x3 + 0.19550669534635756185991795064183*x1*x2 + 1.682209999148204015995133886463*x1*x3^3 + 3.694112762318905840430716125411*x1*x3^2 + 0.14435113003767410799760284589865*x1*x3 - 0.00010751726423739310916239536597416*x1 - 20.254224057082446108779549831524*x2^4 + 3.1185972019914376396343413944123*x2^3*x3 + 2.0796912704030203755678485322278*x2^3 - 65.82206091156390925789310131222*x2^2*x3^2 + 1.4858360521187627956152255137567*x2^2*x3 - 0.96964045400481591041597084768*x2^2 - 3.8733007212979129185725923889549*x2*x3^3 - 0.87220072510093760165261755901156*x2*x3^2 - 0.88060320948856363187928764091339*x2*x3 + 0.000023566018604505175021001511792562*x2 - 666.08965951884908918145811185241*x3^4 - 0.80901991937594042170189823082183*x3^3 - 0.22852589880634061048070293509227*x3^2 + 0.00005682659380423128470940716261417*x3 + 823.32179024902939090679865330458;
%% 26
vc = - 11154.519675524430567747913300991*x1^4 + 1.1359139200021941551455029184581*x1^3*x2 + 4.9551185940709805421988676243927*x1^3*x3 - 3.9026472419460400686830325867049*x1^3 + 1171.8400789897586946608498692513*x1^2*x2^2 - 15.029906013698656863653013715521*x1^2*x2*x3 - 2.546733372542181239595038277912*x1^2*x2 + 21138.953107903726049698889255524*x1^2*x3^2 - 1.748490559079197259606530678866*x1^2*x3 - 0.089714854483177688959649742628244*x1^2 - 6.189653081344577145728180767037*x1*x2^3 - 6.0413471735014461216906056506559*x1*x2^2*x3 + 1.9733113138705307143538902892033*x1*x2^2 + 6.0690072917991519929614696593489*x1*x2*x3^2 + 7.0251109934770674669834988890216*x1*x2*x3 + 0.309510486562946829369735723958*x1*x2 + 2.0992884571699872431338462774875*x1*x3^3 + 8.942932559147786619746511860285*x1*x3^2 + 0.24086358288359460688710100839671*x1*x3 - 0.00014268412929887132421097328816018*x1 - 93.092323911383928702889534179121*x2^4 + 3.9802964720316875713024273863994*x2^3*x3 + 2.9478342629547369391218580858549*x2^3 - 987.24542046263161410024622455239*x2^2*x3^2 + 2.5758299270905467004411093512317*x2^2*x3 - 1.1949744015813998920805261150235*x2^2 + 1.8195545744888945716155603804509*x2*x3^3 - 1.3871244716819088882431287856889*x2*x3^2 - 1.3179298142931270554356615321012*x2*x3 + 0.00010208313745563388913462077312033*x2 - 10085.200851966639675083570182323*x3^4 - 1.8354278144306690467857379189809*x3^3 - 0.45525178507546493200663917377824*x3^2 + 0.00012282983600553956096343433124218*x3 + 998.82154527074328598246211186051;
% v = 0.7754493780412083*x1^4+0.01538143725956307*x1^3*x2-0.01193322783720551*x1^3*x3+0.1406438731320798*x1^2*x2^2+0.1014046006280144*x1^2*x2*x3-0.9550442999604613*x1^2*x3^2+0.0240910069628206*x1*x2^3+0.004303355017772573*x1*x2^2*x3-0.1074291288708021*x1*x2*x3^2-0.04030442091571095*x1*x3^3+0.1044002123665394*x2^4+0.02342017217092511*x2^3*x3+0.3123479952953659*x2^2*x3^2+0.07980855015340288*x2*x3^3+0.6527375651414437*x3^4+0.02009548179139661*x1^3-0.01537810103459676*x1^2*x2-0.01662614893620694*x1^2*x3+0.01738550368743247*x1*x2^2+0.01074722111660453*x1*x2*x3-0.08818121834264446*x1*x3^2+0.001698655876194973*x2^3-0.000237077928820955*x2^2*x3+0.003223829411089607*x2*x3^2+0.009841041529572332*x3^3+0.2675033622283891*x1^2-0.01636121664970925*x1*x2-0.05656214583866465*x1*x3+0.07861645436743456*x2^2+0.0765934355839933*x2*x3+0.1717958491629204*x3^2+0.0004207558255661851*x1-1.769975122612027e-06*x2-4.65115204606246e-05*x3+6.52177325710281;
%% 27
% vc = - 121959.43125691486056894063949585*x1^4 - 117.3013711238206298048680764623*x1^3*x2 - 76.185271059213803823695343453437*x1^3*x3 + 124.98434197420023394897725665942*x1^3 + 11216.202404052182828309014439583*x1^2*x2^2 - 191.12569760882573177696031052619*x1^2*x2*x3 + 145.79881074718829836456279736012*x1^2*x2 + 232693.57102905600913800299167633*x1^2*x3^2 + 152.6475459533269827261392492801*x1^2*x3 - 0.2423813856304576075384460409623*x1^2 - 0.48733540256195384543502768792678*x1*x2^3 - 2.5863555467204628612876149418298*x1*x2^2*x3 + 1.5174459577629690887334845683654*x1*x2^2 + 118.78651323509113524323765886948*x1*x2*x3^2 + 9.88305800417647439815027610166*x1*x2*x3 + 0.43921765532103651530348997766851*x1*x2 + 79.694089164283212767259101383388*x1*x3^3 - 117.24187509885108227081218501553*x1*x3^2 + 0.25992548572455032029893118306063*x1*x3 - 0.000064807795426640832001617675839356*x1 - 591.15738079230845869460608810186*x2^4 + 15.045117374014775890600503771566*x2^3*x3 - 4.5920944186810714882085449062288*x2^3 - 10036.352795098802744178101420403*x2^2*x3^2 - 2.8366472390456531904590065096272*x2^2*x3 - 1.8559879361156301769142373814248*x2^2 + 165.06684140064251664625771809369*x2*x3^3 - 142.42858501921855918226356152445*x2*x3^2 - 2.3894125782133488478109484276501*x2*x3 + 0.00021032291654225965986738100532705*x2 - 111334.55602671700762584805488586*x3^4 - 151.2474875828110896236466942355*x3^3 - 1.0980363145189617757324640479055*x3^2 + 0.00023180241607328303291533921903778*x3 + 1242.4384608199029571551363915205;
%% 28
% vc = - 1736956.6367222599219530820846558*x1^4 - 1831.4656184036703052697703242302*x1^3*x2 - 1165.4196718900354881043313071132*x1^3*x3 + 3005.3303064120932504010852426291*x1^3 + 151594.33054876374080777168273926*x1^2*x2^2 - 3372.3773137194511946290731430054*x1^2*x2*x3 + 1910.100059297866664564935490489*x1^2*x2 + 3321462.0690226759761571884155273*x1^2*x3^2 + 2142.384535120910186378750950098*x1^2*x3 + 10.032809509646304135799255163874*x1^2 + 106.14459456215021759817318525165*x1*x2^3 + 39.569294964230266486993059515953*x1*x2^2*x3 - 108.77960103930173829667182872072*x1*x2^2 + 1724.2639069840331558225443586707*x1*x2*x3^2 + 23.829920423286583996969056897797*x1*x2*x3 - 0.51994235011503908694407982693519*x1*x2 + 1122.4889524461714245262555778027*x1*x3^3 - 2879.3226230758182282443158328533*x1*x3^2 - 1.5221279319918210592987861673464*x1*x3 - 0.015514733337278813554704903765469*x1 - 5695.9458528840896178735420107841*x2^4 + 198.38626478615657333648414351046*x2^3*x3 - 89.727820764810417131229769438505*x2^3 - 140179.93604502666858024895191193*x2^2*x3^2 - 89.365236808223855291544168721884*x2^2*x3 - 5.7627799763988560854954812384676*x2^2 + 3152.6347184768492297735065221786*x2*x3^3 - 1816.1123908937747728487011045218*x2*x3^2 - 7.6425401301310609269989981839899*x2*x3 - 0.00039554262684923606734760381797855*x2 - 1590252.9204629373271018266677856*x3^4 - 2051.7382944304895318055059760809*x3^3 - 16.711725903379509361457166960463*x3^2 - 0.0055280504727621311567009598775257*x3 + 1739.9199075922572319541359320283;
%%
vcs = char(sdisplay(vc));
dom = 20; xran=[-dom dom -dom dom -dom dom];
smrplot(vcs,0,xran,[300 200 150],'b-');

%%
vc2 = -57.00341108753376*x1^4+2.880809327731682*x1^3*x2+2.322357922209354*x1^3*x3+37.3520032247302*x1^2*x2^2-3.938482455677627*x1^2*x2*x3+73.07090618778263*x1^2*x3^2-3.275408894227184*x1*x2^3-3.166942370024915*x1*x2^2*x3+0.9719450866241314*x1*x2*x3^2+1.42456739532876*x1*x3^3-18.68413307261397*x2^4+1.557005312342321*x2^3*x3-1.223411559580067*x2^2*x3^2-2.3945132371214*x2*x3^3-38.3006994565287*x3^4+0.3839065047225987*x1^3+0.1258528195954997*x1^2*x2-0.949572211129467*x1^2*x3-0.239615281545096*x1*x2^2+2.75534707647837*x1*x2*x3+2.577351739800502*x1*x3^2+0.7693894833943073*x2^3+0.1425919275931878*x2^2*x3-1.227384872583634*x2*x3^2+0.4606562678833158*x3^3-0.4978468700530902*x1^2+0.1413335164056279*x1*x2-0.1286805289704866*x1*x3-0.1240092297242926*x2^2-0.1622179590579155*x2*x3-0.2477137802286852*x3^2-0.01147039733742637*x1-0.001011474107558099*x2-0.008328911287540788*x3+484.0029368640263;
vcs2 = char(sdisplay(vc2));
smrplot(vcs2,0,xran,[800 700 600],'r-');
%% safety constraints
c1 = (x1+4)^2+(x2-6)^2+(x3+2)^2-4;
c2 = (x1+3)^2+(x2+4)^2+(x3+4)^2-4;
c3 = (x1-4)^2+(x2-0)^2+(x3-0)^2-5;
c4 = (x1+4)^2+(x2-2)^2+(x3-4)^2-5;
hold on;
c1s = char(sdisplay(c1));
c2s = char(sdisplay(c2));
c3s = char(sdisplay(c3));
c4s = char(sdisplay(c4));
smrplot(c1s,0,xran,[150 150 80],'k-');
smrplot(c2s,0,xran,[150 150 80],'k-');
smrplot(c3s,0,xran,[150 150 80],'k-');
smrplot(c4s,0,xran,[150 150 80],'k-');
xlabel('$x_1$','Interpreter','latex','Fontsize',24);
ylabel('$x_2$','Interpreter','latex','Fontsize',24);
zlabel('$x_3$','Interpreter','latex','Fontsize',24);
set(gca,'FontSize',24,'Fontname','Times');
set(gca,'Box','on');
set(gcf, 'color', [1 1 1]);
x0=1;y0=0;width=5;height=5*0.75;
set(gcf,'units','inches','position',[x0,y0,width,height]) % set window size
% view(140,15)
% view(350,10);
view(-25,10)
% dom2 = 7;
% xlim([-dom1 dom2]); ylim([-dom2 dom2]); zlim([-dom2 dom2]); hold on;