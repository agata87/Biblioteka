USE [Biblioteka]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Wypozyczone_Ksiazki]    Script Date: 25.05.2021 22:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** Funkcja wyświetlająca wypożyczone książki dla wybranego uzytkownika **/

ALTER FUNCTION [dbo].[fn_Wypozyczone_Ksiazki]
(@Login int)
RETURNS TABLE
AS
RETURN(
select 

/* wypisanie informacji o książce: */
/*
Numeracja wypożyczonych książek wg. Daty wypożyczenia
*/

ROW_NUMBER() OVER( ORDER BY dw.Data_wypozyczenia, k.tytul) as [Lp],

/*
Autorzy/współałtorzy, jeśli istnieje to rowniez tłumacz z dopiskiem "tłumaczenie" przed nazwiskiem:
*/
concat(
case
	when
		(select A.Imie
		FROM Autorzy a
		left join Ksiazki_Autorzy ka
		on a.ID_Autora = ka.ID_Autora
		where k.Id_ksiazki = ka.ID_Ksiazki and ka.ID_Rola_autora = 3
		)
		is null
	then 
	concat('"', k.tytul, '" - ',
		(stuff (
			(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
			FROM Autorzy a
			left join Ksiazki_Autorzy ka
			on a.ID_Autora = ka.ID_Autora
			where k.Id_ksiazki = ka.ID_Ksiazki and (ka.ID_Rola_autora = 1 OR ka.ID_Rola_autora = 2)
			FOR XML PATH('')),1,1,''))
			)
	else
	concat('"', k.tytul, '" - ',
		(stuff (
			(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
			FROM Autorzy a
			left join Ksiazki_Autorzy ka
			on a.ID_Autora = ka.ID_Autora
			where k.Id_ksiazki = ka.ID_Ksiazki and (ka.ID_Rola_autora = 1 OR ka.ID_Rola_autora = 2)
			FOR XML PATH('')),1,1,'')),
			', tłumaczenie: ', 
			(stuff (
			(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
			FROM Autorzy a
			left join Ksiazki_Autorzy ka
			on a.ID_Autora = ka.ID_Autora
			where k.Id_ksiazki = ka.ID_Ksiazki and ka.ID_Rola_autora = 3
			FOR XML PATH('')),1,1,''))
			)
END, ' - ',
/*
jeśli istnieje to numer wydania z dopiskiem "Wyd. ", jeśli nie tylko nazwę wydawnictwa
*/
CASE
	WHEN K.Nr_wydania IS NULL
	THEN w.Wydawnictwo
	ELSE CONCAT('Wyd. ', k.Nr_wydania, ', ', w.wydawnictwo)
END, ', ',
k.Rok_wydania
)
	as [Książka],

dw.Data_wypozyczenia as [Data wypożyczenia],

/*
Data do kiedy książka może być wypożyczona - bezpłatny okres dla użytkownika to 28 dni. Po tym czasie rozpoczyna się naliczanie kary
*/
(DATEADD (day, 28, dw.Data_wypozyczenia)) as [Data zwrotu],

/*
Wysokość naliczonej kary: za każde pełne 7 dni 1,50zł kary
*/
CASE
	WHEN (((cast((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate())) as int))/7) < 1)
	THEN 'Brak'
	ELSE (concat(cast(((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5) as smallmoney), ' zł'))
END
as [Kara]

from 
Ksiazki k
left join Ksiazki_Autorzy ka
on k.ID_Ksiazki = ka.ID_Ksiazki
left join Wydawnictwa w
on k.ID_Wydawnictwo = w.ID_Wydawnictwo
left join Wypozyczenia wyp
on k.ID_Ksiazki = wyp.ID_Ksiazki
left join Daty_wypozyczen dw
on wyp.ID_Data_wypozyczenia = dw.ID_Data_wypozyczenia

WHERE wyp.Wypożyczający = @Login

group by dw.Data_wypozyczenia, k.Tytul, k.ID_Ksiazki, k.Nr_wydania, w.Wydawnictwo, k.Rok_wydania
)




