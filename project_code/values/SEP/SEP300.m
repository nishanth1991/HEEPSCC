%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% SEP: A Stable Election Protocol for clustered                        %
%      heterogeneous wireless sensor networks                          %
%                                                                      %
% (c) Georgios Smaragdakis                                             %
% WING group, Computer Science Department, Boston University           %
%                                                                      %
% You can find full documentation and related information at:          %
% http://csr.bu.edu/sep                                                %
%                                                                      %  
% To report your comment or any bug please send e-mail to:             %
% gsmaragd@cs.bu.edu                                                   %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% This is the LEACH [1] code we have used.                             %
% The same code can be used for FAIR if m=1                            %
%                                                                      %
% [1] W.R.Heinzelman, A.P.Chandrakasan and H.Balakrishnan,             %
%     "An application-specific protocol architecture for wireless      % 
%      microsensor networks"                                           % 
%     IEEE Transactions on Wireless Communications, 1(4):660-670,2002  %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Field Dimensions - x and y maximum (in meters)
xm=200;
ym=100;

%x and y Coordinates of the Sink
sink.x=0.0*xm;
sink.y=0.0*ym;

%Number of Nodes in the field
n=300;

%Optimal Election Probability of a node
%to become cluster head
p=0.2;

%Energy Model (all values in Joules)
%Initial Energy 
Eo=0.5;
%Eelec=Etx=Erx
ETX=50*0.000000001;
ERX=50*0.000000001;
%Transmit Amplifier types
Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;
%Data Aggregation Energy
EDA=5*0.000000001;

%Values for Hetereogeneity
%Percentage of nodes than are advanced
m=0.1;
%\alpha
a=1;

%maximum number of rounds
rmax=20

%%%%%%%%%%%%%%%%%%%%%%%%% END OF PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%

%Computation of do
do=sqrt(Efs/Emp);

%Creation of the random Sensor Network
figure(1);
                                                                   
                                             
                                                                   
   
s(1).xd=35.0; % ad
s(1).yd=22.0;
s(1).E= 6.5;

s(2).xd=10.0;  
s(2).yd=10.0;
s(2).E= 1.5;

s(3).xd=15.0;  
s(3).yd=22.0;
s(3).E= 2.1;

s(4).xd=25.0;  
s(4).yd=13.0;
s(4).E= 1.7;

s(5).xd=26.0;  
s(5).yd=28.0;
s(5).E= 4.6;

s(6).xd=5.0;  
s(6).yd=32.0;
s(6).E= 3.8;

s(7).xd=5.0; 
s(7).yd=19.0;
s(7).E= 2.4;

s(8).xd=15.0;  
s(8).yd=29.0;
s(8).E= 3.1;

s(9).xd=18.0;  
s(9).yd=5.0;
s(9).E= 3.1;

s(10).xd=32.0;  
s(10).yd=10.0;
s(10).E= 3.1;


s(11).xd=5.0;  
s(11).yd=10.0;
s(11).E= 3.1;

s(12).xd=17.0;  
s(12).yd=12.0;
s(12).E= 2.8;

s(13).xd=22.0;  
s(13).yd=29.0;
s(13).E= 4.3;

s(14).xd=26.0;  
s(14).yd=19.0;
s(14).E= 2.4;

s(15).xd=9.0;  
s(15).yd=5.0;
s(15).E= 1.8;

s(16).xd=10.0;  
s(16).yd=42.0;
s(16).E= 3.1;

s(17).xd=11.0;  
s(17).yd=22.0;
s(17).E= 2.3;

s(18).xd=26.0;  
s(18).yd=20.0;
s(18).E= 2.6;

s(19).xd=37.0;  
s(19).yd=14.0;
s(19).E= 4.2;

s(20).xd=4.0;  
s(20).yd=25.0;
s(20).E= 2.9;

s(21).xd=25.0;  
s(21).yd=5.0;
s(21).E= 3.7;


%2 cluster

s(22).xd=60.0;  %ad
s(22).yd=50.0;
s(22).E= 8.4;

s(23).xd=55.0;  
s(23).yd=12.0;
s(23).E= 3.1;

s(24).xd=71.0;  
s(24).yd=13.0;
s(24).E= 1.4;

s(25).xd=67.0;  
s(25).yd=26.0;
s(25).E= 3.7;

s(26).xd=44.0;  
s(26).yd=37.0;
s(26).E= 3.01;

s(27).xd=60.0;  
s(27).yd=40.0;
s(27).E= 4.1;

s(28).xd=35.0; 
s(28).yd=40.0;
s(28).E=3.3 ;

