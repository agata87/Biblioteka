USE [Biblioteka]
GO

/****** Object:  View [dbo].[vKsiazkiPoTerminie]    Script Date: 25.05.2021 21:36:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/**
Widok przetrzymanych ksi¹¿ek
**/
CREATE view [dbo].[vKsiazkiPoTerminie]
as
select
w.ID_Wypozyczenia

/* Tytul + autorzy */
, concat('"', k.tytul, '" - ',
(stuff (
	(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
	FROM Autorzy a
	left join Ksiazki_Autorzy ka
	on a.ID_Autora = ka.ID_Autora
	where k.Id_ksiazki = ka.ID_Ksiazki and (ka.ID_Rola_autora = 1 OR ka.ID_Rola_autora = 2)
	FOR XML PATH('')),1,1,'')) )
	as [Ksiazka]

, (concat_ws(' ', u.Imie, u.Nazwisko)) as [Wypozyczajacy],
/*
telefon kotaktowy
*/
(case
	when t.Kierunkowy_Stacjonarny IS NULL AND t.Stacjonarny IS NULL 
	then concat_ws('-', t.Kierunkowy_kom, t.Komorkowy)
	
	when t.Kierunkowy_kom IS NULL AND t.Komorkowy is null
	then concat_ws('-', t.Kierunkowy_Stacjonarny, t.Stacjonarny)

	when t.Stacjonarny IS NULL and t.Komorkowy is null
	then 'Brak telefonu'

	else concat ((isnull((concat_ws('-', t.Kierunkowy_Stacjonarny, t.Stacjonarny)), null)), ', ',
		(isnull((concat_ws('-', t.Kierunkowy_kom, t.Komorkowy)) , null)) )
end) as [Telefony_kontaktowe]

, u.email

, dw.Data_wypozyczenia

/** bezp³atnie ksi¹¿ki mo¿na wypo¿yczaæ na okres 28 dni **/
, (DATEADD (day, 28, dw.Data_wypozyczenia)) as [Planowana_data_zwrotu]

/** pe³ne tygodnie po terminie zwrotu**/
, case 
	/* je¿eli kara jest op³acona tygodnie zliczane s¹ do daty wp³aty */
	when Kary.ID_Status_Kary = 3
	then (datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), p.Data_wplaty ))/7
	
	else
	(datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7 

end
as [Ilosc_tygodni_po_terminie]

/** wysokoœæ kary **/
/** op³ata wynosi 1,50 z³ za ka¿dy pe³ny tydzieñ */ 
, case
	/* jezeli kara jest oplacona wysokoœæ kary naliczana jest do daty wplaty */
	when Kary.ID_Status_Kary = 3
	then cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), p.Data_wplaty ))/7*1.5)) as smallmoney)

	else cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5)) as smallmoney)
END
as [Kara]

/* Kara pomniejszona o wp³aty **/
, CASE
	/* jezeli kara jest oplacona */
	when Kary.ID_Status_Kary = 3
	then 0
	/* jezeli kara jest oplacona czesciowo */
	else cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5 - isnull(p.Kwota_wplaty, 0))) as smallmoney)
END
as [Do_zaplaty]

, st.status_kary as [Status_kary]

FROM
Wypozyczenia w
left join Ksiazki k
on w.ID_Ksiazki = k.ID_Ksiazki
left join Uzytkownicy u
on w.Wypo¿yczaj¹cy = u.Login
left join Telefony t
on u.ID_Tel = t.ID_tel
left join Daty_wypozyczen dw
on w.ID_Data_wypozyczenia = dw.ID_Data_wypozyczenia
left join Kary
on Kary.ID_Wypozyczenia = w.ID_Wypozyczenia
left join Statusy_kar st
on Kary.ID_Status_kary = st.ID_Status_kary
left join Platnosci p
on Kary.ID_Platnosci= p.ID_Platnosci

WHERE ((cast((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate())) as int)) >0)
GO


