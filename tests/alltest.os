#Использовать ".."
#Использовать asserts

&Тест
Процедура Тест_Токенайзер1() Экспорт

	// Дано
	Спека = Новый Массив();
	Спека.Добавить(Новый СпецификацияТокенСтрока());
	Спека.Добавить(Новый СпецификацияТокенЧисло());
	Спека.Добавить(Новый СпецификацияТокенПробелы(Ложь));

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Токенайзер.Инит("123 5 ""890""");

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(3);
	Ожидаем.Что(Результат[0].Значение()).Равно("123");
	Ожидаем.Что(Результат[1].Значение()).Равно("5");
	Ожидаем.Что(Результат[2].Значение()).Равно("""890""");
	Ожидаем.Что(Результат[0].ТипТокена()).Равно(ТипыТокенов.Число);
	Ожидаем.Что(Результат[1].ТипТокена()).Равно(ТипыТокенов.Число);
	Ожидаем.Что(Результат[2].ТипТокена()).Равно(ТипыТокенов.Строка);
	Ожидаем.Что(Результат[0].Начало()).Равно(1);
	Ожидаем.Что(Результат[1].Начало()).Равно(5);
	Ожидаем.Что(Результат[2].Начало()).Равно(7);
	Ожидаем.Что(Результат[0].Размер()).Равно(3);
	Ожидаем.Что(Результат[1].Размер()).Равно(1);
	Ожидаем.Что(Результат[2].Размер()).Равно(5);

КонецПроцедуры

&Тест
Процедура Тест_Токенайзер2() Экспорт

	// Дано
	Спека = Новый Массив();
	Спека.Добавить(Новый СпецификацияТокенСтрока());
	Спека.Добавить(Новый СпецификацияТокенЧисло());
	Спека.Добавить(Новый СпецификацияТокенПробелы(Истина));

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Токенайзер.Инит("""123"" 5 ""890""");

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(5);
	Ожидаем.Что(Результат[0].Значение()).Равно("""123""");
	Ожидаем.Что(Результат[2].Значение()).Равно("5");
	Ожидаем.Что(Результат[4].Значение()).Равно("""890""");
	Ожидаем.Что(Результат[0].ТипТокена()).Равно(ТипыТокенов.Строка);
	Ожидаем.Что(Результат[2].ТипТокена()).Равно(ТипыТокенов.Число);
	Ожидаем.Что(Результат[4].ТипТокена()).Равно(ТипыТокенов.Строка);
	Ожидаем.Что(Результат[0].Начало()).Равно(1);
	Ожидаем.Что(Результат[2].Начало()).Равно(7);
	Ожидаем.Что(Результат[4].Начало()).Равно(9);
	Ожидаем.Что(Результат[0].Размер()).Равно(5);
	Ожидаем.Что(Результат[2].Размер()).Равно(1);
	Ожидаем.Что(Результат[4].Размер()).Равно(5);

	Ожидаем.Что(Результат[1].Значение()).Равно(" ");
	Ожидаем.Что(Результат[1].Начало()).Равно(6);
	Ожидаем.Что(Результат[1].Размер()).Равно(1);
	Ожидаем.Что(Результат[1].ТипТокена()).Равно(ТипыТокенов.Пробел);

	Ожидаем.Что(Результат[3].Значение()).Равно(" ");
	Ожидаем.Что(Результат[3].Начало()).Равно(8);
	Ожидаем.Что(Результат[3].Размер()).Равно(1);
	Ожидаем.Что(Результат[3].ТипТокена()).Равно(ТипыТокенов.Пробел);

КонецПроцедуры