s(29).xd=40.0;  
s(29).yd=46.0;
s(29).E= 1.1;

s(30).xd=43.0;  
s(30).yd=58.0;
s(30).E=2.1 ;

s(31).xd=26.0;  
s(31).yd=55.0;
s(31).E=3.3 ;

s(32).xd=28.0;  
s(32).yd=72.0;
s(32).E=2.8 ;

s(33).xd=16.0;  
s(33).yd=45.0;
s(33).E=2.8 ;

s(34).xd=21.0;  
s(34).yd=62.0;
s(34).E=2.8 ;

s(35).xd=35.0;  
s(35).yd=60.0;
s(35).E=2.8 ;

s(36).xd=35.0;  
s(36).yd=48.0;
s(36).E=2.8 ;

s(37).xd=30.0;  
s(37).yd=37.0;
s(37).E=2.8 ;

s(38).xd=50.0;  
s(38).yd=40.0;
s(38).E=2.8 ;

s(39).xd=47.0;  
s(39).yd=20.0;
s(39).E=2.8 ;

s(40).xd=63.0;  
s(40).yd=20.0;
s(40).E=2.8 ;

s(41).xd=8.0;  
s(41).yd=69.0;
s(41).E= 2.9;

s(42).xd=8.0;  
s(42).yd=52.0;
s(42).E= 1.9;

s(43).xd=28.0;  
s(43).yd=44.0;
s(43).E= 3.3;

s(44).xd=40.0;  
s(44).yd=32.0;
s(44).E= 2.8;

s(45).xd=50.0;  
s(45).yd=49.0;
s(45).E= 4.1;

s(46).xd=57.0;  
s(46).yd=30.0;
s(46).E= 2.8;

s(47).xd=64.0;  
s(47).yd=12.0;
s(47).E= 3.5;


s(48).xd=15.0;  
s(48).yd=17.0;
s(48).E= 2.9;

s(49).xd=20.0;  
s(49).yd=51.0;
s(49).E= 1.9;

s(50).xd=40.0;  
s(50).yd=55.0;
s(50).E= 3.8;

s(51).xd=52.0;  
s(51).yd=44.0;
s(51).E= 2.6;

s(52).xd=52.0;  
s(52).yd=25.0;
s(52).E= 1.6;

s(53).xd=66.0;  
s(53).yd=35.0;
s(53).E= 2.1;

s(54).xd=49.0;  
s(54).yd=10.0;
s(54).E= 3.3;

s(55).xd=71.0;  
s(55).yd=20.0;
s(55).E= 1.5;

s(56).xd=8.0;  
s(56).yd=45.0;
s(56).E= 2.2;

s(57).xd=10.0;  
s(57).yd=62.0;
s(57).E= 4.4;

s(58).xd=25.0;  
s(58).yd=50.0;
s(58).E= 3.1;

s(59).xd=42.0;  
s(59).yd=40.0;
s(59).E= 3.6;

s(60).xd=55.0;  
s(60).yd=45.0;
s(60).E= 3.1;

s(61).xd=55.0;  
s(61).yd=3.0;
s(61).E= 2.2;

s(62).xd=63.0;  
s(62).yd=26.0;
s(62).E= 1.1;

s(63).xd=73.0;  
s(63).yd=4.0;
s(63).E= 3.6;


%3 cluster

s(64).xd=100.0; % ad
s(64).yd=66.0;
s(64).E=9.9 ;

s(65).xd=90.0;  
s(65).yd=3.0;
s(65).E=3.9 ;

s(66).xd=106.0;  
s(66).yd=6.0;
s(66).E=3.7 ;

s(67).xd=85.0;  
s(67).yd=15.0;
s(67).E=3.6 ;

s(68).xd=100.0;  
s(68).yd=18.0;
s(68).E=2.5 ;

s(69).xd=110.0;  
s(69).yd=19.0;
s(69).E=2.9 ;

s(70).xd=112.0;  
s(70).yd=33.0;
s(70).E= 2.2;

s(71).xd=85.0;  
s(71).yd=32.0;
s(71).E=4.3 ;

s(72).xd=102.0;  
s(72).yd=42.0;
s(72).E=3.7 ;

s(73).xd=93.0;  
s(73).yd=38.0;
s(73).E=3.9 ;

s(74).xd=108.0;  
s(74).yd=48.0;
s(74).E=4.1 ;

s(75).xd=98.0;  
s(75).yd=62.0;
s(75).E= 3.4;

s(76).xd=90.0;  
s(76).yd=52.0;
s(76).E=2.2 ;

s(77).xd=80.0;  
s(77).yd=46.0;
s(77).E=3.1 ;

