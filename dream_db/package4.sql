--------------------------------------------------------
--  파일이 생성됨 - 금요일-5월-08-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRIP_PACKAGE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TRIP_PACKAGE" 
   (	"PACKAGENUM" NUMBER(10,0), 
	"CITYNUM" NUMBER(3,0), 
	"IMG1" VARCHAR2(100 BYTE), 
	"IMG2" VARCHAR2(100 BYTE), 
	"IMG3" VARCHAR2(100 BYTE), 
	"TITLE" VARCHAR2(50 BYTE), 
	"DESCRIPT" VARCHAR2(2000 BYTE), 
	"SCHEDULE" VARCHAR2(1000 BYTE), 
	"DELAY" NUMBER(5,0), 
	"WDATE" DATE, 
	"PRICE" NUMBER(10,0), 
	"HITS" NUMBER(10,0), 
	"VOTEPEOPLENUM" NUMBER(10,0), 
	"VOTEGRADE" NUMBER(2,0), 
	"HISTORICAL" NUMBER(1,0), 
	"SCENERY" NUMBER(1,0), 
	"SHOPPING" NUMBER(1,0), 
	"HEALING" NUMBER(1,0), 
	"SHORTDESC" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TRIP_PACKAGE
SET DEFINE OFF;
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (37,8,'../images/package/ny_landmark1.jpg','../images/package/ny_landmark2.jpg','../images/package/ny_landmark3.jpg','뉴욕 랜드 마크 워킹 여행','뉴욕의 아름다운 풍경들과 뉴욕시가 선정한 랜드마크를 
막힘없이,알차게 그리고 빠르게 볼 수 있는 코스입니다.

우리가 지나다 놓친, 그곳 조차도 알려드리는 랜드 마크 여행 
가이드의 재미있는 영화와 뉴욕의 이야기를 들으시면서 
실속 있고 알찬 여행을 준비해보세요 

랜드 마크를 중심으로 조목 조목 볼 수 있는 
뉴욕의 명물들을 만나는 시간을 갖습니다. 
지난 여름, 가을 많은 여행자들과 투어를 진행 했던 경험을 바탕으로 
낭비 하는 시간 없이 즉각, 즉시 신속히 맞추어 함께 동행 해드립니다
','1) 미드 타운 
엠파이어스테이트빌딩 - 뉴욕공립도서관 - 브라이언트 파크 - 그랜드 센트럴 터미널 - 타임스퀘어 - 록펠러센터 - 5번가 - LOVE - 라디오시티 

2) 로어 맨하탄 
자유의 여신상 - 배터리 파크 - 볼링그린 - 월가 황소 - 뉴욕 증권 거래소 - 패더럴 홀 - 트리니티 교회 - 9.11 메모리얼 파크 - 윈터 가든 - 울워스 빌딩 
',5,to_date('15/05/07','RR/MM/DD'),70000,0,1,10,0,0,0,0,'뉴욕이 선정한, 세계가 인정한 맨하탄의 랜드마크를 돌아보는 여행 ');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (48,6,'../images/package/tai_p1_1.jpg','../images/package/tai_p1_2.jpg','../images/package/tai_p1_3.jpg','타이페이만 보긴 아쉽다! 근교로 떠나자!','타이페이만 보긴 아쉽다! 근교로 떠나자! 
대만여행의 필수코스! 예류, 진과스, 지우펀,스펀의 매력을 느껴보세요 
※투어 시 처음부터 끝까지 모두 함께다니며, 지우펀야경 보실 수 있습니다.※

