CREATE TABLE `companies` (
  `id`                 INT(5)            NOT NULL
  COMMENT 'Идентификатор записи',
  `title`              VARCHAR(255)      NOT NULL
  COMMENT 'Название предприятия',
  `activities`         TEXT              NOT NULL
  COMMENT 'Вид деятельности предприятия',
  `contacts`           TEXT              NOT NULL
  COMMENT 'Контактная информация',
  `region`             SET ('Минск', 'Минская область', 'Брестская область', 'Гродненская область', 'Витебская область',
                            'Могилевская область', 'Гомельская область', 'Беларусь')                                     NOT NULL DEFAULT 'Беларусь'
  COMMENT 'Регион',
  `address`            VARCHAR(255)                                                                                      NOT NULL DEFAULT 'Не указан'
  COMMENT 'Адрес',
  `coordinates`        VARCHAR(255)                                                                                      NOT NULL
  COMMENT 'Координаты на карте',
  `recruitment`        SET ('Есть', 'Нету')                                                                                 NOT NULL DEFAULT 'Есть'
  COMMENT 'Наличие вакансий',
  `disability`         SET ('по зрению', 'по слуху', 'глухонемые', 'колясочники', 'ментальные растройства',
                            '1-я группа', '2-я группа', '3-я группа')                                                    NOT NULL
  COMMENT 'Вид инвалидности',
  `profession`         SET ('автоматчик', 'бухгалтер', 'водитель', 'вязальщик', 'грузчик', 'журналист', 'закройщик',
    'изготовитель изделий', 'инженер', 'инженерно-техн. работник', 'кладовщик', 'комплектовщик', 'копирайтер',
    'литейщик пластмасс', 'логопед-дефектолог', 'маркировщик', 'мастер швейного цеха', 'машинист-кочегар',
    'менеджер по продажам', 'наладчик', 'намотчик рулонов', 'обработчик металла', 'портной', 'рабочий в цех', 'сборщик',
    'слесарь', 'смм специалист', 'специалист по кадрам', 'строитель', 'токарь', 'уборщик', 'укладчик-упаковщик',
                            'фотограф', 'швея', 'шлифовщик', 'штамповщик', 'электрик')                                   NOT NULL
  COMMENT 'Наименования вакансий',
  `employment`         SET ('Полная', 'Частичная')                                                                       NOT NULL DEFAULT 'Полная'
  COMMENT 'Занятость',
  `place_work`         SET ('Офис', 'Удаленно')                                                                          NOT NULL DEFAULT 'Офис'
  COMMENT 'Место работы',
  `working_conditions` SET ('Есть', 'Нету')                                                               NOT NULL DEFAULT 'Нету'
  COMMENT 'Место работы (безбарьерная среда)',
  `education`          SET ('высшее', 'средне-специальное', 'без образования')                                           NOT NULL DEFAULT 'без образования'
  COMMENT 'Образование',
  `experience`         SET ('Есть', 'Нету')                                                                              NOT NULL DEFAULT 'Нету'
  COMMENT 'Опыт работы',
  `training`           SET ('Есть', 'Нету')                                                                              NOT NULL DEFAULT 'Нету'
  COMMENT 'Обучение'
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='Предприятия предоставляющие вакансии';

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `title`, `activities`, `contacts`, `region`, `address`, `coordinates`, `recruitment`, `disability`, `profession`, `employment`, `place_work`, `working_conditions`, `education`, `experience`, `training`)
VALUES
  (1, 'ЧТПУП «ИнваШанс»', 'Швейное производство, оптовая и розничная торговля', ' тел. 8(0152)722226', 'Гродненская область', '230005, г. Гродно, ул. Телеграфная, 22', '53.682031, 23.836715', 'Есть', '2-я группа,3-я группа', 'швея', 'Полная,Частичная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (2, 'Барановичское ЧУП «Блик» ОО «БелОГ»', 'Производство и продажа мужской обуви и швейных изделий', '(8-0163) факс 41-67-42, 41-65-89, е-mail: blik@tut.by\" blik.brest.by@mail.ru, http://www.blik.brest.by', 'Брестская область', '225406, Брестская область, г.Барановичи, ул.Пионерская, д.53', '53.128489, 25.999364', 'Есть', 'по слуху', 'сборщик,швея', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Есть'),
  (3, 'Брестское Унитарное предприятие «Промбрис» ОО «БелОГ».', 'Производство: белье постельное; блузы женские; дроссели; одежда специальная; перемычки к электроплитам; сорочки; сорочки форменные; трусы; халаты женские; халаты медицинские; шнуры к бытовой технике; электророзжиг к газовым плитам', 'Телефон: (0162)21-13-43-рук., 21-75-18-гл.бухгал., 21-72-86-план. отд., зам.дир.по эконом. Факс:  21-72-23-прием., E-mail: prombris@brest.by, http://prombris.belorussia.su/', 'Брестская область', '224030, г. Брест, ул. Куйбышева, 55', '52.090384, 23.696309', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (4, 'ТрайдексБелПлюс', 'Компания ООО \"Трайдексбелплюс\" - крупный дистрибьютор компьютерных комплектующих, телефонов, планшетов, ноутбуков, мониторов, периферийных устройств, аксессуаров, мультимедиа в Республике Беларусь.', 'Тел./факс: 8-017-362-76-81; 8-017-362-76-83 По всем вопросам звоните +375 44 573 8885', 'Минск', '223016 Минский район Новодворский с/с 33/1-8 ком.64 , район д.Большое Стиклево', '53.870914, 27.702498', 'Есть', 'по зрению,по слуху,глухонемые,колясочники,ментальные растройства,1-я группа,2-я группа,3-я группа', 'бухгалтер,водитель,инженер,кладовщик,маркировщик,менеджер по продажам,специалист по кадрам,уборщик', 'Полная,Частичная', 'Офис,Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (5, 'Гомельское Производственное Частное Унитарное Предприятие «Випра» ОО «БелОГ»', 'Производство: арматура водозапорная; белье постельное; блузы; вентили к газовым баллонам; краны для газовых и водяных систем; краны пробковые; краны топливные; литье цветных металлов; одежда детская; платья; регуляторы давления газа; сорочки; трусы; халат', 'Телефон: (0232)57-54-61-прием., 57-35-92-зам.дир., Факс: (0232)57-62-10-маркет.отд., http://vipra.by/, E-mail: vipra@tut.by', 'Гомельская область', '246007, г. Гомель, пр-д Троллейбусный, 4 ', '52.470761, 30.993755', 'Есть', '3-я группа', 'наладчик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (6, 'Минское Частное Унитарное Предприятие «Виток» ОО «БелОГ»', 'Производство: жгуты для автотранспорта, электропроводки; изделия металлические; панели для холодильников; пружины Работы/услуги: металлообработка; монтаж электропроводки.', 'Телефон: (017)204-33-53-прием., E-mail: info@vitok.by, www.vitok.by', 'Минск', '220073, г. Минск, ул. Гусовского, 20 ', '53.903827, 27.514346', 'Есть', 'по слуху,3-я группа', 'автоматчик,вязальщик,наладчик,шлифовщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (7, 'Могилевское производственное частное унитарное предприятие “МЕТИЗ” ОО «БелОГ»', 'Изготовление деталей методом холодной штамповки, механо - обработка. Производство метизов и других деталей из проволоки, гибки и накатки резьбы.Нанесение цинковых и фосфатных покрытий. Полимерно-порошковое покрытие деталей в любой цвет.Литьё деталей из цв', 'Директор приемная: +375 (222) 28-34-39тел./факс.: +375 (222) 23-59-95 Главный инженер приемная: +375 (222) 28-34-39тел.: +375 (222) 23-75-09 Отдел сбыта e-mail: metizu@mail.ruтел.: +375 (222) 28-36-08тел./факс.: +37', 'Могилевская область', '212022, г. Могилев, ул. Космонавтов, 27 ', '53.905329, 30.303822', 'Есть', 'по слуху', 'слесарь,токарь,штамповщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (8, 'Агенство социальных новостей (SocNews.by)', 'Новостное агенство', '+37529 37 37 645 +37529 76 23 041', 'Беларусь', 'Беларусь', '', 'Есть', 'по зрению,по слуху,глухонемые,колясочники,ментальные растройства', 'журналист,смм специалист', 'Полная,Частичная', 'Удаленно', 'Есть', 'без образования', 'Нету', 'Нету'),
  (9, 'Центр развития речи и поведения \"Алешка\" Юлии Довженко', 'Образовательные услуги для детей с аутизмом', '8 (017) 237 21 31 8 (017) 237 21 41 8 (029) 146 33 39 Yulidov@rambler.ru сайт http://alesha.by/o-nas.html', 'Минск', 'Логойский тракт, 15/1    ', '53.942916, 27.608238', 'Есть', '1-я группа,2-я группа,3-я группа', 'логопед-дефектолог', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (10, 'Научно-производственное Унитарное Предприятие «Электроремонт» ОО «БелОИ»', 'Электрофизические измерения, электромонтаж', 'Тел. (017)295-66-94, 8017-2960464, elektrorem@mail.ru,  http://elektroremont.belorussia.su', 'Минск', '220026, г. Минск, ул. Филатова, 10а', '53.870564, 27.630471', 'Есть', '1-я группа,2-я группа,3-я группа', 'изготовитель изделий,сборщик', 'Частичная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (11, 'Научно-производственное Унитарное Предприятие \"Сиринга\" ОО \"БелОИ\"', 'Научные исследования и производство, производство медицинских бинтов, ваты, марли, производство изделий медицинского назначения', 'тел. 3859177,(017)237-35-57,  2123922 (факс), Факс: (017)295-10-01, 296-43-38, siringa@tut.by, boomervb@tut.by, http://siringa.belorussia.su/', 'Минск', '220026, Минск, пр-т Партизанский, 91-3', '53.874455, 27.635187', 'Есть', 'по зрению,по слуху,глухонемые,2-я группа,3-я группа', 'намотчик рулонов,сборщик,укладчик-упаковщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (12, 'НПУП «Экобелтехнология»', 'Швейное производство', ' тел. 2856394факс и приемная ecobel@mail.ru', 'Минск', '220012, г. Минск, ул. Калинина, 7-26/4, ', '53.925714, 27.606298', 'Есть', '1-я группа,2-я группа,3-я группа', 'водитель,грузчик,мастер швейного цеха,швея', 'Полная,Частичная', 'Офис,Удаленно', 'Нету', 'средне-специальное,без образования', 'Нету', 'Нету'),
  (13, 'ООО \"ЭкоИдея\"', '', 'телефон/факс: +375-17-334-53-23; info@ecoidea.by;', 'Минск', 'пр. Машерова, 9-317, Минск, 220029, Беларусь, ', '53.915634, 27.571964', 'Есть', 'по зрению,по слуху,глухонемые,колясочники,ментальные растройства,1-я группа,2-я группа,3-я группа', 'журналист,копирайтер,фотограф', 'Частичная', 'Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (14, 'Оршанское ЧУП «Нить» ОО «БелОГ»', 'Производство: белье постельное; куртки; куртки ватные; одеяла; платья; сорочки женские; спецодежда; халаты медицинские', 'Телефон: +375(216)44-02-61 +375(216)44-07-65. chup_nit@tut.by, http://www.orsha-nit.by/', 'Витебская область', '211391, Витебская обл., г. Орша, ул. Короткевича, 5 ', '54.514687, 30.435865', 'Есть', '1-я группа,2-я группа,3-я группа', 'швея', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (15, 'Производственно- торговое унитарное предприятие \"ЩучинСпецПошив\" ОО \"БелОИ\"', 'Швейное производство', 'тел. 8(01514)26071директор   28334факс', 'Гродненская область', '231513, Гродненская обл., г. Щучин, ул. Горького, 4', '53.605695, 24.744175', 'Есть', '2-я группа,3-я группа', 'комплектовщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (16, 'Производственное Унитарное Предприятие «Ин-Об-Нова» ОО «БелОИ»', 'Производство: изделия швейные; логотипы вышитые; одежда для военнослужащих; одежда рабочая', 'тел. 2086856, 2088185, факс, Тел.:+375(17)208-68-56 Факс:+375(17)208-81-85, inobnova@tut.by, http://www.inobnova.by/', 'Минск', '220036, г. Минск, ул. Волоха, 1-210 или 205??', '53.896098, 27.516394', 'Есть', '1-я группа,2-я группа,3-я группа', 'бухгалтер,грузчик,закройщик,портной,рабочий в цех,швея', 'Полная,Частичная', 'Офис', 'Нету', 'средне-специальное,без образования', 'Нету', 'Есть'),
  (17, 'Производственное Унитарное Предприятие \"Рубин\" ОО \"БелОИ\"', 'Швейное производство, строительство, перемотка электродвигателей, ремонтные работы, кровельные работы; малярные работы; отделочные работы. Оптовая торговля: лист железный и стальной с покрытием и магнитный; лист и полоса железные и стальные оцинкованные; рукавицы рабочие', 'тел. 8(0232) 232044. rubin_beloi@tut.by', 'Гомельская область', '246008, г. Гомель, ул. Киевская, 65', '52.433666, 30.976687', 'Есть', '2-я группа,3-я группа', 'комплектовщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (18, 'Производственное Унитарное Предприятие \"Центр Содействия\" ОО \" БелОИ\"', 'Производство трикотажных изделий, ручное вязание.  Верхний трикотаж (костюмы, жакеты, свитера и т.п.)', 'тел. 2456181 конт 2450199 факс, assistance@tut.by, http://ruchnoe-vyazanie.belorussia.su/', 'Минск', '220037, г. Минск, пер. Козлова, 16', '53.898793, 27.600423', 'Есть', 'колясочники,1-я группа,2-я группа,3-я группа', 'вязальщик', 'Частичная', 'Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (19, 'Производственное Частное Унитарное Предприятие «Элект» ОО «БелТИЗ»', 'Ведущий производитель в Республике Беларусь предохранителей серии ПН2 и ПТ1. Производство туалетной бумаги, гвоздей,окон и дверей из профиля ПВХ, включая стеклопакеты, швейных изделий и пр.', '+375 212 36 35 01, 36 98 10, elekt@beltiz.by, elekt@vitebsk.net, http://elekt.vitebsk.by/', 'Витебская область', '210603, г. Витебск, Комсомольская, 11/5', '55.195678, 30.195242', 'Есть', '2-я группа,3-я группа', 'литейщик пластмасс', 'Полная,Частичная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (20, 'Производственно-торговое Унитарное Предприятие «Труженик» ОО «БелОИ»', 'Швейное производство, ремонт обуви и одежды. Обработка, лужение, пайка резинотехнических изделий, Создание теле-радиоаппаратуры производственного назначения', '80173286648 факс 8017 327 64 70, Телефон: (017) 294-11-17-швей.цех, 328-53-72-быт.усл., 227-69-71-рук. Факс: (017)328-66-48, truzhenik_org@mail.ru, www.truzhenik.by', 'Минск', '220033, г. Минск, ул. Ленина, 15а', '53.898963, 27.561921', 'Есть', '1-я группа,2-я группа,3-я группа', 'швея', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (21, 'ПУП «Барановичский комбинат надомного труда»', 'Швейное производство, производство изделий из пластмасс', 'тел. 8 (0163) 477720 приемная, 8 (0163) 477717 факс, b_knt@mail.ru сайт bknt.ucoz.com', 'Брестская область', '225410, Брестская обл., г. Барановичи, ул. Проминского, 20.', '53.132368, 26.017609', 'Есть', '2-я группа,3-я группа', 'швея', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (22, 'ПУП «Дзержинский комбинат надомного труда»', 'Швейное производство, деревообработка', 'тел. 8(01716)55462', 'Минская область', '222720, Минская обл., г. Дзержинск, ул. 1-я Ленинская, 43', '53.687401, 27.145704', 'Есть', '2-я группа,3-я группа', 'специалист по кадрам,швея,электрик', 'Частичная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (23, 'ПУП «Спаситель»', 'Швейное производство', '8 (02342) 54137 - контактный и факс. spasitelnadja@mail.ru', 'Гомельская область', '247434, Светлогорск, ул. Свердлова, 2а', '52.627656, 29.735233', 'Есть', '1-я группа,2-я группа,3-я группа', 'швея', 'Полная', 'Офис,Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (24, 'Производственное унитарное преприятие \"Баркос\" Общественного объединения \"Белорусское Общество Инвалидов\"', 'Швейное производство, пошив спецодежды, Изготовление металлических изделий, Сварочные работы, оказывают услуги по перевозке грузов и пассажиров', 'Директор: Щербин Борис Иванович, +375 29 636-99-54 +375 44 504-05-09, director@barcos.by\"', 'Минск', '220034, г. Минск, ул. З. Бядули, 12', '53.905270, 27.583867', 'Есть', '2-я группа,3-я группа', 'кладовщик,швея', 'Полная', 'Офис', 'Нету', 'без образования', 'Есть', 'Нету'),
  (25, 'Производственное частное унитарное предприятие «Цветлит» Общественного объединения «Белорусское общество глухих»', 'Производство промышленной трубопроводной арматуры.', 'Заместитель директора по идеологической работе, кадрам и юридическим вопросам Коронкевич Оксана Сергеевна Телефон: +375 (152) 72-06-14. http://www.zwetlit-grodno.by/kontakti.htm', 'Беларусь', 'Беларусь', '53.531205, 28.030985', 'Есть', 'по слуху', 'грузчик,наладчик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (26, 'Производственное частное унитарное предприятие Общественного объединения «Белорусское общество глухих» Универсал Бобруйск', 'Официальный поставщик комплектующих для конвееров заводов «МАЗ», «КАМАЗ», «МТЗ», «Амкодор», «Бобруйскагромаш» и др. : зеркала заднего вида для автомобилей, автобусов, троллейбусов; патроны электрические; рассекатели пламени; сальники и прокладки для автомобилей; шланги тормозные для автобусов; шланги тормозные для грузовых автомобилей.', '+375 (225) 72-07-63 – приемная, E-mail: admin@belog.by http://www.belog.by/', 'Могилевская область', '213826, Республика Беларусь, Могилевская область, г. Бобруйск, ул. Чонгарская, 37', '53.131190, 29.229598', 'Есть', 'по слуху', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (27, 'Унитарное предприятие «Вертекс-Брест»', 'Производство антенн телевизионных для цифрового вещания, электроустановочных изделий, светильников энергосберегающих, электробытовых и хозяйственных товаров,товаров для сада и огорода', '+375 0162 41 56 71, +375 0162 41 56 71, vertex-brest@beltiz.by, http://vertex.brest.by/', 'Брестская область', '224023, г. Брест, ул. Московская, 249/1', '52.095934, 23.751312', 'Есть', '1-я группа,2-я группа,3-я группа', 'сборщик', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (28, 'Унитарное предприятие «Контакт-Бобруйск»', 'Производство электроустановочных изделий, гвоздей строительных, фиксаторов арматуры бетона,товаров бытового и хозяйственного назначения', 'Приемная (+375 225) 47-47-26 Отдел сбыта: (+375 225) 71 56 08, 71 56 07 Тел.факс: (+375 225) 47-45-77, 48-56-13,48 58 18  сontact-bobruisk@beltiz.by,http://www.kontaktbobruisk.by/', 'Могилевская область', '213828, г. Бобруйск, ул.К.Маркса, 337', '53.135502, 29.175331', 'Есть', '2-я группа,3-я группа', 'машинист-кочегар', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (29, 'УНПП «ТАСИС»', 'Проектирование, монтаж, наладка тех.обслуживание установок противопожарной автоматики', 'тел. 2084899 факс Tasis@tut.by', 'Минск', '220036, г.Минск, ул.К.Либкхнета, 68, ком.301, 223070, Минский район, пос. Михановичи, ОАО «МЛЦ»', '53.897032, 27.527875', 'Есть', '2-я группа,3-я группа', 'бухгалтер,инженер,инженерно-техн. работник', 'Полная', 'Офис', 'Нету', 'высшее,средне-специальное', 'Нету', 'Нету'),
  (30, 'УП «Инрем»', 'Строительство', 'тел. 2220100 факс и конт inrem@rambler.ru', 'Минск', '220007, Минск, ул. Жуковского, 10/1-168\\а', '53.879116, 27.549892', 'Есть', '2-я группа,3-я группа', 'грузчик,строитель', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (31, 'УП «СКТБ с ОП «Проминватех»', '1. Производство металлических изделий и конструкций, 2. Строительные услуги', 'тел. 80172801998, 80172802466 факс prominvatech@tut.by www.prominvatech.by', 'Минск', '220012 г. Минск, пер. Калинина, 7', '53.930459, 27.605831', 'Есть', '3-я группа', 'обработчик металла,строитель', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (32, 'Унитарное Производственное Предприятие «Диона» Общественного Объединения \"Белорусское Общество Инвалидов\"', 'Швейное, трикотажное  производство', 'тел. (801651)27346 приемная, (801651)27345, Телефон: 23-4-06 Факс: 24-5-00 diona24@mail.ru', 'Брестская область', '225903, Брестская обл., г. Малорита, ул. Маяковского, 24, ул. Ленина, 1', '51.796309, 24.068472', 'Есть', '2-я группа,3-я группа', 'швея', 'Полная,Частичная', 'Офис,Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (33, 'УПУП «Инвадар»', 'Швейное производство', 'тел. 2980612, факс. 2469202', 'Минск', '220033, г. Минск, ул. Велозаводская, 7-9', '53.884264, 27.596632', 'Есть', 'по слуху,глухонемые,колясочники,1-я группа,2-я группа,3-я группа', 'закройщик', 'Полная,Частичная', 'Офис,Удаленно', 'Нету', 'без образования', 'Нету', 'Нету'),
  (34, 'Галерея современного искусства \"Ў\"', 'Актыўная арт-пляцоўка для прэзентацыі актуальнага беларускага і еўрапейскага мастацтва', '+375 (17) 286 31 68 +375 (17) 284 53 99', 'Минск', 'Мiнск, пр-т Незалежнасцi 37а', '53.910560, 27.575490', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (35, 'Научно-производственное Унитарное Предприятие «Фобилон» ОО «БелОИ»', 'Монтаж пожарной сигнализации, монтаж систем канализации; монтаж систем отопления; услуги электропроводки; установка систем видеонаблюдения; электромонтажные работы, Эл./физ. и аэродин. испыт. разработка проектной документации инженерное оборудование, сети и эл. системы  эл./свар. работы. Перевозка', 'тел. 2285296,   тел. 8 (017) 3697294, 8 (017) 3632754, 8 (017)3697296. fobilon@yandex.ru, Сайт: http://fobilon.by', 'Минск', '220093, Минск, пр-т Пушкина, 85', '53.923063, 27.500979', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (36, 'Научно-производственное унитарное предприятие \"Клора\" ОО \"БелОИ\"', 'Электрофизические измерения, электромонтаж', 'тел. 2459772 факс 2699043    upklora@rambler.ru', 'Минск', '220037, г. Минск, пер. Уральский, 15-378', '53.901202, 27.606648', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (37, 'Научно-производственное унитарное предприятие \"Макбор\" ОО \"БелОИ\"', 'Торговля (чай, кофе) опт, переработка, расфасовка', 'тел. 2007100, факс. 2007131; тел. 2007131, 2007100, 2007376 факс, makbor@tut.by', 'Минск', '220004, ул. Немига, 40 ком,2 пом,34, Бизнес-центр \"Немига-сити\", оф. 402, 220089, ул.Декабристов, 13а; 220002 ул.Сторожевская, 8-5', '53.899509, 27.543101', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (38, 'Независимая газета \"Ганцавiцкi час\"', 'СМИ, изготовление сувенирной продукции', '+375-1646-6-04-86, ganc.chas@gmail.com', 'Брестская область', 'г. Ганцевичи, ул. Монтажников,3а', '52.751214, 26.420342', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (39, 'Унитарное промышленное предприятие «Техпром» ОО «БелОИ»', 'Швейное производство; ритуальная услуги. Пошив специальной и рабочей одежды, жилетов, рюкзаков и прочей амуниции, постельные принадлежности. Цветы, венки.', 'тел. (80223)560609, факс 526839  texprom.bel.oi@mail.ru', 'Могилевская область', '213760, Могилевская обл. г. Осиповичи, ул. Проектируемая, 2', '53.308832, 28.638210', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (40, 'ООО \"Экогрибы\"', '', '231311, 8 0154 52-33-33', 'Гродненская область', 'д Минойты, Лидский р-н', '53.798826, 25.365369', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (41, 'Проектно-строительное Унитарное Предприятие «Проектстрой» ОО «БелОИ»', 'Проектно-изыскательные работы. Деятельность в области архитектуры, инж. изысканий, тех.консультаций в этих областях', '80172686571 факс, 220125, тел. 2859446(47), proekt98@tut.by', 'Минск', '220141 Минск, пр-т Независимости,172-410 \\ ул.Стариновская,31, к.18н', '53.944680, 27.690389', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (42, 'Производственное Унитарное Предприятие \"Дейра-Сервис\"', 'Производство полиэтиленовой пленки, пластмассовых изделий для упаковывания товаров и строительства, оптовая торговля, швейное производство', 'тел. 2808406, факс. 2809471, Телефон: +375 17 201 90 46 Факс: +375 17 280 45 00, alt3@open.by, infods@tut.by, http://www.deira-servis.by/', 'Минск', '220012, г. Минск, ул. Толбухина, 5-1', '53.926260, 27.612406', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (43, 'Производственное Унитарное Предприятие \"Этос\" ОО «БелОИ»', 'Общестроительные работы, Ремонт и обслуживание холодильного оборудования.', 'тел. 2073944 факс   etos2401@gmail.com', 'Минск', '220036, г. Минск, ул. Р.Люксембург, 89, к35б', '53.892171, 27.525297', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (44, 'Производственное Частное Унитарное Предприятие «Спецсистемавтоматика»', 'Строительство, охранно-пожарная сигнализация', 'тел. 2861976, 2084890 факс, 2136094, 208-36-32, 208-46-13, 286-19-76, http://ssa-bel.com/, ssa@tut.by', 'Минск', '220030, Минск, ул. К. Либкнехта, 68-912', '53.897032, 27.527875', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (45, 'ПТУП «Падранок»', 'Оптовая торговля, швейное проізводство', 'нет данных', 'Минск', '220012, г.Минск ул. Толбухина, 5\\3', '53.926260, 27.612406', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (46, 'ПУП «Атранкс»', 'Деятельность по  обеспечению пожарной безопасности. Проектирование и строительство зданий', '8 (017) 3968806. atranks@mail.ru', 'Минск', '220039,Минск, Богдановича, 155, к. 708б', '53.937022, 27.581055', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (47, 'ПУП «Дижан-2000»', 'Полиграфические  услуги. Продукция: Бланочная продукция, проспекты, журналы, приглашения, проспекты', 'тел.городской  3344064факс, 3347231, Телефон: (017)334-72-31 Факс: (017) 334-40-64 директор    dijan2000@mail.ru, http://dizhan-2000.belorussia.su/', 'Минск', '220013, г. Минск, ул. В. Хоружей, 29-24', '53.921844, 27.562334', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (48, 'СООО \"Новые европейские окна\"', 'производство пластиковых окон из ПВХ и балконных систем из алюминиевого профиля', 'Телефон 375212341018\nФакс +375 (212) 341018\nАдрес эл. почты neovit@tut.by', 'Витебская область', '210002 г. Витебск, ул. 39-й Армии, 54', '55.173864, 30.121733', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (49, 'ЧУП \"Семейный причал\"', 'Услуги по реабилитации пожилых людей, приют (дом-интернат) для пожилых людей', '+375-8-01772-45-351(бухг.)+375-8-33-393-18-7', 'Минская область', 'РБ, Минская обл. Воложинский район, д. Войганы, ул.Садовая, д.28', '54.166938, 26.088630', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (50, 'ЧУП «Швец»', 'Швейное, вязальное производство', 'тел. 8(0232)455370 маркетолог 435350факс   shvec_beloi@tut.by', 'Гомельская область', '246012, г. Гомель, Пр-т Речицкий, 105', '52.407144, 30.921872', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (51, 'ЧУП «СтилПромСтрой»', 'Ремонтно-строительные работы', '+375 25 6237065', 'Минск', '220005, г. Минск, ул.В.Хоружей, д.3, ком.305а', '53.917103, 27.579222', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (52, 'ЧТУП \"ПроГолд\"', 'Осуществляет розничную торговлю изделиями из драгоценных металлов', '8 (044) 702-12-46\n8 (029) 359-90-14', 'Брестская область', '225644, г. Лунинец, ул. Красная, 106, пом. 47', '52.255537, 26.798470', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (53, 'ЧРСУП «РегионИст-Строй»', 'Строительство', '8-017-2861312 факс, regionminsk@mail.ru ', 'Минск', '220036, Минск, ул. Р.Люксембург,89-19', '53.892171, 27.525297', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (54, 'ЧПУП «Людмила»', 'Мебельное производство', 'тел. (801632)21285 приемная и факс', 'Брестская область', '225133, Брестская обл., г.Пружаны, ул. Советская, 47', '52.559980, 24.456346', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (55, 'ЧПТУП «Автомиг»', 'Торговля, утепление зданий', 'Телефон +375 (152) 74-96-62, (033)622-20-52, (033)144-05-20\nФакс \nАдрес эл. почты avtomig-grodno@tut.by\nВеб сайт www.ecovata.org', 'Гродненская область', '230003 г. Гродно, ул. Менделеева, 34/а', '53.685252, 23.850136', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (56, 'ЧПТП «Забота о людях»', 'Швейное производство, размол зерна, шлифовка полов', 'Тел. 8(01591)22972', 'Гродненская область', '231210, Гродненская область, г.Островец, ул.Набережная,2', '54.613562, 25.959713', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (57, 'ЧНПУП «ЭКОЛАБСЕРВИС»', 'Технические испытания и анализ', 'тел. (8017)2560831 приемная и факс  ecolabserv@tut.by', 'Брестская область', '224005, г. Брест, ул. Ленина, 16, в Минске, ул.Воронянского, 50,к.4 ', '52.095209, 23.683499', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (58, 'Частное унитарное производственное предприятие «Янг-М»', 'Ремонт стульев и другой мебели', 'Тел./факс: 8-0222-70-39-17', 'Могилевская область', '212007, г.Могилев, ул.Воровского, 39, к.3. ', '53.894915, 30.318913', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (59, 'Частное Унитарное Предприятие «Энва»', 'Производство электроустановочных изделий, выключателей кнопочных и клавишных серии ВК для бытовой техники, комплектующих к светильникам люминесцентным,тары и упаковки из гофрированного картона с нанесением флексопечати и пр.', 'Приемная\n+375 (176) 54-28-75', 'Минская область', '223310, г.Молодечно, ул. Великий Гостинец, 55', '54.309333, 26.810561', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (60, 'Частное Унитарное Предприятие «ЭлКис» ОО «БелТИЗ»', 'Производство серий электроустановочных изделий,сетевых шнуров армированных вилкой, кронштейнов сантехнических разборных для крепления трубопроводов,изделий для строительства и пр.', '+375 165 35-18-55, +375 165 35-06-64,  elkis@beltiz.by, http://www.elkiz.com', 'Брестская область', '225710, г.Пинск, Гоголя, 29', '52.121770, 26.107144', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (61, 'Частное Унитарное Предприятие «Центр Олимпийской подготовки» ОО «БелТИЗ»', 'Многопрофильный комплекс по предоставлению гостиничных и оздоровительных услуг, услуг общественного питания', '+375 17 226-84-77,cop@beltiz.by, http://www.ufontana.com/', 'Минск', '220004, г.Минск, ул. Амураторская, 4', '53.910527, 27.529698', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (62, 'Частное Унитарное Предприятие «Фильтр»', 'Ведущий производитель в Республике Беларусь опор и светильников наружного освещения), металлообработка, литье пластмасс, гальванопокрытие, изготовление оснастки и нестандартного оборудования. Продукция: элементы фильтрующие очистки топлива, масла, воздуха, зажимы шторные, зажимы, шторные, гвозди декоративные.', '+375 152 77-04-37, +375 152 41-23-86, Телефон: (+375 152) 312386 Факс: (+375 152) 313718, filtr@beltiz.by, http://filterbeltiz.grodno.by/', 'Гродненская область', '230005, г.Гродно, ул. Дзержинского, 98', '53.711464, 23.839347', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (63, 'Частное Унитарное Предприятие «Торговый дом БелТИЗ»', 'Осуществляет оптовую торговлю продукции предприятий ОО «БелТИЗ» по ценам производителей, Гостиничное, зубоврачебное, экскурсионное и туристическое обслуживание, оздоровление детей за рубежом', '+375 17 203 11 30, Телефон: +375 17 22391-21 Факс: +375 29 626 59 85, td@beltiz.by', 'Минск', '220004, г. Минск, ул. Амураторская, 7-5', '53.911131, 27.529348', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (64, 'Частное Унитарное Предприятие «Тифлос» ОО «БелТИЗ»', 'Производство электроустановочных и электромонтажных изделий, сетевых шнуров армированных вилкой, алюминевых шлангов,товаров бытового и хозяйственного назначения ', '+375 222 23-71-97,  +375 222 28-30-19, Телефон: (+375 2222) 6-12-21 Факс: (+375 2222) 6-72-74, Email: Elis@mogilev.by, tiflos@beltiz.by, http://www.tiflos.biz/, www.elis-beltiz.biz', 'Могилевская область', '212009, г. Могилев, ул. Циолковского, 11', '53.909535, 30.319461', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (65, 'Частное Унитарное Предприятие «Светотехника» ОО «БелТИЗ»', 'Ведущий производитель в Республике Беларусь сидений пластмассовых стадионных, трибун, сидений для общественного транспорта, производство светильников, садового инвентаря, санок и пр.\n', '+375 (232) 57-35-27, svetotehnika@beltiz.by, http://www.gomelsvet.by/, gomelsvet@gmail.com\n v573769@gmail.com', 'Гомельская область', '246007, г.Гомель, Советская, 202-б', '52.465296, 30.981241', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (66, 'Частное Унитарное Предприятие «Звукотэкс» ОО «БелТИЗ»', 'Услуги студии звукозаписи, установка и настройка комплекса тифлопрограмм на персональный компьютер, реализацииятехнических средств реабилитации для инвалидов, Продукция:  музыкальные записи на грампластинках, компактных дисках и лентах, грузовой транспорт.', 'тел/факс +375 17 365-52-88 Директор +375 17 365-52-05  zvukoteks@beltiz.by, http://www.zvukoteks.by/', 'Минск', '220018, г.Минск. ул. Якубовского, 52', '53.893153, 27.451159', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (67, 'Частное торговое унитарное предприятие «Метеорит Плюс»', 'Производит развивающие игрушки, спортивно-игровые мягкие модули, гимнастические маты, пуфы с гранулами, сумочки, косметички, координационные дорожки, спортивный инвентарь и оборудование для детей', '8 0232 40 86 11, 8 0296 81 07 45, \nDad-oksana@yandex.ru, www.nashidetki.by', 'Гомельская область', 'г. Гомель пр-т Октября 28 оф. 87', '52.407924, 30.959170', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (68, 'учреждение «Республиканский Дворец культуры имени Н.Ф. Шарко» (Минск)', 'нет данных', '+375 17 230-42-41, +375 17 299-59-01, +375 17 299-59-00', 'Минск', 'г. Минск, ул. Уральская, 3', '53.899541, 27.608022', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (69, 'УПУП «Тета»', 'Электрофизические измерения, диагностика и ремонт объектов, ремонт и обслуживание систем охранно-пожарной сигнализации', 'тел. 2050715, т.ф. 2072492 upteta@tut.by', 'Минск', '220092, г. Минск,ул. Д.- Марцинкевича, 4/2-1', '53.906066, 27.486777', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (70, 'УПП «Рембыттехника-Быт»', 'Оказание бытовых услуг населению, оказание услуг по сдаче в аренду помещений, строительные работы', 'тел. 8 (01742) 26588', 'Минская область', '223710, Минская область, г. Солигорск, ул. Строителей, 4', '52.796633, 27.544467', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (71, 'УП «Белинвелс»', 'Оптовая торговля, Стройматериалы (щебень)', 'тел. 80172990066 факс,80172990020,     belinvels@gmail.com', 'Минск', '220033, г. Минск, ул. Тростенецкая, 3, оф.504б', '53.883606, 27.582906\n', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету'),
  (72, 'УП «Альтаир-2»', 'Электрофизические измерения и гидропневматическая промывка и испытание систем отопления', 'тел. 8 (0212) 358836 факс, 8 (0212) 358837, pupaltair-2@mail.ru', 'Витебская область', '210015, г. Витебск, ул. Калинина, 20/13', '55.186319, 30.202267', 'Нету', '', '', 'Полная', 'Офис', 'Нету', 'без образования', 'Нету', 'Нету');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region` (`region`),
  ADD KEY `recruitment` (`recruitment`),
  ADD KEY `disability` (`disability`),
  ADD KEY `profession` (`profession`),
  ADD KEY `employment` (`employment`),
  ADD KEY `place_work` (`place_work`),
  ADD KEY `working_conditions` (`working_conditions`),
  ADD KEY `education` (`education`),
  ADD KEY `experience` (`experience`),
  ADD KEY `training` (`training`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` INT(5) NOT NULL AUTO_INCREMENT
  COMMENT 'Идентификатор записи',
  AUTO_INCREMENT = 73;
COMMIT;