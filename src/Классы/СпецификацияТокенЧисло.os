
Процедура ПриСозданииОбъекта()

КонецПроцедуры

Функция Проверить(Знач Строка) Экспорт

	Если ЭтоЧисло(УтилитыПарсера.СимволСтроки(Строка, 1)) Тогда
		Курсор = 1;
		Числа = "";

		Пока ЭтоЧисло(УтилитыПарсера.СимволСтроки(Строка, Курсор)) Цикл
			Числа = Числа + УтилитыПарсера.СимволСтроки(Строка, Курсор);
			Курсор = Курсор + 1;
		КонецЦикла;

		Возврат Новый Структура("Значение, Конец",  Числа, Курсор);

	КонецЕсли;

	Возврат Неопределено;

КонецФункции

Функция ТипТокена() Экспорт
	Возврат ТипыТокенов.Число;
КонецФункции

Функция ЭтоЧисло(Символ)
	Возврат СтрНайти("0123456789", Символ) > 0;
КонецФункции