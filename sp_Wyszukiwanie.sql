USE [Biblioteka]
GO
/****** Object:  StoredProcedure [dbo].[spWyszukiwanie]    Script Date: 25.05.2021 22:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Procedura umożliwiająca wyszukiwanie książek po tytule, autorze lub gatunku
*/
CREATE PROC [dbo].[spWyszukiwanie]
@Tytul nvarchar (50),
@Autor nvarchar (100),
@Gatunek nvarchar (30)

AS
BEGIN
SELECT distinct
K.Tytul, ISNULL(K.Tytul_oryginalny, '') AS [Tytul oryginalny],

/*
Scalenie pełnej nazwy autora
*/
(stuff (
	(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
	FROM Autorzy a
	left join Ksiazki_Autorzy ka
	on a.ID_Autora = ka.ID_Autora
	where k.Id_ksiazki = ka.ID_Ksiazki and (ka.ID_Rola_autora = 1 OR ka.ID_Rola_autora = 2)
	FOR XML PATH('')),1,1,'')) as [Autorzy],
/*
Scalenie pełnej nazwy tłumacza, jeśli istnieje
*/
isnull((stuff (
	(select distinct  ', ' + (concat_ws(' ', A.Przedrostek, A.Imie, A.Drugie_Imie, A.Nazwisko))
	FROM Autorzy a
	left join Ksiazki_Autorzy ka
	on a.ID_Autora = ka.ID_Autora
	where k.Id_ksiazki = ka.ID_Ksiazki and ka.ID_Rola_autora = 3
	FOR XML PATH('')),1,1,'')), '-') as [Tłumacz],
K.ISBN,
W.Wydawnictwo,
J.Jezyk as [Język],
K.Rok_Wydania as [Rok wydania],
K.Liczba_stron as [Ilość stron], 
concat(F.Wielkosc, ' ', O.Okladki) as [Format],
StK.Stan_ksiazki as [Stan],
SyK.Status_ksiazki as [Status]

from Ksiazki_Autorzy ka
left join Ksiazki k
on k.Id_ksiazki = ka.ID_Ksiazki  
left join Role_Autorow ra
on ka.ID_Rola_Autora=ra.Id_Rola_Autora

left join Wydawnictwa w
on k.ID_Wydawnictwo = w.ID_Wydawnictwo

left join Jezyki J
on k.ID_Jezyk = j.ID_Jezyk

left join Rodzaje_publikacji RP
on k.ID_Rodzaj_publikacji = rp.ID_Rodzaj_publikacji
left join Formaty F
on RP.ID_Format = F.ID_Format 
left join Okladki O
on RP.ID_Okladki = O.ID_Okladki

left join Stany_Ksiazek StK
on k.ID_Stanu_Ksiazki = Stk.ID_Stanu_ksiazki

left join Statusy_Ksiazek SyK
on k.ID_Statusu_Ksiazki = Syk.ID_Statusu_Ksiazki

left join Gatunki_Ksiazki GK
on K.ID_Ksiazki = GK.ID_Ksiazki

left join Gatunki G
on G.ID_Gatunek = GK.ID_Gatunek

left join Autorzy A
on KA.ID_Autora = A.ID_Autora

where k.Tytul like '%' + @tytul + '%' 
OR k.Tytul_oryginalny like '%' + @tytul + '%'
OR A.Przedrostek like '%' + @Autor + '%'
OR A.Imie like '%' + @Autor + '%'
OR A.Drugie_Imie like '%' + @Autor + '%'
OR A.Nazwisko  like '%' + @Autor + '%'
OR G.Gatunek like '%' + @Gatunek + '%'

END