s(78).xd=76.0;  
s(78).yd=45.0;
s(78).E=3.2 ;

s(79).xd=75.0;  
s(79).yd=60.0;
s(79).E= 2.4;

s(80).xd=85.0;  
s(80).yd=68.0;
s(80).E=4.1 ;

s(81).xd=94.0;  
s(81).yd=72.0;
s(81).E=3.4 ;

s(82).xd=75.0;  
s(82).yd=70.0;
s(82).E=2.2 ;

s(83).xd=80.0;  
s(83).yd=82.0;
s(83).E=3.3 ;

s(84).xd=74.0;  
s(84).yd=92.0;
s(84).E=4.4 ;

s(85).xd=65.0;  
s(85).yd=78.0;
s(85).E=3.5 ;

s(86).xd=50.0;  
s(86).yd=75.0;
s(86).E=2.4 ;

s(87).xd=53.0;  
s(87).yd=95.0;
s(87).E=2.7 ;

s(88).xd=40.0;  
s(88).yd=88.0;
s(88).E=3.9 ;

s(89).xd=22.0;  
s(89).yd=78.0;
s(89).E=2.9 ;

s(90).xd=24.0;  
s(90).yd=90.0;
s(90).E=3.0 ;

s(91).xd=4.0;  
s(91).yd=79.0;
s(91).E=3.9 ;

s(92).xd=38.0;  
s(92).yd=79.0;
s(92).E=3.5 ;

s(93).xd=55.0;  
s(93).yd=85.0;
s(93).E=2.9 ;

s(94).xd=59.0;  
s(94).yd=68.0;
s(94).E=3.7 ;

s(95).xd=69.0;  
s(95).yd=88.0;
s(95).E=2.7 ;

s(96).xd=78.0;  
s(96).yd=75.0;
s(96).E=2.6 ;

s(97).xd=90.0;  
s(97).yd=60.0;
s(97).E=3.2 ;

s(98).xd=86.0;  
s(98).yd=47.0;
s(98).E=4.1 ;

s(99).xd=96.0;  
s(99).yd=47.0;
s(99).E=3.9 ;

s(100).xd=80.0;  
s(100).yd=38.0;
s(100).E=3.6 ;

s(101).xd=81.0;  
s(101).yd=21.0;
s(101).E=4.1 ;

s(102).xd=95.0;  
s(102).yd=25.0;
s(102).E=3.3 ;


s(103).xd=110.0;  
s(103).yd=15.0;
s(103).E=3.7 ;

s(104).xd=9.0;  
s(104).yd=88.0;
s(104).E= 2.4;

s(105).xd=29.0;  
s(105).yd=98.0;
s(105).E= 3.1;

s(106).xd=46.0;  
s(106).yd=80.0;
s(106).E= 2.9;

s(107).xd=59.0;  
s(107).yd=95.0;
s(107).E= 3.2;

s(108).xd=72.0;  
s(108).yd=79.0;
s(108).E= 2.8;

s(109).xd=65.0;  
s(109).yd=65.0;
s(109).E= 3.8;

s(110).xd=70.0;  
s(110).yd=50.0;
s(110).E= 3.1;

s(111).xd=80.0;  
s(111).yd=62.0;
s(111).E= 1.1;

s(112).xd=92.0;  
s(112).yd=69.0;
s(112).E= 4.1;

s(113).xd=104.0;  
s(113).yd=30.0;
s(113).E= 3.1;

s(114).xd=92.0;  
s(114).yd=19.0;
s(114).E= 2.7;

s(115).xd=88.0;  
s(115).yd=42.0;
s(115).E= 2.9;

s(116).xd=13.0;  
s(116).yd=94.0;
s(116).E= 3.7;

s(117).xd=17.0;  
s(117).yd=83.0;
s(117).E= 3.1;

s(118).xd=29.0;  
s(118).yd=85.0;
s(118).E= 1.9;

s(119).xd=48.0;  
s(119).yd=95.0;
s(119).E= 3.3;

s(120).xd=54.0;  
s(120).yd=80.0;
s(120).E= 3.0;

s(121).xd=59.0;  
s(121).yd=60.0;
s(121).E= 2.7;

s(122).xd=82.0;  
s(122).yd=79.0;
s(122).E= 3.3;

s(123).xd=79.0;  
s(123).yd=55.0;
s(123).E= 3.2;

s(124).xd=98.0;  
s(124).yd=54.0;
s(124).E= 2.2;

s(125).xd=71.0;  
s(125).yd=45.0;
s(125).E= 2.6;

s(126).xd=109.0;  
s(126).yd=40.0;
s(126).E= 3.9;