대만여행의 필수코스인 예류, 진과스, 지우펀,스펀을 
현지에 사는 친구같은, 아들같은 저와 함께 편안하게 다녀오세요~ 
내려드리고 기다리는게 아닌 처음부터 끝까지 함께 안내해드립니다. 
아름다운 바다와 특별한 기암 괴석들이 장관인 예류지질공원부터, 
대만광업의 축소판이라 할 수 있는 대만관광국에서 뽑은 10대 관광 소도시 음양해,황금폭포의 수이난동, 황금박물관의 진과스, 
산비탈길사이에 형성된 상점들과 아름다운 경치와 홍등의 지우펀, 
작은 관광열차를 타고 현실의 속도를 잠시 늦추고 소원을빌며 천등을 날릴 수 있는 스펀. 
가보고 싶었지만 대중교통 이용이 불편해 망설이셨던 그 곳들, 
이제 제가 차량과 열차로 편하게 안내해드릴께요. 
그 동안 편하게 즐기고 싶지만 즐길 수 없었던 대만여행의 필수코스 예류, 진과스, 지우펀,스펀의 매력을 느껴보세요~','- 태풍이나 폭우로 인해 예류지질공원, 황금박물관이 문을 닫았을 경우 진행할 수 없습니다. 
- 황금박물관은 매월 첫째주 월요일 휴무입니다. 
- 스펀의 경우 핑시선 열차를 탑승하게됩니다.(왕복 40분소요) 
- 주말의 경우 핑시선열차가 복잡하여 차량으로 진행될 수 있습니다. 
- 핑시선 열차는 차량으로 대체가능합니다.',10,to_date('15/05/07','RR/MM/DD'),95500,0,1,10,0,1,0,0,'차량투어와 열차여행의 만남! 대만여행의 필수코스! 예류, 진과스, 지우펀, 스펀의 매력을 느껴보세요');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (52,4,'../images/package/ita_p1_1.jpg','../images/package/ita_p1_2.jpg','../images/package/ita_p1_3.jpg','바르셀로나 필수 코스 ! 가우디 워킹 투어','유럽 여행 시 대한 항공을 이용했던 승객들을 대상으로 조사한 설문조사에서 
''직접 느끼고 싶은 유럽''에서 당당히 1위로 뽑힌 바르셀로나 가우디 투어! 오페라 페스티벌과 바티칸 투어를 누르고 1위로 올라선 바르셀로나 가우디 투어라 의미가 더 큽니다.

이제 바르셀로나에 오신 분들에게는 필수 투어가 되어 버린 가우디 투어입니다. 
그런데 가우디 투어를 하고 싶긴 한데 투어 회사가 너무 많아 고르기 어려우시죠? 
대규모로 운영하는 가우디 투어도 있고, 소규모로 차량으로 하는 차량 투어도 있고, 또 소규모의 워킹 투어도 있지요. 
그러면 어떤 컨셉의 투어를 선택하셔야 후회하지 않으실까요?

Only Gaudi ! 는 다른 가우디 투어와는 이런 점들이 차별화 됩니다.','1. 하루 종일하는 투어는 이제 그만 ! 투어 시간은 지치지 않는 딱 6시간 20분 만 ! 
2. 사그라다 파밀리아 성당에서 종료되기에 관람시간은 자율적으로 ! 
3. 바르셀로나 타파스 맛집에서의 점심 ! 
4. 많은 사람들이 몰려 다니는 투어는 이제 그만! 소수의 인원으로 투어 진행! ',6,to_date('15/05/07','RR/MM/DD'),45000,0,1,10,1,1,0,0,'투어 시간은 적당히 , 만족도는 높인 합리적인 가우디 투어를 경험해 보세요 !');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (2,3,'../images/package/package1_1.jpg','../images/package/package1_2.jpg','../images/package/package1_3.jpg','베이징 후통 골목에서 힐링하기','    <div class="description" itemprop="description">
      <h3 class="title">후통 골목에서 만나는 맛과 멋, 베이징 현지인처럼 여유롭게 노니는 여행!</h3>
      <p class="text">중국의 수도 베이징에는 전통과 현대가 오묘한 조화를 이루고 있습니다. 
