CREATE TABLE `companies` (
  `id`                 INT(11)             NOT NULL,
  `title`              VARCHAR(255)       NOT NULL
  COMMENT 'Название предприятия',
  `activities`         VARCHAR(255)       NOT NULL
  COMMENT 'Вид деятельности предприятия',
  `contacts`           VARCHAR(255)       NOT NULL
  COMMENT 'Контактная информация',
  `region_id`          INT(11)             NOT NULL
  COMMENT 'Связь с таблицей региона',
  `coordinates`        VARCHAR(255)                                                                                      DEFAULT NULL
  COMMENT 'Координаты на карте',
  `recruitment`        ENUM ('Да', 'Нет') NOT NULL
  COMMENT 'Наличие вакансий',
  `disability`         SET ('слепые', 'глухие', 'немые', 'колясочники', 'с психическими растройствами', 'с 3-й группой') DEFAULT NULL
  COMMENT 'Вид инвалидности',
  `profession_id`      INT(11)             NOT NULL
  COMMENT 'Связь с таблицей профессий',
  `employment`         SET ('полная', 'частичная')                                                                       DEFAULT NULL
  COMMENT 'Занятость',
  `place_work`         SET ('офис', 'удаленно')                                                                          DEFAULT NULL
  COMMENT 'Место работы',
  `working_conditions` ENUM ('обустроено', 'не обустроено')                                                              DEFAULT 'не обустроено'
  COMMENT 'Место работы (безбарьерная среда)',
  `education`          ENUM ('высшее', 'средне-специальное', 'без образования')                                          DEFAULT 'без образования'
  COMMENT 'Образование',
  `experience`         ENUM ('есть', 'нету')                                                                             DEFAULT 'нету'
  COMMENT 'Опыт работы',
  `training`           ENUM ('есть', 'нету')                                                                             DEFAULT 'нету'
  COMMENT 'Обучение'
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='Предприятия предоставляющие вакансии';

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `profession_id` (`profession_id`);

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT
  COMMENT 'Идентификатор записи';
COMMIT;

--
-- Ограничения внешнего ключа таблицы `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`);
COMMIT;

--
-- Дамп данных таблицы `companies`
--
INSERT INTO `companies` (`id`, `title`, `activities`, `contacts`, `region_id`, `coordinates`, `recruitment`, `disability`, `employment`, `place_work`, `working_conditions`, `education`, `experience`, `training`)
VALUES
  (1, 'Агенство социальных новостей (SocNews.by)', 'Новостное агенство', '+37529 37 37 645 +37529 76 23 041', 10, NULL,
      'Да', 'слепые,глухие,немые,колясочники,с психическими растройствами', 'полная,частичная', 'удаленно',
      'обустроено', 'без образования', 'нету', 'нету'),
  (2, 'Барановичское ЧУП «Блик» ОО «БелОГ»', 'Производство и продажа мужской обуви и швейных изделий',
      '225406, Брестская область, г.Барановичи, ул.Пионерская, д.53 (8-0163) факс 41-67-42, 41-65-89, е-mail: blik@tut.by\" blik.brest.by@mail.ru, http://www.blik.brest.by',
      3, NULL, 'Да', 'глухие', 'полная', 'офис', '', '', '', 'есть'),
  (3, 'Брестское Унитарное предприятие «Промбрис» ОО «БелОГ».',
      'Производство: белье постельное; блузы женские; дроссели; одежда специальная; перемычки к электроплитам; сорочки; сорочки форменные; трусы; халаты женские; халаты медицинские; шнуры к бытовой технике; электророзжиг к газовым плитам',
      '224030, г. Брест, ул. Куйбышева, 55 Телефон: (0162)21-13-43-рук., 21-75-18-гл.бухгал., 21-72-86-план. отд., зам.дир.по эконом. Факс:  21-72-23-прием., E-mail: prombris@brest.by, http://prombris.belorussia.su/',
      3, NULL, 'Нет', 'глухие', '', '', 'не обустроено', 'без образования', 'нету', 'нету'),
  (4, 'Галерея современного искусства \"Ў\"',
      'Актыўная арт-пляцоўка для прэзентацыі актуальнага беларускага і еўрапейскага мастацтва',
      'Мiнск, пр-т Незалежнасцi 37а, +375 (17) 286 31 68 +375 (17) 284 53 99', 1, NULL, 'Нет', '', '', '',
      'не обустроено', 'без образования', 'нету', 'нету'),
  (5, 'Гомельское Производственное Частное Унитарное Предприятие «Випра» ОО «БелОГ»',
      'Производство: арматура водозапорная; белье постельное; блузы; вентили к газовым баллонам; краны для газовых и водяных систем; краны пробковые; краны топливные; литье цветных металлов; одежда детская; платья; регуляторы давления газа; сорочки; трусы; халат',
      '246007, г. Гомель, пр-д Троллейбусный, 4 Телефон: (0232)57-54-61-прием., 57-35-92-зам.дир., Факс: (0232)57-62-10-маркет.отд., http://vipra.by/, E-mail: vipra@tut.by',
      9, NULL, 'Да', 'с 3-й группой', 'полная', 'офис', 'не обустроено', 'без образования', 'нету', 'нету'),
  (6, 'Минское Частное Унитарное Предприятие «Виток» ОО «БелОГ»',
      'Производство: жгуты для автотранспорта, электропроводки; изделия металлические; панели для холодильников; пружины Работы/услуги: металлообработка; монтаж электропроводки.',
      '220073, г. Минск, ул. Гусовского, 20 Телефон: (017)204-33-53-прием., E-mail: info@vitok.by, www.vitok.by', 1,
      NULL, 'Да', 'глухие,с 3-й группой', 'полная', 'офис', 'не обустроено', 'без образования', 'нету', 'нету'),
  (7, 'Могилевское производственное частное унитарное предприятие “МЕТИЗ” ОО «БелОГ»',
      'Изготовление деталей методом холодной штамповки, механо - обработка. Производство метизов и других деталей из проволоки, гибки и накатки резьбы.Нанесение цинковых и фосфатных покрытий. Полимерно-порошковое покрытие деталей в любой цвет.Литьё деталей из цв',
      '212022, г. Могилев, ул. Космонавтов, 27 Директор приемная: +375 (222) 28-34-39тел./факс.: +375 (222) 23-59-95 Главный инженер приемная: +375 (222) 28-34-39тел.: +375 (222) 23-75-09 Отдел сбыта e-mail: metizu@mail.ruтел.: +375 (222) 28-36-08тел./факс.: +37',
      8, NULL, 'Да', 'глухие', 'полная', 'офис', 'не обустроено', 'без образования', 'нету', 'нету');
