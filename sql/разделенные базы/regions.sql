--
-- Структура таблицы `regions`
--
CREATE TABLE `regions` (
  `id`    INT(11)       NOT NULL,
  `title` VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='Регионы страны';

--
-- Дамп данных таблицы `regions`
--
INSERT INTO `regions` (`id`, `title`) VALUES
  (1, 'Минск'),
  (2, 'Минская область'),
  (3, 'Брестская область'),
  (4, 'Гродненская область'),
  (7, 'Витебская область'),
  (8, 'Могилевская область'),
  (9, 'Гомельская область'),
  (10, 'Не указан');

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- AUTO_INCREMENT для таблицы `regions`
--
ALTER TABLE `regions`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT;
COMMIT;