<br />베이징 중심부에 위치하고, 700년의 역사를 간직한 후통 골목은 이러한 고도의 얼굴을 다양하게 보여주고 있죠. 전문(前門)대가에서 자금성의 뒷골목으로, 구로우(鼓?)와 스차하이 호수를 연결하고 다시 난로우구샹(南?鼓巷)에서 용허궁 라마템플로 이어지는 모든 골목이  "후통"입니다. 그 중에는 관광지화 되어 여행객들로 붐비는 곳도 많은데요. 제가 소개할 곳은 현지인이 즐겨 찾는 비교적 한산한 후통입니다. </p>
<p class="text">옛 문인의 기품을 재해석한 모던한 찻집과 아기자기한 분위기의 카페,
<br />고풍스러운 전통식 선술집과 세련된 수제 맥주 펍이 함께 공존하는 곳,
<br />치파오와 빈티지 샵, 하이브리드 패션 편집샵이 골목 곳곳에 숨어 있는 곳! </p>
<p class="text">오늘 하루, 저와 함께 베이징런(北京人)이 되어 보세요!
<br />한적한 오후, 후통 골목 구석구석을 천천히 걷다가 
<br />전통식 찻집이나 코지 스타일의 카페에서 차 한잔의 여유를 즐겨보세요.  
<br />전통 사합원을 개조한 퓨전 레스토랑에서 맛있는 요리를 맛보거나 
<br />현지인이 즐겨 찾는, 간판 없는 샤브샤브 전문점에서 새로운 맛을 만날 수도 있어요. 
<br />거리의 악사가 연주하는 이국적인 음악이 들려오기도 하고, 어느 작은 라이브 바의 재즈 연주가 귀를 사로잡기도 합니다. </p>
<p class="text">베이징에서 유학하면서 휴식이 필요할 때마다 즐겨 찾았던 후통 골목의 매력을 다음의 분들에게 추천합니다 ^^ 
<br />-	일상을 떠나 차 한잔의 여유가 필요하신 분 
<br />-	맛있는 중국 요리를 기대하시는 분 
<br />-	중국 고건축을 직접 체험하고 싶으신 분 
<br />-	특별한 베이징을 경험하고 싶으신 분 </p>
<p class="text">가장 가까운 나라 중국, 베이징에서 새로운 힐링을 경험하세요. 
</p></div>','북경 후통에서 현지인 따라 왔다갔다',3,to_date('15/04/28','RR/MM/DD'),100000,0,1,10,1,0,0,0,'후통 골목에서 만나는 맛과 멋, 베이징 현지인처럼 여유롭게 노니는 여행');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (36,8,'../images/package/ny1.jpg','../images/package/ny2.jpg','../images/package/ny3.jpg','내 맘대로 즐기는 뉴욕의 매력!!','11년간 할렘, 퀸즈, 그리니치 빌리지 등지에서 살아왔고, 
뉴욕시립대에서 사회학과 미술사를 공부했으며, 
뉴욕 소재 직장을 경험한 이민자로서 삶이 녹아 있는 생생한 투어, 
저와 함께 해보시겠어요? 
안녕하세요.김수인이라고 합니다. 지난 3년간 다양한분야에서 오신,다양한 성격만큼이나 다양한 여행스타일을 경험하였는데요.그러기에 그 어떤 분이라도 원하시는 여행을 도와드릴 수 있다는 자신감이 생겼습니다. 
말씀만 하세요.맨하탄 저 위쪽 콜롬비아대학이나 할렘혹은 맨하탄섬을 떠나 브룩클린의 덤보,윌리암스버그에서 부쉬위크까지 어디든지 갑니다.','월가와 자유의 여신상 > 5에비뉴 랜드마크일대와 센츄럴파크 > 웨스트빌리지와 미트패킹 > 재즈바나 커피카페 > NYU CAMPUS > 소호,유니온스퀘어.이스트빌리지,로어이스트사이드 > 유명 북카페 방문> 미드타운 루프탑 야경 > 퍼블릭 라이브러리,그랜드 센츄럴, 5에비뉴> 첼시마켓과 하이라인파크 > 어린 자녀가 있으신분들을 위해 > BKLYN BRIDGE > 트라이베가와 9/11현장 > 다운타운의 루프탑 야경 > old world charm! > 현대적 부틱호텔',4,to_date('15/05/07','RR/MM/DD'),110000,0,1,10,0,0,0,0,'뉴욕 다운타운의 역사적 보물 탐방부터, 개인취향에 따라 설계하는 다양한 ‘맞춤 테마 여행’');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (42,9,'../images/package/vienna1.jpg','../images/package/vienna2.jpg','../images/package/vienna3.jpg','BEST OF VIENNA','오늘 하루 비엔나에서 최상의 시간을 약속합니다.
비엔나의 하이라이트는 꼭 보고 가야 할 필수 명소이기도 하고, 유네스코 문화유산에 등록된 문화재이기도 합니다. 
대충 훑어보고 사진만 찍고 가는 것과, 지식 가이드의 충분한 설명을 들으며 보는 것은 너무나 큰 차이가 있습니다. 
단독 투어를 하자니 비용이 부담되고, 단체로 하자니 겉핥기 식 투어가 될 것 같아 불안한 분들에게 권해 드리는 투어로, 비용은 단체 가격이지만 개인 투어처럼 상세히 비엔나를 볼 수 있는 투어입니다. 송수신기를 이용해서 진행하므로 박물관, 미술관에서 집중해서 설명을 들을 수 있고, 대중교통으로 진행하지만 가이드가 동행하기에 동선이 최대한 절약되므로 투어가 끝나면 하루가 정말 뿌듯하실 겁니다.
좀 더 깊은 비엔나 이야기, 역사와 예술에 대한 풍부한 설명, 오랜 현지 생활에서 우러나오는 진국과 같은 이야기를 듣고 싶으시다면 BEST OF VIENNA 투어를 추천해 드립니다. 비엔나 카페 명소, 비엔나의 맛집 소개는 투어중 당연 같이 해드립니다.
','> 비엔나 성슈테판 대성당
> 페스트탑 
> 호프부르그구왕궁
> 링거리의 시청사
> 국회의사당 
> 오페라하우스
> 시민공원
> 훈데르트바써하우스
> 쉰브룬궁전의내부설명 
> 벨베데레갤러리',9,to_date('15/05/07','RR/MM/DD'),70000,0,1,10,0,0,0,0,'전문 가이드가 보여드리는 비엔나의 모든것');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (49,10,'../images/package/firenze1.jpg','../images/package/firenze2.jpg','../images/package/firenze3.jpg','유럽인이 사랑하는 꽃의 도시 피렌체','피렌체의 아름다움과 르네상스 최고의 미술품들과의 만남! 
중세 시대 최고의 부와 자유를 누렸던 피렌체 . 
그리고 르네상스 예술과 학문의 발상지 피렌체. 
이런 환경의 도시에서 이토록 많은 천재가 탄생한 것은 어쩌면 너무나도 자연스러운 일입니다. 
단테, Giotto, 브루넬레스키, 기베르티, 도나텔로, 마사초, 보티첼리, 레오나르도 다 빈치, 미켈란젤로 , 마키아벨리 그리고 갈릴레오 갈릴레이 등 수많은 천재들의 도시 피렌체. 
그리고 그 천재들을 이끈 유럽 최고의 가문 메디치 가문을 소개합니다. 
그들을 체험하고 배우며 함께하는 투어에 참여하세요. 
최고의 집중력으로 많은 분들의 이해와 공감을 최대화할 수 있는 효율적이고 
여유있는 소규모 투어만을 지향합니다. 
우르르 몰려다니며 듣기만 하는 투어가 아닌 소수인원으로 친구처럼 가족처럼 함께 어울려 피렌체를 직접 느끼고 알아가는 소통하는 투어를 경험해보시길 바랍니다. 
짧은 시간에 르네상스 최고의 미술관 우피치 미술관과 피렌체 시내명소 곳곳을 최대한 보실 수 있는 투어입니다. 강추하는 코스입니다.^^','>피렌체 두오모 성당 
>산 조반니 세례당 
>Giotto의 종탑
>공화국 광장
>단테의 생가
>멧돼지 동상 
>시뇨리아 광장 
>베키오 궁전 
>베키오 다리 
>우피치 미술관',6,to_date('15/05/07','RR/MM/DD'),60000,0,1,10,0,0,0,0,'르네상스 예술과 학문의 발상지 피렌체에서 예술가들의 파란만장했던 삶들을 눈으로 직접 확인해보세요.');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (34,2,'../images/package/pa1.jpg','../images/package/pa2.jpg','../images/package/pa3.jpg','파리 야경  낭만투어 by night.','파리의 주요 명소들은 밤이 되면 화려한 빛단장을 하는데요, 프랑스의 훌륭한 조명기술 덕에 낮에 본 모습과는 180도 다른 아름답고 낭만적인 파리의 색다른 면모를 감상할 수 있습니다. 
하지만 밤에 걷기에는 관광지들간의 거리가 멀고 또 비가 자주 오는 변덕스러운 날씨탓에 생각보다 쉽지 않아 놓치기 쉬운게 바로 파리의 야간투어 입니다. 
치안문제가 걱정되어 밤에 일찍 호텔로 귀가하시는 여행자분들, 혹은 낮엔 많이 걸어서 밤에 기력이 없으신 여행자분들의 안타까운 입장을 고려하여 프랑스 현지인 운전기사와 한국인 가이드와 함께 '' 밤의 파리''를 차로 편안하고 안전하게 둘러보실 수 있습니다.