s(127).xd=89.0;  
s(127).yd=25.0;
s(127).E= 1.6;

s(128).xd=81.0;  
s(128).yd=10.0;
s(128).E= 2.7;

s(129).xd=98.0;  
s(129).yd=15.0;
s(129).E=4.2;

s(130).xd=18.0;  
s(130).yd=95.0;
s(130).E=2.2;

s(131).xd=20.0;  
s(131).yd=85.0;
s(131).E=3.2;

s(132).xd=26.0;  
s(132).yd=90.0;
s(132).E=4.1;

s(134).xd=45.0;  
s(134).yd=70.0;
s(134).E=3.1;

s(135).xd=43.0;  
s(135).yd=87.0;
s(135).E=2.2;

s(136).xd=55.0;  
s(136).yd=89.0;
s(136).E=3.1;

s(137).xd=62.0;  
s(137).yd=60.0;
s(137).E=1.5;

s(138).xd=73.0;  
s(138).yd=65.0;
s(138).E=1.8;

s(139).xd=85.0;  
s(139).yd=75.0;
s(139).E=2.4;

s(140).xd=88.0;  
s(140).yd=30.0;
s(140).E=4.2;

s(141).xd=90.0;  
s(141).yd=15.0;
s(141).E=3.3;

s(142).xd=92.0;  
s(142).yd=35.0;
s(142).E=2.5;

s(143).xd=100.0;  
s(143).yd=6.0;
s(143).E=3.2;

s(144).xd=102.0;  
s(144).yd=20.0;
s(144).E=4.1;

s(145).xd=102.0;  
s(145).yd=50.0;
s(145).E=3.3;

s(146).xd=112.0;  
s(146).yd=15.0;
s(146).E=2.7;


%fourth cluster

s(147).xd=145.0;  
s(147).yd=18.0;
s(147).E=9.3;

s(148).xd=133.0;  
s(148).yd=8.0;
s(148).E=4.1 ;

s(149).xd=125.0;  
s(149).yd=18.0;
s(149).E=3.7;

s(150).xd=135.0;  
s(150).yd=34.0;
s(150).E=8.3 ;

s(151).xd=123.0;  
s(151).yd=42.0;
s(151).E=4.6 ;

s(152).xd=134.0;  
s(152).yd=52.0;
s(152).E=2.1 ;

s(153).xd=118.0;  
s(153).yd=50.0;
s(153).E=4.6 ;

s(154).xd=123.0;  
s(154).yd=60.0;
s(154).E=4.1 ;

s(155).xd=126.0;  
s(155).yd=65.0;
s(155).E=2.5 ;

s(156).xd=113.0;  
s(156).yd=65.0;
s(156).E=3.0 ;

s(157).xd=125.0;  
s(157).yd=70.0;
s(157).E=4.1 ;

s(158).xd=120.0;  
s(158).yd=72.0;
s(158).E=3.6 ;

s(159).xd=124.0;  
s(159).yd=80.0;
s(159).E=3.9 ;

s(160).xd=105.0;  
s(160).yd=82.0;
s(160).E=3.2 ;

s(161).xd=124.0;  
s(161).yd=90.0;
s(161).E=2.9 ;

s(162).xd=116.0;  
s(162).yd=92.0;
s(162).E=3.6 ;

s(163).xd=110.0;  
s(163).yd=90.0;
s(163).E=3.6 ;

s(164).xd=95.0;  
s(164).yd=85.0;
s(164).E=2.9 ;

s(165).xd=90.0;  
s(165).yd=95.0;
s(165).E=4.3 ;

s(166).xd=98.0;  
s(166).yd=95.0;
s(166).E=3.3 ;

s(167).xd=115.0;  
s(167).yd=80.0;
s(167).E=2.3 ;

s(168).xd=116.0;  
s(168).yd=73.0;
s(168).E=2.4 ;

s(169).xd=118.0;  
s(169).yd=70.0;
s(169).E=2.7 ;

s(170).xd=127.0;  
s(170).yd=45.0;
s(170).E=2.5 ;

s(171).xd=136.0;  
s(171).yd=35.0;
s(171).E=3.3 ;

s(172).xd=122.0;  
s(172).yd=25.0;
s(172).E=3.5 ;

s(173).xd=129.0;  
s(173).yd=25.0;
s(173).E=3.6 ;

s(174).xd=126.0;  
s(174).yd=9.0;
s(174).E=3.7 ;

s(175).xd=85.0;  
s(175).yd=98.0;
s(175).E=3.2;

s(176).xd=100.0;  
s(176).yd=84.0;
s(176).E=2.7;

