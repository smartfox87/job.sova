--
-- Структура таблицы `professions`
--

CREATE TABLE `professions` (
  `id`    INT(11)       NOT NULL,
  `title` VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT ='Профессии';

--
-- Дамп данных таблицы `professions`
--
INSERT INTO `professions` (`id`, `title`) VALUES
  (1, 'смм специалист'),
  (2, 'журналист'),
  (3, 'сборщик обуви'),
  (4, 'швея'),
  (5, 'наладчик'),
  (6, 'шлифовщик'),
  (7, 'вязальщик схемных узлов'),
  (8, 'автоматчик на станках'),
  (9, 'штамповщик'),
  (10, 'токарь'),
  (11, 'слесарь измерительных приборов и автоматики');

--
-- Индексы таблицы `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- AUTO_INCREMENT для таблицы `professions`
--
ALTER TABLE `professions`
  MODIFY `id` INT(11) NOT NULL AUTO_INCREMENT;
COMMIT;
