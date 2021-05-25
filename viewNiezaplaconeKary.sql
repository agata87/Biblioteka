USE [Biblioteka]
GO

/****** Object:  View [dbo].[vNiezaplaconeKary]    Script Date: 25.05.2021 21:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
Widok dla pracownika: Wszystkie niezaplacone kary wraz z kontaktami do uzytkownikow
*/

ALTER VIEW [dbo].[vNiezaplaconeKary]
AS

SELECT 

w.ID_Wypozyczenia

, (concat_ws(' ', u.Imie, u.Nazwisko)) as [Wypo¿yczaj¹cy]

/*
telefon kotaktowy
*/
, (case
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

/* informacje o ksiazce: Tytul + autorzy */
, concat('"', k.tytul, '" - ',
(stuff (
	(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
	FROM Autorzy a
	left join Ksiazki_Autorzy ka
	on a.ID_Autora = ka.ID_Autora
	where k.Id_ksiazki = ka.ID_Ksiazki and (ka.ID_Rola_autora = 1 OR ka.ID_Rola_autora = 2)
	FOR XML PATH('')),1,1,'')) )
	as [Ksi¹¿ka]

/** bezp³atny termin wypo¿yczenia = 28 dni **/
, (DATEADD (day, 28, dw.Data_wypozyczenia)) as [Planowana data zwrotu]

/** pe³ne tygodnie po terminie zwrotu**/
, (datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7 as [Iloœæ tygodni po terminie]

/** op³ata wynosi 1,50 z³ za ka¿dy pe³ny tydzieñ pomniejszona o czêœciowe wp³aty **/
, cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5 - isnull(p.Kwota_wplaty, 0))) as smallmoney)
as [Do zap³aty]

FROM
Wypozyczenia w
left join Uzytkownicy u
on w.Wypo¿yczaj¹cy = u.Login
left join Ksiazki k
on w.ID_Ksiazki = k.ID_Ksiazki
left join Daty_wypozyczen dw
on w.ID_Data_wypozyczenia = dw.ID_Data_wypozyczenia
left join Kary
on w.ID_Wypozyczenia= Kary.ID_Wypozyczenia
left join Statusy_kar st
on Kary.ID_Status_kary = st.ID_Status_kary
left join Platnosci p
on Kary.ID_Platnosci= p.ID_Platnosci
left join Telefony t
on u.ID_Tel = t.ID_tel


WHERE ((cast((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate())) as int)) >0)
and (st.ID_Status_kary = 1 or st.ID_Status_kary = 2 or st.Status_kary is null)
GO