s(177).xd=104.0;  
s(177).yd=78.0;
s(177).E=3.1;

s(178).xd=113.0;  
s(178).yd=69.0;
s(178).E=3.5;

s(179).xd=134.0;  
s(179).yd=60.0;
s(179).E=2.5;

s(180).xd=138.0;  
s(180).yd=48.0;
s(180).E=2.2;

s(181).xd=119.0;  
s(181).yd=45.0;
s(181).E=2.9;

s(182).xd=130.0;  
s(182).yd=35.0;
s(182).E=3.6;

s(183).xd=135.0;  
s(183).yd=15.0;
s(183).E=3.8;

s(184).xd=99.0;  
s(184).yd=90.0;
s(184).E=2.9;

s(185).xd=115.0;  
s(185).yd=85.0;
s(185).E=3.2;

s(186).xd=114.0;  
s(186).yd=72.0;
s(186).E=4.0;

s(187).xd=139.0;  
s(187).yd=65.0;
s(187).E=1.9;

s(188).xd=119.0;  
s(188).yd=60.0;
s(188).E=3.6;

s(189).xd=140.0;  
s(189).yd=29.0;
s(189).E=3.1;

s(190).xd=140.0;  
s(190).yd=15.0;
s(190).E=2.6;

s(191).xd=120.0;  
s(191).yd=22.0;
s(191).E=1.6;

s(192).xd=134.0;  
s(192).yd=7.0;
s(192).E=2.2;

s(193).xd=80.0;  
s(193).yd=98.0;
s(193).E=3.1;

s(194).xd=105.0;  
s(194).yd=95.0;
s(194).E=3.6;

s(195).xd=106.0;  
s(195).yd=53.0;
s(195).E=2.6;

s(196).xd=120.0;  
s(196).yd=75.0;
s(196).E=1.8;

s(197).xd=125.0;  
s(197).yd=55.0;
s(197).E=3.1;

s(198).xd=120.0;  
s(198).yd=44.0;
s(198).E=2.5;

s(199).xd=115.0;  
s(199).yd=53.0;
s(199).E=1.4;

s(200).xd=115.0;  
s(200).yd=30.0;
s(200).E=2.6;

s(201).xd=120.0;  
s(201).yd=10.0;
s(201).E=4.2;

s(202).xd=137.0;  
s(202).yd=22.0;
s(202).E=3.4;

%fifth

s(203).xd=155.0;% ad
s(203).yd=85.0;
s(203).E=8.9 ;

s(204).xd=158.0;  
s(204).yd=12.0;
s(204).E= 3.8;

s(205).xd=167.0;  
s(205).yd=22.0;
s(205).E=2.9 ;

s(206).xd=155.0;  
s(206).yd=24.0;
s(206).E=2.4;

s(207).xd=147.0;  
s(207).yd=31.0;
s(207).E=2.3 ; 

s(208).xd=162;  
s(208).yd=35.0;
s(208).E=2.6 ;

s(209).xd=148.0;  
s(209).yd=43.0;
s(209).E=4.8 ;

s(210).xd=154.0;  
s(210).yd=55.0;
s(210).E=2.9 ;

s(211).xd=148.0;  
s(211).yd=58.0;
s(211).E=3.8 ;

s(212).xd=156.0;  
s(212).yd=70.0;
s(212).E=3.7 ;

s(213).xd=149.0;  
s(213).yd=69.0;
s(213).E=3.5 ;

s(214).xd=150.0;  
s(214).yd=80.0;
s(214).E=3.2 ;

s(215).xd=142.0;  
s(215).yd=82.0;
s(215).E=2.7 ;

s(216).xd=143.0;  
s(216).yd=88.0;
s(216).E=3.5 ;

s(217).xd=128.0;  
s(217).yd=96.0;
s(217).E=4.3 ;


s(218).xd=130.0;  
s(218).yd=90.0;
s(218).E=4.4 ;

s(219).xd=145.0;  
s(219).yd=81.0;
s(219).E=4.6 ;

s(220).xd=148.0;  
s(220).yd=75.0;
s(220).E=4.8 ;

s(221).xd=155.0;  
s(221).yd=60.0;
s(221).E=2.3 ;

s(222).xd=165.0;  
s(222).yd=53.0;
s(222).E=3.5 ;

s(223).xd=159.0;  
s(223).yd=49.0;
s(223).E=3.9 ;

s(224).xd=155.0;  
s(224).yd=38.0;
s(224).E=2.7 ;

s(225).xd=163.0;  
s(225).yd=20.0;
s(225).E=2.9 ;

s(226).xd=123.0;  
s(226).yd=98.0;
s(226).E=3.6;

