USE [Biblioteka]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/**
Dane u¿ytkowników
**/
CREATE view [dbo].[vUzytkownicyInfo]
as
SELECT
u.Login
, u.Imie
, u.Nazwisko
, isnull(t.Kierunkowy_stacjonarny, '') as [Kier]
, isnull(t.Stacjonarny, '') as [Tel_stacjonarny]
, isnull(t.Kierunkowy_kom, '') as [Kier_k]
, isnull(t.Komorkowy , '') as [Tel_komorkowy]
, u.email
, a.Ulica
, a.Nr_domu
, isnull(a.Nr_mieszkania, '') as Nr_mieszkania
, m.Kod_pocztowy
, m.Miasto
, tu.Typ_uzytkownika

From Uzytkownicy u
left join Telefony t
on u.ID_Tel = t.ID_Tel
left join Adresy a
on u.ID_Adres = a.ID_Adres
left join Miasta m
on a.ID_Miasta = m.ID_Miasta
left join Typy_uzytkownikow tu
on u.ID_Typ_uzytkownika = tu.ID_Typ_uzytkownika
GO