&Тест
Процедура Тест_Токенайзер3() Экспорт
	// Дано
	Спека = Новый Массив();

	Спека.Добавить(Новый СпецификацияТокенСтрока());
	Спека.Добавить(Новый СпецификацияТокенЧисло());
	Спека.Добавить(Новый СпецификацияТокенПробелы(Ложь));
	Спека.Добавить(Новый СпецификацияТокенСимвол("<", "OPENTAG"));
	Спека.Добавить(Новый СпецификацияТокенСимвол(">", "CLOSETAG"));
	Спека.Добавить(Новый СпецификацияТокенСимвол("=", "ЕQUAL"));
	Спека.Добавить(Новый СпецификацияТокенИдентификатор());

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Токенайзер.Инит("<tag name=""1 2 3"">");

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(6);
	Ожидаем.Что(Результат[0].Значение()).Равно("<");
	Ожидаем.Что(Результат[1].Значение()).Равно("tag");
	Ожидаем.Что(Результат[2].Значение()).Равно("name");
	Ожидаем.Что(Результат[3].Значение()).Равно("=");
	Ожидаем.Что(Результат[4].Значение()).Равно("""1 2 3""");
	Ожидаем.Что(Результат[5].Значение()).Равно(">");

	Ожидаем.Что(Результат[0].ТипТокена()).Равно("OPENTAG");
	
КонецПроцедуры

&Тест
Процедура Тест_Токенайзер_регулярка() Экспорт
	// Дано
	Спека = Новый Массив();

	Спека.Добавить(Новый СпецификацияТокенРегулярноеВыражение(Новый РегулярноеВыражение("\d+"), "РегекспЧисло"));
	Спека.Добавить(Новый СпецификацияТокенРегулярноеВыражение(Новый РегулярноеВыражение("[а-я]+"), "РегекспСтрока"));
	Спека.Добавить(Новый СпецификацияТокенСимвол(",", "Запятая"));

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Токенайзер.Инит("фб12,34а");

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(5);
	Ожидаем.Что(Результат[0].Значение()).Равно("фб");
	Ожидаем.Что(Результат[1].Значение()).Равно("12");
	Ожидаем.Что(Результат[2].Значение()).Равно(",");
	Ожидаем.Что(Результат[3].Значение()).Равно("34");
	Ожидаем.Что(Результат[4].Значение()).Равно("а");

	Ожидаем.Что(Результат[1].ТипТокена()).Равно("РегекспЧисло");
	Ожидаем.Что(Результат[3].ТипТокена()).Равно("РегекспЧисло");
	
КонецПроцедуры

&Тест
Процедура Тест_Токенайзер_СтрокиСЭкранинованиемКовычкой() Экспорт
	// Дано
	Спека = Новый Массив();

	Спека.Добавить(Новый СпецификацияТокенСтрока());
	Спека.Добавить(Новый СпецификацияТокенСимвол(",", "Запятая"));

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Строка = """1 - """"один"""""",""2 - """"два"""" """;
	Токенайзер.Инит(Строка);

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(3);
	Ожидаем.Что(Результат[0].Значение()).Равно("""1 - """"один""""""");
	Ожидаем.Что(Результат[2].Значение()).Равно("""2 - """"два"""" """);

	
КонецПроцедуры

&Тест
Процедура Тест_Токенайзер_СтрокиСЭкранинованиемСлешом() Экспорт
	// Дано
	Спека = Новый Массив();

	Спека.Добавить(Новый СпецификацияТокенСтрока("\"));
	Спека.Добавить(Новый СпецификацияТокенСимвол(",", "Запятая"));

	Токенайзер = Новый Токенайзер(Спека);

	// Когда
	Строка = """1 - \""один\"""",""2 - \""два\"" """;
	Токенайзер.Инит(Строка);

	// Тогда

	Результат = Новый Массив();

	Пока Токенайзер.ЕстьЕщеТокены() Цикл
		Результат.Добавить(Токенайзер.СледующийТокен());
	КонецЦикла;

	Ожидаем.Что(Результат.Количество()).Равно(3);
	Ожидаем.Что(Результат[0].Значение()).Равно("""1 - \""один\""""");
	Ожидаем.Что(Результат[2].Значение()).Равно("""2 - \""два\"" """);

	
КонецПроцедуры