s(227).xd=135.0;  
s(227).yd=85.0;
s(227).E=2.9;

s(228).xd=150.0;  
s(228).yd=65.0;
s(228).E=2.7;

s(229).xd=146.0;  
s(229).yd=52.0;
s(229).E=1.5;

s(230).xd=170.0;  
s(230).yd=45.0;
s(230).E=2.3;

s(231).xd=170.0;  
s(231).yd=37.0;
s(231).E=2.6;

s(232).xd=154.0;  
s(232).yd=20.0;
s(232).E=1.1;

s(233).xd=165.0;  
s(233).yd=15.0;
s(233).E=2.8;

s(234).xd=134.0;  
s(234).yd=99.0;
s(234).E=1.9;

s(235).xd=145.0;  
s(235).yd=90.0;
s(235).E=3.5;

s(236).xd=140.0;  
s(236).yd=75.0;
s(236).E=3.1;

s(237).xd=162.0;  
s(237).yd=65.0;
s(237).E=2.0;

s(238).xd=145.0;  
s(238).yd=60.0;
s(238).E=3.0;

s(239).xd=165.0;  
s(239).yd=45.0;
s(239).E=4.0;

s(240).xd=162.0;  
s(240).yd=25.0;
s(240).E=1.5;

s(241).xd=152.0;  
s(241).yd=5.0;
s(241).E=2.8;

s(242).xd=125.0;  
s(242).yd=92.0;
s(242).E=3.2;

s(243).xd=145.0;  
s(243).yd=73.0;
s(243).E=2.1;

s(244).xd=156.0;  
s(244).yd=60.0;
s(244).E=3.2;

s(245).xd=148.0;  
s(245).yd=50.0;
s(245).E=3.5;

s(246).xd=152.0;  
s(246).yd=35.0;
s(246).E=4.0;

s(247).xd=158.0;  
s(247).yd=5.0;
s(247).E=1.7;

s(248).xd=168.0;  
s(248).yd=20.0;
s(248).E=2.1;

%sixth

s(249).xd=195.0; % ad
s(249).yd=10.0;
s(249).E=9.4 ;

s(250).xd=183.0;  
s(250).yd=12.0;
s(250).E=3.7 ;

s(251).xd=182.0;  
s(251).yd=20.0;
s(251).E=3.1 ;

s(252).xd=195.0;  
s(252).yd=25.0;
s(252).E=3.5 ;

s(253).xd=184.0;  
s(253).yd=38.0;
s(253).E=3.8 ;

s(254).xd=192.0;  
s(254).yd=43.0;
s(254).E=3.9 ;

s(255).xd=185.0;  
s(255).yd=52.0;
s(255).E=3.5 ;

s(256).xd=171.0;  
s(256).yd=50.0;
s(256).E=2.9 ;

s(257).xd=165.0;  
s(257).yd=64.0;
s(257).E= 4.9;

s(258).xd=118.0;  
s(258).yd=68.0;
s(258).E=4.3 ;

s(259).xd=180.0;  
s(259).yd=73.0;
s(259).E=4.4 ;

s(260).xd=190.0;  
s(260).yd=75.0;
s(260).E=3.2 ;

s(261).xd=186.0;  
s(261).yd=83.0;
s(261).E=2.2 ;

s(262).xd=173.0;  
s(262).yd=83.0;
s(262).E= 3.7;

s(263).xd=184.0;  
s(263).yd=92.0;
s(263).E=1.3 ;

s(264).xd=169.0;  
s(264).yd=88.0;
s(264).E=2.9 ;

s(265).xd=148.0;  
s(265).yd=89.0;
s(265).E=3.1 ;

s(266).xd=155.0;  
s(266).yd=96.0;
s(266).E=1.6 ; 

s(267).xd=146.0;  
s(267).yd=75.0;
s(267).E= 2.3;

s(268).xd=170.0;  
s(268).yd=55.0;
s(268).E=2.8 ;

s(269).xd=183.0;  
s(269).yd=38.0;
s(269).E=1.3 ; 

s(270).xd=179.0;  
s(270).yd=89.0;
s(270).E=2.8 ;

s(271).xd=178.0;  
s(271).yd=85.0;
s(271).E=3.9 ;

s(272).xd=174.0;  
s(272).yd=72.0;
s(272).E=4.0 ;

s(273).xd=179.0;  
s(273).yd=60.0;
s(273).E=3.6 ;

s(274).xd=182.0;  
s(274).yd=45.0;
s(274).E=3.4 ;

s(275).xd=195.0;  
s(275).yd=40.0;
s(275).E=3.8 ;