파리의 여행을 낭만적으로 시작하시거나 마지막 밤을 근사하게 장식하시고 픈 신혼여행자 분들, 나이드신 부모님이나 어린 아이를 동반한 여행자분들, 트랜짓으로 짧은 시간에 파리 시내를 둘러보고 싶은 여행자분들, 파리의 야경 여러곳을 카메라로 담고 싶은 사진작가분들.





1 .책이나 인터넷에서 흔히 찾을수 있는 여행지 소개나 역사가 아닌 파리에서 태어나 자라온 진짜 파리지앵, 프랑스인이 들려주는 파리이야기가 함께 하는 특별한 투어입니다. 
2. 개인차량으로 이동하며 주요 투어지 외에도 이동시 지나는 많은 곳 들을 설명과 함께 볼 수 있으며 주요 목적지 외에도 원하시는 곳에서 정차가 가능합니다. 
3. 여러분의 특별한 추억을 만들어 드리기위해 프랑스인들이 대중적으로 마시는 경제적인 수준의 와인을 준비하여, 아름다운 야경과함께 야외에서 와인 한 잔의 시간을 함께 갖습니다.
 
* 썸머타임이 적용되는 하절기(4-9월) 에는 일몰 시간이 늦으므로 , 즉 늦은 시간까지 해가 있어서 조명등화시간 이 늦어지므 로  밤 10시쯤 에 투어를 시작합니다.','Opera Garnier 
 
