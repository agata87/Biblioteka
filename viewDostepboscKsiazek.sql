USE [Biblioteka]
GO

/****** Object:  View [dbo].[v_DostepnoscKsiazek]    Script Date: 25.05.2021 21:18:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* widok dostepnosci ksi¹¿ek */

CREATE view [dbo].[vDostepnoscKsiazek]
as
select
/* uszeregowanie ksi¹¿ki wg najnowszej daty rezerwacji*/
row_number() over(partition by k.ID_Ksiazki order by dr.Data_rezerwacji desc) as [RowNumber]
, k.ID_Ksiazki
, dr.Data_rezerwacji
, dr.Koniec_rezerwacji
, dw.Data_wypozyczenia
, dw.Data_zwrotu
, (
case
	when dr.Data_rezerwacji is not null AND dr.Koniec_rezerwacji is null
	/* Rezerwowaæ ksi¹¿ki mo¿na na 3 dni robocze w³¹czj¹c sobotê. 
	Je¿eli termin rezerwacji obejmuje niedzielê dodajemy dodatkowy dzieñ*/
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
	/* Mo¿e siê zdarzyæ ¿e data bêdzie wczeœniejsza. Oznacza to, ¿e ksi¹¿ka nie zosta³a jeszcze zwrócona - jest przetrzymana */

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