s(276).xd=184.0;  
s(276).yd=35.0;
s(276).E=2.6 ;

s(277).xd=191.0;  
s(277).yd=20.0;
s(277).E=4.2 ;

s(278).xd=164.0;  
s(278).yd=85.0;
s(278).E=1.9;

s(279).xd=155.0;  
s(279).yd=94.0;
s(279).E=3.9;

s(280).xd=172.0;  
s(280).yd=98.0;
s(280).E=3.1;

s(281).xd=189.0;  
s(281).yd=98.0;
s(281).E=2.7;

s(282).xd=195.0;  
s(282).yd=85.0;
s(282).E=3.3;

s(283).xd=179.0;  
s(283).yd=65.0;
s(283).E=4.0;

s(284).xd=195.0;  
s(284).yd=59.0;
s(284).E=2.6;

s(285).xd=179.0;  
s(285).yd=39.0;
s(285).E=1.8;

s(286).xd=195.0;  
s(286).yd=30.0;
s(286).E=3.3;

s(287).xd=190.0;  
s(287).yd=10.0;
s(287).E=3.7;

s(288).xd=165.0;  
s(288).yd=90.0;
s(288).E=2.5;

s(289).xd=195.0;  
s(289).yd=89.0;
s(289).E=3.5;

s(290).xd=189.0;  
s(290).yd=72.0;
s(290).E=2.7;

s(291).xd=195.0;  
s(291).yd=56.0;
s(291).E=3.3;

s(292).xd=189.0;  
s(292).yd=42.0;
s(292).E=2.5;

s(293).xd=197.0;  
s(293).yd=17.0;
s(293).E=3.5;

s(294).xd=165.0;  
s(294).yd=86.0;
s(294).E=3.9;

s(295).xd=162.0;  
s(295).yd=75.0;
s(295).E=1.5;

s(296).xd=190.0;  
s(296).yd=80.0;
s(296).E=2.7;

s(297).xd=180.0;  
s(297).yd=60.0;
s(297).E=1.8;

s(298).xd=190.0;  
s(298).yd=68.0;
s(298).E=3.1;

s(299).xd=184.0;  
s(299).yd=35.0;
s(299).E=4.0;

s(300).xd=175.0;  
s(300).yd=20.0;
s(300).E=3.6;

sum=0;
for i=1:1:n
%    S(i).xd=rand(1,1)*xm;
%    XR(i)=S(i).xd;
 %   S(i).yd=rand(1,1)*ym;
 %   YR(i)=S(i).yd;
    s(i).G=0;
    %initially there are no cluster heads only nodes
    s(i).type='N';
   
    temp_rnd0=i;
    %Random Election of Normal Nodes
    if (temp_rnd0>=m*n+1) 
  %      S(i).E=Eo;
        s(i).ENERGY=0;
     %   plot(S(i).xd,S(i).yd,'o');
   %     hold on;
    end
    %Random Election of Advanced Nodes
    if (temp_rnd0<m*n+1)  
        %S(i).E=Eo*(1+a)
        s(i).ENERGY=1;
    %    plot(S(i).xd,S(i).yd,'+');
        hold on;
    end
end

s(n+1).xd=sink.x;
s(n+1).yd=sink.y;
%plot(s(n+1).xd,s(n+1).yd,'x');
    
        
%First Iteration
%figure(1);

%counter for CHs
countCHs=0;
%counter for CHs per round
rcountCHs=0;
cluster=1;

countCHs;
rcountCHs=rcountCHs+countCHs;
flag_first_dead=0;

for r=0:1:rmax
    r

  %Operation for epoch
  if(mod(r, round(1/p) )==0)
    for i=1:1:n
        s(i).G=0;
        s(i).cl=0;
    end
  end

hold off;

%Number of dead nodes
dead=0;
%Number of dead Advanced Nodes
dead_a=0;
%Number of dead Normal Nodes
dead_n=0;

%counter for bit transmitted to Bases Station and to Cluster Heads
packets_TO_BS=0;
packets_TO_CH=0;
%counter for bit transmitted to Bases Station and to Cluster Heads 
%per round
PACKETS_TO_CH(r+1)=0;
PACKETS_TO_BS(r+1)=0;

%figure(1);

for i=1:1:n
    %checking if there is a dead node
    if (s(i).E<=0)
 %       plot(S(i).xd,S(i).yd,'red .');
        dead=dead+1;
        if(s(i).ENERGY==1)
            dead_a=dead_a+1;
        end
        if(s(i).ENERGY==0)
            dead_n=dead_n+1;
        end
        hold on;    
    end
    if s(i).E>0
        s(i).type='N';
        if (s(i).ENERGY==0)  
  %      plot(S(i).xd,S(i).yd,'o');
        end
        if (s(i).ENERGY==1)  
   %     plot(S(i).xd,S(i).yd,'+');
        end
        %hold on;
    end