Place Vendome 

Louvre (Pyramide)  

Notre dame de paris 

Montmartre (moulin rouge) 
 
Champs Elysees ( arc de triomphe )
 
concorde (assemblee nationale) 

invalides

Tour Eiffel',3,to_date('15/05/07','RR/MM/DD'),183200,0,1,10,0,0,0,0,'프랑스인이 안내하는 파 리의 하이라이트 ''야경'' 투어 - 낭만 추억 만들기 프로젝트.');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (50,11,'../images/package/hongkong1.jpg','../images/package/hongkong2.jpg','../images/package/hongkong3.jpg','유럽의 정취를 느끼는 낭만 홍콩 여행','1997년 중국에 반환된 후 중국화가 가속화되고 있지만, 여전히 홍콩에는 영국의 영향이 많이 남아 있습니다. 
과거의 영화를 느낄 수 있는 영국풍 건축물을 위주로 주요 관광명소를 돌아보는 코스입니다. 과거에는 부자들의 휴양지로 애용되다가 현재는 부촌을 형성하고 있는 리펄스베이와 유럽풍 정취를 느낄 수 있는 여유로운 스탠리를 산책하며 일상의 여유를 즐겨 봅니다. 골목골목 형성된 스탠리 마켓을 걸으면서 기념품과 예술품, 일상용품을 구경하고 흥정하여 구매도 해봅니다. 점심 식사 후 시내로 돌아와 센트럴에 위치한 아름다운 색과 모양의 성요한성당과 세계 유명 건축가들이 디자인한 건물들을 구경한 후 100년이 넘는 전통을 자랑하는 스타페리를 타고 침사추이로 건너와 페닌슐라 호텔, 헤리티지 1881 등을 돌아보고 스타의 거리에서 야경을 구경하며 하루를 마감하는 코스입니다.','>리펄스베이 
>스탠리 머레이하우스 
>스탠리 마켓 
>센트럴 
>침사추이에서 야경
',8,to_date('15/05/07','RR/MM/DD'),200000,0,1,10,0,0,0,0,'스탠리의 머레이하우스부터 센트럴, 침사추이의 헤리티지 1881까지 유럽풍 명소 일주');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (51,12,'../images/package/berlin1.jpg','../images/package/berlin2.jpg','../images/package/berlin3.jpg','베를린의 미술과 음악, 역사, 맛있는 커피와 식사','식상한 가이드 투어는 이제 잊으세요. 여기 정이 넘치는 여행이 기다리고 있습니다. 
저는 어려서부터 수없이 많은 여행을 했었는데, 어릴 적에는 멋모르고 바쁘게 사진 찍기만 바빴습니다. 
그 때문에 후회를 많이 했고, 조금씩 성장하면서 여행하는 법을 깨닫게 되었습니다. 
이곳 베를린에 초행길로 오시는 분들과 제 경험을 나누면서, 조금 더 알찬 여행이 되시기를 바라는 마음입니다.
여행 일정이나 루트 등을 잘 모르시는 분들, 외국어가 아직 서투르거나 자신 없으신 분들 또는 먼 훗날 베를린을 떠올리면서 ''아! 내가 베를린에서 참 예쁜 궁전을 갔었지!"라고 정확히 추억하기를 원하시는 분들께 추천합니다. 
베를린의 전통적인 관광지인 박물관 섬, 브란덴부르크 문, 포츠담 광장, 국회의사당, 전승기념탑뿐만 아니라, 달리 박물관, 유대인 박물관, 초, 구담 쇼핑거리 등등 베를린 전역의 관광지를 따뜻한 차를 곁들여 선물하고, 베를린의 맛집 곳곳을 소개해드립니다. 
','>박물관 
>체크포인트 찰리 옆 베를린 장벽입니다. 
>포츠담광장 소니센터 
>영화박물관 
>홀로코스트 추도비 
>티어가르텐 
>브란덴부르크문 
>국회의사당 
>전승기념탑 
',8,to_date('15/05/07','RR/MM/DD'),110000,0,1,10,0,0,0,0,'전통적인 관광지와 현지인들의 핫스팟을 빡빡하지 않은 일정으로 맛과 멋을 더해 즐기세요');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (1,2,'../images/package/paris1.jpg','../images/package/paris2.jpg','../images/package/paris3.jpg','재미있는 파리 여행','아주 아주 재미 있습니다. 오세요 오세요','여행 일정 ~~',10,to_date('15/04/27','RR/MM/DD'),100000,0,1,10,1,1,0,0,'파리 파리 재미있는 파리');
Insert into SCOTT.TRIP_PACKAGE (PACKAGENUM,CITYNUM,IMG1,IMG2,IMG3,TITLE,DESCRIPT,SCHEDULE,DELAY,WDATE,PRICE,HITS,VOTEPEOPLENUM,VOTEGRADE,HISTORICAL,SCENERY,SHOPPING,HEALING,SHORTDESC) values (31,7,'../images/package/london_1.jpg','../images/package/london_2.jpg','../images/package/london_3.jpg','London Half-day Walking Tour','세계에서 가장 유명하고 가보고싶은 도시, 시간이 흐를수록 색채가 짙어지는 런던을 느낄 수 있는 여행!!

런던이라는 한 도시 안에 32개의 구를 이루고 있습니다. 그 의미는 각 구마다 다른 고유의 이야기를 가지고 있다는 뜻이겠죠. 눈으로도 즐겁지만 놓치기 아까운 숨은 이야기를 여러분과 함께 하고 싶습니다. 런던에 진정한 첫 한발을 디딜 수 있는 런던을 바로 알아가는 여행, 문화와 역사를 한눈에!! 어울러 런더너 보다 더 런더너스럽게 즐길 수 있게 여행의 길라잡이가 되어 드리겠습니다. 왕의 궁으로 사용되었던 국회의사당과 빅벤을 시작으로 런던아이, 로열의 모든 행사가 진행되는 웨스트민스터사원, 만인의 모임장소 트라팔가광장, 여왕이 살고 계시는 버킹엄 궁전과 넓고 푸르른 그린파크를 지나 세계에서 가장 오래된 지하철을 타고 즐거운 쇼핑과 점심을 할 수 있는 코벤트 가든에서 마무리하는 알찬 핵심!! 2일 코스입니다.','포함 사항
가이드비
불포함 사항
필요 경비 : 교통비 (하루 정액권 [Day Travel Card] 혹은 오이스터카드 4.40파운드 이상 충전)
만나는 장소
웨스트민스터 역[주빌리 라인Jubilee Line (회색) / 써클 라인Circle Line(노란색) / 디스트릭트 라인District Line (녹색)], 카페네로 앞',2,to_date('15/05/07','RR/MM/DD'),100000,0,1,10,0,0,0,1,'런던을 느끼며 힐링하는 재미난 4시간 워킹투어');
--------------------------------------------------------
--  DDL for Index PACKAGE_PN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PACKAGE_PN_PK" ON "SCOTT"."TRIP_PACKAGE" ("PACKAGENUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TRIP_PACKAGE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_PACKAGE" ADD CONSTRAINT "PACKAGE_PN_PK" PRIMARY KEY ("PACKAGENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("IMG1" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("IMG2" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("IMG3" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("TITLE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("DESCRIPT" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("SCHEDULE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("DELAY" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("WDATE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("PRICE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("HITS" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."TRIP_PACKAGE" MODIFY ("SHORTDESC" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRIP_PACKAGE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TRIP_PACKAGE" ADD CONSTRAINT "PACKAGE_CN_FK" FOREIGN KEY ("CITYNUM")
	  REFERENCES "SCOTT"."TRIP_CITY" ("CITYNUM") ENABLE;
