USE [Biblioteka]
GO

/****** Object:  View [dbo].[v_DostepnoscKsiazek]    Script Date: 25.05.2021 21:18:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* widok dostepnosci ksi��ek */

CREATE view [dbo].[vDostepnoscKsiazek]
as
select
/* uszeregowanie ksi��ki wg najnowszej daty rezerwacji*/
row_number() over(partition by k.ID_Ksiazki order by dr.Data_rezerwacji desc) as [RowNumber]
, k.ID_Ksiazki
, dr.Data_rezerwacji
, dr.Koniec_rezerwacji
, dw.Data_wypozyczenia
, dw.Data_zwrotu
, (
case
	when dr.Data_rezerwacji is not null AND dr.Koniec_rezerwacji is null
	/* Rezerwowa� ksi��ki mo�na na 3 dni robocze w��czj�c sobot�. 
	Je�eli termin rezerwacji obejmuje niedziel� dodajemy dodatkowy dzie�*/
	then 'Zarezerwowana do '
	+ cast(
		(case 
			when Datename(weekday, dr.Data_rezerwacji) in ('Thursday', 'Friday', 'Saturday')
			then DATEADD(day, 4, dr.Data_rezerwacji)

			else DATEADD(day, 3, dr.Data_rezerwacji)
		end ) AS varchar) 

	when dr.Data_rezerwacji is not null AND dr.Koniec_rezerwacji is not null AND Data_wypozyczenia is null
	then 'Dostepna'

	when dw.Data_zwrotu is null AND w.ID_Rodzaj_wykorzystania=1
	then 'Wypozyczona do ' + cast(DATEADD(day, 28, dw.Data_wypozyczenia) AS varchar)
	/* Mo�e si� zdarzy� �e data b�dzie wcze�niejsza. Oznacza to, �e ksi��ka nie zosta�a jeszcze zwr�cona - jest przetrzymana */

	when dw.Data_zwrotu is null AND w.ID_Rodzaj_wykorzystania=2
	then 'Wypozyczona na miejscu do ' + cast(cast(GETDATE() as date) as varchar)

	else 'Dostepna'
end
) as [Dostepnosc]

from Ksiazki k
left join Wypozyczenia w
on k.id_Ksiazki = w. id_ksiazki
left join Daty_rezerwacji dr
on w.ID_Data_rezerwacji = dr.ID_Data_rezerwacji
left join Daty_wypozyczen dw
on w.ID_Data_wypozyczenia = dw.ID_Data_wypozyczenia


GO


