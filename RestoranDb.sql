CREATE TABLE Cities (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL
);

CREATE TABLE Restaurants (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Capacity INT NOT NULL,
	CityId INT REFERENCES Cities(Id),
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL
);

CREATE TABLE Category(
	Id SERIAL PRIMARY KEY,
	CategoryName Varchar(50) NOT NULL
);

CREATE TABLE Dishes (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Price INT NOT NULL,
	calories INT NOT NULL,
	Available BOOL NOT NULL,
	RestaurantsId INT REFERENCES Restaurants(Id)
);

ALTER TABLE Dishes
	ADD COLUMN CategoryId INT REFERENCES Category(Id);

CREATE TABLE Persons (
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Surname VARCHAR(20) NOT NULL,
	Adress VARCHAR(50) NOT NULL,
	DateOfBirth DATE NOT NULL
);

CREATE TABLE Customers (
	Id INT PRIMARY KEY,
	LoyaltyCard BOOL NOT NULL,
	FOREIGN KEY (Id) REFERENCES Persons(Id)
);

CREATE TABLE Cook (
	Id INT PRIMARY KEY,
	FOREIGN KEY (Id) REFERENCES Persons(Id),
	RestaurantsId INT REFERENCES Restaurants(Id)
);

CREATE TABLE Waiter (
	Id INT PRIMARY KEY,
	FOREIGN KEY (Id) REFERENCES Persons(Id),
	RestaurantsId INT REFERENCES Restaurants(Id)
);

CREATE TABLE DeliveryMan (
	Id INT PRIMARY KEY,
	DriversLicence BOOL NOT NULL,
	FOREIGN KEY (Id) REFERENCES Persons(Id),
	RestaurantsId INT REFERENCES Restaurants(Id)
);

CREATE TABLE Orders(
	Id SERIAL PRIMARY KEY,
	Price INT,
	RestaurantsId INT REFERENCES Restaurants(Id),
	CustomersId INT REFERENCES Customers(Id),
	DeliveryAdress VARCHAR(50) 
);

ALTER TABLE Orders 
	ADD COLUMN Delivery BOOLEAN DEFAULT FALSE;

CREATE TABLE DeliveryOrders(
	OrderId INT PRIMARY KEY,
    TimeOfDelivery TIME NOT NULL,
	DeliveryManId INT REFERENCES DeliveryMan(Id),
    NoteForDelivery VARCHAR(100),
    FOREIGN KEY (OrderId) REFERENCES Orders(Id)
);



CREATE TABLE OrderDishes(
	OrderId INT REFERENCES Orders(Id),
	DishesId INT REFERENCES Dishes(Id),
	PRIMARY KEY (DishesId, OrderId),
	Amount INT NOT NULL CHECK (Amount > 0)
);

CREATE TABLE OrderComments(
	Id SERIAL PRIMARY KEY,
	Text VARCHAR(100) NOT NULL,
	OrderId INT REFERENCES Orders(Id),
	Grade INT NOT NULL
);

insert into Cities (id, name) values (1, 'Split');
insert into Cities (id, name) values (2, 'Zadar');
insert into Cities (id, name) values (3, 'Zagreb');
insert into Cities (id, name) values (4, 'Rijeka');
insert into Cities (id, name) values (5, 'Ushibuka');
insert into Cities (id, name) values (6, 'Henghe');
insert into Cities (id, name) values (7, 'Zhenkou');
insert into Cities (id, name) values (8, 'Tambarangan');
insert into Cities (id, name) values (9, 'Hotaka');
insert into Cities (id, name) values (10, 'Marādah');
insert into Cities (id, name) values (11, 'Daykitin');
insert into Cities (id, name) values (12, 'Rueil-Malmaison');
insert into Cities (id, name) values (13, 'Goascorán');
insert into Cities (id, name) values (14, 'Yemva');
insert into Cities (id, name) values (15, 'Langkapcaang Hilir');
insert into Cities (id, name) values (16, 'Tonshayevo');
insert into Cities (id, name) values (17, 'Richards Bay');
insert into Cities (id, name) values (18, 'Amarillo');
insert into Cities (id, name) values (19, 'Banjarsari');
insert into Cities (id, name) values (20, 'Kara Suu');
insert into Cities (id, name) values (21, 'Kedungbacin');
insert into Cities (id, name) values (22, 'Montpellier');
insert into Cities (id, name) values (23, 'Sosándra');
insert into Cities (id, name) values (24, 'Şaḩam');
insert into Cities (id, name) values (25, 'Sinanju');
insert into Cities (id, name) values (26, 'Buffalo');
insert into Cities (id, name) values (27, 'Syktyvkar');
insert into Cities (id, name) values (28, 'Masaran');
insert into Cities (id, name) values (29, 'Babakanjaya');
insert into Cities (id, name) values (30, 'Aracaju');
insert into Cities (id, name) values (31, 'Ar Rujum');
insert into Cities (id, name) values (32, 'Dundrum');
insert into Cities (id, name) values (33, 'Petaling Jaya');
insert into Cities (id, name) values (34, 'Perivóli');
insert into Cities (id, name) values (35, 'Runting');
insert into Cities (id, name) values (36, 'Remedios');
insert into Cities (id, name) values (37, 'Libice nad Cidlinou');
insert into Cities (id, name) values (38, 'Bakhmach');
insert into Cities (id, name) values (39, 'Clearwater');
insert into Cities (id, name) values (40, 'Linton');
insert into Cities (id, name) values (41, 'Ayotupas');
insert into Cities (id, name) values (42, 'Klyuchevskiy');
insert into Cities (id, name) values (43, 'Pindobaçu');
insert into Cities (id, name) values (44, 'Ōdachō-ōda');
insert into Cities (id, name) values (45, 'Katrineholm');
insert into Cities (id, name) values (46, 'Desa Kertasari');
insert into Cities (id, name) values (47, 'Chodów');
insert into Cities (id, name) values (48, 'Yuzhai');
insert into Cities (id, name) values (49, 'Shuangkou');
insert into Cities (id, name) values (50, 'Jambangan');
insert into Cities (id, name) values (51, 'Koshki');
insert into Cities (id, name) values (52, 'Passo Fundo');
insert into Cities (id, name) values (53, 'Jingyang');
insert into Cities (id, name) values (54, 'Siraway');
insert into Cities (id, name) values (55, 'Lokot’');
insert into Cities (id, name) values (56, 'Cangshan');
insert into Cities (id, name) values (57, 'Chaiwan');
insert into Cities (id, name) values (58, 'Batugede Kulon');
insert into Cities (id, name) values (59, 'Hongtu');
insert into Cities (id, name) values (60, 'Bonthe');
insert into Cities (id, name) values (61, 'Guanambi');
insert into Cities (id, name) values (62, 'Buenavista');
insert into Cities (id, name) values (63, 'Lakki Marwat');
insert into Cities (id, name) values (64, 'Zagórze');
insert into Cities (id, name) values (65, 'Baltimore');
insert into Cities (id, name) values (66, 'Kizilyurt');
insert into Cities (id, name) values (67, 'Pipa');
insert into Cities (id, name) values (68, 'Tiling');
insert into Cities (id, name) values (69, 'Örebro');
insert into Cities (id, name) values (70, 'Chivor');
insert into Cities (id, name) values (71, 'Amangarh');
insert into Cities (id, name) values (72, 'Longonjo');
insert into Cities (id, name) values (73, 'Vasyl''evsky Ostrov');
insert into Cities (id, name) values (74, 'Stare Kurowo');
insert into Cities (id, name) values (75, 'Havířov');
insert into Cities (id, name) values (76, 'Varaždin');
insert into Cities (id, name) values (77, 'Basiao');
insert into Cities (id, name) values (78, 'Dankalwa');
insert into Cities (id, name) values (79, 'Banjar Desa');
insert into Cities (id, name) values (80, 'Xuri');
insert into Cities (id, name) values (81, 'Tlumačov');
insert into Cities (id, name) values (82, 'Bělá pod Bezdězem');
insert into Cities (id, name) values (83, 'Černožice');
insert into Cities (id, name) values (84, 'Ōme');
insert into Cities (id, name) values (85, 'Kobe');
insert into Cities (id, name) values (86, 'Houten');
insert into Cities (id, name) values (87, 'Sumurgeneng');
insert into Cities (id, name) values (88, 'Kamuli');
insert into Cities (id, name) values (89, 'Changshou');
insert into Cities (id, name) values (90, 'Lillers');
insert into Cities (id, name) values (91, 'Energeticheskiy');
insert into Cities (id, name) values (92, 'Irecê');
insert into Cities (id, name) values (93, 'Lalig');
insert into Cities (id, name) values (94, 'Valdemarsvik');
insert into Cities (id, name) values (95, 'Tupambaé');
insert into Cities (id, name) values (96, 'Memphis');
insert into Cities (id, name) values (97, 'Jaba‘');
insert into Cities (id, name) values (98, 'Byala Slatina');
insert into Cities (id, name) values (99, 'Moca');
insert into Cities (id, name) values (100, 'Belas');
insert into Cities (id, name) values (101, 'Laya');
insert into Cities (id, name) values (102, 'Jardin');
insert into Cities (id, name) values (103, 'Divisoria');
insert into Cities (id, name) values (104, 'Cikadongdong');
insert into Cities (id, name) values (105, 'Shi’an');
insert into Cities (id, name) values (106, 'Punta Cana');
insert into Cities (id, name) values (107, 'Babakankiray');
insert into Cities (id, name) values (108, 'Ipaba');
insert into Cities (id, name) values (109, 'Saint Augustine');
insert into Cities (id, name) values (110, 'Oak Bay');
insert into Cities (id, name) values (111, 'Itapira');
insert into Cities (id, name) values (112, 'Chão');
insert into Cities (id, name) values (113, 'Guyancourt');
insert into Cities (id, name) values (114, 'Kolirerek');
insert into Cities (id, name) values (115, 'Argithéa');
insert into Cities (id, name) values (116, 'Guanfang');
insert into Cities (id, name) values (117, 'Tagasilay');
insert into Cities (id, name) values (118, 'Petrolina de Goiás');
insert into Cities (id, name) values (119, 'Shajia’ao');
insert into Cities (id, name) values (120, 'Vostryakovo');
insert into Cities (id, name) values (121, 'Huangfang');
insert into Cities (id, name) values (122, 'Nīkêh');
insert into Cities (id, name) values (123, 'Aoji-ri');
insert into Cities (id, name) values (124, 'Barreirinhas');
insert into Cities (id, name) values (125, 'Pemzashen');
insert into Cities (id, name) values (126, 'Zábřeh');
insert into Cities (id, name) values (127, 'Houston');
insert into Cities (id, name) values (128, 'Modakeke');
insert into Cities (id, name) values (129, 'Huambo');
insert into Cities (id, name) values (130, 'Kakamas');
insert into Cities (id, name) values (131, 'Unión de Reyes');
insert into Cities (id, name) values (132, 'El Suyatal');
insert into Cities (id, name) values (133, 'Porsgrunn');
insert into Cities (id, name) values (134, 'Vilhelmina');
insert into Cities (id, name) values (135, 'Uthai Thani');
insert into Cities (id, name) values (136, 'Orlândia');
insert into Cities (id, name) values (137, 'Līgatne');
insert into Cities (id, name) values (138, 'Paraparaumu');
insert into Cities (id, name) values (139, 'Iballë');
insert into Cities (id, name) values (140, 'Madīnat Sittah Uktūbar');
insert into Cities (id, name) values (141, 'Rassvet');
insert into Cities (id, name) values (142, 'Aurelliana');
insert into Cities (id, name) values (143, 'Lugovoy');
insert into Cities (id, name) values (144, 'Dongmazar');
insert into Cities (id, name) values (145, 'Masoli');
insert into Cities (id, name) values (146, 'Ménaka');
insert into Cities (id, name) values (147, 'Novomyshastovskaya');
insert into Cities (id, name) values (148, 'Mersam');
insert into Cities (id, name) values (149, 'Fundación');
insert into Cities (id, name) values (150, 'Bandera');
insert into Cities (id, name) values (151, 'Chengbei');
insert into Cities (id, name) values (152, 'Al Qūşīyah');
insert into Cities (id, name) values (153, 'Kulotino');
insert into Cities (id, name) values (154, 'Moosomin');
insert into Cities (id, name) values (155, 'Peroguarda');
insert into Cities (id, name) values (156, 'Sparwood');
insert into Cities (id, name) values (157, 'Sabbah');
insert into Cities (id, name) values (158, 'Dongwan');
insert into Cities (id, name) values (159, 'Canindé');
insert into Cities (id, name) values (160, 'Taoling');
insert into Cities (id, name) values (161, 'Basseterre');
insert into Cities (id, name) values (162, 'P’asanauri');
insert into Cities (id, name) values (163, '‘Afrīn');
insert into Cities (id, name) values (164, 'Achiaman');
insert into Cities (id, name) values (165, 'Nazaré da Mata');
insert into Cities (id, name) values (166, 'Phra Pradaeng');
insert into Cities (id, name) values (167, 'Rathdrum');
insert into Cities (id, name) values (168, 'Bacolod');
insert into Cities (id, name) values (169, 'Parlilitan');
insert into Cities (id, name) values (170, 'Lanling');
insert into Cities (id, name) values (171, 'Rahama');
insert into Cities (id, name) values (172, 'Copa');
insert into Cities (id, name) values (173, 'Bayan Tuohai');
insert into Cities (id, name) values (174, 'Acul du Nord');
insert into Cities (id, name) values (175, 'Linköping');
insert into Cities (id, name) values (176, 'Dongjia');
insert into Cities (id, name) values (177, 'Jinping');
insert into Cities (id, name) values (178, 'Longxing');
insert into Cities (id, name) values (179, 'Taiping');
insert into Cities (id, name) values (180, 'Wenjī');
insert into Cities (id, name) values (181, 'Belogorsk');
insert into Cities (id, name) values (182, 'Ujung Gading');
insert into Cities (id, name) values (183, 'Nová Cerekev');
insert into Cities (id, name) values (184, 'Cikeusal');
insert into Cities (id, name) values (185, 'Hōjō');
insert into Cities (id, name) values (186, 'Hirakata');
insert into Cities (id, name) values (187, 'Lawonda');
insert into Cities (id, name) values (188, 'Lipovci');
insert into Cities (id, name) values (189, 'Horní Libina');
insert into Cities (id, name) values (190, 'Ocongate');
insert into Cities (id, name) values (191, 'Jequié');
insert into Cities (id, name) values (192, 'Zhaolingpu');
insert into Cities (id, name) values (193, 'Porosozero');
insert into Cities (id, name) values (194, 'Shezhu');
insert into Cities (id, name) values (195, 'Panaoti');
insert into Cities (id, name) values (196, 'Majengo');
insert into Cities (id, name) values (197, 'Banepa');
insert into Cities (id, name) values (198, 'Jiaoziya');
insert into Cities (id, name) values (199, 'Bonsari');
insert into Cities (id, name) values (200, 'Santa Ana');
insert into Cities (id, name) values (201, 'Longxian');
insert into Cities (id, name) values (202, 'Saraktash');
insert into Cities (id, name) values (203, 'Siborong-borong');
insert into Cities (id, name) values (204, 'Jinka');
insert into Cities (id, name) values (205, 'Kandi');
insert into Cities (id, name) values (206, 'Ketangi');
insert into Cities (id, name) values (207, 'Artsvanist');
insert into Cities (id, name) values (208, 'Bacolod');
insert into Cities (id, name) values (209, 'Migrate');
insert into Cities (id, name) values (210, 'Leles');
insert into Cities (id, name) values (211, 'Mpika');
insert into Cities (id, name) values (212, 'Los Andes');
insert into Cities (id, name) values (213, 'Kajansi');
insert into Cities (id, name) values (214, 'Dalianhe');
insert into Cities (id, name) values (215, 'Kampong Speu');
insert into Cities (id, name) values (216, 'Xiejiatan');
insert into Cities (id, name) values (217, 'Gaurnadi');
insert into Cities (id, name) values (218, 'Vitry-le-François');
insert into Cities (id, name) values (219, 'Sierakowice');
insert into Cities (id, name) values (220, 'Kassándreia');
insert into Cities (id, name) values (221, 'Lévis');
insert into Cities (id, name) values (222, 'Khyzy');
insert into Cities (id, name) values (223, 'Vabalninkas');
insert into Cities (id, name) values (224, 'Garhi Yāsīn');
insert into Cities (id, name) values (225, 'Ogōri-shimogō');
insert into Cities (id, name) values (226, 'Marigot');
insert into Cities (id, name) values (227, 'Ljungby');
insert into Cities (id, name) values (228, 'Xiangdian');
insert into Cities (id, name) values (229, 'Oujda');
insert into Cities (id, name) values (230, 'Ladhewāla Warāich');
insert into Cities (id, name) values (231, 'Aracaju');
insert into Cities (id, name) values (232, 'Sheshory');
insert into Cities (id, name) values (233, 'Machida');
insert into Cities (id, name) values (234, 'Liangdang Chengguanzhen');
insert into Cities (id, name) values (235, 'Nanyanchuan');
insert into Cities (id, name) values (236, 'Nikulino');
insert into Cities (id, name) values (237, 'Kinmparana');
insert into Cities (id, name) values (238, 'Thívai');
insert into Cities (id, name) values (239, 'Krông Kmar');
insert into Cities (id, name) values (240, 'Shinao');
insert into Cities (id, name) values (241, 'Luena');
insert into Cities (id, name) values (242, 'Invermere');
insert into Cities (id, name) values (243, 'Fengcheng');
insert into Cities (id, name) values (244, 'Ndibène Dahra');
insert into Cities (id, name) values (245, 'Sarāb');
insert into Cities (id, name) values (246, 'Xinyang');
insert into Cities (id, name) values (247, 'Arenal');
insert into Cities (id, name) values (248, 'Dawan');
insert into Cities (id, name) values (249, 'Al ‘Āqir');
insert into Cities (id, name) values (250, 'Savigny-le-Temple');
insert into Cities (id, name) values (251, 'Donggaocun');
insert into Cities (id, name) values (252, 'Resistencia');
insert into Cities (id, name) values (253, 'Altares');
insert into Cities (id, name) values (254, 'San Carlos');
insert into Cities (id, name) values (255, 'Osiek');
insert into Cities (id, name) values (256, 'Nagarakembang');
insert into Cities (id, name) values (257, 'Jhumra');
insert into Cities (id, name) values (258, 'Kass Wollof');
insert into Cities (id, name) values (259, 'Ningchegu');
insert into Cities (id, name) values (260, 'Gunjur');
insert into Cities (id, name) values (261, 'Planaltina');
insert into Cities (id, name) values (262, 'Bell Ville');
insert into Cities (id, name) values (263, 'Mamu');
insert into Cities (id, name) values (264, 'Beidong');
insert into Cities (id, name) values (265, 'Dongjian');
insert into Cities (id, name) values (266, 'Gotovlje');
insert into Cities (id, name) values (267, 'Isfana');
insert into Cities (id, name) values (268, '20 de Noviembre');
insert into Cities (id, name) values (269, 'Balas');
insert into Cities (id, name) values (270, 'Bonao');
insert into Cities (id, name) values (271, 'Kertasari');
insert into Cities (id, name) values (272, 'Mitake');
insert into Cities (id, name) values (273, 'Yilan');
insert into Cities (id, name) values (274, 'Brive-la-Gaillarde');
insert into Cities (id, name) values (275, 'Guang’an');
insert into Cities (id, name) values (276, 'Soubré');
insert into Cities (id, name) values (277, 'Yisuhe');
insert into Cities (id, name) values (278, 'Libouchec');
insert into Cities (id, name) values (279, 'Birowo');
insert into Cities (id, name) values (280, 'Zhangxiang');
insert into Cities (id, name) values (281, 'Şalākhid');
insert into Cities (id, name) values (282, 'Amizmiz');
insert into Cities (id, name) values (283, 'Haapsalu');
insert into Cities (id, name) values (284, 'Ipil');
insert into Cities (id, name) values (285, 'Bumpe');
insert into Cities (id, name) values (286, 'Ampasimanolotra');
insert into Cities (id, name) values (287, 'Ayagoz');
insert into Cities (id, name) values (288, 'Wushi');
insert into Cities (id, name) values (289, 'Huaihua');
insert into Cities (id, name) values (290, 'Gonzalo Pizarro');
insert into Cities (id, name) values (291, 'Shizukuishi');
insert into Cities (id, name) values (292, 'Yetang');
insert into Cities (id, name) values (293, 'Ea T’ling');
insert into Cities (id, name) values (294, 'Ganjaran');
insert into Cities (id, name) values (295, 'Moutnice');
insert into Cities (id, name) values (296, 'Zbąszynek');
insert into Cities (id, name) values (297, 'Desē');
insert into Cities (id, name) values (298, 'Meneou');
insert into Cities (id, name) values (299, 'Enköping');
insert into Cities (id, name) values (300, 'Managua');
insert into Cities (id, name) values (301, 'Gapyeong');
insert into Cities (id, name) values (302, 'Ust-Kamenogorsk');
insert into Cities (id, name) values (303, 'Maiac');
insert into Cities (id, name) values (304, 'Sandgerði');
insert into Cities (id, name) values (305, 'Qianshan');
insert into Cities (id, name) values (306, 'Sawangan');
insert into Cities (id, name) values (307, 'Sunchales');
insert into Cities (id, name) values (308, 'La‘l');
insert into Cities (id, name) values (309, 'Gunungsari');
insert into Cities (id, name) values (310, 'Deskáti');
insert into Cities (id, name) values (311, 'Göteborg');
insert into Cities (id, name) values (312, 'Gemena');
insert into Cities (id, name) values (313, 'Dolulolong');
insert into Cities (id, name) values (314, 'Paita');
insert into Cities (id, name) values (315, 'Murillo');
insert into Cities (id, name) values (316, 'Rijeka');
insert into Cities (id, name) values (317, 'Zhoukou');
insert into Cities (id, name) values (318, 'Puerto Rico');
insert into Cities (id, name) values (319, 'San Juan');
insert into Cities (id, name) values (320, 'Kugri');
insert into Cities (id, name) values (321, 'Kokembang');
insert into Cities (id, name) values (322, 'Cangkringan');
insert into Cities (id, name) values (323, 'Kemiri Daya');
insert into Cities (id, name) values (324, 'Fajã de Cima');
insert into Cities (id, name) values (325, 'Ntoke');
insert into Cities (id, name) values (326, 'Puget-sur-Argens');
insert into Cities (id, name) values (327, 'Coolock');
insert into Cities (id, name) values (328, 'Buenos Aires');
insert into Cities (id, name) values (329, 'Kentongan');
insert into Cities (id, name) values (330, 'Chelbasskaya');
insert into Cities (id, name) values (331, 'Huai Mek');
insert into Cities (id, name) values (332, 'Shenavan');
insert into Cities (id, name) values (333, 'Sigou');
insert into Cities (id, name) values (334, 'Malakand');
insert into Cities (id, name) values (335, 'Dongyong');
insert into Cities (id, name) values (336, 'Ust’-Kachka');
insert into Cities (id, name) values (337, 'Erniusuokou');
insert into Cities (id, name) values (338, 'San Rafael');
insert into Cities (id, name) values (339, 'Punta de Bombón');
insert into Cities (id, name) values (340, 'Sandovo');
insert into Cities (id, name) values (341, 'Miskolc');
insert into Cities (id, name) values (342, 'Busalangga');
insert into Cities (id, name) values (343, 'Tanahmerah');
insert into Cities (id, name) values (344, 'Penelas');
insert into Cities (id, name) values (345, 'Chitral');
insert into Cities (id, name) values (346, 'Guyi');
insert into Cities (id, name) values (347, 'Brzyska');
insert into Cities (id, name) values (348, 'Qiakeri');
insert into Cities (id, name) values (349, 'Zhentou');
insert into Cities (id, name) values (350, 'Zambujeira do Mar');
insert into Cities (id, name) values (351, 'Rajhradice');
insert into Cities (id, name) values (352, 'Maunatlala');
insert into Cities (id, name) values (353, 'Haibara');
insert into Cities (id, name) values (354, 'Hutang');
insert into Cities (id, name) values (355, 'Alcabideche');
insert into Cities (id, name) values (356, 'Tingo María');
insert into Cities (id, name) values (357, 'Xiaohebian');
insert into Cities (id, name) values (358, 'Caozhen');
insert into Cities (id, name) values (359, 'Akriní');
insert into Cities (id, name) values (360, 'Livádion');
insert into Cities (id, name) values (361, 'Xinhang');
insert into Cities (id, name) values (362, 'Kalahang');
insert into Cities (id, name) values (363, 'Katsuyama');
insert into Cities (id, name) values (364, 'Sabanalarga');
insert into Cities (id, name) values (365, 'Jawhar');
insert into Cities (id, name) values (366, 'Lordegān');
insert into Cities (id, name) values (367, 'Sanlei');
insert into Cities (id, name) values (368, 'Yashan');
insert into Cities (id, name) values (369, 'Gweedore');
insert into Cities (id, name) values (370, 'Woerden');
insert into Cities (id, name) values (371, 'Bình Minh');
insert into Cities (id, name) values (372, 'Kemisē');
insert into Cities (id, name) values (373, 'Bin’an');
insert into Cities (id, name) values (374, 'Kampungtengah');
insert into Cities (id, name) values (375, 'Kosmach');
insert into Cities (id, name) values (376, 'Al Jīzah');
insert into Cities (id, name) values (377, 'Yingchuan');
insert into Cities (id, name) values (378, 'Niort');
insert into Cities (id, name) values (379, 'Kristianstad');
insert into Cities (id, name) values (380, 'Xinquansi');
insert into Cities (id, name) values (381, 'Alunda');
insert into Cities (id, name) values (382, 'Além Paraíba');
insert into Cities (id, name) values (383, 'Iqaluit');
insert into Cities (id, name) values (384, 'San Sebastian');
insert into Cities (id, name) values (385, 'Reni');
insert into Cities (id, name) values (386, 'Ma‘dān');
insert into Cities (id, name) values (387, 'Leuburi');
insert into Cities (id, name) values (388, 'Cijayana');
insert into Cities (id, name) values (389, 'Cimongkor');
insert into Cities (id, name) values (390, 'Xinxu');
insert into Cities (id, name) values (391, 'Zhaixi');
insert into Cities (id, name) values (392, 'Labrador City');
insert into Cities (id, name) values (393, 'Jiangshan');
insert into Cities (id, name) values (394, 'Örebro');
insert into Cities (id, name) values (395, 'Xingshou');
insert into Cities (id, name) values (396, 'San Juan');
insert into Cities (id, name) values (397, 'Jindřichův Hradec');
insert into Cities (id, name) values (398, 'Huimin');
insert into Cities (id, name) values (399, 'Bārah');
insert into Cities (id, name) values (400, 'Usab');
insert into Cities (id, name) values (401, 'San Jose');
insert into Cities (id, name) values (402, 'Sukarame');
insert into Cities (id, name) values (403, 'Itaporanga');
insert into Cities (id, name) values (404, 'Coolock');
insert into Cities (id, name) values (405, 'Montalvo');
insert into Cities (id, name) values (406, 'Gällivare');
insert into Cities (id, name) values (407, 'Hetou');
insert into Cities (id, name) values (408, 'Fatufaun');
insert into Cities (id, name) values (409, 'Peishe');
insert into Cities (id, name) values (410, 'Rio de Mouro');
insert into Cities (id, name) values (411, 'Cane');
insert into Cities (id, name) values (412, 'Staryy Saltiv');
insert into Cities (id, name) values (413, 'Uherce Mineralne');
insert into Cities (id, name) values (414, 'Banjar Geriana Kangin');
insert into Cities (id, name) values (415, 'Khanabad');
insert into Cities (id, name) values (416, 'Biała');
insert into Cities (id, name) values (417, 'Munggang');
insert into Cities (id, name) values (418, 'Mỹ Xuyên');
insert into Cities (id, name) values (419, 'Polešovice');
insert into Cities (id, name) values (420, 'Lovisa');
insert into Cities (id, name) values (421, 'Dundbürd');
insert into Cities (id, name) values (422, 'Chelbasskaya');
insert into Cities (id, name) values (423, 'Huangascar');
insert into Cities (id, name) values (424, 'Hongguang');
insert into Cities (id, name) values (425, 'Outeirô');
insert into Cities (id, name) values (426, 'Aguas Corrientes');
insert into Cities (id, name) values (427, 'Sanchahe');
insert into Cities (id, name) values (428, 'Okpo');
insert into Cities (id, name) values (429, 'Rosa Zarate');
insert into Cities (id, name) values (430, 'Loučovice');
insert into Cities (id, name) values (431, 'Teófilo Otoni');
insert into Cities (id, name) values (432, 'Ubatã');
insert into Cities (id, name) values (433, 'Trnava');
insert into Cities (id, name) values (434, 'Wang Yang');
insert into Cities (id, name) values (435, 'Santo Antônio da Platina');
insert into Cities (id, name) values (436, 'Ishëm');
insert into Cities (id, name) values (437, 'Shizi');
insert into Cities (id, name) values (438, 'Fengcheng');
insert into Cities (id, name) values (439, 'Lipahan');
insert into Cities (id, name) values (440, 'Grabów nad Prosną');
insert into Cities (id, name) values (441, 'Fox Creek');
insert into Cities (id, name) values (442, 'Aygavan');
insert into Cities (id, name) values (443, 'Ḑawrān ad Daydah');
insert into Cities (id, name) values (444, 'Quebrada Canoa');
insert into Cities (id, name) values (445, 'Mādārīpur');
insert into Cities (id, name) values (446, 'Cennan');
insert into Cities (id, name) values (447, 'Göteborg');
insert into Cities (id, name) values (448, 'Xinhua');
insert into Cities (id, name) values (449, 'Bieto');
insert into Cities (id, name) values (450, 'Shuitianzhuang');
insert into Cities (id, name) values (451, 'Terbangan');
insert into Cities (id, name) values (452, 'Ankazoabo');
insert into Cities (id, name) values (453, 'Tambulig');
insert into Cities (id, name) values (454, 'Carrasqueira');
insert into Cities (id, name) values (455, 'Tacna');
insert into Cities (id, name) values (456, 'Thị Trấn Bắc Yên');
insert into Cities (id, name) values (457, 'Luoshanchuan');
insert into Cities (id, name) values (458, 'Sémé');
insert into Cities (id, name) values (459, 'Houston');
insert into Cities (id, name) values (460, 'Creil');
insert into Cities (id, name) values (461, 'Qingtaiping');
insert into Cities (id, name) values (462, 'Dankama');
insert into Cities (id, name) values (463, 'Quixadá');
insert into Cities (id, name) values (464, 'Fenghuo');
insert into Cities (id, name) values (465, 'Sioux Falls');
insert into Cities (id, name) values (466, 'Ozerki');
insert into Cities (id, name) values (467, 'Kikinda');
insert into Cities (id, name) values (468, 'Sukarame');
insert into Cities (id, name) values (469, 'Chojna');
insert into Cities (id, name) values (470, 'Krasnyy Profintern');
insert into Cities (id, name) values (471, 'Tengjia');
insert into Cities (id, name) values (472, 'Dayou');
insert into Cities (id, name) values (473, 'Suḩayl Shibām');
insert into Cities (id, name) values (474, 'Radā‘');
insert into Cities (id, name) values (475, 'Huelkail');
insert into Cities (id, name) values (476, 'Mingcheng');
insert into Cities (id, name) values (477, 'São Pedro de Trafaria');
insert into Cities (id, name) values (478, 'Fuchang');
insert into Cities (id, name) values (479, 'Changtang');
insert into Cities (id, name) values (480, 'Xike');
insert into Cities (id, name) values (481, 'Ríohacha');
insert into Cities (id, name) values (482, 'Szczerców');
insert into Cities (id, name) values (483, 'Phon Phisai');
insert into Cities (id, name) values (484, 'Tibro');
insert into Cities (id, name) values (485, 'Ruma');
insert into Cities (id, name) values (486, 'Tycheró');
insert into Cities (id, name) values (487, 'Dalong');
insert into Cities (id, name) values (488, 'Srinjine');
insert into Cities (id, name) values (489, 'Ugep');
insert into Cities (id, name) values (490, 'Nóvita');
insert into Cities (id, name) values (491, 'København');
insert into Cities (id, name) values (492, 'Leninogorsk');
insert into Cities (id, name) values (493, 'Okhtyrka');
insert into Cities (id, name) values (494, 'Picoto');
insert into Cities (id, name) values (495, 'Yanahuaya');
insert into Cities (id, name) values (496, 'Myadzyel');
insert into Cities (id, name) values (497, 'Pokachi');
insert into Cities (id, name) values (498, 'Łanięta');
insert into Cities (id, name) values (499, 'Maumbawa');
insert into Cities (id, name) values (500, 'Butel');


insert into persons (id, name, surname, adress, dateofbirth) values (1, 'Willi', 'Hanniger', '1870 Bowman Terrace', '2010-11-08');
insert into persons (id, name, surname, adress, dateofbirth) values (2, 'Fannie', 'Doggett', '5748 Garrison Alley', '1996-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (3, 'Lianna', 'Farthin', '2 Summerview Terrace', '1994-01-11');
insert into persons (id, name, surname, adress, dateofbirth) values (4, 'August', 'Dunham', '16 Talmadge Crossing', '1982-05-02');
insert into persons (id, name, surname, adress, dateofbirth) values (5, 'Belvia', 'Bautiste', '443 American Center', '2014-03-31');
insert into persons (id, name, surname, adress, dateofbirth) values (6, 'Dusty', 'Greeve', '42514 Stang Park', '1989-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (7, 'Karolina', 'MacDearmont', '00837 Blue Bill Park Junction', '2015-04-17');
insert into persons (id, name, surname, adress, dateofbirth) values (8, 'Mame', 'Kohrs', '23840 Hoard Court', '2003-08-05');
insert into persons (id, name, surname, adress, dateofbirth) values (9, 'Lexi', 'Larkworthy', '8 Towne Pass', '2014-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (10, 'Jobina', 'Jervois', '24050 Bobwhite Avenue', '2014-01-22');
insert into persons (id, name, surname, adress, dateofbirth) values (11, 'Agosto', 'Philip', '66203 Ronald Regan Point', '2007-04-14');
insert into persons (id, name, surname, adress, dateofbirth) values (12, 'Tiffani', 'Coase', '9 Di Loreto Way', '1998-07-29');
insert into persons (id, name, surname, adress, dateofbirth) values (13, 'Jamil', 'Ledward', '198 Linden Plaza', '2002-05-24');
insert into persons (id, name, surname, adress, dateofbirth) values (14, 'Meade', 'Geerits', '05 Moose Lane', '2004-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (15, 'Bendicty', 'Jovis', '620 Vernon Place', '1978-11-25');
insert into persons (id, name, surname, adress, dateofbirth) values (16, 'Creight', 'Ralls', '9 Reinke Center', '1980-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (17, 'Chrystal', 'Gartside', '3 Gulseth Drive', '1981-11-18');
insert into persons (id, name, surname, adress, dateofbirth) values (18, 'Chicky', 'Mucklo', '2 Karstens Road', '1981-08-02');
insert into persons (id, name, surname, adress, dateofbirth) values (19, 'Hazel', 'Imrie', '5 Riverside Circle', '1997-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (20, 'Vick', 'Sleigh', '83 Mayer Crossing', '1988-10-22');
insert into persons (id, name, surname, adress, dateofbirth) values (21, 'Dawn', 'Dodwell', '2247 Luster Road', '1978-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (22, 'Amelina', 'Pateman', '53 Forster Alley', '1997-01-06');
insert into persons (id, name, surname, adress, dateofbirth) values (23, 'Manya', 'McGillacoell', '127 East Plaza', '1996-11-26');
insert into persons (id, name, surname, adress, dateofbirth) values (24, 'Almire', 'Karys', '515 Sycamore Avenue', '2012-05-18');
insert into persons (id, name, surname, adress, dateofbirth) values (25, 'Kania', 'Screas', '19 Declaration Road', '1992-02-26');
insert into persons (id, name, surname, adress, dateofbirth) values (26, 'Octavius', 'Aspin', '960 Cottonwood Junction', '2015-01-22');
insert into persons (id, name, surname, adress, dateofbirth) values (27, 'Alyssa', 'Keppy', '775 Hagan Terrace', '2005-07-07');
insert into persons (id, name, surname, adress, dateofbirth) values (28, 'Leandra', 'Pegden', '75688 Almo Road', '1985-11-11');
insert into persons (id, name, surname, adress, dateofbirth) values (29, 'Roxanna', 'July', '32 Butterfield Trail', '2004-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (30, 'Vernen', 'Cisson', '82 Canary Drive', '1983-10-02');
insert into persons (id, name, surname, adress, dateofbirth) values (31, 'Annora', 'Davis', '05 Westerfield Circle', '1981-12-17');
insert into persons (id, name, surname, adress, dateofbirth) values (32, 'Jeniffer', 'McGrotty', '60 Butternut Court', '2010-09-05');
insert into persons (id, name, surname, adress, dateofbirth) values (33, 'Rosabelle', 'Michieli', '0570 Hansons Point', '1985-03-05');
insert into persons (id, name, surname, adress, dateofbirth) values (34, 'Pavia', 'MacGhee', '665 Prairieview Circle', '1989-10-14');
insert into persons (id, name, surname, adress, dateofbirth) values (35, 'Colman', 'Semor', '6577 Hallows Point', '2012-07-05');
insert into persons (id, name, surname, adress, dateofbirth) values (36, 'Tiffani', 'Oakeshott', '921 Mandrake Place', '1999-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (37, 'Cam', 'Flemyng', '18739 Quincy Point', '1993-08-22');
insert into persons (id, name, surname, adress, dateofbirth) values (38, 'Aristotle', 'Pavolillo', '0245 Mandrake Pass', '2012-12-20');
insert into persons (id, name, surname, adress, dateofbirth) values (39, 'Wilmer', 'Twentyman', '6 Swallow Lane', '1986-10-11');
insert into persons (id, name, surname, adress, dateofbirth) values (40, 'Garrek', 'MacKibbon', '1 Reindahl Hill', '1976-08-08');
insert into persons (id, name, surname, adress, dateofbirth) values (41, 'Aviva', 'Costock', '28 Rusk Trail', '1972-03-07');
insert into persons (id, name, surname, adress, dateofbirth) values (42, 'Haslett', 'Ivie', '41472 Pierstorff Road', '1983-02-17');
insert into persons (id, name, surname, adress, dateofbirth) values (43, 'Kennedy', 'Stoodale', '946 Loftsgordon Avenue', '1973-07-19');
insert into persons (id, name, surname, adress, dateofbirth) values (44, 'Katha', 'Gavey', '3096 Eliot Pass', '1983-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (45, 'Theadora', 'Garrison', '4768 Bartelt Parkway', '2015-10-13');
insert into persons (id, name, surname, adress, dateofbirth) values (46, 'Rabi', 'Sammonds', '665 Homewood Trail', '1972-10-12');
insert into persons (id, name, surname, adress, dateofbirth) values (47, 'Adan', 'Maypes', '73 Harbort Street', '1987-01-12');
insert into persons (id, name, surname, adress, dateofbirth) values (48, 'Vivie', 'Brockhurst', '34625 Shelley Center', '1986-12-31');
insert into persons (id, name, surname, adress, dateofbirth) values (49, 'Warden', 'Adcock', '7798 Schlimgen Point', '1977-10-26');
insert into persons (id, name, surname, adress, dateofbirth) values (50, 'Pancho', 'de Almeida', '374 Surrey Pass', '1998-03-16');
insert into persons (id, name, surname, adress, dateofbirth) values (51, 'Ronald', 'De Ath', '824 Mifflin Way', '1976-11-11');
insert into persons (id, name, surname, adress, dateofbirth) values (52, 'Peter', 'de Bullion', '513 Service Court', '1984-10-15');
insert into persons (id, name, surname, adress, dateofbirth) values (53, 'Carny', 'Binns', '9 Bartelt Drive', '1989-10-31');
insert into persons (id, name, surname, adress, dateofbirth) values (54, 'Dukey', 'Spain-Gower', '14 Mendota Pass', '1976-02-15');
insert into persons (id, name, surname, adress, dateofbirth) values (55, 'Syman', 'Petegree', '190 Sauthoff Lane', '2010-05-13');
insert into persons (id, name, surname, adress, dateofbirth) values (56, 'Eugenio', 'Abrahamowitcz', '111 Kinsman Junction', '1996-07-10');
insert into persons (id, name, surname, adress, dateofbirth) values (57, 'Babette', 'Goligher', '92 Clarendon Avenue', '1993-03-19');
insert into persons (id, name, surname, adress, dateofbirth) values (58, 'Jefferey', 'Baselio', '2 Scott Street', '1974-05-22');
insert into persons (id, name, surname, adress, dateofbirth) values (59, 'Reuven', 'Penwright', '3919 Prentice Point', '1988-10-04');
insert into persons (id, name, surname, adress, dateofbirth) values (60, 'Far', 'Paulisch', '743 Talmadge Drive', '1988-04-24');
insert into persons (id, name, surname, adress, dateofbirth) values (61, 'Penrod', 'Caplis', '652 West Circle', '1982-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (62, 'Zea', 'Dossantos', '181 Knutson Park', '2012-02-23');
insert into persons (id, name, surname, adress, dateofbirth) values (63, 'Bail', 'Couche', '31763 Elka Place', '2012-11-26');
insert into persons (id, name, surname, adress, dateofbirth) values (64, 'Baron', 'Hildrew', '8750 Bayside Crossing', '1994-10-14');
insert into persons (id, name, surname, adress, dateofbirth) values (65, 'Dietrich', 'Fernao', '834 Lillian Trail', '2001-10-13');
insert into persons (id, name, surname, adress, dateofbirth) values (66, 'Bennett', 'Parsonson', '3 Vermont Plaza', '1995-11-28');
insert into persons (id, name, surname, adress, dateofbirth) values (67, 'Zach', 'Maplethorpe', '08111 Hazelcrest Park', '1984-04-28');
insert into persons (id, name, surname, adress, dateofbirth) values (68, 'Brooks', 'Casone', '65782 Maryland Street', '2007-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (69, 'Dur', 'Trenaman', '80 Amoth Center', '1997-04-01');
insert into persons (id, name, surname, adress, dateofbirth) values (70, 'Lonni', 'McLeese', '713 Hayes Center', '1994-03-08');
insert into persons (id, name, surname, adress, dateofbirth) values (71, 'Orin', 'Rolph', '5 Buena Vista Lane', '1990-03-23');
insert into persons (id, name, surname, adress, dateofbirth) values (72, 'Stirling', 'Braidley', '72718 Cardinal Plaza', '1980-11-11');
insert into persons (id, name, surname, adress, dateofbirth) values (73, 'Sherwood', 'Spat', '3509 Sommers Parkway', '1990-09-01');
insert into persons (id, name, surname, adress, dateofbirth) values (74, 'Noelyn', 'Petlyura', '6 Starling Parkway', '2009-08-18');
insert into persons (id, name, surname, adress, dateofbirth) values (75, 'Lay', 'Yabsley', '5175 Novick Lane', '2014-12-25');
insert into persons (id, name, surname, adress, dateofbirth) values (76, 'Ikey', 'Wykes', '4 Vera Hill', '1991-04-15');
insert into persons (id, name, surname, adress, dateofbirth) values (77, 'Haskell', 'Fraczek', '39 Elmside Drive', '1990-03-05');
insert into persons (id, name, surname, adress, dateofbirth) values (78, 'Adrianna', 'Killford', '17 Magdeline Way', '2002-12-14');
insert into persons (id, name, surname, adress, dateofbirth) values (79, 'Vinson', 'Soutter', '3465 Golf Course Pass', '1997-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (80, 'Erie', 'Makinson', '7 North Parkway', '2015-02-17');
insert into persons (id, name, surname, adress, dateofbirth) values (81, 'Adolph', 'Stroton', '579 Acker Way', '1984-12-22');
insert into persons (id, name, surname, adress, dateofbirth) values (82, 'Brear', 'Grammer', '83 Lien Plaza', '1990-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (83, 'Kalinda', 'Iredale', '43314 4th Terrace', '1984-10-06');
insert into persons (id, name, surname, adress, dateofbirth) values (84, 'Alex', 'Penfold', '52726 West Point', '1974-07-24');
insert into persons (id, name, surname, adress, dateofbirth) values (85, 'Miguela', 'Britner', '369 Bluejay Lane', '1990-06-30');
insert into persons (id, name, surname, adress, dateofbirth) values (86, 'Ulrica', 'Ary', '4424 Arrowood Parkway', '2001-04-12');
insert into persons (id, name, surname, adress, dateofbirth) values (87, 'Zara', 'Elstow', '6238 Trailsway Plaza', '2010-06-09');
insert into persons (id, name, surname, adress, dateofbirth) values (88, 'Beverly', 'Wapol', '4 Graedel Point', '1992-12-04');
insert into persons (id, name, surname, adress, dateofbirth) values (89, 'Kelci', 'Aldin', '212 Barby Point', '2015-11-25');
insert into persons (id, name, surname, adress, dateofbirth) values (90, 'Carolyne', 'Dyton', '731 Jana Terrace', '2013-12-01');
insert into persons (id, name, surname, adress, dateofbirth) values (91, 'Orsa', 'Fettiplace', '4 Farwell Road', '1983-06-30');
insert into persons (id, name, surname, adress, dateofbirth) values (92, 'Chaunce', 'Darbyshire', '169 Birchwood Park', '1985-02-27');
insert into persons (id, name, surname, adress, dateofbirth) values (93, 'Joshia', 'Coolbear', '5284 Cody Lane', '1988-12-27');
insert into persons (id, name, surname, adress, dateofbirth) values (94, 'Lorene', 'Bowra', '657 Vernon Parkway', '1997-04-23');
insert into persons (id, name, surname, adress, dateofbirth) values (95, 'Muffin', 'Thame', '0488 Alpine Center', '1978-09-22');
insert into persons (id, name, surname, adress, dateofbirth) values (96, 'Demetris', 'Vagg', '34251 Merchant Junction', '2007-05-26');
insert into persons (id, name, surname, adress, dateofbirth) values (97, 'Noam', 'd'' Elboux', '41 Merry Drive', '2006-01-20');
insert into persons (id, name, surname, adress, dateofbirth) values (98, 'Anderson', 'Fidgett', '54449 Summit Junction', '1990-03-12');
insert into persons (id, name, surname, adress, dateofbirth) values (99, 'Donna', 'Ayshford', '8074 Little Fleur Street', '2015-04-14');
insert into persons (id, name, surname, adress, dateofbirth) values (100, 'Ardelis', 'Rikkard', '59 Troy Road', '2000-02-07');
insert into persons (id, name, surname, adress, dateofbirth) values (101, 'Sander', 'Frankcombe', '9 Sachs Place', '1999-12-14');
insert into persons (id, name, surname, adress, dateofbirth) values (102, 'Kimberly', 'Foxon', '52 Veith Road', '1985-05-22');
insert into persons (id, name, surname, adress, dateofbirth) values (103, 'Bonita', 'Tyres', '784 Springview Crossing', '2006-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (104, 'Silvanus', 'Rudgerd', '45 Monterey Lane', '1994-05-06');
insert into persons (id, name, surname, adress, dateofbirth) values (105, 'Malia', 'Guilford', '59 Shoshone Trail', '1972-05-06');
insert into persons (id, name, surname, adress, dateofbirth) values (106, 'Domenico', 'Longhorne', '055 Meadow Valley Road', '2001-08-15');
insert into persons (id, name, surname, adress, dateofbirth) values (107, 'Cob', 'Payle', '21545 Lukken Point', '1982-02-11');
insert into persons (id, name, surname, adress, dateofbirth) values (108, 'Julianna', 'Barnsdale', '473 Schiller Street', '1975-06-01');
insert into persons (id, name, surname, adress, dateofbirth) values (109, 'Teddy', 'Pasterfield', '9504 Red Cloud Road', '2007-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (110, 'Lorena', 'Bryer', '92504 Lakewood Point', '1995-01-02');
insert into persons (id, name, surname, adress, dateofbirth) values (111, 'Itch', 'Swapp', '1 Schlimgen Circle', '2015-04-18');
insert into persons (id, name, surname, adress, dateofbirth) values (112, 'Ernestus', 'Leveridge', '2 Ruskin Drive', '2002-12-30');
insert into persons (id, name, surname, adress, dateofbirth) values (113, 'Rollo', 'Stickens', '7 Shoshone Street', '2003-04-06');
insert into persons (id, name, surname, adress, dateofbirth) values (114, 'Shalom', 'Tapenden', '70038 Sundown Circle', '1975-09-06');
insert into persons (id, name, surname, adress, dateofbirth) values (115, 'Berton', 'Ravilious', '5 Surrey Point', '1996-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (116, 'Merla', 'Kirke', '3646 Mallard Center', '2000-11-13');
insert into persons (id, name, surname, adress, dateofbirth) values (117, 'Eugene', 'Boog', '67279 Grasskamp Trail', '1986-03-07');
insert into persons (id, name, surname, adress, dateofbirth) values (118, 'Celie', 'Blodgett', '59353 Cody Place', '2008-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (119, 'Hebert', 'Pales', '744 Almo Junction', '1989-05-28');
insert into persons (id, name, surname, adress, dateofbirth) values (120, 'Galina', 'Vickers', '900 Kings Hill', '1971-03-25');
insert into persons (id, name, surname, adress, dateofbirth) values (121, 'Keir', 'Ghioni', '463 Forest Dale Alley', '1974-11-17');
insert into persons (id, name, surname, adress, dateofbirth) values (122, 'Doralyn', 'Nichol', '1944 Holy Cross Crossing', '1987-12-26');
insert into persons (id, name, surname, adress, dateofbirth) values (123, 'Carola', 'Gudeman', '275 Melrose Trail', '2005-01-09');
insert into persons (id, name, surname, adress, dateofbirth) values (124, 'Lula', 'Suggett', '6 Ridgeview Lane', '1987-12-24');
insert into persons (id, name, surname, adress, dateofbirth) values (125, 'Rene', 'Plumm', '62920 Sauthoff Way', '1999-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (126, 'Jamesy', 'Harker', '5807 Northland Pass', '1982-12-22');
insert into persons (id, name, surname, adress, dateofbirth) values (127, 'Bartram', 'Jope', '71 Knutson Center', '2007-09-24');
insert into persons (id, name, surname, adress, dateofbirth) values (128, 'Selinda', 'Maffini', '158 Hallows Avenue', '1981-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (129, 'Dolph', 'Ruddom', '7 Bartillon Street', '1998-07-25');
insert into persons (id, name, surname, adress, dateofbirth) values (130, 'Correy', 'Ralestone', '57 Northport Center', '1989-12-01');
insert into persons (id, name, surname, adress, dateofbirth) values (131, 'Corrie', 'Strathe', '28866 Grover Park', '1992-02-05');
insert into persons (id, name, surname, adress, dateofbirth) values (132, 'Hamlen', 'Davidovitch', '03612 Forest Dale Junction', '1999-11-21');
insert into persons (id, name, surname, adress, dateofbirth) values (133, 'Lula', 'Dron', '64660 Vera Hill', '1994-10-10');
insert into persons (id, name, surname, adress, dateofbirth) values (134, 'Erl', 'Oluwatoyin', '02 Dayton Plaza', '2008-07-19');
insert into persons (id, name, surname, adress, dateofbirth) values (135, 'Mallissa', 'Bradman', '329 Westerfield Trail', '1999-03-24');
insert into persons (id, name, surname, adress, dateofbirth) values (136, 'Calvin', 'MacCambridge', '4220 Springs Parkway', '2006-11-17');
insert into persons (id, name, surname, adress, dateofbirth) values (137, 'Joli', 'Le Huquet', '92 Moulton Plaza', '1997-01-25');
insert into persons (id, name, surname, adress, dateofbirth) values (138, 'Laureen', 'Petre', '04 Warrior Parkway', '2010-07-08');
insert into persons (id, name, surname, adress, dateofbirth) values (139, 'Lesya', 'Peyto', '9 Scott Park', '2003-03-03');
insert into persons (id, name, surname, adress, dateofbirth) values (140, 'Arliene', 'Horbath', '8689 Duke Pass', '2010-01-12');
insert into persons (id, name, surname, adress, dateofbirth) values (141, 'Corrie', 'O''Bruen', '4 Hazelcrest Crossing', '2010-12-25');
insert into persons (id, name, surname, adress, dateofbirth) values (142, 'Fraser', 'Cinderey', '3 Hintze Alley', '2009-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (143, 'Gladi', 'Dearn', '9 Ilene Hill', '2002-08-08');
insert into persons (id, name, surname, adress, dateofbirth) values (144, 'Royal', 'Skirvane', '0 Algoma Parkway', '1995-10-04');
insert into persons (id, name, surname, adress, dateofbirth) values (145, 'Nevins', 'Wildish', '891 Lakewood Gardens Road', '1979-04-29');
insert into persons (id, name, surname, adress, dateofbirth) values (146, 'Brooks', 'Beresford', '9480 Ludington Plaza', '1978-08-31');
insert into persons (id, name, surname, adress, dateofbirth) values (147, 'Cass', 'Tibb', '57590 Superior Center', '2015-08-09');
insert into persons (id, name, surname, adress, dateofbirth) values (148, 'Audie', 'Flaune', '4729 Forest Run Circle', '2009-04-26');
insert into persons (id, name, surname, adress, dateofbirth) values (149, 'Kurt', 'Zaczek', '06677 Jackson Street', '1976-12-27');
insert into persons (id, name, surname, adress, dateofbirth) values (150, 'Wyn', 'Good', '73 Crest Line Crossing', '1989-01-10');
insert into persons (id, name, surname, adress, dateofbirth) values (151, 'Ximenes', 'Bullimore', '23952 Union Drive', '2013-07-06');
insert into persons (id, name, surname, adress, dateofbirth) values (152, 'Perry', 'Astridge', '50444 Scofield Circle', '1975-08-30');
insert into persons (id, name, surname, adress, dateofbirth) values (153, 'Cindy', 'Rosenqvist', '9 Wayridge Alley', '1987-09-28');
insert into persons (id, name, surname, adress, dateofbirth) values (154, 'Hermione', 'Critchell', '97 Rieder Way', '2004-12-01');
insert into persons (id, name, surname, adress, dateofbirth) values (155, 'Lissy', 'Easterby', '57 Eastlawn Place', '1991-05-12');
insert into persons (id, name, surname, adress, dateofbirth) values (156, 'Lulita', 'Mattiuzzi', '425 Ridgeway Point', '2001-06-08');
insert into persons (id, name, surname, adress, dateofbirth) values (157, 'Barrie', 'Loughney', '6 Nova Alley', '2013-04-02');
insert into persons (id, name, surname, adress, dateofbirth) values (158, 'Dorri', 'Simonassi', '96 Dovetail Place', '1987-03-25');
insert into persons (id, name, surname, adress, dateofbirth) values (159, 'Edna', 'Langstaff', '811 Sutteridge Way', '2009-08-01');
insert into persons (id, name, surname, adress, dateofbirth) values (160, 'Davey', 'Joselovitch', '24350 Anzinger Circle', '2001-10-08');
insert into persons (id, name, surname, adress, dateofbirth) values (161, 'Amerigo', 'Underhill', '76375 Anthes Pass', '1977-02-15');
insert into persons (id, name, surname, adress, dateofbirth) values (162, 'Catherine', 'Demageard', '64413 Brickson Park Lane', '1987-04-05');
insert into persons (id, name, surname, adress, dateofbirth) values (163, 'Alaine', 'Wiltshier', '2879 Barnett Pass', '2002-09-19');
insert into persons (id, name, surname, adress, dateofbirth) values (164, 'Eartha', 'Findon', '168 Roxbury Terrace', '1997-01-12');
insert into persons (id, name, surname, adress, dateofbirth) values (165, 'Griffin', 'Bottle', '838 Buhler Center', '1981-09-08');
insert into persons (id, name, surname, adress, dateofbirth) values (166, 'Noni', 'Cadreman', '110 Sycamore Junction', '1971-04-07');
insert into persons (id, name, surname, adress, dateofbirth) values (167, 'Bruno', 'Henryson', '2040 Dorton Junction', '2001-01-13');
insert into persons (id, name, surname, adress, dateofbirth) values (168, 'Zarah', 'Braybrooks', '3 Fieldstone Point', '1974-09-06');
insert into persons (id, name, surname, adress, dateofbirth) values (169, 'Trish', 'Pringley', '96 Surrey Avenue', '1998-06-15');
insert into persons (id, name, surname, adress, dateofbirth) values (170, 'Miguel', 'McGeachey', '1243 Dottie Crossing', '1976-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (171, 'Rosene', 'Claessens', '26075 Graedel Avenue', '2005-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (172, 'Claudelle', 'Liddyard', '1 Manley Street', '2013-07-13');
insert into persons (id, name, surname, adress, dateofbirth) values (173, 'Nalani', 'Uccelli', '8138 Paget Crossing', '1981-05-20');
insert into persons (id, name, surname, adress, dateofbirth) values (174, 'Darren', 'Dymidowski', '23 Twin Pines Terrace', '1985-11-08');
insert into persons (id, name, surname, adress, dateofbirth) values (175, 'Corny', 'Keveren', '33 Dryden Plaza', '2003-12-11');
insert into persons (id, name, surname, adress, dateofbirth) values (176, 'Otto', 'Trengrove', '5661 Clarendon Pass', '2005-06-25');
insert into persons (id, name, surname, adress, dateofbirth) values (177, 'Rosalinde', 'Blount', '0 Algoma Point', '2013-04-05');
insert into persons (id, name, surname, adress, dateofbirth) values (178, 'Cyndi', 'Doram', '244 Waywood Place', '1989-09-27');
insert into persons (id, name, surname, adress, dateofbirth) values (179, 'Yuri', 'Vatini', '62418 Butterfield Center', '1976-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (180, 'Sheffy', 'Prazer', '27146 Gale Court', '1974-08-24');
insert into persons (id, name, surname, adress, dateofbirth) values (181, 'Cordy', 'Karby', '9820 Welch Lane', '1997-05-19');
insert into persons (id, name, surname, adress, dateofbirth) values (182, 'Moyra', 'Piscopello', '1 Butterfield Trail', '1984-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (183, 'Amabelle', 'Skentelbury', '7 Mesta Pass', '1979-02-05');
insert into persons (id, name, surname, adress, dateofbirth) values (184, 'Jose', 'Van Giffen', '62 Kipling Junction', '1977-07-26');
insert into persons (id, name, surname, adress, dateofbirth) values (185, 'Agosto', 'Brands', '943 Stephen Pass', '1990-11-19');
insert into persons (id, name, surname, adress, dateofbirth) values (186, 'Guthrie', 'Hunnaball', '707 Mccormick Parkway', '1979-04-22');
insert into persons (id, name, surname, adress, dateofbirth) values (187, 'Cherry', 'Joskowitz', '2082 Kipling Avenue', '1980-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (188, 'Mayor', 'Manoch', '022 Emmet Avenue', '2005-07-01');
insert into persons (id, name, surname, adress, dateofbirth) values (189, 'Durand', 'Oboy', '3356 Summerview Hill', '1976-05-02');
insert into persons (id, name, surname, adress, dateofbirth) values (190, 'Loralie', 'Janczyk', '4216 Garrison Center', '2013-02-27');
insert into persons (id, name, surname, adress, dateofbirth) values (191, 'Rafaellle', 'Paunsford', '5862 Hooker Park', '1994-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (192, 'Rodger', 'Rickson', '57 Bluejay Center', '1981-08-12');
insert into persons (id, name, surname, adress, dateofbirth) values (193, 'Glennie', 'Iacovielli', '578 Reinke Road', '2007-07-04');
insert into persons (id, name, surname, adress, dateofbirth) values (194, 'Tiler', 'Tickle', '1632 Bobwhite Avenue', '1996-12-29');
insert into persons (id, name, surname, adress, dateofbirth) values (195, 'Valene', 'Garrioch', '09356 Ronald Regan Center', '2014-12-17');
insert into persons (id, name, surname, adress, dateofbirth) values (196, 'Francesca', 'Martinot', '22 Shoshone Center', '1982-10-27');
insert into persons (id, name, surname, adress, dateofbirth) values (197, 'Frederik', 'Zimmer', '58 Morningstar Park', '1984-12-04');
insert into persons (id, name, surname, adress, dateofbirth) values (198, 'Reena', 'Romans', '9 Maywood Crossing', '1974-12-30');
insert into persons (id, name, surname, adress, dateofbirth) values (199, 'Cullen', 'Fullilove', '108 Browning Circle', '1999-06-01');
insert into persons (id, name, surname, adress, dateofbirth) values (200, 'Hewet', 'Mossdale', '33 Rieder Avenue', '1997-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (201, 'Isidore', 'Abelevitz', '24922 Forster Avenue', '1990-10-06');
insert into persons (id, name, surname, adress, dateofbirth) values (202, 'Jessy', 'Fairchild', '87 Hoffman Pass', '1985-12-04');
insert into persons (id, name, surname, adress, dateofbirth) values (203, 'Deck', 'Bloxholm', '7 6th Hill', '2000-02-13');
insert into persons (id, name, surname, adress, dateofbirth) values (204, 'Pacorro', 'Hamsson', '03 Lawn Point', '2014-08-13');
insert into persons (id, name, surname, adress, dateofbirth) values (205, 'Foss', 'Fairs', '86 Dayton Place', '1987-05-22');
insert into persons (id, name, surname, adress, dateofbirth) values (206, 'Lacie', 'McNaught', '1125 Main Plaza', '1996-01-27');
insert into persons (id, name, surname, adress, dateofbirth) values (207, 'Trefor', 'Binestead', '13645 Blue Bill Park Street', '1975-11-03');
insert into persons (id, name, surname, adress, dateofbirth) values (208, 'Ranee', 'Castree', '814 Mayfield Trail', '1974-10-25');
insert into persons (id, name, surname, adress, dateofbirth) values (209, 'Chaim', 'Garry', '0 Schmedeman Lane', '2009-03-26');
insert into persons (id, name, surname, adress, dateofbirth) values (210, 'Adora', 'Gosnoll', '27688 Anthes Terrace', '1989-05-07');
insert into persons (id, name, surname, adress, dateofbirth) values (211, 'Shay', 'Shakesbye', '9477 Dapin Circle', '2009-06-03');
insert into persons (id, name, surname, adress, dateofbirth) values (212, 'Eveline', 'Nollet', '4856 Magdeline Road', '2002-01-05');
insert into persons (id, name, surname, adress, dateofbirth) values (213, 'Nickie', 'Gostyke', '5 Beilfuss Alley', '1980-04-23');
insert into persons (id, name, surname, adress, dateofbirth) values (214, 'Amalle', 'Tonn', '83729 Pearson Street', '1977-09-17');
insert into persons (id, name, surname, adress, dateofbirth) values (215, 'Baillie', 'Ogbourne', '655 Kipling Hill', '1985-12-24');
insert into persons (id, name, surname, adress, dateofbirth) values (216, 'Davina', 'Stapleford', '6066 Division Circle', '2010-08-11');
insert into persons (id, name, surname, adress, dateofbirth) values (217, 'Shara', 'Schooling', '08 Haas Pass', '1980-06-17');
insert into persons (id, name, surname, adress, dateofbirth) values (218, 'Perry', 'Renac', '6306 Monument Pass', '1977-07-10');
insert into persons (id, name, surname, adress, dateofbirth) values (219, 'Cort', 'Glanister', '340 2nd Way', '1995-10-17');
insert into persons (id, name, surname, adress, dateofbirth) values (220, 'Filip', 'Swadlinge', '81889 Oakridge Pass', '1988-02-19');
insert into persons (id, name, surname, adress, dateofbirth) values (221, 'Beatrisa', 'Peteri', '0041 Mendota Terrace', '1972-04-10');
insert into persons (id, name, surname, adress, dateofbirth) values (222, 'Dalton', 'Union', '06 Esch Crossing', '1999-06-01');
insert into persons (id, name, surname, adress, dateofbirth) values (223, 'Julita', 'Ollerenshaw', '69960 Pleasure Place', '2002-01-03');
insert into persons (id, name, surname, adress, dateofbirth) values (224, 'Shawnee', 'Smiz', '4325 Buena Vista Street', '1992-05-29');
insert into persons (id, name, surname, adress, dateofbirth) values (225, 'Anitra', 'Wyvill', '29 Fisk Pass', '1974-02-27');
insert into persons (id, name, surname, adress, dateofbirth) values (226, 'Melva', 'Stanyard', '2739 Summit Way', '2001-02-03');
insert into persons (id, name, surname, adress, dateofbirth) values (227, 'Lena', 'MacAskie', '98228 Grover Court', '1973-07-28');
insert into persons (id, name, surname, adress, dateofbirth) values (228, 'Ambrosio', 'Fowle', '77 Riverside Parkway', '2007-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (229, 'Licha', 'Castellino', '9 Vidon Court', '2002-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (230, 'Winny', 'Leftbridge', '8787 Mifflin Way', '1992-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (231, 'Karlis', 'Casse', '36204 Michigan Avenue', '2012-04-19');
insert into persons (id, name, surname, adress, dateofbirth) values (232, 'Glennie', 'Fairbairn', '34745 Weeping Birch Junction', '1977-06-14');
insert into persons (id, name, surname, adress, dateofbirth) values (233, 'Marjorie', 'Ogborne', '538 Weeping Birch Terrace', '1996-01-04');
insert into persons (id, name, surname, adress, dateofbirth) values (234, 'Yank', 'Ainley', '4710 Sullivan Lane', '2010-03-16');
insert into persons (id, name, surname, adress, dateofbirth) values (235, 'Carissa', 'Jowett', '15151 Utah Parkway', '1986-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (236, 'Annice', 'Attride', '289 Oak Parkway', '2014-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (237, 'Hewie', 'Torfin', '4 Oxford Road', '1971-07-18');
insert into persons (id, name, surname, adress, dateofbirth) values (238, 'Lucine', 'Tollet', '300 5th Plaza', '1983-03-24');
insert into persons (id, name, surname, adress, dateofbirth) values (239, 'Elenore', 'Pruckner', '555 Pearson Park', '2007-05-11');
insert into persons (id, name, surname, adress, dateofbirth) values (240, 'Archie', 'Yaneev', '09824 Jana Parkway', '1975-11-08');
insert into persons (id, name, surname, adress, dateofbirth) values (241, 'Burch', 'Tench', '71347 Monument Alley', '1981-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (242, 'Phillipe', 'Ivamy', '728 Waxwing Park', '1979-01-31');
insert into persons (id, name, surname, adress, dateofbirth) values (243, 'Rina', 'Hilland', '8 Gale Way', '2006-05-22');
insert into persons (id, name, surname, adress, dateofbirth) values (244, 'Laney', 'Streader', '8697 Sauthoff Road', '1990-12-26');
insert into persons (id, name, surname, adress, dateofbirth) values (245, 'Yance', 'Forbear', '5819 Golf Avenue', '1974-09-14');
insert into persons (id, name, surname, adress, dateofbirth) values (246, 'Eachelle', 'Karby', '3 Meadow Ridge Alley', '1994-09-12');
insert into persons (id, name, surname, adress, dateofbirth) values (247, 'Ashlee', 'Kopisch', '55939 Stang Park', '2006-10-02');
insert into persons (id, name, surname, adress, dateofbirth) values (248, 'Hendrick', 'Warratt', '596 Merry Way', '1983-11-14');
insert into persons (id, name, surname, adress, dateofbirth) values (249, 'Shanan', 'Dottridge', '4 Kropf Junction', '1989-06-09');
insert into persons (id, name, surname, adress, dateofbirth) values (250, 'Salvidor', 'Peploe', '6 Arrowood Avenue', '1978-03-17');
insert into persons (id, name, surname, adress, dateofbirth) values (251, 'Elia', 'Feitosa', '29375 Golf View Center', '1979-12-01');
insert into persons (id, name, surname, adress, dateofbirth) values (252, 'Yorgo', 'Gunning', '72 Sheridan Lane', '1997-07-21');
insert into persons (id, name, surname, adress, dateofbirth) values (253, 'Izaak', 'Clemmitt', '57 Thackeray Parkway', '1984-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (254, 'Eveleen', 'Gillis', '18 Ramsey Point', '2011-06-11');
insert into persons (id, name, surname, adress, dateofbirth) values (255, 'Hanna', 'Bonds', '4661 Village Crossing', '1976-10-16');
insert into persons (id, name, surname, adress, dateofbirth) values (256, 'Logan', 'Hudspith', '38 Twin Pines Circle', '2011-01-24');
insert into persons (id, name, surname, adress, dateofbirth) values (257, 'Parsifal', 'Sharple', '61850 Blaine Lane', '1978-06-11');
insert into persons (id, name, surname, adress, dateofbirth) values (258, 'Dorian', 'Burdus', '1 Northfield Pass', '1997-01-26');
insert into persons (id, name, surname, adress, dateofbirth) values (259, 'Melisa', 'Tarney', '280 Parkside Drive', '1999-06-15');
insert into persons (id, name, surname, adress, dateofbirth) values (260, 'Sibilla', 'Schleswig-Holstein', '283 Utah Parkway', '1999-05-07');
insert into persons (id, name, surname, adress, dateofbirth) values (261, 'Cecilla', 'Seville', '00 Hallows Alley', '1993-05-06');
insert into persons (id, name, surname, adress, dateofbirth) values (262, 'Skyler', 'Delle', '7205 Roth Trail', '2002-05-01');
insert into persons (id, name, surname, adress, dateofbirth) values (263, 'Allyn', 'O''Doohaine', '448 Bunting Avenue', '1979-09-28');
insert into persons (id, name, surname, adress, dateofbirth) values (264, 'Emmet', 'Shallcroff', '53 Granby Terrace', '2008-03-30');
insert into persons (id, name, surname, adress, dateofbirth) values (265, 'Gavra', 'De Robertis', '6 Weeping Birch Point', '2015-04-27');
insert into persons (id, name, surname, adress, dateofbirth) values (266, 'Belinda', 'Kernley', '72570 Menomonie Lane', '1975-05-21');
insert into persons (id, name, surname, adress, dateofbirth) values (267, 'Wilie', 'Smallbone', '9 Jana Point', '1998-08-08');
insert into persons (id, name, surname, adress, dateofbirth) values (268, 'Alicia', 'Pods', '992 Anniversary Parkway', '1983-07-16');
insert into persons (id, name, surname, adress, dateofbirth) values (269, 'Mike', 'Louys', '332 4th Way', '2010-01-17');
insert into persons (id, name, surname, adress, dateofbirth) values (270, 'Sibylle', 'Meni', '9848 Dorton Pass', '2012-04-21');
insert into persons (id, name, surname, adress, dateofbirth) values (271, 'Adora', 'Cabbell', '91 Nova Way', '1998-11-22');
insert into persons (id, name, surname, adress, dateofbirth) values (272, 'Everett', 'Raynham', '2804 Oak Valley Place', '1974-11-07');
insert into persons (id, name, surname, adress, dateofbirth) values (273, 'Elmira', 'Hawkyens', '8475 Carioca Avenue', '1982-07-01');
insert into persons (id, name, surname, adress, dateofbirth) values (274, 'Minnaminnie', 'Gerson', '778 Ramsey Lane', '2000-05-17');
insert into persons (id, name, surname, adress, dateofbirth) values (275, 'Rianon', 'Bariball', '714 Oneill Avenue', '1977-04-29');
insert into persons (id, name, surname, adress, dateofbirth) values (276, 'Brook', 'Scrase', '923 Russell Point', '1977-02-08');
insert into persons (id, name, surname, adress, dateofbirth) values (277, 'Carmina', 'Chable', '542 Onsgard Center', '1983-12-05');
insert into persons (id, name, surname, adress, dateofbirth) values (278, 'Boote', 'Iacavone', '511 Debra Trail', '2001-03-21');
insert into persons (id, name, surname, adress, dateofbirth) values (279, 'Leelah', 'Bleier', '6830 Nobel Center', '1984-12-27');
insert into persons (id, name, surname, adress, dateofbirth) values (280, 'Eadith', 'Aers', '6943 Kensington Plaza', '1999-02-12');
insert into persons (id, name, surname, adress, dateofbirth) values (281, 'Charmian', 'Francom', '55 Ridge Oak Hill', '2003-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (282, 'Marthe', 'Dunsire', '82 Russell Road', '1993-03-12');
insert into persons (id, name, surname, adress, dateofbirth) values (283, 'Herminia', 'Rising', '1 Roth Center', '1973-03-07');
insert into persons (id, name, surname, adress, dateofbirth) values (284, 'Dorine', 'Ballaam', '96386 Porter Junction', '1995-10-03');
insert into persons (id, name, surname, adress, dateofbirth) values (285, 'Tedie', 'Verman', '430 Victoria Center', '1972-08-15');
insert into persons (id, name, surname, adress, dateofbirth) values (286, 'Bunnie', 'O''Howbane', '8918 Goodland Trail', '1995-12-26');
insert into persons (id, name, surname, adress, dateofbirth) values (287, 'Ella', 'Ethelston', '6 Jenna Trail', '1997-03-29');
insert into persons (id, name, surname, adress, dateofbirth) values (288, 'Sabra', 'Gytesham', '6371 Farwell Road', '2015-09-12');
insert into persons (id, name, surname, adress, dateofbirth) values (289, 'Jeannie', 'Tytcomb', '11292 Northwestern Pass', '1985-08-05');
insert into persons (id, name, surname, adress, dateofbirth) values (290, 'Dee', 'Skelbeck', '6 Grover Park', '1996-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (291, 'Barbey', 'Crix', '98103 Warbler Crossing', '1996-05-19');
insert into persons (id, name, surname, adress, dateofbirth) values (292, 'Brannon', 'Mogie', '31700 Alpine Plaza', '1999-05-27');
insert into persons (id, name, surname, adress, dateofbirth) values (293, 'Eula', 'Romaines', '7155 Farmco Road', '2007-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (294, 'Kimbra', 'Morson', '7 Di Loreto Trail', '2007-12-20');
insert into persons (id, name, surname, adress, dateofbirth) values (295, 'Mavis', 'Sowten', '6911 Monument Crossing', '1982-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (296, 'Roland', 'Beevors', '4 Vernon Point', '1980-03-17');
insert into persons (id, name, surname, adress, dateofbirth) values (297, 'Caryl', 'Bolger', '7140 Rutledge Terrace', '2014-02-23');
insert into persons (id, name, surname, adress, dateofbirth) values (298, 'Sherill', 'Wemm', '326 Shasta Way', '2002-10-24');
insert into persons (id, name, surname, adress, dateofbirth) values (299, 'Gregoire', 'Copping', '48 Eastwood Center', '2003-05-16');
insert into persons (id, name, surname, adress, dateofbirth) values (300, 'Adlai', 'Steely', '0 Clarendon Court', '2007-01-30');
insert into persons (id, name, surname, adress, dateofbirth) values (301, 'Stevy', 'De Ambrosis', '20156 Anhalt Center', '1974-04-21');
insert into persons (id, name, surname, adress, dateofbirth) values (302, 'Mignonne', 'Lowdham', '97880 Meadow Ridge Parkway', '1992-09-11');
insert into persons (id, name, surname, adress, dateofbirth) values (303, 'Codie', 'Andraud', '24026 Oriole Hill', '1983-10-15');
insert into persons (id, name, surname, adress, dateofbirth) values (304, 'Rikki', 'Cochet', '412 Russell Point', '2006-05-05');
insert into persons (id, name, surname, adress, dateofbirth) values (305, 'Ronica', 'Gatheridge', '031 Vahlen Drive', '1976-12-14');
insert into persons (id, name, surname, adress, dateofbirth) values (306, 'Hendrika', 'Benasik', '4 Dottie Junction', '2009-12-14');
insert into persons (id, name, surname, adress, dateofbirth) values (307, 'Grata', 'Livezey', '71 Cody Way', '1978-04-01');
insert into persons (id, name, surname, adress, dateofbirth) values (308, 'Heinrik', 'Rosson', '63413 Northridge Plaza', '1978-10-22');
insert into persons (id, name, surname, adress, dateofbirth) values (309, 'Herman', 'Tremoille', '65357 Merry Avenue', '1977-11-11');
insert into persons (id, name, surname, adress, dateofbirth) values (310, 'Gianina', 'Whiskin', '541 Grim Parkway', '2010-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (311, 'Derby', 'Everington', '3136 Bultman Crossing', '1999-11-25');
insert into persons (id, name, surname, adress, dateofbirth) values (312, 'Hortense', 'Barnsdale', '7 Stuart Way', '1988-06-19');
insert into persons (id, name, surname, adress, dateofbirth) values (313, 'Aeriela', 'Sanger', '792 Northview Terrace', '2008-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (314, 'Gibbie', 'Friary', '0 Pleasure Terrace', '1983-10-27');
insert into persons (id, name, surname, adress, dateofbirth) values (315, 'Pauli', 'Kristoffersen', '121 Bayside Junction', '2001-12-12');
insert into persons (id, name, surname, adress, dateofbirth) values (316, 'Loralee', 'Gard', '47 Washington Center', '1974-11-06');
insert into persons (id, name, surname, adress, dateofbirth) values (317, 'Tiebold', 'Shearmer', '2 Anzinger Terrace', '1983-08-24');
insert into persons (id, name, surname, adress, dateofbirth) values (318, 'Godfrey', 'Mcmanaman', '62 Claremont Center', '1994-06-02');
insert into persons (id, name, surname, adress, dateofbirth) values (319, 'Grady', 'Omond', '88779 Arizona Place', '2014-04-26');
insert into persons (id, name, surname, adress, dateofbirth) values (320, 'Dode', 'Domenge', '0 Forest Run Junction', '1998-07-30');
insert into persons (id, name, surname, adress, dateofbirth) values (321, 'Derrick', 'Waple', '51 Tony Drive', '1988-07-30');
insert into persons (id, name, surname, adress, dateofbirth) values (322, 'Adi', 'Stark', '82 Arizona Junction', '2002-01-12');
insert into persons (id, name, surname, adress, dateofbirth) values (323, 'Hanan', 'Bradforth', '500 Shasta Hill', '1984-06-04');
insert into persons (id, name, surname, adress, dateofbirth) values (324, 'Nicolais', 'Alessandone', '938 Norway Maple Point', '2007-01-21');
insert into persons (id, name, surname, adress, dateofbirth) values (325, 'Amalia', 'Dahlman', '8 Loomis Terrace', '2000-09-10');
insert into persons (id, name, surname, adress, dateofbirth) values (326, 'Pammie', 'Sweetenham', '848 Nobel Avenue', '1994-12-18');
insert into persons (id, name, surname, adress, dateofbirth) values (327, 'Lorry', 'Grayston', '4 Moland Terrace', '2006-06-07');
insert into persons (id, name, surname, adress, dateofbirth) values (328, 'Janetta', 'Cubley', '488 Dakota Court', '1971-12-05');
insert into persons (id, name, surname, adress, dateofbirth) values (329, 'Ronny', 'Bickerdike', '3 Roxbury Trail', '1973-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (330, 'Colette', 'McKellar', '0 Steensland Center', '2013-06-11');
insert into persons (id, name, surname, adress, dateofbirth) values (331, 'Issiah', 'Martynka', '922 Armistice Alley', '1986-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (332, 'Jamil', 'Pleaden', '31915 Esch Trail', '1993-05-10');
insert into persons (id, name, surname, adress, dateofbirth) values (333, 'Kalie', 'Cajkler', '6 Maryland Avenue', '1990-12-29');
insert into persons (id, name, surname, adress, dateofbirth) values (334, 'Moritz', 'Pettifor', '551 Gerald Road', '1974-01-23');
insert into persons (id, name, surname, adress, dateofbirth) values (335, 'Jamima', 'Nenci', '2654 Blackbird Trail', '1982-11-05');
insert into persons (id, name, surname, adress, dateofbirth) values (336, 'Shayna', 'Kealey', '54951 Steensland Court', '1975-05-01');
insert into persons (id, name, surname, adress, dateofbirth) values (337, 'Germaine', 'Chew', '30762 Mosinee Plaza', '1986-08-10');
insert into persons (id, name, surname, adress, dateofbirth) values (338, 'Umeko', 'Stiffkins', '429 Browning Road', '2001-03-13');
insert into persons (id, name, surname, adress, dateofbirth) values (339, 'Kristo', 'Hurler', '1084 Bunting Parkway', '2012-09-07');
insert into persons (id, name, surname, adress, dateofbirth) values (340, 'Tildy', 'Mussard', '39946 Westridge Circle', '2006-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (341, 'Bobine', 'Kwietak', '550 Dovetail Point', '1975-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (342, 'Lanny', 'Conor', '6 7th Avenue', '1976-02-16');
insert into persons (id, name, surname, adress, dateofbirth) values (343, 'Wini', 'Jeanneau', '59 Schlimgen Center', '1996-09-17');
insert into persons (id, name, surname, adress, dateofbirth) values (344, 'Jemima', 'Speek', '6 Paget Lane', '2014-08-15');
insert into persons (id, name, surname, adress, dateofbirth) values (345, 'Vinnie', 'Arlidge', '00853 Bunting Road', '1994-10-31');
insert into persons (id, name, surname, adress, dateofbirth) values (346, 'Tierney', 'Redhead', '51 Veith Terrace', '2000-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (347, 'Grace', 'Mahy', '98380 Northview Trail', '2010-02-22');
insert into persons (id, name, surname, adress, dateofbirth) values (348, 'Korney', 'Esmead', '643 Evergreen Point', '2000-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (349, 'Glynda', 'Spilsbury', '92601 Carioca Junction', '1997-02-23');
insert into persons (id, name, surname, adress, dateofbirth) values (350, 'Angelo', 'Zimmermeister', '7 Delladonna Terrace', '2007-04-18');
insert into persons (id, name, surname, adress, dateofbirth) values (351, 'Kessiah', 'Beadnall', '96689 Brentwood Circle', '1983-10-11');
insert into persons (id, name, surname, adress, dateofbirth) values (352, 'Linnell', 'Bradlaugh', '524 Dorton Terrace', '2006-06-02');
insert into persons (id, name, surname, adress, dateofbirth) values (353, 'Gerty', 'Tiley', '5383 Bowman Parkway', '2014-05-12');
insert into persons (id, name, surname, adress, dateofbirth) values (354, 'Flory', 'Cavet', '685 Northwestern Drive', '2007-05-30');
insert into persons (id, name, surname, adress, dateofbirth) values (355, 'Celestine', 'Warmisham', '65 Manitowish Street', '2003-09-01');
insert into persons (id, name, surname, adress, dateofbirth) values (356, 'Matty', 'Bruckman', '84 Dayton Pass', '1990-02-16');
insert into persons (id, name, surname, adress, dateofbirth) values (357, 'Gardner', 'Evershed', '4836 Union Road', '1983-04-30');
insert into persons (id, name, surname, adress, dateofbirth) values (358, 'Allyn', 'Arlett', '11934 Buhler Place', '1972-06-03');
insert into persons (id, name, surname, adress, dateofbirth) values (359, 'Oneida', 'Rumford', '72205 Burning Wood Point', '2015-04-15');
insert into persons (id, name, surname, adress, dateofbirth) values (360, 'Mina', 'Caldow', '60 Spohn Avenue', '2015-08-29');
insert into persons (id, name, surname, adress, dateofbirth) values (361, 'Andrei', 'Caple', '36081 Muir Lane', '1988-01-13');
insert into persons (id, name, surname, adress, dateofbirth) values (362, 'Redd', 'Lovett', '1 Stone Corner Plaza', '1979-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (363, 'Danyelle', 'Summerlie', '1280 Anhalt Center', '2002-10-18');
insert into persons (id, name, surname, adress, dateofbirth) values (364, 'Harper', 'Pirri', '359 Calypso Park', '1996-07-26');
insert into persons (id, name, surname, adress, dateofbirth) values (365, 'Perrine', 'Hazley', '8612 Raven Terrace', '1984-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (366, 'Yasmeen', 'Vischi', '100 Reinke Way', '2006-03-22');
insert into persons (id, name, surname, adress, dateofbirth) values (367, 'Albie', 'Deavall', '5 Graedel Hill', '1978-09-15');
insert into persons (id, name, surname, adress, dateofbirth) values (368, 'Catherine', 'Trafford', '5201 Huxley Terrace', '2011-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (369, 'Emlynne', 'Buscher', '4 Del Mar Crossing', '1989-04-26');
insert into persons (id, name, surname, adress, dateofbirth) values (370, 'Darsie', 'Ledingham', '767 Graceland Lane', '2014-11-28');
insert into persons (id, name, surname, adress, dateofbirth) values (371, 'Ardine', 'Mughal', '6 Sage Pass', '2013-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (372, 'Andonis', 'Tease', '9 John Wall Junction', '1983-12-06');
insert into persons (id, name, surname, adress, dateofbirth) values (373, 'Hagen', 'Siviour', '837 Alpine Parkway', '2000-06-25');
insert into persons (id, name, surname, adress, dateofbirth) values (374, 'Bridget', 'Lansly', '49 Fisk Place', '1976-04-18');
insert into persons (id, name, surname, adress, dateofbirth) values (375, 'Ruthi', 'Walding', '03635 Warrior Crossing', '1999-12-11');
insert into persons (id, name, surname, adress, dateofbirth) values (376, 'Emmalynne', 'Jellico', '537 Colorado Court', '1990-04-03');
insert into persons (id, name, surname, adress, dateofbirth) values (377, 'Dory', 'Cudde', '32 Gerald Place', '2007-11-14');
insert into persons (id, name, surname, adress, dateofbirth) values (378, 'See', 'Crollman', '1 Sutteridge Avenue', '2005-06-17');
insert into persons (id, name, surname, adress, dateofbirth) values (379, 'Margot', 'Herety', '6 Basil Place', '1974-02-25');
insert into persons (id, name, surname, adress, dateofbirth) values (380, 'Lia', 'Cruxton', '92 Evergreen Lane', '2007-05-31');
insert into persons (id, name, surname, adress, dateofbirth) values (381, 'Weylin', 'Beasant', '16114 Sundown Circle', '1993-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (382, 'Gianna', 'Courtois', '481 Declaration Lane', '2009-11-06');
insert into persons (id, name, surname, adress, dateofbirth) values (383, 'Darnall', 'Elks', '0 Memorial Junction', '1992-01-28');
insert into persons (id, name, surname, adress, dateofbirth) values (384, 'Brittani', 'Noye', '353 Florence Court', '1987-08-16');
insert into persons (id, name, surname, adress, dateofbirth) values (385, 'Roderic', 'Dawidman', '7 Talisman Terrace', '1994-09-08');
insert into persons (id, name, surname, adress, dateofbirth) values (386, 'Alissa', 'Chasmor', '297 Hoard Alley', '1992-04-09');
insert into persons (id, name, surname, adress, dateofbirth) values (387, 'Danny', 'Bunch', '22553 Jenna Hill', '1980-05-26');
insert into persons (id, name, surname, adress, dateofbirth) values (388, 'Jany', 'Megarrell', '03 Muir Road', '1981-07-07');
insert into persons (id, name, surname, adress, dateofbirth) values (389, 'Worthy', 'Hurworth', '61 Utah Parkway', '2003-03-09');
insert into persons (id, name, surname, adress, dateofbirth) values (390, 'Reina', 'Cadd', '46001 Brickson Park Court', '1978-03-20');
insert into persons (id, name, surname, adress, dateofbirth) values (391, 'Bird', 'Kolin', '1 Katie Park', '1978-01-15');
insert into persons (id, name, surname, adress, dateofbirth) values (392, 'Roxanna', 'O''Lyhane', '276 Helena Road', '1974-11-14');
insert into persons (id, name, surname, adress, dateofbirth) values (393, 'Cosette', 'Boichat', '97289 Garrison Center', '1975-09-10');
insert into persons (id, name, surname, adress, dateofbirth) values (394, 'Aurelia', 'Hulles', '9322 Nova Point', '1996-10-10');
insert into persons (id, name, surname, adress, dateofbirth) values (395, 'Noell', 'Pulteneye', '80953 Mccormick Road', '1980-02-01');
insert into persons (id, name, surname, adress, dateofbirth) values (396, 'Arman', 'Bultitude', '70658 Morning Place', '2011-05-23');
insert into persons (id, name, surname, adress, dateofbirth) values (397, 'Conant', 'Boyfield', '91883 Basil Court', '1998-09-03');
insert into persons (id, name, surname, adress, dateofbirth) values (398, 'Avigdor', 'Henmarsh', '016 Roxbury Street', '1998-09-25');
insert into persons (id, name, surname, adress, dateofbirth) values (399, 'Mollee', 'Monard', '25682 Warrior Parkway', '1999-11-11');
insert into persons (id, name, surname, adress, dateofbirth) values (400, 'Emelyne', 'Weems', '592 Hintze Center', '1982-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (401, 'Mollee', 'Lindenman', '64785 Jenifer Terrace', '2010-04-19');
insert into persons (id, name, surname, adress, dateofbirth) values (402, 'Keeley', 'Artist', '53285 Tennyson Way', '1976-08-25');
insert into persons (id, name, surname, adress, dateofbirth) values (403, 'Lucretia', 'Samwaye', '582 Fremont Parkway', '1995-10-17');
insert into persons (id, name, surname, adress, dateofbirth) values (404, 'Leisha', 'Kerss', '042 Amoth Center', '1984-11-23');
insert into persons (id, name, surname, adress, dateofbirth) values (405, 'Adelice', 'Woodeson', '34 Claremont Parkway', '1978-11-24');
insert into persons (id, name, surname, adress, dateofbirth) values (406, 'Kalina', 'Cawthery', '65 Shelley Terrace', '1977-01-03');
insert into persons (id, name, surname, adress, dateofbirth) values (407, 'Gabriell', 'Cabedo', '3858 5th Hill', '1986-05-18');
insert into persons (id, name, surname, adress, dateofbirth) values (408, 'Margaret', 'Broad', '34919 Mallory Way', '2001-05-23');
insert into persons (id, name, surname, adress, dateofbirth) values (409, 'Luke', 'Czaple', '5 Katie Alley', '2008-11-30');
insert into persons (id, name, surname, adress, dateofbirth) values (410, 'Ahmed', 'Chessil', '7281 Westridge Crossing', '1980-05-12');
insert into persons (id, name, surname, adress, dateofbirth) values (411, 'Lian', 'Unwins', '7194 John Wall Alley', '2010-09-28');
insert into persons (id, name, surname, adress, dateofbirth) values (412, 'Neall', 'Wedge', '82 Hanover Junction', '1986-07-01');
insert into persons (id, name, surname, adress, dateofbirth) values (413, 'Melisenda', 'Mirralls', '82517 Rockefeller Junction', '1976-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (414, 'Adriena', 'Bithell', '8768 Porter Way', '1984-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (415, 'Niko', 'Robak', '8 Tennyson Way', '2010-09-05');
insert into persons (id, name, surname, adress, dateofbirth) values (416, 'Dalia', 'Colkett', '4868 Aberg Parkway', '1998-02-24');
insert into persons (id, name, surname, adress, dateofbirth) values (417, 'Ervin', 'Keele', '0 Morrow Parkway', '1989-01-01');
insert into persons (id, name, surname, adress, dateofbirth) values (418, 'Debi', 'Duplain', '367 Meadow Ridge Road', '1983-04-22');
insert into persons (id, name, surname, adress, dateofbirth) values (419, 'Hasty', 'Henden', '3 Alpine Place', '1972-11-13');
insert into persons (id, name, surname, adress, dateofbirth) values (420, 'Kath', 'Pick', '733 Merrick Pass', '2000-09-19');
insert into persons (id, name, surname, adress, dateofbirth) values (421, 'Kathie', 'Perks', '5922 Sycamore Avenue', '2011-05-10');
insert into persons (id, name, surname, adress, dateofbirth) values (422, 'Ignacius', 'Mortel', '9 Talisman Pass', '1982-01-23');
insert into persons (id, name, surname, adress, dateofbirth) values (423, 'Malia', 'Elsop', '90127 Granby Center', '2010-02-20');
insert into persons (id, name, surname, adress, dateofbirth) values (424, 'Ketty', 'Sheaber', '51 Hoard Hill', '1992-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (425, 'Lira', 'Spinas', '77 Dahle Junction', '1991-03-16');
insert into persons (id, name, surname, adress, dateofbirth) values (426, 'John', 'Reville', '37 Independence Way', '2006-07-27');
insert into persons (id, name, surname, adress, dateofbirth) values (427, 'Levi', 'Erswell', '234 Kropf Circle', '1976-01-18');
insert into persons (id, name, surname, adress, dateofbirth) values (428, 'Maximilianus', 'Zaple', '4 Prairie Rose Circle', '2008-08-10');
insert into persons (id, name, surname, adress, dateofbirth) values (429, 'Eileen', 'Turfs', '54 Arizona Pass', '1972-08-19');
insert into persons (id, name, surname, adress, dateofbirth) values (430, 'Effie', 'Trustrie', '1072 Hoepker Center', '1980-04-16');
insert into persons (id, name, surname, adress, dateofbirth) values (431, 'Cristobal', 'Mazzey', '12 Heffernan Alley', '1983-10-15');
insert into persons (id, name, surname, adress, dateofbirth) values (432, 'Emmanuel', 'MacKenney', '1 John Wall Street', '1994-12-12');
insert into persons (id, name, surname, adress, dateofbirth) values (433, 'Barnett', 'Marcam', '7 Dwight Lane', '1987-02-22');
insert into persons (id, name, surname, adress, dateofbirth) values (434, 'Viki', 'Blackaller', '62418 Gale Crossing', '1971-01-12');
insert into persons (id, name, surname, adress, dateofbirth) values (435, 'Alexis', 'Hindrich', '917 Buell Trail', '1992-07-15');
insert into persons (id, name, surname, adress, dateofbirth) values (436, 'Grove', 'Seldon', '33 Hansons Park', '1971-08-01');
insert into persons (id, name, surname, adress, dateofbirth) values (437, 'Zonda', 'Skullet', '40 Straubel Drive', '1983-05-17');
insert into persons (id, name, surname, adress, dateofbirth) values (438, 'Chaunce', 'Rozenzweig', '5204 Iowa Avenue', '2001-09-19');
insert into persons (id, name, surname, adress, dateofbirth) values (439, 'Wylma', 'Reynolds', '2592 Aberg Junction', '2008-10-08');
insert into persons (id, name, surname, adress, dateofbirth) values (440, 'Germana', 'Klausewitz', '24 Warner Trail', '2011-06-07');
insert into persons (id, name, surname, adress, dateofbirth) values (441, 'Nikita', 'Kingsworth', '59958 Ohio Parkway', '2015-04-29');
insert into persons (id, name, surname, adress, dateofbirth) values (442, 'Julie', 'Sawyers', '4 Amoth Hill', '1999-10-04');
insert into persons (id, name, surname, adress, dateofbirth) values (443, 'Ashia', 'Durston', '87878 Esker Alley', '1996-03-21');
insert into persons (id, name, surname, adress, dateofbirth) values (444, 'Dion', 'Appleton', '29628 Jay Plaza', '1985-12-30');
insert into persons (id, name, surname, adress, dateofbirth) values (445, 'Mag', 'Swindle', '6 Homewood Road', '1994-12-05');
insert into persons (id, name, surname, adress, dateofbirth) values (446, 'Sara-ann', 'Skellen', '416 Vahlen Way', '2011-05-17');
insert into persons (id, name, surname, adress, dateofbirth) values (447, 'Angele', 'Domange', '067 Norway Maple Alley', '2006-06-05');
insert into persons (id, name, surname, adress, dateofbirth) values (448, 'Reggi', 'Demann', '11491 Pine View Trail', '1999-01-26');
insert into persons (id, name, surname, adress, dateofbirth) values (449, 'Butch', 'Gussin', '390 Mosinee Junction', '2014-02-05');
insert into persons (id, name, surname, adress, dateofbirth) values (450, 'Neile', 'Spraberry', '40637 Lakewood Gardens Parkway', '1999-12-30');
insert into persons (id, name, surname, adress, dateofbirth) values (451, 'Maire', 'Folliott', '09615 Annamark Alley', '2008-01-06');
insert into persons (id, name, surname, adress, dateofbirth) values (452, 'Donn', 'Dolman', '428 Lien Drive', '2000-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (453, 'Saundra', 'Trahearn', '8811 Hoffman Lane', '1980-06-06');
insert into persons (id, name, surname, adress, dateofbirth) values (454, 'Corene', 'Muckleston', '7490 Troy Parkway', '1996-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (455, 'Byram', 'Pullar', '01 Tony Terrace', '1976-04-27');
insert into persons (id, name, surname, adress, dateofbirth) values (456, 'Branden', 'Domini', '3 Bellgrove Hill', '1994-11-07');
insert into persons (id, name, surname, adress, dateofbirth) values (457, 'Ibbie', 'Eaklee', '8652 Meadow Vale Pass', '2006-01-02');
insert into persons (id, name, surname, adress, dateofbirth) values (458, 'Dareen', 'Bramo', '8 Acker Pass', '1996-09-27');
insert into persons (id, name, surname, adress, dateofbirth) values (459, 'Humberto', 'Topaz', '8 Reindahl Park', '2001-11-18');
insert into persons (id, name, surname, adress, dateofbirth) values (460, 'Raynor', 'Everson', '830 Gulseth Crossing', '1975-01-26');
insert into persons (id, name, surname, adress, dateofbirth) values (461, 'Pepe', 'Knagges', '2 Boyd Point', '2002-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (462, 'Beryl', 'Gibson', '3 Kim Parkway', '2006-12-25');
insert into persons (id, name, surname, adress, dateofbirth) values (463, 'Fitzgerald', 'Gorwood', '793 Green Ridge Junction', '1995-04-20');
insert into persons (id, name, surname, adress, dateofbirth) values (464, 'Lucille', 'Finnan', '4 Sugar Hill', '1972-01-24');
insert into persons (id, name, surname, adress, dateofbirth) values (465, 'Persis', 'Brandacci', '2 Summerview Hill', '2002-02-21');
insert into persons (id, name, surname, adress, dateofbirth) values (466, 'Kellen', 'Biasioni', '93 Farmco Lane', '1985-01-04');
insert into persons (id, name, surname, adress, dateofbirth) values (467, 'Salomo', 'Najera', '3 Surrey Street', '2008-03-28');
insert into persons (id, name, surname, adress, dateofbirth) values (468, 'Wilden', 'Sunnucks', '1144 Sunnyside Terrace', '1998-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (469, 'Jaimie', 'Slessar', '98331 Duke Parkway', '1979-10-13');
insert into persons (id, name, surname, adress, dateofbirth) values (470, 'Kelley', 'Pinnell', '9 Kings Center', '2002-09-26');
insert into persons (id, name, surname, adress, dateofbirth) values (471, 'Justin', 'Allbut', '3868 Pawling Avenue', '2004-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (472, 'Cinderella', 'MacCaig', '42119 Anthes Road', '1982-03-09');
insert into persons (id, name, surname, adress, dateofbirth) values (473, 'Jocko', 'Polkinhorn', '0813 Browning Street', '1990-01-01');
insert into persons (id, name, surname, adress, dateofbirth) values (474, 'Courtenay', 'Baythrop', '531 Monica Alley', '1983-07-27');
insert into persons (id, name, surname, adress, dateofbirth) values (475, 'Andy', 'Tomaszynski', '4 Birchwood Alley', '1979-08-22');
insert into persons (id, name, surname, adress, dateofbirth) values (476, 'Caryl', 'Featherston', '66 Sherman Parkway', '2015-06-08');
insert into persons (id, name, surname, adress, dateofbirth) values (477, 'Dalila', 'Skirving', '502 Sherman Point', '1990-04-30');
insert into persons (id, name, surname, adress, dateofbirth) values (478, 'Avigdor', 'Calveley', '098 Shasta Hill', '1978-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (479, 'Tierney', 'Pentlow', '09284 Clarendon Way', '2014-07-04');
insert into persons (id, name, surname, adress, dateofbirth) values (480, 'Arlin', 'Moxstead', '649 Wayridge Terrace', '1972-08-06');
insert into persons (id, name, surname, adress, dateofbirth) values (481, 'Tedie', 'Wibrew', '8 Barnett Street', '1976-10-02');
insert into persons (id, name, surname, adress, dateofbirth) values (482, 'Wolfie', 'MacAllister', '62 Forest Way', '2000-12-09');
insert into persons (id, name, surname, adress, dateofbirth) values (483, 'Obediah', 'Waddilove', '46 Shelley Terrace', '2000-07-09');
insert into persons (id, name, surname, adress, dateofbirth) values (484, 'Deina', 'Bhatia', '9 Roxbury Crossing', '1973-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (485, 'Josefa', 'Auckland', '4196 Pepper Wood Point', '1974-05-30');
insert into persons (id, name, surname, adress, dateofbirth) values (486, 'Adriena', 'Rubes', '0118 Lukken Junction', '2011-02-18');
insert into persons (id, name, surname, adress, dateofbirth) values (487, 'Corty', 'Domnick', '5 Petterle Park', '2001-12-27');
insert into persons (id, name, surname, adress, dateofbirth) values (488, 'Katherina', 'Amiss', '56207 Mosinee Avenue', '1974-09-12');
insert into persons (id, name, surname, adress, dateofbirth) values (489, 'Sascha', 'Braker', '72 Lyons Court', '2000-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (490, 'Rusty', 'Barck', '75 Prairieview Lane', '1977-05-01');
insert into persons (id, name, surname, adress, dateofbirth) values (491, 'Shelley', 'Worham', '244 Mesta Center', '2008-11-20');
insert into persons (id, name, surname, adress, dateofbirth) values (492, 'Leona', 'Press', '87 7th Drive', '1994-04-24');
insert into persons (id, name, surname, adress, dateofbirth) values (493, 'Ivett', 'Derdes', '2025 Shoshone Circle', '2008-01-14');
insert into persons (id, name, surname, adress, dateofbirth) values (494, 'Lillis', 'Blas', '1908 Norway Maple Parkway', '1975-11-20');
insert into persons (id, name, surname, adress, dateofbirth) values (495, 'Sharyl', 'Vasilic', '74 Toban Trail', '2010-09-21');
insert into persons (id, name, surname, adress, dateofbirth) values (496, 'Danica', 'McElory', '8 Sunnyside Lane', '1983-01-10');
insert into persons (id, name, surname, adress, dateofbirth) values (497, 'Clem', 'Bourthoumieux', '2 South Avenue', '2006-12-18');
insert into persons (id, name, surname, adress, dateofbirth) values (498, 'Wynn', 'Larrie', '16 Macpherson Trail', '2008-09-29');
insert into persons (id, name, surname, adress, dateofbirth) values (499, 'Aldous', 'Castellino', '82080 Golf Course Terrace', '1999-11-22');
insert into persons (id, name, surname, adress, dateofbirth) values (500, 'Farrell', 'Fuzzey', '7 Sugar Court', '1989-08-19');
insert into persons (id, name, surname, adress, dateofbirth) values (501, 'Jeni', 'Agglio', '22 Oxford Way', '2002-08-01');
insert into persons (id, name, surname, adress, dateofbirth) values (502, 'Phyllys', 'Rowan', '08293 Cascade Court', '1991-01-27');
insert into persons (id, name, surname, adress, dateofbirth) values (503, 'Holli', 'Tolumello', '9268 Stone Corner Avenue', '2007-02-03');
insert into persons (id, name, surname, adress, dateofbirth) values (504, 'Andi', 'Whodcoat', '695 Crowley Alley', '1996-01-27');
insert into persons (id, name, surname, adress, dateofbirth) values (505, 'Kirstyn', 'Rosenzwig', '9 American Ash Park', '1975-07-18');
insert into persons (id, name, surname, adress, dateofbirth) values (506, 'Marigold', 'Missen', '14 Ohio Plaza', '2001-10-06');
insert into persons (id, name, surname, adress, dateofbirth) values (507, 'Guntar', 'Oubridge', '43 Twin Pines Center', '1995-01-20');
insert into persons (id, name, surname, adress, dateofbirth) values (508, 'Saundra', 'Glendinning', '6007 Springs Court', '1989-02-10');
insert into persons (id, name, surname, adress, dateofbirth) values (509, 'Donelle', 'Gindghill', '603 Atwood Street', '1995-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (510, 'Larisa', 'Toffoloni', '7923 Miller Park', '1975-04-02');
insert into persons (id, name, surname, adress, dateofbirth) values (511, 'Jeanine', 'Brandoni', '43 Talmadge Crossing', '1979-12-29');
insert into persons (id, name, surname, adress, dateofbirth) values (512, 'Blisse', 'Drohan', '4 Dawn Alley', '2014-04-26');
insert into persons (id, name, surname, adress, dateofbirth) values (513, 'Car', 'Muschette', '5 Bluejay Terrace', '2012-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (514, 'Malena', 'McLennan', '7 Clyde Gallagher Crossing', '2009-09-02');
insert into persons (id, name, surname, adress, dateofbirth) values (515, 'Nathalia', 'Amberg', '60773 Merchant Trail', '1980-07-15');
insert into persons (id, name, surname, adress, dateofbirth) values (516, 'Priscilla', 'McSaul', '495 Clove Alley', '1985-10-04');
insert into persons (id, name, surname, adress, dateofbirth) values (517, 'Bobbye', 'Gergely', '673 Independence Drive', '1992-03-03');
insert into persons (id, name, surname, adress, dateofbirth) values (518, 'Evelyn', 'Maffiotti', '05096 Fordem Place', '1986-07-28');
insert into persons (id, name, surname, adress, dateofbirth) values (519, 'Menard', 'Divver', '1426 Blaine Point', '1974-06-15');
insert into persons (id, name, surname, adress, dateofbirth) values (520, 'Jan', 'Ormistone', '503 Roth Drive', '1983-11-22');
insert into persons (id, name, surname, adress, dateofbirth) values (521, 'Aurlie', 'Deighton', '51073 Lakewood Center', '1989-08-29');
insert into persons (id, name, surname, adress, dateofbirth) values (522, 'Valli', 'Ennor', '70 Trailsway Trail', '1978-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (523, 'Roddie', 'Ferriman', '63 Sage Center', '1975-08-15');
insert into persons (id, name, surname, adress, dateofbirth) values (524, 'Constancia', 'Wilkerson', '4 Continental Alley', '1996-12-29');
insert into persons (id, name, surname, adress, dateofbirth) values (525, 'Audrey', 'Dudney', '4858 Fremont Way', '1998-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (526, 'Sydel', 'Bril', '066 Division Alley', '1989-01-06');
insert into persons (id, name, surname, adress, dateofbirth) values (527, 'Amil', 'Giraudel', '8333 Carpenter Plaza', '1972-02-13');
insert into persons (id, name, surname, adress, dateofbirth) values (528, 'Elberta', 'Billo', '49329 Karstens Pass', '1990-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (529, 'Myles', 'Agron', '5 Grim Alley', '1988-04-10');
insert into persons (id, name, surname, adress, dateofbirth) values (530, 'Ethelda', 'Neljes', '62 Linden Street', '2001-09-21');
insert into persons (id, name, surname, adress, dateofbirth) values (531, 'Brant', 'Paulin', '115 Little Fleur Court', '2005-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (532, 'Annelise', 'Lackington', '92 David Junction', '1991-07-16');
insert into persons (id, name, surname, adress, dateofbirth) values (533, 'Alfred', 'Boken', '8734 Vera Park', '1988-08-26');
insert into persons (id, name, surname, adress, dateofbirth) values (534, 'Rowney', 'Grogan', '0 Eastwood Way', '1998-09-04');
insert into persons (id, name, surname, adress, dateofbirth) values (535, 'Chris', 'Durnford', '29 Vermont Point', '1989-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (536, 'Bjorn', 'Scourge', '32 Moulton Point', '1990-12-10');
insert into persons (id, name, surname, adress, dateofbirth) values (537, 'Hardy', 'Lyptrade', '6357 Acker Drive', '1978-06-08');
insert into persons (id, name, surname, adress, dateofbirth) values (538, 'Hilda', 'Millen', '40313 Duke Terrace', '2009-11-04');
insert into persons (id, name, surname, adress, dateofbirth) values (539, 'Vannie', 'Koeppke', '468 Dorton Plaza', '2007-04-27');
insert into persons (id, name, surname, adress, dateofbirth) values (540, 'Sadye', 'Wimbury', '03 Crest Line Street', '1994-05-29');
insert into persons (id, name, surname, adress, dateofbirth) values (541, 'Stacee', 'Francescoccio', '806 Hovde Lane', '2007-03-03');
insert into persons (id, name, surname, adress, dateofbirth) values (542, 'Shanda', 'Thornborrow', '136 Doe Crossing Plaza', '2004-07-29');
insert into persons (id, name, surname, adress, dateofbirth) values (543, 'Nora', 'Stockle', '750 Hallows Crossing', '1997-09-08');
insert into persons (id, name, surname, adress, dateofbirth) values (544, 'Jerad', 'Chancellor', '36172 Dapin Avenue', '1981-07-25');
insert into persons (id, name, surname, adress, dateofbirth) values (545, 'Nadine', 'Bocke', '6655 Waywood Parkway', '1990-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (546, 'Cecile', 'Dederick', '595 Badeau Pass', '2002-12-08');
insert into persons (id, name, surname, adress, dateofbirth) values (547, 'Cindelyn', 'Braben', '54 Arapahoe Trail', '1989-01-25');
insert into persons (id, name, surname, adress, dateofbirth) values (548, 'Tracy', 'Shimmans', '51 Ronald Regan Point', '2000-05-07');
insert into persons (id, name, surname, adress, dateofbirth) values (549, 'Quentin', 'Berre', '097 Lerdahl Crossing', '2006-05-21');
insert into persons (id, name, surname, adress, dateofbirth) values (550, 'Brent', 'Weetch', '245 Shelley Hill', '1981-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (551, 'Valeria', 'Wickes', '4 Stoughton Center', '1974-09-26');
insert into persons (id, name, surname, adress, dateofbirth) values (552, 'Libbi', 'Vasyatkin', '82 Gale Center', '2014-09-21');
insert into persons (id, name, surname, adress, dateofbirth) values (553, 'Aloysia', 'Dennehy', '3 Anniversary Way', '1974-12-15');
insert into persons (id, name, surname, adress, dateofbirth) values (554, 'Fred', 'Grainger', '0 Lighthouse Bay Place', '1976-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (555, 'Storm', 'Haitlie', '45577 Coolidge Lane', '1974-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (556, 'Garek', 'Luckes', '7266 Pond Drive', '1977-05-14');
insert into persons (id, name, surname, adress, dateofbirth) values (557, 'Hasty', 'Nowakowski', '5 Logan Park', '2001-12-03');
insert into persons (id, name, surname, adress, dateofbirth) values (558, 'Tudor', 'Littleproud', '64 Elmside Hill', '2009-01-15');
insert into persons (id, name, surname, adress, dateofbirth) values (559, 'Marijn', 'Cushe', '9 Parkside Terrace', '2009-01-02');
insert into persons (id, name, surname, adress, dateofbirth) values (560, 'Crawford', 'Dockree', '3351 Bobwhite Parkway', '1990-10-05');
insert into persons (id, name, surname, adress, dateofbirth) values (561, 'Jacqueline', 'Kermeen', '8241 Ludington Plaza', '2011-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (562, 'Marcie', 'Lissandrini', '03 Portage Point', '1988-06-19');
insert into persons (id, name, surname, adress, dateofbirth) values (563, 'Desiri', 'Szanto', '678 Morningstar Point', '1988-01-13');
insert into persons (id, name, surname, adress, dateofbirth) values (564, 'Elayne', 'Radloff', '81 Banding Parkway', '1978-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (565, 'Curcio', 'McCosh', '89 Northport Plaza', '2009-09-11');
insert into persons (id, name, surname, adress, dateofbirth) values (566, 'Codi', 'Bengtsen', '78720 Hooker Place', '1983-01-23');
insert into persons (id, name, surname, adress, dateofbirth) values (567, 'Conant', 'Granleese', '30850 Hayes Way', '1979-01-20');
insert into persons (id, name, surname, adress, dateofbirth) values (568, 'Rozalin', 'Tousey', '539 Chive Center', '1973-11-14');
insert into persons (id, name, surname, adress, dateofbirth) values (569, 'Emlyn', 'Kenningham', '0660 Wayridge Hill', '1990-10-11');
insert into persons (id, name, surname, adress, dateofbirth) values (570, 'Eve', 'Ridger', '633 High Crossing Junction', '2007-12-05');
insert into persons (id, name, surname, adress, dateofbirth) values (571, 'Adriana', 'Spire', '34 Eggendart Trail', '1975-11-09');
insert into persons (id, name, surname, adress, dateofbirth) values (572, 'Damian', 'Gantlett', '2 Morningstar Avenue', '1980-03-04');
insert into persons (id, name, surname, adress, dateofbirth) values (573, 'Anton', 'Presser', '58 Meadow Valley Park', '1986-09-22');
insert into persons (id, name, surname, adress, dateofbirth) values (574, 'Willi', 'Thewless', '9919 Dunning Drive', '1971-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (575, 'Lenci', 'Gauch', '7030 Maywood Way', '2002-12-15');
insert into persons (id, name, surname, adress, dateofbirth) values (576, 'Eileen', 'Tradewell', '1110 Dennis Crossing', '1979-09-05');
insert into persons (id, name, surname, adress, dateofbirth) values (577, 'Neel', 'de Quesne', '934 Vernon Circle', '1984-12-04');
insert into persons (id, name, surname, adress, dateofbirth) values (578, 'Burgess', 'Wharmby', '03 Sundown Court', '1979-08-06');
insert into persons (id, name, surname, adress, dateofbirth) values (579, 'Sile', 'Wyllie', '16 Steensland Parkway', '1990-10-10');
insert into persons (id, name, surname, adress, dateofbirth) values (580, 'Gisela', 'Soame', '1229 Melody Plaza', '1981-03-04');
insert into persons (id, name, surname, adress, dateofbirth) values (581, 'Daloris', 'Melsom', '1 Morrow Avenue', '1983-01-01');
insert into persons (id, name, surname, adress, dateofbirth) values (582, 'Talya', 'Lismer', '46 Hintze Way', '1982-01-24');
insert into persons (id, name, surname, adress, dateofbirth) values (583, 'Janela', 'Feaster', '24856 Anhalt Trail', '1971-12-08');
insert into persons (id, name, surname, adress, dateofbirth) values (584, 'Dorella', 'Lindgren', '677 Rowland Circle', '2000-12-05');
insert into persons (id, name, surname, adress, dateofbirth) values (585, 'Wini', 'Dripps', '4059 Toban Drive', '2003-04-23');
insert into persons (id, name, surname, adress, dateofbirth) values (586, 'Marwin', 'McGowan', '33741 Butternut Plaza', '1990-09-30');
insert into persons (id, name, surname, adress, dateofbirth) values (587, 'Camala', 'Allabush', '3968 Sloan Lane', '1978-04-12');
insert into persons (id, name, surname, adress, dateofbirth) values (588, 'Charles', 'Monnoyer', '24 Sheridan Road', '1973-12-15');
insert into persons (id, name, surname, adress, dateofbirth) values (589, 'Desdemona', 'Henrique', '48 Hoffman Avenue', '2015-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (590, 'Normy', 'Howsan', '5 Emmet Pass', '2006-07-26');
insert into persons (id, name, surname, adress, dateofbirth) values (591, 'Danna', 'Roderighi', '6135 Bluestem Avenue', '2012-12-12');
insert into persons (id, name, surname, adress, dateofbirth) values (592, 'Lorrie', 'Trevithick', '931 Kropf Court', '1976-05-01');
insert into persons (id, name, surname, adress, dateofbirth) values (593, 'Mattheus', 'Singers', '9 Hagan Lane', '2006-05-26');
insert into persons (id, name, surname, adress, dateofbirth) values (594, 'Minnnie', 'Hryskiewicz', '9113 Oak Valley Drive', '2002-10-29');
insert into persons (id, name, surname, adress, dateofbirth) values (595, 'Dacie', 'Okenden', '1408 Ludington Avenue', '1990-11-15');
insert into persons (id, name, surname, adress, dateofbirth) values (596, 'Ginger', 'Batecok', '35607 Drewry Plaza', '1994-01-19');
insert into persons (id, name, surname, adress, dateofbirth) values (597, 'Jerrome', 'Booton', '06 Roth Terrace', '1976-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (598, 'Isaac', 'Davis', '77231 Anzinger Street', '1973-10-23');
insert into persons (id, name, surname, adress, dateofbirth) values (599, 'Abba', 'Joy', '917 Erie Avenue', '1984-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (600, 'Pet', 'Badby', '03233 Anzinger Park', '2010-11-06');
insert into persons (id, name, surname, adress, dateofbirth) values (601, 'Davidde', 'Glanvill', '131 Sachs Drive', '1985-04-22');
insert into persons (id, name, surname, adress, dateofbirth) values (602, 'Lorraine', 'Balcombe', '28088 Magdeline Crossing', '1997-06-11');
insert into persons (id, name, surname, adress, dateofbirth) values (603, 'Thatcher', 'Koeppe', '5592 Di Loreto Terrace', '1971-11-15');
insert into persons (id, name, surname, adress, dateofbirth) values (604, 'Ezri', 'Seel', '340 Kennedy Avenue', '2000-03-07');
insert into persons (id, name, surname, adress, dateofbirth) values (605, 'Cchaddie', 'Le Fleming', '03427 Redwing Court', '2006-12-13');
insert into persons (id, name, surname, adress, dateofbirth) values (606, 'Chaim', 'Pinckney', '7238 Bartillon Alley', '2007-07-12');
insert into persons (id, name, surname, adress, dateofbirth) values (607, 'Calypso', 'MacAnulty', '32850 Kipling Road', '1981-09-14');
insert into persons (id, name, surname, adress, dateofbirth) values (608, 'Sayre', 'Pingston', '19670 Forest Dale Plaza', '1984-07-09');
insert into persons (id, name, surname, adress, dateofbirth) values (609, 'Alexandra', 'Tingley', '84 Commercial Parkway', '1978-09-06');
insert into persons (id, name, surname, adress, dateofbirth) values (610, 'Mikaela', 'Rennocks', '647 Manufacturers Pass', '1988-06-26');
insert into persons (id, name, surname, adress, dateofbirth) values (611, 'Antony', 'Clurow', '2 Express Lane', '2001-04-13');
insert into persons (id, name, surname, adress, dateofbirth) values (612, 'Ricoriki', 'Pantecost', '713 Kim Terrace', '1991-08-31');
insert into persons (id, name, surname, adress, dateofbirth) values (613, 'Jens', 'Skirlin', '729 Chinook Park', '1982-11-22');
insert into persons (id, name, surname, adress, dateofbirth) values (614, 'Myrwyn', 'Pulford', '2147 7th Street', '2011-09-16');
insert into persons (id, name, surname, adress, dateofbirth) values (615, 'Amble', 'Verey', '89646 Dryden Court', '1983-09-16');
insert into persons (id, name, surname, adress, dateofbirth) values (616, 'Wilden', 'Lintin', '7 Mallory Road', '1982-07-21');
insert into persons (id, name, surname, adress, dateofbirth) values (617, 'Debra', 'Comettoi', '2 Dixon Place', '1977-02-14');
insert into persons (id, name, surname, adress, dateofbirth) values (618, 'Latashia', 'Trippack', '0998 Raven Plaza', '1995-12-07');
insert into persons (id, name, surname, adress, dateofbirth) values (619, 'Ermin', 'Kail', '005 Beilfuss Pass', '1988-07-19');
insert into persons (id, name, surname, adress, dateofbirth) values (620, 'Caro', 'Dix', '0 Londonderry Avenue', '2000-05-27');
insert into persons (id, name, surname, adress, dateofbirth) values (621, 'Ellwood', 'Bonick', '41013 Victoria Pass', '2005-01-18');
insert into persons (id, name, surname, adress, dateofbirth) values (622, 'Denna', 'Kenny', '73 Cody Street', '1988-08-24');
insert into persons (id, name, surname, adress, dateofbirth) values (623, 'Elke', 'Candlin', '8 Carey Parkway', '1980-09-19');
insert into persons (id, name, surname, adress, dateofbirth) values (624, 'Juliette', 'Fattori', '06 Nelson Lane', '2009-04-23');
insert into persons (id, name, surname, adress, dateofbirth) values (625, 'Camellia', 'Rycraft', '8832 Division Point', '2011-08-03');
insert into persons (id, name, surname, adress, dateofbirth) values (626, 'Caprice', 'Yetman', '89 Luster Center', '2011-05-25');
insert into persons (id, name, surname, adress, dateofbirth) values (627, 'Etti', 'O''Fergus', '174 Sloan Junction', '2009-04-18');
insert into persons (id, name, surname, adress, dateofbirth) values (628, 'Mervin', 'Chanson', '20949 Upham Circle', '1995-05-23');
insert into persons (id, name, surname, adress, dateofbirth) values (629, 'Freddy', 'Klug', '708 Artisan Avenue', '1982-06-20');
insert into persons (id, name, surname, adress, dateofbirth) values (630, 'Antonia', 'Emblem', '9673 Carpenter Place', '2008-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (631, 'Anya', 'Georgievski', '8 Sycamore Way', '1996-06-23');
insert into persons (id, name, surname, adress, dateofbirth) values (632, 'Loydie', 'Starten', '6 Scofield Crossing', '2009-12-12');
insert into persons (id, name, surname, adress, dateofbirth) values (633, 'Merrielle', 'Giacovelli', '63308 Lunder Trail', '2002-10-05');
insert into persons (id, name, surname, adress, dateofbirth) values (634, 'Lizzy', 'Hessle', '0 Maple Wood Center', '2006-10-05');
insert into persons (id, name, surname, adress, dateofbirth) values (635, 'Conrade', 'Cottill', '7 Orin Street', '2011-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (636, 'Cirillo', 'Stebbing', '18 Transport Avenue', '2015-05-18');
insert into persons (id, name, surname, adress, dateofbirth) values (637, 'Ingra', 'Jakubowsky', '820 Spohn Terrace', '1981-04-07');
insert into persons (id, name, surname, adress, dateofbirth) values (638, 'Mollee', 'Birchall', '1080 Green Crossing', '2015-03-03');
insert into persons (id, name, surname, adress, dateofbirth) values (639, 'Crissie', 'Lindsay', '78924 Village Way', '2010-12-16');
insert into persons (id, name, surname, adress, dateofbirth) values (640, 'Corney', 'Neate', '3059 Bluestem Court', '2007-10-16');
insert into persons (id, name, surname, adress, dateofbirth) values (641, 'Nani', 'Pignon', '14 Lighthouse Bay Circle', '2003-07-15');
insert into persons (id, name, surname, adress, dateofbirth) values (642, 'Adrian', 'Cordell', '313 Trailsway Alley', '1997-06-12');
insert into persons (id, name, surname, adress, dateofbirth) values (643, 'Mal', 'Thaine', '51109 Charing Cross Way', '1992-09-22');
insert into persons (id, name, surname, adress, dateofbirth) values (644, 'Roy', 'McGerraghty', '846 Fallview Alley', '1984-08-12');
insert into persons (id, name, surname, adress, dateofbirth) values (645, 'Marcile', 'Whisson', '4654 Schurz Court', '2000-07-08');
insert into persons (id, name, surname, adress, dateofbirth) values (646, 'Cointon', 'Symcox', '303 Westerfield Street', '1975-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (647, 'Ludovika', 'Camblin', '855 Valley Edge Plaza', '1993-12-20');
insert into persons (id, name, surname, adress, dateofbirth) values (648, 'Mendel', 'Gingell', '3 Paget Terrace', '1992-10-22');
insert into persons (id, name, surname, adress, dateofbirth) values (649, 'Pet', 'Cookman', '492 Vahlen Street', '1974-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (650, 'Nye', 'Schulken', '29236 Ronald Regan Parkway', '2003-10-02');
insert into persons (id, name, surname, adress, dateofbirth) values (651, 'Ikey', 'Gary', '99 Esch Court', '2003-02-02');
insert into persons (id, name, surname, adress, dateofbirth) values (652, 'Jeanie', 'Gresswell', '3 Clyde Gallagher Avenue', '1994-11-20');
insert into persons (id, name, surname, adress, dateofbirth) values (653, 'Nikolos', 'Ramsbottom', '0625 Sherman Drive', '2008-09-26');
insert into persons (id, name, surname, adress, dateofbirth) values (654, 'Ursa', 'Feehan', '6950 Petterle Street', '1978-04-15');
insert into persons (id, name, surname, adress, dateofbirth) values (655, 'Zed', 'Axelbey', '06064 Sycamore Lane', '2013-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (656, 'Rainer', 'Tingle', '512 Old Shore Avenue', '1974-03-14');
insert into persons (id, name, surname, adress, dateofbirth) values (657, 'Stella', 'McGirl', '0358 Corscot Pass', '2006-03-09');
insert into persons (id, name, surname, adress, dateofbirth) values (658, 'Alick', 'O''Carran', '90 North Lane', '1981-06-02');
insert into persons (id, name, surname, adress, dateofbirth) values (659, 'Regen', 'Finicj', '301 Dwight Point', '2000-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (660, 'Sigvard', 'Quinnelly', '72 Northview Terrace', '1971-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (661, 'Cary', 'Andress', '074 Shopko Junction', '1987-09-07');
insert into persons (id, name, surname, adress, dateofbirth) values (662, 'Edd', 'Downage', '11265 Dexter Parkway', '2014-10-23');
insert into persons (id, name, surname, adress, dateofbirth) values (663, 'Brennen', 'Senchenko', '09248 Dovetail Trail', '2014-10-18');
insert into persons (id, name, surname, adress, dateofbirth) values (664, 'Prissie', 'Trowell', '0742 Lyons Street', '1981-02-17');
insert into persons (id, name, surname, adress, dateofbirth) values (665, 'Tucky', 'Dobbie', '71376 Jenna Pass', '1972-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (666, 'Cris', 'McCroary', '4 Beilfuss Park', '1985-04-02');
insert into persons (id, name, surname, adress, dateofbirth) values (667, 'Wanids', 'Pawels', '324 Almo Plaza', '1974-12-09');
insert into persons (id, name, surname, adress, dateofbirth) values (668, 'Elisabetta', 'Lamblin', '2483 Pleasure Trail', '2002-05-27');
insert into persons (id, name, surname, adress, dateofbirth) values (669, 'Rudd', 'Biagini', '928 American Court', '1990-09-25');
insert into persons (id, name, surname, adress, dateofbirth) values (670, 'Clair', 'Smallsman', '66082 Waywood Road', '2007-12-15');
insert into persons (id, name, surname, adress, dateofbirth) values (671, 'Evan', 'Maylott', '951 Heath Avenue', '2001-07-06');
insert into persons (id, name, surname, adress, dateofbirth) values (672, 'Annie', 'Avann', '5264 Harbort Junction', '1992-04-04');
insert into persons (id, name, surname, adress, dateofbirth) values (673, 'Maddie', 'Chipman', '07221 Cherokee Hill', '1980-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (674, 'Milena', 'Carney', '7 Barby Lane', '2013-10-05');
insert into persons (id, name, surname, adress, dateofbirth) values (675, 'Durante', 'Kimm', '3583 Novick Junction', '1990-02-23');
insert into persons (id, name, surname, adress, dateofbirth) values (676, 'Emanuel', 'Skelly', '2 Dryden Road', '1994-07-24');
insert into persons (id, name, surname, adress, dateofbirth) values (677, 'Nadeen', 'McQuilliam', '182 Amoth Drive', '1988-03-05');
insert into persons (id, name, surname, adress, dateofbirth) values (678, 'Alec', 'Dunstone', '9 Grim Center', '1983-12-09');
insert into persons (id, name, surname, adress, dateofbirth) values (679, 'Chelsey', 'Keeping', '3 Bayside Pass', '1980-03-04');
insert into persons (id, name, surname, adress, dateofbirth) values (680, 'Emmanuel', 'L''Homme', '50449 Talisman Court', '1978-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (681, 'Randolf', 'Bricket', '7 Jana Pass', '1999-12-22');
insert into persons (id, name, surname, adress, dateofbirth) values (682, 'Prentiss', 'MacArthur', '9171 Spohn Hill', '2015-04-07');
insert into persons (id, name, surname, adress, dateofbirth) values (683, 'Abdel', 'Coulthard', '7 North Alley', '2009-12-07');
insert into persons (id, name, surname, adress, dateofbirth) values (684, 'Enriqueta', 'Braddick', '14671 Kensington Trail', '1972-05-23');
insert into persons (id, name, surname, adress, dateofbirth) values (685, 'Rayner', 'Jeffcoat', '215 Nevada Place', '2000-05-16');
insert into persons (id, name, surname, adress, dateofbirth) values (686, 'Maximilian', 'Salerno', '4 Old Shore Place', '2009-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (687, 'Alvera', 'Volkers', '30 Buena Vista Hill', '1998-07-23');
insert into persons (id, name, surname, adress, dateofbirth) values (688, 'Hillyer', 'Cundict', '128 Dakota Trail', '1992-08-06');
insert into persons (id, name, surname, adress, dateofbirth) values (689, 'Garth', 'Eccleshall', '12 Northport Place', '1977-09-17');
insert into persons (id, name, surname, adress, dateofbirth) values (690, 'Meris', 'Itscowicz', '65 Acker Pass', '1996-11-15');
insert into persons (id, name, surname, adress, dateofbirth) values (691, 'Denis', 'Fawdery', '60205 Derek Plaza', '2004-05-12');
insert into persons (id, name, surname, adress, dateofbirth) values (692, 'Alidia', 'Keywood', '4 Northport Plaza', '1990-09-10');
insert into persons (id, name, surname, adress, dateofbirth) values (693, 'Fran', 'Kiellor', '9300 Continental Pass', '1990-11-18');
insert into persons (id, name, surname, adress, dateofbirth) values (694, 'Fifine', 'Franceschelli', '9333 Manitowish Trail', '2007-01-08');
insert into persons (id, name, surname, adress, dateofbirth) values (695, 'Beulah', 'Gerardi', '0536 Rusk Place', '1995-11-10');
insert into persons (id, name, surname, adress, dateofbirth) values (696, 'Christabel', 'Ferrige', '5 Norway Maple Hill', '1987-12-25');
insert into persons (id, name, surname, adress, dateofbirth) values (697, 'Emmott', 'Buttner', '049 Stang Parkway', '1972-01-16');
insert into persons (id, name, surname, adress, dateofbirth) values (698, 'Nerte', 'Moatt', '29 Fordem Parkway', '2007-06-17');
insert into persons (id, name, surname, adress, dateofbirth) values (699, 'Shanna', 'Huckin', '3 Weeping Birch Pass', '1988-11-01');
insert into persons (id, name, surname, adress, dateofbirth) values (700, 'Nelli', 'Stenyng', '46 Vidon Pass', '1984-11-23');
insert into persons (id, name, surname, adress, dateofbirth) values (701, 'Marian', 'Coult', '8 Oriole Avenue', '1994-05-25');
insert into persons (id, name, surname, adress, dateofbirth) values (702, 'Merrill', 'Adamek', '45 Mayer Hill', '2003-04-30');
insert into persons (id, name, surname, adress, dateofbirth) values (703, 'Sergei', 'Cooke', '24056 Twin Pines Hill', '1983-12-20');
insert into persons (id, name, surname, adress, dateofbirth) values (704, 'Trescha', 'Physic', '839 Colorado Way', '1985-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (705, 'Denney', 'Gillham', '9403 Westerfield Point', '1985-12-25');
insert into persons (id, name, surname, adress, dateofbirth) values (706, 'Sancho', 'Stive', '226 Dennis Road', '1987-07-27');
insert into persons (id, name, surname, adress, dateofbirth) values (707, 'Georges', 'Delany', '65 3rd Way', '1971-02-28');
insert into persons (id, name, surname, adress, dateofbirth) values (708, 'Carly', 'Penticost', '4 Dwight Avenue', '2015-04-28');
insert into persons (id, name, surname, adress, dateofbirth) values (709, 'Lanette', 'Titmuss', '0699 Graceland Drive', '2007-11-21');
insert into persons (id, name, surname, adress, dateofbirth) values (710, 'Ned', 'Dugood', '2390 Ronald Regan Point', '1971-01-28');
insert into persons (id, name, surname, adress, dateofbirth) values (711, 'Odell', 'Durgan', '850 Chive Parkway', '2005-01-26');
insert into persons (id, name, surname, adress, dateofbirth) values (712, 'Doll', 'Somers', '9 7th Center', '1979-10-01');
insert into persons (id, name, surname, adress, dateofbirth) values (713, 'Augie', 'Selby', '29 International Place', '2013-02-02');
insert into persons (id, name, surname, adress, dateofbirth) values (714, 'Nonnah', 'Cranmore', '0386 Spaight Center', '1977-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (715, 'Charlie', 'Kiddle', '461 Bartillon Junction', '1999-08-04');
insert into persons (id, name, surname, adress, dateofbirth) values (716, 'Lorrie', 'Riddick', '6499 Express Crossing', '1972-11-23');
insert into persons (id, name, surname, adress, dateofbirth) values (717, 'Warren', 'Nairn', '8 Birchwood Trail', '2000-05-08');
insert into persons (id, name, surname, adress, dateofbirth) values (718, 'Crawford', 'Smooth', '80 8th Park', '1999-02-12');
insert into persons (id, name, surname, adress, dateofbirth) values (719, 'Emmet', 'Oldis', '049 Talmadge Crossing', '1976-07-15');
insert into persons (id, name, surname, adress, dateofbirth) values (720, 'Spencer', 'Petrazzi', '3 Lake View Circle', '2002-02-15');
insert into persons (id, name, surname, adress, dateofbirth) values (721, 'Hollie', 'Rawood', '39040 Kim Trail', '2003-03-29');
insert into persons (id, name, surname, adress, dateofbirth) values (722, 'Michaelina', 'Hambridge', '4 Nancy Pass', '2001-02-22');
insert into persons (id, name, surname, adress, dateofbirth) values (723, 'Evered', 'Skyme', '40 Vernon Avenue', '1977-06-17');
insert into persons (id, name, surname, adress, dateofbirth) values (724, 'Stefanie', 'MacPharlain', '1 Summerview Hill', '1995-02-21');
insert into persons (id, name, surname, adress, dateofbirth) values (725, 'Burtie', 'Looby', '82 Fairfield Way', '1977-01-25');
insert into persons (id, name, surname, adress, dateofbirth) values (726, 'Cherida', 'Balentyne', '21019 Marcy Terrace', '1977-11-30');
insert into persons (id, name, surname, adress, dateofbirth) values (727, 'Othilia', 'Gonzalo', '4 Superior Junction', '2014-04-12');
insert into persons (id, name, surname, adress, dateofbirth) values (728, 'Marietta', 'McCrystal', '0792 Porter Plaza', '1981-04-12');
insert into persons (id, name, surname, adress, dateofbirth) values (729, 'Kirsti', 'Foli', '2929 Golf Course Alley', '1984-10-07');
insert into persons (id, name, surname, adress, dateofbirth) values (730, 'Ike', 'Slorance', '68 Old Shore Alley', '2014-07-14');
insert into persons (id, name, surname, adress, dateofbirth) values (731, 'Andras', 'Bartley', '0819 Rockefeller Center', '1972-02-18');
insert into persons (id, name, surname, adress, dateofbirth) values (732, 'Amy', 'Farquar', '9521 Troy Court', '2007-11-07');
insert into persons (id, name, surname, adress, dateofbirth) values (733, 'Alley', 'Marcinkowski', '017 Helena Terrace', '2006-08-03');
insert into persons (id, name, surname, adress, dateofbirth) values (734, 'Deirdre', 'Trousdell', '7385 Loomis Court', '2006-08-05');
insert into persons (id, name, surname, adress, dateofbirth) values (735, 'Sawyer', 'Cordel', '78 Mosinee Court', '2006-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (736, 'Ramon', 'Hurd', '47373 Knutson Road', '1985-04-23');
insert into persons (id, name, surname, adress, dateofbirth) values (737, 'Damian', 'Bingham', '438 Weeping Birch Terrace', '1986-04-27');
insert into persons (id, name, surname, adress, dateofbirth) values (738, 'Vincents', 'Ariss', '04077 Claremont Park', '1981-04-17');
insert into persons (id, name, surname, adress, dateofbirth) values (739, 'Amara', 'Quested', '57 Hooker Parkway', '2013-08-01');
insert into persons (id, name, surname, adress, dateofbirth) values (740, 'Leroy', 'Vakhrushin', '8 Mesta Drive', '1995-02-20');
insert into persons (id, name, surname, adress, dateofbirth) values (741, 'Shirline', 'Ummfrey', '75 Butterfield Hill', '1978-06-03');
insert into persons (id, name, surname, adress, dateofbirth) values (742, 'Nan', 'Hentze', '513 Fairview Street', '1997-01-17');
insert into persons (id, name, surname, adress, dateofbirth) values (743, 'Dyanna', 'Bedow', '016 Duke Drive', '1998-04-27');
insert into persons (id, name, surname, adress, dateofbirth) values (744, 'Davida', 'Corkish', '3263 Walton Hill', '1992-05-28');
insert into persons (id, name, surname, adress, dateofbirth) values (745, 'Richard', 'Cail', '93920 Scott Park', '1996-01-10');
insert into persons (id, name, surname, adress, dateofbirth) values (746, 'Gunther', 'Tesimon', '392 Badeau Hill', '1976-07-25');
insert into persons (id, name, surname, adress, dateofbirth) values (747, 'Caesar', 'Manis', '59 Calypso Park', '2007-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (748, 'Ermanno', 'Mager', '7382 High Crossing Alley', '2014-02-24');
insert into persons (id, name, surname, adress, dateofbirth) values (749, 'Cazzie', 'Chastan', '5 Anniversary Lane', '2000-04-01');
insert into persons (id, name, surname, adress, dateofbirth) values (750, 'Tersina', 'Palfreeman', '3355 Gale Parkway', '1997-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (751, 'Shena', 'McGrane', '408 Del Mar Pass', '2010-09-29');
insert into persons (id, name, surname, adress, dateofbirth) values (752, 'Kipp', 'Stanton', '1 Derek Point', '2010-03-02');
insert into persons (id, name, surname, adress, dateofbirth) values (753, 'Billi', 'Kehoe', '1 Rowland Lane', '1987-02-17');
insert into persons (id, name, surname, adress, dateofbirth) values (754, 'Augustin', 'McAster', '16 Green Ridge Park', '2004-07-17');
insert into persons (id, name, surname, adress, dateofbirth) values (755, 'Michelle', 'Hughland', '3285 Holmberg Trail', '1980-12-16');
insert into persons (id, name, surname, adress, dateofbirth) values (756, 'Rickie', 'Neno', '3592 Cottonwood Circle', '1977-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (757, 'Theda', 'Yarrall', '8931 Forest Dale Hill', '2007-03-16');
insert into persons (id, name, surname, adress, dateofbirth) values (758, 'Sharron', 'De Bellis', '291 Stephen Alley', '1976-08-15');
insert into persons (id, name, surname, adress, dateofbirth) values (759, 'Addia', 'Collinwood', '1 Westport Plaza', '2014-01-14');
insert into persons (id, name, surname, adress, dateofbirth) values (760, 'Krysta', 'Steinson', '2839 Main Street', '2010-08-17');
insert into persons (id, name, surname, adress, dateofbirth) values (761, 'Bron', 'Vaskov', '4740 Russell Park', '2000-03-20');
insert into persons (id, name, surname, adress, dateofbirth) values (762, 'Lydie', 'Perulli', '120 Schlimgen Hill', '1993-02-09');
insert into persons (id, name, surname, adress, dateofbirth) values (763, 'Judie', 'Giblin', '32 Green Ridge Lane', '2006-02-18');
insert into persons (id, name, surname, adress, dateofbirth) values (764, 'Boonie', 'Nickell', '58 Schurz Way', '1976-07-25');
insert into persons (id, name, surname, adress, dateofbirth) values (765, 'Dorene', 'Beidebeke', '9 Sunfield Parkway', '1990-04-01');
insert into persons (id, name, surname, adress, dateofbirth) values (766, 'Raimondo', 'McGrill', '209 Hintze Street', '1996-02-22');
insert into persons (id, name, surname, adress, dateofbirth) values (767, 'Curt', 'Kohter', '01 Florence Park', '1971-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (768, 'Aggy', 'Hulk', '77769 Florence Place', '1999-03-30');
insert into persons (id, name, surname, adress, dateofbirth) values (769, 'Thibaud', 'Letty', '89216 Homewood Place', '2014-08-31');
insert into persons (id, name, surname, adress, dateofbirth) values (770, 'Stu', 'McGirr', '45 Del Sol Pass', '2002-07-21');
insert into persons (id, name, surname, adress, dateofbirth) values (771, 'Cherish', 'Greenside', '2264 Farwell Street', '2006-09-29');
insert into persons (id, name, surname, adress, dateofbirth) values (772, 'Gerry', 'Rieger', '7171 Oak Circle', '2007-10-20');
insert into persons (id, name, surname, adress, dateofbirth) values (773, 'Sarita', 'Byford', '45391 Comanche Junction', '1975-09-22');
insert into persons (id, name, surname, adress, dateofbirth) values (774, 'Damon', 'Thridgould', '8292 Sachs Road', '1975-06-10');
insert into persons (id, name, surname, adress, dateofbirth) values (775, 'Araldo', 'Spreag', '47 Lakeland Point', '2008-06-15');
insert into persons (id, name, surname, adress, dateofbirth) values (776, 'Jesse', 'Tebbutt', '9735 Forest Run Point', '1973-08-22');
insert into persons (id, name, surname, adress, dateofbirth) values (777, 'Jemimah', 'Baron', '1067 Longview Junction', '1974-03-05');
insert into persons (id, name, surname, adress, dateofbirth) values (778, 'Fayette', 'Devericks', '18 Kensington Terrace', '1999-05-31');
insert into persons (id, name, surname, adress, dateofbirth) values (779, 'Donny', 'Bischof', '9 Schurz Place', '2010-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (780, 'Darby', 'Ewells', '590 Veith Circle', '2013-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (781, 'Abbie', 'Pleaden', '8078 Reindahl Drive', '1990-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (782, 'Leshia', 'Lautie', '1073 Sugar Parkway', '1981-02-21');
insert into persons (id, name, surname, adress, dateofbirth) values (783, 'Nollie', 'Donohue', '50531 La Follette Trail', '2001-05-16');
insert into persons (id, name, surname, adress, dateofbirth) values (784, 'Bernardine', 'Latan', '6625 Barby Terrace', '2003-12-01');
insert into persons (id, name, surname, adress, dateofbirth) values (785, 'Sandy', 'Hughson', '4 Holmberg Junction', '1982-11-26');
insert into persons (id, name, surname, adress, dateofbirth) values (786, 'Sheena', 'Geraudel', '07 Calypso Avenue', '1990-09-19');
insert into persons (id, name, surname, adress, dateofbirth) values (787, 'Jessika', 'Tunnick', '51622 Milwaukee Court', '1972-04-01');
insert into persons (id, name, surname, adress, dateofbirth) values (788, 'Barton', 'Bythell', '65864 Gateway Crossing', '1992-10-16');
insert into persons (id, name, surname, adress, dateofbirth) values (789, 'Mimi', 'Vondra', '24 Jenifer Point', '1994-06-27');
insert into persons (id, name, surname, adress, dateofbirth) values (790, 'Nadiya', 'Puddefoot', '1647 Kim Way', '2007-10-17');
insert into persons (id, name, surname, adress, dateofbirth) values (791, 'Austina', 'Bazelle', '66 Heath Circle', '2015-12-07');
insert into persons (id, name, surname, adress, dateofbirth) values (792, 'Wolf', 'Ferroli', '78596 Old Shore Pass', '1974-03-14');
insert into persons (id, name, surname, adress, dateofbirth) values (793, 'Berenice', 'Kippin', '890 Burning Wood Street', '2003-08-31');
insert into persons (id, name, surname, adress, dateofbirth) values (794, 'Shalom', 'Tovey', '65 Butternut Point', '1999-09-15');
insert into persons (id, name, surname, adress, dateofbirth) values (795, 'Michel', 'Sprackling', '8 Jay Street', '1974-08-14');
insert into persons (id, name, surname, adress, dateofbirth) values (796, 'Maggy', 'Gorling', '16438 Monterey Hill', '1999-05-07');
insert into persons (id, name, surname, adress, dateofbirth) values (797, 'Dido', 'Willwood', '948 Victoria Circle', '2000-07-17');
insert into persons (id, name, surname, adress, dateofbirth) values (798, 'Ariana', 'Scothron', '2283 Manitowish Lane', '2004-01-13');
insert into persons (id, name, surname, adress, dateofbirth) values (799, 'Del', 'Kemet', '16 Tony Pass', '1979-12-08');
insert into persons (id, name, surname, adress, dateofbirth) values (800, 'Trixie', 'Biddlestone', '24217 Larry Pass', '1988-10-24');
insert into persons (id, name, surname, adress, dateofbirth) values (801, 'Dacia', 'Nangle', '513 Arrowood Junction', '1983-08-05');
insert into persons (id, name, surname, adress, dateofbirth) values (802, 'Cristiano', 'Lodo', '743 Rowland Way', '2013-09-07');
insert into persons (id, name, surname, adress, dateofbirth) values (803, 'Shaylynn', 'Megainey', '861 Talmadge Avenue', '1994-10-13');
insert into persons (id, name, surname, adress, dateofbirth) values (804, 'Cheryl', 'Cogman', '38168 Basil Court', '1974-01-25');
insert into persons (id, name, surname, adress, dateofbirth) values (805, 'Arline', 'Melmoth', '4 Troy Hill', '2007-11-08');
insert into persons (id, name, surname, adress, dateofbirth) values (806, 'Cynthia', 'Shevell', '5934 Ilene Terrace', '1995-10-01');
insert into persons (id, name, surname, adress, dateofbirth) values (807, 'Cherry', 'Gianilli', '4 Moulton Terrace', '1976-07-03');
insert into persons (id, name, surname, adress, dateofbirth) values (808, 'Amalea', 'Whilde', '198 Clemons Parkway', '1986-05-04');
insert into persons (id, name, surname, adress, dateofbirth) values (809, 'Farah', 'Reye', '1 Erie Circle', '2004-07-13');
insert into persons (id, name, surname, adress, dateofbirth) values (810, 'Niki', 'Loyns', '227 Mallory Circle', '2001-08-10');
insert into persons (id, name, surname, adress, dateofbirth) values (811, 'Janifer', 'Hartles', '4 New Castle Park', '2012-10-01');
insert into persons (id, name, surname, adress, dateofbirth) values (812, 'Alphonso', 'Sterland', '6 Bashford Avenue', '1971-02-11');
insert into persons (id, name, surname, adress, dateofbirth) values (813, 'Pen', 'Brown', '917 Lotheville Crossing', '1979-09-17');
insert into persons (id, name, surname, adress, dateofbirth) values (814, 'Cybil', 'Hedgeley', '298 David Center', '2000-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (815, 'Helena', 'Ingles', '361 Jackson Avenue', '1999-09-24');
insert into persons (id, name, surname, adress, dateofbirth) values (816, 'Rachele', 'Pauluzzi', '1707 Badeau Circle', '1972-11-01');
insert into persons (id, name, surname, adress, dateofbirth) values (817, 'Dollie', 'Sabbatier', '7 Arkansas Plaza', '2003-01-28');
insert into persons (id, name, surname, adress, dateofbirth) values (818, 'Nahum', 'Instone', '4 International Street', '2004-01-06');
insert into persons (id, name, surname, adress, dateofbirth) values (819, 'Brynna', 'Brogiotti', '01475 Dovetail Alley', '2007-05-10');
insert into persons (id, name, surname, adress, dateofbirth) values (820, 'Ange', 'Attwool', '8719 Derek Street', '2005-01-27');
insert into persons (id, name, surname, adress, dateofbirth) values (821, 'Lauretta', 'Southcott', '3 Mallard Park', '1975-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (822, 'Hilda', 'McPhillimey', '0 Manitowish Park', '1975-02-20');
insert into persons (id, name, surname, adress, dateofbirth) values (823, 'Lombard', 'Wisham', '4261 Little Fleur Center', '1994-04-03');
insert into persons (id, name, surname, adress, dateofbirth) values (824, 'Decca', 'Branigan', '46214 Division Center', '2008-05-26');
insert into persons (id, name, surname, adress, dateofbirth) values (825, 'Monte', 'Chewter', '31053 Sheridan Terrace', '1978-12-31');
insert into persons (id, name, surname, adress, dateofbirth) values (826, 'Granville', 'Genn', '7857 Northport Parkway', '2004-05-15');
insert into persons (id, name, surname, adress, dateofbirth) values (827, 'Crissie', 'Chetter', '2814 Kensington Way', '1979-03-15');
insert into persons (id, name, surname, adress, dateofbirth) values (828, 'Edeline', 'Francie', '47973 Westerfield Lane', '1993-05-24');
insert into persons (id, name, surname, adress, dateofbirth) values (829, 'Brooks', 'Shaughnessy', '9503 Novick Trail', '2000-09-26');
insert into persons (id, name, surname, adress, dateofbirth) values (830, 'Axel', 'Presnall', '1 Crownhardt Trail', '2012-04-10');
insert into persons (id, name, surname, adress, dateofbirth) values (831, 'Berkeley', 'Rocca', '44590 Menomonie Point', '1991-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (832, 'Gerek', 'Rubica', '72660 Alpine Hill', '1981-07-10');
insert into persons (id, name, surname, adress, dateofbirth) values (833, 'Renado', 'Trappe', '195 Myrtle Center', '1995-09-15');
insert into persons (id, name, surname, adress, dateofbirth) values (834, 'Gradeigh', 'Weerdenburg', '9884 Ohio Pass', '1984-09-06');
insert into persons (id, name, surname, adress, dateofbirth) values (835, 'Luelle', 'Kimmins', '21 Petterle Park', '2005-05-03');
insert into persons (id, name, surname, adress, dateofbirth) values (836, 'Adelaide', 'Hulks', '81 Charing Cross Place', '2000-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (837, 'Karilynn', 'Huleatt', '3854 Corry Court', '1985-06-22');
insert into persons (id, name, surname, adress, dateofbirth) values (838, 'Katleen', 'Mayler', '93 Clove Terrace', '1985-06-29');
insert into persons (id, name, surname, adress, dateofbirth) values (839, 'Guillaume', 'Christensen', '77964 Oak Point', '1986-02-17');
insert into persons (id, name, surname, adress, dateofbirth) values (840, 'Heath', 'Yarnley', '15 Sloan Circle', '1998-10-28');
insert into persons (id, name, surname, adress, dateofbirth) values (841, 'Lona', 'Unstead', '718 Golf Course Crossing', '1974-11-26');
insert into persons (id, name, surname, adress, dateofbirth) values (842, 'Susanetta', 'Gavahan', '584 Johnson Parkway', '1987-02-23');
insert into persons (id, name, surname, adress, dateofbirth) values (843, 'Elane', 'Elies', '2347 Parkside Junction', '1993-08-01');
insert into persons (id, name, surname, adress, dateofbirth) values (844, 'Allyn', 'Youthed', '13 Kenwood Drive', '2009-05-29');
insert into persons (id, name, surname, adress, dateofbirth) values (845, 'Lorilyn', 'Demaid', '0 Elgar Plaza', '1976-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (846, 'Harriette', 'Daid', '449 Milwaukee Place', '2009-10-22');
insert into persons (id, name, surname, adress, dateofbirth) values (847, 'Halli', 'Myall', '95 Pankratz Center', '2001-02-26');
insert into persons (id, name, surname, adress, dateofbirth) values (848, 'Skippy', 'Volke', '81965 Cardinal Drive', '1983-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (849, 'Kayle', 'Dowzell', '85 Jay Alley', '1994-03-13');
insert into persons (id, name, surname, adress, dateofbirth) values (850, 'Loria', 'Chafer', '17 Anniversary Street', '1987-01-24');
insert into persons (id, name, surname, adress, dateofbirth) values (851, 'Mervin', 'Cholomin', '3 Lindbergh Lane', '1996-10-11');
insert into persons (id, name, surname, adress, dateofbirth) values (852, 'Nona', 'Constable', '3553 Manufacturers Alley', '2010-10-22');
insert into persons (id, name, surname, adress, dateofbirth) values (853, 'Antonina', 'Dericut', '2 Rusk Hill', '2010-01-04');
insert into persons (id, name, surname, adress, dateofbirth) values (854, 'Theresita', 'Cottem', '0406 Rigney Alley', '1992-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (855, 'Perren', 'Bourgourd', '0 Talisman Pass', '1995-01-23');
insert into persons (id, name, surname, adress, dateofbirth) values (856, 'Sidnee', 'Danielis', '98833 Waxwing Place', '1998-12-06');
insert into persons (id, name, surname, adress, dateofbirth) values (857, 'Antonin', 'Linay', '93 Westridge Court', '2002-02-18');
insert into persons (id, name, surname, adress, dateofbirth) values (858, 'Yehudi', 'Deavall', '746 Dexter Parkway', '2015-06-12');
insert into persons (id, name, surname, adress, dateofbirth) values (859, 'Baldwin', 'Olwen', '38713 Commercial Court', '1978-01-18');
insert into persons (id, name, surname, adress, dateofbirth) values (860, 'Lyndel', 'Ackerman', '0860 Schurz Point', '2009-12-19');
insert into persons (id, name, surname, adress, dateofbirth) values (861, 'Francine', 'Jelleman', '4499 Lerdahl Alley', '1979-12-22');
insert into persons (id, name, surname, adress, dateofbirth) values (862, 'Charil', 'Lippatt', '136 Drewry Avenue', '2009-11-09');
insert into persons (id, name, surname, adress, dateofbirth) values (863, 'Tanhya', 'Farryann', '9962 Di Loreto Court', '1993-08-21');
insert into persons (id, name, surname, adress, dateofbirth) values (864, 'Gilbertine', 'Suttie', '5750 Fieldstone Lane', '2002-04-09');
insert into persons (id, name, surname, adress, dateofbirth) values (865, 'Clary', 'McShea', '21721 Transport Alley', '2007-03-28');
insert into persons (id, name, surname, adress, dateofbirth) values (866, 'Richy', 'Doding', '113 Sunnyside Avenue', '1994-05-15');
insert into persons (id, name, surname, adress, dateofbirth) values (867, 'Jamima', 'Teasdale', '76135 Summit Drive', '2000-07-30');
insert into persons (id, name, surname, adress, dateofbirth) values (868, 'Claybourne', 'Mole', '810 Briar Crest Court', '1997-06-13');
insert into persons (id, name, surname, adress, dateofbirth) values (869, 'Ambrose', 'Mynott', '512 School Hill', '1977-12-04');
insert into persons (id, name, surname, adress, dateofbirth) values (870, 'Jenine', 'Blayd', '15 Kinsman Trail', '1981-05-11');
insert into persons (id, name, surname, adress, dateofbirth) values (871, 'Tommie', 'Gossling', '7667 East Junction', '2003-01-20');
insert into persons (id, name, surname, adress, dateofbirth) values (872, 'Kalvin', 'Wood', '35542 Lerdahl Crossing', '1989-04-07');
insert into persons (id, name, surname, adress, dateofbirth) values (873, 'Gallard', 'Doutch', '854 Bunting Circle', '1971-04-02');
insert into persons (id, name, surname, adress, dateofbirth) values (874, 'Welsh', 'Billitteri', '463 Judy Park', '1987-01-07');
insert into persons (id, name, surname, adress, dateofbirth) values (875, 'Orel', 'Chidley', '25 Ridgeview Street', '1989-11-30');
insert into persons (id, name, surname, adress, dateofbirth) values (876, 'Beatrice', 'Thonger', '9 Carberry Place', '2011-04-06');
insert into persons (id, name, surname, adress, dateofbirth) values (877, 'Isaiah', 'Conor', '6 Mockingbird Trail', '2007-03-31');
insert into persons (id, name, surname, adress, dateofbirth) values (878, 'Willette', 'Thornborrow', '8824 West Trail', '2011-11-29');
insert into persons (id, name, surname, adress, dateofbirth) values (879, 'Clarette', 'Skillanders', '210 Sloan Trail', '2010-11-21');
insert into persons (id, name, surname, adress, dateofbirth) values (880, 'Urbain', 'Ludewig', '1 Thierer Avenue', '1990-02-07');
insert into persons (id, name, surname, adress, dateofbirth) values (881, 'Eula', 'Runciman', '846 Lindbergh Road', '2015-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (882, 'Jolene', 'Gedney', '7971 Chive Place', '1977-08-25');
insert into persons (id, name, surname, adress, dateofbirth) values (883, 'Kristine', 'Foulger', '312 Grasskamp Crossing', '2003-02-27');
insert into persons (id, name, surname, adress, dateofbirth) values (884, 'Bridget', 'O''Reilly', '9517 Erie Circle', '2015-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (885, 'Regina', 'Skurray', '3 Gina Parkway', '2000-02-18');
insert into persons (id, name, surname, adress, dateofbirth) values (886, 'Grenville', 'Goadsby', '24776 Mandrake Road', '2015-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (887, 'Grove', 'McGairl', '68196 Shoshone Circle', '1979-11-14');
insert into persons (id, name, surname, adress, dateofbirth) values (888, 'Noellyn', 'Joesbury', '37 Waubesa Crossing', '1986-08-29');
insert into persons (id, name, surname, adress, dateofbirth) values (889, 'Sapphira', 'Antyukhin', '360 Fordem Hill', '1981-07-09');
insert into persons (id, name, surname, adress, dateofbirth) values (890, 'Nat', 'Dakers', '672 Bunting Place', '2003-08-16');
insert into persons (id, name, surname, adress, dateofbirth) values (891, 'Sunny', 'Addicott', '4 Kennedy Park', '2009-08-16');
insert into persons (id, name, surname, adress, dateofbirth) values (892, 'Brucie', 'Santry', '66 American Ash Drive', '2010-04-02');
insert into persons (id, name, surname, adress, dateofbirth) values (893, 'Mignon', 'Creamen', '57671 Weeping Birch Drive', '2006-09-20');
insert into persons (id, name, surname, adress, dateofbirth) values (894, 'Heriberto', 'Stannas', '9 Erie Alley', '2002-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (895, 'Glennis', 'Angeli', '26 Brentwood Plaza', '1973-03-31');
insert into persons (id, name, surname, adress, dateofbirth) values (896, 'Nickolai', 'Roglieri', '301 Onsgard Hill', '2004-09-26');
insert into persons (id, name, surname, adress, dateofbirth) values (897, 'Rudolf', 'Churly', '91 Mariners Cove Center', '1979-04-26');
insert into persons (id, name, surname, adress, dateofbirth) values (898, 'Leroi', 'Fitkin', '67276 Lien Pass', '1997-11-25');
insert into persons (id, name, surname, adress, dateofbirth) values (899, 'Mahmud', 'Pendre', '267 Farragut Drive', '2013-06-24');
insert into persons (id, name, surname, adress, dateofbirth) values (900, 'Hendrik', 'Daniele', '1903 Utah Hill', '1980-11-06');
insert into persons (id, name, surname, adress, dateofbirth) values (901, 'Horace', 'Counihan', '84602 Butternut Drive', '1980-09-30');
insert into persons (id, name, surname, adress, dateofbirth) values (902, 'Melicent', 'Jessard', '0 Derek Lane', '2000-10-19');
insert into persons (id, name, surname, adress, dateofbirth) values (903, 'Toinette', 'Schirak', '02 Monica Drive', '1972-01-30');
insert into persons (id, name, surname, adress, dateofbirth) values (904, 'Abbi', 'Childes', '06960 Garrison Way', '2008-09-21');
insert into persons (id, name, surname, adress, dateofbirth) values (905, 'Mavra', 'Olcot', '7862 Elka Plaza', '1971-11-02');
insert into persons (id, name, surname, adress, dateofbirth) values (906, 'Laurel', 'Tomaschke', '21 Evergreen Place', '1973-03-19');
insert into persons (id, name, surname, adress, dateofbirth) values (907, 'Matty', 'Caulwell', '5 Jenifer Road', '1979-03-07');
insert into persons (id, name, surname, adress, dateofbirth) values (908, 'Randy', 'Gheerhaert', '44 Killdeer Parkway', '1994-02-25');
insert into persons (id, name, surname, adress, dateofbirth) values (909, 'Leland', 'Schurcke', '85209 Dwight Plaza', '1976-04-22');
insert into persons (id, name, surname, adress, dateofbirth) values (910, 'Layne', 'Paulig', '58507 Lien Terrace', '1982-09-18');
insert into persons (id, name, surname, adress, dateofbirth) values (911, 'Leona', 'Clethro', '4210 Elka Street', '1986-04-13');
insert into persons (id, name, surname, adress, dateofbirth) values (912, 'Finley', 'Letchford', '188 Westend Way', '1977-12-31');
insert into persons (id, name, surname, adress, dateofbirth) values (913, 'Jeannine', 'Pitsall', '436 Logan Hill', '1975-07-10');
insert into persons (id, name, surname, adress, dateofbirth) values (914, 'Drusilla', 'Stanfield', '393 Service Parkway', '2004-04-30');
insert into persons (id, name, surname, adress, dateofbirth) values (915, 'Bryant', 'Dreschler', '0699 Stuart Point', '2002-06-14');
insert into persons (id, name, surname, adress, dateofbirth) values (916, 'Hermy', 'Lipscomb', '7 Farmco Parkway', '1991-03-14');
insert into persons (id, name, surname, adress, dateofbirth) values (917, 'Addy', 'Lavigne', '6 Scofield Terrace', '2013-10-12');
insert into persons (id, name, surname, adress, dateofbirth) values (918, 'Ivor', 'Morrilly', '9 Longview Plaza', '1975-01-18');
insert into persons (id, name, surname, adress, dateofbirth) values (919, 'Stevana', 'Orrocks', '48 Raven Court', '1974-10-28');
insert into persons (id, name, surname, adress, dateofbirth) values (920, 'Aliza', 'Hannigane', '4106 Grayhawk Place', '1974-06-21');
insert into persons (id, name, surname, adress, dateofbirth) values (921, 'Stephana', 'Gerran', '5 Rockefeller Park', '1979-12-08');
insert into persons (id, name, surname, adress, dateofbirth) values (922, 'Kanya', 'Annetts', '8847 Grover Road', '1996-10-23');
insert into persons (id, name, surname, adress, dateofbirth) values (923, 'Venita', 'Hazart', '90143 Mayfield Terrace', '1982-09-02');
insert into persons (id, name, surname, adress, dateofbirth) values (924, 'Sara', 'Disney', '7897 Harper Road', '2006-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (925, 'Morgana', 'Tabourin', '61673 Sutherland Junction', '2003-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (926, 'Inna', 'Brognot', '47628 Stang Road', '1997-09-17');
insert into persons (id, name, surname, adress, dateofbirth) values (927, 'Sandy', 'Cookson', '30487 Forest Way', '1986-12-31');
insert into persons (id, name, surname, adress, dateofbirth) values (928, 'Minor', 'Maughan', '25 Lawn Crossing', '1977-02-04');
insert into persons (id, name, surname, adress, dateofbirth) values (929, 'Kordula', 'Alsop', '14 Lillian Junction', '2001-05-27');
insert into persons (id, name, surname, adress, dateofbirth) values (930, 'Miof mela', 'Lathwell', '42453 Ridgeview Alley', '2013-08-08');
insert into persons (id, name, surname, adress, dateofbirth) values (931, 'Marshall', 'Jickles', '5939 Rigney Road', '1977-07-04');
insert into persons (id, name, surname, adress, dateofbirth) values (932, 'Ximenez', 'Crayke', '99 Debra Park', '1990-09-30');
insert into persons (id, name, surname, adress, dateofbirth) values (933, 'Torrie', 'Painswick', '05492 Fieldstone Junction', '1994-04-25');
insert into persons (id, name, surname, adress, dateofbirth) values (934, 'Karry', 'Emtage', '31631 Florence Alley', '1974-05-27');
insert into persons (id, name, surname, adress, dateofbirth) values (935, 'Micah', 'Bartaloni', '98 Lakewood Gardens Crossing', '1984-01-17');
insert into persons (id, name, surname, adress, dateofbirth) values (936, 'Marius', 'Hopkins', '248 Scott Drive', '1985-09-21');
insert into persons (id, name, surname, adress, dateofbirth) values (937, 'Rosana', 'Orsay', '54162 Hoepker Place', '1996-04-12');
insert into persons (id, name, surname, adress, dateofbirth) values (938, 'Evanne', 'Hammill', '7646 Birchwood Terrace', '1979-02-27');
insert into persons (id, name, surname, adress, dateofbirth) values (939, 'Thaddus', 'Silkstone', '8458 Roth Circle', '1992-08-28');
insert into persons (id, name, surname, adress, dateofbirth) values (940, 'Kerri', 'Bensusan', '979 Vermont Way', '1984-01-07');
insert into persons (id, name, surname, adress, dateofbirth) values (941, 'Alvin', 'McGillreich', '98116 Old Shore Alley', '1991-04-22');
insert into persons (id, name, surname, adress, dateofbirth) values (942, 'Glynn', 'Negri', '5 Village Green Junction', '2006-11-21');
insert into persons (id, name, surname, adress, dateofbirth) values (943, 'Bell', 'Jenkyn', '4335 Pleasure Lane', '1983-08-13');
insert into persons (id, name, surname, adress, dateofbirth) values (944, 'Ash', 'Orrey', '54 Algoma Court', '2002-08-07');
insert into persons (id, name, surname, adress, dateofbirth) values (945, 'Roxi', 'Erasmus', '74 Birchwood Drive', '1975-08-08');
insert into persons (id, name, surname, adress, dateofbirth) values (946, 'Cyril', 'Gumb', '6218 Graedel Crossing', '2014-02-03');
insert into persons (id, name, surname, adress, dateofbirth) values (947, 'Renee', 'Codd', '84 Hagan Circle', '1972-06-15');
insert into persons (id, name, surname, adress, dateofbirth) values (948, 'Fawnia', 'Alyutin', '553 Green Park', '2002-03-02');
insert into persons (id, name, surname, adress, dateofbirth) values (949, 'Joannes', 'Nineham', '94 Buhler Trail', '2009-12-31');
insert into persons (id, name, surname, adress, dateofbirth) values (950, 'Evin', 'O''Currigan', '5 Fisk Crossing', '1981-09-12');
insert into persons (id, name, surname, adress, dateofbirth) values (951, 'Aveline', 'Wilber', '0968 Waywood Hill', '2001-04-11');
insert into persons (id, name, surname, adress, dateofbirth) values (952, 'Sharlene', 'Curnow', '584 Spaight Place', '2010-02-13');
insert into persons (id, name, surname, adress, dateofbirth) values (953, 'Agnese', 'Ginman', '8070 Eagle Crest Lane', '2014-11-23');
insert into persons (id, name, surname, adress, dateofbirth) values (954, 'Nealson', 'Ferran', '91229 Carpenter Trail', '1999-03-27');
insert into persons (id, name, surname, adress, dateofbirth) values (955, 'Towny', 'Birnie', '2472 Roxbury Place', '1976-09-02');
insert into persons (id, name, surname, adress, dateofbirth) values (956, 'Justin', 'Dibbs', '05362 Oak Valley Lane', '1994-08-04');
insert into persons (id, name, surname, adress, dateofbirth) values (957, 'Rochella', 'Howship', '48398 Londonderry Way', '2007-02-08');
insert into persons (id, name, surname, adress, dateofbirth) values (958, 'Adrienne', 'Boundley', '10 Milwaukee Crossing', '1998-07-03');
insert into persons (id, name, surname, adress, dateofbirth) values (959, 'Elka', 'Stolting', '7712 Service Trail', '2013-02-06');
insert into persons (id, name, surname, adress, dateofbirth) values (960, 'Nerita', 'Cawthra', '0 Continental Alley', '1999-05-25');
insert into persons (id, name, surname, adress, dateofbirth) values (961, 'Audy', 'Seson', '61 Wayridge Pass', '2001-12-18');
insert into persons (id, name, surname, adress, dateofbirth) values (962, 'Puff', 'Parsonson', '58 Sherman Drive', '2006-10-15');
insert into persons (id, name, surname, adress, dateofbirth) values (963, 'Caesar', 'Klimentyonok', '27455 Maple Wood Road', '1987-07-30');
insert into persons (id, name, surname, adress, dateofbirth) values (964, 'Matt', 'Barthot', '3 Vidon Trail', '1996-10-27');
insert into persons (id, name, surname, adress, dateofbirth) values (965, 'Magnum', 'Braznell', '83743 Melby Circle', '1993-11-17');
insert into persons (id, name, surname, adress, dateofbirth) values (966, 'Emmott', 'Hearle', '03 Muir Terrace', '1985-11-18');
insert into persons (id, name, surname, adress, dateofbirth) values (967, 'Aurel', 'Baird', '452 Eggendart Point', '1995-09-05');
insert into persons (id, name, surname, adress, dateofbirth) values (968, 'Stanly', 'MacRory', '52 Vermont Circle', '1978-09-03');
insert into persons (id, name, surname, adress, dateofbirth) values (969, 'Keven', 'Hambrick', '5 Jay Alley', '1973-03-05');
insert into persons (id, name, surname, adress, dateofbirth) values (970, 'Cayla', 'Sterre', '44 Carpenter Drive', '2015-07-23');
insert into persons (id, name, surname, adress, dateofbirth) values (971, 'Roderich', 'Welsby', '1090 Rigney Crossing', '2015-04-07');
insert into persons (id, name, surname, adress, dateofbirth) values (972, 'Kylen', 'Alejandri', '8 Butterfield Street', '2015-08-04');
insert into persons (id, name, surname, adress, dateofbirth) values (973, 'Harris', 'Sains', '29 Cambridge Street', '1986-02-01');
insert into persons (id, name, surname, adress, dateofbirth) values (974, 'Agatha', 'Jellis', '25 Namekagon Hill', '1993-12-24');
insert into persons (id, name, surname, adress, dateofbirth) values (975, 'Adelheid', 'Tyler', '4870 Mandrake Road', '2012-11-24');
insert into persons (id, name, surname, adress, dateofbirth) values (976, 'Kelci', 'McWaters', '19834 Macpherson Drive', '1981-05-16');
insert into persons (id, name, surname, adress, dateofbirth) values (977, 'Helenelizabeth', 'Hinners', '31 Hayes Drive', '1989-03-25');
insert into persons (id, name, surname, adress, dateofbirth) values (978, 'Giffard', 'Adney', '81299 Eastwood Hill', '1990-05-01');
insert into persons (id, name, surname, adress, dateofbirth) values (979, 'Abbie', 'Sambrook', '4 Linden Alley', '1977-04-29');
insert into persons (id, name, surname, adress, dateofbirth) values (980, 'Gregory', 'Arnowicz', '6752 Tennessee Way', '2003-12-26');
insert into persons (id, name, surname, adress, dateofbirth) values (981, 'Alysa', 'Fresson', '0628 6th Pass', '2014-07-19');
insert into persons (id, name, surname, adress, dateofbirth) values (982, 'Laney', 'Fydo', '057 Forest Run Drive', '2005-06-20');
insert into persons (id, name, surname, adress, dateofbirth) values (983, 'Aleksandr', 'Embleton', '64 Tennyson Drive', '1994-12-02');
insert into persons (id, name, surname, adress, dateofbirth) values (984, 'Rozanna', 'Kyston', '56 3rd Road', '1997-09-16');
insert into persons (id, name, surname, adress, dateofbirth) values (985, 'Diana', 'Hyndes', '6 Spenser Alley', '1980-10-29');
insert into persons (id, name, surname, adress, dateofbirth) values (986, 'Gasparo', 'Wimmers', '67072 Sachtjen Alley', '1974-03-06');
insert into persons (id, name, surname, adress, dateofbirth) values (987, 'Amaleta', 'Duigan', '521 Bellgrove Drive', '2004-10-09');
insert into persons (id, name, surname, adress, dateofbirth) values (988, 'Erastus', 'Cummine', '0904 Farragut Drive', '1979-01-13');
insert into persons (id, name, surname, adress, dateofbirth) values (989, 'Launce', 'Caroline', '82782 Ruskin Way', '1982-10-31');
insert into persons (id, name, surname, adress, dateofbirth) values (990, 'Eugenius', 'de Zamora', '1951 4th Junction', '2008-09-15');
insert into persons (id, name, surname, adress, dateofbirth) values (991, 'Flory', 'Dominetti', '34 Mayfield Way', '1995-06-17');
insert into persons (id, name, surname, adress, dateofbirth) values (992, 'Tiffi', 'Foan', '53380 Packers Terrace', '1994-05-09');
insert into persons (id, name, surname, adress, dateofbirth) values (993, 'Godart', 'Gabitis', '84134 Graceland Place', '2006-03-17');
insert into persons (id, name, surname, adress, dateofbirth) values (994, 'Godfry', 'Batchellor', '8480 Ohio Drive', '1987-01-14');
insert into persons (id, name, surname, adress, dateofbirth) values (995, 'Dillon', 'Pogue', '416 Sommers Road', '2002-03-12');
insert into persons (id, name, surname, adress, dateofbirth) values (996, 'Mommy', 'Brookfield', '9 Dayton Place', '1980-04-10');
insert into persons (id, name, surname, adress, dateofbirth) values (997, 'Stephanus', 'Guerner', '7230 West Park', '1992-12-22');
insert into persons (id, name, surname, adress, dateofbirth) values (998, 'Cecilla', 'Westfield', '9 Gale Parkway', '1997-09-12');
insert into persons (id, name, surname, adress, dateofbirth) values (999, 'Pat', 'Rohlf', '64255 Boyd Pass', '1995-01-10');
insert into persons (id, name, surname, adress, dateofbirth) values (1000, 'Micky', 'Sywell', '26 Birchwood Center', '2001-09-05');


insert into customers (id, loyaltycard) values (1, false);
insert into customers (id, loyaltycard) values (2, false);
insert into customers (id, loyaltycard) values (3, false);
insert into customers (id, loyaltycard) values (4, false);
insert into customers (id, loyaltycard) values (5, false);
insert into customers (id, loyaltycard) values (6, false);
insert into customers (id, loyaltycard) values (7, false);
insert into customers (id, loyaltycard) values (8, false);
insert into customers (id, loyaltycard) values (9, false);
insert into customers (id, loyaltycard) values (10, false);
insert into customers (id, loyaltycard) values (11, false);
insert into customers (id, loyaltycard) values (12, false);
insert into customers (id, loyaltycard) values (13, false);
insert into customers (id, loyaltycard) values (14, false);
insert into customers (id, loyaltycard) values (15, false);
insert into customers (id, loyaltycard) values (16, false);
insert into customers (id, loyaltycard) values (17, false);
insert into customers (id, loyaltycard) values (18, false);
insert into customers (id, loyaltycard) values (19, false);
insert into customers (id, loyaltycard) values (20, false);
insert into customers (id, loyaltycard) values (21, false);
insert into customers (id, loyaltycard) values (22, false);
insert into customers (id, loyaltycard) values (23, false);
insert into customers (id, loyaltycard) values (24, false);
insert into customers (id, loyaltycard) values (25, false);
insert into customers (id, loyaltycard) values (26, false);
insert into customers (id, loyaltycard) values (27, false);
insert into customers (id, loyaltycard) values (28, false);
insert into customers (id, loyaltycard) values (29, false);
insert into customers (id, loyaltycard) values (30, false);
insert into customers (id, loyaltycard) values (31, false);
insert into customers (id, loyaltycard) values (32, false);
insert into customers (id, loyaltycard) values (33, false);
insert into customers (id, loyaltycard) values (34, false);
insert into customers (id, loyaltycard) values (35, false);
insert into customers (id, loyaltycard) values (36, false);
insert into customers (id, loyaltycard) values (37, false);
insert into customers (id, loyaltycard) values (38, false);
insert into customers (id, loyaltycard) values (39, false);
insert into customers (id, loyaltycard) values (40, false);
insert into customers (id, loyaltycard) values (41, false);
insert into customers (id, loyaltycard) values (42, false);
insert into customers (id, loyaltycard) values (43, false);
insert into customers (id, loyaltycard) values (44, false);
insert into customers (id, loyaltycard) values (45, false);
insert into customers (id, loyaltycard) values (46, false);
insert into customers (id, loyaltycard) values (47, false);
insert into customers (id, loyaltycard) values (48, false);
insert into customers (id, loyaltycard) values (49, false);
insert into customers (id, loyaltycard) values (50, false);
insert into customers (id, loyaltycard) values (51, false);
insert into customers (id, loyaltycard) values (52, false);
insert into customers (id, loyaltycard) values (53, false);
insert into customers (id, loyaltycard) values (54, false);
insert into customers (id, loyaltycard) values (55, false);
insert into customers (id, loyaltycard) values (56, false);
insert into customers (id, loyaltycard) values (57, false);
insert into customers (id, loyaltycard) values (58, false);
insert into customers (id, loyaltycard) values (59, false);
insert into customers (id, loyaltycard) values (60, false);
insert into customers (id, loyaltycard) values (61, false);
insert into customers (id, loyaltycard) values (62, false);
insert into customers (id, loyaltycard) values (63, false);
insert into customers (id, loyaltycard) values (64, false);
insert into customers (id, loyaltycard) values (65, false);
insert into customers (id, loyaltycard) values (66, false);
insert into customers (id, loyaltycard) values (67, false);
insert into customers (id, loyaltycard) values (68, false);
insert into customers (id, loyaltycard) values (69, false);
insert into customers (id, loyaltycard) values (70, false);
insert into customers (id, loyaltycard) values (71, false);
insert into customers (id, loyaltycard) values (72, false);
insert into customers (id, loyaltycard) values (73, false);
insert into customers (id, loyaltycard) values (74, false);
insert into customers (id, loyaltycard) values (75, false);
insert into customers (id, loyaltycard) values (76, false);
insert into customers (id, loyaltycard) values (77, false);
insert into customers (id, loyaltycard) values (78, false);
insert into customers (id, loyaltycard) values (79, false);
insert into customers (id, loyaltycard) values (80, false);
insert into customers (id, loyaltycard) values (81, false);
insert into customers (id, loyaltycard) values (82, false);
insert into customers (id, loyaltycard) values (83, false);
insert into customers (id, loyaltycard) values (84, false);
insert into customers (id, loyaltycard) values (85, false);
insert into customers (id, loyaltycard) values (86, false);
insert into customers (id, loyaltycard) values (87, false);
insert into customers (id, loyaltycard) values (88, false);
insert into customers (id, loyaltycard) values (89, false);
insert into customers (id, loyaltycard) values (90, false);
insert into customers (id, loyaltycard) values (91, false);
insert into customers (id, loyaltycard) values (92, false);
insert into customers (id, loyaltycard) values (93, false);
insert into customers (id, loyaltycard) values (94, false);
insert into customers (id, loyaltycard) values (95, false);
insert into customers (id, loyaltycard) values (96, false);
insert into customers (id, loyaltycard) values (97, false);
insert into customers (id, loyaltycard) values (98, false);
insert into customers (id, loyaltycard) values (99, false);
insert into customers (id, loyaltycard) values (100, false);
insert into customers (id, loyaltycard) values (101, false);
insert into customers (id, loyaltycard) values (102, false);
insert into customers (id, loyaltycard) values (103, false);
insert into customers (id, loyaltycard) values (104, false);
insert into customers (id, loyaltycard) values (105, false);
insert into customers (id, loyaltycard) values (106, false);
insert into customers (id, loyaltycard) values (107, false);
insert into customers (id, loyaltycard) values (108, false);
insert into customers (id, loyaltycard) values (109, false);
insert into customers (id, loyaltycard) values (110, false);
insert into customers (id, loyaltycard) values (111, false);
insert into customers (id, loyaltycard) values (112, false);
insert into customers (id, loyaltycard) values (113, false);
insert into customers (id, loyaltycard) values (114, false);
insert into customers (id, loyaltycard) values (115, false);
insert into customers (id, loyaltycard) values (116, false);
insert into customers (id, loyaltycard) values (117, false);
insert into customers (id, loyaltycard) values (118, false);
insert into customers (id, loyaltycard) values (119, false);
insert into customers (id, loyaltycard) values (120, false);
insert into customers (id, loyaltycard) values (121, false);
insert into customers (id, loyaltycard) values (122, false);
insert into customers (id, loyaltycard) values (123, false);
insert into customers (id, loyaltycard) values (124, false);
insert into customers (id, loyaltycard) values (125, false);
insert into customers (id, loyaltycard) values (126, false);
insert into customers (id, loyaltycard) values (127, false);
insert into customers (id, loyaltycard) values (128, false);
insert into customers (id, loyaltycard) values (129, false);
insert into customers (id, loyaltycard) values (130, false);
insert into customers (id, loyaltycard) values (131, false);
insert into customers (id, loyaltycard) values (132, false);
insert into customers (id, loyaltycard) values (133, false);
insert into customers (id, loyaltycard) values (134, false);
insert into customers (id, loyaltycard) values (135, false);
insert into customers (id, loyaltycard) values (136, false);
insert into customers (id, loyaltycard) values (137, false);
insert into customers (id, loyaltycard) values (138, false);
insert into customers (id, loyaltycard) values (139, false);
insert into customers (id, loyaltycard) values (140, false);
insert into customers (id, loyaltycard) values (141, false);
insert into customers (id, loyaltycard) values (142, false);
insert into customers (id, loyaltycard) values (143, false);
insert into customers (id, loyaltycard) values (144, false);
insert into customers (id, loyaltycard) values (145, false);
insert into customers (id, loyaltycard) values (146, false);
insert into customers (id, loyaltycard) values (147, false);
insert into customers (id, loyaltycard) values (148, false);
insert into customers (id, loyaltycard) values (149, false);
insert into customers (id, loyaltycard) values (150, false);
insert into customers (id, loyaltycard) values (151, false);
insert into customers (id, loyaltycard) values (152, false);
insert into customers (id, loyaltycard) values (153, false);
insert into customers (id, loyaltycard) values (154, false);
insert into customers (id, loyaltycard) values (155, false);
insert into customers (id, loyaltycard) values (156, false);
insert into customers (id, loyaltycard) values (157, false);
insert into customers (id, loyaltycard) values (158, false);
insert into customers (id, loyaltycard) values (159, false);
insert into customers (id, loyaltycard) values (160, false);
insert into customers (id, loyaltycard) values (161, false);
insert into customers (id, loyaltycard) values (162, false);
insert into customers (id, loyaltycard) values (163, false);
insert into customers (id, loyaltycard) values (164, false);
insert into customers (id, loyaltycard) values (165, false);
insert into customers (id, loyaltycard) values (166, false);
insert into customers (id, loyaltycard) values (167, false);
insert into customers (id, loyaltycard) values (168, false);
insert into customers (id, loyaltycard) values (169, false);
insert into customers (id, loyaltycard) values (170, false);
insert into customers (id, loyaltycard) values (171, false);
insert into customers (id, loyaltycard) values (172, false);
insert into customers (id, loyaltycard) values (173, false);
insert into customers (id, loyaltycard) values (174, false);
insert into customers (id, loyaltycard) values (175, false);
insert into customers (id, loyaltycard) values (176, false);
insert into customers (id, loyaltycard) values (177, false);
insert into customers (id, loyaltycard) values (178, false);
insert into customers (id, loyaltycard) values (179, false);
insert into customers (id, loyaltycard) values (180, false);
insert into customers (id, loyaltycard) values (181, false);
insert into customers (id, loyaltycard) values (182, false);
insert into customers (id, loyaltycard) values (183, false);
insert into customers (id, loyaltycard) values (184, false);
insert into customers (id, loyaltycard) values (185, false);
insert into customers (id, loyaltycard) values (186, false);
insert into customers (id, loyaltycard) values (187, false);
insert into customers (id, loyaltycard) values (188, false);
insert into customers (id, loyaltycard) values (189, false);
insert into customers (id, loyaltycard) values (190, false);
insert into customers (id, loyaltycard) values (191, false);
insert into customers (id, loyaltycard) values (192, false);
insert into customers (id, loyaltycard) values (193, false);
insert into customers (id, loyaltycard) values (194, false);
insert into customers (id, loyaltycard) values (195, false);
insert into customers (id, loyaltycard) values (196, false);
insert into customers (id, loyaltycard) values (197, false);
insert into customers (id, loyaltycard) values (198, false);
insert into customers (id, loyaltycard) values (199, false);
insert into customers (id, loyaltycard) values (200, false);
insert into customers (id, loyaltycard) values (201, false);
insert into customers (id, loyaltycard) values (202, false);
insert into customers (id, loyaltycard) values (203, false);
insert into customers (id, loyaltycard) values (204, false);
insert into customers (id, loyaltycard) values (205, false);
insert into customers (id, loyaltycard) values (206, false);
insert into customers (id, loyaltycard) values (207, false);
insert into customers (id, loyaltycard) values (208, false);
insert into customers (id, loyaltycard) values (209, false);
insert into customers (id, loyaltycard) values (210, false);
insert into customers (id, loyaltycard) values (211, false);
insert into customers (id, loyaltycard) values (212, false);
insert into customers (id, loyaltycard) values (213, false);
insert into customers (id, loyaltycard) values (214, false);
insert into customers (id, loyaltycard) values (215, false);
insert into customers (id, loyaltycard) values (216, false);
insert into customers (id, loyaltycard) values (217, false);
insert into customers (id, loyaltycard) values (218, false);
insert into customers (id, loyaltycard) values (219, false);
insert into customers (id, loyaltycard) values (220, false);
insert into customers (id, loyaltycard) values (221, false);
insert into customers (id, loyaltycard) values (222, false);
insert into customers (id, loyaltycard) values (223, false);
insert into customers (id, loyaltycard) values (224, false);
insert into customers (id, loyaltycard) values (225, false);
insert into customers (id, loyaltycard) values (226, false);
insert into customers (id, loyaltycard) values (227, false);
insert into customers (id, loyaltycard) values (228, false);
insert into customers (id, loyaltycard) values (229, false);
insert into customers (id, loyaltycard) values (230, false);
insert into customers (id, loyaltycard) values (231, false);
insert into customers (id, loyaltycard) values (232, false);
insert into customers (id, loyaltycard) values (233, false);
insert into customers (id, loyaltycard) values (234, false);
insert into customers (id, loyaltycard) values (235, false);
insert into customers (id, loyaltycard) values (236, false);
insert into customers (id, loyaltycard) values (237, false);
insert into customers (id, loyaltycard) values (238, false);
insert into customers (id, loyaltycard) values (239, false);
insert into customers (id, loyaltycard) values (240, false);
insert into customers (id, loyaltycard) values (241, false);
insert into customers (id, loyaltycard) values (242, false);
insert into customers (id, loyaltycard) values (243, false);
insert into customers (id, loyaltycard) values (244, false);
insert into customers (id, loyaltycard) values (245, false);
insert into customers (id, loyaltycard) values (246, false);
insert into customers (id, loyaltycard) values (247, false);
insert into customers (id, loyaltycard) values (248, false);
insert into customers (id, loyaltycard) values (249, false);
insert into customers (id, loyaltycard) values (250, false);
insert into customers (id, loyaltycard) values (251, false);
insert into customers (id, loyaltycard) values (252, false);
insert into customers (id, loyaltycard) values (253, false);
insert into customers (id, loyaltycard) values (254, false);
insert into customers (id, loyaltycard) values (255, false);
insert into customers (id, loyaltycard) values (256, false);
insert into customers (id, loyaltycard) values (257, false);
insert into customers (id, loyaltycard) values (258, false);
insert into customers (id, loyaltycard) values (259, false);
insert into customers (id, loyaltycard) values (260, false);
insert into customers (id, loyaltycard) values (261, false);
insert into customers (id, loyaltycard) values (262, false);
insert into customers (id, loyaltycard) values (263, false);
insert into customers (id, loyaltycard) values (264, false);
insert into customers (id, loyaltycard) values (265, false);
insert into customers (id, loyaltycard) values (266, false);
insert into customers (id, loyaltycard) values (267, false);
insert into customers (id, loyaltycard) values (268, false);
insert into customers (id, loyaltycard) values (269, false);
insert into customers (id, loyaltycard) values (270, false);
insert into customers (id, loyaltycard) values (271, false);
insert into customers (id, loyaltycard) values (272, false);
insert into customers (id, loyaltycard) values (273, false);
insert into customers (id, loyaltycard) values (274, false);
insert into customers (id, loyaltycard) values (275, false);
insert into customers (id, loyaltycard) values (276, false);
insert into customers (id, loyaltycard) values (277, false);
insert into customers (id, loyaltycard) values (278, false);
insert into customers (id, loyaltycard) values (279, false);
insert into customers (id, loyaltycard) values (280, false);
insert into customers (id, loyaltycard) values (281, false);
insert into customers (id, loyaltycard) values (282, false);
insert into customers (id, loyaltycard) values (283, false);
insert into customers (id, loyaltycard) values (284, false);
insert into customers (id, loyaltycard) values (285, false);
insert into customers (id, loyaltycard) values (286, false);
insert into customers (id, loyaltycard) values (287, false);
insert into customers (id, loyaltycard) values (288, false);
insert into customers (id, loyaltycard) values (289, false);
insert into customers (id, loyaltycard) values (290, false);
insert into customers (id, loyaltycard) values (291, false);
insert into customers (id, loyaltycard) values (292, false);
insert into customers (id, loyaltycard) values (293, false);
insert into customers (id, loyaltycard) values (294, false);
insert into customers (id, loyaltycard) values (295, false);
insert into customers (id, loyaltycard) values (296, false);
insert into customers (id, loyaltycard) values (297, false);
insert into customers (id, loyaltycard) values (298, false);
insert into customers (id, loyaltycard) values (299, false);
insert into customers (id, loyaltycard) values (300, false);
insert into customers (id, loyaltycard) values (301, false);
insert into customers (id, loyaltycard) values (302, false);
insert into customers (id, loyaltycard) values (303, false);
insert into customers (id, loyaltycard) values (304, false);
insert into customers (id, loyaltycard) values (305, false);
insert into customers (id, loyaltycard) values (306, false);
insert into customers (id, loyaltycard) values (307, false);
insert into customers (id, loyaltycard) values (308, false);
insert into customers (id, loyaltycard) values (309, false);
insert into customers (id, loyaltycard) values (310, false);
insert into customers (id, loyaltycard) values (311, false);
insert into customers (id, loyaltycard) values (312, false);
insert into customers (id, loyaltycard) values (313, false);
insert into customers (id, loyaltycard) values (314, false);
insert into customers (id, loyaltycard) values (315, false);
insert into customers (id, loyaltycard) values (316, false);
insert into customers (id, loyaltycard) values (317, false);
insert into customers (id, loyaltycard) values (318, false);
insert into customers (id, loyaltycard) values (319, false);
insert into customers (id, loyaltycard) values (320, false);
insert into customers (id, loyaltycard) values (321, false);
insert into customers (id, loyaltycard) values (322, false);
insert into customers (id, loyaltycard) values (323, false);
insert into customers (id, loyaltycard) values (324, false);
insert into customers (id, loyaltycard) values (325, false);
insert into customers (id, loyaltycard) values (326, false);
insert into customers (id, loyaltycard) values (327, false);
insert into customers (id, loyaltycard) values (328, false);
insert into customers (id, loyaltycard) values (329, false);
insert into customers (id, loyaltycard) values (330, false);
insert into customers (id, loyaltycard) values (331, false);
insert into customers (id, loyaltycard) values (332, false);
insert into customers (id, loyaltycard) values (333, false);
insert into customers (id, loyaltycard) values (334, false);
insert into customers (id, loyaltycard) values (335, false);
insert into customers (id, loyaltycard) values (336, false);
insert into customers (id, loyaltycard) values (337, false);
insert into customers (id, loyaltycard) values (338, false);
insert into customers (id, loyaltycard) values (339, false);
insert into customers (id, loyaltycard) values (340, false);
insert into customers (id, loyaltycard) values (341, false);
insert into customers (id, loyaltycard) values (342, false);
insert into customers (id, loyaltycard) values (343, false);
insert into customers (id, loyaltycard) values (344, false);
insert into customers (id, loyaltycard) values (345, false);
insert into customers (id, loyaltycard) values (346, false);
insert into customers (id, loyaltycard) values (347, false);
insert into customers (id, loyaltycard) values (348, false);
insert into customers (id, loyaltycard) values (349, false);
insert into customers (id, loyaltycard) values (350, false);
insert into customers (id, loyaltycard) values (351, false);
insert into customers (id, loyaltycard) values (352, false);
insert into customers (id, loyaltycard) values (353, false);
insert into customers (id, loyaltycard) values (354, false);
insert into customers (id, loyaltycard) values (355, false);
insert into customers (id, loyaltycard) values (356, false);
insert into customers (id, loyaltycard) values (357, false);
insert into customers (id, loyaltycard) values (358, false);
insert into customers (id, loyaltycard) values (359, false);
insert into customers (id, loyaltycard) values (360, false);
insert into customers (id, loyaltycard) values (361, false);
insert into customers (id, loyaltycard) values (362, false);
insert into customers (id, loyaltycard) values (363, false);
insert into customers (id, loyaltycard) values (364, false);
insert into customers (id, loyaltycard) values (365, false);
insert into customers (id, loyaltycard) values (366, false);
insert into customers (id, loyaltycard) values (367, false);
insert into customers (id, loyaltycard) values (368, false);
insert into customers (id, loyaltycard) values (369, false);
insert into customers (id, loyaltycard) values (370, false);
insert into customers (id, loyaltycard) values (371, false);
insert into customers (id, loyaltycard) values (372, false);
insert into customers (id, loyaltycard) values (373, false);
insert into customers (id, loyaltycard) values (374, false);
insert into customers (id, loyaltycard) values (375, false);
insert into customers (id, loyaltycard) values (376, false);
insert into customers (id, loyaltycard) values (377, false);
insert into customers (id, loyaltycard) values (378, false);
insert into customers (id, loyaltycard) values (379, false);
insert into customers (id, loyaltycard) values (380, false);
insert into customers (id, loyaltycard) values (381, false);
insert into customers (id, loyaltycard) values (382, false);
insert into customers (id, loyaltycard) values (383, false);
insert into customers (id, loyaltycard) values (384, false);
insert into customers (id, loyaltycard) values (385, false);
insert into customers (id, loyaltycard) values (386, false);
insert into customers (id, loyaltycard) values (387, false);
insert into customers (id, loyaltycard) values (388, false);
insert into customers (id, loyaltycard) values (389, false);
insert into customers (id, loyaltycard) values (390, false);
insert into customers (id, loyaltycard) values (391, false);
insert into customers (id, loyaltycard) values (392, false);
insert into customers (id, loyaltycard) values (393, false);
insert into customers (id, loyaltycard) values (394, false);
insert into customers (id, loyaltycard) values (395, false);
insert into customers (id, loyaltycard) values (396, false);
insert into customers (id, loyaltycard) values (397, false);
insert into customers (id, loyaltycard) values (398, false);
insert into customers (id, loyaltycard) values (399, false);
insert into customers (id, loyaltycard) values (400, false);
insert into customers (id, loyaltycard) values (401, false);
insert into customers (id, loyaltycard) values (402, false);
insert into customers (id, loyaltycard) values (403, false);
insert into customers (id, loyaltycard) values (404, false);
insert into customers (id, loyaltycard) values (405, false);
insert into customers (id, loyaltycard) values (406, false);
insert into customers (id, loyaltycard) values (407, false);
insert into customers (id, loyaltycard) values (408, false);
insert into customers (id, loyaltycard) values (409, false);
insert into customers (id, loyaltycard) values (410, false);
insert into customers (id, loyaltycard) values (411, false);
insert into customers (id, loyaltycard) values (412, false);
insert into customers (id, loyaltycard) values (413, false);
insert into customers (id, loyaltycard) values (414, false);
insert into customers (id, loyaltycard) values (415, false);
insert into customers (id, loyaltycard) values (416, false);
insert into customers (id, loyaltycard) values (417, false);
insert into customers (id, loyaltycard) values (418, false);
insert into customers (id, loyaltycard) values (419, false);
insert into customers (id, loyaltycard) values (420, false);
insert into customers (id, loyaltycard) values (421, false);
insert into customers (id, loyaltycard) values (422, false);
insert into customers (id, loyaltycard) values (423, false);
insert into customers (id, loyaltycard) values (424, false);
insert into customers (id, loyaltycard) values (425, false);
insert into customers (id, loyaltycard) values (426, false);
insert into customers (id, loyaltycard) values (427, false);
insert into customers (id, loyaltycard) values (428, false);
insert into customers (id, loyaltycard) values (429, false);
insert into customers (id, loyaltycard) values (430, false);
insert into customers (id, loyaltycard) values (431, false);
insert into customers (id, loyaltycard) values (432, false);
insert into customers (id, loyaltycard) values (433, false);
insert into customers (id, loyaltycard) values (434, false);
insert into customers (id, loyaltycard) values (435, false);
insert into customers (id, loyaltycard) values (436, false);
insert into customers (id, loyaltycard) values (437, false);
insert into customers (id, loyaltycard) values (438, false);
insert into customers (id, loyaltycard) values (439, false);
insert into customers (id, loyaltycard) values (440, false);
insert into customers (id, loyaltycard) values (441, false);
insert into customers (id, loyaltycard) values (442, false);
insert into customers (id, loyaltycard) values (443, false);
insert into customers (id, loyaltycard) values (444, false);
insert into customers (id, loyaltycard) values (445, false);
insert into customers (id, loyaltycard) values (446, false);
insert into customers (id, loyaltycard) values (447, false);
insert into customers (id, loyaltycard) values (448, false);
insert into customers (id, loyaltycard) values (449, false);
insert into customers (id, loyaltycard) values (450, false);
insert into customers (id, loyaltycard) values (451, false);
insert into customers (id, loyaltycard) values (452, false);
insert into customers (id, loyaltycard) values (453, false);
insert into customers (id, loyaltycard) values (454, false);
insert into customers (id, loyaltycard) values (455, false);
insert into customers (id, loyaltycard) values (456, false);
insert into customers (id, loyaltycard) values (457, false);
insert into customers (id, loyaltycard) values (458, false);
insert into customers (id, loyaltycard) values (459, false);
insert into customers (id, loyaltycard) values (460, false);
insert into customers (id, loyaltycard) values (461, false);
insert into customers (id, loyaltycard) values (462, false);
insert into customers (id, loyaltycard) values (463, false);
insert into customers (id, loyaltycard) values (464, false);
insert into customers (id, loyaltycard) values (465, false);
insert into customers (id, loyaltycard) values (466, false);
insert into customers (id, loyaltycard) values (467, false);
insert into customers (id, loyaltycard) values (468, false);
insert into customers (id, loyaltycard) values (469, false);
insert into customers (id, loyaltycard) values (470, false);
insert into customers (id, loyaltycard) values (471, false);
insert into customers (id, loyaltycard) values (472, false);
insert into customers (id, loyaltycard) values (473, false);
insert into customers (id, loyaltycard) values (474, false);
insert into customers (id, loyaltycard) values (475, false);
insert into customers (id, loyaltycard) values (476, false);
insert into customers (id, loyaltycard) values (477, false);
insert into customers (id, loyaltycard) values (478, false);
insert into customers (id, loyaltycard) values (479, false);
insert into customers (id, loyaltycard) values (480, false);
insert into customers (id, loyaltycard) values (481, false);
insert into customers (id, loyaltycard) values (482, false);
insert into customers (id, loyaltycard) values (483, false);
insert into customers (id, loyaltycard) values (484, false);
insert into customers (id, loyaltycard) values (485, false);
insert into customers (id, loyaltycard) values (486, false);
insert into customers (id, loyaltycard) values (487, false);
insert into customers (id, loyaltycard) values (488, false);
insert into customers (id, loyaltycard) values (489, false);
insert into customers (id, loyaltycard) values (490, false);
insert into customers (id, loyaltycard) values (491, false);
insert into customers (id, loyaltycard) values (492, false);
insert into customers (id, loyaltycard) values (493, false);
insert into customers (id, loyaltycard) values (494, false);
insert into customers (id, loyaltycard) values (495, false);
insert into customers (id, loyaltycard) values (496, false);
insert into customers (id, loyaltycard) values (497, false);
insert into customers (id, loyaltycard) values (498, false);
insert into customers (id, loyaltycard) values (499, false);
insert into customers (id, loyaltycard) values (500, false);


insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (1, 'Buta', 190, 1, '9:38:00', '18:10:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (2, 'PlanB', 118, 1, '7:45:58', '13:35:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (3, 'Odmor', 33, 1, '7:04:48', '19:47:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (4, 'Spiza', 82, 1, '10:29:45', '19:59:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (5, 'Restoran Maslina', 142, 1, '10:06:01', '21:38:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (6, 'Zoombox', 141, 1, '9:17:36', '13:47:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (7, 'Avamba', 27, 10, '10:08:17', '13:26:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (8, 'Eadel', 146, 3, '7:38:08', '21:49:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (9, 'Eimbee', 162, 7, '9:34:26', '20:15:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (10, 'Zoonoodle', 61, 9, '8:36:30', '17:52:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (11, 'Realfire', 190, 3, '10:56:08', '14:22:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (12, 'Pixonyx', 126, 9, '7:30:55', '19:42:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (13, 'Edgeclub', 29, 9, '8:37:48', '17:19:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (14, 'Aibox', 199, 5, '9:09:03', '15:37:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (15, 'Browseblab', 43, 9, '7:32:56', '14:27:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (16, 'Skinder', 89, 3, '8:58:41', '20:43:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (17, 'Vidoo', 91, 10, '10:44:36', '20:25:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (18, 'Jaloo', 54, 4, '9:18:44', '18:19:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (19, 'Meembee', 174, 10, '8:07:36', '21:21:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (20, 'Edgeblab', 136, 7, '7:51:32', '19:12:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (21, 'Flipbug', 94, 3, '9:42:37', '19:50:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (22, 'Meevee', 70, 10, '8:33:27', '12:47:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (23, 'Kaymbo', 113, 9, '9:33:18', '14:49:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (24, 'Thoughtbeat', 147, 2, '8:36:09', '12:20:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (25, 'Brightdog', 48, 5, '7:08:45', '17:34:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (26, 'Eayo', 143, 3, '7:33:24', '16:16:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (27, 'Topdrive', 182, 8, '9:10:40', '13:25:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (28, 'Tazzy', 145, 3, '10:57:17', '20:40:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (29, 'Livefish', 151, 4, '10:35:11', '18:36:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (30, 'JumpXS', 197, 8, '10:09:22', '18:02:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (31, 'Gabvine', 107, 10, '9:25:17', '19:28:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (32, 'Fadeo', 187, 9, '10:19:26', '14:55:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (33, 'Zoombox', 132, 2, '9:51:40', '19:42:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (34, 'Yotz', 92, 7, '8:59:23', '18:49:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (35, 'Twitterbridge', 74, 9, '7:35:19', '18:54:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (36, 'Linktype', 17, 1, '8:51:02', '21:36:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (37, 'Zoonder', 113, 6, '7:17:55', '16:19:52');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (38, 'Topicshots', 138, 1, '10:01:16', '21:00:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (39, 'Bluezoom', 96, 9, '8:11:15', '14:29:54');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (40, 'Skipfire', 127, 2, '10:37:40', '14:09:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (41, 'Yabox', 118, 6, '7:46:02', '21:52:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (42, 'Tanoodle', 127, 2, '7:39:41', '15:31:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (43, 'Oyoyo', 95, 8, '8:09:08', '13:48:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (44, 'Jaxbean', 57, 3, '8:14:45', '18:41:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (45, 'Brainlounge', 82, 5, '8:33:28', '21:07:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (46, 'Aimbu', 156, 7, '10:29:24', '13:11:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (47, 'Buzzbean', 88, 7, '7:06:42', '17:22:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (48, 'Snaptags', 111, 8, '8:44:01', '18:35:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (49, 'Miboo', 102, 4, '8:29:10', '19:36:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (50, 'Browsecat', 181, 3, '8:37:50', '18:40:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (51, 'Meemm', 167, 2, '8:50:01', '20:23:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (52, 'Trunyx', 30, 2, '9:35:36', '17:08:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (53, 'Dynazzy', 94, 5, '7:37:54', '14:53:22');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (54, 'Zoombeat', 21, 8, '8:44:28', '20:49:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (55, 'Kazu', 120, 3, '9:19:26', '16:04:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (56, 'Digitube', 197, 6, '7:51:48', '13:39:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (57, 'Eazzy', 174, 1, '8:34:13', '18:54:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (58, 'Edgeblab', 16, 4, '9:42:54', '16:10:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (59, 'Devcast', 105, 8, '8:42:26', '18:26:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (60, 'Blogtag', 86, 8, '7:55:51', '17:47:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (61, 'Gigaclub', 21, 10, '9:46:09', '18:57:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (62, 'Midel', 113, 3, '9:27:39', '15:09:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (63, 'Bluezoom', 44, 2, '8:15:15', '21:25:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (64, 'Pixope', 167, 9, '9:33:38', '19:17:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (65, 'Miboo', 107, 10, '8:38:04', '12:38:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (66, 'Feedfish', 65, 4, '7:55:33', '21:46:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (67, 'Thoughtsphere', 16, 1, '8:10:23', '16:36:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (68, 'Youopia', 50, 3, '8:32:54', '20:06:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (69, 'Yoveo', 27, 10, '7:49:02', '17:00:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (70, 'Eare', 114, 8, '10:04:43', '12:29:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (71, 'Flashpoint', 109, 10, '7:02:16', '20:50:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (72, 'Voonyx', 51, 2, '7:34:15', '19:10:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (73, 'Meejo', 34, 7, '8:31:39', '14:02:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (74, 'Thoughtbridge', 110, 10, '8:36:28', '18:47:47');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (75, 'Jamia', 103, 10, '7:21:26', '20:54:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (76, 'Quimba', 176, 9, '10:07:20', '12:02:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (77, 'Divavu', 27, 2, '7:51:18', '14:30:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (78, 'Yambee', 181, 6, '8:46:31', '13:35:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (79, 'Quinu', 94, 4, '9:28:12', '15:31:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (80, 'Centimia', 106, 6, '9:23:30', '17:55:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (81, 'Photobean', 12, 9, '10:51:56', '21:10:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (82, 'Devify', 12, 7, '7:53:10', '21:11:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (83, 'Skivee', 191, 10, '10:39:29', '19:19:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (84, 'Cogibox', 131, 10, '10:14:39', '14:48:38');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (85, 'Geba', 155, 7, '9:45:59', '14:32:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (86, 'Jayo', 34, 10, '10:51:06', '15:53:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (87, 'Demimbu', 31, 5, '7:36:22', '21:20:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (88, 'Dazzlesphere', 108, 7, '8:45:00', '20:07:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (89, 'Zoombeat', 166, 10, '10:41:46', '19:58:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (90, 'Wordtune', 84, 1, '7:14:33', '18:17:38');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (91, 'Quatz', 124, 4, '8:32:06', '20:36:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (92, 'Thoughtstorm', 42, 5, '7:00:17', '13:07:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (93, 'Brainlounge', 12, 2, '7:20:04', '17:42:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (94, 'Jetwire', 87, 3, '8:26:20', '21:27:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (95, 'Tagtune', 66, 2, '10:17:53', '13:27:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (96, 'Realblab', 176, 7, '8:25:23', '13:08:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (97, 'Voonyx', 48, 4, '10:55:30', '17:08:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (98, 'Divanoodle', 132, 6, '8:22:06', '17:03:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (99, 'Gabvine', 24, 5, '8:46:40', '19:32:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (100, 'Meedoo', 158, 4, '8:18:25', '16:06:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (101, 'Fatz', 149, 7, '9:27:46', '21:44:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (102, 'Pixoboo', 183, 1, '9:37:33', '21:48:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (103, 'Topiclounge', 58, 4, '9:37:51', '15:06:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (104, 'Cogilith', 187, 7, '8:28:43', '13:24:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (105, 'Dabfeed', 159, 3, '8:34:02', '15:11:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (106, 'Dabvine', 105, 8, '7:14:21', '15:16:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (107, 'Yotz', 57, 2, '8:11:57', '16:06:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (108, 'Skyble', 141, 6, '8:21:22', '18:49:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (109, 'Rhyzio', 185, 1, '9:30:37', '18:55:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (110, 'Twitterlist', 192, 1, '8:56:52', '13:57:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (111, 'Omba', 79, 1, '8:24:15', '21:59:15');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (112, 'Devbug', 159, 6, '10:08:52', '21:15:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (113, 'Dynabox', 176, 7, '7:07:55', '17:42:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (114, 'Divavu', 37, 8, '10:24:08', '12:39:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (115, 'Realpoint', 32, 8, '10:38:56', '21:48:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (116, 'Vidoo', 28, 6, '7:59:17', '20:40:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (117, 'Yotz', 173, 9, '8:21:47', '14:28:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (118, 'Dynava', 169, 4, '7:34:53', '21:01:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (119, 'Zooxo', 145, 1, '8:29:14', '17:52:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (120, 'Yadel', 81, 3, '10:35:33', '12:02:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (121, 'Livetube', 153, 3, '10:31:19', '14:24:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (122, 'Fiveclub', 99, 3, '9:54:00', '21:26:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (123, 'Fadeo', 107, 10, '9:24:25', '19:01:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (124, 'Browsedrive', 67, 10, '7:40:33', '13:57:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (125, 'Jatri', 164, 5, '9:00:56', '17:27:52');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (126, 'Feedbug', 135, 7, '9:06:27', '21:21:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (127, 'Meeveo', 30, 6, '8:16:58', '13:00:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (128, 'Mydo', 67, 6, '9:36:06', '17:50:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (129, 'Ntag', 191, 3, '10:54:23', '19:17:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (130, 'Vinder', 113, 5, '7:06:20', '13:15:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (131, 'Gevee', 58, 3, '9:56:04', '14:45:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (132, 'Yodel', 18, 4, '7:09:03', '14:51:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (133, 'Cogilith', 98, 6, '8:44:28', '15:09:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (134, 'Tagpad', 35, 5, '9:40:48', '15:20:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (135, 'Gabtune', 70, 9, '7:18:14', '15:59:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (136, 'Riffpedia', 111, 9, '7:44:48', '21:28:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (137, 'Oodoo', 62, 9, '9:10:52', '13:34:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (138, 'Kwideo', 27, 2, '10:25:03', '13:38:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (139, 'Zazio', 40, 6, '8:31:48', '20:11:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (140, 'Zoomlounge', 135, 5, '9:30:56', '17:23:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (141, 'Devcast', 138, 5, '10:42:47', '20:13:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (142, 'Skibox', 46, 9, '10:32:39', '21:22:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (143, 'Pixoboo', 136, 10, '9:40:53', '19:04:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (144, 'Oyoba', 112, 8, '7:11:32', '18:37:50');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (145, 'Izio', 144, 8, '9:13:46', '19:53:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (146, 'Kwilith', 38, 1, '9:57:34', '14:38:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (147, 'Gabcube', 124, 2, '7:56:41', '20:16:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (148, 'Voolith', 100, 6, '7:31:50', '17:39:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (149, 'Livetube', 10, 5, '7:30:04', '20:58:50');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (150, 'Flashpoint', 131, 3, '7:17:06', '20:12:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (151, 'Realpoint', 167, 5, '8:42:09', '16:43:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (152, 'Realfire', 134, 10, '7:45:09', '21:34:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (153, 'Skipfire', 44, 2, '8:16:12', '15:18:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (154, 'Skyba', 94, 10, '8:11:16', '17:44:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (155, 'Quinu', 53, 2, '8:50:55', '15:56:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (156, 'Eazzy', 130, 3, '7:10:28', '15:14:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (157, 'Eidel', 23, 8, '7:36:45', '13:49:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (158, 'Aivee', 19, 7, '7:53:06', '18:46:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (159, 'Tanoodle', 14, 7, '8:00:51', '12:06:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (160, 'Skinder', 56, 4, '10:08:05', '21:26:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (161, 'Cogilith', 129, 4, '7:47:30', '14:55:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (162, 'Tavu', 55, 3, '10:56:30', '17:03:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (163, 'Lajo', 197, 1, '8:09:46', '16:21:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (164, 'Zoovu', 173, 8, '7:15:23', '13:00:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (165, 'Oyoyo', 144, 4, '7:07:09', '18:51:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (166, 'Kwilith', 42, 7, '10:16:29', '19:28:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (167, 'Fatz', 21, 6, '7:35:47', '13:33:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (168, 'Skiba', 164, 1, '9:00:38', '16:05:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (169, 'Yacero', 43, 2, '9:19:14', '14:16:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (170, 'Blogtag', 97, 5, '8:49:38', '14:49:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (171, 'Minyx', 176, 5, '7:52:49', '13:47:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (172, 'DabZ', 80, 9, '10:13:46', '14:04:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (173, 'Ooba', 35, 8, '9:29:13', '18:48:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (174, 'Flashspan', 126, 5, '8:22:45', '14:46:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (175, 'Twinder', 122, 4, '9:29:37', '21:59:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (176, 'Wordpedia', 192, 8, '7:24:25', '13:41:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (177, 'Kaymbo', 47, 9, '9:52:16', '18:56:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (178, 'Eabox', 192, 10, '7:15:14', '13:34:56');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (179, 'Wikizz', 134, 10, '8:50:37', '18:56:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (180, 'Vitz', 10, 10, '10:03:45', '18:07:15');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (181, 'Cogidoo', 142, 1, '8:20:38', '12:21:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (182, 'Lajo', 140, 9, '7:15:58', '13:41:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (183, 'Abata', 150, 3, '9:49:46', '16:21:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (184, 'Tagfeed', 144, 2, '9:52:40', '14:02:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (185, 'Tagtune', 185, 3, '10:40:22', '20:27:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (186, 'Skibox', 62, 6, '9:40:52', '16:41:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (187, 'Yata', 165, 8, '9:44:29', '17:24:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (188, 'Skipfire', 93, 9, '8:05:22', '12:31:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (189, 'Snaptags', 187, 4, '8:29:25', '20:53:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (190, 'Rhyloo', 60, 6, '9:57:30', '19:32:15');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (191, 'Roodel', 188, 7, '8:09:26', '18:24:28');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (192, 'Meeveo', 87, 1, '7:08:27', '16:07:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (193, 'Skalith', 119, 6, '8:13:34', '18:13:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (194, 'Thoughtbridge', 73, 10, '7:04:49', '18:40:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (195, 'InnoZ', 39, 1, '7:48:04', '14:48:39');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (196, 'Rhycero', 107, 7, '7:43:25', '16:54:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (197, 'Livetube', 17, 3, '10:04:32', '13:18:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (198, 'Omba', 159, 4, '8:04:55', '19:09:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (199, 'Voonix', 42, 2, '9:09:12', '19:03:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (200, 'Aivee', 86, 4, '9:53:04', '21:06:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (201, 'Blogpad', 112, 1, '9:18:03', '17:24:38');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (202, 'Topiczoom', 109, 4, '10:42:43', '16:27:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (203, 'Wikido', 110, 2, '9:31:49', '19:51:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (204, 'Trilia', 169, 7, '10:10:05', '21:34:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (205, 'Blogtag', 105, 5, '10:13:47', '17:49:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (206, 'Avamba', 31, 8, '9:28:19', '21:50:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (207, 'Twitterwire', 98, 1, '10:17:50', '16:36:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (208, 'Wikizz', 106, 4, '8:47:11', '20:32:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (209, 'Dynabox', 23, 4, '8:51:37', '18:15:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (210, 'Skippad', 148, 5, '10:26:24', '21:04:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (211, 'Bluejam', 37, 7, '7:59:34', '15:00:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (212, 'Snaptags', 15, 9, '8:11:53', '14:45:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (213, 'Skinder', 101, 10, '10:29:53', '13:52:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (214, 'Kazu', 44, 10, '10:51:02', '21:45:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (215, 'Eabox', 25, 7, '8:36:22', '15:14:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (216, 'Quinu', 107, 3, '7:37:10', '12:25:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (217, 'Wikibox', 199, 1, '8:07:17', '13:35:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (218, 'Twiyo', 46, 8, '9:13:08', '13:48:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (219, 'Katz', 10, 3, '10:31:18', '14:20:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (220, 'Cogilith', 76, 6, '8:02:37', '14:57:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (221, 'Tavu', 33, 3, '8:00:48', '20:40:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (222, 'BlogXS', 193, 6, '10:47:55', '14:56:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (223, 'Tagfeed', 97, 10, '7:11:29', '20:30:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (224, 'Meembee', 109, 5, '8:19:06', '13:34:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (225, 'Skyndu', 167, 3, '9:57:31', '14:25:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (226, 'Twitterwire', 190, 7, '9:27:43', '16:11:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (227, 'Skipstorm', 126, 4, '10:42:34', '18:26:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (228, 'Gigazoom', 35, 6, '9:54:45', '15:41:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (229, 'Pixonyx', 170, 6, '7:11:42', '21:08:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (230, 'Ailane', 126, 1, '8:24:53', '21:04:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (231, 'Feedspan', 145, 6, '10:51:08', '15:29:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (232, 'Roombo', 122, 1, '9:06:12', '17:11:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (233, 'Quamba', 28, 1, '8:17:58', '16:43:56');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (234, 'Yombu', 102, 1, '10:50:24', '13:04:17');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (235, 'BlogXS', 77, 9, '8:53:42', '12:01:50');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (236, 'Fivechat', 195, 10, '9:15:48', '16:46:28');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (237, 'Voolith', 134, 2, '7:12:43', '13:46:56');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (238, 'Tekfly', 69, 3, '10:35:59', '15:24:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (239, 'Talane', 118, 4, '10:30:43', '15:42:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (240, 'Blognation', 31, 10, '10:16:10', '21:12:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (241, 'Quimm', 27, 5, '7:42:31', '18:08:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (242, 'Gabcube', 160, 4, '8:23:35', '19:00:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (243, 'Linklinks', 96, 3, '10:55:41', '13:32:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (244, 'Twitterwire', 31, 6, '10:23:56', '17:55:17');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (245, 'Jamia', 51, 2, '7:46:50', '12:02:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (246, 'Aibox', 181, 8, '8:52:54', '13:35:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (247, 'Shufflebeat', 135, 8, '8:25:01', '20:19:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (248, 'Avamm', 58, 2, '9:47:34', '14:51:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (249, 'Eire', 74, 10, '9:44:43', '19:47:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (250, 'Gabtype', 122, 10, '9:16:14', '19:35:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (251, 'Abata', 168, 3, '7:34:24', '13:58:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (252, 'Oloo', 155, 7, '9:09:39', '13:00:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (253, 'Wordify', 140, 10, '7:00:13', '19:20:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (254, 'Vinte', 45, 5, '7:13:00', '14:58:54');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (255, 'Twiyo', 116, 1, '8:15:00', '14:08:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (256, 'Trudeo', 151, 6, '8:16:02', '12:14:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (257, 'Eidel', 154, 6, '7:00:34', '16:49:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (258, 'Yotz', 164, 2, '8:46:46', '17:35:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (259, 'Quatz', 93, 7, '9:54:40', '12:40:52');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (260, 'Dabfeed', 198, 3, '7:57:18', '15:04:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (261, 'Voolith', 197, 4, '8:12:21', '15:42:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (262, 'Kwimbee', 155, 5, '8:44:21', '21:36:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (263, 'Topiclounge', 185, 10, '10:15:41', '15:27:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (264, 'Cogidoo', 57, 1, '9:44:20', '12:22:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (265, 'Nlounge', 177, 3, '10:51:19', '12:09:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (266, 'Ozu', 186, 10, '8:54:49', '15:18:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (267, 'Wikizz', 10, 10, '8:09:12', '12:36:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (268, 'Jabbersphere', 52, 5, '7:34:00', '14:06:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (269, 'Quimm', 25, 3, '8:04:23', '17:18:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (270, 'Photojam', 200, 8, '7:14:19', '16:37:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (271, 'Oba', 40, 8, '8:32:08', '17:50:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (272, 'Photospace', 66, 5, '10:16:22', '13:05:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (273, 'Kare', 192, 7, '7:49:02', '15:58:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (274, 'Skimia', 20, 7, '7:18:21', '20:14:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (275, 'Yodel', 79, 10, '7:59:33', '15:51:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (276, 'Flipopia', 26, 6, '7:26:44', '12:37:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (277, 'Voolith', 31, 4, '10:41:34', '13:27:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (278, 'Brainbox', 184, 7, '9:24:53', '18:17:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (279, 'Trilith', 20, 5, '8:36:56', '14:26:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (280, 'Camido', 89, 4, '10:48:36', '21:33:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (281, 'Wikido', 189, 2, '10:03:46', '16:45:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (282, 'Bluejam', 15, 2, '9:08:13', '13:32:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (283, 'Bluejam', 126, 4, '7:42:08', '17:33:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (284, 'Yozio', 153, 8, '7:42:16', '20:23:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (285, 'Riffpedia', 126, 3, '7:10:58', '18:55:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (286, 'Tazzy', 69, 2, '9:14:30', '13:36:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (287, 'Meedoo', 172, 1, '7:28:29', '19:26:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (288, 'Chatterpoint', 122, 5, '7:30:55', '12:12:28');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (289, 'Topiczoom', 133, 9, '10:04:05', '14:57:22');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (290, 'Photobug', 153, 2, '10:38:33', '12:13:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (291, 'Voolith', 108, 2, '8:33:27', '12:26:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (292, 'Jabbercube', 199, 4, '8:15:33', '17:33:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (293, 'Leexo', 24, 6, '10:15:19', '17:17:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (294, 'Lajo', 141, 2, '7:22:20', '19:06:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (295, 'Skilith', 135, 4, '10:15:02', '14:18:31');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (296, 'Teklist', 79, 4, '10:10:59', '15:43:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (297, 'Pixope', 46, 8, '10:47:49', '17:19:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (298, 'Agivu', 188, 7, '9:24:44', '21:44:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (299, 'Voomm', 138, 3, '8:36:35', '17:32:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (300, 'Rhybox', 146, 6, '9:45:42', '12:56:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (301, 'Voolith', 93, 8, '8:54:49', '15:54:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (302, 'Yadel', 165, 4, '8:21:54', '12:13:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (303, 'Wordpedia', 68, 6, '8:45:42', '17:29:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (304, 'Brainbox', 89, 4, '7:56:51', '12:47:47');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (305, 'Demizz', 195, 8, '8:58:38', '18:51:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (306, 'Roodel', 143, 6, '10:57:35', '13:39:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (307, 'Rhycero', 172, 9, '10:55:53', '16:03:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (308, 'Gigashots', 179, 5, '7:55:51', '21:36:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (309, 'Yakidoo', 74, 4, '7:55:54', '16:40:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (310, 'Oyope', 49, 7, '10:45:53', '21:38:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (311, 'Wikibox', 117, 6, '9:35:35', '13:33:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (312, 'Blogtags', 98, 7, '10:25:47', '17:18:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (313, 'Mita', 85, 1, '7:48:31', '21:53:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (314, 'Jabberbean', 182, 1, '8:00:05', '19:18:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (315, 'Thoughtmix', 153, 9, '8:14:40', '16:41:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (316, 'Realbridge', 48, 6, '8:41:19', '21:07:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (317, 'Zazio', 168, 3, '7:32:38', '21:08:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (318, 'Vinte', 103, 1, '9:38:05', '20:14:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (319, 'Skyndu', 32, 9, '8:59:28', '13:19:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (320, 'Rhynoodle', 45, 2, '8:02:32', '12:15:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (321, 'Gigazoom', 179, 9, '7:55:43', '21:54:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (322, 'Linklinks', 197, 6, '9:01:25', '20:08:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (323, 'Kazu', 194, 9, '8:55:09', '17:13:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (324, 'Divape', 18, 2, '7:39:41', '17:52:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (325, 'Dynava', 70, 1, '10:38:20', '20:47:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (326, 'Gigabox', 155, 1, '7:00:56', '15:38:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (327, 'Jaxbean', 31, 1, '8:32:47', '12:29:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (328, 'Nlounge', 104, 7, '9:31:43', '17:47:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (329, 'Chatterbridge', 16, 4, '10:45:08', '17:56:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (330, 'Quatz', 165, 5, '7:33:11', '16:45:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (331, 'Photobug', 171, 2, '10:01:02', '15:49:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (332, 'Gigazoom', 190, 6, '8:01:13', '16:41:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (333, 'Tagopia', 70, 10, '9:22:55', '17:22:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (334, 'Brainsphere', 183, 6, '10:06:15', '12:39:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (335, 'Jabberbean', 170, 3, '10:03:33', '14:43:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (336, 'Gigazoom', 25, 7, '10:44:52', '21:12:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (337, 'Youopia', 169, 10, '9:55:02', '13:52:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (338, 'Linktype', 80, 4, '10:17:37', '17:29:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (339, 'Centidel', 146, 4, '9:04:51', '15:54:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (340, 'Thoughtbeat', 160, 1, '9:34:15', '18:48:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (341, 'Realbuzz', 169, 6, '9:28:01', '18:10:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (342, 'Cogidoo', 163, 7, '8:05:12', '21:34:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (343, 'Einti', 134, 10, '10:55:48', '17:43:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (344, 'Geba', 171, 8, '8:58:31', '21:45:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (345, 'Aibox', 197, 1, '9:30:38', '20:01:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (346, 'Browsebug', 184, 10, '10:03:47', '14:46:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (347, 'Edgewire', 166, 5, '8:42:19', '12:59:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (348, 'Thoughtbridge', 67, 9, '9:03:18', '16:58:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (349, 'Meedoo', 121, 7, '10:54:15', '12:34:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (350, 'Eabox', 184, 9, '7:26:29', '17:33:22');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (351, 'Jabbertype', 76, 4, '8:25:31', '21:29:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (352, 'Feednation', 189, 10, '10:44:22', '19:40:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (353, 'Plajo', 112, 7, '8:16:56', '20:15:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (354, 'Oyonder', 139, 2, '9:12:22', '21:03:50');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (355, 'Twinte', 197, 4, '9:13:41', '12:37:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (356, 'Edgewire', 168, 4, '10:50:50', '13:47:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (357, 'Yodo', 125, 10, '10:53:44', '14:51:54');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (358, 'Dabshots', 18, 10, '7:35:41', '18:57:50');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (359, 'Thoughtmix', 34, 5, '8:07:35', '18:12:19');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (360, 'Voomm', 165, 6, '10:19:01', '21:57:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (361, 'Edgeblab', 128, 1, '8:56:28', '21:31:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (362, 'Twimbo', 127, 10, '8:35:47', '18:24:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (363, 'Yodo', 173, 4, '9:53:58', '20:51:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (364, 'Tagcat', 67, 1, '8:46:06', '15:47:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (365, 'Oyonder', 168, 5, '7:15:52', '15:57:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (366, 'Edgeclub', 187, 2, '10:45:42', '13:47:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (367, 'Linklinks', 168, 7, '9:11:42', '19:02:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (368, 'Dynava', 122, 5, '9:15:44', '20:07:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (369, 'Bubblebox', 164, 8, '9:27:28', '13:32:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (370, 'Agivu', 197, 4, '7:23:02', '20:34:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (371, 'Fliptune', 194, 4, '10:06:45', '20:06:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (372, 'Mymm', 177, 7, '7:40:28', '15:57:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (373, 'Kimia', 165, 1, '7:11:37', '21:22:13');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (374, 'Browsecat', 113, 6, '9:55:31', '19:31:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (375, 'Riffwire', 113, 5, '7:45:19', '14:53:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (376, 'Voonix', 22, 3, '7:46:40', '16:39:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (377, 'Youbridge', 185, 2, '8:50:46', '21:32:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (378, 'Brightbean', 47, 7, '9:42:56', '16:50:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (379, 'Oyoloo', 151, 9, '8:30:46', '21:24:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (380, 'Photolist', 73, 4, '7:30:23', '17:33:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (381, 'Zoomzone', 51, 7, '10:11:36', '16:56:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (382, 'Jetpulse', 13, 7, '7:34:33', '16:36:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (383, 'Wordtune', 61, 7, '7:12:10', '17:06:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (384, 'Tavu', 142, 4, '7:47:12', '12:44:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (385, 'Ntags', 146, 5, '8:49:02', '14:12:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (386, 'Muxo', 110, 7, '8:26:13', '19:04:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (387, 'Wordpedia', 136, 10, '7:07:49', '17:02:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (388, 'Rhyloo', 191, 3, '9:02:02', '15:55:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (389, 'Twimm', 197, 6, '7:28:59', '14:07:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (390, 'Lazzy', 192, 10, '7:11:15', '16:25:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (391, 'Dabtype', 156, 10, '9:01:46', '16:11:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (392, 'Bubblemix', 161, 9, '10:09:09', '18:58:05');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (393, 'Skipstorm', 50, 1, '8:55:06', '14:17:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (394, 'Photolist', 96, 4, '10:09:30', '12:18:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (395, 'Camido', 38, 2, '7:27:12', '21:27:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (396, 'Yodo', 197, 2, '10:34:43', '19:07:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (397, 'Fatz', 133, 2, '7:21:24', '15:27:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (398, 'Skyvu', 112, 6, '7:08:48', '15:18:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (399, 'Aimbo', 67, 7, '9:49:19', '14:48:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (400, 'Meetz', 56, 2, '10:44:58', '14:28:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (401, 'Jaxworks', 130, 10, '7:29:49', '18:11:10');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (402, 'Dazzlesphere', 179, 9, '9:11:40', '19:14:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (403, 'Twitterlist', 72, 4, '8:22:15', '16:23:04');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (404, 'Vimbo', 183, 10, '8:06:43', '18:09:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (405, 'Jabbersphere', 106, 1, '7:10:00', '18:30:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (406, 'Gabcube', 66, 7, '8:43:00', '20:10:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (407, 'Voomm', 89, 3, '7:16:17', '17:44:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (408, 'Browsezoom', 152, 8, '8:25:25', '12:47:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (409, 'Oozz', 29, 7, '9:02:10', '15:44:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (410, 'Skynoodle', 175, 3, '10:04:38', '12:27:28');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (411, 'Linkbridge', 11, 6, '8:34:59', '19:01:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (412, 'Wordify', 138, 6, '9:14:34', '21:56:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (413, 'Blognation', 174, 9, '9:44:00', '18:20:52');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (414, 'Yadel', 116, 8, '7:52:29', '21:13:56');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (415, 'Rhyzio', 82, 5, '10:25:59', '14:18:56');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (416, 'Mydo', 138, 7, '10:17:48', '14:31:16');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (417, 'Eayo', 153, 10, '8:58:39', '18:29:43');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (418, 'Roomm', 126, 10, '9:57:29', '12:18:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (419, 'Topicblab', 138, 7, '7:12:56', '18:26:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (420, 'Fadeo', 19, 5, '7:27:30', '21:19:41');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (421, 'Meemm', 110, 9, '10:34:04', '16:49:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (422, 'Flashdog', 167, 5, '7:25:23', '14:09:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (423, 'Kazu', 34, 2, '8:51:41', '20:15:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (424, 'Thoughtbeat', 163, 9, '7:58:00', '16:54:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (425, 'Lajo', 132, 9, '10:59:01', '21:05:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (426, 'Oozz', 96, 9, '8:41:47', '19:03:29');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (427, 'Avaveo', 12, 2, '10:54:06', '17:54:49');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (428, 'Vipe', 158, 10, '9:36:02', '21:17:52');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (429, 'Realbridge', 148, 2, '7:49:52', '19:47:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (430, 'Yozio', 169, 6, '8:59:16', '12:22:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (431, 'Yambee', 159, 4, '7:36:35', '19:05:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (432, 'Twimm', 181, 8, '7:39:20', '19:04:35');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (433, 'Omba', 87, 6, '10:25:51', '18:39:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (434, 'Photobean', 86, 1, '8:30:47', '17:42:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (435, 'Quamba', 11, 9, '7:46:57', '13:55:58');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (436, 'Blognation', 198, 2, '10:42:37', '14:22:03');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (437, 'Bubblebox', 81, 9, '8:56:09', '18:58:33');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (438, 'Quinu', 122, 9, '7:46:01', '20:00:21');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (439, 'Viva', 197, 5, '10:14:51', '20:40:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (440, 'Gabtune', 60, 10, '9:07:14', '18:19:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (441, 'Tekfly', 65, 4, '9:23:50', '17:08:17');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (442, 'Devbug', 140, 10, '10:33:06', '21:41:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (443, 'Feedbug', 76, 2, '9:33:23', '15:49:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (444, 'Centimia', 179, 8, '9:11:54', '15:48:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (445, 'Ntag', 119, 6, '8:19:41', '20:31:06');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (446, 'Einti', 126, 4, '9:33:13', '20:41:14');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (447, 'Yakidoo', 152, 4, '9:31:40', '14:28:22');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (448, 'Edgeify', 121, 6, '10:51:07', '15:50:20');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (449, 'Meevee', 31, 5, '8:12:19', '21:40:46');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (450, 'Brightdog', 74, 9, '9:58:46', '18:35:02');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (451, 'Rhyloo', 122, 3, '7:27:30', '21:30:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (452, 'Gigabox', 174, 6, '9:07:02', '16:37:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (453, 'Bubblemix', 32, 8, '7:07:11', '21:56:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (454, 'Kanoodle', 173, 2, '7:19:59', '15:42:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (455, 'Fivechat', 160, 1, '8:56:35', '17:22:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (456, 'Wordify', 150, 10, '7:03:41', '15:16:26');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (457, 'Oyope', 110, 10, '7:50:21', '18:40:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (458, 'Ntag', 28, 1, '7:10:24', '16:39:38');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (459, 'Eadel', 55, 3, '7:00:44', '21:10:36');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (460, 'Cogidoo', 177, 6, '9:49:17', '18:57:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (461, 'Dynazzy', 20, 6, '8:07:44', '14:26:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (462, 'Pixonyx', 47, 2, '9:42:45', '18:05:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (463, 'Skipfire', 41, 10, '8:42:53', '20:01:27');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (464, 'Meevee', 32, 7, '7:26:34', '14:31:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (465, 'Trudeo', 147, 4, '10:24:13', '19:29:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (466, 'Zazio', 65, 5, '8:56:38', '12:29:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (467, 'Kwimbee', 144, 1, '9:09:41', '14:07:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (468, 'Jaxnation', 116, 8, '8:28:23', '21:45:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (469, 'Flipstorm', 172, 7, '9:20:16', '13:13:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (470, 'Skilith', 193, 1, '8:46:29', '21:28:59');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (471, 'Plambee', 135, 9, '9:55:41', '17:32:53');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (472, 'Aivee', 84, 3, '8:52:38', '16:19:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (473, 'Twitterworks', 17, 5, '9:19:30', '19:46:24');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (474, 'Twimm', 100, 7, '9:57:43', '15:08:37');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (475, 'Jetwire', 86, 5, '9:05:57', '15:39:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (476, 'Trudoo', 104, 10, '7:36:02', '21:23:32');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (477, 'Demivee', 190, 4, '10:09:02', '17:55:51');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (478, 'Jetpulse', 132, 8, '8:56:05', '17:28:44');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (479, 'Quatz', 158, 5, '10:22:19', '19:31:17');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (480, 'Centimia', 152, 3, '10:18:36', '12:53:30');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (481, 'Babbleset', 90, 9, '9:52:31', '21:29:08');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (482, 'Feedfire', 109, 3, '7:56:28', '21:20:34');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (483, 'Talane', 36, 6, '10:05:05', '14:32:23');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (484, 'Edgewire', 72, 8, '9:12:07', '17:04:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (485, 'Gigashots', 184, 9, '10:19:13', '19:36:40');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (486, 'Fatz', 175, 6, '7:10:12', '18:23:48');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (487, 'Tazz', 105, 6, '8:58:27', '15:08:07');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (488, 'Myworks', 13, 8, '10:13:36', '16:08:12');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (489, 'Kanoodle', 187, 10, '10:28:06', '21:33:55');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (490, 'Topiclounge', 114, 8, '7:01:28', '17:17:09');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (491, 'Viva', 13, 3, '8:08:15', '20:39:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (492, 'Feedfire', 93, 7, '9:53:12', '18:28:11');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (493, 'Browsetype', 66, 10, '9:06:04', '12:22:18');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (494, 'Twitterbridge', 111, 3, '9:40:31', '17:08:57');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (495, 'Twitterworks', 135, 6, '9:59:56', '14:16:00');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (496, 'Devify', 160, 6, '8:20:20', '20:46:42');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (497, 'Agimba', 57, 1, '10:33:06', '14:10:01');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (498, 'Meemm', 63, 4, '8:17:01', '12:38:45');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (499, 'Aivee', 83, 6, '9:00:05', '13:19:25');
insert into Restaurants (id, name, Capacity, CityId, StartTime, EndTime) values (500, 'Aimbu', 158, 5, '7:29:02', '15:45:19');

insert into Category (id, CategoryName) values (1, 'appetizer');
insert into Category (id, CategoryName) values (2, 'main course');
insert into Category (id, CategoryName) values (3, 'dessert');

insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (1, 'Sesame Ginger Noodles', 495, 4289, true, 384, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (2, 'Cuban Sandwich', 26, 1326, false, 310, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (3, 'Baked Ziti', 422, 552, true, 89, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (4, 'Stuffed Cabbage Rolls', 458, 4234, true, 170, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (5, 'Lemon Herb Chicken', 857, 3122, false, 230, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (6, 'Vegetarian Bibimbap', 4, 1760, false, 65, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (7, 'Lemon Garlic Shrimp', 91, 1844, true, 93, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (8, 'Spinach Artichoke Pasta', 838, 4366, false, 226, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (9, 'Lobster Mac and Cheese', 303, 1253, true, 425, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (10, 'Pesto Gnocchi', 680, 1758, true, 490, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (11, 'Coconut Curry Chicken', 460, 897, true, 132, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (12, 'Chicken Shawarma', 931, 3114, false, 188, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (13, 'Tofu Pad Thai', 38, 279, false, 286, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (14, 'BBQ Ribs', 828, 4409, true, 378, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (15, 'Vegetarian Bibimbap', 272, 815, true, 161, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (16, 'Chicken Tikka Masala', 997, 3086, false, 224, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (17, 'Pumpkin Risotto', 229, 4318, true, 470, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (18, 'Lemon Garlic Shrimp', 345, 3652, false, 322, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (19, 'Szechuan Tofu', 537, 1067, false, 210, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (20, 'Vegan Lentil Curry', 419, 403, false, 209, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (21, 'Beef Stroganoff', 811, 2924, false, 276, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (22, 'Beef Stroganoff', 575, 491, false, 423, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (23, 'Lobster Mac and Cheese', 672, 3785, false, 429, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (24, 'Cajun Jambalaya', 458, 4366, false, 35, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (25, 'Butternut Squash Soup', 896, 4223, false, 318, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (26, 'Butternut Squash Soup', 59, 348, true, 235, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (27, 'Chicken Shawarma', 477, 337, false, 272, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (28, 'Shrimp Scampi', 263, 4954, true, 224, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (29, 'Teriyaki Tofu Bowl', 61, 4278, true, 434, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (30, 'Vegetable Stir Fry', 607, 4783, true, 350, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (31, 'Shrimp Scampi', 547, 2321, false, 437, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (32, 'Buffalo Cauliflower Wings', 292, 1552, false, 21, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (33, 'Garlic Butter Scallops', 531, 465, false, 78, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (34, 'Miso Glazed Cod', 682, 3720, false, 264, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (35, 'Turkey Meatloaf', 844, 2228, false, 476, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (36, 'Miso Glazed Cod', 378, 1215, true, 40, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (37, 'Spaghetti Carbonara', 665, 2549, true, 95, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (38, 'Cajun Jambalaya', 383, 4197, false, 341, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (39, 'Pesto Gnocchi', 537, 3005, true, 265, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (40, 'Chicken Shawarma', 76, 4805, true, 12, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (41, 'Vegan Lentil Curry', 149, 2696, true, 274, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (42, 'Lobster Mac and Cheese', 858, 17, false, 270, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (43, 'Chicken Shawarma', 678, 4671, true, 296, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (44, 'Pork Schnitzel', 33, 1396, true, 231, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (45, 'Pork Schnitzel', 207, 3016, false, 187, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (46, 'BBQ Ribs', 328, 1323, false, 1, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (47, 'Hawaiian Poke Bowl', 571, 2716, false, 241, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (48, 'Vegetarian Bibimbap', 862, 1865, true, 166, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (49, 'Vegetable Stir Fry', 442, 881, false, 442, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (50, 'Cajun Jambalaya', 399, 60, true, 416, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (51, 'Miso Glazed Cod', 369, 3615, true, 206, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (52, 'Pork Schnitzel', 856, 3649, true, 437, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (53, 'Tofu Pad Thai', 633, 3664, false, 7, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (54, 'Quinoa Stuffed Peppers', 779, 3920, false, 152, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (55, 'Hawaiian Poke Bowl', 642, 2733, false, 155, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (56, 'Teriyaki Salmon Bowl', 118, 3429, false, 85, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (57, 'Spinach Artichoke Pasta', 242, 4062, false, 419, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (58, 'Salmon Teriyaki', 399, 3826, false, 194, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (59, 'Spaghetti Carbonara', 646, 3560, false, 319, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (60, 'Buffalo Cauliflower Wings', 403, 755, false, 210, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (61, 'Turkey Meatloaf', 606, 3361, true, 396, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (62, 'Chicken Tikka Masala', 1, 66, false, 152, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (63, 'Beef Stroganoff', 101, 455, true, 293, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (64, 'Ratatouille', 255, 392, true, 347, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (65, 'Chicken Shawarma', 468, 2779, false, 178, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (66, 'Caprese Salad', 315, 3121, false, 374, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (67, 'Mongolian Beef', 938, 2428, true, 455, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (68, 'Salmon Teriyaki', 629, 801, false, 37, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (69, 'Moroccan Couscous', 170, 4049, true, 395, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (70, 'Vegan Lentil Curry', 515, 4683, false, 440, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (71, 'Beef Stroganoff', 277, 3738, true, 107, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (72, 'Pesto Gnocchi', 256, 4333, true, 287, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (73, 'Cuban Sandwich', 686, 2172, false, 486, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (74, 'Buffalo Cauliflower Wings', 351, 2317, false, 304, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (75, 'Quinoa Stuffed Peppers', 944, 2535, true, 24, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (76, 'Pesto Gnocchi', 594, 3382, false, 233, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (77, 'Pad See Ew', 711, 4060, false, 350, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (78, 'Teriyaki Tofu Bowl', 484, 1046, true, 130, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (79, 'Lemon Herb Chicken', 408, 1208, true, 195, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (80, 'Crispy Tofu Tacos', 285, 3526, true, 423, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (81, 'Buffalo Cauliflower Wings', 543, 1781, false, 68, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (82, 'Pad See Ew', 404, 2194, true, 486, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (83, 'Chicken Shawarma', 597, 4288, true, 279, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (84, 'Lemon Garlic Shrimp', 472, 2873, true, 257, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (85, 'Ratatouille', 308, 2622, true, 179, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (86, 'Tofu Pad Thai', 493, 1062, false, 28, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (87, 'Miso Glazed Cod', 766, 2284, false, 262, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (88, 'Baked Ziti', 172, 1189, true, 134, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (89, 'Butternut Squash Soup', 92, 4176, false, 347, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (90, 'Turkey Meatloaf', 599, 4564, true, 142, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (91, 'Chicken Shawarma', 330, 2236, false, 481, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (92, 'Teriyaki Salmon Bowl', 998, 1980, false, 372, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (93, 'Chili Con Carne', 632, 858, false, 222, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (94, 'Teriyaki Tofu Bowl', 516, 2061, true, 152, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (95, 'Shrimp Scampi', 52, 1492, true, 141, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (96, 'Mushroom Risotto', 637, 257, false, 261, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (97, 'Vegan Lentil Curry', 383, 4341, false, 159, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (98, 'Lemon Garlic Shrimp', 478, 4256, false, 303, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (99, 'Vegetable Stir Fry', 115, 4271, false, 15, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (100, 'Lobster Mac and Cheese', 202, 2682, false, 143, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (101, 'BBQ Ribs', 811, 3893, false, 127, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (102, 'BBQ Ribs', 160, 1344, true, 296, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (103, 'Salmon Teriyaki', 801, 2135, true, 137, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (104, 'Pineapple Fried Rice', 376, 561, true, 441, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (105, 'Cajun Jambalaya', 12, 2855, false, 141, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (106, 'Teriyaki Tofu Bowl', 804, 1892, false, 194, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (107, 'Chicken Shawarma', 68, 3975, true, 23, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (108, 'Cuban Sandwich', 11, 4616, false, 321, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (109, 'Chicken Tikka Masala', 58, 2984, true, 2, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (110, 'Buffalo Cauliflower Wings', 42, 4370, true, 141, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (111, 'Stuffed Cabbage Rolls', 666, 3865, false, 362, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (112, 'Baked Ziti', 655, 3845, true, 408, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (113, 'BBQ Ribs', 249, 1423, true, 178, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (114, 'Butternut Squash Soup', 862, 2129, true, 446, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (115, 'Spaghetti Carbonara', 113, 3440, true, 310, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (116, 'Lobster Mac and Cheese', 756, 1514, true, 127, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (117, 'Pasta Primavera', 330, 1825, false, 54, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (118, 'Stuffed Cabbage Rolls', 267, 4114, true, 400, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (119, 'Pasta Primavera', 983, 2734, true, 411, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (120, 'Beef Stroganoff', 862, 2438, false, 268, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (121, 'BBQ Ribs', 8, 2844, false, 37, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (122, 'Baked Ziti', 46, 4879, false, 245, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (123, 'Chicken Tikka Masala', 459, 2967, false, 110, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (124, 'Beef Stroganoff', 507, 1334, false, 36, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (125, 'Lobster Mac and Cheese', 610, 2684, false, 390, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (126, 'Lemon Herb Chicken', 405, 4985, true, 167, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (127, 'Shrimp Tacos', 45, 3117, true, 424, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (128, 'Lemon Herb Chicken', 963, 1070, true, 40, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (129, 'Stuffed Cabbage Rolls', 335, 4278, true, 311, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (130, 'Vegan Lentil Curry', 172, 3414, true, 292, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (131, 'Cajun Jambalaya', 895, 2316, false, 93, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (132, 'Pork Schnitzel', 830, 916, true, 102, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (133, 'Pineapple Fried Rice', 687, 3323, true, 473, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (134, 'Crispy Pork Belly', 469, 4433, true, 95, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (135, 'Pad See Ew', 534, 812, true, 141, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (136, 'Moroccan Couscous', 951, 2440, false, 263, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (137, 'Crispy Tofu Tacos', 258, 320, false, 184, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (138, 'Cajun Jambalaya', 268, 3422, false, 160, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (139, 'Lobster Mac and Cheese', 180, 4200, false, 449, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (140, 'Spinach Artichoke Pasta', 540, 1744, false, 15, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (141, 'Vegetarian Bibimbap', 415, 3831, true, 247, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (142, 'Cuban Sandwich', 724, 3655, false, 402, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (143, 'Cajun Jambalaya', 596, 3010, true, 215, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (144, 'Tofu Pad Thai', 836, 1122, false, 482, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (145, 'Garlic Butter Scallops', 346, 699, true, 154, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (146, 'Chicken Alfredo', 904, 729, false, 277, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (147, 'Ratatouille', 15, 1089, true, 270, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (148, 'Pineapple Fried Rice', 690, 271, true, 92, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (149, 'Lobster Mac and Cheese', 262, 260, true, 32, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (150, 'Sesame Ginger Noodles', 747, 258, false, 462, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (151, 'Buffalo Cauliflower Wings', 242, 4499, true, 130, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (152, 'Stuffed Cabbage Rolls', 226, 1410, true, 317, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (153, 'BBQ Ribs', 108, 3651, true, 23, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (154, 'Shrimp Scampi', 366, 2988, false, 324, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (155, 'Quinoa Stuffed Peppers', 72, 4744, false, 17, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (156, 'Ratatouille', 110, 1458, true, 287, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (157, 'Miso Glazed Cod', 748, 3127, true, 35, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (158, 'Salmon Teriyaki', 430, 908, true, 410, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (159, 'Garlic Butter Scallops', 983, 1148, false, 80, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (160, 'Baked Ziti', 103, 1008, false, 258, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (161, 'BBQ Ribs', 706, 3642, true, 463, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (162, 'Buffalo Cauliflower Wings', 454, 361, true, 216, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (163, 'Beef Stroganoff', 55, 2715, true, 300, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (164, 'BBQ Ribs', 87, 2419, false, 70, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (165, 'Tofu Pad Thai', 815, 859, true, 178, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (166, 'Eggplant Parmesan', 913, 373, false, 163, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (167, 'Buffalo Cauliflower Wings', 270, 3951, true, 212, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (168, 'Cuban Sandwich', 516, 1555, true, 381, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (169, 'Vegetarian Bibimbap', 915, 3528, false, 498, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (170, 'Vegan Lentil Curry', 811, 476, true, 360, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (171, 'Pesto Gnocchi', 735, 3512, true, 498, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (172, 'Mushroom Risotto', 318, 3528, false, 252, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (173, 'Pasta Primavera', 650, 3825, false, 64, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (174, 'Teriyaki Tofu Bowl', 157, 1675, true, 301, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (175, 'Spaghetti Carbonara', 500, 4259, true, 290, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (176, 'Shrimp Tacos', 511, 2443, true, 216, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (177, 'Buffalo Cauliflower Wings', 964, 1641, false, 315, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (178, 'Sesame Ginger Noodles', 889, 3410, true, 464, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (179, 'Pad See Ew', 126, 3449, true, 153, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (180, 'Spinach Artichoke Pasta', 889, 2981, true, 279, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (181, 'Pork Schnitzel', 337, 2709, true, 304, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (182, 'Lobster Mac and Cheese', 601, 4728, false, 427, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (183, 'Vegan Lentil Curry', 817, 699, false, 287, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (184, 'Eggplant Parmesan', 4, 1861, true, 470, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (185, 'Salmon Teriyaki', 587, 702, false, 319, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (186, 'Hawaiian Poke Bowl', 933, 1534, true, 67, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (187, 'Shrimp Tacos', 457, 2627, false, 459, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (188, 'Shrimp Scampi', 520, 3596, true, 32, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (189, 'Teriyaki Salmon Bowl', 907, 1376, false, 208, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (190, 'Lemon Garlic Shrimp', 133, 1688, false, 84, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (191, 'Moroccan Couscous', 440, 830, false, 498, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (192, 'Hawaiian Poke Bowl', 687, 1540, false, 461, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (193, 'Butternut Squash Soup', 782, 4071, false, 245, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (194, 'Vegan Lentil Curry', 49, 4361, true, 237, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (195, 'Caprese Salad', 944, 3912, false, 489, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (196, 'Tofu Pad Thai', 532, 4194, false, 228, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (197, 'Miso Glazed Cod', 178, 2515, false, 7, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (198, 'Beef Stroganoff', 412, 2315, false, 241, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (199, 'Ratatouille', 50, 340, false, 468, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (200, 'Pesto Gnocchi', 975, 1218, true, 204, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (201, 'Pasta Primavera', 16, 2190, false, 177, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (202, 'Ratatouille', 610, 2304, false, 253, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (203, 'Chicken Tikka Masala', 309, 2617, false, 301, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (204, 'Mushroom Risotto', 754, 2846, true, 233, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (205, 'Caprese Salad', 283, 388, true, 389, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (206, 'Pork Schnitzel', 178, 20, false, 97, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (207, 'Crispy Tofu Tacos', 683, 3851, false, 221, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (208, 'Tofu Pad Thai', 916, 3940, true, 385, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (209, 'Crispy Pork Belly', 548, 4709, true, 492, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (210, 'Teriyaki Tofu Bowl', 661, 4917, true, 219, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (211, 'BBQ Ribs', 836, 4766, true, 30, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (212, 'BBQ Ribs', 527, 658, false, 401, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (213, 'Teriyaki Tofu Bowl', 620, 1055, true, 181, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (214, 'Caprese Salad', 885, 4459, false, 359, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (215, 'Baked Ziti', 962, 928, false, 250, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (216, 'Pad See Ew', 544, 2468, true, 78, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (217, 'Mushroom Risotto', 571, 1270, false, 459, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (218, 'Mongolian Beef', 456, 949, false, 84, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (219, 'Hawaiian Poke Bowl', 713, 220, false, 20, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (220, 'Shrimp Tacos', 716, 2402, false, 383, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (221, 'Tofu Pad Thai', 694, 3252, false, 446, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (222, 'Turkey Meatloaf', 69, 3677, false, 163, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (223, 'Vegan Lentil Curry', 688, 2777, true, 40, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (224, 'Coconut Curry Chicken', 582, 4427, false, 457, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (225, 'Mongolian Beef', 28, 3663, false, 243, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (226, 'Miso Glazed Cod', 361, 4903, true, 426, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (227, 'Ratatouille', 854, 1215, false, 42, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (228, 'Teriyaki Tofu Bowl', 667, 505, false, 330, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (229, 'Eggplant Parmesan', 631, 1185, true, 184, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (230, 'Tofu Pad Thai', 114, 2265, false, 322, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (231, 'Pork Schnitzel', 864, 2227, true, 121, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (232, 'Lobster Mac and Cheese', 213, 4438, true, 22, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (233, 'Chicken Tikka Masala', 308, 2687, false, 275, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (234, 'Garlic Butter Scallops', 851, 3143, true, 321, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (235, 'Spinach Artichoke Pasta', 498, 581, false, 11, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (236, 'Greek Moussaka', 82, 3039, false, 383, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (237, 'Crispy Pork Belly', 998, 3759, true, 408, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (238, 'Spaghetti Carbonara', 290, 655, false, 191, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (239, 'Baked Ziti', 151, 2651, false, 319, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (240, 'Shrimp Scampi', 715, 4639, false, 164, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (241, 'Beef Stroganoff', 88, 2099, true, 73, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (242, 'Pesto Gnocchi', 588, 380, true, 165, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (243, 'Chicken Shawarma', 671, 3003, true, 431, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (244, 'Crispy Tofu Tacos', 464, 4028, false, 172, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (245, 'Salmon Teriyaki', 99, 1913, true, 174, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (246, 'Cuban Sandwich', 893, 3982, true, 95, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (247, 'Beef Stroganoff', 221, 3668, true, 457, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (248, 'BBQ Ribs', 876, 103, false, 168, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (249, 'Pasta Primavera', 748, 3540, true, 74, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (250, 'Teriyaki Salmon Bowl', 148, 99, true, 341, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (251, 'Lemon Herb Chicken', 258, 4084, false, 457, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (252, 'Szechuan Tofu', 957, 3230, true, 142, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (253, 'BBQ Ribs', 480, 4982, true, 475, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (254, 'BBQ Ribs', 377, 829, false, 55, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (255, 'Garlic Butter Scallops', 636, 3104, false, 188, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (256, 'Chili Con Carne', 944, 3277, true, 274, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (257, 'Spaghetti Carbonara', 862, 1616, false, 216, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (258, 'Teriyaki Salmon Bowl', 518, 2920, false, 11, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (259, 'Shrimp Scampi', 879, 947, false, 265, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (260, 'Salmon Teriyaki', 387, 2157, true, 229, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (261, 'Stuffed Cabbage Rolls', 494, 2336, false, 255, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (262, 'Chili Con Carne', 628, 4623, true, 452, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (263, 'Cajun Jambalaya', 169, 2315, true, 424, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (264, 'Chili Con Carne', 943, 540, false, 53, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (265, 'Spinach Artichoke Pasta', 840, 1730, true, 270, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (266, 'Chili Con Carne', 886, 3105, true, 397, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (267, 'Beef Stroganoff', 704, 1729, true, 473, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (268, 'Buffalo Cauliflower Wings', 687, 2562, true, 63, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (269, 'Pork Schnitzel', 996, 1660, true, 212, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (270, 'Pasta Primavera', 136, 62, true, 500, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (271, 'Chicken Shawarma', 526, 2594, true, 182, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (272, 'Pumpkin Risotto', 437, 1480, true, 76, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (273, 'Quinoa Stuffed Peppers', 808, 536, false, 408, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (274, 'Lemon Garlic Shrimp', 336, 2186, false, 264, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (275, 'Crispy Pork Belly', 509, 3334, false, 234, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (276, 'Sesame Ginger Noodles', 471, 628, false, 402, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (277, 'Shrimp Scampi', 549, 3628, false, 306, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (278, 'Beef Stroganoff', 474, 1434, false, 103, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (279, 'Coconut Curry Chicken', 202, 1371, true, 40, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (280, 'Szechuan Tofu', 163, 3160, false, 241, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (281, 'Miso Glazed Cod', 183, 2076, true, 171, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (282, 'Tofu Pad Thai', 620, 2736, true, 84, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (283, 'Mushroom Risotto', 192, 1415, false, 34, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (284, 'Pasta Primavera', 635, 1392, true, 18, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (285, 'Garlic Butter Scallops', 684, 301, false, 10, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (286, 'Vegetable Stir Fry', 228, 1515, false, 113, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (287, 'Pumpkin Risotto', 849, 2885, true, 276, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (288, 'Lobster Mac and Cheese', 594, 2688, true, 317, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (289, 'Pasta Primavera', 673, 1171, true, 97, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (290, 'Lemon Garlic Shrimp', 638, 1846, false, 175, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (291, 'Cuban Sandwich', 142, 213, true, 456, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (292, 'Mushroom Risotto', 704, 3641, false, 200, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (293, 'Chicken Shawarma', 325, 4717, true, 181, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (294, 'Chicken Tikka Masala', 693, 3074, false, 64, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (295, 'Pesto Gnocchi', 490, 3089, false, 262, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (296, 'Miso Glazed Cod', 357, 3947, false, 241, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (297, 'Pork Schnitzel', 815, 25, false, 58, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (298, 'Vegetable Stir Fry', 566, 1302, false, 134, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (299, 'Eggplant Parmesan', 167, 3237, true, 201, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (300, 'Crispy Pork Belly', 959, 3664, true, 202, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (301, 'Pumpkin Risotto', 285, 899, false, 440, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (302, 'Pesto Gnocchi', 566, 4029, true, 37, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (303, 'Cuban Sandwich', 367, 3620, false, 272, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (304, 'Tofu Pad Thai', 972, 1492, false, 292, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (305, 'Cuban Sandwich', 301, 245, true, 45, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (306, 'Quinoa Stuffed Peppers', 90, 4335, true, 385, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (307, 'Cuban Sandwich', 137, 2579, false, 95, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (308, 'Cajun Jambalaya', 568, 3498, true, 184, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (309, 'Sesame Ginger Noodles', 915, 1979, false, 99, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (310, 'Cuban Sandwich', 920, 428, true, 166, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (311, 'Chicken Tikka Masala', 328, 961, true, 387, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (312, 'Crispy Pork Belly', 730, 348, false, 179, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (313, 'Shrimp Scampi', 22, 564, false, 14, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (314, 'Butternut Squash Soup', 218, 207, false, 126, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (315, 'Pork Schnitzel', 897, 3988, false, 387, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (316, 'Coconut Curry Chicken', 776, 208, true, 43, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (317, 'Spaghetti Carbonara', 496, 3498, true, 179, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (318, 'Teriyaki Tofu Bowl', 905, 553, true, 31, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (319, 'Mongolian Beef', 886, 2787, false, 60, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (320, 'Lobster Mac and Cheese', 17, 2562, true, 285, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (321, 'Quinoa Stuffed Peppers', 683, 1448, false, 115, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (322, 'Buffalo Cauliflower Wings', 891, 1367, false, 480, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (323, 'BBQ Ribs', 318, 1309, false, 197, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (324, 'Miso Glazed Cod', 208, 3472, true, 38, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (325, 'Pasta Primavera', 496, 345, true, 466, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (326, 'Sesame Ginger Noodles', 968, 2536, false, 67, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (327, 'Pineapple Fried Rice', 855, 3314, true, 207, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (328, 'Buffalo Cauliflower Wings', 986, 4344, true, 374, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (329, 'Tofu Pad Thai', 151, 133, true, 458, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (330, 'Miso Glazed Cod', 74, 2717, true, 400, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (331, 'Garlic Butter Scallops', 541, 4366, true, 147, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (332, 'Lemon Garlic Shrimp', 833, 1395, false, 68, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (333, 'Spinach Artichoke Pasta', 89, 2505, true, 248, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (334, 'Pumpkin Risotto', 486, 3835, true, 421, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (335, 'Coconut Curry Chicken', 854, 3274, true, 340, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (336, 'Sesame Ginger Noodles', 559, 3288, true, 95, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (337, 'Sesame Ginger Noodles', 475, 2658, true, 209, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (338, 'Butternut Squash Soup', 463, 4417, false, 167, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (339, 'Ratatouille', 516, 3326, false, 352, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (340, 'Miso Glazed Cod', 507, 4180, true, 430, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (341, 'Stuffed Cabbage Rolls', 85, 1275, false, 272, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (342, 'Stuffed Cabbage Rolls', 25, 1103, false, 78, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (343, 'Mushroom Risotto', 415, 3409, false, 154, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (344, 'Pad See Ew', 606, 4639, false, 408, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (345, 'Crispy Pork Belly', 192, 3106, false, 394, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (346, 'Crispy Pork Belly', 155, 375, false, 411, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (347, 'Chicken Tikka Masala', 872, 3683, true, 474, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (348, 'Sesame Ginger Noodles', 744, 4321, true, 374, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (349, 'Pasta Primavera', 681, 1856, false, 279, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (350, 'Lobster Mac and Cheese', 266, 4234, true, 333, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (351, 'Beef Stroganoff', 477, 1275, false, 478, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (352, 'Shrimp Tacos', 744, 3365, true, 345, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (353, 'Crispy Tofu Tacos', 813, 3429, false, 315, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (354, 'Vegetable Stir Fry', 252, 2924, false, 294, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (355, 'Chili Con Carne', 899, 1226, true, 338, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (356, 'Lemon Herb Chicken', 829, 2916, true, 192, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (357, 'Butternut Squash Soup', 138, 4018, true, 436, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (358, 'BBQ Ribs', 134, 3031, false, 380, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (359, 'Teriyaki Tofu Bowl', 831, 1584, false, 77, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (360, 'Teriyaki Tofu Bowl', 348, 4823, false, 216, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (361, 'Teriyaki Salmon Bowl', 875, 2451, false, 219, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (362, 'Pumpkin Risotto', 188, 1874, false, 92, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (363, 'Butternut Squash Soup', 496, 1458, true, 46, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (364, 'Pineapple Fried Rice', 666, 1587, false, 251, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (365, 'Salmon Teriyaki', 926, 3256, false, 340, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (366, 'Teriyaki Tofu Bowl', 693, 1633, true, 500, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (367, 'Turkey Meatloaf', 929, 212, false, 76, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (368, 'Salmon Teriyaki', 614, 2057, false, 456, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (369, 'Spaghetti Carbonara', 631, 4936, true, 128, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (370, 'Shrimp Scampi', 680, 17, false, 298, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (371, 'Cajun Jambalaya', 618, 4977, true, 404, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (372, 'Spaghetti Carbonara', 926, 4503, true, 376, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (373, 'Greek Moussaka', 379, 3393, true, 195, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (374, 'Lobster Mac and Cheese', 732, 4626, false, 282, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (375, 'Vegetable Stir Fry', 703, 4380, false, 211, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (376, 'Coconut Curry Chicken', 231, 3297, false, 423, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (377, 'Pumpkin Risotto', 357, 4392, true, 199, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (378, 'Pad See Ew', 659, 1350, false, 243, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (379, 'Chicken Tikka Masala', 467, 1266, true, 421, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (380, 'Shrimp Scampi', 729, 1377, true, 347, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (381, 'Spinach Artichoke Pasta', 107, 4038, true, 340, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (382, 'Vegan Lentil Curry', 633, 1342, true, 457, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (383, 'Teriyaki Tofu Bowl', 608, 541, true, 361, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (384, 'Beef Stroganoff', 80, 1877, true, 61, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (385, 'Vegetarian Bibimbap', 689, 3940, false, 111, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (386, 'Tofu Pad Thai', 493, 3940, false, 266, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (387, 'Chicken Tikka Masala', 498, 1418, false, 330, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (388, 'Spinach Artichoke Pasta', 540, 4888, false, 350, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (389, 'Szechuan Tofu', 421, 3735, false, 204, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (390, 'Spinach Artichoke Pasta', 98, 2469, false, 102, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (391, 'Lemon Garlic Shrimp', 371, 3973, false, 192, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (392, 'Spinach Artichoke Pasta', 932, 213, true, 108, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (393, 'Mushroom Risotto', 186, 52, true, 191, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (394, 'Lemon Herb Chicken', 761, 963, true, 435, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (395, 'Pineapple Fried Rice', 511, 3909, true, 57, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (396, 'Hawaiian Poke Bowl', 494, 1920, true, 322, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (397, 'Chicken Tikka Masala', 329, 2923, false, 2, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (398, 'Garlic Butter Scallops', 391, 277, false, 463, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (399, 'Spinach Artichoke Pasta', 116, 2043, true, 400, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (400, 'Lobster Mac and Cheese', 591, 4328, false, 51, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (401, 'Cuban Sandwich', 226, 1732, false, 360, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (402, 'Miso Glazed Cod', 59, 4871, false, 260, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (403, 'Pork Schnitzel', 124, 1430, false, 276, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (404, 'Vegan Lentil Curry', 725, 3447, false, 398, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (405, 'Shrimp Scampi', 829, 4419, false, 124, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (406, 'Coconut Curry Chicken', 123, 628, false, 479, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (407, 'Lobster Mac and Cheese', 770, 364, false, 83, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (408, 'Lobster Mac and Cheese', 736, 3566, false, 38, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (409, 'Hawaiian Poke Bowl', 683, 1391, false, 398, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (410, 'Baked Ziti', 19, 4324, true, 203, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (411, 'Sesame Ginger Noodles', 501, 3549, false, 258, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (412, 'Eggplant Parmesan', 745, 809, false, 485, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (413, 'Moroccan Couscous', 81, 93, false, 134, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (414, 'Garlic Butter Scallops', 260, 3782, true, 233, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (415, 'Chicken Shawarma', 518, 3738, true, 50, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (416, 'Chicken Shawarma', 230, 2325, false, 415, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (417, 'Pineapple Fried Rice', 107, 2924, true, 111, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (418, 'Coconut Curry Chicken', 789, 2908, false, 486, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (419, 'Teriyaki Tofu Bowl', 44, 2674, true, 67, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (420, 'Chicken Tikka Masala', 647, 2202, false, 53, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (421, 'Baked Ziti', 959, 2749, true, 219, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (422, 'Teriyaki Tofu Bowl', 346, 4590, false, 81, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (423, 'Teriyaki Salmon Bowl', 17, 2011, false, 144, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (424, 'Miso Glazed Cod', 230, 2566, false, 111, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (425, 'Shrimp Scampi', 172, 1553, false, 175, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (426, 'Lobster Mac and Cheese', 807, 3792, false, 427, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (427, 'Pesto Gnocchi', 231, 305, false, 292, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (428, 'Vegetable Stir Fry', 551, 3343, false, 141, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (429, 'Stuffed Cabbage Rolls', 791, 3126, true, 328, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (430, 'Vegetarian Bibimbap', 595, 212, true, 418, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (431, 'Coconut Curry Chicken', 612, 1598, false, 407, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (432, 'Spinach Artichoke Pasta', 8, 2396, true, 258, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (433, 'Stuffed Cabbage Rolls', 510, 3260, true, 434, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (434, 'Lemon Garlic Shrimp', 4, 4134, false, 246, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (435, 'Caprese Salad', 542, 1112, false, 370, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (436, 'BBQ Ribs', 487, 1177, true, 485, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (437, 'Stuffed Cabbage Rolls', 499, 4213, true, 2, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (438, 'Crispy Pork Belly', 625, 4684, false, 285, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (439, 'Pesto Gnocchi', 27, 2622, false, 395, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (440, 'Lemon Garlic Shrimp', 458, 2149, false, 418, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (441, 'Coconut Curry Chicken', 958, 3493, false, 54, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (442, 'Cajun Jambalaya', 795, 4482, false, 110, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (443, 'Szechuan Tofu', 344, 1898, true, 125, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (444, 'Tofu Pad Thai', 923, 4927, true, 175, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (445, 'Shrimp Scampi', 760, 112, false, 176, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (446, 'Stuffed Cabbage Rolls', 428, 2485, false, 6, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (447, 'Lemon Herb Chicken', 709, 4201, false, 224, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (448, 'Tofu Pad Thai', 25, 3144, false, 467, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (449, 'Mushroom Risotto', 912, 1142, false, 172, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (450, 'Vegetable Stir Fry', 745, 2859, false, 236, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (451, 'BBQ Ribs', 632, 4257, false, 76, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (452, 'Butternut Squash Soup', 768, 3220, false, 440, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (453, 'Crispy Pork Belly', 767, 4032, false, 197, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (454, 'Lobster Mac and Cheese', 563, 409, true, 398, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (455, 'Pumpkin Risotto', 581, 2755, false, 249, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (456, 'Cajun Jambalaya', 898, 684, false, 93, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (457, 'Coconut Curry Chicken', 722, 2700, false, 234, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (458, 'Pad See Ew', 118, 572, false, 281, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (459, 'Shrimp Tacos', 602, 3285, false, 106, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (460, 'Teriyaki Tofu Bowl', 956, 847, false, 461, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (461, 'Lemon Garlic Shrimp', 903, 4433, true, 61, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (462, 'Cuban Sandwich', 317, 165, true, 72, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (463, 'Pasta Primavera', 598, 978, true, 14, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (464, 'Spaghetti Carbonara', 328, 2324, false, 162, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (465, 'Ratatouille', 921, 788, true, 328, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (466, 'Hawaiian Poke Bowl', 554, 456, false, 20, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (467, 'Chicken Alfredo', 638, 1289, false, 377, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (468, 'Stuffed Cabbage Rolls', 421, 3654, false, 113, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (469, 'Crispy Pork Belly', 691, 1334, true, 36, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (470, 'Caprese Salad', 414, 4798, true, 497, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (471, 'Vegan Lentil Curry', 784, 2261, false, 125, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (472, 'Szechuan Tofu', 376, 3763, false, 349, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (473, 'Shrimp Scampi', 725, 1358, true, 396, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (474, 'Chili Con Carne', 294, 3189, false, 397, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (475, 'Tofu Pad Thai', 229, 3573, true, 422, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (476, 'Cajun Jambalaya', 999, 4060, false, 496, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (477, 'Moroccan Couscous', 103, 4462, false, 164, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (478, 'Chicken Alfredo', 311, 4524, false, 200, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (479, 'Spinach Artichoke Pasta', 797, 1123, true, 30, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (480, 'Buffalo Cauliflower Wings', 627, 1582, true, 19, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (481, 'Eggplant Parmesan', 909, 911, false, 123, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (482, 'Lemon Herb Chicken', 822, 491, true, 429, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (483, 'Mushroom Risotto', 548, 3095, false, 441, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (484, 'Szechuan Tofu', 860, 69, true, 395, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (485, 'Lemon Garlic Shrimp', 263, 629, false, 123, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (486, 'Garlic Butter Scallops', 788, 1282, true, 177, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (487, 'Salmon Teriyaki', 508, 3409, false, 124, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (488, 'Teriyaki Salmon Bowl', 712, 512, true, 277, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (489, 'Chicken Alfredo', 469, 105, true, 46, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (490, 'Chicken Tikka Masala', 201, 1271, true, 403, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (491, 'Baked Ziti', 97, 1719, true, 238, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (492, 'Spaghetti Carbonara', 90, 2125, true, 461, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (493, 'Mushroom Risotto', 518, 1448, true, 430, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (494, 'BBQ Ribs', 121, 1521, false, 118, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (495, 'Teriyaki Salmon Bowl', 230, 4349, true, 472, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (496, 'Pumpkin Risotto', 673, 4474, true, 183, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (497, 'Beef Stroganoff', 615, 2848, false, 355, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (498, 'Greek Moussaka', 228, 698, true, 498, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (499, 'Miso Glazed Cod', 60, 2517, false, 495, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (500, 'Chicken Alfredo', 917, 1178, true, 447, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (501, 'Coconut Curry Chicken', 561, 4706, true, 334, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (502, 'Moroccan Couscous', 956, 402, true, 266, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (503, 'Buffalo Cauliflower Wings', 532, 399, false, 119, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (504, 'Eggplant Parmesan', 158, 3828, true, 244, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (505, 'Sesame Ginger Noodles', 569, 4236, true, 276, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (506, 'Pad See Ew', 439, 1225, true, 296, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (507, 'Hawaiian Poke Bowl', 194, 4622, true, 298, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (508, 'Eggplant Parmesan', 768, 2278, false, 286, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (509, 'Hawaiian Poke Bowl', 966, 456, false, 352, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (510, 'Pineapple Fried Rice', 359, 4829, false, 247, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (511, 'Vegetable Stir Fry', 804, 3918, true, 416, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (512, 'Teriyaki Tofu Bowl', 789, 2603, false, 123, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (513, 'BBQ Ribs', 631, 4752, true, 213, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (514, 'Chicken Alfredo', 630, 4680, true, 320, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (515, 'Salmon Teriyaki', 912, 1291, false, 70, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (516, 'Lemon Garlic Shrimp', 411, 1589, false, 95, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (517, 'Pesto Gnocchi', 452, 1867, false, 245, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (518, 'Vegetarian Bibimbap', 628, 1979, true, 151, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (519, 'Moroccan Couscous', 914, 692, false, 262, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (520, 'Vegan Lentil Curry', 445, 245, false, 122, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (521, 'Sesame Ginger Noodles', 599, 4181, true, 411, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (522, 'Teriyaki Tofu Bowl', 506, 1027, false, 203, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (523, 'Pineapple Fried Rice', 609, 499, false, 153, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (524, 'Tofu Pad Thai', 585, 4407, true, 305, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (525, 'Mongolian Beef', 163, 401, false, 273, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (526, 'Baked Ziti', 670, 541, false, 286, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (527, 'Miso Glazed Cod', 106, 4471, false, 62, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (528, 'Cajun Jambalaya', 168, 1656, true, 78, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (529, 'Greek Moussaka', 475, 2635, false, 227, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (530, 'Pumpkin Risotto', 306, 435, true, 42, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (531, 'Shrimp Scampi', 699, 2462, false, 278, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (532, 'BBQ Ribs', 211, 2246, false, 106, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (533, 'Stuffed Cabbage Rolls', 176, 3294, false, 126, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (534, 'Coconut Curry Chicken', 740, 3765, true, 97, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (535, 'Cuban Sandwich', 50, 3596, true, 148, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (536, 'Shrimp Scampi', 556, 3876, false, 427, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (537, 'Garlic Butter Scallops', 307, 2884, true, 378, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (538, 'Stuffed Cabbage Rolls', 340, 2565, true, 328, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (539, 'Shrimp Tacos', 651, 3475, false, 208, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (540, 'Shrimp Scampi', 443, 335, true, 73, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (541, 'Crispy Pork Belly', 236, 4533, false, 416, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (542, 'Mongolian Beef', 615, 1409, true, 375, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (543, 'Vegetarian Bibimbap', 375, 251, false, 61, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (544, 'Pad See Ew', 848, 1757, false, 90, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (545, 'Pasta Primavera', 349, 3388, true, 496, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (546, 'Teriyaki Salmon Bowl', 694, 3828, true, 104, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (547, 'Vegetarian Bibimbap', 485, 4596, false, 188, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (548, 'Greek Moussaka', 143, 3012, false, 246, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (549, 'Chicken Tikka Masala', 127, 87, true, 345, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (550, 'Coconut Curry Chicken', 12, 1442, true, 189, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (551, 'Lemon Garlic Shrimp', 443, 4215, true, 493, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (552, 'Spaghetti Carbonara', 868, 3581, false, 363, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (553, 'Pad See Ew', 433, 1540, false, 34, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (554, 'Pad See Ew', 784, 3713, true, 52, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (555, 'Spaghetti Carbonara', 935, 4393, false, 293, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (556, 'Cuban Sandwich', 179, 2688, false, 332, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (557, 'Moroccan Couscous', 788, 4686, true, 478, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (558, 'Butternut Squash Soup', 80, 1736, true, 219, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (559, 'Chili Con Carne', 808, 2407, true, 74, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (560, 'Vegetarian Bibimbap', 538, 4375, false, 265, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (561, 'Szechuan Tofu', 825, 2076, true, 468, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (562, 'Moroccan Couscous', 775, 3364, false, 112, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (563, 'Stuffed Cabbage Rolls', 572, 2465, true, 236, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (564, 'Tofu Pad Thai', 940, 2, false, 188, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (565, 'Lobster Mac and Cheese', 507, 2951, true, 205, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (566, 'Chili Con Carne', 116, 1751, false, 247, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (567, 'Mushroom Risotto', 625, 2535, true, 45, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (568, 'Pad See Ew', 926, 3331, true, 87, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (569, 'Chili Con Carne', 675, 450, true, 203, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (570, 'Vegetarian Bibimbap', 446, 1776, true, 429, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (571, 'Vegetable Stir Fry', 876, 3041, true, 292, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (572, 'Shrimp Scampi', 809, 869, true, 338, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (573, 'Caprese Salad', 105, 1370, true, 78, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (574, 'Stuffed Cabbage Rolls', 448, 2895, true, 63, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (575, 'Eggplant Parmesan', 819, 1005, true, 460, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (576, 'Garlic Butter Scallops', 871, 4108, true, 7, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (577, 'Coconut Curry Chicken', 562, 316, true, 29, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (578, 'Crispy Tofu Tacos', 244, 741, true, 419, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (579, 'Pork Schnitzel', 8, 720, true, 247, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (580, 'Tofu Pad Thai', 190, 2815, false, 61, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (581, 'Turkey Meatloaf', 625, 2734, false, 201, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (582, 'Pumpkin Risotto', 429, 71, true, 140, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (583, 'Vegetarian Bibimbap', 456, 4469, true, 24, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (584, 'Vegan Lentil Curry', 978, 3369, true, 321, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (585, 'Spinach Artichoke Pasta', 112, 3541, true, 480, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (586, 'Quinoa Stuffed Peppers', 628, 3561, false, 390, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (587, 'Turkey Meatloaf', 916, 2721, true, 237, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (588, 'Mongolian Beef', 770, 2298, true, 230, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (589, 'Stuffed Cabbage Rolls', 835, 756, true, 190, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (590, 'Quinoa Stuffed Peppers', 349, 1171, true, 306, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (591, 'Sesame Ginger Noodles', 207, 3717, false, 116, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (592, 'Crispy Tofu Tacos', 837, 637, false, 334, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (593, 'Crispy Tofu Tacos', 607, 1572, false, 293, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (594, 'Miso Glazed Cod', 516, 2959, false, 303, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (595, 'BBQ Ribs', 929, 2695, true, 347, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (596, 'Teriyaki Tofu Bowl', 364, 3408, true, 470, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (597, 'Vegetable Stir Fry', 428, 1444, true, 423, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (598, 'Spinach Artichoke Pasta', 534, 1176, false, 258, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (599, 'Crispy Tofu Tacos', 375, 2915, false, 363, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (600, 'Beef Stroganoff', 880, 2034, true, 41, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (601, 'Teriyaki Salmon Bowl', 157, 4792, false, 474, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (602, 'Crispy Pork Belly', 809, 2353, true, 458, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (603, 'Pesto Gnocchi', 470, 3120, false, 182, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (604, 'Cuban Sandwich', 264, 3150, true, 461, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (605, 'Lemon Herb Chicken', 108, 4588, false, 482, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (606, 'Beef Stroganoff', 563, 4610, false, 436, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (607, 'Chicken Shawarma', 322, 2641, true, 146, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (608, 'Hawaiian Poke Bowl', 710, 1174, false, 377, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (609, 'Sesame Ginger Noodles', 191, 1232, true, 448, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (610, 'Beef Stroganoff', 636, 1965, false, 301, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (611, 'Pumpkin Risotto', 375, 3139, false, 286, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (612, 'Caprese Salad', 227, 3100, false, 83, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (613, 'Mongolian Beef', 718, 1869, true, 191, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (614, 'Pineapple Fried Rice', 213, 4847, true, 372, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (615, 'Teriyaki Tofu Bowl', 102, 3759, false, 216, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (616, 'Chicken Alfredo', 791, 3933, false, 220, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (617, 'Salmon Teriyaki', 341, 1356, false, 147, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (618, 'Chicken Shawarma', 396, 4834, false, 403, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (619, 'Chicken Alfredo', 458, 74, false, 279, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (620, 'Miso Glazed Cod', 375, 1644, false, 311, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (621, 'Crispy Tofu Tacos', 998, 656, false, 478, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (622, 'Mongolian Beef', 461, 2155, true, 307, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (623, 'Cajun Jambalaya', 137, 2664, true, 73, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (624, 'Shrimp Scampi', 440, 3384, true, 168, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (625, 'Cajun Jambalaya', 235, 1360, false, 316, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (626, 'Chicken Tikka Masala', 405, 872, true, 68, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (627, 'Turkey Meatloaf', 381, 4700, true, 428, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (628, 'Pork Schnitzel', 994, 4926, false, 477, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (629, 'Vegan Lentil Curry', 478, 2565, false, 373, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (630, 'Stuffed Cabbage Rolls', 15, 3712, true, 444, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (631, 'Cuban Sandwich', 469, 1157, true, 344, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (632, 'Teriyaki Tofu Bowl', 910, 3704, true, 135, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (633, 'Coconut Curry Chicken', 117, 3137, true, 293, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (634, 'Vegan Lentil Curry', 959, 2598, true, 227, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (635, 'Lemon Herb Chicken', 732, 2466, true, 472, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (636, 'Spaghetti Carbonara', 262, 4162, false, 427, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (637, 'Hawaiian Poke Bowl', 104, 157, false, 409, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (638, 'Hawaiian Poke Bowl', 999, 4165, true, 71, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (639, 'Spinach Artichoke Pasta', 926, 4270, true, 367, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (640, 'Mushroom Risotto', 329, 4366, false, 49, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (641, 'Caprese Salad', 435, 2464, false, 281, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (642, 'Stuffed Cabbage Rolls', 488, 43, true, 107, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (643, 'Tofu Pad Thai', 612, 2623, true, 132, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (644, 'Buffalo Cauliflower Wings', 774, 4511, true, 450, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (645, 'Szechuan Tofu', 495, 4909, false, 328, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (646, 'Szechuan Tofu', 861, 1804, false, 63, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (647, 'Eggplant Parmesan', 374, 854, false, 204, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (648, 'Pasta Primavera', 684, 3225, false, 241, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (649, 'Teriyaki Salmon Bowl', 735, 2308, true, 24, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (650, 'Eggplant Parmesan', 57, 715, true, 320, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (651, 'Pad See Ew', 361, 1051, false, 18, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (652, 'Chili Con Carne', 562, 3890, false, 152, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (653, 'Chicken Tikka Masala', 734, 1000, false, 96, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (654, 'Chicken Shawarma', 849, 1952, true, 71, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (655, 'Szechuan Tofu', 571, 2368, false, 217, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (656, 'Pumpkin Risotto', 725, 3563, false, 283, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (657, 'Chili Con Carne', 364, 4934, false, 485, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (658, 'BBQ Ribs', 369, 3489, false, 225, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (659, 'Chicken Tikka Masala', 570, 4533, false, 408, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (660, 'Shrimp Scampi', 541, 4482, true, 184, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (661, 'Miso Glazed Cod', 257, 1182, false, 345, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (662, 'Eggplant Parmesan', 760, 2202, true, 289, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (663, 'Crispy Tofu Tacos', 749, 3153, true, 45, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (664, 'Baked Ziti', 783, 4765, true, 248, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (665, 'Caprese Salad', 996, 3052, false, 120, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (666, 'Hawaiian Poke Bowl', 780, 835, false, 253, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (667, 'Hawaiian Poke Bowl', 572, 1409, false, 397, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (668, 'Tofu Pad Thai', 953, 3073, true, 249, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (669, 'Lobster Mac and Cheese', 618, 4535, true, 204, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (670, 'Ratatouille', 305, 1329, true, 349, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (671, 'Pork Schnitzel', 759, 4549, false, 479, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (672, 'Lobster Mac and Cheese', 544, 1979, true, 161, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (673, 'Beef Stroganoff', 146, 2328, false, 204, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (674, 'Pineapple Fried Rice', 617, 2919, true, 51, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (675, 'Butternut Squash Soup', 27, 2770, true, 430, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (676, 'Baked Ziti', 949, 2784, false, 240, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (677, 'Chicken Alfredo', 25, 2054, true, 140, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (678, 'Teriyaki Salmon Bowl', 342, 4530, false, 434, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (679, 'Chili Con Carne', 903, 18, true, 85, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (680, 'Butternut Squash Soup', 375, 3594, true, 400, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (681, 'Pineapple Fried Rice', 929, 3859, false, 373, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (682, 'Sesame Ginger Noodles', 325, 153, false, 240, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (683, 'Butternut Squash Soup', 314, 1773, true, 210, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (684, 'Miso Glazed Cod', 874, 3171, false, 75, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (685, 'Caprese Salad', 576, 153, false, 435, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (686, 'Spinach Artichoke Pasta', 913, 2397, true, 148, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (687, 'Chicken Alfredo', 107, 2396, true, 464, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (688, 'Chicken Alfredo', 986, 2774, true, 235, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (689, 'Szechuan Tofu', 904, 1638, true, 496, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (690, 'Tofu Pad Thai', 575, 678, true, 5, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (691, 'Pineapple Fried Rice', 248, 4624, false, 330, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (692, 'BBQ Ribs', 433, 4359, false, 372, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (693, 'Eggplant Parmesan', 748, 652, false, 145, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (694, 'Pork Schnitzel', 443, 241, false, 129, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (695, 'Shrimp Scampi', 547, 4517, false, 237, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (696, 'Crispy Tofu Tacos', 105, 2667, false, 84, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (697, 'Chicken Shawarma', 342, 845, true, 127, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (698, 'Beef Stroganoff', 775, 3333, false, 440, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (699, 'Chicken Shawarma', 402, 3999, true, 326, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (700, 'Pesto Gnocchi', 783, 3154, true, 337, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (701, 'Lobster Mac and Cheese', 735, 3296, true, 221, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (702, 'Pasta Primavera', 992, 4526, false, 123, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (703, 'Szechuan Tofu', 461, 65, true, 240, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (704, 'Pad See Ew', 754, 1875, false, 442, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (705, 'Shrimp Scampi', 713, 3742, false, 402, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (706, 'Pumpkin Risotto', 595, 3526, false, 81, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (707, 'Teriyaki Tofu Bowl', 605, 4925, false, 436, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (708, 'Coconut Curry Chicken', 35, 4607, true, 131, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (709, 'Beef Stroganoff', 704, 182, true, 362, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (710, 'Lobster Mac and Cheese', 135, 2240, true, 418, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (711, 'Teriyaki Tofu Bowl', 206, 331, false, 430, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (712, 'Butternut Squash Soup', 864, 2309, true, 394, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (713, 'Caprese Salad', 449, 1681, false, 406, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (714, 'Shrimp Scampi', 314, 4784, false, 308, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (715, 'Chicken Tikka Masala', 415, 1191, false, 95, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (716, 'Salmon Teriyaki', 988, 3482, true, 183, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (717, 'Moroccan Couscous', 639, 174, false, 47, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (718, 'Ratatouille', 591, 4604, false, 405, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (719, 'Turkey Meatloaf', 556, 3854, true, 405, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (720, 'Ratatouille', 775, 3089, false, 269, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (721, 'Chicken Shawarma', 41, 3104, false, 308, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (722, 'Pumpkin Risotto', 308, 2967, true, 460, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (723, 'Lemon Garlic Shrimp', 199, 1899, true, 212, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (724, 'Shrimp Tacos', 256, 1798, false, 2, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (725, 'Tofu Pad Thai', 110, 3053, false, 46, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (726, 'Crispy Pork Belly', 538, 3179, true, 111, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (727, 'Cajun Jambalaya', 384, 276, true, 378, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (728, 'Mushroom Risotto', 204, 2842, true, 287, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (729, 'Eggplant Parmesan', 779, 2099, false, 331, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (730, 'Crispy Tofu Tacos', 421, 3911, false, 264, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (731, 'Vegetarian Bibimbap', 882, 2254, false, 428, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (732, 'Mushroom Risotto', 220, 610, false, 312, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (733, 'Mushroom Risotto', 797, 3495, false, 271, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (734, 'Chicken Shawarma', 463, 592, true, 278, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (735, 'Sesame Ginger Noodles', 127, 2337, false, 237, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (736, 'Shrimp Scampi', 177, 912, false, 303, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (737, 'Pad See Ew', 125, 3515, true, 13, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (738, 'Szechuan Tofu', 852, 4067, true, 436, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (739, 'Pesto Gnocchi', 604, 4048, false, 253, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (740, 'Pad See Ew', 910, 4982, false, 411, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (741, 'Greek Moussaka', 714, 2844, false, 13, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (742, 'Caprese Salad', 177, 1914, true, 468, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (743, 'Shrimp Scampi', 229, 984, false, 121, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (744, 'Quinoa Stuffed Peppers', 197, 3786, true, 312, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (745, 'Quinoa Stuffed Peppers', 112, 1259, true, 473, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (746, 'Pasta Primavera', 234, 1050, false, 445, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (747, 'Lemon Herb Chicken', 102, 4844, false, 77, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (748, 'Vegan Lentil Curry', 694, 2623, false, 354, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (749, 'Pineapple Fried Rice', 130, 4012, true, 110, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (750, 'Miso Glazed Cod', 116, 2033, false, 206, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (751, 'Chicken Alfredo', 626, 1968, true, 369, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (752, 'Garlic Butter Scallops', 140, 3646, true, 173, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (753, 'Turkey Meatloaf', 245, 4066, true, 438, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (754, 'Moroccan Couscous', 104, 857, false, 452, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (755, 'Lobster Mac and Cheese', 259, 3783, false, 385, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (756, 'Teriyaki Tofu Bowl', 116, 876, true, 283, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (757, 'Crispy Tofu Tacos', 700, 2650, false, 201, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (758, 'Tofu Pad Thai', 574, 4532, true, 354, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (759, 'Mongolian Beef', 345, 29, false, 449, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (760, 'Coconut Curry Chicken', 673, 974, true, 196, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (761, 'Chicken Tikka Masala', 129, 807, true, 246, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (762, 'Sesame Ginger Noodles', 733, 3933, true, 181, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (763, 'Spaghetti Carbonara', 587, 4784, false, 256, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (764, 'Butternut Squash Soup', 513, 2928, true, 84, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (765, 'Spinach Artichoke Pasta', 988, 1662, true, 11, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (766, 'Chicken Shawarma', 967, 4118, true, 205, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (767, 'Szechuan Tofu', 354, 1051, false, 17, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (768, 'Teriyaki Tofu Bowl', 768, 76, true, 498, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (769, 'Stuffed Cabbage Rolls', 146, 3708, true, 159, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (770, 'Crispy Pork Belly', 736, 1638, false, 444, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (771, 'Szechuan Tofu', 398, 1365, true, 449, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (772, 'Stuffed Cabbage Rolls', 517, 4562, true, 463, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (773, 'Caprese Salad', 812, 921, false, 443, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (774, 'Shrimp Scampi', 823, 3163, true, 25, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (775, 'Garlic Butter Scallops', 132, 3408, false, 476, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (776, 'Turkey Meatloaf', 12, 3710, true, 63, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (777, 'Buffalo Cauliflower Wings', 380, 676, true, 497, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (778, 'Turkey Meatloaf', 824, 493, true, 129, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (779, 'Stuffed Cabbage Rolls', 522, 3654, false, 465, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (780, 'Cajun Jambalaya', 963, 4837, true, 315, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (781, 'Mushroom Risotto', 391, 1426, false, 416, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (782, 'Tofu Pad Thai', 540, 1504, false, 305, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (783, 'Greek Moussaka', 592, 795, true, 282, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (784, 'Garlic Butter Scallops', 86, 917, true, 382, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (785, 'Chicken Alfredo', 182, 2339, true, 149, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (786, 'Chicken Tikka Masala', 282, 2477, true, 92, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (787, 'Ratatouille', 934, 1954, true, 104, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (788, 'Chili Con Carne', 817, 4839, true, 260, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (789, 'Lemon Herb Chicken', 213, 4337, false, 89, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (790, 'Cajun Jambalaya', 491, 436, false, 153, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (791, 'Pork Schnitzel', 369, 1435, false, 84, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (792, 'Ratatouille', 338, 800, false, 108, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (793, 'Lemon Garlic Shrimp', 243, 1024, true, 20, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (794, 'Chicken Shawarma', 306, 88, false, 135, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (795, 'Teriyaki Salmon Bowl', 180, 4693, false, 217, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (796, 'Pork Schnitzel', 789, 2636, false, 181, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (797, 'Tofu Pad Thai', 816, 2572, false, 469, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (798, 'Lobster Mac and Cheese', 357, 1985, true, 375, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (799, 'Tofu Pad Thai', 390, 3997, false, 212, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (800, 'Baked Ziti', 881, 2619, false, 230, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (801, 'Crispy Tofu Tacos', 903, 3182, true, 48, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (802, 'Butternut Squash Soup', 860, 3750, false, 354, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (803, 'Crispy Tofu Tacos', 394, 2107, false, 418, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (804, 'Vegan Lentil Curry', 627, 158, true, 468, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (805, 'Shrimp Tacos', 419, 480, true, 136, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (806, 'Pork Schnitzel', 100, 4607, true, 457, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (807, 'Vegetable Stir Fry', 288, 1336, false, 420, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (808, 'Chicken Alfredo', 72, 3052, true, 493, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (809, 'Crispy Tofu Tacos', 161, 376, true, 276, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (810, 'Tofu Pad Thai', 934, 4016, true, 145, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (811, 'Ratatouille', 131, 3670, false, 76, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (812, 'Caprese Salad', 105, 2557, false, 432, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (813, 'Teriyaki Tofu Bowl', 885, 4965, true, 117, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (814, 'Teriyaki Tofu Bowl', 337, 1653, true, 98, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (815, 'Shrimp Scampi', 953, 190, true, 209, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (816, 'Pesto Gnocchi', 442, 3453, true, 415, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (817, 'Lobster Mac and Cheese', 200, 4378, false, 225, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (818, 'Pad See Ew', 965, 881, true, 434, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (819, 'Shrimp Tacos', 571, 4476, false, 324, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (820, 'Salmon Teriyaki', 116, 3065, true, 437, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (821, 'Pad See Ew', 717, 197, true, 153, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (822, 'Pineapple Fried Rice', 159, 4484, false, 372, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (823, 'Vegan Lentil Curry', 926, 4043, false, 272, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (824, 'Caprese Salad', 684, 2609, false, 290, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (825, 'Greek Moussaka', 609, 3071, true, 130, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (826, 'Pineapple Fried Rice', 194, 248, true, 486, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (827, 'Pineapple Fried Rice', 88, 3074, false, 7, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (828, 'Quinoa Stuffed Peppers', 111, 1098, true, 31, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (829, 'Mongolian Beef', 344, 3979, false, 147, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (830, 'Garlic Butter Scallops', 419, 347, false, 120, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (831, 'Hawaiian Poke Bowl', 871, 237, true, 287, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (832, 'BBQ Ribs', 338, 3026, true, 362, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (833, 'Cajun Jambalaya', 467, 686, true, 127, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (834, 'Mongolian Beef', 240, 3667, true, 189, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (835, 'Mongolian Beef', 996, 2165, true, 448, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (836, 'Pesto Gnocchi', 964, 2377, false, 275, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (837, 'Crispy Tofu Tacos', 149, 975, false, 302, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (838, 'Vegetarian Bibimbap', 392, 4325, false, 170, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (839, 'Miso Glazed Cod', 499, 3630, false, 358, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (840, 'Caprese Salad', 963, 983, true, 494, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (841, 'Vegetable Stir Fry', 254, 3010, true, 369, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (842, 'Caprese Salad', 562, 1653, false, 168, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (843, 'Garlic Butter Scallops', 642, 1226, true, 129, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (844, 'Pumpkin Risotto', 311, 541, true, 157, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (845, 'Chicken Alfredo', 490, 4439, true, 423, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (846, 'Spinach Artichoke Pasta', 168, 435, false, 340, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (847, 'Garlic Butter Scallops', 447, 1263, false, 450, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (848, 'Cajun Jambalaya', 318, 3030, false, 336, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (849, 'Crispy Pork Belly', 64, 2852, true, 70, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (850, 'Quinoa Stuffed Peppers', 882, 463, false, 205, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (851, 'Teriyaki Tofu Bowl', 109, 3711, false, 31, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (852, 'Chicken Alfredo', 181, 1113, true, 110, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (853, 'Miso Glazed Cod', 580, 1524, true, 303, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (854, 'Sesame Ginger Noodles', 34, 1016, true, 341, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (855, 'Butternut Squash Soup', 484, 352, false, 45, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (856, 'Beef Stroganoff', 800, 715, false, 301, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (857, 'Shrimp Tacos', 419, 1794, false, 318, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (858, 'Spinach Artichoke Pasta', 604, 1197, false, 138, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (859, 'Pasta Primavera', 479, 1612, true, 171, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (860, 'Moroccan Couscous', 674, 2578, true, 242, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (861, 'Lemon Herb Chicken', 436, 4982, true, 410, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (862, 'Vegetable Stir Fry', 883, 3463, false, 116, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (863, 'Lobster Mac and Cheese', 455, 4614, false, 259, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (864, 'BBQ Ribs', 479, 3847, true, 5, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (865, 'Caprese Salad', 516, 1837, false, 410, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (866, 'Lobster Mac and Cheese', 541, 1118, false, 3, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (867, 'Vegetarian Bibimbap', 93, 645, true, 158, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (868, 'Eggplant Parmesan', 517, 4493, false, 369, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (869, 'Butternut Squash Soup', 286, 1973, true, 203, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (870, 'Shrimp Tacos', 282, 118, true, 281, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (871, 'Crispy Pork Belly', 605, 2538, true, 74, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (872, 'Pumpkin Risotto', 492, 1019, false, 326, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (873, 'Baked Ziti', 68, 3521, true, 423, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (874, 'Chili Con Carne', 612, 3367, false, 493, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (875, 'Moroccan Couscous', 705, 1311, true, 179, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (876, 'Vegetarian Bibimbap', 249, 1823, true, 42, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (877, 'Mongolian Beef', 869, 3531, true, 385, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (878, 'Chili Con Carne', 538, 4570, true, 69, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (879, 'Vegan Lentil Curry', 563, 78, true, 406, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (880, 'Lemon Herb Chicken', 203, 2005, true, 451, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (881, 'Sesame Ginger Noodles', 26, 3504, false, 292, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (882, 'Szechuan Tofu', 906, 2728, true, 431, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (883, 'Garlic Butter Scallops', 18, 3906, false, 156, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (884, 'Teriyaki Tofu Bowl', 502, 3284, false, 244, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (885, 'Buffalo Cauliflower Wings', 338, 4414, true, 218, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (886, 'Coconut Curry Chicken', 234, 4813, true, 272, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (887, 'Crispy Tofu Tacos', 421, 4448, true, 49, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (888, 'BBQ Ribs', 276, 532, false, 398, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (889, 'Turkey Meatloaf', 480, 3850, true, 432, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (890, 'Pumpkin Risotto', 175, 2346, true, 208, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (891, 'Hawaiian Poke Bowl', 776, 2654, true, 237, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (892, 'Crispy Tofu Tacos', 630, 2853, false, 439, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (893, 'Vegetable Stir Fry', 580, 4835, false, 38, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (894, 'Ratatouille', 333, 4534, false, 381, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (895, 'Baked Ziti', 551, 2115, false, 200, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (896, 'Baked Ziti', 626, 4357, true, 316, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (897, 'Pumpkin Risotto', 690, 203, false, 406, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (898, 'Vegan Lentil Curry', 679, 3398, false, 20, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (899, 'Mushroom Risotto', 319, 2300, false, 40, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (900, 'Vegan Lentil Curry', 271, 3126, true, 200, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (901, 'Chicken Alfredo', 804, 3434, true, 410, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (902, 'Miso Glazed Cod', 282, 2165, false, 18, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (903, 'Sesame Ginger Noodles', 259, 2880, true, 434, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (904, 'Pesto Gnocchi', 601, 3837, false, 43, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (905, 'Caprese Salad', 947, 3914, true, 149, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (906, 'Mushroom Risotto', 779, 4719, true, 321, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (907, 'Cajun Jambalaya', 531, 4760, true, 240, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (908, 'Tofu Pad Thai', 758, 2722, false, 323, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (909, 'Moroccan Couscous', 727, 1481, false, 127, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (910, 'Miso Glazed Cod', 851, 2055, true, 204, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (911, 'Eggplant Parmesan', 315, 486, true, 273, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (912, 'Vegetable Stir Fry', 538, 2929, true, 473, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (913, 'Butternut Squash Soup', 120, 969, true, 449, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (914, 'Lobster Mac and Cheese', 532, 4657, true, 276, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (915, 'Pesto Gnocchi', 76, 815, false, 466, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (916, 'Teriyaki Salmon Bowl', 411, 1121, true, 496, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (917, 'Pineapple Fried Rice', 769, 4202, true, 165, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (918, 'Mongolian Beef', 901, 741, true, 362, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (919, 'Chicken Tikka Masala', 695, 1393, true, 128, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (920, 'Coconut Curry Chicken', 627, 1806, true, 66, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (921, 'Greek Moussaka', 25, 3926, true, 120, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (922, 'Mongolian Beef', 318, 3898, false, 492, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (923, 'Butternut Squash Soup', 526, 806, true, 365, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (924, 'Pasta Primavera', 449, 1882, false, 427, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (925, 'Spinach Artichoke Pasta', 922, 674, false, 177, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (926, 'Garlic Butter Scallops', 968, 1934, true, 260, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (927, 'Baked Ziti', 897, 675, false, 414, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (928, 'Teriyaki Salmon Bowl', 265, 996, true, 274, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (929, 'Vegetarian Bibimbap', 314, 62, false, 462, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (930, 'Lemon Garlic Shrimp', 122, 2598, false, 307, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (931, 'Spaghetti Carbonara', 936, 3564, false, 111, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (932, 'Garlic Butter Scallops', 400, 3133, false, 491, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (933, 'Salmon Teriyaki', 690, 3967, true, 410, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (934, 'Baked Ziti', 355, 412, false, 300, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (935, 'Tofu Pad Thai', 377, 1733, true, 182, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (936, 'Lobster Mac and Cheese', 343, 2925, true, 227, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (937, 'Shrimp Scampi', 334, 327, false, 292, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (938, 'Chicken Alfredo', 606, 2506, false, 343, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (939, 'Teriyaki Salmon Bowl', 175, 4751, false, 477, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (940, 'Mongolian Beef', 110, 4264, false, 318, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (941, 'Cajun Jambalaya', 392, 606, false, 239, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (942, 'Beef Stroganoff', 313, 2240, true, 109, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (943, 'Miso Glazed Cod', 917, 1579, false, 249, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (944, 'Turkey Meatloaf', 651, 2531, false, 30, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (945, 'Moroccan Couscous', 385, 4294, false, 316, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (946, 'Ratatouille', 682, 2282, true, 491, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (947, 'Vegan Lentil Curry', 192, 3179, false, 489, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (948, 'Eggplant Parmesan', 335, 537, false, 201, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (949, 'Lemon Herb Chicken', 679, 3937, false, 106, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (950, 'Salmon Teriyaki', 500, 227, false, 378, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (951, 'Quinoa Stuffed Peppers', 340, 4156, false, 493, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (952, 'Spaghetti Carbonara', 715, 2207, false, 362, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (953, 'BBQ Ribs', 372, 1124, true, 340, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (954, 'Chili Con Carne', 350, 2042, true, 219, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (955, 'Cuban Sandwich', 256, 3516, true, 210, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (956, 'Tofu Pad Thai', 611, 624, false, 54, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (957, 'Chicken Alfredo', 321, 2894, false, 150, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (958, 'Lemon Garlic Shrimp', 705, 1128, true, 366, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (959, 'Greek Moussaka', 802, 605, true, 153, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (960, 'Sesame Ginger Noodles', 605, 2230, false, 263, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (961, 'Lobster Mac and Cheese', 346, 1798, true, 233, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (962, 'Butternut Squash Soup', 176, 379, true, 439, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (963, 'Lemon Garlic Shrimp', 698, 3135, true, 205, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (964, 'Chicken Alfredo', 736, 4799, true, 156, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (965, 'Miso Glazed Cod', 218, 3223, false, 487, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (966, 'Spaghetti Carbonara', 848, 2788, true, 285, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (967, 'Szechuan Tofu', 641, 3673, true, 489, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (968, 'BBQ Ribs', 476, 384, false, 315, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (969, 'Vegetarian Bibimbap', 76, 3333, true, 372, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (970, 'Tofu Pad Thai', 172, 2839, true, 127, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (971, 'Cajun Jambalaya', 122, 862, false, 449, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (972, 'Caprese Salad', 834, 246, false, 435, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (973, 'Pasta Primavera', 16, 706, true, 56, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (974, 'Lemon Herb Chicken', 498, 3295, true, 467, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (975, 'Chicken Tikka Masala', 75, 2488, true, 137, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (976, 'Spinach Artichoke Pasta', 331, 3878, false, 124, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (977, 'Pumpkin Risotto', 571, 2805, true, 36, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (978, 'Baked Ziti', 954, 284, true, 217, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (979, 'Eggplant Parmesan', 843, 117, true, 316, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (980, 'Shrimp Tacos', 174, 216, false, 379, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (981, 'Sesame Ginger Noodles', 798, 3359, true, 380, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (982, 'Shrimp Scampi', 13, 1074, false, 179, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (983, 'Coconut Curry Chicken', 711, 3813, false, 248, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (984, 'Spaghetti Carbonara', 190, 810, true, 97, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (985, 'Chili Con Carne', 481, 4596, false, 18, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (986, 'Chili Con Carne', 741, 4737, true, 316, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (987, 'Spaghetti Carbonara', 848, 1670, false, 361, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (988, 'Lemon Herb Chicken', 639, 3432, false, 259, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (989, 'Quinoa Stuffed Peppers', 253, 4808, true, 449, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (990, 'Pineapple Fried Rice', 340, 3019, false, 241, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (991, 'Garlic Butter Scallops', 431, 2220, true, 284, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (992, 'Shrimp Tacos', 908, 3933, false, 241, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (993, 'Pumpkin Risotto', 523, 1574, false, 245, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (994, 'Chicken Alfredo', 158, 743, true, 112, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (995, 'Stuffed Cabbage Rolls', 518, 2010, true, 314, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (996, 'Lemon Herb Chicken', 504, 282, false, 245, 1);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (997, 'Miso Glazed Cod', 205, 2459, true, 31, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (998, 'Shrimp Scampi', 386, 2836, false, 239, 3);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (999, 'Ratatouille', 917, 4838, true, 81, 2);
insert into Dishes (Id, name, price, calories, Available, RestaurantsId, CategoryId) values (1000, 'Mongolian Beef', 336, 3910, true, 210, 3);


insert into Waiter (id, RestaurantsId) values (1, 55);
insert into Waiter (id, RestaurantsId) values (2, 40);
insert into Waiter (id, RestaurantsId) values (3, 76);
insert into Waiter (id, RestaurantsId) values (4, 44);
insert into Waiter (id, RestaurantsId) values (5, 37);
insert into Waiter (id, RestaurantsId) values (6, 99);
insert into Waiter (id, RestaurantsId) values (7, 44);
insert into Waiter (id, RestaurantsId) values (8, 100);
insert into Waiter (id, RestaurantsId) values (9, 72);
insert into Waiter (id, RestaurantsId) values (10, 93);
insert into Waiter (id, RestaurantsId) values (11, 59);
insert into Waiter (id, RestaurantsId) values (12, 22);
insert into Waiter (id, RestaurantsId) values (13, 42);
insert into Waiter (id, RestaurantsId) values (14, 86);
insert into Waiter (id, RestaurantsId) values (15, 34);
insert into Waiter (id, RestaurantsId) values (16, 70);
insert into Waiter (id, RestaurantsId) values (17, 3);
insert into Waiter (id, RestaurantsId) values (18, 61);
insert into Waiter (id, RestaurantsId) values (19, 86);
insert into Waiter (id, RestaurantsId) values (20, 20);
insert into Waiter (id, RestaurantsId) values (21, 78);
insert into Waiter (id, RestaurantsId) values (22, 18);
insert into Waiter (id, RestaurantsId) values (23, 98);
insert into Waiter (id, RestaurantsId) values (24, 52);
insert into Waiter (id, RestaurantsId) values (25, 74);
insert into Waiter (id, RestaurantsId) values (26, 18);
insert into Waiter (id, RestaurantsId) values (27, 16);
insert into Waiter (id, RestaurantsId) values (28, 1);
insert into Waiter (id, RestaurantsId) values (29, 24);
insert into Waiter (id, RestaurantsId) values (30, 40);
insert into Waiter (id, RestaurantsId) values (31, 9);
insert into Waiter (id, RestaurantsId) values (32, 100);
insert into Waiter (id, RestaurantsId) values (33, 17);
insert into Waiter (id, RestaurantsId) values (34, 18);
insert into Waiter (id, RestaurantsId) values (35, 55);
insert into Waiter (id, RestaurantsId) values (36, 91);
insert into Waiter (id, RestaurantsId) values (37, 78);
insert into Waiter (id, RestaurantsId) values (38, 1);
insert into Waiter (id, RestaurantsId) values (39, 37);
insert into Waiter (id, RestaurantsId) values (40, 100);
insert into Waiter (id, RestaurantsId) values (41, 56);
insert into Waiter (id, RestaurantsId) values (42, 51);
insert into Waiter (id, RestaurantsId) values (43, 97);
insert into Waiter (id, RestaurantsId) values (44, 8);
insert into Waiter (id, RestaurantsId) values (45, 59);
insert into Waiter (id, RestaurantsId) values (46, 74);
insert into Waiter (id, RestaurantsId) values (47, 17);
insert into Waiter (id, RestaurantsId) values (48, 15);
insert into Waiter (id, RestaurantsId) values (49, 75);
insert into Waiter (id, RestaurantsId) values (50, 92);
insert into Waiter (id, RestaurantsId) values (51, 18);
insert into Waiter (id, RestaurantsId) values (52, 84);
insert into Waiter (id, RestaurantsId) values (53, 47);
insert into Waiter (id, RestaurantsId) values (54, 18);
insert into Waiter (id, RestaurantsId) values (55, 29);
insert into Waiter (id, RestaurantsId) values (56, 86);
insert into Waiter (id, RestaurantsId) values (57, 65);
insert into Waiter (id, RestaurantsId) values (58, 35);
insert into Waiter (id, RestaurantsId) values (59, 74);
insert into Waiter (id, RestaurantsId) values (60, 18);
insert into Waiter (id, RestaurantsId) values (61, 87);
insert into Waiter (id, RestaurantsId) values (62, 57);
insert into Waiter (id, RestaurantsId) values (63, 67);
insert into Waiter (id, RestaurantsId) values (64, 26);
insert into Waiter (id, RestaurantsId) values (65, 22);
insert into Waiter (id, RestaurantsId) values (66, 17);
insert into Waiter (id, RestaurantsId) values (67, 62);
insert into Waiter (id, RestaurantsId) values (68, 56);
insert into Waiter (id, RestaurantsId) values (69, 88);
insert into Waiter (id, RestaurantsId) values (70, 85);
insert into Waiter (id, RestaurantsId) values (71, 31);
insert into Waiter (id, RestaurantsId) values (72, 80);
insert into Waiter (id, RestaurantsId) values (73, 16);
insert into Waiter (id, RestaurantsId) values (74, 80);
insert into Waiter (id, RestaurantsId) values (75, 65);
insert into Waiter (id, RestaurantsId) values (76, 50);
insert into Waiter (id, RestaurantsId) values (77, 4);
insert into Waiter (id, RestaurantsId) values (78, 98);
insert into Waiter (id, RestaurantsId) values (79, 27);
insert into Waiter (id, RestaurantsId) values (80, 10);
insert into Waiter (id, RestaurantsId) values (81, 2);
insert into Waiter (id, RestaurantsId) values (82, 79);
insert into Waiter (id, RestaurantsId) values (83, 60);
insert into Waiter (id, RestaurantsId) values (84, 77);
insert into Waiter (id, RestaurantsId) values (85, 37);
insert into Waiter (id, RestaurantsId) values (86, 49);
insert into Waiter (id, RestaurantsId) values (87, 99);
insert into Waiter (id, RestaurantsId) values (88, 49);
insert into Waiter (id, RestaurantsId) values (89, 72);
insert into Waiter (id, RestaurantsId) values (90, 93);
insert into Waiter (id, RestaurantsId) values (91, 93);
insert into Waiter (id, RestaurantsId) values (92, 9);
insert into Waiter (id, RestaurantsId) values (93, 97);
insert into Waiter (id, RestaurantsId) values (94, 38);
insert into Waiter (id, RestaurantsId) values (95, 16);
insert into Waiter (id, RestaurantsId) values (96, 86);
insert into Waiter (id, RestaurantsId) values (97, 4);
insert into Waiter (id, RestaurantsId) values (98, 9);
insert into Waiter (id, RestaurantsId) values (99, 25);
insert into Waiter (id, RestaurantsId) values (100, 57);
insert into Waiter (id, RestaurantsId) values (101, 59);
insert into Waiter (id, RestaurantsId) values (102, 44);
insert into Waiter (id, RestaurantsId) values (103, 81);
insert into Waiter (id, RestaurantsId) values (104, 91);
insert into Waiter (id, RestaurantsId) values (105, 23);
insert into Waiter (id, RestaurantsId) values (106, 91);
insert into Waiter (id, RestaurantsId) values (107, 80);
insert into Waiter (id, RestaurantsId) values (108, 32);
insert into Waiter (id, RestaurantsId) values (109, 48);
insert into Waiter (id, RestaurantsId) values (110, 76);
insert into Waiter (id, RestaurantsId) values (111, 57);
insert into Waiter (id, RestaurantsId) values (112, 18);
insert into Waiter (id, RestaurantsId) values (113, 89);
insert into Waiter (id, RestaurantsId) values (114, 11);
insert into Waiter (id, RestaurantsId) values (115, 36);
insert into Waiter (id, RestaurantsId) values (116, 72);
insert into Waiter (id, RestaurantsId) values (117, 13);
insert into Waiter (id, RestaurantsId) values (118, 93);
insert into Waiter (id, RestaurantsId) values (119, 35);
insert into Waiter (id, RestaurantsId) values (120, 44);
insert into Waiter (id, RestaurantsId) values (121, 48);
insert into Waiter (id, RestaurantsId) values (122, 18);
insert into Waiter (id, RestaurantsId) values (123, 28);
insert into Waiter (id, RestaurantsId) values (124, 85);
insert into Waiter (id, RestaurantsId) values (125, 52);
insert into Waiter (id, RestaurantsId) values (126, 77);
insert into Waiter (id, RestaurantsId) values (127, 22);
insert into Waiter (id, RestaurantsId) values (128, 28);
insert into Waiter (id, RestaurantsId) values (129, 97);
insert into Waiter (id, RestaurantsId) values (130, 28);
insert into Waiter (id, RestaurantsId) values (131, 85);
insert into Waiter (id, RestaurantsId) values (132, 93);
insert into Waiter (id, RestaurantsId) values (133, 23);
insert into Waiter (id, RestaurantsId) values (134, 20);
insert into Waiter (id, RestaurantsId) values (135, 29);
insert into Waiter (id, RestaurantsId) values (136, 44);
insert into Waiter (id, RestaurantsId) values (137, 71);
insert into Waiter (id, RestaurantsId) values (138, 79);
insert into Waiter (id, RestaurantsId) values (139, 14);
insert into Waiter (id, RestaurantsId) values (140, 41);
insert into Waiter (id, RestaurantsId) values (141, 98);
insert into Waiter (id, RestaurantsId) values (142, 71);
insert into Waiter (id, RestaurantsId) values (143, 72);
insert into Waiter (id, RestaurantsId) values (144, 7);
insert into Waiter (id, RestaurantsId) values (145, 53);
insert into Waiter (id, RestaurantsId) values (146, 16);
insert into Waiter (id, RestaurantsId) values (147, 95);
insert into Waiter (id, RestaurantsId) values (148, 10);
insert into Waiter (id, RestaurantsId) values (149, 21);
insert into Waiter (id, RestaurantsId) values (150, 58);
insert into Waiter (id, RestaurantsId) values (151, 41);
insert into Waiter (id, RestaurantsId) values (152, 35);
insert into Waiter (id, RestaurantsId) values (153, 86);
insert into Waiter (id, RestaurantsId) values (154, 42);
insert into Waiter (id, RestaurantsId) values (155, 67);
insert into Waiter (id, RestaurantsId) values (156, 98);
insert into Waiter (id, RestaurantsId) values (157, 28);
insert into Waiter (id, RestaurantsId) values (158, 62);
insert into Waiter (id, RestaurantsId) values (159, 41);
insert into Waiter (id, RestaurantsId) values (160, 24);
insert into Waiter (id, RestaurantsId) values (161, 39);
insert into Waiter (id, RestaurantsId) values (162, 6);
insert into Waiter (id, RestaurantsId) values (163, 22);
insert into Waiter (id, RestaurantsId) values (164, 16);
insert into Waiter (id, RestaurantsId) values (165, 85);
insert into Waiter (id, RestaurantsId) values (166, 71);
insert into Waiter (id, RestaurantsId) values (167, 5);
insert into Waiter (id, RestaurantsId) values (168, 71);
insert into Waiter (id, RestaurantsId) values (169, 4);
insert into Waiter (id, RestaurantsId) values (170, 85);
insert into Waiter (id, RestaurantsId) values (171, 19);
insert into Waiter (id, RestaurantsId) values (172, 75);
insert into Waiter (id, RestaurantsId) values (173, 97);
insert into Waiter (id, RestaurantsId) values (174, 82);
insert into Waiter (id, RestaurantsId) values (175, 39);
insert into Waiter (id, RestaurantsId) values (176, 12);
insert into Waiter (id, RestaurantsId) values (177, 49);
insert into Waiter (id, RestaurantsId) values (178, 30);
insert into Waiter (id, RestaurantsId) values (179, 79);
insert into Waiter (id, RestaurantsId) values (180, 61);
insert into Waiter (id, RestaurantsId) values (181, 18);
insert into Waiter (id, RestaurantsId) values (182, 44);
insert into Waiter (id, RestaurantsId) values (183, 36);
insert into Waiter (id, RestaurantsId) values (184, 14);
insert into Waiter (id, RestaurantsId) values (185, 83);
insert into Waiter (id, RestaurantsId) values (186, 51);
insert into Waiter (id, RestaurantsId) values (187, 71);
insert into Waiter (id, RestaurantsId) values (188, 97);
insert into Waiter (id, RestaurantsId) values (189, 17);
insert into Waiter (id, RestaurantsId) values (190, 74);
insert into Waiter (id, RestaurantsId) values (191, 64);
insert into Waiter (id, RestaurantsId) values (192, 88);
insert into Waiter (id, RestaurantsId) values (193, 93);
insert into Waiter (id, RestaurantsId) values (194, 2);
insert into Waiter (id, RestaurantsId) values (195, 22);
insert into Waiter (id, RestaurantsId) values (196, 68);
insert into Waiter (id, RestaurantsId) values (197, 49);
insert into Waiter (id, RestaurantsId) values (198, 23);
insert into Waiter (id, RestaurantsId) values (199, 95);
insert into Waiter (id, RestaurantsId) values (200, 54);
insert into Waiter (id, RestaurantsId) values (201, 23);
insert into Waiter (id, RestaurantsId) values (202, 61);
insert into Waiter (id, RestaurantsId) values (203, 35);
insert into Waiter (id, RestaurantsId) values (204, 64);
insert into Waiter (id, RestaurantsId) values (205, 94);
insert into Waiter (id, RestaurantsId) values (206, 18);
insert into Waiter (id, RestaurantsId) values (207, 77);
insert into Waiter (id, RestaurantsId) values (208, 55);
insert into Waiter (id, RestaurantsId) values (209, 4);
insert into Waiter (id, RestaurantsId) values (210, 95);
insert into Waiter (id, RestaurantsId) values (211, 80);
insert into Waiter (id, RestaurantsId) values (212, 93);
insert into Waiter (id, RestaurantsId) values (213, 37);
insert into Waiter (id, RestaurantsId) values (214, 92);
insert into Waiter (id, RestaurantsId) values (215, 4);
insert into Waiter (id, RestaurantsId) values (216, 97);
insert into Waiter (id, RestaurantsId) values (217, 58);
insert into Waiter (id, RestaurantsId) values (218, 2);
insert into Waiter (id, RestaurantsId) values (219, 52);
insert into Waiter (id, RestaurantsId) values (220, 59);
insert into Waiter (id, RestaurantsId) values (221, 31);
insert into Waiter (id, RestaurantsId) values (222, 81);
insert into Waiter (id, RestaurantsId) values (223, 14);
insert into Waiter (id, RestaurantsId) values (224, 3);
insert into Waiter (id, RestaurantsId) values (225, 92);
insert into Waiter (id, RestaurantsId) values (226, 9);
insert into Waiter (id, RestaurantsId) values (227, 78);
insert into Waiter (id, RestaurantsId) values (228, 28);
insert into Waiter (id, RestaurantsId) values (229, 61);
insert into Waiter (id, RestaurantsId) values (230, 39);
insert into Waiter (id, RestaurantsId) values (231, 90);
insert into Waiter (id, RestaurantsId) values (232, 83);
insert into Waiter (id, RestaurantsId) values (233, 98);
insert into Waiter (id, RestaurantsId) values (234, 18);
insert into Waiter (id, RestaurantsId) values (235, 76);
insert into Waiter (id, RestaurantsId) values (236, 20);
insert into Waiter (id, RestaurantsId) values (237, 37);
insert into Waiter (id, RestaurantsId) values (238, 46);
insert into Waiter (id, RestaurantsId) values (239, 23);
insert into Waiter (id, RestaurantsId) values (240, 24);
insert into Waiter (id, RestaurantsId) values (241, 10);
insert into Waiter (id, RestaurantsId) values (242, 77);
insert into Waiter (id, RestaurantsId) values (243, 1);
insert into Waiter (id, RestaurantsId) values (244, 31);
insert into Waiter (id, RestaurantsId) values (245, 41);
insert into Waiter (id, RestaurantsId) values (246, 29);
insert into Waiter (id, RestaurantsId) values (247, 81);
insert into Waiter (id, RestaurantsId) values (248, 32);
insert into Waiter (id, RestaurantsId) values (249, 64);
insert into Waiter (id, RestaurantsId) values (250, 44);
insert into Waiter (id, RestaurantsId) values (251, 50);
insert into Waiter (id, RestaurantsId) values (252, 74);
insert into Waiter (id, RestaurantsId) values (253, 12);
insert into Waiter (id, RestaurantsId) values (254, 72);
insert into Waiter (id, RestaurantsId) values (255, 68);
insert into Waiter (id, RestaurantsId) values (256, 5);
insert into Waiter (id, RestaurantsId) values (257, 9);
insert into Waiter (id, RestaurantsId) values (258, 63);
insert into Waiter (id, RestaurantsId) values (259, 74);
insert into Waiter (id, RestaurantsId) values (260, 38);
insert into Waiter (id, RestaurantsId) values (261, 15);
insert into Waiter (id, RestaurantsId) values (262, 68);
insert into Waiter (id, RestaurantsId) values (263, 43);
insert into Waiter (id, RestaurantsId) values (264, 11);
insert into Waiter (id, RestaurantsId) values (265, 61);
insert into Waiter (id, RestaurantsId) values (266, 14);
insert into Waiter (id, RestaurantsId) values (267, 84);
insert into Waiter (id, RestaurantsId) values (268, 33);
insert into Waiter (id, RestaurantsId) values (269, 80);
insert into Waiter (id, RestaurantsId) values (270, 5);
insert into Waiter (id, RestaurantsId) values (271, 81);
insert into Waiter (id, RestaurantsId) values (272, 65);
insert into Waiter (id, RestaurantsId) values (273, 32);
insert into Waiter (id, RestaurantsId) values (274, 85);
insert into Waiter (id, RestaurantsId) values (275, 58);
insert into Waiter (id, RestaurantsId) values (276, 77);
insert into Waiter (id, RestaurantsId) values (277, 53);
insert into Waiter (id, RestaurantsId) values (278, 56);
insert into Waiter (id, RestaurantsId) values (279, 8);
insert into Waiter (id, RestaurantsId) values (280, 78);
insert into Waiter (id, RestaurantsId) values (281, 56);
insert into Waiter (id, RestaurantsId) values (282, 89);
insert into Waiter (id, RestaurantsId) values (283, 22);
insert into Waiter (id, RestaurantsId) values (284, 34);
insert into Waiter (id, RestaurantsId) values (285, 100);
insert into Waiter (id, RestaurantsId) values (286, 9);
insert into Waiter (id, RestaurantsId) values (287, 3);
insert into Waiter (id, RestaurantsId) values (288, 64);
insert into Waiter (id, RestaurantsId) values (289, 89);
insert into Waiter (id, RestaurantsId) values (290, 52);
insert into Waiter (id, RestaurantsId) values (291, 36);
insert into Waiter (id, RestaurantsId) values (292, 6);
insert into Waiter (id, RestaurantsId) values (293, 22);
insert into Waiter (id, RestaurantsId) values (294, 57);
insert into Waiter (id, RestaurantsId) values (295, 50);
insert into Waiter (id, RestaurantsId) values (296, 7);
insert into Waiter (id, RestaurantsId) values (297, 75);
insert into Waiter (id, RestaurantsId) values (298, 28);
insert into Waiter (id, RestaurantsId) values (299, 20);
insert into Waiter (id, RestaurantsId) values (300, 7);



insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (303, 53, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (304, 79, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (305, 87, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (306, 76, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (307, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (308, 78, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (309, 9, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (310, 93, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (311, 9, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (312, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (313, 15, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (314, 67, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (315, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (316, 75, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (317, 84, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (318, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (319, 38, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (320, 42, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (321, 71, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (322, 98, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (323, 62, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (324, 67, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (325, 62, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (326, 14, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (327, 63, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (328, 67, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (329, 95, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (330, 60, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (331, 25, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (332, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (333, 10, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (334, 32, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (335, 11, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (336, 76, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (337, 14, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (338, 83, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (339, 59, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (340, 10, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (341, 82, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (342, 20, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (343, 93, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (344, 92, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (345, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (346, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (347, 61, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (348, 61, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (349, 42, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (350, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (351, 73, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (352, 95, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (353, 13, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (354, 81, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (355, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (356, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (357, 89, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (358, 27, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (359, 14, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (360, 91, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (361, 59, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (362, 20, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (363, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (364, 83, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (365, 69, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (366, 100, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (367, 18, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (368, 93, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (369, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (370, 82, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (371, 82, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (372, 99, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (373, 40, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (374, 99, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (375, 87, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (376, 27, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (377, 80, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (378, 25, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (379, 38, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (380, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (381, 63, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (382, 11, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (383, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (384, 16, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (385, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (386, 67, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (387, 52, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (388, 87, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (389, 36, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (390, 43, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (391, 30, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (392, 9, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (393, 65, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (394, 49, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (395, 91, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (396, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (397, 5, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (398, 10, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (399, 21, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (400, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (401, 61, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (402, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (403, 75, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (404, 57, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (405, 14, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (406, 18, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (407, 7, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (408, 52, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (409, 49, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (410, 84, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (411, 66, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (412, 43, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (413, 5, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (414, 96, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (415, 77, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (416, 74, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (417, 81, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (418, 86, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (419, 25, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (420, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (421, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (422, 47, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (423, 13, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (424, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (425, 8, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (426, 18, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (427, 16, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (428, 30, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (429, 43, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (430, 70, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (431, 25, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (432, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (433, 13, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (434, 38, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (435, 40, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (436, 88, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (437, 5, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (438, 47, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (439, 80, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (440, 51, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (441, 55, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (442, 50, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (443, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (444, 36, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (445, 63, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (446, 32, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (447, 55, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (448, 24, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (449, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (450, 6, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (451, 49, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (452, 45, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (453, 45, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (454, 99, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (455, 62, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (456, 33, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (457, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (458, 92, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (459, 87, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (460, 23, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (461, 95, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (462, 78, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (463, 24, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (464, 70, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (465, 57, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (466, 53, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (467, 59, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (468, 33, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (469, 56, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (470, 88, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (471, 47, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (472, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (473, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (474, 60, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (475, 67, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (476, 12, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (477, 19, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (478, 62, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (479, 74, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (480, 76, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (481, 30, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (482, 12, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (483, 48, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (484, 59, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (485, 83, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (486, 32, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (487, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (488, 19, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (489, 47, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (490, 19, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (491, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (492, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (493, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (494, 83, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (495, 85, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (496, 92, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (497, 90, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (498, 100, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (499, 96, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (500, 5, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (501, 81, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (502, 74, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (503, 14, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (504, 7, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (505, 49, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (506, 84, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (507, 3, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (508, 64, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (509, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (510, 84, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (511, 43, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (512, 66, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (513, 100, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (514, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (515, 11, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (516, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (517, 72, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (518, 100, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (519, 23, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (520, 23, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (521, 19, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (522, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (523, 83, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (524, 39, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (525, 90, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (526, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (527, 49, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (528, 68, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (529, 40, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (530, 99, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (531, 75, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (532, 91, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (533, 28, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (534, 72, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (535, 23, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (536, 70, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (537, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (538, 21, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (539, 73, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (540, 73, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (541, 89, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (542, 79, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (543, 20, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (544, 39, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (545, 80, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (546, 81, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (547, 12, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (548, 52, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (549, 76, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (550, 50, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (551, 5, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (552, 41, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (553, 33, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (554, 51, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (555, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (556, 69, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (557, 8, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (558, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (559, 91, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (560, 29, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (561, 47, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (562, 93, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (563, 89, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (564, 90, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (565, 94, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (566, 45, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (567, 3, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (568, 97, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (569, 26, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (570, 37, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (571, 12, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (572, 69, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (573, 16, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (574, 58, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (575, 90, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (576, 23, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (577, 61, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (578, 29, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (579, 55, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (580, 86, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (581, 59, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (582, 69, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (583, 15, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (584, 46, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (585, 6, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (586, 34, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (587, 29, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (588, 29, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (589, 69, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (590, 79, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (591, 81, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (592, 19, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (593, 1, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (594, 96, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (595, 22, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (596, 8, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (597, 37, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (598, 54, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (599, 90, true);
insert into DeliveryMan (id, RestaurantsId, DriversLicence) values (600, 87, true);


insert into Cook (id, RestaurantsId) values (602, 50);
insert into Cook (id, RestaurantsId) values (603, 26);
insert into Cook (id, RestaurantsId) values (604, 28);
insert into Cook (id, RestaurantsId) values (605, 42);
insert into Cook (id, RestaurantsId) values (606, 49);
insert into Cook (id, RestaurantsId) values (607, 31);
insert into Cook (id, RestaurantsId) values (608, 79);
insert into Cook (id, RestaurantsId) values (609, 25);
insert into Cook (id, RestaurantsId) values (610, 81);
insert into Cook (id, RestaurantsId) values (611, 13);
insert into Cook (id, RestaurantsId) values (612, 6);
insert into Cook (id, RestaurantsId) values (613, 33);
insert into Cook (id, RestaurantsId) values (614, 60);
insert into Cook (id, RestaurantsId) values (615, 99);
insert into Cook (id, RestaurantsId) values (616, 98);
insert into Cook (id, RestaurantsId) values (617, 86);
insert into Cook (id, RestaurantsId) values (618, 93);
insert into Cook (id, RestaurantsId) values (619, 38);
insert into Cook (id, RestaurantsId) values (620, 62);
insert into Cook (id, RestaurantsId) values (621, 20);
insert into Cook (id, RestaurantsId) values (622, 17);
insert into Cook (id, RestaurantsId) values (623, 19);
insert into Cook (id, RestaurantsId) values (624, 58);
insert into Cook (id, RestaurantsId) values (625, 3);
insert into Cook (id, RestaurantsId) values (626, 59);
insert into Cook (id, RestaurantsId) values (627, 23);
insert into Cook (id, RestaurantsId) values (628, 58);
insert into Cook (id, RestaurantsId) values (629, 59);
insert into Cook (id, RestaurantsId) values (630, 3);
insert into Cook (id, RestaurantsId) values (631, 83);
insert into Cook (id, RestaurantsId) values (632, 5);
insert into Cook (id, RestaurantsId) values (633, 96);
insert into Cook (id, RestaurantsId) values (634, 97);
insert into Cook (id, RestaurantsId) values (635, 60);
insert into Cook (id, RestaurantsId) values (636, 10);
insert into Cook (id, RestaurantsId) values (637, 59);
insert into Cook (id, RestaurantsId) values (638, 68);
insert into Cook (id, RestaurantsId) values (639, 20);
insert into Cook (id, RestaurantsId) values (640, 54);
insert into Cook (id, RestaurantsId) values (641, 8);
insert into Cook (id, RestaurantsId) values (642, 26);
insert into Cook (id, RestaurantsId) values (643, 96);
insert into Cook (id, RestaurantsId) values (644, 63);
insert into Cook (id, RestaurantsId) values (645, 77);
insert into Cook (id, RestaurantsId) values (646, 10);
insert into Cook (id, RestaurantsId) values (647, 67);
insert into Cook (id, RestaurantsId) values (648, 9);
insert into Cook (id, RestaurantsId) values (649, 5);
insert into Cook (id, RestaurantsId) values (650, 88);
insert into Cook (id, RestaurantsId) values (651, 94);
insert into Cook (id, RestaurantsId) values (652, 10);
insert into Cook (id, RestaurantsId) values (653, 79);
insert into Cook (id, RestaurantsId) values (654, 62);
insert into Cook (id, RestaurantsId) values (655, 21);
insert into Cook (id, RestaurantsId) values (656, 67);
insert into Cook (id, RestaurantsId) values (657, 21);
insert into Cook (id, RestaurantsId) values (658, 47);
insert into Cook (id, RestaurantsId) values (659, 80);
insert into Cook (id, RestaurantsId) values (660, 50);
insert into Cook (id, RestaurantsId) values (661, 83);
insert into Cook (id, RestaurantsId) values (662, 21);
insert into Cook (id, RestaurantsId) values (663, 45);
insert into Cook (id, RestaurantsId) values (664, 46);
insert into Cook (id, RestaurantsId) values (665, 82);
insert into Cook (id, RestaurantsId) values (666, 53);
insert into Cook (id, RestaurantsId) values (667, 49);
insert into Cook (id, RestaurantsId) values (668, 57);
insert into Cook (id, RestaurantsId) values (669, 31);
insert into Cook (id, RestaurantsId) values (670, 47);
insert into Cook (id, RestaurantsId) values (671, 15);
insert into Cook (id, RestaurantsId) values (672, 22);
insert into Cook (id, RestaurantsId) values (673, 18);
insert into Cook (id, RestaurantsId) values (674, 80);
insert into Cook (id, RestaurantsId) values (675, 91);
insert into Cook (id, RestaurantsId) values (676, 59);
insert into Cook (id, RestaurantsId) values (677, 42);
insert into Cook (id, RestaurantsId) values (678, 84);
insert into Cook (id, RestaurantsId) values (679, 85);
insert into Cook (id, RestaurantsId) values (680, 78);
insert into Cook (id, RestaurantsId) values (681, 29);
insert into Cook (id, RestaurantsId) values (682, 82);
insert into Cook (id, RestaurantsId) values (683, 48);
insert into Cook (id, RestaurantsId) values (684, 10);
insert into Cook (id, RestaurantsId) values (685, 70);
insert into Cook (id, RestaurantsId) values (686, 35);
insert into Cook (id, RestaurantsId) values (687, 17);
insert into Cook (id, RestaurantsId) values (688, 61);
insert into Cook (id, RestaurantsId) values (689, 41);
insert into Cook (id, RestaurantsId) values (690, 26);
insert into Cook (id, RestaurantsId) values (691, 35);
insert into Cook (id, RestaurantsId) values (692, 95);
insert into Cook (id, RestaurantsId) values (693, 65);
insert into Cook (id, RestaurantsId) values (694, 87);
insert into Cook (id, RestaurantsId) values (695, 30);
insert into Cook (id, RestaurantsId) values (696, 46);
insert into Cook (id, RestaurantsId) values (697, 45);
insert into Cook (id, RestaurantsId) values (698, 100);
insert into Cook (id, RestaurantsId) values (699, 14);
insert into Cook (id, RestaurantsId) values (700, 97);
insert into Cook (id, RestaurantsId) values (701, 8);
insert into Cook (id, RestaurantsId) values (702, 42);
insert into Cook (id, RestaurantsId) values (703, 8);
insert into Cook (id, RestaurantsId) values (704, 34);
insert into Cook (id, RestaurantsId) values (705, 39);
insert into Cook (id, RestaurantsId) values (706, 69);
insert into Cook (id, RestaurantsId) values (707, 78);
insert into Cook (id, RestaurantsId) values (708, 96);
insert into Cook (id, RestaurantsId) values (709, 48);
insert into Cook (id, RestaurantsId) values (710, 28);
insert into Cook (id, RestaurantsId) values (711, 95);
insert into Cook (id, RestaurantsId) values (712, 83);
insert into Cook (id, RestaurantsId) values (713, 35);
insert into Cook (id, RestaurantsId) values (714, 28);
insert into Cook (id, RestaurantsId) values (715, 27);
insert into Cook (id, RestaurantsId) values (716, 60);
insert into Cook (id, RestaurantsId) values (717, 88);
insert into Cook (id, RestaurantsId) values (718, 13);
insert into Cook (id, RestaurantsId) values (719, 12);
insert into Cook (id, RestaurantsId) values (720, 52);
insert into Cook (id, RestaurantsId) values (721, 78);
insert into Cook (id, RestaurantsId) values (722, 95);
insert into Cook (id, RestaurantsId) values (723, 76);
insert into Cook (id, RestaurantsId) values (724, 43);
insert into Cook (id, RestaurantsId) values (725, 73);
insert into Cook (id, RestaurantsId) values (726, 74);
insert into Cook (id, RestaurantsId) values (727, 40);
insert into Cook (id, RestaurantsId) values (728, 27);
insert into Cook (id, RestaurantsId) values (729, 76);
insert into Cook (id, RestaurantsId) values (730, 79);
insert into Cook (id, RestaurantsId) values (731, 30);
insert into Cook (id, RestaurantsId) values (732, 11);
insert into Cook (id, RestaurantsId) values (733, 37);
insert into Cook (id, RestaurantsId) values (734, 31);
insert into Cook (id, RestaurantsId) values (735, 18);
insert into Cook (id, RestaurantsId) values (736, 50);
insert into Cook (id, RestaurantsId) values (737, 10);
insert into Cook (id, RestaurantsId) values (738, 81);
insert into Cook (id, RestaurantsId) values (739, 75);
insert into Cook (id, RestaurantsId) values (740, 40);
insert into Cook (id, RestaurantsId) values (741, 60);
insert into Cook (id, RestaurantsId) values (742, 96);
insert into Cook (id, RestaurantsId) values (743, 60);
insert into Cook (id, RestaurantsId) values (744, 77);
insert into Cook (id, RestaurantsId) values (745, 19);
insert into Cook (id, RestaurantsId) values (746, 83);
insert into Cook (id, RestaurantsId) values (747, 28);
insert into Cook (id, RestaurantsId) values (748, 80);
insert into Cook (id, RestaurantsId) values (749, 46);
insert into Cook (id, RestaurantsId) values (750, 74);
insert into Cook (id, RestaurantsId) values (751, 71);
insert into Cook (id, RestaurantsId) values (752, 32);
insert into Cook (id, RestaurantsId) values (753, 77);
insert into Cook (id, RestaurantsId) values (754, 56);
insert into Cook (id, RestaurantsId) values (755, 76);
insert into Cook (id, RestaurantsId) values (756, 15);
insert into Cook (id, RestaurantsId) values (757, 26);
insert into Cook (id, RestaurantsId) values (758, 51);
insert into Cook (id, RestaurantsId) values (759, 62);
insert into Cook (id, RestaurantsId) values (760, 64);
insert into Cook (id, RestaurantsId) values (761, 56);
insert into Cook (id, RestaurantsId) values (762, 57);
insert into Cook (id, RestaurantsId) values (763, 14);
insert into Cook (id, RestaurantsId) values (764, 45);
insert into Cook (id, RestaurantsId) values (765, 30);
insert into Cook (id, RestaurantsId) values (766, 37);
insert into Cook (id, RestaurantsId) values (767, 88);
insert into Cook (id, RestaurantsId) values (768, 36);
insert into Cook (id, RestaurantsId) values (769, 61);
insert into Cook (id, RestaurantsId) values (770, 25);
insert into Cook (id, RestaurantsId) values (771, 61);
insert into Cook (id, RestaurantsId) values (772, 64);
insert into Cook (id, RestaurantsId) values (773, 82);
insert into Cook (id, RestaurantsId) values (774, 32);
insert into Cook (id, RestaurantsId) values (775, 40);
insert into Cook (id, RestaurantsId) values (776, 26);
insert into Cook (id, RestaurantsId) values (777, 54);
insert into Cook (id, RestaurantsId) values (778, 82);
insert into Cook (id, RestaurantsId) values (779, 34);
insert into Cook (id, RestaurantsId) values (780, 91);
insert into Cook (id, RestaurantsId) values (781, 43);
insert into Cook (id, RestaurantsId) values (782, 51);
insert into Cook (id, RestaurantsId) values (783, 98);
insert into Cook (id, RestaurantsId) values (784, 8);
insert into Cook (id, RestaurantsId) values (785, 80);
insert into Cook (id, RestaurantsId) values (786, 82);
insert into Cook (id, RestaurantsId) values (787, 13);
insert into Cook (id, RestaurantsId) values (788, 7);
insert into Cook (id, RestaurantsId) values (789, 45);
insert into Cook (id, RestaurantsId) values (790, 1);
insert into Cook (id, RestaurantsId) values (791, 66);
insert into Cook (id, RestaurantsId) values (792, 59);
insert into Cook (id, RestaurantsId) values (793, 44);
insert into Cook (id, RestaurantsId) values (794, 31);
insert into Cook (id, RestaurantsId) values (795, 38);
insert into Cook (id, RestaurantsId) values (796, 54);
insert into Cook (id, RestaurantsId) values (797, 84);
insert into Cook (id, RestaurantsId) values (798, 24);
insert into Cook (id, RestaurantsId) values (799, 5);
insert into Cook (id, RestaurantsId) values (800, 82);
insert into Cook (id, RestaurantsId) values (801, 34);
insert into Cook (id, RestaurantsId) values (802, 47);
insert into Cook (id, RestaurantsId) values (803, 7);
insert into Cook (id, RestaurantsId) values (804, 56);
insert into Cook (id, RestaurantsId) values (805, 94);
insert into Cook (id, RestaurantsId) values (806, 99);
insert into Cook (id, RestaurantsId) values (807, 100);
insert into Cook (id, RestaurantsId) values (808, 86);
insert into Cook (id, RestaurantsId) values (809, 80);
insert into Cook (id, RestaurantsId) values (810, 3);
insert into Cook (id, RestaurantsId) values (811, 88);
insert into Cook (id, RestaurantsId) values (812, 100);
insert into Cook (id, RestaurantsId) values (813, 84);
insert into Cook (id, RestaurantsId) values (814, 38);
insert into Cook (id, RestaurantsId) values (815, 84);
insert into Cook (id, RestaurantsId) values (816, 53);
insert into Cook (id, RestaurantsId) values (817, 40);
insert into Cook (id, RestaurantsId) values (818, 33);
insert into Cook (id, RestaurantsId) values (819, 89);
insert into Cook (id, RestaurantsId) values (820, 55);
insert into Cook (id, RestaurantsId) values (821, 45);
insert into Cook (id, RestaurantsId) values (822, 4);
insert into Cook (id, RestaurantsId) values (823, 73);
insert into Cook (id, RestaurantsId) values (824, 12);
insert into Cook (id, RestaurantsId) values (825, 16);
insert into Cook (id, RestaurantsId) values (826, 86);
insert into Cook (id, RestaurantsId) values (827, 91);
insert into Cook (id, RestaurantsId) values (828, 53);
insert into Cook (id, RestaurantsId) values (829, 6);
insert into Cook (id, RestaurantsId) values (830, 14);
insert into Cook (id, RestaurantsId) values (831, 1);
insert into Cook (id, RestaurantsId) values (832, 48);
insert into Cook (id, RestaurantsId) values (833, 48);
insert into Cook (id, RestaurantsId) values (834, 41);
insert into Cook (id, RestaurantsId) values (835, 38);
insert into Cook (id, RestaurantsId) values (836, 73);
insert into Cook (id, RestaurantsId) values (837, 43);
insert into Cook (id, RestaurantsId) values (838, 26);
insert into Cook (id, RestaurantsId) values (839, 76);
insert into Cook (id, RestaurantsId) values (840, 9);
insert into Cook (id, RestaurantsId) values (841, 5);
insert into Cook (id, RestaurantsId) values (842, 51);
insert into Cook (id, RestaurantsId) values (843, 37);
insert into Cook (id, RestaurantsId) values (844, 76);
insert into Cook (id, RestaurantsId) values (845, 94);
insert into Cook (id, RestaurantsId) values (846, 23);
insert into Cook (id, RestaurantsId) values (847, 16);
insert into Cook (id, RestaurantsId) values (848, 2);
insert into Cook (id, RestaurantsId) values (849, 98);
insert into Cook (id, RestaurantsId) values (850, 24);
insert into Cook (id, RestaurantsId) values (851, 3);
insert into Cook (id, RestaurantsId) values (852, 80);
insert into Cook (id, RestaurantsId) values (853, 38);
insert into Cook (id, RestaurantsId) values (854, 39);
insert into Cook (id, RestaurantsId) values (855, 93);
insert into Cook (id, RestaurantsId) values (856, 85);
insert into Cook (id, RestaurantsId) values (857, 74);
insert into Cook (id, RestaurantsId) values (858, 12);
insert into Cook (id, RestaurantsId) values (859, 39);
insert into Cook (id, RestaurantsId) values (860, 83);
insert into Cook (id, RestaurantsId) values (861, 15);
insert into Cook (id, RestaurantsId) values (862, 40);
insert into Cook (id, RestaurantsId) values (863, 33);
insert into Cook (id, RestaurantsId) values (864, 98);
insert into Cook (id, RestaurantsId) values (865, 23);
insert into Cook (id, RestaurantsId) values (866, 85);
insert into Cook (id, RestaurantsId) values (867, 60);
insert into Cook (id, RestaurantsId) values (868, 37);
insert into Cook (id, RestaurantsId) values (869, 12);
insert into Cook (id, RestaurantsId) values (870, 61);
insert into Cook (id, RestaurantsId) values (871, 22);
insert into Cook (id, RestaurantsId) values (872, 25);
insert into Cook (id, RestaurantsId) values (873, 21);
insert into Cook (id, RestaurantsId) values (874, 3);
insert into Cook (id, RestaurantsId) values (875, 83);
insert into Cook (id, RestaurantsId) values (876, 90);
insert into Cook (id, RestaurantsId) values (877, 5);
insert into Cook (id, RestaurantsId) values (878, 79);
insert into Cook (id, RestaurantsId) values (879, 87);
insert into Cook (id, RestaurantsId) values (880, 59);
insert into Cook (id, RestaurantsId) values (881, 16);
insert into Cook (id, RestaurantsId) values (882, 50);
insert into Cook (id, RestaurantsId) values (883, 10);
insert into Cook (id, RestaurantsId) values (884, 61);
insert into Cook (id, RestaurantsId) values (885, 30);
insert into Cook (id, RestaurantsId) values (886, 15);
insert into Cook (id, RestaurantsId) values (887, 50);
insert into Cook (id, RestaurantsId) values (888, 55);
insert into Cook (id, RestaurantsId) values (889, 21);
insert into Cook (id, RestaurantsId) values (890, 87);
insert into Cook (id, RestaurantsId) values (891, 86);
insert into Cook (id, RestaurantsId) values (892, 91);
insert into Cook (id, RestaurantsId) values (893, 28);
insert into Cook (id, RestaurantsId) values (894, 31);
insert into Cook (id, RestaurantsId) values (895, 44);
insert into Cook (id, RestaurantsId) values (896, 41);
insert into Cook (id, RestaurantsId) values (897, 51);
insert into Cook (id, RestaurantsId) values (898, 91);
insert into Cook (id, RestaurantsId) values (899, 49);
insert into Cook (id, RestaurantsId) values (900, 13);


INSERT INTO Orders (id, price, restaurantsId, customersId, deliveryAdress, delivery) VALUES
(1, 100, 1, 1, 'Some address 1', false),
(2, 100, 2, 2, 'Some address 2', false),
(3, 100, 3, 3, 'Some address 3', false),
(4, 100, 4, 4, 'Some address 4', false),
(5, 100, 5, 5, 'Some address 5', false),
(6, 100, 6, 6, 'Some address 6', false),
(7, 100, 7, 7, 'Some address 7', false),
(8, 100, 8, 8, 'Some address 8', false),
(9, 100, 9, 9, 'Some address 9', false),
(10, 100, 10, 10, 'Some address 10', false),
(11, 100, 1, 11, 'Some address 11', false),
(12, 100, 2, 12, 'Some address 12', false),
(13, 100, 3, 13, 'Some address 13', false),
(14, 100, 4, 14, 'Some address 14', false),
(15, 100, 5, 15, 'Some address 15', false),
(16, 100, 6, 16, 'Some address 16', false),
(17, 100, 7, 17, 'Some address 17', false),
(18, 100, 8, 18, 'Some address 18', false),
(19, 100, 9, 19, 'Some address 19', false),
(20, 100, 10, 20, 'Some address 20', false),
(21, 100, 1, 21, 'Some address 21', false),
(22, 100, 2, 22, 'Some address 22', false),
(23, 100, 3, 23, 'Some address 23', false),
(24, 100, 4, 24, 'Some address 24', false),
(25, 100, 5, 25, 'Some address 25', false),
(26, 100, 6, 26, 'Some address 26', false),
(27, 100, 7, 27, 'Some address 27', false),
(28, 100, 8, 28, 'Some address 28', false),
(29, 100, 9, 29, 'Some address 29', false),
(30, 100, 10, 30, 'Some address 30', false),
(31, 100, 1, 31, 'Some address 31', false),
(32, 100, 2, 32, 'Some address 32', false),
(33, 100, 3, 33, 'Some address 33', false),
(34, 100, 4, 34, 'Some address 34', false),
(35, 100, 5, 35, 'Some address 35', false),
(36, 100, 6, 36, 'Some address 36', false),
(37, 100, 7, 37, 'Some address 37', false),
(38, 100, 8, 38, 'Some address 38', false),
(39, 100, 9, 39, 'Some address 39', false),
(40, 100, 10, 40, 'Some address 40', false),
(41, 100, 1, 41, 'Some address 41', false),
(42, 100, 2, 42, 'Some address 42', false),
(43, 100, 3, 43, 'Some address 43', false),
(44, 100, 4, 44, 'Some address 44', false),
(45, 100, 5, 45, 'Some address 45', false),
(46, 100, 6, 46, 'Some address 46', false),
(47, 100, 7, 47, 'Some address 47', false),
(48, 100, 8, 48, 'Some address 48', false),
(49, 100, 9, 49, 'Some address 49', false),
(50, 100, 10, 50, 'Some address 50', false),
(51, 100, 1, 51, 'Some address 51', false),
(52, 100, 2, 52, 'Some address 52', false),
(53, 100, 3, 53, 'Some address 53', false),
(54, 100, 4, 54, 'Some address 54', false),
(55, 100, 5, 55, 'Some address 55', false),
(56, 100, 6, 56, 'Some address 56', false),
(57, 100, 7, 57, 'Some address 57', false),
(58, 100, 8, 58, 'Some address 58', false),
(59, 100, 9, 59, 'Some address 59', false),
(60, 100, 10, 60, 'Some address 60', false),
(61, 100, 1, 61, 'Some address 61', false),
(62, 100, 2, 62, 'Some address 62', false),
(63, 100, 3, 63, 'Some address 63', false),
(64, 100, 4, 64, 'Some address 64', false),
(65, 100, 5, 65, 'Some address 65', false),
(66, 100, 6, 66, 'Some address 66', false),
(67, 100, 7, 67, 'Some address 67', false),
(68, 100, 8, 68, 'Some address 68', false),
(69, 100, 9, 69, 'Some address 69', false),
(70, 100, 10, 70, 'Some address 70', false),
(71, 100, 1, 71, 'Some address 71', false),
(72, 100, 2, 72, 'Some address 72', false),
(73, 100, 3, 73, 'Some address 73', false),
(74, 100, 4, 74, 'Some address 74', false),
(75, 100, 5, 75, 'Some address 75', false),
(76, 100, 6, 76, 'Some address 76', false),
(77, 100, 7, 77, 'Some address 77', false),
(78, 100, 8, 78, 'Some address 78', false),
(79, 100, 9, 79, 'Some address 79', false),
(80, 100, 10, 80, 'Some address 80', false),
(81, 100, 1, 81, 'Some address 81', false),
(82, 100, 2, 82, 'Some address 82', false),
(83, 100, 3, 83, 'Some address 83', false),
(84, 100, 4, 84, 'Some address 84', false),
(85, 100, 5, 85, 'Some address 85', false),
(86, 100, 6, 86, 'Some address 86', false),
(87, 100, 7, 87, 'Some address 87', false),
(88, 100, 8, 88, 'Some address 88', false),
(89, 100, 9, 89, 'Some address 89', false),
(90, 100, 10, 90, 'Some address 90', false),
(91, 100, 1, 91, 'Some address 91', false),
(92, 100, 2, 92, 'Some address 92', false),
(93, 100, 3, 93, 'Some address 93', false),
(94, 100, 4, 94, 'Some address 94', false),
(95, 100, 5, 95, 'Some address 95', false),
(96, 100, 6, 96, 'Some address 96', false),
(97, 100, 7, 97, 'Some address 97', false),
(98, 100, 8, 98, 'Some address 98', false),
(99, 100, 9, 99, 'Some address 99', false),
(100, 100, 10, 100, 'Some address 100', false),
(101, 100, 1, 1, 'Some address 101', false),
(102, 100, 3, 3, 'Some address 102', false),
(103, 100, 4, 4, 'Some address 103', false),
(104, 100, 5, 5, 'Some address 104', false),
(105, 100, 6, 6, 'Some address 105', false),
(106, 100, 7, 7, 'Some address 106', false),
(107, 100, 8, 8, 'Some address 107', false),
(108, 100, 9, 9, 'Some address 108', false),
(109, 100, 10, 10, 'Some address 109', false),
(110, 100, 1, 11, 'Some address 110', false),
(111, 100, 2, 12, 'Some address 111', false),
(112, 100, 3, 13, 'Some address 112', false),
(113, 100, 4, 14, 'Some address 113', false),
(114, 100, 5, 15, 'Some address 114', false),
(115, 100, 6, 16, 'Some address 115', false),
(116, 100, 7, 17, 'Some address 116', false),
(117, 100, 8, 18, 'Some address 117', false),
(118, 100, 9, 19, 'Some address 118', false),
(119, 100, 10, 20, 'Some address 119', false),
(120, 100, 1, 21, 'Some address 120', false),
(121, 100, 2, 22, 'Some address 121', false),
(122, 100, 3, 23, 'Some address 122', false),
(123, 100, 4, 24, 'Some address 123', false),
(124, 100, 5, 25, 'Some address 124', false),
(125, 100, 6, 26, 'Some address 125', false),
(126, 100, 7, 27, 'Some address 126', false),
(127, 100, 8, 28, 'Some address 127', false),
(128, 100, 9, 29, 'Some address 128', false),
(129, 100, 10, 30, 'Some address 129', false),
(130, 100, 1, 31, 'Some address 130', false),
(131, 100, 2, 32, 'Some address 131', false),
(132, 100, 3, 33, 'Some address 132', false),
(133, 100, 4, 34, 'Some address 133', false),
(134, 100, 5, 35, 'Some address 134', false),
(135, 100, 6, 36, 'Some address 135', false),
(136, 100, 7, 37, 'Some address 136', false),
(137, 100, 8, 38, 'Some address 137', false),
(138, 100, 9, 39, 'Some address 138', false),
(139, 100, 10, 40, 'Some address 139', false),
(140, 100, 1, 41, 'Some address 140', false),
(141, 100, 2, 42, 'Some address 141', false),
(142, 100, 3, 43, 'Some address 142', false),
(143, 100, 4, 44, 'Some address 143', false),
(144, 100, 5, 45, 'Some address 144', false),
(145, 100, 6, 46, 'Some address 145', false),
(146, 100, 7, 47, 'Some address 146', false),
(147, 100, 8, 48, 'Some address 147', false),
(148, 100, 9, 49, 'Some address 148', false),
(149, 100, 10, 50, 'Some address 149', false),
(150, 100, 1, 51, 'Some address 150', false),
(151, 100, 2, 52, 'Some address 151', false),
(152, 100, 3, 53, 'Some address 152', false),
(153, 100, 4, 54, 'Some address 153', false),
(154, 100, 5, 55, 'Some address 154', false),
(155, 100, 6, 56, 'Some address 155', false),
(156, 100, 7, 57, 'Some address 156', false),
(157, 100, 8, 58, 'Some address 157', false),
(158, 100, 9, 59, 'Some address 158', false),
(159, 100, 10, 60, 'Some address 159', false),
(160, 100, 1, 61, 'Some address 160', false),
(161, 100, 2, 62, 'Some address 161', false),
(162, 100, 3, 63, 'Some address 162', false),
(163, 100, 4, 64, 'Some address 163', false),
(164, 100, 5, 65, 'Some address 164', false),
(165, 100, 6, 66, 'Some address 165', false),
(166, 100, 7, 67, 'Some address 166', false),
(167, 100, 8, 68, 'Some address 167', false),
(168, 100, 9, 69, 'Some address 168', false),
(169, 100, 10, 70, 'Some address 169', false),
(170, 100, 1, 71, 'Some address 170', false),
(171, 100, 2, 72, 'Some address 171', false),
(172, 100, 3, 73, 'Some address 172', false),
(173, 100, 4, 74, 'Some address 173', false),
(174, 100, 5, 75, 'Some address 174', false),
(175, 100, 6, 76, 'Some address 175', false),
(176, 100, 7, 77, 'Some address 176', false),
(177, 100, 8, 78, 'Some address 177', false),
(178, 100, 9, 79, 'Some address 178', false),
(179, 100, 10, 80, 'Some address 179', false),
(180, 100, 1, 81, 'Some address 180', false),
(181, 100, 2, 82, 'Some address 181', false),
(182, 100, 3, 83, 'Some address 182', false),
(183, 100, 4, 84, 'Some address 183', false),
(184, 100, 5, 85, 'Some address 184', false),
(185, 100, 6, 86, 'Some address 185', false),
(186, 100, 7, 87, 'Some address 186', false),
(187, 100, 8, 88, 'Some address 187', false),
(188, 100, 9, 89, 'Some address 188', false),
(189, 100, 10, 90, 'Some address 189', false),
(190, 100, 1, 91, 'Some address 190', false),
(191, 100, 2, 92, 'Some address 191', false),
(192, 100, 3, 93, 'Some address 192', false),
(193, 100, 4, 94, 'Some address 193', false),
(194, 100, 5, 95, 'Some address 194', false),
(195, 100, 6, 96, 'Some address 195', false),
(196, 100, 7, 97, 'Some address 196', false),
(197, 100, 8, 98, 'Some address 197', false),
(198, 100, 9, 99, 'Some address 198', false),
(199, 100, 10, 100, 'Some address 199', false),
(200, 100, 1, 101, 'Some address 200', false),
(201, 100, 2, 102, 'Some address 201', false),
(202, 100, 3, 103, 'Some address 202', false),
(203, 100, 4, 104, 'Some address 203', false),
(204, 100, 5, 105, 'Some address 204', false),
(205, 100, 6, 106, 'Some address 205', false),
(206, 100, 7, 107, 'Some address 206', false),
(207, 100, 8, 108, 'Some address 207', false),
(208, 100, 9, 109, 'Some address 208', false),
(209, 100, 10, 110, 'Some address 209', false),
(210, 100, 10, 110, 'Some address 210', false),
(211, 100, 2, 2, 'Some address 211', true),
(212, 100, 3, 3, 'Some address 212', true),
(213, 100, 4, 4, 'Some address 213', true),
(214, 100, 5, 5, 'Some address 214', true),
(215, 100, 6, 6, 'Some address 215', true),
(216, 100, 7, 7, 'Some address 216', true),
(217, 100, 8, 8, 'Some address 217', true),
(218, 100, 9, 9, 'Some address 218', true),
(219, 100, 10, 10, 'Some address 219', true),
(220, 100, 1, 11, 'Some address 220', true),
(221, 100, 2, 12, 'Some address 221', true),
(222, 100, 3, 13, 'Some address 222', true),
(223, 100, 4, 14, 'Some address 223', true),
(224, 100, 5, 15, 'Some address 224', true),
(225, 100, 6, 16, 'Some address 225', true),
(226, 100, 7, 17, 'Some address 226', true),
(227, 100, 8, 18, 'Some address 227', true),
(228, 100, 9, 19, 'Some address 228', true),
(229, 100, 10, 20, 'Some address 229', true),
(230, 100, 1, 21, 'Some address 230', true),
(231, 100, 2, 22, 'Some address 231', true),
(232, 100, 3, 23, 'Some address 232', true),
(233, 100, 4, 24, 'Some address 233', true),
(234, 100, 5, 25, 'Some address 234', true),
(235, 100, 6, 26, 'Some address 235', true),
(236, 100, 7, 27, 'Some address 236', true),
(237, 100, 8, 28, 'Some address 237', true),
(238, 100, 9, 29, 'Some address 238', true),
(239, 100, 10, 30, 'Some address 239', true),
(240, 100, 1, 31, 'Some address 240', true),
(241, 100, 2, 32, 'Some address 241', true),
(242, 100, 3, 33, 'Some address 242', true),
(243, 100, 4, 34, 'Some address 243', true),
(244, 100, 5, 35, 'Some address 244', true),
(245, 100, 6, 36, 'Some address 245', true),
(246, 100, 7, 37, 'Some address 246', true),
(247, 100, 8, 38, 'Some address 247', true),
(248, 100, 9, 39, 'Some address 248', true),
(249, 100, 10, 40, 'Some address 249', true),
(250, 100, 1, 41, 'Some address 250', true),
(251, 100, 2, 42, 'Some address 251', true),
(252, 100, 3, 43, 'Some address 252', true),
(253, 100, 4, 44, 'Some address 253', true),
(254, 100, 5, 45, 'Some address 254', true),
(255, 100, 6, 46, 'Some address 255', true),
(256, 100, 7, 47, 'Some address 256', true),
(257, 100, 8, 48, 'Some address 257', true),
(258, 100, 9, 49, 'Some address 258', true),
(259, 100, 10, 50, 'Some address 259', true),
(260, 100, 1, 51, 'Some address 260', true),
(261, 100, 2, 52, 'Some address 261', true),
(262, 100, 3, 53, 'Some address 262', true),
(263, 100, 4, 54, 'Some address 263', true),
(264, 100, 5, 55, 'Some address 264', true),
(265, 100, 6, 56, 'Some address 265', true),
(266, 100, 7, 57, 'Some address 266', true),
(267, 100, 8, 58, 'Some address 267', true),
(268, 100, 9, 59, 'Some address 268', true),
(269, 100, 10, 60, 'Some address 269', true),
(270, 100, 1, 61, 'Some address 270', true),
(271, 100, 2, 62, 'Some address 271', true),
(272, 100, 3, 63, 'Some address 272', true),
(273, 100, 4, 64, 'Some address 273', true),
(274, 100, 5, 65, 'Some address 274', true),
(275, 100, 6, 66, 'Some address 275', true),
(276, 100, 7, 67, 'Some address 276', true),
(277, 100, 8, 68, 'Some address 277', true),
(278, 100, 9, 69, 'Some address 278', true),
(279, 100, 10, 70, 'Some address 279', true),
(280, 100, 1, 71, 'Some address 280', true),
(281, 100, 2, 72, 'Some address 281', true),
(282, 100, 3, 73, 'Some address 282', true),
(283, 100, 4, 74, 'Some address 283', true),
(284, 100, 5, 75, 'Some address 284', true),
(285, 100, 6, 76, 'Some address 285', true),
(286, 100, 7, 77, 'Some address 286', true),
(287, 100, 8, 78, 'Some address 287', true),
(288, 100, 9, 79, 'Some address 288', true),
(289, 100, 10, 80, 'Some address 289', true),
(290, 100, 1, 81, 'Some address 290', true),
(291, 100, 2, 82, 'Some address 291', true),
(292, 100, 3, 83, 'Some address 292', true),
(293, 100, 4, 84, 'Some address 293', true),
(294, 100, 5, 85, 'Some address 294', true),
(295, 100, 6, 86, 'Some address 295', true),
(296, 100, 7, 87, 'Some address 296', true),
(297, 100, 8, 88, 'Some address 297', true),
(298, 100, 9, 89, 'Some address 298', true),
(299, 100, 10, 90, 'Some address 299', true),
(300, 100, 1, 91, 'Some address 300', true),
(301, 100, 2, 92, 'Some address 301', true),
(302, 100, 3, 93, 'Some address 302', true),
(303, 100, 4, 94, 'Some address 303', true),
(304, 100, 5, 95, 'Some address 304', true),
(305, 100, 6, 96, 'Some address 305', true),
(306, 100, 7, 97, 'Some address 306', true),
(307, 100, 8, 98, 'Some address 307', true),
(308, 100, 9, 99, 'Some address 308', true),
(310, 100, 1, 101, 'Some address 310', true),
(311, 100, 2, 102, 'Some address 311', true),
(312, 100, 3, 103, 'Some address 312', true),
(313, 100, 4, 104, 'Some address 313', true),
(314, 100, 5, 105, 'Some address 314', true),
(315, 100, 6, 106, 'Some address 315', true),
(316, 100, 7, 107, 'Some address 316', true),
(317, 100, 8, 108, 'Some address 317', true),
(318, 100, 9, 109, 'Some address 318', true),
(319, 100, 10, 110, 'Some address 319', true),
(320, 100, 1, 111, 'Some address 320', true),
(321, 100, 2, 112, 'Some address 321', true),
(322, 100, 3, 113, 'Some address 322', true),
(323, 100, 4, 114, 'Some address 323', true),
(324, 100, 5, 115, 'Some address 324', true),
(325, 100, 6, 116, 'Some address 325', true),
(326, 100, 7, 117, 'Some address 326', true),
(327, 100, 8, 118, 'Some address 327', true),
(328, 100, 9, 119, 'Some address 328', true),
(329, 100, 10, 120, 'Some address 329', true),
(330, 100, 1, 121, 'Some address 330', true),
(331, 100, 2, 122, 'Some address 331', true),
(332, 100, 3, 123, 'Some address 332', true),
(333, 100, 4, 124, 'Some address 333', true),
(334, 100, 5, 125, 'Some address 334', true),
(335, 100, 6, 126, 'Some address 335', true),
(336, 100, 7, 127, 'Some address 336', true),
(337, 100, 8, 128, 'Some address 337', true),
(338, 100, 9, 129, 'Some address 338', true),
(339, 100, 10, 130, 'Some address 339', true),
(340, 100, 1, 131, 'Some address 340', true),
(341, 100, 2, 132, 'Some address 341', true),
(342, 100, 3, 133, 'Some address 342', true),
(343, 100, 4, 134, 'Some address 343', true),
(344, 100, 5, 135, 'Some address 344', true),
(345, 100, 6, 136, 'Some address 345', true),
(346, 100, 7, 137, 'Some address 346', true),
(347, 100, 8, 138, 'Some address 347', true),
(348, 100, 9, 139, 'Some address 348', true),
(349, 100, 10, 140, 'Some address 349', true),
(350, 100, 1, 141, 'Some address 350', true),
(351, 100, 2, 142, 'Some address 351', true),
(352, 100, 3, 143, 'Some address 352', true),
(353, 100, 4, 144, 'Some address 353', true),
(354, 100, 5, 145, 'Some address 354', true),
(355, 100, 6, 146, 'Some address 355', true),
(356, 100, 7, 147, 'Some address 356', true),
(357, 100, 8, 148, 'Some address 357', true),
(358, 100, 9, 149, 'Some address 358', true),
(359, 100, 10, 150, 'Some address 359', true),
(360, 100, 1, 151, 'Some address 360', true),
(361, 100, 2, 152, 'Some address 361', true),
(362, 100, 3, 153, 'Some address 362', true),
(363, 100, 4, 154, 'Some address 363', true),
(364, 100, 5, 155, 'Some address 364', true),
(365, 100, 6, 156, 'Some address 365', true),
(366, 100, 7, 157, 'Some address 366', true),
(367, 100, 8, 158, 'Some address 367', true),
(368, 100, 9, 159, 'Some address 368', true),
(369, 100, 10, 160, 'Some address 369', true),
(370, 100, 1, 161, 'Some address 370', true),
(371, 100, 2, 162, 'Some address 371', true),
(372, 100, 3, 163, 'Some address 372', true),
(373, 100, 4, 164, 'Some address 373', true),
(374, 100, 5, 165, 'Some address 374', true),
(375, 100, 6, 166, 'Some address 375', true),
(376, 100, 7, 167, 'Some address 376', true),
(377, 100, 8, 168, 'Some address 377', true),
(378, 100, 9, 169, 'Some address 378', true),
(379, 100, 10, 170, 'Some address 379', true),
(380, 100, 1, 171, 'Some address 380', true),
(381, 100, 2, 172, 'Some address 381', true),
(382, 100, 3, 173, 'Some address 382', true),
(383, 100, 4, 174, 'Some address 383', true),
(384, 100, 5, 175, 'Some address 384', true),
(385, 100, 6, 176, 'Some address 385', true),
(386, 100, 7, 177, 'Some address 386', true),
(387, 100, 8, 178, 'Some address 387', true),
(388, 100, 9, 179, 'Some address 388', true),
(389, 100, 10, 180, 'Some address 389', true),
(390, 100, 1, 181, 'Some address 390', true),
(391, 100, 2, 182, 'Some address 391', true),
(392, 100, 3, 183, 'Some address 392', true),
(393, 100, 4, 184, 'Some address 393', true),
(394, 100, 5, 185, 'Some address 394', true),
(395, 100, 6, 186, 'Some address 395', true),
(396, 100, 7, 187, 'Some address 396', true),
(397, 100, 8, 188, 'Some address 397', true),
(398, 100, 9, 189, 'Some address 398', true),
(399, 100, 10, 190, 'Some address 399', true),
(400, 100, 1, 191, 'Some address 400', true);


INSERT INTO orderdishes (orderid, dishesid, amount) VALUES
(1, 100, 5),
(1, 200, 2),
(1, 300, 7),
(1, 400, 3),
(1, 500, 6),
(2, 150, 4),
(2, 250, 1),
(2, 350, 8),
(3, 120, 6),
(3, 220, 3),
(3, 320, 7),
(3, 420, 5),
(4, 110, 8),
(4, 210, 2),
(4, 310, 6),
(5, 100, 7),
(5, 200, 9),
(6, 130, 3),
(6, 230, 5),
(6, 330, 8),
(6, 430, 4),
(7, 140, 6),
(7, 240, 1),
(7, 340, 9),
(7, 440, 7),
(8, 160, 5),
(8, 260, 6),
(8, 360, 4),
(8, 460, 3),
(8, 560, 7),
(9, 170, 8),
(9, 270, 5),
(10, 180, 4),
(10, 280, 6),
(10, 380, 3),
(10, 480, 7),
(11, 190, 5),
(11, 290, 4),
(11, 390, 8),
(11, 490, 6),
(12, 200, 2),
(12, 300, 7),
(12, 400, 5),
(12, 500, 1),
(13, 210, 6),
(13, 310, 3),
(13, 410, 8),
(13, 510, 7),
(14, 220, 4),
(14, 320, 5),
(14, 420, 6),
(14, 520, 3),
(15, 230, 7),
(15, 330, 8),
(15, 430, 5),
(15, 530, 2),
(16, 240, 6),
(16, 340, 3),
(16, 440, 9),
(16, 540, 8),
(17, 250, 5),
(17, 350, 4),
(17, 450, 7),
(17, 550, 6),
(18, 260, 3),
(18, 360, 8),
(18, 460, 2),
(18, 560, 7),
(19, 270, 6),
(19, 370, 9),
(19, 470, 5),
(19, 570, 4),
(20, 280, 3),
(20, 380, 6),
(20, 480, 7),
(20, 580, 5),
(21, 290, 4),
(21, 390, 8),
(21, 490, 6),
(21, 590, 2),
(22, 300, 7),
(22, 400, 5),
(22, 500, 3),
(22, 600, 9),
(23, 310, 6),
(23, 410, 8),
(23, 510, 7),
(23, 610, 2),
(24, 320, 5),
(24, 420, 9),
(24, 520, 4),
(24, 620, 8),
(25, 330, 6),
(25, 430, 2),
(25, 530, 7),
(25, 630, 3),
(26, 340, 4),
(26, 440, 3),
(26, 540, 8),
(26, 640, 7),
(27, 350, 2),
(27, 450, 5),
(27, 550, 7),
(27, 650, 9),
(28, 360, 6),
(28, 460, 4),
(28, 560, 7),
(28, 660, 3),
(29, 370, 8),
(29, 470, 9),
(29, 570, 5),
(29, 670, 6),
(30, 380, 7),
(30, 480, 6),
(30, 580, 3),
(30, 680, 4),
(30, 480, 6),
(30, 580, 3),
(30, 680, 4),
(31, 390, 2),
(31, 490, 5),
(31, 590, 8),
(32, 400, 4),
(32, 500, 7),
(32, 600, 5),
(33, 410, 6),
(33, 510, 3),
(33, 610, 9),
(33, 710, 8),
(34, 420, 5),
(34, 520, 7),
(34, 620, 6),
(34, 720, 4),
(35, 430, 8),
(35, 530, 6),
(35, 630, 9),
(35, 730, 3),
(36, 440, 7),
(36, 540, 4),
(36, 640, 5),
(36, 740, 6),
(37, 450, 2),
(37, 550, 7),
(37, 650, 6),
(37, 750, 9),
(38, 460, 8),
(38, 560, 3),
(38, 660, 7),
(38, 760, 4),
(39, 470, 5),
(39, 570, 9),
(39, 670, 6),
(39, 770, 8),
(40, 480, 7),
(40, 580, 6),
(40, 680, 4),
(40, 780, 5),
(41, 490, 3),
(41, 590, 7),
(41, 690, 5),
(41, 790, 6),
(42, 500, 4),
(42, 600, 9),
(42, 700, 7),
(42, 800, 2),
(43, 510, 6),
(43, 610, 3),
(43, 710, 8),
(43, 810, 9),
(44, 520, 5),
(44, 620, 8),
(44, 720, 4),
(44, 820, 6),
(45, 530, 9),
(45, 630, 7),
(45, 730, 5),
(45, 830, 3),
(46, 540, 6),
(46, 640, 2),
(46, 740, 9),
(46, 840, 7),
(47, 550, 8),
(47, 650, 3),
(47, 750, 6),
(47, 850, 4),
(48, 560, 7),
(48, 660, 5),
(48, 760, 6),
(48, 860, 8),
(49, 570, 2),
(49, 670, 7),
(49, 770, 6),
(49, 870, 5),
(50, 580, 4),
(50, 680, 9),
(50, 780, 7),
(50, 880, 8),
(51, 590, 6),
(51, 690, 3),
(51, 790, 8),
(51, 890, 5),
(52, 600, 9),
(52, 700, 5),
(52, 800, 7),
(52, 900, 6),
(53, 610, 3),
(53, 710, 6),
(53, 810, 5),
(53, 910, 8),
(54, 620, 7),
(54, 720, 9),
(54, 820, 6),
(54, 920, 5),
(55, 630, 5),
(55, 730, 4),
(55, 830, 9),
(55, 930, 8),
(56, 640, 6),
(56, 740, 7),
(56, 840, 5),
(56, 940, 3),
(57, 650, 8),
(57, 750, 4),
(57, 850, 9),
(57, 950, 6),
(58, 660, 7),
(58, 760, 3),
(58, 860, 5),
(58, 960, 9),
(59, 670, 4),
(59, 770, 8),
(59, 870, 5),
(59, 970, 6),
(60, 680, 6),
(60, 780, 7),
(60, 880, 5),
(60, 980, 9),
(61, 690, 5),
(61, 790, 9),
(61, 890, 3),
(61, 990, 6),
(62, 700, 8),
(62, 800, 6),
(62, 900, 5),
(62, 1000, 7),
(63, 710, 3),
(63, 810, 7),
(63, 910, 6),
(63, 100, 4),
(64, 720, 9),
(64, 820, 6),
(64, 920, 7),
(64, 120, 5),
(65, 730, 5),
(65, 830, 8),
(65, 930, 6),
(65, 130, 9),
(66, 740, 7),
(66, 840, 6),
(66, 940, 5),
(66, 100, 3),
(67, 750, 9),
(67, 850, 6),
(67, 950, 8),
(67, 100, 7),
(68, 760, 5),
(68, 860, 9),
(68, 960, 7),
(68, 106, 6),
(69, 770, 8),
(69, 870, 7),
(69, 970, 5),
(69, 100, 6),
(70, 780, 6),
(70, 880, 5),
(70, 980, 9),
(70, 180, 8),
(71, 790, 3),
(71, 890, 7),
(71, 990, 8),
(71, 190, 6),
(72, 800, 4),
(72, 900, 5),
(72, 1000, 7),
(72, 100, 6),
(73, 810, 6),
(73, 910, 5),
(73, 100, 8),
(73, 110, 4),
(74, 820, 9),
(74, 920, 6),
(74, 100, 7),
(74, 110, 5),
(75, 830, 8),
(75, 930, 4),
(75, 103, 9),
(75, 113, 7),
(76, 840, 5),
(76, 940, 8),
(76, 100, 6),
(76, 140, 3),
(77, 850, 7),
(77, 950, 9),
(77, 150, 6),
(77, 110, 8),
(78, 860, 8),
(78, 960, 5),
(78, 100, 7),
(78, 110, 9),
(79, 870, 6),
(79, 970, 4),
(79, 170, 9),
(79, 110, 8),
(80, 880, 5),
(80, 980, 6),
(80, 100, 7),
(80, 110, 9),
(81, 890, 7),
(81, 990, 8),
(81, 100, 5),
(81, 110, 6),
(82, 900, 6),
(82, 100, 7),
(82, 110, 9),
(82, 120, 4),
(83, 910, 5),
(83, 110, 8),
(83, 210, 7),
(84, 920, 7),
(84, 100, 9),
(84, 110, 6),
(84, 120, 5),
(85, 930, 9),
(85, 130, 7),
(85, 120, 8),
(86, 940, 6),
(86, 100, 8),
(86, 110, 5),
(86, 120, 7),
(87, 950, 7),
(87, 100, 6),
(87, 110, 9),
(87, 120, 8),
(88, 960, 9),
(88, 160, 8),
(88, 110, 5),
(88, 120, 7),
(89, 970, 6),
(89, 100, 5),
(89, 170, 8),
(89, 270, 6),
(90, 980, 7),
(90, 100, 6),
(90, 110, 9),
(90, 120, 5),
(91, 990, 5),
(91, 100, 8),
(91, 110, 6),
(91, 120, 9),
(92, 100, 9),
(92, 110, 7),
(92, 120, 8),
(92, 130, 5),
(93, 100, 7),
(93, 110, 6),
(93, 120, 5),
(93, 130, 8),
(94, 100, 8),
(94, 110, 9),
(94, 120, 7),
(94, 130, 6),
(95, 100, 5),
(95, 110, 7),
(95, 120, 8),
(95, 130, 6),
(96, 100, 9),
(96, 110, 5),
(96, 120, 7),
(96, 130, 8),
(97, 150, 6),
(97, 1150, 8),
(97, 250, 7),
(97, 350, 5),
(98, 90, 5),
(98, 160, 6),
(98, 260, 8),
(98, 360, 7),
(99, 70, 8),
(99, 170, 7),
(99, 270, 9),
(99, 370, 6),
(100, 80, 6),
(100, 180, 8),
(100, 280, 9),
(100, 380, 7),
(101, 90, 7),
(101, 190, 6),
(101, 290, 8),
(101, 390, 5),
(102, 100, 8),
(102, 300, 7),
(102, 400, 9),
(103, 110, 7),
(103, 210, 6),
(103, 310, 8),
(103, 410, 9),
(104, 120, 6),
(104, 220, 8),
(104, 320, 7),
(104, 420, 5),
(105, 130, 8),
(105, 230, 9),
(105, 330, 7),
(105, 430, 6),
(106, 140, 9),
(106, 240, 6),
(106, 340, 5),
(106, 440, 8),
(107, 150, 6),
(107, 250, 7),
(107, 350, 8),
(107, 450, 9),
(108, 160, 9),
(108, 260, 8),
(108, 360, 6),
(108, 460, 5),
(109, 170, 7),
(109, 270, 6),
(109, 70, 9),
(109, 470, 8),
(110, 180, 5),
(110, 80, 6),
(110, 380, 7),
(110, 480, 8),
(111, 190, 8),
(111, 290, 6),
(111, 390, 9),
(111, 490, 7),
(112, 200, 7),
(112, 300, 8),
(112, 400, 9),
(112, 500, 5),
(113, 210, 6),
(113, 310, 8),
(113, 410, 7),
(113, 510, 9),
(114, 220, 7),
(114, 320, 8),
(114, 420, 9),
(114, 520, 6),
(115, 230, 8),
(115, 330, 7),
(115, 430, 6),
(115, 530, 9),
(116, 240, 7),
(116, 340, 9),
(116, 440, 8),
(116, 540, 6),
(117, 250, 6),
(117, 350, 7),
(117, 450, 9),
(117, 550, 8),
(118, 260, 5),
(118, 360, 6),
(118, 460, 7),
(118, 560, 9),
(119, 270, 8),
(119, 370, 7),
(119, 470, 9),
(119, 570, 5),
(120, 280, 6),
(120, 380, 8),
(120, 480, 7),
(120, 580, 9),
(121, 1, 3),
(121, 300, 5),
(121, 200, 6),
(121, 500, 7),
(121, 700, 8),
(122, 120, 6),
(122, 220, 4),
(122, 320, 7),
(122, 420, 5),
(122, 520, 8),
(123, 130, 9),
(123, 230, 3),
(123, 330, 6),
(123, 430, 4),
(123, 530, 7),
(124, 140, 8),
(124, 240, 9),
(124, 340, 5),
(124, 440, 7),
(124, 540, 6),
(125, 150, 6),
(125, 250, 7),
(125, 350, 8),
(125, 450, 9),
(125, 550, 5),
(126, 160, 4),
(126, 260, 6),
(126, 360, 5),
(126, 460, 7),
(126, 560, 8),
(127, 170, 9),
(127, 270, 6),
(127, 370, 4),
(127, 470, 5),
(127, 570, 8),
(128, 180, 7),
(128, 280, 8),
(128, 380, 9),
(128, 480, 7),
(128, 580, 6),
(129, 190, 5),
(129, 290, 7),
(129, 390, 6),
(129, 490, 9),
(129, 590, 8),
(130, 200, 4),
(130, 300, 9),
(130, 400, 7),
(130, 500, 5),
(130, 600, 6),
(131, 210, 7),
(131, 310, 6),
(131, 410, 9),
(131, 510, 8),
(131, 610, 5),
(132, 220, 6),
(132, 320, 5),
(132, 420, 8),
(132, 520, 7),
(132, 620, 9),
(133, 230, 8),
(133, 330, 7),
(133, 430, 9),
(133, 530, 6),
(133, 630, 5),
(134, 240, 7),
(134, 340, 9),
(134, 440, 8),
(134, 540, 6),
(134, 640, 5),
(135, 250, 5),
(135, 350, 8),
(135, 450, 7),
(135, 550, 6),
(135, 650, 9),
(136, 260, 7),
(136, 360, 9),
(136, 460, 5),
(136, 560, 8),
(136, 660, 6),
(137, 270, 8),
(137, 370, 6),
(137, 470, 7),
(137, 570, 9),
(137, 670, 5),
(138, 280, 6),
(138, 380, 5),
(138, 480, 8),
(138, 580, 9),
(138, 680, 7),
(139, 290, 8),
(139, 390, 9),
(139, 490, 6),
(139, 590, 5),
(139, 690, 7),
(140, 300, 9),
(140, 400, 6),
(140, 500, 5),
(140, 600, 8),
(140, 700, 7),
(141, 310, 7),
(141, 410, 6),
(141, 510, 9),
(141, 610, 8),
(141, 710, 5),
(142, 320, 5),
(142, 420, 6),
(142, 520, 9),
(142, 620, 7),
(142, 720, 8),
(143, 330, 8),
(143, 430, 7),
(143, 530, 5),
(143, 630, 6),
(143, 730, 9),
(144, 340, 6),
(144, 440, 7),
(144, 540, 9),
(144, 640, 5),
(144, 740, 8),
(145, 350, 5),
(145, 450, 9),
(145, 550, 8),
(145, 650, 6),
(145, 750, 7),
(146, 360, 7),
(146, 460, 6),
(146, 560, 5),
(146, 660, 9),
(146, 760, 8),
(147, 370, 8),
(147, 470, 6),
(147, 570, 5),
(147, 670, 7),
(147, 770, 9),
(148, 380, 9),
(148, 480, 7),
(148, 580, 8),
(148, 680, 6),
(148, 780, 5),
(149, 390, 6),
(149, 490, 5),
(149, 590, 7),
(149, 690, 8),
(149, 790, 9),
(150, 400, 8),
(150, 500, 7),
(150, 600, 9),
(150, 700, 5),
(150, 800, 6),
(151, 410, 7),
(151, 510, 8),
(151, 610, 9),
(151, 710, 5),
(151, 810, 6),
(152, 420, 8),
(152, 520, 9),
(152, 620, 7),
(152, 720, 5),
(152, 820, 6),
(153, 430, 5),
(153, 530, 7),
(153, 630, 6),
(153, 730, 8),
(153, 830, 9),
(154, 440, 8),
(154, 540, 9),
(154, 640, 7),
(154, 740, 6),
(154, 840, 5),
(155, 450, 9),
(155, 550, 6),
(155, 650, 7),
(155, 750, 8),
(155, 850, 9),
(156, 460, 8),
(156, 560, 9),
(156, 660, 7),
(156, 760, 5),
(156, 860, 6),
(157, 470, 7),
(157, 570, 6),
(157, 670, 9),
(157, 770, 8),
(157, 870, 5),
(158, 480, 6),
(158, 580, 9),
(158, 680, 7),
(158, 780, 8),
(158, 880, 9),
(159, 490, 5),
(159, 590, 7),
(159, 690, 8),
(159, 790, 9),
(159, 890, 6),
(160, 500, 8),
(160, 600, 7),
(160, 700, 9),
(160, 800, 5),
(160, 900, 6),
(161, 510, 6),
(161, 610, 7),
(161, 710, 8),
(161, 810, 9),
(161, 910, 5),
(162, 520, 9),
(162, 620, 8),
(162, 720, 6),
(162, 820, 5),
(162, 920, 7),
(163, 530, 7),
(163, 630, 8),
(163, 730, 9),
(163, 830, 6),
(163, 930, 5),
(164, 540, 9),
(164, 640, 7),
(164, 740, 8),
(164, 840, 6),
(164, 940, 5),
(165, 550, 8),
(165, 650, 7),
(165, 750, 6),
(165, 850, 9),
(165, 950, 8),
(166, 560, 7),
(166, 660, 9),
(166, 760, 5),
(166, 860, 6),
(166, 960, 7),
(167, 570, 8),
(167, 670, 9),
(167, 770, 7),
(167, 870, 6),
(167, 970, 5),
(168, 580, 7),
(168, 680, 6),
(168, 780, 9),
(168, 880, 5),
(168, 980, 8),
(169, 590, 6),
(169, 690, 7),
(169, 790, 9),
(169, 890, 5),
(169, 990, 8),
(170, 600, 8),
(170, 700, 7),
(170, 800, 6),
(170, 900, 5),
(170, 1000, 9),
(171, 610, 5),
(171, 710, 6),
(171, 810, 8),
(171, 910, 7),
(171, 1000, 9),
(172, 620, 9),
(172, 720, 5),
(172, 820, 6),
(172, 920, 8),
(172, 100, 7),
(173, 630, 6),
(173, 730, 9),
(173, 830, 7),
(173, 930, 8),
(173, 110, 5),
(174, 640, 7),
(174, 740, 6),
(174, 840, 8),
(174, 940, 5),
(174, 120, 9),
(175, 650, 9),
(175, 750, 8),
(175, 850, 7),
(175, 950, 6),
(175, 130, 5),
(176, 660, 8),
(176, 760, 6),
(176, 860, 7),
(176, 960, 9),
(176, 140, 5),
(177, 670, 7),
(177, 770, 9),
(177, 870, 8),
(177, 970, 6),
(177, 150, 5),
(178, 680, 8),
(178, 780, 7),
(178, 880, 9),
(178, 980, 6),
(178, 160, 5),
(179, 690, 9),
(179, 790, 7),
(179, 890, 6),
(179, 990, 8),
(179, 170, 5),
(180, 700, 6),
(180, 800, 8),
(180, 900, 7),
(180, 1000, 5),
(180, 180, 9),
(181, 710, 9),
(181, 810, 6),
(181, 910, 7),
(181, 101, 8),
(181, 190, 5),
(182, 720, 8),
(182, 820, 7),
(182, 920, 9),
(182, 102, 6),
(182, 200, 5),
(183, 730, 9),
(183, 830, 8),
(183, 930, 7),
(183, 103, 6),
(183, 210, 5),
(184, 740, 6),
(184, 840, 7),
(184, 940, 9),
(184, 104, 8),
(184, 220, 5),
(185, 750, 9),
(185, 850, 8),
(185, 950, 7),
(185, 105, 6),
(185, 230, 5),
(186, 760, 7),
(186, 860, 9),
(186, 960, 8),
(186, 106, 6),
(186, 240, 5),
(187, 770, 6),
(187, 870, 9),
(187, 970, 7),
(187, 107, 8),
(187, 250, 5),
(188, 780, 9),
(188, 880, 8),
(188, 980, 7),
(188, 108, 6),
(188, 260, 5),
(189, 790, 7),
(189, 890, 9),
(189, 990, 8),
(189, 109, 6),
(189, 270, 5),
(190, 800, 6),
(190, 900, 8),
(190, 100, 9),
(190, 110, 7),
(190, 280, 5),
(191, 810, 9),
(191, 910, 8),
(191, 101, 7),
(191, 111, 6),
(191, 290, 5),
(192, 820, 7),
(192, 920, 9),
(192, 102, 8),
(192, 112, 6),
(192, 300, 5),
(193, 830, 9),
(193, 930, 8),
(193, 103, 7),
(193, 113, 6),
(193, 310, 5),
(194, 840, 6),
(194, 940, 8),
(194, 104, 9),
(194, 114, 7),
(194, 320, 5),
(195, 850, 8),
(195, 950, 9),
(195, 105, 6),
(195, 115, 7),
(195, 330, 5),
(196, 860, 7),
(196, 960, 9),
(196, 106, 8),
(196, 116, 6),
(196, 340, 5),
(197, 870, 9),
(197, 970, 8),
(197, 107, 7),
(197, 117, 6),
(197, 350, 5),
(198, 880, 7),
(198, 980, 6),
(198, 108, 9),
(198, 118, 8),
(198, 360, 5),
(199, 890, 9),
(199, 990, 7),
(199, 109, 8),
(199, 119, 6),
(199, 370, 5),
(200, 900, 8),
(200, 100, 7),
(200, 110, 9),
(200, 120, 6),
(200, 380, 5),
(201, 910, 7),
(201, 101, 6),
(201, 111, 8),
(201, 121, 9),
(201, 390, 5),
(202, 920, 9),
(202, 102, 8),
(202, 112, 7),
(202, 122, 6),
(202, 400, 5),
(203, 930, 8),
(203, 103, 9),
(203, 113, 7),
(203, 123, 6),
(203, 410, 5),
(204, 940, 7),
(204, 104, 9),
(204, 114, 8),
(204, 124, 6),
(204, 420, 5),
(205, 950, 9),
(205, 105, 8),
(205, 115, 7),
(205, 125, 6),
(205, 430, 5),
(206, 960, 7),
(206, 106, 9),
(206, 116, 8),
(206, 126, 5),
(206, 440, 5),
(207, 970, 9),
(207, 107, 8),
(207, 117, 7),
(207, 127, 6),
(207, 450, 5),
(208, 980, 7),
(208, 108, 6),
(208, 118, 9),
(208, 128, 8),
(208, 460, 5),
(209, 990, 8),
(209, 109, 7),
(209, 119, 6),
(209, 129, 9),
(209, 470, 5),
(210, 1000, 9),
(210, 110, 7),
(210, 120, 8),
(210, 130, 6),
(210, 480, 5),
(211, 327, 5),
(211, 619, 3),
(211, 910, 6),
(211, 133, 2),
(211, 505, 8),
(212, 204, 4),
(212, 307, 7),
(212, 408, 3),
(212, 156, 5),
(212, 789, 6),
(213, 523, 9),
(213, 291, 2),
(213, 645, 8),
(213, 800, 7),
(213, 354, 5),
(214, 438, 4),
(214, 611, 6),
(214, 303, 7),
(214, 908, 3),
(214, 112, 9),
(215, 792, 6),
(215, 451, 5),
(215, 368, 4),
(215, 234, 7),
(215, 575, 3),
(216, 634, 8),
(216, 307, 5),
(216, 541, 6),
(216, 809, 4),
(216, 231, 7),
(217, 402, 6),
(217, 106, 7),
(217, 978, 8),
(217, 291, 3),
(217, 645, 5),
(218, 532, 5),
(218, 812, 4),
(218, 354, 8),
(218, 139, 9),
(218, 690, 6),
(219, 234, 3),
(219, 617, 7),
(219, 876, 8),
(219, 983, 6),
(219, 452, 5),
(220, 203, 9),
(220, 701, 6),
(220, 409, 7),
(220, 502, 5),
(220, 778, 3),
(221, 697, 8),
(221, 824, 4),
(221, 304, 6),
(221, 653, 7),
(221, 299, 9),
(222, 922, 6),
(222, 410, 8),
(222, 753, 4),
(222, 159, 7),
(222, 626, 5),
(223, 637, 9),
(223, 512, 8),
(223, 186, 7),
(223, 729, 3),
(223, 450, 5),
(224, 914, 6),
(224, 109, 8),
(224, 580, 7),
(224, 279, 3),
(224, 364, 5),
(225, 225, 7),
(225, 874, 6),
(225, 301, 9),
(225, 512, 4),
(225, 695, 5),
(226, 191, 8),
(226, 529, 7),
(226, 212, 6),
(226, 954, 5),
(226, 312, 4),
(227, 866, 9),
(227, 345, 6),
(227, 512, 7),
(227, 759, 5),
(227, 831, 3),
(228, 243, 7),
(228, 805, 9),
(228, 135, 6),
(228, 934, 4),
(228, 456, 5),
(229, 903, 5),
(229, 308, 6),
(229, 124, 9),
(229, 401, 7),
(229, 612, 3),
(230, 104, 7),
(230, 767, 8),
(230, 514, 6),
(230, 978, 9),
(230, 259, 5),
(231, 760, 8),
(231, 903, 6),
(231, 113, 7),
(231, 568, 9),
(231, 430, 5),
(232, 416, 5),
(232, 283, 8),
(232, 576, 9),
(232, 102, 7),
(232, 759, 6),
(233, 239, 4),
(233, 902, 7),
(233, 648, 9),
(233, 312, 8),
(233, 853, 5),
(234, 897, 6),
(234, 514, 8),
(234, 767, 7),
(234, 619, 9),
(234, 731, 5),
(235, 113, 8),
(235, 756, 9),
(235, 203, 6),
(235, 400, 7),
(235, 391, 5),
(236, 438, 7),
(236, 617, 5),
(236, 590, 9),
(236, 814, 8),
(236, 921, 6),
(237, 564, 5),
(237, 279, 6),
(237, 140, 9),
(237, 399, 7),
(237, 650, 8),
(238, 711, 9),
(238, 205, 7),
(238, 420, 8),
(238, 915, 6),
(238, 823, 5),
(239, 139, 6),
(239, 501, 8),
(239, 620, 5),
(239, 776, 9),
(239, 200, 7),
(240, 907, 6),
(240, 601, 5),
(240, 910, 8),
(240, 615, 7),
(240, 410, 9),
(241, 923, 7),
(241, 490, 9),
(241, 572, 6),
(241, 285, 8),
(241, 339, 5),
(242, 189, 6),
(242, 779, 9),
(242, 162, 7),
(242, 254, 8),
(242, 627, 5),
(243, 601, 9),
(243, 872, 7),
(243, 437, 6),
(243, 159, 8),
(243, 495, 5),
(244, 984, 8),
(244, 214, 9),
(244, 765, 6),
(244, 133, 7),
(244, 823, 5),
(245, 271, 9),
(245, 498, 8),
(245, 606, 7),
(245, 204, 6),
(245, 832, 5),
(246, 183, 6),
(246, 739, 8),
(246, 102, 9),
(246, 319, 7),
(246, 875, 5),
(247, 414, 9),
(247, 600, 7),
(247, 975, 6),
(247, 432, 8),
(247, 843, 5),
(248, 923, 6),
(248, 332, 7),
(248, 116, 9),
(248, 405, 5),
(248, 556, 8),
(249, 783, 6),
(249, 605, 8),
(249, 729, 9),
(249, 313, 7),
(249, 908, 5),
(250, 451, 7),
(250, 344, 9),
(250, 883, 6),
(250, 342, 8),
(250, 607, 5),
(251, 928, 7),
(251, 745, 6),
(251, 304, 8),
(251, 613, 9),
(251, 540, 5),
(252, 736, 9),
(252, 220, 8),
(252, 403, 7),
(252, 191, 6),
(252, 654, 5),
(253, 509, 8),
(253, 132, 7),
(253, 350, 9),
(253, 578, 5),
(253, 711, 6),
(254, 912, 9),
(254, 246, 8),
(254, 103, 7),
(254, 631, 6),
(254, 564, 5),
(255, 503, 9),
(255, 804, 8),
(255, 276, 7),
(255, 930, 6),
(255, 257, 5),
(256, 443, 7),
(256, 129, 6),
(256, 601, 9),
(256, 872, 5),
(256, 688, 8),
(257, 120, 6),
(257, 973, 8),
(257, 301, 7),
(257, 506, 9),
(257, 758, 5),
(258, 702, 8),
(258, 987, 7),
(258, 212, 6),
(258, 443, 9),
(258, 330, 5),
(259, 354, 9),
(259, 158, 6),
(259, 812, 7),
(259, 525, 8),
(259, 790, 5),
(260, 657, 6),
(260, 279, 9),
(260, 610, 7),
(260, 482, 8),
(260, 495, 5),
(261, 903, 8),
(261, 525, 7),
(261, 617, 9),
(261, 603, 6),
(261, 102, 5),
(262, 802, 7),
(262, 299, 8),
(262, 147, 9),
(262, 217, 5),
(262, 633, 6),
(263, 982, 8),
(263, 454, 7),
(263, 129, 6),
(263, 731, 5),
(263, 408, 9),
(264, 317, 7),
(264, 185, 9),
(264, 941, 6),
(264, 528, 8),
(264, 731, 5),
(265, 706, 9),
(265, 248, 6),
(265, 539, 8),
(265, 167, 7),
(265, 420, 5),
(266, 192, 9),
(266, 383, 7),
(266, 854, 6),
(266, 931, 8),
(266, 740, 5),
(267, 301, 6),
(267, 410, 8),
(267, 222, 9),
(267, 124, 7),
(267, 565, 5),
(268, 831, 7),
(268, 304, 8),
(268, 746, 9),
(268, 624, 6),
(268, 451, 5),
(269, 412, 6),
(269, 155, 8),
(269, 921, 9),
(269, 677, 7),
(269, 409, 5),
(270, 519, 9),
(270, 265, 6),
(270, 741, 8),
(270, 606, 7),
(270, 830, 5),
(271, 209, 7),
(271, 623, 9),
(271, 631, 8),
(271, 473, 6),
(271, 330, 5),
(272, 602, 7),
(272, 861, 9),
(272, 710, 6),
(272, 347, 8),
(272, 529, 5),
(273, 920, 9),
(273, 379, 7),
(273, 426, 8),
(273, 573, 6),
(273, 542, 5),
(274, 436, 7),
(274, 800, 6),
(274, 579, 9),
(274, 311, 8),
(274, 604, 5),
(275, 672, 8),
(275, 604, 9),
(275, 354, 7),
(275, 341, 6),
(275, 942, 5),
(276, 765, 9),
(276, 152, 7),
(276, 307, 8),
(276, 238, 6),
(276, 443, 5),
(277, 118, 7),
(277, 397, 8),
(277, 432, 9),
(277, 674, 6),
(277, 601, 5),
(278, 513, 9),
(278, 849, 7),
(278, 301, 8),
(278, 618, 6),
(278, 127, 5),
(279, 602, 8),
(279, 349, 9),
(279, 417, 7),
(279, 350, 6),
(279, 500, 5),
(280, 230, 6),
(280, 452, 9),
(280, 773, 7),
(280, 604, 8),
(280, 319, 5),
(281, 374, 9),
(281, 920, 8),
(281, 625, 7),
(281, 681, 6),
(281, 302, 5),
(282, 539, 6),
(282, 296, 9),
(282, 413, 8),
(282, 752, 7),
(282, 294, 5),
(283, 491, 7),
(283, 872, 9),
(283, 604, 8),
(283, 532, 6),
(283, 126, 5),
(284, 812, 9),
(284, 572, 7),
(284, 319, 8),
(284, 403, 6),
(284, 541, 5),
(285, 761, 9),
(285, 324, 7),
(285, 147, 8),
(285, 592, 6),
(285, 530, 5),
(286, 731, 7),
(286, 658, 9),
(286, 467, 8),
(286, 906, 6),
(286, 358, 5),
(287, 945, 9),
(287, 754, 7),
(287, 821, 8),
(287, 106, 6),
(287, 618, 5),
(288, 489, 8),
(288, 932, 9),
(288, 502, 7),
(288, 734, 6),
(288, 211, 5),
(289, 460, 9),
(289, 336, 8),
(289, 725, 7),
(289, 610, 6),
(289, 892, 5),
(290, 561, 7),
(290, 310, 9),
(290, 543, 8),
(290, 781, 6),
(290, 429, 5),
(291, 410, 9),
(291, 756, 7),
(291, 836, 8),
(291, 196, 6),
(291, 914, 5),
(292, 242, 7),
(292, 193, 9),
(292, 430, 8),
(292, 345, 6),
(292, 634, 5),
(293, 614, 9),
(293, 356, 8),
(293, 735, 7),
(293, 285, 6),
(293, 129, 5),
(294, 745, 7),
(294, 763, 8),
(294, 356, 9),
(294, 517, 6),
(294, 481, 5),
(295, 192, 9),
(295, 504, 7),
(295, 816, 8),
(295, 632, 6),
(295, 597, 5),
(296, 658, 9),
(296, 744, 7),
(296, 382, 8),
(296, 940, 6),
(296, 113, 5),
(297, 283, 9),
(297, 212, 7),
(297, 752, 8),
(297, 971, 6),
(297, 659, 5),
(298, 832, 9),
(298, 675, 7),
(298, 543, 8),
(298, 812, 6),
(298, 451, 5),
(299, 461, 7),
(299, 145, 9),
(299, 539, 8),
(299, 759, 6),
(299, 417, 5),
(300, 271, 9),
(300, 533, 8),
(300, 759, 7),
(300, 509, 6),
(300, 926, 5),
(301, 184, 7),
(301, 456, 6),
(301, 842, 9),
(301, 139, 5),
(301, 675, 8),
(302, 537, 7),
(302, 923, 8),
(302, 650, 6),
(302, 208, 9),
(302, 790, 5),
(303, 654, 8),
(303, 289, 7),
(303, 182, 6),
(303, 510, 9),
(303, 921, 5),
(304, 637, 7),
(304, 463, 8),
(304, 125, 9),
(304, 378, 6),
(304, 530, 5),
(305, 319, 9),
(305, 726, 8),
(305, 451, 7),
(305, 208, 6),
(305, 574, 5),
(306, 693, 7),
(306, 843, 8),
(306, 335, 9),
(306, 804, 6),
(306, 781, 5),
(307, 950, 9),
(307, 812, 7),
(307, 174, 8),
(307, 347, 6),
(307, 233, 5),
(308, 446, 8),
(308, 597, 7),
(308, 306, 9),
(308, 238, 6),
(308, 984, 5),
(309, 452, 8),
(309, 720, 7),
(309, 610, 9),
(309, 358, 6),
(309, 925, 5),
(310, 541, 7),
(310, 410, 8),
(310, 389, 9),
(310, 172, 6),
(310, 333, 5),
(311, 762, 9),
(311, 298, 8),
(311, 175, 7),
(311, 704, 6),
(311, 213, 5),
(312, 623, 8),
(312, 835, 7),
(312, 939, 9),
(312, 269, 6),
(312, 134, 5),
(313, 413, 7),
(313, 492, 9),
(313, 314, 8),
(313, 126, 6),
(313, 511, 5),
(314, 968, 7),
(314, 304, 8),
(314, 105, 9),
(314, 596, 6),
(314, 581, 5),
(315, 532, 8),
(315, 633, 7),
(315, 765, 9),
(315, 271, 6),
(315, 159, 5),
(316, 473, 7),
(316, 346, 9),
(316, 573, 8),
(316, 850, 6),
(316, 728, 5),
(317, 451, 8),
(317, 321, 7),
(317, 530, 9),
(317, 747, 6),
(317, 817, 5),
(318, 678, 7),
(318, 485, 9),
(318, 217, 8),
(318, 295, 6),
(318, 361, 5),
(319, 501, 9),
(319, 709, 7),
(319, 314, 8),
(319, 122, 6),
(319, 417, 5),
(320, 758, 9),
(320, 135, 8),
(320, 923, 7),
(320, 505, 6),
(320, 273, 5),
(321, 185, 7),
(321, 369, 8),
(321, 478, 9),
(321, 938, 6),
(321, 310, 5),
(322, 113, 9),
(322, 761, 7),
(322, 712, 8),
(322, 285, 6),
(322, 649, 5),
(323, 946, 8),
(323, 271, 7),
(323, 315, 9),
(323, 561, 6),
(323, 491, 5),
(324, 824, 9),
(324, 752, 7),
(324, 607, 8),
(324, 836, 6),
(324, 183, 5),
(325, 607, 9),
(325, 947, 7),
(325, 587, 8),
(325, 262, 6),
(325, 520, 5),
(326, 317, 9),
(326, 672, 7),
(326, 530, 8),
(326, 391, 6),
(326, 205, 5),
(327, 925, 8),
(327, 427, 7),
(327, 694, 9),
(327, 365, 6),
(327, 719, 5),
(328, 108, 9),
(328, 291, 7),
(328, 419, 8),
(328, 255, 6),
(328, 341, 5),
(329, 945, 9),
(329, 628, 7),
(329, 552, 8),
(329, 815, 6),
(330, 740, 7),
(330, 415, 8),
(330, 467, 9),
(330, 316, 6),
(330, 508, 5),
(331, 879, 9),
(331, 201, 7),
(331, 842, 8),
(331, 101, 6),
(331, 223, 5),
(332, 124, 8),
(332, 501, 7),
(332, 263, 9),
(332, 349, 6),
(332, 923, 5),
(333, 615, 8),
(333, 437, 7),
(333, 481, 9),
(333, 945, 6),
(333, 850, 5),
(334, 103, 8),
(334, 417, 7),
(334, 801, 9),
(334, 232, 6),
(334, 743, 5),
(335, 842, 9),
(335, 903, 7),
(335, 160, 8),
(335, 465, 6),
(335, 724, 5),
(336, 721, 9),
(336, 554, 7),
(336, 108, 8),
(336, 812, 6),
(336, 604, 5),
(337, 694, 8),
(337, 920, 7),
(337, 811, 9),
(337, 427, 6),
(337, 125, 5),
(338, 591, 8),
(338, 850, 7),
(338, 265, 9),
(338, 138, 6),
(338, 849, 5),
(339, 516, 7),
(339, 806, 8),
(339, 710, 9),
(339, 276, 6),
(339, 517, 5),
(340, 437, 9),
(340, 651, 7),
(340, 832, 8),
(340, 620, 6),
(340, 389, 5),
(341, 126, 8),
(341, 204, 7),
(341, 981, 9),
(341, 951, 6),
(341, 234, 5),
(342, 913, 9),
(342, 641, 7),
(342, 261, 8),
(342, 568, 6),
(342, 148, 5),
(343, 365, 9),
(343, 249, 7),
(343, 725, 8),
(343, 465, 6),
(343, 919, 5),
(344, 374, 9),
(344, 185, 7),
(344, 835, 8),
(344, 709, 6),
(344, 568, 5),
(345, 952, 9),
(346, 725, 8),
(346, 542, 9),
(346, 463, 7),
(346, 332, 6),
(346, 856, 5),
(347, 915, 9),
(347, 214, 8),
(347, 603, 7),
(347, 551, 6),
(347, 728, 5),
(348, 413, 8),
(348, 639, 7),
(348, 172, 9),
(348, 325, 6),
(348, 548, 5),
(349, 795, 7),
(349, 528, 8),
(349, 109, 9),
(349, 694, 6),
(349, 267, 5),
(350, 861, 9),
(350, 417, 7),
(350, 654, 8),
(350, 793, 6),
(350, 702, 5),
(351, 230, 7),
(351, 563, 8),
(351, 942, 9),
(351, 486, 6),
(351, 328, 5),
(352, 732, 9),
(352, 851, 7),
(352, 249, 8),
(352, 561, 6),
(352, 473, 5),
(353, 192, 7),
(353, 615, 8),
(353, 107, 9),
(353, 932, 6),
(353, 746, 5),
(354, 315, 7),
(354, 423, 8),
(354, 941, 9),
(354, 481, 5),
(355, 298, 7),
(355, 760, 8),
(355, 543, 9),
(355, 209, 6),
(355, 614, 5),
(356, 562, 7),
(356, 816, 8),
(356, 982, 9),
(356, 195, 6),
(356, 844, 5),
(357, 305, 7),
(357, 228, 8),
(357, 689, 9),
(357, 412, 6),
(357, 165, 5),
(358, 672, 9),
(358, 938, 7),
(358, 172, 8),
(358, 523, 6),
(358, 834, 5),
(359, 827, 9),
(359, 310, 7),
(359, 907, 8),
(359, 496, 6),
(359, 437, 5),
(360, 155, 7),
(360, 694, 9),
(360, 246, 8),
(360, 132, 6),
(360, 312, 5),
(361, 481, 9),
(361, 153, 7),
(361, 420, 8),
(361, 590, 6),
(361, 963, 5),
(362, 818, 7),
(362, 743, 8),
(362, 131, 9),
(362, 326, 6),
(362, 915, 5),
(363, 690, 7),
(363, 482, 9),
(363, 327, 8),
(363, 947, 6),
(363, 473, 5),
(364, 624, 9),
(364, 512, 7),
(364, 206, 8),
(364, 854, 6),
(364, 683, 5),
(365, 319, 9),
(365, 451, 8),
(365, 235, 7),
(365, 874, 6),
(365, 730, 5),
(366, 520, 9),
(366, 635, 7),
(366, 719, 8),
(366, 521, 6),
(366, 392, 5),
(367, 897, 7),
(367, 240, 8),
(367, 459, 9),
(367, 806, 6),
(367, 238, 5),
(368, 148, 9),
(368, 743, 7),
(368, 872, 8),
(368, 599, 6),
(368, 607, 5),
(369, 905, 7),
(369, 207, 8),
(369, 513, 9),
(369, 268, 6),
(369, 670, 5),
(370, 634, 9),
(370, 523, 7),
(370, 356, 8),
(370, 982, 6),
(370, 347, 5),
(371, 983, 7),
(371, 515, 8),
(371, 893, 9),
(371, 472, 6),
(371, 120, 5),
(372, 785, 7),
(372, 487, 8),
(372, 628, 9),
(372, 609, 6),
(372, 239, 5),
(373, 463, 9),
(373, 171, 7),
(373, 831, 8),
(373, 952, 6),
(373, 609, 5),
(374, 915, 9),
(374, 611, 7),
(374, 459, 8),
(374, 743, 6),
(374, 338, 5),
(375, 182, 9),
(375, 271, 7),
(375, 527, 8),
(375, 713, 6),
(375, 617, 5),
(376, 485, 9),
(376, 341, 7),
(376, 419, 8),
(376, 929, 6),
(376, 213, 5),
(377, 535, 7),
(377, 139, 8),
(377, 214, 9),
(377, 820, 6),
(377, 641, 5),
(378, 508, 9),
(378, 819, 7),
(378, 541, 8),
(378, 293, 6),
(378, 124, 5),
(379, 139, 7),
(379, 874, 8),
(379, 346, 9),
(379, 623, 6),
(379, 324, 5),
(380, 507, 9),
(380, 813, 7),
(380, 412, 8),
(380, 451, 6),
(380, 621, 5),
(381, 409, 9),
(381, 935, 7),
(381, 217, 8),
(381, 596, 6),
(381, 540, 5),
(382, 943, 7),
(382, 841, 8),
(382, 503, 9),
(382, 608, 6),
(382, 482, 5),
(383, 122, 7),
(383, 759, 8),
(383, 487, 9),
(383, 323, 6),
(383, 416, 5),
(384, 532, 9),
(384, 214, 7),
(384, 149, 8),
(384, 563, 6),
(384, 416, 5),
(385, 582, 7),
(385, 420, 9),
(385, 521, 8),
(385, 148, 6),
(385, 730, 5),
(386, 921, 7),
(386, 361, 8),
(386, 752, 9),
(386, 507, 6),
(386, 719, 5),
(387, 532, 7),
(387, 437, 8),
(387, 981, 9),
(387, 523, 6),
(387, 204, 5),
(388, 816, 9),
(388, 435, 7),
(388, 295, 8),
(388, 692, 6),
(388, 471, 5),
(389, 509, 7),
(389, 301, 8),
(389, 186, 9),
(389, 946, 6),
(389, 152, 5),
(390, 215, 9),
(390, 561, 7),
(390, 738, 8),
(390, 922, 6),
(390, 515, 5),
(391, 562, 9),
(391, 835, 7),
(391, 673, 8),
(391, 549, 6),
(391, 730, 5),
(392, 329, 7),
(392, 514, 8),
(392, 265, 9),
(392, 647, 6),
(392, 852, 5),
(393, 439, 9),
(393, 528, 7),
(393, 471, 8),
(393, 729, 6),
(393, 236, 5),
(394, 647, 9),
(394, 527, 7),
(394, 402, 8),
(394, 581, 6),
(394, 915, 5),
(395, 732, 9),
(395, 814, 7),
(395, 642, 8),
(395, 912, 6),
(395, 314, 5),
(396, 951, 9),
(396, 391, 7),
(396, 260, 8),
(396, 140, 6),
(396, 512, 5),
(397, 852, 9),
(397, 579, 7),
(397, 194, 8),
(397, 621, 6),
(397, 358, 5),
(398, 412, 9),
(398, 753, 7),
(398, 902, 8),
(398, 115, 6),
(398, 431, 5),
(399, 821, 9),
(399, 452, 7),
(399, 663, 8),
(399, 199, 6),
(399, 482, 5),
(400, 451, 9),
(400, 275, 7),
(400, 872, 8),
(400, 516, 6),
(400, 763, 5);



INSERT INTO DeliveryOrders (OrderId, TimeOfDelivery, DeliveryManId, NoteForDelivery) VALUES
(210, '2024-01-01 09:19:26', 310, 'Please deliver with extra care'),
(211, '2024-01-02 14:25:42', 315, 'Deliver before 5 PM'),
(212, '2024-01-03 18:15:33', 320, 'Leave at the front door'),
(213, '2024-01-04 11:30:10', 325, 'Call if no one is home'),
(214, '2024-01-05 16:40:00', 330, 'Please ring the bell when delivering'),
(215, '2024-01-06 08:55:05', 335, 'Leave in the mailbox'),
(216, '2024-01-07 13:22:14', 340, 'Deliver to the back entrance'),
(217, '2024-01-08 07:10:22', 345, 'Please make sure the food is warm'),
(218, '2024-01-09 12:47:55', 350, 'Take a photo of the delivery location'),
(219, '2024-01-10 10:11:30', 355, 'Knock on the door when arriving'),
(220, '2024-01-11 09:01:42', 360, 'Call upon arrival, I might be upstairs'),
(221, '2024-01-12 15:34:25', 365, 'Please check if the order is complete before delivery'),
(222, '2024-01-13 08:25:00', 370, 'Leave in the kitchen if I am not home'),
(223, '2024-01-14 17:45:55', 375, 'Please bring the package to the front door'),
(224, '2024-01-15 14:12:38', 380, 'Ring the doorbell and wait for a response'),
(225, '2024-01-16 19:05:12', 385, 'Be careful with fragile items'),
(226, '2024-01-17 10:30:40', 390, 'Please leave the food in the lobby'),
(227, '2024-01-18 11:22:58', 395, 'Ring the bell if no one answers the phone'),
(228, '2024-01-19 13:17:15', 400, 'Leave the package at the door if I am not available'),
(229, '2024-01-20 16:25:50', 405, 'Make sure the food stays upright'),
(230, '2024-01-21 14:10:22', 410, 'If I am not home, leave at the back door'),
(231, '2024-01-22 11:55:12', 415, 'Please make sure to double check the address'),
(232, '2024-01-23 09:42:35', 420, 'Leave at the side door if the front door is locked'),
(233, '2024-01-24 12:13:10', 425, 'Leave the package with the concierge'),
(234, '2024-01-25 16:32:00', 430, 'Make sure to handle with care'),
(235, '2024-01-26 13:57:42', 435, 'Leave it on the porch if no one is home'),
(236, '2024-01-27 08:47:30', 440, 'Leave at the doorstep and knock loudly'),
(237, '2024-01-28 18:33:10', 445, 'Please call me if you cannot find the location'),
(238, '2024-01-29 10:55:05', 450, 'Leave the food by the kitchen door'),
(239, '2024-01-30 12:12:25', 455, 'Please text when you arrive'),
(240, '2024-01-31 14:44:55', 460, 'Please ensure to knock first before leaving'),
(241, '2024-02-01 11:12:33', 465, 'Leave at the front door if no one answers'),
(242, '2024-02-02 15:19:07', 470, 'Call before delivery if the gate is locked'),
(243, '2024-02-03 13:10:55', 475, 'Leave in the kitchen if I am not available'),
(244, '2024-02-04 08:50:22', 480, 'Ring the bell loudly to make sure I hear you'),
(245, '2024-02-05 19:15:11', 485, 'Leave at the back door if front is locked'),
(246, '2024-02-06 16:27:44', 490, 'Knock first, if no answer, leave at the porch'),
(247, '2024-02-07 14:30:10', 495, 'Leave in the mailbox if no one is home'),
(248, '2024-02-08 18:22:25', 500, 'Please make sure to handle the package carefully'),
(249, '2024-02-09 10:05:02', 505, 'Leave it inside the garage if I am not home'),
(250, '2024-02-10 12:18:32', 510, 'Call when you are near to confirm delivery'),
(251, '2024-02-11 09:30:12', 515, 'Leave in the lobby if no one answers the door'),
(252, '2024-02-12 13:40:05', 520, 'Leave at the front step and ring the bell'),
(253, '2024-02-13 17:25:55', 525, 'Ensure the package is placed safely away from the door'),
(254, '2024-02-14 11:50:22', 530, 'Please confirm the package is delivered correctly'),
(255, '2024-02-15 14:15:40', 535, 'Knock once, leave package by the door if no answer'),
(256, '2024-02-16 13:30:25', 540, 'Ring the bell and wait for a response'),
(257, '2024-02-17 08:12:30', 545, 'Leave the package at the side door'),
(258, '2024-02-18 15:42:50', 550, 'Please send a message when arriving'),
(259, '2024-02-19 10:55:40', 310, 'Leave at the back entrance if no one is home'),
(260, '2024-02-20 11:35:15', 315, 'Please ensure the package is not damaged'),
(261, '2024-02-21 09:20:05', 320, 'Leave the food with the concierge'),
(262, '2024-02-22 13:05:50', 325, 'Please handle with care, fragile items inside'),
(263, '2024-02-23 17:11:10', 330, 'If I am not home, leave at the back of the house'),
(264, '2024-02-24 08:22:25', 335, 'Ring the doorbell once and leave at the porch'),
(265, '2024-02-25 10:40:20', 340, 'Leave it at the kitchen counter if I am not there'),
(266, '2024-02-26 12:15:45', 345, 'Please double-check the delivery address before leaving'),
(267, '2024-02-27 14:25:05', 350, 'If no one answers, leave the package in the mailbox'),
(268, '2024-02-28 16:00:30', 355, 'Please knock on the door when arriving'),
(269, '2024-02-29 09:45:55', 360, 'Leave it near the door, I will get it soon'),
(270, '2024-03-01 14:13:42', 365, 'If no one is home, please leave it inside the garage'),
(271, '2024-03-02 12:18:55', 370, 'Ensure the package is in a safe spot before leaving'),
(272, '2024-03-03 10:35:22', 375, 'Please knock loudly before leaving the delivery'),
(273, '2024-03-04 13:45:10', 380, 'Leave it inside the house, I will come down to get it'),
(274, '2024-03-05 16:05:35', 385, 'Make sure to check the delivery address before dropping off'),
(275, '2024-03-06 14:00:00', 390, 'Leave the package on the front doorstep'),
(276, '2024-03-07 17:10:30', 395, 'Ring the bell once and leave the package if no one answers'),
(277, '2024-03-08 10:25:00', 400, 'Please leave at the back door if the front is locked'),
(278, '2024-03-09 12:50:55', 405, 'Leave it at the front door if no one answers'),
(279, '2024-03-10 14:11:35', 410, 'Please leave the delivery near the garage door'),
(280, '2024-03-11 09:01:42', 415, 'Leave at the side entrance and ring the bell'),
(281, '2024-03-12 11:32:00', 420, 'Make sure to leave the package inside the porch'),
(282, '2024-03-13 16:22:10', 425, 'Leave it under the porch if no one answers'),
(283, '2024-03-14 10:45:25', 430, 'Call when you are near, I will open the door'),
(284, '2024-03-15 08:30:15', 435, 'Please leave the food in the kitchen if no one answers'),
(285, '2024-03-16 14:33:55', 440, 'Please ensure the food is delivered before 3 PM'),
(286, '2024-03-17 09:20:50', 445, 'Leave it at the front, I will take it from there'),
(287, '2024-03-18 13:10:00', 450, 'Ring the doorbell and wait for a response'),
(288, '2024-03-19 16:25:40', 455, 'Please call before arriving to confirm the delivery'),
(289, '2024-03-20 11:12:20', 460, 'Make sure to leave the package with the concierge'),
(290, '2024-03-21 15:05:15', 465, 'Leave the food in the kitchen area if I am not available'),
(291, '2024-03-22 12:00:45', 470, 'Please make sure the package is placed safely'),
(292, '2024-03-23 10:45:00', 475, 'Knock on the door, if no one answers leave at the back'),
(293, '2024-03-24 13:50:30', 480, 'Please ensure that the delivery is handled with care'),
(294, '2024-03-25 11:10:25', 485, 'Ring the bell and leave the package if no one is home'),
(295, '2024-03-26 16:32:10', 490, 'Leave the food inside the porch if no one answers'),
(296, '2024-03-27 08:59:42', 495, 'Please make sure the food is still hot when delivered'),
(297, '2024-03-28 17:20:55', 500, 'Leave in the lobby and wait for me to come down'),
(298, '2024-03-29 14:05:10', 505, 'Please deliver it to the back door if I am not home'),
(299, '2024-03-30 10:45:30', 510, 'Ring the bell and leave if no one answers'),
(300, '2024-03-31 15:10:00', 515, 'Leave it in the mailbox if I am not around'),
(301, '2024-01-01 09:15:22', 320, 'Leave at the side entrance and knock on the door'),
(302, '2024-01-02 11:25:35', 325, 'Please call before delivering the package'),
(303, '2024-01-03 13:40:12', 330, 'Ensure the delivery is made before noon'),
(304, '2024-01-04 17:05:45', 335, 'Leave the package near the garage'),
(305, '2024-01-05 10:50:00', 340, 'Ring the bell and leave the package on the porch'),
(306, '2024-01-06 14:20:15', 345, 'Leave at the backdoor if I am not home'),
(307, '2024-01-07 16:45:32', 350, 'Make sure the delivery is handled with care'),
(308, '2024-01-08 08:35:10', 355, 'Knock loudly and leave the package if no one answers'),
(310, '2024-01-10 09:40:30', 365, 'Place the package near the window on the porch'),
(311, '2024-01-11 13:15:00', 370, 'Deliver to the side gate if the front is locked'),
(312, '2024-01-12 12:10:55', 375, 'Call upon arrival to confirm delivery instructions'),
(313, '2024-01-13 14:05:20', 380, 'Leave in the kitchen if the door is open'),
(314, '2024-01-14 16:22:10', 385, 'Ensure the delivery is made before 4 PM'),
(315, '2024-01-15 10:35:55', 390, 'Leave it by the garden gate if no one is home'),
(316, '2024-01-16 08:45:15', 395, 'Please place the delivery on the porch bench'),
(317, '2024-01-17 15:25:42', 400, 'Deliver to the front office and notify me upon arrival'),
(318, '2024-01-18 09:10:30', 405, 'Knock once and leave the package near the backdoor'),
(319, '2024-01-19 13:35:00', 410, 'Ensure the food is still hot upon delivery'),
(320, '2024-01-20 17:45:50', 415, 'Leave it near the mailbox if I am not available'),
(321, '2024-01-21 10:50:20', 420, 'Please handle the delivery carefully, fragile items'),
(322, '2024-01-22 12:40:25', 425, 'Leave it at the front gate and notify me'),
(323, '2024-01-23 14:22:55', 430, 'Ring the bell twice to ensure I hear it'),
(324, '2024-01-24 16:15:35', 435, 'Place the package near the garden shed'),
(325, '2024-01-25 08:05:22', 440, 'Deliver it to the lobby and notify the concierge'),
(326, '2024-01-26 15:50:30', 445, 'Please confirm delivery via text upon arrival'),
(327, '2024-01-27 11:40:00', 450, 'Leave at the side entrance if no one is home'),
(328, '2024-01-28 09:25:10', 455, 'Ring the doorbell once and leave on the porch'),
(329, '2024-01-29 13:05:55', 460, 'Call me when you are 5 minutes away from arrival'),
(330, '2024-01-30 16:22:20', 465, 'Place the delivery inside the front gate area'),
(331, '2024-01-31 12:35:00', 470, 'Make sure to leave the food near the kitchen door'),
(332, '2024-02-01 10:50:15', 475, 'Place it at the backdoor and knock twice'),
(333, '2024-02-02 14:22:05', 480, 'Ensure no one tampers with the package after delivery'),
(334, '2024-02-03 09:10:30', 485, 'Leave near the front steps if I am not available'),
(335, '2024-02-04 11:05:50', 490, 'Please ring the bell twice to alert me of your arrival'),
(336, '2024-02-05 13:20:40', 495, 'Make sure the package is delivered before noon'),
(337, '2024-02-06 15:50:30', 500, 'Leave it in the mailbox if the front door is locked'),
(338, '2024-02-07 16:10:15', 505, 'Please call me once the delivery is complete'),
(339, '2024-02-08 12:30:22', 510, 'Ring the bell and wait for me to come outside'),
(340, '2024-02-09 13:50:10', 515, 'Leave the delivery near the backyard gate'),
(341, '2024-02-10 09:15:42', 520, 'Place the food on the bench near the main door'),
(342, '2024-02-11 14:10:00', 525, 'Ensure the package is safe from weather elements'),
(343, '2024-02-12 10:25:55', 530, 'Ring the bell and wait at least a minute for me'),
(344, '2024-02-13 08:50:30', 535, 'Deliver to the lobby and confirm with reception'),
(345, '2024-02-14 15:45:15', 540, 'Leave the package near the back steps'),
(346, '2024-02-15 09:10:35', 545, 'Please place the delivery on the garden table'),
(347, '2024-02-16 12:20:00', 550, 'Ensure the food is not left in the sun during delivery'),
(348, '2024-02-17 10:15:45', 310, 'Ring the bell and leave on the porch if no answer'),
(349, '2024-02-18 16:40:22', 315, 'Leave it with the security guard at the gate'),
(350, '2024-02-19 09:22:55', 320, 'Ensure the delivery is made before noon'),
(351, '2024-02-20 13:50:40', 325, 'Call before arriving to confirm the time'),
(352, '2024-02-21 15:10:20', 330, 'Place the delivery inside the side door'),
(353, '2024-02-22 08:25:15', 335, 'Knock once and leave at the front steps'),
(354, '2024-02-23 14:50:30', 340, 'Please ensure the package is in good condition'),
(355, '2024-02-24 16:20:50', 345, 'Leave at the front door and text me upon delivery'),
(356, '2024-02-25 12:35:10', 350, 'Place it near the garage if no one is home'),
(357, '2024-02-26 14:10:25', 355, 'Ring the bell and wait at least 2 minutes'),
(358, '2024-02-27 13:15:00', 360, 'Call when you arrive and I will come out'),
(359, '2024-02-28 11:50:45', 365, 'Place the delivery near the side window'),
(360, '2024-03-01 10:30:55', 370, 'Leave the package near the bench on the porch'),
(361, '2024-03-02 16:40:10', 375, 'Please confirm the delivery time upon arrival'),
(362, '2024-03-03 09:50:55', 380, 'Deliver it to the back door if the front is locked'),
(363, '2024-03-04 14:15:00', 385, 'Ensure the package is left in a safe place'),
(364, '2024-03-05 15:22:30', 390, 'Place it near the front steps and notify me'),
(365, '2024-03-06 13:10:40', 395, 'Leave at the backdoor and ring the bell once'),
(366, '2024-03-07 10:35:50', 400, 'Make sure the food is kept warm until delivery'),
(367, '2024-03-07 14:22:10', 401, 'Leave the package on the porch bench'),
(368, '2024-03-08 16:15:30', 402, 'Ensure the delivery is before noon'),
(369, '2024-03-09 09:10:20', 403, 'Place the food near the garden gate'),
(370, '2024-03-10 11:05:15', 404, 'Knock twice and leave near the side entrance'),
(371, '2024-03-11 13:25:50', 405, 'Ring the bell and wait for confirmation'),
(372, '2024-03-12 15:40:10', 406, 'Leave it in the kitchen if I am not home'),
(373, '2024-03-13 08:55:00', 407, 'Deliver to the front desk and notify the receptionist'),
(374, '2024-03-14 12:35:30', 408, 'Call me when you are 5 minutes away from arrival'),
(375, '2024-03-15 10:25:40', 409, 'Place the delivery near the window on the porch'),
(376, '2024-03-16 14:50:15', 410, 'Leave it at the backdoor if the front is locked'),
(377, '2024-03-17 09:40:00', 411, 'Ring the doorbell once and leave on the porch'),
(378, '2024-03-18 16:20:55', 412, 'Ensure the food is kept warm for delivery'),
(379, '2024-03-19 13:35:40', 413, 'Call before arriving to confirm delivery details'),
(380, '2024-03-20 08:15:30', 414, 'Deliver it to the lobby and leave with security'),
(381, '2024-03-21 11:10:25', 415, 'Place the package near the front garden'),
(382, '2024-03-22 14:40:20', 416, 'Ring the bell twice and wait for me to answer'),
(383, '2024-03-23 09:25:15', 417, 'Leave it near the mailbox if no one is home'),
(384, '2024-03-24 16:30:50', 418, 'Make sure the delivery is made before sunset'),
(385, '2024-03-25 12:15:10', 419, 'Leave the food near the backyard gate'),
(386, '2024-03-26 10:35:22', 420, 'Please confirm the delivery by sending me a message'),
(387, '2024-03-27 15:25:30', 421, 'Ensure the package is placed in a secure location'),
(388, '2024-03-28 13:10:55', 422, 'Knock and wait at least a minute for me to come'),
(389, '2024-03-29 09:45:10', 423, 'Deliver the package to the side door entrance'),
(390, '2024-03-30 11:50:30', 424, 'Call upon arrival and wait for instructions');


--Ispis svih jela koja imaju cijenu manju od 15 eura.
SELECT * FROM dishes WHERE price < 15;

--Ispis svih narudžbi iz 2023. godine koje imaju ukupnu vrijednost veću od 50 eura.
SELECT * FROM orders WHERE price > 50;

--Ispis svih dostavljača s više od 100 uspješno izvršenih dostava do danas.
SELECT DeliveryMan.Id, Persons.Name, COUNT(DeliveryMan.Id)
	FROM DeliveryMan
	JOIN DeliveryOrders ON DeliveryMan.Id = DeliveryOrders.DeliveryManId
	JOIN Persons ON DeliveryMan.Id = Persons.Id
	GROUP BY DeliveryMan.Id, Persons.Name
	HAVING COUNT(DeliveryMan.Id) > 1;

--Ispis svih kuhara koji rade u restoranima u Zagrebu
SELECT Cook.Id, Persons.name, Restaurants.Name, Cities.name FROM Cook 
	JOIN Restaurants on Cook.RestaurantsId = Restaurants.Id
	JOIN Cities on Restaurants.CityId = Cities.Id
	JOIN Persons on Cook.Id = Persons.Id
	WHERE Cities.name = 'Zagreb';

--Ispis broja narudžbi za svaki restoran u Splitu
SELECT Restaurants.Name, COUNT(Orders.Id)
	FROM Restaurants 
	JOIN Orders ON Restaurants.Id = Orders.RestaurantsId
	JOIN Cities ON Restaurants.cityid = Cities.Id
	WHERE Cities.name = 'Split'
	GROUP BY Restaurants.Name

--Ispis svih jela u kategoriji "Deserti" koja su naručena više od 10 puta
SELECT Dishes.Name, Category.CategoryName FROM Dishes
	JOIN OrderDishes ON Dishes.Id = OrderDishes.DishesId
	JOIN Category ON Dishes.CategoryId = Category.Id
	GROUP BY Dishes.Id,Category.Id
	HAVING COUNT(Dishes.Id) > 2 AND Category.CategoryName = 'dessert';

--Ispis broja narudžbi korisnika s prezimenom koje počinje na "M"
SELECT COUNT(Orders.Id) FROM DeliveryOrders
	JOIN Orders ON DeliveryOrders.OrderId = Orders.Id
	JOIN Customers ON Orders.CustomersId = Customers.Id
	JOIN Persons ON Customers.Id = Persons.Id
	WHERE Persons.Surname LIKE 'M%';


--Ispis svih restorana koji imaju kapacitet veći od 30 stolova
SELECT Restaurants.Name From Restaurants
	WHERE Restaurants.Capacity > 30;