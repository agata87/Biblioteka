USE [Biblioteka]
GO

/****** Object:  View [dbo].[v_KsiazkiInfo]    Script Date: 25.05.2021 21:21:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
Widok ksi¹¿ek - wszystkie dane
*/
create view [dbo].[vKsiazkiInfo]
as
SELECT 
k.ID_Ksiazki
, k.Tytul
, isnull(k.Tytul_oryginalny, '') AS [Tytul oryginalny]
/* zapisanie wszystkich autorow razem */
, stuff(
	(SELECT ', ' + concat_ws(' ', a.Przedrostek, a.Imie, a.Drugie_Imie, a.Nazwisko) 
	FROM Autorzy a
	JOIN Ksiazki_Autorzy ka
	ON ka.ID_Autora = a.ID_Autora
	WHERE k.ID_Ksiazki = ka.ID_Ksiazki AND ka.ID_Rola_autora IN (1,2)
	FOR XML PATH('')),1,2,'')
	AS Autorzy
/* zapisanie wszystkich tlumaczy razem */
, isnull(stuff(
	(SELECT ', ' + concat_ws(' ', a.Przedrostek, a.Imie, a.Drugie_Imie, a.Nazwisko) 
	FROM Autorzy a
	JOIN Ksiazki_Autorzy ka
	ON ka.ID_Autora = a.ID_Autora
	WHERE k.ID_Ksiazki = ka.ID_Ksiazki AND ka.ID_Rola_autora = 3
	FOR XML PATH('')),1,2,''), '')
	AS Tlumaczenie
, isnull(k.ISBN, '') AS ISBN
, k.Rok_wydania AS [Rok wydania]
, isnull(w.Wydawnictwo, '') AS Wydawnictwo
, k.Liczba_stron AS [Liczba stron]
/* informacje o rodzaju publikacji i formacie*/
, (select concat('', rp.Rodzaj, ', Oprawa ', o.Okladki, ' ', f.Wielkosc)
	from Rodzaje_publikacji rp
	left join Okladki o
	on rp.ID_Okladki = o.ID_Okladki
	left join Formaty f
	on rp.ID_Format = f.ID_Format
	where k.ID_Rodzaj_publikacji = rp.ID_Rodzaj_publikacji
	FOR XML PATH(''))
	AS [Rodzaj publikacji]
, stan.Stan_ksiazki AS [Stan]
/* miejsce ksiazki w bibliotece */
, (select concat(Pietra.Pietro, ' pietro, pokoj ', Pokoje.Pokoj, 'rzad ', Rzedy_regalow.Rzad, Regaly.Regal)
	from Miejsca_Ksiazek
	join Pietra
	on Miejsca_Ksiazek.ID_Pietra = Pietra.ID_Pietra
	join Pokoje
	on Miejsca_Ksiazek.ID_Pokoju = Pokoje.ID_Pokoju
	join Rzedy_regalow
	on Miejsca_Ksiazek.ID_Rzedu = Rzedy_regalow.ID_Rzedu
	join Regaly
	on Miejsca_Ksiazek.ID_Regalu = Regaly.ID_Regalu
	where k.ID_Miejsce_Ksiazki = Miejsca_Ksiazek.ID_Miejsce_Ksiazki)
	AS [Miejsce]	
, status.Status_Ksiazki AS [Status ksiazki]
, dk.Dostepnosc AS [Dostepnosc]
FROM Ksiazki k 
LEFT JOIN Wydawnictwa w
ON k.ID_Ksiazki = w.ID_Wydawnictwo
LEFT JOIN Stany_Ksiazek stan
ON k.ID_Stanu_Ksiazki = stan.ID_Stanu_ksiazki
Left join Statusy_Ksiazek status
on k.ID_Statusu_Ksiazki = status.ID_Statusu_Ksiazki
left join vDostepnoscKsiazek dk
on k.ID_Ksiazki = dk.ID_Ksiazki
where dk.RowNumber = 1 /* ksi¹¿ka z najnowsz¹ datê rezerwacji */
GO


