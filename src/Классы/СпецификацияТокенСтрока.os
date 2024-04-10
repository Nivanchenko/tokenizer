
Процедура ПриСозданииОбъекта()

КонецПроцедуры

Функция Проверить(Знач Строка) Экспорт
	Курсор = 1;
	Если УтилитыПарсера.СимволСтроки(Строка, 1) = """" Тогда
		МассивСимволов = Новый Массив;
		Курсор = Курсор + 1; // Пропускаем "
		Пока УтилитыПарсера.СимволСтроки(Строка, Курсор) <> """" 
				и Курсор <= СтрДлина(Строка) Цикл
			МассивСимволов.Добавить(УтилитыПарсера.СимволСтроки(Строка, Курсор));
			Курсор = Курсор + 1;
		КонецЦикла;

		Возврат Новый Структура("Значение, Конец", СтрСоединить(МассивСимволов), Курсор);
		
	КонецЕсли;

	Возврат Неопределено;

КонецФункции

Функция ТипТокена() Экспорт
	Возврат ТипыТокенов.Строка;
КонецФункции