end
%plot(s(n+1).xd,s(n+1).yd,'x');


STATISTICS(r+1).DEAD=dead;
DEAD(r+1)=dead;
DEAD_N(r+1)=dead_n;
DEAD_A(r+1)=dead_a;

%When the first node dies
if (dead==1)
    if(flag_first_dead==0)
        first_dead=r
        flag_first_dead=1;
    end
end

countCHs=0;
cluster=1;
for i=1:1:n
   if(s(i).E>0)
   temp_rand=rand;     
   if ( (s(i).G)<=0)

 %Election of Cluster Heads
 if(temp_rand<= (p/(1-p*mod(r,round(1/p)))))
            countCHs=countCHs+1;
            packets_TO_BS=packets_TO_BS+1;
            PACKETS_TO_BS(r+1)=packets_TO_BS;
            
            s(i).type='C';
            s(i).G=round(1/p)-1;
            C(cluster).xd=s(i).xd;
            C(cluster).yd=s(i).yd;
            plot(s(i).xd,s(i).yd,'k*');
            
            distance=sqrt( (s(i).xd-(s(n+1).xd) )^2 + (s(i).yd-(s(n+1).yd) )^2 );
            C(cluster).distance=distance;
            C(cluster).id=i;
            X(cluster)=s(i).xd;
            Y(cluster)=s(i).yd;
            cluster=cluster+1;
            
            %Calculation of Energy dissipated
            distance;
            if (distance>do)
                s(i).E=s(i).E- ( (ETX+EDA)*(4000) + Emp*4000*( distance*distance*distance*distance )); 
            end
            if (distance<=do)
                s(i).E=s(i).E- ( (ETX+EDA)*(4000)  + Efs*4000*( distance * distance )); 
            end
        end     
    
    end
  end 
end

STATISTICS(r+1).CLUSTERHEADS=cluster-1;
CLUSTERHS(r+1)=cluster-1;

%Election of Associated Cluster Head for Normal Nodes
for i=1:1:n
   if ( s(i).type=='N' & s(i).E>0 )
     if(cluster-1>=1)
       min_dis=sqrt( (s(i).xd-s(n+1).xd)^2 + (s(i).yd-s(n+1).yd)^2 );
       min_dis_cluster=1;
       for c=1:1:cluster-1
           temp=min(min_dis,sqrt( (s(i).xd-C(c).xd)^2 + (s(i).yd-C(c).yd)^2 ) );
           if ( temp<min_dis )
               min_dis=temp;
               min_dis_cluster=c;
           end
       end
       
       %Energy dissipated by associated Cluster Head
            min_dis;
            if (min_dis>do)
                s(i).E=s(i).E- ( ETX*(4000) + Emp*4000*( min_dis * min_dis * min_dis * min_dis)); 
            end
            if (min_dis<=do)
                s(i).E=s(i).E- ( ETX*(4000) + Efs*4000*( min_dis * min_dis)); 
            end
        %Energy dissipated
        if(min_dis>0)
          s(C(min_dis_cluster).id).E = s(C(min_dis_cluster).id).E- ( (ERX + EDA)*4000 ); 
         PACKETS_TO_CH(r+1)=n-dead-cluster+1; 
        end

       s(i).min_dis=min_dis;
       s(i).min_dis_cluster=min_dis_cluster;
           
   end
 end
end
%hold on;

countCHs;
rcountCHs=rcountCHs+countCHs;



%Code for Voronoi Cells
%Unfortynately if there is a small
%number of cells, Matlab's voronoi
%procedure has some problems

%[vx,vy]=voronoi(X,Y);
%plot(X,Y,'r*',vx,vy,'b-');
% hold on;
% voronoi(X,Y);
% axis([0 xm 0 ym]);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   STATISTICS    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                     %
%  DEAD  : a rmax x 1 array of number of dead nodes/round 
%  DEAD_A : a rmax x 1 array of number of dead Advanced nodes/round
%  DEAD_N : a rmax x 1 array of number of dead Normal nodes/round
%  CLUSTERHS : a rmax x 1 array of number of Cluster Heads/round
%  PACKETS_TO_BS : a rmax x 1 array of number packets send to Base Station/round
%  PACKETS_TO_CH : a rmax x 1 array of number of packets send to ClusterHeads/round
%  first_dead: the round where the first node died                   
%                                                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






