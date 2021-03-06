USE [master]
GO
/****** Object:  Database [Biblioteka]    Script Date: 25.05.2021 22:21:01 ******/
CREATE DATABASE [Biblioteka]

GO
ALTER DATABASE [Biblioteka] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteka] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteka] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteka] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Biblioteka', N'ON'
GO
ALTER DATABASE [Biblioteka] SET QUERY_STORE = OFF
GO
USE [Biblioteka]
GO
/****** Object:  Table [dbo].[Kary]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kary](
	[ID_Kary] [int] IDENTITY(1,1) NOT NULL,
	[ID_Wypozyczenia] [int] NOT NULL,
	[ID_Status_kary] [int] NOT NULL,
	[ID_Platnosci] [int] NULL,
 CONSTRAINT [PK__Kary__B5771185F5A04A7A] PRIMARY KEY CLUSTERED 
(
	[ID_Kary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platnosci]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platnosci](
	[ID_Platnosci] [int] IDENTITY(1,1) NOT NULL,
	[Data_wplaty] [date] NOT NULL,
	[Kwota_wplaty] [smallmoney] NOT NULL,
	[Pracownik] [int] NOT NULL,
 CONSTRAINT [PK__Platnosc__1984222D23872B9E] PRIMARY KEY CLUSTERED 
(
	[ID_Platnosci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ksiazki](
	[ID_Ksiazki] [int] IDENTITY(1,1) NOT NULL,
	[Tytul] [nvarchar](50) NOT NULL,
	[Tytul_oryginalny] [nvarchar](50) NULL,
	[ISBN] [bigint] NULL,
	[Rok_wydania] [int] NOT NULL,
	[ID_Wydawnictwo] [int] NOT NULL,
	[ID_Kraju] [int] NOT NULL,
	[ID_Jezyk] [int] NOT NULL,
	[Nr_wydania] [int] NULL,
	[Liczba_stron] [int] NULL,
	[ID_Rodzaj_publikacji] [int] NOT NULL,
	[ID_Miejsce_Ksiazki] [int] NOT NULL,
	[ID_Statusu_Ksiazki] [int] NOT NULL,
	[ID_Stanu_Ksiazki] [int] NOT NULL,
 CONSTRAINT [PK__Ksiazki__EBC0CB2358A581CD] PRIMARY KEY CLUSTERED 
(
	[ID_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Daty_wypozyczen]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daty_wypozyczen](
	[ID_Data_wypozyczenia] [int] IDENTITY(1,1) NOT NULL,
	[Data_wypozyczenia] [date] NOT NULL,
	[Data_zwrotu] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Data_wypozyczenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wypozyczenia]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wypozyczenia](
	[ID_Wypozyczenia] [int] IDENTITY(1,1) NOT NULL,
	[ID_Ksiazki] [int] NOT NULL,
	[Wypożyczający] [int] NOT NULL,
	[Pracownik] [int] NOT NULL,
	[ID_Miejsce_odbioru] [int] NOT NULL,
	[ID_Rodzaj_wykorzystania] [int] NOT NULL,
	[ID_Data_rezerwacji] [int] NOT NULL,
	[ID_Data_wypozyczenia] [int] NOT NULL,
	[ID_Stanu_ksiazki] [int] NOT NULL,
 CONSTRAINT [PK__Wypozycz__C62920D5F29CEBE6] PRIMARY KEY CLUSTERED 
(
	[ID_Wypozyczenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefony]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefony](
	[ID_Tel] [int] IDENTITY(1,1) NOT NULL,
	[Kierunkowy_stacjonarny] [int] NULL,
	[Stacjonarny] [int] NULL,
	[Kierunkowy_kom] [int] NULL,
	[Komorkowy] [int] NULL,
 CONSTRAINT [PK__Telefony__27BE06F3B067426E] PRIMARY KEY CLUSTERED 
(
	[ID_Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[Login] [int] IDENTITY(10000000,1) NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[ID_Adres] [int] NOT NULL,
	[ID_Tel] [int] NOT NULL,
	[Data_zapisu] [date] NOT NULL,
	[Data_wypisu] [date] NULL,
	[ID_Typ_uzytkownika] [int] NOT NULL,
 CONSTRAINT [PK__Uzytkown__5E55825A7EAD9827] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ksiazki_Autorzy]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ksiazki_Autorzy](
	[ID_Ksiazki] [int] NOT NULL,
	[ID_Autora] [int] NOT NULL,
	[ID_Rola_autora] [int] NULL,
 CONSTRAINT [PK_Ksiazki_Autorzy] PRIMARY KEY CLUSTERED 
(
	[ID_Ksiazki] ASC,
	[ID_Autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statusy_kar]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statusy_kar](
	[ID_Status_kary] [int] IDENTITY(1,1) NOT NULL,
	[Status_kary] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Statusy___A13DD386F1188E42] PRIMARY KEY CLUSTERED 
(
	[ID_Status_kary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autorzy]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autorzy](
	[ID_Autora] [int] IDENTITY(1,1) NOT NULL,
	[Przedrostek] [nvarchar](15) NULL,
	[Imie] [nvarchar](30) NOT NULL,
	[Drugie_Imie] [nvarchar](30) NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[Rok_ur_autora] [int] NULL,
	[Rok_smierci_autora] [int] NULL,
	[Przedrostek_oryg] [nvarchar](10) NULL,
	[Imie_oryg] [nvarchar](10) NULL,
	[Drugie_imie_oryg] [nvarchar](30) NULL,
	[Nazwisko_oryg] [nvarchar](50) NULL,
 CONSTRAINT [PK__Autorzy__89EE25AC28E676BA] PRIMARY KEY CLUSTERED 
(
	[ID_Autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vKsiazkiPoTerminie]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
Widok przetrzymanych książek
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

/** bezpłatnie książki można wypożyczać na okres 28 dni **/
, (DATEADD (day, 28, dw.Data_wypozyczenia)) as [Planowana_data_zwrotu]

/** pełne tygodnie po terminie zwrotu**/
, case 
	/* jeżeli kara jest opłacona tygodnie zliczane są do daty wpłaty */
	when Kary.ID_Status_Kary = 3
	then (datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), p.Data_wplaty ))/7
	
	else
	(datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7 

end
as [Ilosc_tygodni_po_terminie]

/** wysokość kary **/
/** opłata wynosi 1,50 zł za każdy pełny tydzień */ 
, case
	/* jezeli kara jest oplacona wysokość kary naliczana jest do daty wplaty */
	when Kary.ID_Status_Kary = 3
	then cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), p.Data_wplaty ))/7*1.5)) as smallmoney)

	else cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5)) as smallmoney)
END
as [Kara]

/* Kara pomniejszona o wpłaty **/
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
on w.Wypożyczający = u.Login
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
/****** Object:  Table [dbo].[Adresy]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresy](
	[ID_Adres] [int] IDENTITY(1,1) NOT NULL,
	[ID_Miasta] [int] NOT NULL,
	[Ulica] [nvarchar](50) NOT NULL,
	[Nr_domu] [nvarchar](10) NOT NULL,
	[Nr_mieszkania] [nvarchar](10) NULL,
	[ID_Rodzaj_adresu] [int] NOT NULL,
 CONSTRAINT [PK__Adresy__6C3F73B17B981630] PRIMARY KEY CLUSTERED 
(
	[ID_Adres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miasta]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miasta](
	[ID_Miasta] [int] IDENTITY(1,1) NOT NULL,
	[Kod_pocztowy] [int] NOT NULL,
	[Miasto] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Miasta__89AED7B10601E601] PRIMARY KEY CLUSTERED 
(
	[ID_Miasta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Typy_uzytkownikow]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typy_uzytkownikow](
	[ID_Typ_uzytkownika] [int] IDENTITY(1,1) NOT NULL,
	[Typ_uzytkownika] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Typy_uzy__CB1DEBB1E51A1255] PRIMARY KEY CLUSTERED 
(
	[ID_Typ_uzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUzytkownicyInfo]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
Dane użytkowników
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
/****** Object:  Table [dbo].[Wydawnictwa]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wydawnictwa](
	[ID_Wydawnictwo] [int] IDENTITY(1,1) NOT NULL,
	[Wydawnictwo] [nvarchar](50) NOT NULL,
	[Wydawnictwo_Nazwa_skrocona] [nvarchar](50) NULL,
 CONSTRAINT [PK__Wydawnic__529C6452F016EECC] PRIMARY KEY CLUSTERED 
(
	[ID_Wydawnictwo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Wypozyczone_Ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** Funkcja wyświetlająca wypożyczone książki dla wybranego uzytkownika **/

CREATE FUNCTION [dbo].[fn_Wypozyczone_Ksiazki]
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




GO
/****** Object:  Table [dbo].[Regaly]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regaly](
	[ID_Regalu] [int] IDENTITY(1,1) NOT NULL,
	[Regal] [char](5) NOT NULL,
 CONSTRAINT [PK__Regaly__EEB1AB3970AC34FE] PRIMARY KEY CLUSTERED 
(
	[ID_Regalu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rzedy_regalow]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rzedy_regalow](
	[ID_Rzedu] [int] IDENTITY(1,1) NOT NULL,
	[Rzad] [char](5) NOT NULL,
 CONSTRAINT [PK__Rzedy_re__B16A8155AE8385DD] PRIMARY KEY CLUSTERED 
(
	[ID_Rzedu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Rzedy_Regaly]()
returns table
as
return (
select ID_Rzedu, ID_Regalu from Regaly
cross join Rzedy_regalow
)
GO
/****** Object:  Table [dbo].[Pokoje]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pokoje](
	[ID_Pokoju] [int] IDENTITY(1,1) NOT NULL,
	[Pokoj] [char](5) NOT NULL,
 CONSTRAINT [PK__Pokoje__33D6B7C6DA43E4B7] PRIMARY KEY CLUSTERED 
(
	[ID_Pokoju] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly_Pokoje]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Rzedy_Regaly_Pokoje]()
returns table
as
return (
select ID_Pokoju, ID_Rzedu, ID_Regalu from Pokoje
cross join fn_Rzedy_Regaly()
)
GO
/****** Object:  Table [dbo].[Pietra]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pietra](
	[ID_Pietra] [int] IDENTITY(1,1) NOT NULL,
	[Pietro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pietra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly_Pokoje_Pietra]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Rzedy_Regaly_Pokoje_Pietra]()
returns table
as
return (
select ID_Pietra, ID_Pokoju, ID_Rzedu, ID_Regalu from Pietra
cross join fn_Rzedy_Regaly_Pokoje()
)
GO
/****** Object:  Table [dbo].[Daty_rezerwacji]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daty_rezerwacji](
	[ID_Data_rezerwacji] [int] IDENTITY(1,1) NOT NULL,
	[Data_rezerwacji] [date] NOT NULL,
	[Koniec_rezerwacji] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Data_rezerwacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vDostepnoscKsiazek]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* widok dostepnosci książek */

CREATE view [dbo].[vDostepnoscKsiazek]
as
select
/* uszeregowanie książki wg najnowszej daty rezerwacji*/
row_number() over(partition by k.ID_Ksiazki order by dr.Data_rezerwacji desc) as [RowNumber]
, k.ID_Ksiazki
, dr.Data_rezerwacji
, dr.Koniec_rezerwacji
, dw.Data_wypozyczenia
, dw.Data_zwrotu
, (
case
	when dr.Data_rezerwacji is not null AND dr.Koniec_rezerwacji is null
	/* Rezerwować książki można na 3 dni robocze włączjąc sobotę. 
	Jeżeli termin rezerwacji obejmuje niedzielę dodajemy dodatkowy dzień*/
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
	/* Może się zdarzyć że data będzie wcześniejsza. Oznacza to, że książka nie została jeszcze zwrócona - jest przetrzymana */

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
/****** Object:  Table [dbo].[Formaty]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formaty](
	[ID_Format] [int] IDENTITY(1,1) NOT NULL,
	[Wielkosc] [varchar](5) NOT NULL,
 CONSTRAINT [PK__Formaty__BE79C83033BBC955] PRIMARY KEY CLUSTERED 
(
	[ID_Format] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miejsca_Ksiazek]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miejsca_Ksiazek](
	[ID_Miejsce_Ksiazki] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pietra] [int] NOT NULL,
	[ID_Pokoju] [int] NOT NULL,
	[ID_Rzedu] [int] NOT NULL,
	[ID_Regalu] [int] NOT NULL,
 CONSTRAINT [PK__Miejsca___3018F10424258A4E] PRIMARY KEY CLUSTERED 
(
	[ID_Miejsce_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Okladki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Okladki](
	[ID_Okladki] [int] IDENTITY(1,1) NOT NULL,
	[Okladki] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Okladki__71B28506753E9837] PRIMARY KEY CLUSTERED 
(
	[ID_Okladki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaje_publikacji]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rodzaje_publikacji](
	[ID_Rodzaj_publikacji] [int] IDENTITY(1,1) NOT NULL,
	[Rodzaj] [varchar](30) NOT NULL,
	[ID_Format] [int] NOT NULL,
	[ID_Okladki] [int] NOT NULL,
 CONSTRAINT [PK__Rodzaje___CDD9B4213B1BDBB5] PRIMARY KEY CLUSTERED 
(
	[ID_Rodzaj_publikacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stany_Ksiazek]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stany_Ksiazek](
	[ID_Stanu_ksiazki] [int] IDENTITY(1,1) NOT NULL,
	[Stan_ksiazki] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Stany_Ks__922BCC9BF3FA26E2] PRIMARY KEY CLUSTERED 
(
	[ID_Stanu_ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statusy_Ksiazek]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statusy_Ksiazek](
	[ID_Statusu_Ksiazki] [int] IDENTITY(1,1) NOT NULL,
	[Status_Ksiazki] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Statusy__DEFD9FD689C3D8E0] PRIMARY KEY CLUSTERED 
(
	[ID_Statusu_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vKsiazkiInfo]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Widok książek - wszystkie dane
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
where dk.RowNumber = 1 /* książka z najnowszą datę rezerwacji */
GO
/****** Object:  View [dbo].[vNiezaplaconeKary]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
Widok dla pracownika: Wszystkie niezaplacone kary wraz z kontaktami do uzytkownikow
*/

CREATE VIEW [dbo].[vNiezaplaconeKary]
AS

SELECT 

w.ID_Wypozyczenia

, (concat_ws(' ', u.Imie, u.Nazwisko)) as [Wypożyczający]

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
	as [Książka]

/** bezpłatny termin wypożyczenia = 28 dni **/
, (DATEADD (day, 28, dw.Data_wypozyczenia)) as [Planowana data zwrotu]

/** pełne tygodnie po terminie zwrotu**/
, (datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7 as [Ilość tygodni po terminie]

/** opłata wynosi 1,50 zł za każdy pełny tydzień pomniejszona o częściowe wpłaty **/
, cast((((datediff(day, (DATEADD (day, 28, dw.Data_wypozyczenia)), Getdate() ))/7*1.5 - isnull(p.Kwota_wplaty, 0))) as smallmoney)
as [Do zapłaty]

FROM
Wypozyczenia w
left join Uzytkownicy u
on w.Wypożyczający = u.Login
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
/****** Object:  Table [dbo].[Gatunki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gatunki](
	[ID_Gatunek] [int] IDENTITY(1,1) NOT NULL,
	[Gatunek] [varchar](40) NOT NULL,
 CONSTRAINT [PK__Gatunki__114B14A4944DD6DD] PRIMARY KEY CLUSTERED 
(
	[ID_Gatunek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gatunki_Ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gatunki_Ksiazki](
	[ID_Gatunek] [int] NOT NULL,
	[ID_Ksiazki] [int] NOT NULL,
 CONSTRAINT [PK_Gatunki_Ksiazki] PRIMARY KEY CLUSTERED 
(
	[ID_Gatunek] ASC,
	[ID_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasla]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasla](
	[ID_Haslo] [int] IDENTITY(1,1) NOT NULL,
	[Login] [int] NOT NULL,
	[Haslo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Hasla__B42AA6F6869B905B] PRIMARY KEY CLUSTERED 
(
	[ID_Haslo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jezyki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jezyki](
	[ID_Jezyk] [int] IDENTITY(1,1) NOT NULL,
	[Jezyk] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Jezyk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kraje]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kraje](
	[ID_Kraju] [int] IDENTITY(1,1) NOT NULL,
	[Kraj] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Kraju] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logowania]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logowania](
	[ID_Logowania] [int] IDENTITY(1,1) NOT NULL,
	[Login] [int] NOT NULL,
	[Data_logowania] [datetime] NOT NULL,
	[Data_wylogowania] [datetime] NULL,
 CONSTRAINT [PK__Logowani__6C471875DCB2A267] PRIMARY KEY CLUSTERED 
(
	[ID_Logowania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miejsca_odbioru]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miejsca_odbioru](
	[ID_Miejsce_odbioru] [int] IDENTITY(1,1) NOT NULL,
	[Miejsce_odbioru] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Miejsca___349DF4372031D22B] PRIMARY KEY CLUSTERED 
(
	[ID_Miejsce_odbioru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nowe_Ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nowe_Ksiazki](
	[ID_Zakupu] [int] IDENTITY(1,1) NOT NULL,
	[ID_Ksiazki] [int] NOT NULL,
	[Data_zakupu] [date] NOT NULL,
	[ID_Stanu_ksiazki] [int] NOT NULL,
	[Cena_zakupu] [float] NOT NULL,
 CONSTRAINT [PK__Nowe_Ksi__C1184002B254AECF] PRIMARY KEY CLUSTERED 
(
	[ID_Zakupu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaj_wykorzystania]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rodzaj_wykorzystania](
	[ID_Rodzaj_wykorzystania] [int] IDENTITY(1,1) NOT NULL,
	[Rodzaj_wykorzystania] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Typy_uzy__42A28401F2558DD3] PRIMARY KEY CLUSTERED 
(
	[ID_Rodzaj_wykorzystania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaje_adresow]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rodzaje_adresow](
	[ID_Rodzaj_adresu] [int] IDENTITY(1,1) NOT NULL,
	[Rodzaj_adresu] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Rodzaje___F2CDBC017932AA78] PRIMARY KEY CLUSTERED 
(
	[ID_Rodzaj_adresu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Autorow]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Autorow](
	[ID_Rola_autora] [int] IDENTITY(1,1) NOT NULL,
	[Rola_autora] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Role_Aut__9025E19C2E6BE3B8] PRIMARY KEY CLUSTERED 
(
	[ID_Rola_autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adresy] ON 

INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (1, 1, N'Dąbrowskiej', N'7A', N'25', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (2, 1, N'Fojkisa', N'3C', N'11', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (3, 1, N'Fojkisa', N'2B', N'40', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (4, 1, N'Odrodzenia', N'14', NULL, 2)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (5, 2, N'Paderewskiego', N'35', N'27', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (6, 2, N'Paderewskiego', N'1', N'7', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (7, 3, N'Fabryczna', N'5', N'13A', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (8, 3, N'Fabryczna', N'8', N'2', 3)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (9, 4, N'Dębowa', N'4', N'18', 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (10, 1, N'Warszawska', N'103', NULL, 1)
INSERT [dbo].[Adresy] ([ID_Adres], [ID_Miasta], [Ulica], [Nr_domu], [Nr_mieszkania], [ID_Rodzaj_adresu]) VALUES (11, 1, N'Odrodzenia', N'14', NULL, 1)
SET IDENTITY_INSERT [dbo].[Adresy] OFF
GO
SET IDENTITY_INSERT [dbo].[Autorzy] ON 

INSERT [dbo].[Autorzy] ([ID_Autora], [Przedrostek], [Imie], [Drugie_Imie], [Nazwisko], [Rok_ur_autora], [Rok_smierci_autora], [Przedrostek_oryg], [Imie_oryg], [Drugie_imie_oryg], [Nazwisko_oryg]) VALUES (1, NULL, N'Andrzej', NULL, N'Ziemianski', 1960, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Autorzy] ([ID_Autora], [Przedrostek], [Imie], [Drugie_Imie], [Nazwisko], [Rok_ur_autora], [Rok_smierci_autora], [Przedrostek_oryg], [Imie_oryg], [Drugie_imie_oryg], [Nazwisko_oryg]) VALUES (2, NULL, N'Bolesław', NULL, N'Prus', 1847, 1912, NULL, NULL, NULL, NULL)
INSERT [dbo].[Autorzy] ([ID_Autora], [Przedrostek], [Imie], [Drugie_Imie], [Nazwisko], [Rok_ur_autora], [Rok_smierci_autora], [Przedrostek_oryg], [Imie_oryg], [Drugie_imie_oryg], [Nazwisko_oryg]) VALUES (3, NULL, N'Stephen', NULL, N'King', 1947, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Autorzy] ([ID_Autora], [Przedrostek], [Imie], [Drugie_Imie], [Nazwisko], [Rok_ur_autora], [Rok_smierci_autora], [Przedrostek_oryg], [Imie_oryg], [Drugie_imie_oryg], [Nazwisko_oryg]) VALUES (4, NULL, N'Owen', NULL, N'King', 1977, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Autorzy] ([ID_Autora], [Przedrostek], [Imie], [Drugie_Imie], [Nazwisko], [Rok_ur_autora], [Rok_smierci_autora], [Przedrostek_oryg], [Imie_oryg], [Drugie_imie_oryg], [Nazwisko_oryg]) VALUES (5, NULL, N'Tomasz', NULL, N'Wilus', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Autorzy] OFF
GO
SET IDENTITY_INSERT [dbo].[Daty_rezerwacji] ON 

INSERT [dbo].[Daty_rezerwacji] ([ID_Data_rezerwacji], [Data_rezerwacji], [Koniec_rezerwacji]) VALUES (1, CAST(N'2021-03-01' AS Date), CAST(N'2021-03-01' AS Date))
INSERT [dbo].[Daty_rezerwacji] ([ID_Data_rezerwacji], [Data_rezerwacji], [Koniec_rezerwacji]) VALUES (2, CAST(N'2021-03-04' AS Date), CAST(N'2021-03-04' AS Date))
INSERT [dbo].[Daty_rezerwacji] ([ID_Data_rezerwacji], [Data_rezerwacji], [Koniec_rezerwacji]) VALUES (3, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-04' AS Date))
INSERT [dbo].[Daty_rezerwacji] ([ID_Data_rezerwacji], [Data_rezerwacji], [Koniec_rezerwacji]) VALUES (4, CAST(N'2021-03-29' AS Date), CAST(N'2021-03-29' AS Date))
SET IDENTITY_INSERT [dbo].[Daty_rezerwacji] OFF
GO
SET IDENTITY_INSERT [dbo].[Daty_wypozyczen] ON 

INSERT [dbo].[Daty_wypozyczen] ([ID_Data_wypozyczenia], [Data_wypozyczenia], [Data_zwrotu]) VALUES (1, CAST(N'2021-03-01' AS Date), NULL)
INSERT [dbo].[Daty_wypozyczen] ([ID_Data_wypozyczenia], [Data_wypozyczenia], [Data_zwrotu]) VALUES (2, CAST(N'2021-03-04' AS Date), NULL)
INSERT [dbo].[Daty_wypozyczen] ([ID_Data_wypozyczenia], [Data_wypozyczenia], [Data_zwrotu]) VALUES (3, CAST(N'2021-03-07' AS Date), NULL)
INSERT [dbo].[Daty_wypozyczen] ([ID_Data_wypozyczenia], [Data_wypozyczenia], [Data_zwrotu]) VALUES (4, CAST(N'2021-03-29' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Daty_wypozyczen] OFF
GO
SET IDENTITY_INSERT [dbo].[Formaty] ON 

INSERT [dbo].[Formaty] ([ID_Format], [Wielkosc]) VALUES (4, N'14')
INSERT [dbo].[Formaty] ([ID_Format], [Wielkosc]) VALUES (1, N'A4')
INSERT [dbo].[Formaty] ([ID_Format], [Wielkosc]) VALUES (2, N'A5')
INSERT [dbo].[Formaty] ([ID_Format], [Wielkosc]) VALUES (3, N'B5')
SET IDENTITY_INSERT [dbo].[Formaty] OFF
GO
SET IDENTITY_INSERT [dbo].[Gatunki] ON 

INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (2, N'Fantastyka')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (1, N'Horror')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (3, N'Kulinarne')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (8, N'Literatura polska')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (4, N'Podręcznik')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (5, N'Podróżnicze')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (6, N'Powieść')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (9, N'Proza')
INSERT [dbo].[Gatunki] ([ID_Gatunek], [Gatunek]) VALUES (7, N'Thriller')
SET IDENTITY_INSERT [dbo].[Gatunki] OFF
GO
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (2, 1)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (2, 2)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (2, 3)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (8, 1)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (8, 2)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (8, 3)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (9, 1)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (9, 2)
INSERT [dbo].[Gatunki_Ksiazki] ([ID_Gatunek], [ID_Ksiazki]) VALUES (9, 3)
GO
SET IDENTITY_INSERT [dbo].[Jezyki] ON 

INSERT [dbo].[Jezyki] ([ID_Jezyk], [Jezyk]) VALUES (2, N'Angielski')
INSERT [dbo].[Jezyki] ([ID_Jezyk], [Jezyk]) VALUES (3, N'Francuski')
INSERT [dbo].[Jezyki] ([ID_Jezyk], [Jezyk]) VALUES (4, N'Niemiecki')
INSERT [dbo].[Jezyki] ([ID_Jezyk], [Jezyk]) VALUES (1, N'Polski')
SET IDENTITY_INSERT [dbo].[Jezyki] OFF
GO
SET IDENTITY_INSERT [dbo].[Kary] ON 

INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (2, 2, 2, 1)
INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (3, 3, 3, 2)
INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (4, 4, 1, NULL)
INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (5, 5, 1, NULL)
INSERT [dbo].[Kary] ([ID_Kary], [ID_Wypozyczenia], [ID_Status_kary], [ID_Platnosci]) VALUES (6, 6, 1, NULL)
SET IDENTITY_INSERT [dbo].[Kary] OFF
GO
SET IDENTITY_INSERT [dbo].[Kraje] ON 

INSERT [dbo].[Kraje] ([ID_Kraju], [Kraj]) VALUES (3, N'Francja')
INSERT [dbo].[Kraje] ([ID_Kraju], [Kraj]) VALUES (4, N'Niemcy')
INSERT [dbo].[Kraje] ([ID_Kraju], [Kraj]) VALUES (1, N'Polska')
INSERT [dbo].[Kraje] ([ID_Kraju], [Kraj]) VALUES (2, N'Wielka Brytania')
SET IDENTITY_INSERT [dbo].[Kraje] OFF
GO
SET IDENTITY_INSERT [dbo].[Ksiazki] ON 

INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (1, N'Zapach szkła', NULL, 9788362478446, 2011, 1, 1, 1, 3, 413, 1, 57, 1, 1)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (2, N'Zapach szkła', NULL, 9788362478446, 2011, 1, 1, 1, 3, 413, 1, 57, 1, 3)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (3, N'Zapach szkła', NULL, 9788362478446, 2011, 1, 1, 1, 3, 413, 1, 57, 2, 1)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (4, N'Achaja T.1', NULL, 9788375742282, 2002, 1, 1, 1, 3, 621, 1, 56, 1, 2)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (5, N'Achaja T.1', NULL, 9788362478446, 2012, 1, 1, 1, 3, 688, 1, 57, 1, 3)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (6, N'Achaja T.1', NULL, 9788362478446, 2012, 1, 1, 1, 3, 688, 1, 57, 2, 1)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (7, N'Lalka', NULL, 8373899278, 2005, 2, 1, 1, NULL, 585, 1, 1029, 1, 3)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (8, N'Lalka', NULL, NULL, 1991, 3, 1, 1, NULL, 435, 1, 1029, 1, 2)
INSERT [dbo].[Ksiazki] ([ID_Ksiazki], [Tytul], [Tytul_oryginalny], [ISBN], [Rok_wydania], [ID_Wydawnictwo], [ID_Kraju], [ID_Jezyk], [Nr_wydania], [Liczba_stron], [ID_Rodzaj_publikacji], [ID_Miejsce_Ksiazki], [ID_Statusu_Ksiazki], [ID_Stanu_Ksiazki]) VALUES (10, N'Śpiące królewny', N'Sleeping beauties', 9788381230421, 2017, 4, 1, 1, NULL, 735, 1, 743, 1, 1)
SET IDENTITY_INSERT [dbo].[Ksiazki] OFF
GO
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (1, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (2, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (3, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (4, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (5, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (6, 1, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (7, 2, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (8, 2, 1)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (10, 3, 2)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (10, 4, 2)
INSERT [dbo].[Ksiazki_Autorzy] ([ID_Ksiazki], [ID_Autora], [ID_Rola_autora]) VALUES (10, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[Miasta] ON 

INSERT [dbo].[Miasta] ([ID_Miasta], [Kod_pocztowy], [Miasto]) VALUES (1, 41103, N'Siemianowice Śląskie')
INSERT [dbo].[Miasta] ([ID_Miasta], [Kod_pocztowy], [Miasto]) VALUES (2, 40282, N'Katowice')
INSERT [dbo].[Miasta] ([ID_Miasta], [Kod_pocztowy], [Miasto]) VALUES (3, 40611, N'Katowice')
INSERT [dbo].[Miasta] ([ID_Miasta], [Kod_pocztowy], [Miasto]) VALUES (4, 41516, N'Chorzów')
INSERT [dbo].[Miasta] ([ID_Miasta], [Kod_pocztowy], [Miasto]) VALUES (5, 42200, N'Częstochowa')
SET IDENTITY_INSERT [dbo].[Miasta] OFF
GO
SET IDENTITY_INSERT [dbo].[Miejsca_Ksiazek] ON 

INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1, 1, 1, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2, 1, 2, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (3, 1, 3, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (4, 1, 4, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (5, 1, 5, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (6, 1, 6, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (7, 1, 7, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (8, 1, 8, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (9, 1, 9, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (10, 1, 10, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (11, 1, 11, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (12, 1, 12, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (13, 1, 1, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (14, 1, 2, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (15, 1, 3, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (16, 1, 4, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (17, 1, 5, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (18, 1, 6, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (19, 1, 7, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (20, 1, 8, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (21, 1, 9, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (22, 1, 10, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (23, 1, 11, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (24, 1, 12, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (25, 1, 1, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (26, 1, 2, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (27, 1, 3, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (28, 1, 4, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (29, 1, 5, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (30, 1, 6, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (31, 1, 7, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (32, 1, 8, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (33, 1, 9, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (34, 1, 10, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (35, 1, 11, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (36, 1, 12, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (37, 1, 1, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (38, 1, 2, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (39, 1, 3, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (40, 1, 4, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (41, 1, 5, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (42, 1, 6, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (43, 1, 7, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (44, 1, 8, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (45, 1, 9, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (46, 1, 10, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (47, 1, 11, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (48, 1, 12, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (49, 1, 1, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (50, 1, 2, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (51, 1, 3, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (52, 1, 4, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (53, 1, 5, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (54, 1, 6, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (55, 1, 7, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (56, 1, 8, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (57, 1, 9, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (58, 1, 10, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (59, 1, 11, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (60, 1, 12, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (61, 1, 1, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (62, 1, 2, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (63, 1, 3, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (64, 1, 4, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (65, 1, 5, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (66, 1, 6, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (67, 1, 7, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (68, 1, 8, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (69, 1, 9, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (70, 1, 10, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (71, 1, 11, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (72, 1, 12, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (73, 1, 1, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (74, 1, 2, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (75, 1, 3, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (76, 1, 4, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (77, 1, 5, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (78, 1, 6, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (79, 1, 7, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (80, 1, 8, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (81, 1, 9, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (82, 1, 10, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (83, 1, 11, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (84, 1, 12, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (85, 1, 1, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (86, 1, 2, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (87, 1, 3, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (88, 1, 4, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (89, 1, 5, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (90, 1, 6, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (91, 1, 7, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (92, 1, 8, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (93, 1, 9, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (94, 1, 10, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (95, 1, 11, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (96, 1, 12, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (97, 1, 1, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (98, 1, 2, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (99, 1, 3, 17, 1)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (100, 1, 4, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (101, 1, 5, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (102, 1, 6, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (103, 1, 7, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (104, 1, 8, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (105, 1, 9, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (106, 1, 10, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (107, 1, 11, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (108, 1, 12, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (109, 1, 1, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (110, 1, 2, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (111, 1, 3, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (112, 1, 4, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (113, 1, 5, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (114, 1, 6, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (115, 1, 7, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (116, 1, 8, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (117, 1, 9, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (118, 1, 10, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (119, 1, 11, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (120, 1, 12, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (121, 1, 1, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (122, 1, 2, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (123, 1, 3, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (124, 1, 4, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (125, 1, 5, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (126, 1, 6, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (127, 1, 7, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (128, 1, 8, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (129, 1, 9, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (130, 1, 10, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (131, 1, 11, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (132, 1, 12, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (133, 1, 1, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (134, 1, 2, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (135, 1, 3, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (136, 1, 4, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (137, 1, 5, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (138, 1, 6, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (139, 1, 7, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (140, 1, 8, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (141, 1, 9, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (142, 1, 10, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (143, 1, 11, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (144, 1, 12, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (145, 1, 1, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (146, 1, 2, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (147, 1, 3, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (148, 1, 4, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (149, 1, 5, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (150, 1, 6, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (151, 1, 7, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (152, 1, 8, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (153, 1, 9, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (154, 1, 10, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (155, 1, 11, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (156, 1, 12, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (157, 1, 1, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (158, 1, 2, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (159, 1, 3, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (160, 1, 4, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (161, 1, 5, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (162, 1, 6, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (163, 1, 7, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (164, 1, 8, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (165, 1, 9, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (166, 1, 10, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (167, 1, 11, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (168, 1, 12, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (169, 1, 1, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (170, 1, 2, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (171, 1, 3, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (172, 1, 4, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (173, 1, 5, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (174, 1, 6, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (175, 1, 7, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (176, 1, 8, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (177, 1, 9, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (178, 1, 10, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (179, 1, 11, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (180, 1, 12, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (181, 1, 1, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (182, 1, 2, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (183, 1, 3, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (184, 1, 4, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (185, 1, 5, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (186, 1, 6, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (187, 1, 7, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (188, 1, 8, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (189, 1, 9, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (190, 1, 10, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (191, 1, 11, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (192, 1, 12, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (193, 1, 1, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (194, 1, 2, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (195, 1, 3, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (196, 1, 4, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (197, 1, 5, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (198, 1, 6, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (199, 1, 7, 15, 2)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (200, 1, 8, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (201, 1, 9, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (202, 1, 10, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (203, 1, 11, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (204, 1, 12, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (205, 1, 1, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (206, 1, 2, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (207, 1, 3, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (208, 1, 4, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (209, 1, 5, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (210, 1, 6, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (211, 1, 7, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (212, 1, 8, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (213, 1, 9, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (214, 1, 10, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (215, 1, 11, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (216, 1, 12, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (217, 1, 1, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (218, 1, 2, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (219, 1, 3, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (220, 1, 4, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (221, 1, 5, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (222, 1, 6, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (223, 1, 7, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (224, 1, 8, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (225, 1, 9, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (226, 1, 10, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (227, 1, 11, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (228, 1, 12, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (229, 1, 1, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (230, 1, 2, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (231, 1, 3, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (232, 1, 4, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (233, 1, 5, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (234, 1, 6, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (235, 1, 7, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (236, 1, 8, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (237, 1, 9, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (238, 1, 10, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (239, 1, 11, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (240, 1, 12, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (241, 1, 1, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (242, 1, 2, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (243, 1, 3, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (244, 1, 4, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (245, 1, 5, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (246, 1, 6, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (247, 1, 7, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (248, 1, 8, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (249, 1, 9, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (250, 1, 10, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (251, 1, 11, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (252, 1, 12, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (253, 1, 1, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (254, 1, 2, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (255, 1, 3, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (256, 1, 4, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (257, 1, 5, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (258, 1, 6, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (259, 1, 7, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (260, 1, 8, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (261, 1, 9, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (262, 1, 10, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (263, 1, 11, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (264, 1, 12, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (265, 1, 1, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (266, 1, 2, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (267, 1, 3, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (268, 1, 4, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (269, 1, 5, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (270, 1, 6, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (271, 1, 7, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (272, 1, 8, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (273, 1, 9, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (274, 1, 10, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (275, 1, 11, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (276, 1, 12, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (277, 1, 1, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (278, 1, 2, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (279, 1, 3, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (280, 1, 4, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (281, 1, 5, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (282, 1, 6, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (283, 1, 7, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (284, 1, 8, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (285, 1, 9, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (286, 1, 10, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (287, 1, 11, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (288, 1, 12, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (289, 1, 1, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (290, 1, 2, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (291, 1, 3, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (292, 1, 4, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (293, 1, 5, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (294, 1, 6, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (295, 1, 7, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (296, 1, 8, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (297, 1, 9, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (298, 1, 10, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (299, 1, 11, 13, 3)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (300, 1, 12, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (301, 1, 1, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (302, 1, 2, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (303, 1, 3, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (304, 1, 4, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (305, 1, 5, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (306, 1, 6, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (307, 1, 7, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (308, 1, 8, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (309, 1, 9, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (310, 1, 10, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (311, 1, 11, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (312, 1, 12, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (313, 1, 1, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (314, 1, 2, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (315, 1, 3, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (316, 1, 4, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (317, 1, 5, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (318, 1, 6, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (319, 1, 7, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (320, 1, 8, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (321, 1, 9, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (322, 1, 10, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (323, 1, 11, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (324, 1, 12, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (325, 1, 1, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (326, 1, 2, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (327, 1, 3, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (328, 1, 4, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (329, 1, 5, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (330, 1, 6, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (331, 1, 7, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (332, 1, 8, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (333, 1, 9, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (334, 1, 10, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (335, 1, 11, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (336, 1, 12, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (337, 1, 1, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (338, 1, 2, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (339, 1, 3, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (340, 1, 4, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (341, 1, 5, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (342, 1, 6, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (343, 1, 7, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (344, 1, 8, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (345, 1, 9, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (346, 1, 10, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (347, 1, 11, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (348, 1, 12, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (349, 1, 1, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (350, 1, 2, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (351, 1, 3, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (352, 1, 4, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (353, 1, 5, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (354, 1, 6, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (355, 1, 7, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (356, 1, 8, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (357, 1, 9, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (358, 1, 10, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (359, 1, 11, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (360, 1, 12, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (361, 1, 1, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (362, 1, 2, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (363, 1, 3, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (364, 1, 4, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (365, 1, 5, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (366, 1, 6, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (367, 1, 7, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (368, 1, 8, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (369, 1, 9, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (370, 1, 10, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (371, 1, 11, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (372, 1, 12, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (373, 1, 1, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (374, 1, 2, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (375, 1, 3, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (376, 1, 4, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (377, 1, 5, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (378, 1, 6, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (379, 1, 7, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (380, 1, 8, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (381, 1, 9, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (382, 1, 10, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (383, 1, 11, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (384, 1, 12, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (385, 1, 1, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (386, 1, 2, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (387, 1, 3, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (388, 1, 4, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (389, 1, 5, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (390, 1, 6, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (391, 1, 7, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (392, 1, 8, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (393, 1, 9, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (394, 1, 10, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (395, 1, 11, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (396, 1, 12, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (397, 1, 1, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (398, 1, 2, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (399, 1, 3, 12, 4)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (400, 1, 4, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (401, 1, 5, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (402, 1, 6, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (403, 1, 7, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (404, 1, 8, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (405, 1, 9, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (406, 1, 10, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (407, 1, 11, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (408, 1, 12, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (409, 1, 1, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (410, 1, 2, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (411, 1, 3, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (412, 1, 4, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (413, 1, 5, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (414, 1, 6, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (415, 1, 7, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (416, 1, 8, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (417, 1, 9, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (418, 1, 10, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (419, 1, 11, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (420, 1, 12, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (421, 1, 1, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (422, 1, 2, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (423, 1, 3, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (424, 1, 4, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (425, 1, 5, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (426, 1, 6, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (427, 1, 7, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (428, 1, 8, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (429, 1, 9, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (430, 1, 10, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (431, 1, 11, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (432, 1, 12, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (433, 1, 1, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (434, 1, 2, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (435, 1, 3, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (436, 1, 4, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (437, 1, 5, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (438, 1, 6, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (439, 1, 7, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (440, 1, 8, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (441, 1, 9, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (442, 1, 10, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (443, 1, 11, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (444, 1, 12, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (445, 1, 1, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (446, 1, 2, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (447, 1, 3, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (448, 1, 4, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (449, 1, 5, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (450, 1, 6, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (451, 1, 7, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (452, 1, 8, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (453, 1, 9, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (454, 1, 10, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (455, 1, 11, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (456, 1, 12, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (457, 1, 1, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (458, 1, 2, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (459, 1, 3, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (460, 1, 4, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (461, 1, 5, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (462, 1, 6, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (463, 1, 7, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (464, 1, 8, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (465, 1, 9, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (466, 1, 10, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (467, 1, 11, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (468, 1, 12, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (469, 1, 1, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (470, 1, 2, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (471, 1, 3, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (472, 1, 4, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (473, 1, 5, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (474, 1, 6, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (475, 1, 7, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (476, 1, 8, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (477, 1, 9, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (478, 1, 10, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (479, 1, 11, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (480, 1, 12, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (481, 1, 1, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (482, 1, 2, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (483, 1, 3, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (484, 1, 4, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (485, 1, 5, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (486, 1, 6, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (487, 1, 7, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (488, 1, 8, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (489, 1, 9, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (490, 1, 10, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (491, 1, 11, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (492, 1, 12, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (493, 1, 1, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (494, 1, 2, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (495, 1, 3, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (496, 1, 4, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (497, 1, 5, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (498, 1, 6, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (499, 1, 7, 10, 5)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (500, 1, 8, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (501, 1, 9, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (502, 1, 10, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (503, 1, 11, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (504, 1, 12, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (505, 1, 1, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (506, 1, 2, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (507, 1, 3, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (508, 1, 4, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (509, 1, 5, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (510, 1, 6, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (511, 1, 7, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (512, 1, 8, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (513, 1, 9, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (514, 1, 10, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (515, 1, 11, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (516, 1, 12, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (517, 1, 1, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (518, 1, 2, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (519, 1, 3, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (520, 1, 4, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (521, 1, 5, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (522, 1, 6, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (523, 1, 7, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (524, 1, 8, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (525, 1, 9, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (526, 1, 10, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (527, 1, 11, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (528, 1, 12, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (529, 1, 1, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (530, 1, 2, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (531, 1, 3, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (532, 1, 4, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (533, 1, 5, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (534, 1, 6, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (535, 1, 7, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (536, 1, 8, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (537, 1, 9, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (538, 1, 10, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (539, 1, 11, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (540, 1, 12, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (541, 1, 1, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (542, 1, 2, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (543, 1, 3, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (544, 1, 4, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (545, 1, 5, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (546, 1, 6, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (547, 1, 7, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (548, 1, 8, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (549, 1, 9, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (550, 1, 10, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (551, 1, 11, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (552, 1, 12, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (553, 1, 1, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (554, 1, 2, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (555, 1, 3, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (556, 1, 4, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (557, 1, 5, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (558, 1, 6, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (559, 1, 7, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (560, 1, 8, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (561, 1, 9, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (562, 1, 10, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (563, 1, 11, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (564, 1, 12, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (565, 1, 1, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (566, 1, 2, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (567, 1, 3, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (568, 1, 4, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (569, 1, 5, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (570, 1, 6, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (571, 1, 7, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (572, 1, 8, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (573, 1, 9, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (574, 1, 10, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (575, 1, 11, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (576, 1, 12, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (577, 1, 1, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (578, 1, 2, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (579, 1, 3, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (580, 1, 4, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (581, 1, 5, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (582, 1, 6, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (583, 1, 7, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (584, 1, 8, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (585, 1, 9, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (586, 1, 10, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (587, 1, 11, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (588, 1, 12, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (589, 1, 1, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (590, 1, 2, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (591, 1, 3, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (592, 1, 4, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (593, 1, 5, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (594, 1, 6, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (595, 1, 7, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (596, 1, 8, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (597, 1, 9, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (598, 1, 10, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (599, 1, 11, 18, 5)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (600, 1, 12, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (601, 1, 1, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (602, 1, 2, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (603, 1, 3, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (604, 1, 4, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (605, 1, 5, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (606, 1, 6, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (607, 1, 7, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (608, 1, 8, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (609, 1, 9, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (610, 1, 10, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (611, 1, 11, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (612, 1, 12, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (613, 1, 1, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (614, 1, 2, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (615, 1, 3, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (616, 1, 4, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (617, 1, 5, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (618, 1, 6, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (619, 1, 7, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (620, 1, 8, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (621, 1, 9, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (622, 1, 10, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (623, 1, 11, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (624, 1, 12, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (625, 1, 1, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (626, 1, 2, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (627, 1, 3, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (628, 1, 4, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (629, 1, 5, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (630, 1, 6, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (631, 1, 7, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (632, 1, 8, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (633, 1, 9, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (634, 1, 10, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (635, 1, 11, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (636, 1, 12, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (637, 1, 1, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (638, 1, 2, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (639, 1, 3, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (640, 1, 4, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (641, 1, 5, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (642, 1, 6, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (643, 1, 7, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (644, 1, 8, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (645, 1, 9, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (646, 1, 10, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (647, 1, 11, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (648, 1, 12, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (649, 1, 1, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (650, 1, 2, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (651, 1, 3, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (652, 1, 4, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (653, 1, 5, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (654, 1, 6, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (655, 1, 7, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (656, 1, 8, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (657, 1, 9, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (658, 1, 10, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (659, 1, 11, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (660, 1, 12, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (661, 1, 1, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (662, 1, 2, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (663, 1, 3, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (664, 1, 4, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (665, 1, 5, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (666, 1, 6, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (667, 1, 7, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (668, 1, 8, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (669, 1, 9, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (670, 1, 10, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (671, 1, 11, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (672, 1, 12, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (673, 1, 1, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (674, 1, 2, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (675, 1, 3, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (676, 1, 4, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (677, 1, 5, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (678, 1, 6, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (679, 1, 7, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (680, 1, 8, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (681, 1, 9, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (682, 1, 10, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (683, 1, 11, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (684, 1, 12, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (685, 1, 1, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (686, 1, 2, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (687, 1, 3, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (688, 1, 4, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (689, 1, 5, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (690, 1, 6, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (691, 1, 7, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (692, 1, 8, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (693, 1, 9, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (694, 1, 10, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (695, 1, 11, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (696, 1, 12, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (697, 1, 1, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (698, 1, 2, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (699, 1, 3, 17, 6)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (700, 1, 4, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (701, 1, 5, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (702, 1, 6, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (703, 1, 7, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (704, 1, 8, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (705, 1, 9, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (706, 1, 10, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (707, 1, 11, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (708, 1, 12, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (709, 1, 1, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (710, 1, 2, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (711, 1, 3, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (712, 1, 4, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (713, 1, 5, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (714, 1, 6, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (715, 1, 7, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (716, 1, 8, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (717, 1, 9, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (718, 1, 10, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (719, 1, 11, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (720, 1, 12, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (721, 1, 1, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (722, 1, 2, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (723, 1, 3, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (724, 1, 4, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (725, 1, 5, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (726, 1, 6, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (727, 1, 7, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (728, 1, 8, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (729, 1, 9, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (730, 1, 10, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (731, 1, 11, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (732, 1, 12, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (733, 1, 1, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (734, 1, 2, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (735, 1, 3, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (736, 1, 4, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (737, 1, 5, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (738, 1, 6, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (739, 1, 7, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (740, 1, 8, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (741, 1, 9, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (742, 1, 10, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (743, 1, 11, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (744, 1, 12, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (745, 1, 1, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (746, 1, 2, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (747, 1, 3, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (748, 1, 4, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (749, 1, 5, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (750, 1, 6, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (751, 1, 7, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (752, 1, 8, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (753, 1, 9, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (754, 1, 10, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (755, 1, 11, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (756, 1, 12, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (757, 1, 1, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (758, 1, 2, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (759, 1, 3, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (760, 1, 4, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (761, 1, 5, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (762, 1, 6, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (763, 1, 7, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (764, 1, 8, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (765, 1, 9, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (766, 1, 10, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (767, 1, 11, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (768, 1, 12, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (769, 1, 1, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (770, 1, 2, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (771, 1, 3, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (772, 1, 4, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (773, 1, 5, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (774, 1, 6, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (775, 1, 7, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (776, 1, 8, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (777, 1, 9, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (778, 1, 10, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (779, 1, 11, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (780, 1, 12, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (781, 1, 1, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (782, 1, 2, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (783, 1, 3, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (784, 1, 4, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (785, 1, 5, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (786, 1, 6, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (787, 1, 7, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (788, 1, 8, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (789, 1, 9, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (790, 1, 10, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (791, 1, 11, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (792, 1, 12, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (793, 1, 1, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (794, 1, 2, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (795, 1, 3, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (796, 1, 4, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (797, 1, 5, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (798, 1, 6, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (799, 1, 7, 15, 7)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (800, 1, 8, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (801, 1, 9, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (802, 1, 10, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (803, 1, 11, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (804, 1, 12, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (805, 1, 1, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (806, 1, 2, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (807, 1, 3, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (808, 1, 4, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (809, 1, 5, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (810, 1, 6, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (811, 1, 7, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (812, 1, 8, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (813, 1, 9, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (814, 1, 10, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (815, 1, 11, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (816, 1, 12, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (817, 1, 1, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (818, 1, 2, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (819, 1, 3, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (820, 1, 4, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (821, 1, 5, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (822, 1, 6, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (823, 1, 7, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (824, 1, 8, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (825, 1, 9, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (826, 1, 10, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (827, 1, 11, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (828, 1, 12, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (829, 1, 1, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (830, 1, 2, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (831, 1, 3, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (832, 1, 4, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (833, 1, 5, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (834, 1, 6, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (835, 1, 7, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (836, 1, 8, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (837, 1, 9, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (838, 1, 10, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (839, 1, 11, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (840, 1, 12, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (841, 1, 1, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (842, 1, 2, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (843, 1, 3, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (844, 1, 4, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (845, 1, 5, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (846, 1, 6, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (847, 1, 7, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (848, 1, 8, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (849, 1, 9, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (850, 1, 10, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (851, 1, 11, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (852, 1, 12, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (853, 1, 1, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (854, 1, 2, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (855, 1, 3, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (856, 1, 4, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (857, 1, 5, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (858, 1, 6, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (859, 1, 7, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (860, 1, 8, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (861, 1, 9, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (862, 1, 10, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (863, 1, 11, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (864, 1, 12, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (865, 1, 1, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (866, 1, 2, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (867, 1, 3, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (868, 1, 4, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (869, 1, 5, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (870, 1, 6, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (871, 1, 7, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (872, 1, 8, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (873, 1, 9, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (874, 1, 10, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (875, 1, 11, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (876, 1, 12, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (877, 1, 1, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (878, 1, 2, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (879, 1, 3, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (880, 1, 4, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (881, 1, 5, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (882, 1, 6, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (883, 1, 7, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (884, 1, 8, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (885, 1, 9, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (886, 1, 10, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (887, 1, 11, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (888, 1, 12, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (889, 1, 1, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (890, 1, 2, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (891, 1, 3, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (892, 1, 4, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (893, 1, 5, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (894, 1, 6, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (895, 1, 7, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (896, 1, 8, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (897, 1, 9, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (898, 1, 10, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (899, 1, 11, 13, 8)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (900, 1, 12, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (901, 1, 1, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (902, 1, 2, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (903, 1, 3, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (904, 1, 4, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (905, 1, 5, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (906, 1, 6, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (907, 1, 7, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (908, 1, 8, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (909, 1, 9, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (910, 1, 10, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (911, 1, 11, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (912, 1, 12, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (913, 1, 1, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (914, 1, 2, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (915, 1, 3, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (916, 1, 4, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (917, 1, 5, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (918, 1, 6, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (919, 1, 7, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (920, 1, 8, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (921, 1, 9, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (922, 1, 10, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (923, 1, 11, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (924, 1, 12, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (925, 1, 1, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (926, 1, 2, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (927, 1, 3, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (928, 1, 4, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (929, 1, 5, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (930, 1, 6, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (931, 1, 7, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (932, 1, 8, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (933, 1, 9, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (934, 1, 10, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (935, 1, 11, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (936, 1, 12, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (937, 1, 1, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (938, 1, 2, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (939, 1, 3, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (940, 1, 4, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (941, 1, 5, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (942, 1, 6, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (943, 1, 7, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (944, 1, 8, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (945, 1, 9, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (946, 1, 10, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (947, 1, 11, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (948, 1, 12, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (949, 1, 1, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (950, 1, 2, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (951, 1, 3, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (952, 1, 4, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (953, 1, 5, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (954, 1, 6, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (955, 1, 7, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (956, 1, 8, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (957, 1, 9, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (958, 1, 10, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (959, 1, 11, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (960, 1, 12, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (961, 1, 1, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (962, 1, 2, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (963, 1, 3, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (964, 1, 4, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (965, 1, 5, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (966, 1, 6, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (967, 1, 7, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (968, 1, 8, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (969, 1, 9, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (970, 1, 10, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (971, 1, 11, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (972, 1, 12, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (973, 1, 1, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (974, 1, 2, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (975, 1, 3, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (976, 1, 4, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (977, 1, 5, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (978, 1, 6, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (979, 1, 7, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (980, 1, 8, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (981, 1, 9, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (982, 1, 10, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (983, 1, 11, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (984, 1, 12, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (985, 1, 1, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (986, 1, 2, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (987, 1, 3, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (988, 1, 4, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (989, 1, 5, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (990, 1, 6, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (991, 1, 7, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (992, 1, 8, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (993, 1, 9, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (994, 1, 10, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (995, 1, 11, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (996, 1, 12, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (997, 1, 1, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (998, 1, 2, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (999, 1, 3, 12, 9)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1000, 1, 4, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1001, 1, 5, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1002, 1, 6, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1003, 1, 7, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1004, 1, 8, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1005, 1, 9, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1006, 1, 10, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1007, 1, 11, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1008, 1, 12, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1009, 1, 1, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1010, 1, 2, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1011, 1, 3, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1012, 1, 4, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1013, 1, 5, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1014, 1, 6, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1015, 1, 7, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1016, 1, 8, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1017, 1, 9, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1018, 1, 10, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1019, 1, 11, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1020, 1, 12, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1021, 1, 1, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1022, 1, 2, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1023, 1, 3, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1024, 1, 4, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1025, 1, 5, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1026, 1, 6, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1027, 1, 7, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1028, 1, 8, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1029, 1, 9, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1030, 1, 10, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1031, 1, 11, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1032, 1, 12, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1033, 1, 1, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1034, 1, 2, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1035, 1, 3, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1036, 1, 4, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1037, 1, 5, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1038, 1, 6, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1039, 1, 7, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1040, 1, 8, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1041, 1, 9, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1042, 1, 10, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1043, 1, 11, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1044, 1, 12, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1045, 1, 1, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1046, 1, 2, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1047, 1, 3, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1048, 1, 4, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1049, 1, 5, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1050, 1, 6, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1051, 1, 7, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1052, 1, 8, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1053, 1, 9, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1054, 1, 10, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1055, 1, 11, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1056, 1, 12, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1057, 1, 1, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1058, 1, 2, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1059, 1, 3, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1060, 1, 4, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1061, 1, 5, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1062, 1, 6, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1063, 1, 7, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1064, 1, 8, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1065, 1, 9, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1066, 1, 10, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1067, 1, 11, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1068, 1, 12, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1069, 1, 1, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1070, 1, 2, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1071, 1, 3, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1072, 1, 4, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1073, 1, 5, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1074, 1, 6, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1075, 1, 7, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1076, 1, 8, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1077, 1, 9, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1078, 1, 10, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1079, 1, 11, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1080, 1, 12, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1081, 1, 1, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1082, 1, 2, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1083, 1, 3, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1084, 1, 4, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1085, 1, 5, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1086, 1, 6, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1087, 1, 7, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1088, 1, 8, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1089, 1, 9, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1090, 1, 10, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1091, 1, 11, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1092, 1, 12, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1093, 1, 1, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1094, 1, 2, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1095, 1, 3, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1096, 1, 4, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1097, 1, 5, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1098, 1, 6, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1099, 1, 7, 10, 10)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1100, 1, 8, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1101, 1, 9, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1102, 1, 10, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1103, 1, 11, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1104, 1, 12, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1105, 1, 1, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1106, 1, 2, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1107, 1, 3, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1108, 1, 4, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1109, 1, 5, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1110, 1, 6, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1111, 1, 7, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1112, 1, 8, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1113, 1, 9, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1114, 1, 10, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1115, 1, 11, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1116, 1, 12, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1117, 1, 1, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1118, 1, 2, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1119, 1, 3, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1120, 1, 4, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1121, 1, 5, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1122, 1, 6, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1123, 1, 7, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1124, 1, 8, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1125, 1, 9, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1126, 1, 10, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1127, 1, 11, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1128, 1, 12, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1129, 1, 1, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1130, 1, 2, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1131, 1, 3, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1132, 1, 4, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1133, 1, 5, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1134, 1, 6, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1135, 1, 7, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1136, 1, 8, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1137, 1, 9, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1138, 1, 10, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1139, 1, 11, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1140, 1, 12, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1141, 1, 1, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1142, 1, 2, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1143, 1, 3, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1144, 1, 4, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1145, 1, 5, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1146, 1, 6, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1147, 1, 7, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1148, 1, 8, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1149, 1, 9, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1150, 1, 10, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1151, 1, 11, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1152, 1, 12, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1153, 1, 1, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1154, 1, 2, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1155, 1, 3, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1156, 1, 4, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1157, 1, 5, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1158, 1, 6, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1159, 1, 7, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1160, 1, 8, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1161, 1, 9, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1162, 1, 10, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1163, 1, 11, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1164, 1, 12, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1165, 1, 1, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1166, 1, 2, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1167, 1, 3, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1168, 1, 4, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1169, 1, 5, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1170, 1, 6, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1171, 1, 7, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1172, 1, 8, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1173, 1, 9, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1174, 1, 10, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1175, 1, 11, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1176, 1, 12, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1177, 1, 1, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1178, 1, 2, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1179, 1, 3, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1180, 1, 4, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1181, 1, 5, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1182, 1, 6, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1183, 1, 7, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1184, 1, 8, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1185, 1, 9, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1186, 1, 10, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1187, 1, 11, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1188, 1, 12, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1189, 1, 1, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1190, 1, 2, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1191, 1, 3, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1192, 1, 4, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1193, 1, 5, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1194, 1, 6, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1195, 1, 7, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1196, 1, 8, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1197, 1, 9, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1198, 1, 10, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1199, 1, 11, 18, 10)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1200, 1, 12, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1201, 2, 1, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1202, 2, 2, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1203, 2, 3, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1204, 2, 4, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1205, 2, 5, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1206, 2, 6, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1207, 2, 7, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1208, 2, 8, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1209, 2, 9, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1210, 2, 10, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1211, 2, 11, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1212, 2, 12, 9, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1213, 2, 1, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1214, 2, 2, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1215, 2, 3, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1216, 2, 4, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1217, 2, 5, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1218, 2, 6, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1219, 2, 7, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1220, 2, 8, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1221, 2, 9, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1222, 2, 10, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1223, 2, 11, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1224, 2, 12, 10, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1225, 2, 1, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1226, 2, 2, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1227, 2, 3, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1228, 2, 4, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1229, 2, 5, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1230, 2, 6, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1231, 2, 7, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1232, 2, 8, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1233, 2, 9, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1234, 2, 10, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1235, 2, 11, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1236, 2, 12, 11, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1237, 2, 1, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1238, 2, 2, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1239, 2, 3, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1240, 2, 4, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1241, 2, 5, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1242, 2, 6, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1243, 2, 7, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1244, 2, 8, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1245, 2, 9, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1246, 2, 10, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1247, 2, 11, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1248, 2, 12, 12, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1249, 2, 1, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1250, 2, 2, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1251, 2, 3, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1252, 2, 4, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1253, 2, 5, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1254, 2, 6, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1255, 2, 7, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1256, 2, 8, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1257, 2, 9, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1258, 2, 10, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1259, 2, 11, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1260, 2, 12, 13, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1261, 2, 1, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1262, 2, 2, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1263, 2, 3, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1264, 2, 4, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1265, 2, 5, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1266, 2, 6, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1267, 2, 7, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1268, 2, 8, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1269, 2, 9, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1270, 2, 10, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1271, 2, 11, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1272, 2, 12, 14, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1273, 2, 1, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1274, 2, 2, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1275, 2, 3, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1276, 2, 4, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1277, 2, 5, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1278, 2, 6, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1279, 2, 7, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1280, 2, 8, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1281, 2, 9, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1282, 2, 10, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1283, 2, 11, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1284, 2, 12, 15, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1285, 2, 1, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1286, 2, 2, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1287, 2, 3, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1288, 2, 4, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1289, 2, 5, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1290, 2, 6, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1291, 2, 7, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1292, 2, 8, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1293, 2, 9, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1294, 2, 10, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1295, 2, 11, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1296, 2, 12, 16, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1297, 2, 1, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1298, 2, 2, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1299, 2, 3, 17, 1)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1300, 2, 4, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1301, 2, 5, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1302, 2, 6, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1303, 2, 7, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1304, 2, 8, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1305, 2, 9, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1306, 2, 10, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1307, 2, 11, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1308, 2, 12, 17, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1309, 2, 1, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1310, 2, 2, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1311, 2, 3, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1312, 2, 4, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1313, 2, 5, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1314, 2, 6, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1315, 2, 7, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1316, 2, 8, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1317, 2, 9, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1318, 2, 10, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1319, 2, 11, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1320, 2, 12, 18, 1)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1321, 2, 1, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1322, 2, 2, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1323, 2, 3, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1324, 2, 4, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1325, 2, 5, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1326, 2, 6, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1327, 2, 7, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1328, 2, 8, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1329, 2, 9, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1330, 2, 10, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1331, 2, 11, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1332, 2, 12, 9, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1333, 2, 1, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1334, 2, 2, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1335, 2, 3, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1336, 2, 4, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1337, 2, 5, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1338, 2, 6, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1339, 2, 7, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1340, 2, 8, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1341, 2, 9, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1342, 2, 10, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1343, 2, 11, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1344, 2, 12, 10, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1345, 2, 1, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1346, 2, 2, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1347, 2, 3, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1348, 2, 4, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1349, 2, 5, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1350, 2, 6, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1351, 2, 7, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1352, 2, 8, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1353, 2, 9, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1354, 2, 10, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1355, 2, 11, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1356, 2, 12, 11, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1357, 2, 1, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1358, 2, 2, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1359, 2, 3, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1360, 2, 4, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1361, 2, 5, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1362, 2, 6, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1363, 2, 7, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1364, 2, 8, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1365, 2, 9, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1366, 2, 10, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1367, 2, 11, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1368, 2, 12, 12, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1369, 2, 1, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1370, 2, 2, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1371, 2, 3, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1372, 2, 4, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1373, 2, 5, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1374, 2, 6, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1375, 2, 7, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1376, 2, 8, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1377, 2, 9, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1378, 2, 10, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1379, 2, 11, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1380, 2, 12, 13, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1381, 2, 1, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1382, 2, 2, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1383, 2, 3, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1384, 2, 4, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1385, 2, 5, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1386, 2, 6, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1387, 2, 7, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1388, 2, 8, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1389, 2, 9, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1390, 2, 10, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1391, 2, 11, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1392, 2, 12, 14, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1393, 2, 1, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1394, 2, 2, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1395, 2, 3, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1396, 2, 4, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1397, 2, 5, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1398, 2, 6, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1399, 2, 7, 15, 2)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1400, 2, 8, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1401, 2, 9, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1402, 2, 10, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1403, 2, 11, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1404, 2, 12, 15, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1405, 2, 1, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1406, 2, 2, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1407, 2, 3, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1408, 2, 4, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1409, 2, 5, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1410, 2, 6, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1411, 2, 7, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1412, 2, 8, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1413, 2, 9, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1414, 2, 10, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1415, 2, 11, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1416, 2, 12, 16, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1417, 2, 1, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1418, 2, 2, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1419, 2, 3, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1420, 2, 4, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1421, 2, 5, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1422, 2, 6, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1423, 2, 7, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1424, 2, 8, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1425, 2, 9, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1426, 2, 10, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1427, 2, 11, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1428, 2, 12, 17, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1429, 2, 1, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1430, 2, 2, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1431, 2, 3, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1432, 2, 4, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1433, 2, 5, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1434, 2, 6, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1435, 2, 7, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1436, 2, 8, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1437, 2, 9, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1438, 2, 10, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1439, 2, 11, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1440, 2, 12, 18, 2)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1441, 2, 1, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1442, 2, 2, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1443, 2, 3, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1444, 2, 4, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1445, 2, 5, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1446, 2, 6, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1447, 2, 7, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1448, 2, 8, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1449, 2, 9, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1450, 2, 10, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1451, 2, 11, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1452, 2, 12, 9, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1453, 2, 1, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1454, 2, 2, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1455, 2, 3, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1456, 2, 4, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1457, 2, 5, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1458, 2, 6, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1459, 2, 7, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1460, 2, 8, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1461, 2, 9, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1462, 2, 10, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1463, 2, 11, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1464, 2, 12, 10, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1465, 2, 1, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1466, 2, 2, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1467, 2, 3, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1468, 2, 4, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1469, 2, 5, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1470, 2, 6, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1471, 2, 7, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1472, 2, 8, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1473, 2, 9, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1474, 2, 10, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1475, 2, 11, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1476, 2, 12, 11, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1477, 2, 1, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1478, 2, 2, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1479, 2, 3, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1480, 2, 4, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1481, 2, 5, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1482, 2, 6, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1483, 2, 7, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1484, 2, 8, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1485, 2, 9, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1486, 2, 10, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1487, 2, 11, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1488, 2, 12, 12, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1489, 2, 1, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1490, 2, 2, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1491, 2, 3, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1492, 2, 4, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1493, 2, 5, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1494, 2, 6, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1495, 2, 7, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1496, 2, 8, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1497, 2, 9, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1498, 2, 10, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1499, 2, 11, 13, 3)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1500, 2, 12, 13, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1501, 2, 1, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1502, 2, 2, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1503, 2, 3, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1504, 2, 4, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1505, 2, 5, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1506, 2, 6, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1507, 2, 7, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1508, 2, 8, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1509, 2, 9, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1510, 2, 10, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1511, 2, 11, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1512, 2, 12, 14, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1513, 2, 1, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1514, 2, 2, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1515, 2, 3, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1516, 2, 4, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1517, 2, 5, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1518, 2, 6, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1519, 2, 7, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1520, 2, 8, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1521, 2, 9, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1522, 2, 10, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1523, 2, 11, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1524, 2, 12, 15, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1525, 2, 1, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1526, 2, 2, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1527, 2, 3, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1528, 2, 4, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1529, 2, 5, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1530, 2, 6, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1531, 2, 7, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1532, 2, 8, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1533, 2, 9, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1534, 2, 10, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1535, 2, 11, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1536, 2, 12, 16, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1537, 2, 1, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1538, 2, 2, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1539, 2, 3, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1540, 2, 4, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1541, 2, 5, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1542, 2, 6, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1543, 2, 7, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1544, 2, 8, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1545, 2, 9, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1546, 2, 10, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1547, 2, 11, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1548, 2, 12, 17, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1549, 2, 1, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1550, 2, 2, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1551, 2, 3, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1552, 2, 4, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1553, 2, 5, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1554, 2, 6, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1555, 2, 7, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1556, 2, 8, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1557, 2, 9, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1558, 2, 10, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1559, 2, 11, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1560, 2, 12, 18, 3)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1561, 2, 1, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1562, 2, 2, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1563, 2, 3, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1564, 2, 4, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1565, 2, 5, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1566, 2, 6, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1567, 2, 7, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1568, 2, 8, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1569, 2, 9, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1570, 2, 10, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1571, 2, 11, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1572, 2, 12, 9, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1573, 2, 1, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1574, 2, 2, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1575, 2, 3, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1576, 2, 4, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1577, 2, 5, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1578, 2, 6, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1579, 2, 7, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1580, 2, 8, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1581, 2, 9, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1582, 2, 10, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1583, 2, 11, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1584, 2, 12, 10, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1585, 2, 1, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1586, 2, 2, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1587, 2, 3, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1588, 2, 4, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1589, 2, 5, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1590, 2, 6, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1591, 2, 7, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1592, 2, 8, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1593, 2, 9, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1594, 2, 10, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1595, 2, 11, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1596, 2, 12, 11, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1597, 2, 1, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1598, 2, 2, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1599, 2, 3, 12, 4)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1600, 2, 4, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1601, 2, 5, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1602, 2, 6, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1603, 2, 7, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1604, 2, 8, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1605, 2, 9, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1606, 2, 10, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1607, 2, 11, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1608, 2, 12, 12, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1609, 2, 1, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1610, 2, 2, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1611, 2, 3, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1612, 2, 4, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1613, 2, 5, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1614, 2, 6, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1615, 2, 7, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1616, 2, 8, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1617, 2, 9, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1618, 2, 10, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1619, 2, 11, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1620, 2, 12, 13, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1621, 2, 1, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1622, 2, 2, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1623, 2, 3, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1624, 2, 4, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1625, 2, 5, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1626, 2, 6, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1627, 2, 7, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1628, 2, 8, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1629, 2, 9, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1630, 2, 10, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1631, 2, 11, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1632, 2, 12, 14, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1633, 2, 1, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1634, 2, 2, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1635, 2, 3, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1636, 2, 4, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1637, 2, 5, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1638, 2, 6, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1639, 2, 7, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1640, 2, 8, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1641, 2, 9, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1642, 2, 10, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1643, 2, 11, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1644, 2, 12, 15, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1645, 2, 1, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1646, 2, 2, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1647, 2, 3, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1648, 2, 4, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1649, 2, 5, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1650, 2, 6, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1651, 2, 7, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1652, 2, 8, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1653, 2, 9, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1654, 2, 10, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1655, 2, 11, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1656, 2, 12, 16, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1657, 2, 1, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1658, 2, 2, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1659, 2, 3, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1660, 2, 4, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1661, 2, 5, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1662, 2, 6, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1663, 2, 7, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1664, 2, 8, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1665, 2, 9, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1666, 2, 10, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1667, 2, 11, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1668, 2, 12, 17, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1669, 2, 1, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1670, 2, 2, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1671, 2, 3, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1672, 2, 4, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1673, 2, 5, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1674, 2, 6, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1675, 2, 7, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1676, 2, 8, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1677, 2, 9, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1678, 2, 10, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1679, 2, 11, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1680, 2, 12, 18, 4)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1681, 2, 1, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1682, 2, 2, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1683, 2, 3, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1684, 2, 4, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1685, 2, 5, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1686, 2, 6, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1687, 2, 7, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1688, 2, 8, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1689, 2, 9, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1690, 2, 10, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1691, 2, 11, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1692, 2, 12, 9, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1693, 2, 1, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1694, 2, 2, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1695, 2, 3, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1696, 2, 4, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1697, 2, 5, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1698, 2, 6, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1699, 2, 7, 10, 5)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1700, 2, 8, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1701, 2, 9, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1702, 2, 10, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1703, 2, 11, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1704, 2, 12, 10, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1705, 2, 1, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1706, 2, 2, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1707, 2, 3, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1708, 2, 4, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1709, 2, 5, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1710, 2, 6, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1711, 2, 7, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1712, 2, 8, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1713, 2, 9, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1714, 2, 10, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1715, 2, 11, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1716, 2, 12, 11, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1717, 2, 1, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1718, 2, 2, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1719, 2, 3, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1720, 2, 4, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1721, 2, 5, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1722, 2, 6, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1723, 2, 7, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1724, 2, 8, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1725, 2, 9, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1726, 2, 10, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1727, 2, 11, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1728, 2, 12, 12, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1729, 2, 1, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1730, 2, 2, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1731, 2, 3, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1732, 2, 4, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1733, 2, 5, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1734, 2, 6, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1735, 2, 7, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1736, 2, 8, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1737, 2, 9, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1738, 2, 10, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1739, 2, 11, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1740, 2, 12, 13, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1741, 2, 1, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1742, 2, 2, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1743, 2, 3, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1744, 2, 4, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1745, 2, 5, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1746, 2, 6, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1747, 2, 7, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1748, 2, 8, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1749, 2, 9, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1750, 2, 10, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1751, 2, 11, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1752, 2, 12, 14, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1753, 2, 1, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1754, 2, 2, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1755, 2, 3, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1756, 2, 4, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1757, 2, 5, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1758, 2, 6, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1759, 2, 7, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1760, 2, 8, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1761, 2, 9, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1762, 2, 10, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1763, 2, 11, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1764, 2, 12, 15, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1765, 2, 1, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1766, 2, 2, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1767, 2, 3, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1768, 2, 4, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1769, 2, 5, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1770, 2, 6, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1771, 2, 7, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1772, 2, 8, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1773, 2, 9, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1774, 2, 10, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1775, 2, 11, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1776, 2, 12, 16, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1777, 2, 1, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1778, 2, 2, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1779, 2, 3, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1780, 2, 4, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1781, 2, 5, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1782, 2, 6, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1783, 2, 7, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1784, 2, 8, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1785, 2, 9, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1786, 2, 10, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1787, 2, 11, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1788, 2, 12, 17, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1789, 2, 1, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1790, 2, 2, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1791, 2, 3, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1792, 2, 4, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1793, 2, 5, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1794, 2, 6, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1795, 2, 7, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1796, 2, 8, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1797, 2, 9, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1798, 2, 10, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1799, 2, 11, 18, 5)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1800, 2, 12, 18, 5)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1801, 2, 1, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1802, 2, 2, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1803, 2, 3, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1804, 2, 4, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1805, 2, 5, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1806, 2, 6, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1807, 2, 7, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1808, 2, 8, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1809, 2, 9, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1810, 2, 10, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1811, 2, 11, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1812, 2, 12, 9, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1813, 2, 1, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1814, 2, 2, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1815, 2, 3, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1816, 2, 4, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1817, 2, 5, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1818, 2, 6, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1819, 2, 7, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1820, 2, 8, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1821, 2, 9, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1822, 2, 10, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1823, 2, 11, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1824, 2, 12, 10, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1825, 2, 1, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1826, 2, 2, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1827, 2, 3, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1828, 2, 4, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1829, 2, 5, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1830, 2, 6, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1831, 2, 7, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1832, 2, 8, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1833, 2, 9, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1834, 2, 10, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1835, 2, 11, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1836, 2, 12, 11, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1837, 2, 1, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1838, 2, 2, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1839, 2, 3, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1840, 2, 4, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1841, 2, 5, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1842, 2, 6, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1843, 2, 7, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1844, 2, 8, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1845, 2, 9, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1846, 2, 10, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1847, 2, 11, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1848, 2, 12, 12, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1849, 2, 1, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1850, 2, 2, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1851, 2, 3, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1852, 2, 4, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1853, 2, 5, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1854, 2, 6, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1855, 2, 7, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1856, 2, 8, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1857, 2, 9, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1858, 2, 10, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1859, 2, 11, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1860, 2, 12, 13, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1861, 2, 1, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1862, 2, 2, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1863, 2, 3, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1864, 2, 4, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1865, 2, 5, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1866, 2, 6, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1867, 2, 7, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1868, 2, 8, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1869, 2, 9, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1870, 2, 10, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1871, 2, 11, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1872, 2, 12, 14, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1873, 2, 1, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1874, 2, 2, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1875, 2, 3, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1876, 2, 4, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1877, 2, 5, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1878, 2, 6, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1879, 2, 7, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1880, 2, 8, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1881, 2, 9, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1882, 2, 10, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1883, 2, 11, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1884, 2, 12, 15, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1885, 2, 1, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1886, 2, 2, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1887, 2, 3, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1888, 2, 4, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1889, 2, 5, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1890, 2, 6, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1891, 2, 7, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1892, 2, 8, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1893, 2, 9, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1894, 2, 10, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1895, 2, 11, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1896, 2, 12, 16, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1897, 2, 1, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1898, 2, 2, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1899, 2, 3, 17, 6)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1900, 2, 4, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1901, 2, 5, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1902, 2, 6, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1903, 2, 7, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1904, 2, 8, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1905, 2, 9, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1906, 2, 10, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1907, 2, 11, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1908, 2, 12, 17, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1909, 2, 1, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1910, 2, 2, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1911, 2, 3, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1912, 2, 4, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1913, 2, 5, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1914, 2, 6, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1915, 2, 7, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1916, 2, 8, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1917, 2, 9, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1918, 2, 10, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1919, 2, 11, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1920, 2, 12, 18, 6)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1921, 2, 1, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1922, 2, 2, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1923, 2, 3, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1924, 2, 4, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1925, 2, 5, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1926, 2, 6, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1927, 2, 7, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1928, 2, 8, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1929, 2, 9, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1930, 2, 10, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1931, 2, 11, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1932, 2, 12, 9, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1933, 2, 1, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1934, 2, 2, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1935, 2, 3, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1936, 2, 4, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1937, 2, 5, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1938, 2, 6, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1939, 2, 7, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1940, 2, 8, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1941, 2, 9, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1942, 2, 10, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1943, 2, 11, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1944, 2, 12, 10, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1945, 2, 1, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1946, 2, 2, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1947, 2, 3, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1948, 2, 4, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1949, 2, 5, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1950, 2, 6, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1951, 2, 7, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1952, 2, 8, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1953, 2, 9, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1954, 2, 10, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1955, 2, 11, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1956, 2, 12, 11, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1957, 2, 1, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1958, 2, 2, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1959, 2, 3, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1960, 2, 4, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1961, 2, 5, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1962, 2, 6, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1963, 2, 7, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1964, 2, 8, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1965, 2, 9, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1966, 2, 10, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1967, 2, 11, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1968, 2, 12, 12, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1969, 2, 1, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1970, 2, 2, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1971, 2, 3, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1972, 2, 4, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1973, 2, 5, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1974, 2, 6, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1975, 2, 7, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1976, 2, 8, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1977, 2, 9, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1978, 2, 10, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1979, 2, 11, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1980, 2, 12, 13, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1981, 2, 1, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1982, 2, 2, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1983, 2, 3, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1984, 2, 4, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1985, 2, 5, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1986, 2, 6, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1987, 2, 7, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1988, 2, 8, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1989, 2, 9, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1990, 2, 10, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1991, 2, 11, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1992, 2, 12, 14, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1993, 2, 1, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1994, 2, 2, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1995, 2, 3, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1996, 2, 4, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1997, 2, 5, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1998, 2, 6, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (1999, 2, 7, 15, 7)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2000, 2, 8, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2001, 2, 9, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2002, 2, 10, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2003, 2, 11, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2004, 2, 12, 15, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2005, 2, 1, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2006, 2, 2, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2007, 2, 3, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2008, 2, 4, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2009, 2, 5, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2010, 2, 6, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2011, 2, 7, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2012, 2, 8, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2013, 2, 9, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2014, 2, 10, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2015, 2, 11, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2016, 2, 12, 16, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2017, 2, 1, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2018, 2, 2, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2019, 2, 3, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2020, 2, 4, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2021, 2, 5, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2022, 2, 6, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2023, 2, 7, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2024, 2, 8, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2025, 2, 9, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2026, 2, 10, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2027, 2, 11, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2028, 2, 12, 17, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2029, 2, 1, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2030, 2, 2, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2031, 2, 3, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2032, 2, 4, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2033, 2, 5, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2034, 2, 6, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2035, 2, 7, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2036, 2, 8, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2037, 2, 9, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2038, 2, 10, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2039, 2, 11, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2040, 2, 12, 18, 7)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2041, 2, 1, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2042, 2, 2, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2043, 2, 3, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2044, 2, 4, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2045, 2, 5, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2046, 2, 6, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2047, 2, 7, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2048, 2, 8, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2049, 2, 9, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2050, 2, 10, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2051, 2, 11, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2052, 2, 12, 9, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2053, 2, 1, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2054, 2, 2, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2055, 2, 3, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2056, 2, 4, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2057, 2, 5, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2058, 2, 6, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2059, 2, 7, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2060, 2, 8, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2061, 2, 9, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2062, 2, 10, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2063, 2, 11, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2064, 2, 12, 10, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2065, 2, 1, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2066, 2, 2, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2067, 2, 3, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2068, 2, 4, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2069, 2, 5, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2070, 2, 6, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2071, 2, 7, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2072, 2, 8, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2073, 2, 9, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2074, 2, 10, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2075, 2, 11, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2076, 2, 12, 11, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2077, 2, 1, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2078, 2, 2, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2079, 2, 3, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2080, 2, 4, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2081, 2, 5, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2082, 2, 6, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2083, 2, 7, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2084, 2, 8, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2085, 2, 9, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2086, 2, 10, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2087, 2, 11, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2088, 2, 12, 12, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2089, 2, 1, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2090, 2, 2, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2091, 2, 3, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2092, 2, 4, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2093, 2, 5, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2094, 2, 6, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2095, 2, 7, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2096, 2, 8, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2097, 2, 9, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2098, 2, 10, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2099, 2, 11, 13, 8)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2100, 2, 12, 13, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2101, 2, 1, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2102, 2, 2, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2103, 2, 3, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2104, 2, 4, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2105, 2, 5, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2106, 2, 6, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2107, 2, 7, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2108, 2, 8, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2109, 2, 9, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2110, 2, 10, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2111, 2, 11, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2112, 2, 12, 14, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2113, 2, 1, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2114, 2, 2, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2115, 2, 3, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2116, 2, 4, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2117, 2, 5, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2118, 2, 6, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2119, 2, 7, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2120, 2, 8, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2121, 2, 9, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2122, 2, 10, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2123, 2, 11, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2124, 2, 12, 15, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2125, 2, 1, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2126, 2, 2, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2127, 2, 3, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2128, 2, 4, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2129, 2, 5, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2130, 2, 6, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2131, 2, 7, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2132, 2, 8, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2133, 2, 9, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2134, 2, 10, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2135, 2, 11, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2136, 2, 12, 16, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2137, 2, 1, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2138, 2, 2, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2139, 2, 3, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2140, 2, 4, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2141, 2, 5, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2142, 2, 6, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2143, 2, 7, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2144, 2, 8, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2145, 2, 9, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2146, 2, 10, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2147, 2, 11, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2148, 2, 12, 17, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2149, 2, 1, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2150, 2, 2, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2151, 2, 3, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2152, 2, 4, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2153, 2, 5, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2154, 2, 6, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2155, 2, 7, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2156, 2, 8, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2157, 2, 9, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2158, 2, 10, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2159, 2, 11, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2160, 2, 12, 18, 8)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2161, 2, 1, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2162, 2, 2, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2163, 2, 3, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2164, 2, 4, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2165, 2, 5, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2166, 2, 6, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2167, 2, 7, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2168, 2, 8, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2169, 2, 9, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2170, 2, 10, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2171, 2, 11, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2172, 2, 12, 9, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2173, 2, 1, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2174, 2, 2, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2175, 2, 3, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2176, 2, 4, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2177, 2, 5, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2178, 2, 6, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2179, 2, 7, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2180, 2, 8, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2181, 2, 9, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2182, 2, 10, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2183, 2, 11, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2184, 2, 12, 10, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2185, 2, 1, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2186, 2, 2, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2187, 2, 3, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2188, 2, 4, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2189, 2, 5, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2190, 2, 6, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2191, 2, 7, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2192, 2, 8, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2193, 2, 9, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2194, 2, 10, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2195, 2, 11, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2196, 2, 12, 11, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2197, 2, 1, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2198, 2, 2, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2199, 2, 3, 12, 9)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2200, 2, 4, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2201, 2, 5, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2202, 2, 6, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2203, 2, 7, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2204, 2, 8, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2205, 2, 9, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2206, 2, 10, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2207, 2, 11, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2208, 2, 12, 12, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2209, 2, 1, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2210, 2, 2, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2211, 2, 3, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2212, 2, 4, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2213, 2, 5, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2214, 2, 6, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2215, 2, 7, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2216, 2, 8, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2217, 2, 9, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2218, 2, 10, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2219, 2, 11, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2220, 2, 12, 13, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2221, 2, 1, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2222, 2, 2, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2223, 2, 3, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2224, 2, 4, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2225, 2, 5, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2226, 2, 6, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2227, 2, 7, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2228, 2, 8, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2229, 2, 9, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2230, 2, 10, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2231, 2, 11, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2232, 2, 12, 14, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2233, 2, 1, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2234, 2, 2, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2235, 2, 3, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2236, 2, 4, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2237, 2, 5, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2238, 2, 6, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2239, 2, 7, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2240, 2, 8, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2241, 2, 9, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2242, 2, 10, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2243, 2, 11, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2244, 2, 12, 15, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2245, 2, 1, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2246, 2, 2, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2247, 2, 3, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2248, 2, 4, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2249, 2, 5, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2250, 2, 6, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2251, 2, 7, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2252, 2, 8, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2253, 2, 9, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2254, 2, 10, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2255, 2, 11, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2256, 2, 12, 16, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2257, 2, 1, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2258, 2, 2, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2259, 2, 3, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2260, 2, 4, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2261, 2, 5, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2262, 2, 6, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2263, 2, 7, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2264, 2, 8, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2265, 2, 9, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2266, 2, 10, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2267, 2, 11, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2268, 2, 12, 17, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2269, 2, 1, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2270, 2, 2, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2271, 2, 3, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2272, 2, 4, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2273, 2, 5, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2274, 2, 6, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2275, 2, 7, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2276, 2, 8, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2277, 2, 9, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2278, 2, 10, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2279, 2, 11, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2280, 2, 12, 18, 9)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2281, 2, 1, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2282, 2, 2, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2283, 2, 3, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2284, 2, 4, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2285, 2, 5, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2286, 2, 6, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2287, 2, 7, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2288, 2, 8, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2289, 2, 9, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2290, 2, 10, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2291, 2, 11, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2292, 2, 12, 9, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2293, 2, 1, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2294, 2, 2, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2295, 2, 3, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2296, 2, 4, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2297, 2, 5, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2298, 2, 6, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2299, 2, 7, 10, 10)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2300, 2, 8, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2301, 2, 9, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2302, 2, 10, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2303, 2, 11, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2304, 2, 12, 10, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2305, 2, 1, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2306, 2, 2, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2307, 2, 3, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2308, 2, 4, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2309, 2, 5, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2310, 2, 6, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2311, 2, 7, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2312, 2, 8, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2313, 2, 9, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2314, 2, 10, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2315, 2, 11, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2316, 2, 12, 11, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2317, 2, 1, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2318, 2, 2, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2319, 2, 3, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2320, 2, 4, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2321, 2, 5, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2322, 2, 6, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2323, 2, 7, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2324, 2, 8, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2325, 2, 9, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2326, 2, 10, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2327, 2, 11, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2328, 2, 12, 12, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2329, 2, 1, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2330, 2, 2, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2331, 2, 3, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2332, 2, 4, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2333, 2, 5, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2334, 2, 6, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2335, 2, 7, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2336, 2, 8, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2337, 2, 9, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2338, 2, 10, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2339, 2, 11, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2340, 2, 12, 13, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2341, 2, 1, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2342, 2, 2, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2343, 2, 3, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2344, 2, 4, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2345, 2, 5, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2346, 2, 6, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2347, 2, 7, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2348, 2, 8, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2349, 2, 9, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2350, 2, 10, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2351, 2, 11, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2352, 2, 12, 14, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2353, 2, 1, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2354, 2, 2, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2355, 2, 3, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2356, 2, 4, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2357, 2, 5, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2358, 2, 6, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2359, 2, 7, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2360, 2, 8, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2361, 2, 9, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2362, 2, 10, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2363, 2, 11, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2364, 2, 12, 15, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2365, 2, 1, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2366, 2, 2, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2367, 2, 3, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2368, 2, 4, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2369, 2, 5, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2370, 2, 6, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2371, 2, 7, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2372, 2, 8, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2373, 2, 9, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2374, 2, 10, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2375, 2, 11, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2376, 2, 12, 16, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2377, 2, 1, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2378, 2, 2, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2379, 2, 3, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2380, 2, 4, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2381, 2, 5, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2382, 2, 6, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2383, 2, 7, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2384, 2, 8, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2385, 2, 9, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2386, 2, 10, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2387, 2, 11, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2388, 2, 12, 17, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2389, 2, 1, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2390, 2, 2, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2391, 2, 3, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2392, 2, 4, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2393, 2, 5, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2394, 2, 6, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2395, 2, 7, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2396, 2, 8, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2397, 2, 9, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2398, 2, 10, 18, 10)
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2399, 2, 11, 18, 10)
GO
INSERT [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki], [ID_Pietra], [ID_Pokoju], [ID_Rzedu], [ID_Regalu]) VALUES (2400, 2, 12, 18, 10)
SET IDENTITY_INSERT [dbo].[Miejsca_Ksiazek] OFF
GO
SET IDENTITY_INSERT [dbo].[Miejsca_odbioru] ON 

INSERT [dbo].[Miejsca_odbioru] ([ID_Miejsce_odbioru], [Miejsce_odbioru]) VALUES (3, N'Czytelnia czasopism')
INSERT [dbo].[Miejsca_odbioru] ([ID_Miejsce_odbioru], [Miejsce_odbioru]) VALUES (2, N'Czytelnia główna')
INSERT [dbo].[Miejsca_odbioru] ([ID_Miejsce_odbioru], [Miejsce_odbioru]) VALUES (1, N'Wypozyczalnia')
SET IDENTITY_INSERT [dbo].[Miejsca_odbioru] OFF
GO
SET IDENTITY_INSERT [dbo].[Okladki] ON 

INSERT [dbo].[Okladki] ([ID_Okladki], [Okladki]) VALUES (2, N'Miękka')
INSERT [dbo].[Okladki] ([ID_Okladki], [Okladki]) VALUES (3, N'Pudełko CD')
INSERT [dbo].[Okladki] ([ID_Okladki], [Okladki]) VALUES (1, N'Twarda')
SET IDENTITY_INSERT [dbo].[Okladki] OFF
GO
SET IDENTITY_INSERT [dbo].[Pietra] ON 

INSERT [dbo].[Pietra] ([ID_Pietra], [Pietro]) VALUES (1, 1)
INSERT [dbo].[Pietra] ([ID_Pietra], [Pietro]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Pietra] OFF
GO
SET IDENTITY_INSERT [dbo].[Platnosci] ON 

INSERT [dbo].[Platnosci] ([ID_Platnosci], [Data_wplaty], [Kwota_wplaty], [Pracownik]) VALUES (1, CAST(N'2021-04-20' AS Date), 2.0000, 10000001)
INSERT [dbo].[Platnosci] ([ID_Platnosci], [Data_wplaty], [Kwota_wplaty], [Pracownik]) VALUES (2, CAST(N'2021-04-20' AS Date), 3.0000, 10000001)
SET IDENTITY_INSERT [dbo].[Platnosci] OFF
GO
SET IDENTITY_INSERT [dbo].[Pokoje] ON 

INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (1, N'101  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (2, N'102  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (3, N'103  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (4, N'104  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (5, N'105  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (6, N'106  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (7, N'201  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (8, N'202  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (9, N'203  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (10, N'204  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (11, N'205  ')
INSERT [dbo].[Pokoje] ([ID_Pokoju], [Pokoj]) VALUES (12, N'206  ')
SET IDENTITY_INSERT [dbo].[Pokoje] OFF
GO
SET IDENTITY_INSERT [dbo].[Regaly] ON 

INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (1, N'A    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (2, N'B    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (3, N'C    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (4, N'D    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (5, N'E    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (6, N'F    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (7, N'G    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (8, N'H    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (9, N'I    ')
INSERT [dbo].[Regaly] ([ID_Regalu], [Regal]) VALUES (10, N'J    ')
SET IDENTITY_INSERT [dbo].[Regaly] OFF
GO
SET IDENTITY_INSERT [dbo].[Rodzaj_wykorzystania] ON 

INSERT [dbo].[Rodzaj_wykorzystania] ([ID_Rodzaj_wykorzystania], [Rodzaj_wykorzystania]) VALUES (1, N'Do wypożyczenia')
INSERT [dbo].[Rodzaj_wykorzystania] ([ID_Rodzaj_wykorzystania], [Rodzaj_wykorzystania]) VALUES (2, N'Na miejscu')
SET IDENTITY_INSERT [dbo].[Rodzaj_wykorzystania] OFF
GO
SET IDENTITY_INSERT [dbo].[Rodzaje_adresow] ON 

INSERT [dbo].[Rodzaje_adresow] ([ID_Rodzaj_adresu], [Rodzaj_adresu]) VALUES (1, N'Korespondencyjny')
INSERT [dbo].[Rodzaje_adresow] ([ID_Rodzaj_adresu], [Rodzaj_adresu]) VALUES (2, N'Zameldowania')
INSERT [dbo].[Rodzaje_adresow] ([ID_Rodzaj_adresu], [Rodzaj_adresu]) VALUES (3, N'Zamieszkania')
SET IDENTITY_INSERT [dbo].[Rodzaje_adresow] OFF
GO
SET IDENTITY_INSERT [dbo].[Rodzaje_publikacji] ON 

INSERT [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji], [Rodzaj], [ID_Format], [ID_Okladki]) VALUES (1, N'Ksiazka', 1, 1)
INSERT [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji], [Rodzaj], [ID_Format], [ID_Okladki]) VALUES (2, N'Ksiazka', 1, 2)
INSERT [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji], [Rodzaj], [ID_Format], [ID_Okladki]) VALUES (3, N'Audiobook', 4, 3)
INSERT [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji], [Rodzaj], [ID_Format], [ID_Okladki]) VALUES (4, N'Ksiazka', 2, 1)
INSERT [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji], [Rodzaj], [ID_Format], [ID_Okladki]) VALUES (5, N'Ksiazka', 2, 2)
SET IDENTITY_INSERT [dbo].[Rodzaje_publikacji] OFF
GO
SET IDENTITY_INSERT [dbo].[Role_Autorow] ON 

INSERT [dbo].[Role_Autorow] ([ID_Rola_autora], [Rola_autora]) VALUES (1, N'Autor')
INSERT [dbo].[Role_Autorow] ([ID_Rola_autora], [Rola_autora]) VALUES (3, N'Tłumacz')
INSERT [dbo].[Role_Autorow] ([ID_Rola_autora], [Rola_autora]) VALUES (2, N'Współałtor')
SET IDENTITY_INSERT [dbo].[Role_Autorow] OFF
GO
SET IDENTITY_INSERT [dbo].[Rzedy_regalow] ON 

INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (9, N'I    ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (10, N'II   ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (11, N'III  ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (12, N'IV   ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (17, N'IX   ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (13, N'V    ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (14, N'VI   ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (15, N'VII  ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (16, N'VIII ')
INSERT [dbo].[Rzedy_regalow] ([ID_Rzedu], [Rzad]) VALUES (18, N'X    ')
SET IDENTITY_INSERT [dbo].[Rzedy_regalow] OFF
GO
SET IDENTITY_INSERT [dbo].[Stany_Ksiazek] ON 

INSERT [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki], [Stan_ksiazki]) VALUES (4, N'Do utylizacji')
INSERT [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki], [Stan_ksiazki]) VALUES (3, N'Dobry')
INSERT [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki], [Stan_ksiazki]) VALUES (1, N'Idealny')
INSERT [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki], [Stan_ksiazki]) VALUES (2, N'Uszkodzony')
SET IDENTITY_INSERT [dbo].[Stany_Ksiazek] OFF
GO
SET IDENTITY_INSERT [dbo].[Statusy_kar] ON 

INSERT [dbo].[Statusy_kar] ([ID_Status_kary], [Status_kary]) VALUES (1, N'Do zapłaty')
INSERT [dbo].[Statusy_kar] ([ID_Status_kary], [Status_kary]) VALUES (3, N'Opłacona')
INSERT [dbo].[Statusy_kar] ([ID_Status_kary], [Status_kary]) VALUES (2, N'Opłacona częściowo')
SET IDENTITY_INSERT [dbo].[Statusy_kar] OFF
GO
SET IDENTITY_INSERT [dbo].[Statusy_Ksiazek] ON 

INSERT [dbo].[Statusy_Ksiazek] ([ID_Statusu_Ksiazki], [Status_Ksiazki]) VALUES (2, N'Do korzystania na miejscu')
INSERT [dbo].[Statusy_Ksiazek] ([ID_Statusu_Ksiazki], [Status_Ksiazki]) VALUES (1, N'Do wypozyczenia')
INSERT [dbo].[Statusy_Ksiazek] ([ID_Statusu_Ksiazki], [Status_Ksiazki]) VALUES (3, N'Wypożyczona')
SET IDENTITY_INSERT [dbo].[Statusy_Ksiazek] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefony] ON 

INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (1, 32, 5968478, 48, 569874562)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (2, NULL, NULL, 48, 153697252)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (3, NULL, 5618475, 48, 556984258)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (4, 32, 2815698, NULL, NULL)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (5, 32, 2657412, NULL, 254123651)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (6, 32, 5565251, 48, 142536981)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (7, 32, 2364785, 48, 325748962)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (8, NULL, NULL, NULL, 569852636)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (9, 32, 5421368, 48, 562369859)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (10, NULL, NULL, 48, 584265321)
INSERT [dbo].[Telefony] ([ID_Tel], [Kierunkowy_stacjonarny], [Stacjonarny], [Kierunkowy_kom], [Komorkowy]) VALUES (12, 32, 3263252, 48, 655256655)
SET IDENTITY_INSERT [dbo].[Telefony] OFF
GO
SET IDENTITY_INSERT [dbo].[Typy_uzytkownikow] ON 

INSERT [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika], [Typ_uzytkownika]) VALUES (5, N'Obcokrajowiec')
INSERT [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika], [Typ_uzytkownika]) VALUES (1, N'Pracownik biblioteki')
INSERT [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika], [Typ_uzytkownika]) VALUES (4, N'Pracownik naukowy')
INSERT [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika], [Typ_uzytkownika]) VALUES (3, N'Student')
INSERT [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika], [Typ_uzytkownika]) VALUES (2, N'Użytkownik')
SET IDENTITY_INSERT [dbo].[Typy_uzytkownikow] OFF
GO
SET IDENTITY_INSERT [dbo].[Uzytkownicy] ON 

INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000001, N'Piotr', N'Kargul', N'pk@wp.pl', 1, 1, CAST(N'2020-01-25' AS Date), NULL, 1)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000002, N'Marta', N'Mich', N'mm@gmail.com', 1, 1, CAST(N'2020-02-01' AS Date), NULL, 1)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000012, N'Wojciech', N'Mich', N'wm@gmail.com', 1, 1, CAST(N'2020-02-05' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000013, N'Jakub', N'Ptak', N'jp@op.pl', 2, 2, CAST(N'2020-02-06' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000014, N'Anna', N'Green', N'ag@gmail.com', 3, 3, CAST(N'2020-02-06' AS Date), NULL, 5)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000015, N'Maria', N'Wilk', N'mw@op.pl', 4, 4, CAST(N'2020-02-08' AS Date), NULL, 1)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000016, N'Marek', N'Żbik', N'mz@wp.pl', 5, 5, CAST(N'2020-02-15' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000017, N'Paweł', N'Nowak', N'pn@wp.pl', 6, 6, CAST(N'2020-02-15' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000018, N'Karolina', N'Nowak', N'kn@gmail.com', 7, 7, CAST(N'2020-02-25' AS Date), NULL, 3)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000019, N'Marzena', N'Kaja', N'mk@op.pl', 7, 8, CAST(N'2020-03-10' AS Date), NULL, 4)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000020, N'Tadeusz', N'Ptak', N'pk@op.pl', 2, 10, CAST(N'2020-03-21' AS Date), NULL, 1)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000022, N'Tadeusz', N'Ptak', N'pk@op.pl', 2, 10, CAST(N'2021-05-25' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000023, N'Monika', N'Mira', N'mira@wp.pl', 10, 5, CAST(N'2021-05-25' AS Date), NULL, 2)
INSERT [dbo].[Uzytkownicy] ([Login], [Imie], [Nazwisko], [email], [ID_Adres], [ID_Tel], [Data_zapisu], [Data_wypisu], [ID_Typ_uzytkownika]) VALUES (10000024, N'Marcin', N'Kier', N'markier@wp.pl', 11, 4, CAST(N'2021-05-25' AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[Uzytkownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Wydawnictwa] ON 

INSERT [dbo].[Wydawnictwa] ([ID_Wydawnictwo], [Wydawnictwo], [Wydawnictwo_Nazwa_skrocona]) VALUES (1, N'Lublin : Fabryka Słów', NULL)
INSERT [dbo].[Wydawnictwa] ([ID_Wydawnictwo], [Wydawnictwo], [Wydawnictwo_Nazwa_skrocona]) VALUES (2, N'Kraków : Zielona Sowa', NULL)
INSERT [dbo].[Wydawnictwa] ([ID_Wydawnictwo], [Wydawnictwo], [Wydawnictwo_Nazwa_skrocona]) VALUES (3, N'Warszawa : "Labos"', NULL)
INSERT [dbo].[Wydawnictwa] ([ID_Wydawnictwo], [Wydawnictwo], [Wydawnictwo_Nazwa_skrocona]) VALUES (4, N'Warszawa: Prószyński i S-ka', NULL)
SET IDENTITY_INSERT [dbo].[Wydawnictwa] OFF
GO
SET IDENTITY_INSERT [dbo].[Wypozyczenia] ON 

INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (1, 1, 10000012, 10000001, 1, 1, 1, 1, 1)
INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (2, 4, 10000013, 10000001, 1, 1, 2, 2, 2)
INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (3, 5, 10000018, 10000001, 1, 1, 3, 3, 3)
INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (4, 8, 10000020, 10000015, 1, 1, 4, 4, 2)
INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (5, 10, 10000018, 10000015, 1, 1, 4, 4, 1)
INSERT [dbo].[Wypozyczenia] ([ID_Wypozyczenia], [ID_Ksiazki], [Wypożyczający], [Pracownik], [ID_Miejsce_odbioru], [ID_Rodzaj_wykorzystania], [ID_Data_rezerwacji], [ID_Data_wypozyczenia], [ID_Stanu_ksiazki]) VALUES (6, 3, 10000018, 10000015, 1, 1, 4, 4, 2)
SET IDENTITY_INSERT [dbo].[Wypozyczenia] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Formaty_Wielkosc]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Formaty] ADD  CONSTRAINT [UX_Formaty_Wielkosc] UNIQUE NONCLUSTERED 
(
	[Wielkosc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Gatunki_Gatunek]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Gatunki] ADD  CONSTRAINT [UX_Gatunki_Gatunek] UNIQUE NONCLUSTERED 
(
	[Gatunek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Jezyki__444ED2F99D2173F1]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Jezyki] ADD UNIQUE NONCLUSTERED 
(
	[Jezyk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Kraje__7500D1DBC9A16010]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Kraje] ADD UNIQUE NONCLUSTERED 
(
	[Kraj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Miejsca_odbioru_Miejsce_odbioru]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Miejsca_odbioru] ADD  CONSTRAINT [UX_Miejsca_odbioru_Miejsce_odbioru] UNIQUE NONCLUSTERED 
(
	[Miejsce_odbioru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Okladki_Okladki]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Okladki] ADD  CONSTRAINT [UX_Okladki_Okladki] UNIQUE NONCLUSTERED 
(
	[Okladki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_Pietra_Pietro]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Pietra] ADD  CONSTRAINT [UX_Pietra_Pietro] UNIQUE NONCLUSTERED 
(
	[Pietro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Pokoje_Pokoj]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Pokoje] ADD  CONSTRAINT [UX_Pokoje_Pokoj] UNIQUE NONCLUSTERED 
(
	[Pokoj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Regaly__2C6F1F830847F92C]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Regaly] ADD  CONSTRAINT [UQ__Regaly__2C6F1F830847F92C] UNIQUE NONCLUSTERED 
(
	[Regal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Rodzaj_wykorzystania_Rodzaj_wykorzystania]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Rodzaj_wykorzystania] ADD  CONSTRAINT [UX_Rodzaj_wykorzystania_Rodzaj_wykorzystania] UNIQUE NONCLUSTERED 
(
	[Rodzaj_wykorzystania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Rodzaje_adresow_Rodzaj_adresu]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Rodzaje_adresow] ADD  CONSTRAINT [UX_Rodzaje_adresow_Rodzaj_adresu] UNIQUE NONCLUSTERED 
(
	[Rodzaj_adresu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Role_autorow_Rola_autora]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Role_Autorow] ADD  CONSTRAINT [UX_Role_autorow_Rola_autora] UNIQUE NONCLUSTERED 
(
	[Rola_autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Rzedy_re__D51FE90E2480DA61]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Rzedy_regalow] ADD  CONSTRAINT [UQ__Rzedy_re__D51FE90E2480DA61] UNIQUE NONCLUSTERED 
(
	[Rzad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Stany_ksiazek_Stan_ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Stany_Ksiazek] ADD  CONSTRAINT [UX_Stany_ksiazek_Stan_ksiazki] UNIQUE NONCLUSTERED 
(
	[Stan_ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Statusy_kar_Status_kary]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Statusy_kar] ADD  CONSTRAINT [UX_Statusy_kar_Status_kary] UNIQUE NONCLUSTERED 
(
	[Status_kary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Statusy_ksiazek_Status_ksiazki]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Statusy_Ksiazek] ADD  CONSTRAINT [UX_Statusy_ksiazek_Status_ksiazki] UNIQUE NONCLUSTERED 
(
	[Status_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Typy_uzytkownikow_Typ_uzytkownika]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Typy_uzytkownikow] ADD  CONSTRAINT [UX_Typy_uzytkownikow_Typ_uzytkownika] UNIQUE NONCLUSTERED 
(
	[Typ_uzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_Wydawnictwa_Wydawnictwo]    Script Date: 25.05.2021 22:21:01 ******/
ALTER TABLE [dbo].[Wydawnictwa] ADD  CONSTRAINT [UX_Wydawnictwa_Wydawnictwo] UNIQUE NONCLUSTERED 
(
	[Wydawnictwo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Daty_rezerwacji] ADD  CONSTRAINT [DF_Daty_rezerwacji_Data_rezerwacji]  DEFAULT (getdate()) FOR [Data_rezerwacji]
GO
ALTER TABLE [dbo].[Daty_wypozyczen] ADD  CONSTRAINT [DF_Daty_wypozyczen_Data_wypozyczenia]  DEFAULT (getdate()) FOR [Data_wypozyczenia]
GO
ALTER TABLE [dbo].[Ksiazki] ADD  CONSTRAINT [DF_Ksiazki_ID_Kraju]  DEFAULT ((1)) FOR [ID_Kraju]
GO
ALTER TABLE [dbo].[Ksiazki] ADD  CONSTRAINT [DF_Ksiazki_ID_Jezyk]  DEFAULT ((1)) FOR [ID_Jezyk]
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy] ADD  CONSTRAINT [DF_Ksiazki_Autorzy_ID_Rola_autora]  DEFAULT ((1)) FOR [ID_Rola_autora]
GO
ALTER TABLE [dbo].[Logowania] ADD  CONSTRAINT [DF_Logowania_Data_logowania]  DEFAULT (getdate()) FOR [Data_logowania]
GO
ALTER TABLE [dbo].[Nowe_Ksiazki] ADD  CONSTRAINT [DF_Nowe_Ksiazki_Data_zakupu]  DEFAULT (getdate()) FOR [Data_zakupu]
GO
ALTER TABLE [dbo].[Nowe_Ksiazki] ADD  CONSTRAINT [DF_Nowe_Ksiazki_Cena_zakupu]  DEFAULT ((0)) FOR [Cena_zakupu]
GO
ALTER TABLE [dbo].[Platnosci] ADD  CONSTRAINT [DF_Platnosci_Data_wplaty]  DEFAULT (getdate()) FOR [Data_wplaty]
GO
ALTER TABLE [dbo].[Telefony] ADD  CONSTRAINT [DF_Telefony_Kierunkowy_kom]  DEFAULT ((48)) FOR [Kierunkowy_kom]
GO
ALTER TABLE [dbo].[Uzytkownicy] ADD  CONSTRAINT [DF_Uzytkownicy_Data_zapisu]  DEFAULT (getdate()) FOR [Data_zapisu]
GO
ALTER TABLE [dbo].[Wypozyczenia] ADD  CONSTRAINT [DF_Wypozyczenia_ID_Miejsce_odbioru]  DEFAULT ((1)) FOR [ID_Miejsce_odbioru]
GO
ALTER TABLE [dbo].[Adresy]  WITH CHECK ADD  CONSTRAINT [FK__Adresy__ID_Miasta] FOREIGN KEY([ID_Miasta])
REFERENCES [dbo].[Miasta] ([ID_Miasta])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Adresy] CHECK CONSTRAINT [FK__Adresy__ID_Miasta]
GO
ALTER TABLE [dbo].[Adresy]  WITH CHECK ADD  CONSTRAINT [FK_Adresy_ID_Rodzaj_adresu] FOREIGN KEY([ID_Rodzaj_adresu])
REFERENCES [dbo].[Rodzaje_adresow] ([ID_Rodzaj_adresu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Adresy] CHECK CONSTRAINT [FK_Adresy_ID_Rodzaj_adresu]
GO
ALTER TABLE [dbo].[Gatunki_Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK_Gatunki_Ksiazki_ID_Gatunek] FOREIGN KEY([ID_Gatunek])
REFERENCES [dbo].[Gatunki] ([ID_Gatunek])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gatunki_Ksiazki] CHECK CONSTRAINT [FK_Gatunki_Ksiazki_ID_Gatunek]
GO
ALTER TABLE [dbo].[Gatunki_Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK_Gatunki_Ksiazki_ID_Ksiazki] FOREIGN KEY([ID_Ksiazki])
REFERENCES [dbo].[Ksiazki] ([ID_Ksiazki])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gatunki_Ksiazki] CHECK CONSTRAINT [FK_Gatunki_Ksiazki_ID_Ksiazki]
GO
ALTER TABLE [dbo].[Hasla]  WITH CHECK ADD  CONSTRAINT [FK__Hasla__Login] FOREIGN KEY([Login])
REFERENCES [dbo].[Uzytkownicy] ([Login])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hasla] CHECK CONSTRAINT [FK__Hasla__Login]
GO
ALTER TABLE [dbo].[Kary]  WITH CHECK ADD  CONSTRAINT [FK_Kary_ID_Platnosci] FOREIGN KEY([ID_Platnosci])
REFERENCES [dbo].[Platnosci] ([ID_Platnosci])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Kary] CHECK CONSTRAINT [FK_Kary_ID_Platnosci]
GO
ALTER TABLE [dbo].[Kary]  WITH CHECK ADD  CONSTRAINT [FK_Kary_ID_Status_kary] FOREIGN KEY([ID_Status_kary])
REFERENCES [dbo].[Statusy_kar] ([ID_Status_kary])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Kary] CHECK CONSTRAINT [FK_Kary_ID_Status_kary]
GO
ALTER TABLE [dbo].[Kary]  WITH CHECK ADD  CONSTRAINT [FK_Kary_ID_Wypozyczenia] FOREIGN KEY([ID_Kary])
REFERENCES [dbo].[Wypozyczenia] ([ID_Wypozyczenia])
GO
ALTER TABLE [dbo].[Kary] CHECK CONSTRAINT [FK_Kary_ID_Wypozyczenia]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki__ID_Miejsce_Ksiazki] FOREIGN KEY([ID_Miejsce_Ksiazki])
REFERENCES [dbo].[Miejsca_Ksiazek] ([ID_Miejsce_Ksiazki])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki__ID_Miejsce_Ksiazki]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki__ID_Rodzaj_publikacji] FOREIGN KEY([ID_Rodzaj_publikacji])
REFERENCES [dbo].[Rodzaje_publikacji] ([ID_Rodzaj_publikacji])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki__ID_Rodzaj_publikacji]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki__ID_Stanu_Ksiazki] FOREIGN KEY([ID_Stanu_Ksiazki])
REFERENCES [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki__ID_Stanu_Ksiazki]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki__ID_Statusu_Ksiazki] FOREIGN KEY([ID_Statusu_Ksiazki])
REFERENCES [dbo].[Statusy_Ksiazek] ([ID_Statusu_Ksiazki])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki__ID_Statusu_Ksiazki]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_ID_Jezyk] FOREIGN KEY([ID_Jezyk])
REFERENCES [dbo].[Jezyki] ([ID_Jezyk])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki_ID_Jezyk]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_ID_Kraju] FOREIGN KEY([ID_Kraju])
REFERENCES [dbo].[Kraje] ([ID_Kraju])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki_ID_Kraju]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_ID_Wydawnictwo] FOREIGN KEY([ID_Wydawnictwo])
REFERENCES [dbo].[Wydawnictwa] ([ID_Wydawnictwo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [FK__Ksiazki_ID_Wydawnictwo]
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_Autorzy__ID_Autora] FOREIGN KEY([ID_Autora])
REFERENCES [dbo].[Autorzy] ([ID_Autora])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy] CHECK CONSTRAINT [FK__Ksiazki_Autorzy__ID_Autora]
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_Autorzy__ID_Rola_autora] FOREIGN KEY([ID_Rola_autora])
REFERENCES [dbo].[Role_Autorow] ([ID_Rola_autora])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy] CHECK CONSTRAINT [FK__Ksiazki_Autorzy__ID_Rola_autora]
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy]  WITH CHECK ADD  CONSTRAINT [FK__Ksiazki_Autorzy_ID_Ksiazki] FOREIGN KEY([ID_Ksiazki])
REFERENCES [dbo].[Ksiazki] ([ID_Ksiazki])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ksiazki_Autorzy] CHECK CONSTRAINT [FK__Ksiazki_Autorzy_ID_Ksiazki]
GO
ALTER TABLE [dbo].[Logowania]  WITH CHECK ADD  CONSTRAINT [FK__Logowania__Login] FOREIGN KEY([Login])
REFERENCES [dbo].[Uzytkownicy] ([Login])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Logowania] CHECK CONSTRAINT [FK__Logowania__Login]
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek]  WITH CHECK ADD  CONSTRAINT [FK_Miejsca_ksiazek_ID_Pietra] FOREIGN KEY([ID_Pietra])
REFERENCES [dbo].[Pietra] ([ID_Pietra])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek] CHECK CONSTRAINT [FK_Miejsca_ksiazek_ID_Pietra]
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek]  WITH CHECK ADD  CONSTRAINT [FK_Miejsca_ksiazek_ID_Pokoju] FOREIGN KEY([ID_Pokoju])
REFERENCES [dbo].[Pokoje] ([ID_Pokoju])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek] CHECK CONSTRAINT [FK_Miejsca_ksiazek_ID_Pokoju]
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek]  WITH CHECK ADD  CONSTRAINT [FK_Miejsca_ksiazek_ID_Regalu] FOREIGN KEY([ID_Regalu])
REFERENCES [dbo].[Regaly] ([ID_Regalu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek] CHECK CONSTRAINT [FK_Miejsca_ksiazek_ID_Regalu]
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek]  WITH CHECK ADD  CONSTRAINT [FK_Miejsca_ksiazek_ID_Rzedu] FOREIGN KEY([ID_Rzedu])
REFERENCES [dbo].[Rzedy_regalow] ([ID_Rzedu])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Miejsca_Ksiazek] CHECK CONSTRAINT [FK_Miejsca_ksiazek_ID_Rzedu]
GO
ALTER TABLE [dbo].[Nowe_Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Nowe_Ksiazki__ID_Ksiazki] FOREIGN KEY([ID_Ksiazki])
REFERENCES [dbo].[Ksiazki] ([ID_Ksiazki])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Nowe_Ksiazki] CHECK CONSTRAINT [FK__Nowe_Ksiazki__ID_Ksiazki]
GO
ALTER TABLE [dbo].[Nowe_Ksiazki]  WITH CHECK ADD  CONSTRAINT [FK__Nowe_Ksiazki__ID_Stanu_Ksiazki] FOREIGN KEY([ID_Stanu_ksiazki])
REFERENCES [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki])
GO
ALTER TABLE [dbo].[Nowe_Ksiazki] CHECK CONSTRAINT [FK__Nowe_Ksiazki__ID_Stanu_Ksiazki]
GO
ALTER TABLE [dbo].[Platnosci]  WITH CHECK ADD  CONSTRAINT [FK__Platnosci__Pracownik] FOREIGN KEY([Pracownik])
REFERENCES [dbo].[Uzytkownicy] ([Login])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Platnosci] CHECK CONSTRAINT [FK__Platnosci__Pracownik]
GO
ALTER TABLE [dbo].[Rodzaje_publikacji]  WITH CHECK ADD  CONSTRAINT [FK__Rodzaje_publikacji_ID_Format] FOREIGN KEY([ID_Format])
REFERENCES [dbo].[Formaty] ([ID_Format])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Rodzaje_publikacji] CHECK CONSTRAINT [FK__Rodzaje_publikacji_ID_Format]
GO
ALTER TABLE [dbo].[Rodzaje_publikacji]  WITH CHECK ADD  CONSTRAINT [FK__Rodzaje_publikacji_ID_Okladki] FOREIGN KEY([ID_Okladki])
REFERENCES [dbo].[Okladki] ([ID_Okladki])
GO
ALTER TABLE [dbo].[Rodzaje_publikacji] CHECK CONSTRAINT [FK__Rodzaje_publikacji_ID_Okladki]
GO
ALTER TABLE [dbo].[Uzytkownicy]  WITH CHECK ADD  CONSTRAINT [FK__Uzytkownicy__ID_Adres] FOREIGN KEY([ID_Adres])
REFERENCES [dbo].[Adresy] ([ID_Adres])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Uzytkownicy] CHECK CONSTRAINT [FK__Uzytkownicy__ID_Adres]
GO
ALTER TABLE [dbo].[Uzytkownicy]  WITH CHECK ADD  CONSTRAINT [FK__Uzytkownicy__ID_Tel] FOREIGN KEY([ID_Tel])
REFERENCES [dbo].[Telefony] ([ID_Tel])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Uzytkownicy] CHECK CONSTRAINT [FK__Uzytkownicy__ID_Tel]
GO
ALTER TABLE [dbo].[Uzytkownicy]  WITH CHECK ADD  CONSTRAINT [FK__Uzytkownicy__ID_Typ_uzytkownika] FOREIGN KEY([ID_Typ_uzytkownika])
REFERENCES [dbo].[Typy_uzytkownikow] ([ID_Typ_uzytkownika])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Uzytkownicy] CHECK CONSTRAINT [FK__Uzytkownicy__ID_Typ_uzytkownika]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__ID_Ksiazki] FOREIGN KEY([ID_Ksiazki])
REFERENCES [dbo].[Ksiazki] ([ID_Ksiazki])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__ID_Ksiazki]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__ID_Miejsce_odbioru] FOREIGN KEY([ID_Miejsce_odbioru])
REFERENCES [dbo].[Miejsca_odbioru] ([ID_Miejsce_odbioru])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__ID_Miejsce_odbioru]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__ID_Rodzaj_wykorzystania] FOREIGN KEY([ID_Rodzaj_wykorzystania])
REFERENCES [dbo].[Rodzaj_wykorzystania] ([ID_Rodzaj_wykorzystania])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__ID_Rodzaj_wykorzystania]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__ID_Stanu_ksiazki] FOREIGN KEY([ID_Stanu_ksiazki])
REFERENCES [dbo].[Stany_Ksiazek] ([ID_Stanu_ksiazki])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__ID_Stanu_ksiazki]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__Pracownik] FOREIGN KEY([Pracownik])
REFERENCES [dbo].[Uzytkownicy] ([Login])
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__Pracownik]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia__Wypożyczajacy] FOREIGN KEY([Wypożyczający])
REFERENCES [dbo].[Uzytkownicy] ([Login])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia__Wypożyczajacy]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK__Wypozyczenia_ID_Data_rezerwacji] FOREIGN KEY([ID_Data_rezerwacji])
REFERENCES [dbo].[Daty_rezerwacji] ([ID_Data_rezerwacji])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK__Wypozyczenia_ID_Data_rezerwacji]
GO
ALTER TABLE [dbo].[Wypozyczenia]  WITH CHECK ADD  CONSTRAINT [FK_Wypozyczenia_ID_Data_wypozyczenia] FOREIGN KEY([ID_Data_wypozyczenia])
REFERENCES [dbo].[Daty_wypozyczen] ([ID_Data_wypozyczenia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wypozyczenia] CHECK CONSTRAINT [FK_Wypozyczenia_ID_Data_wypozyczenia]
GO
ALTER TABLE [dbo].[Autorzy]  WITH CHECK ADD  CONSTRAINT [CK_Autorzy_Rok_smierci_autora] CHECK  (([Rok_smierci_autora]>(0) AND [Rok_smierci_autora]<CONVERT([int],datepart(year,getdate()))))
GO
ALTER TABLE [dbo].[Autorzy] CHECK CONSTRAINT [CK_Autorzy_Rok_smierci_autora]
GO
ALTER TABLE [dbo].[Autorzy]  WITH CHECK ADD  CONSTRAINT [CK_Autorzy_Rok_ur_autora] CHECK  (([Rok_ur_autora]>(0) AND [Rok_ur_autora]<CONVERT([int],datepart(year,getdate()))))
GO
ALTER TABLE [dbo].[Autorzy] CHECK CONSTRAINT [CK_Autorzy_Rok_ur_autora]
GO
ALTER TABLE [dbo].[Daty_rezerwacji]  WITH CHECK ADD  CONSTRAINT [CK_Daty_rezerwacji_Data_rezerwacji] CHECK  (([Data_rezerwacji]<=getdate()))
GO
ALTER TABLE [dbo].[Daty_rezerwacji] CHECK CONSTRAINT [CK_Daty_rezerwacji_Data_rezerwacji]
GO
ALTER TABLE [dbo].[Daty_rezerwacji]  WITH CHECK ADD  CONSTRAINT [CK_Daty_rezerwacji_Koniec_rezerwacji] CHECK  (([Koniec_rezerwacji]<=getdate()))
GO
ALTER TABLE [dbo].[Daty_rezerwacji] CHECK CONSTRAINT [CK_Daty_rezerwacji_Koniec_rezerwacji]
GO
ALTER TABLE [dbo].[Daty_wypozyczen]  WITH CHECK ADD  CONSTRAINT [CK_Daty_wypozyczen_Data_wypozyczenia] CHECK  (([Data_wypozyczenia]<=getdate()))
GO
ALTER TABLE [dbo].[Daty_wypozyczen] CHECK CONSTRAINT [CK_Daty_wypozyczen_Data_wypozyczenia]
GO
ALTER TABLE [dbo].[Daty_wypozyczen]  WITH CHECK ADD  CONSTRAINT [CK_Daty_wypozyczen_Data_zwrotu] CHECK  (([Data_zwrotu]<=getdate()))
GO
ALTER TABLE [dbo].[Daty_wypozyczen] CHECK CONSTRAINT [CK_Daty_wypozyczen_Data_zwrotu]
GO
ALTER TABLE [dbo].[Ksiazki]  WITH CHECK ADD  CONSTRAINT [CK_Ksiazki_Rok_wydania] CHECK  (([Rok_wydania]<=CONVERT([int],datepart(year,getdate()))))
GO
ALTER TABLE [dbo].[Ksiazki] CHECK CONSTRAINT [CK_Ksiazki_Rok_wydania]
GO
ALTER TABLE [dbo].[Telefony]  WITH CHECK ADD  CONSTRAINT [CK_Telefony_Kierunkowy_stacjonarny] CHECK  (([Kierunkowy_stacjonarny]>=(9) AND [Kierunkowy_stacjonarny]<=(100)))
GO
ALTER TABLE [dbo].[Telefony] CHECK CONSTRAINT [CK_Telefony_Kierunkowy_stacjonarny]
GO
ALTER TABLE [dbo].[Telefony]  WITH CHECK ADD  CONSTRAINT [CK_Telefony_komorkowy] CHECK  (([komorkowy]>=(99999999) AND [komorkowy]<=(1000000000)))
GO
ALTER TABLE [dbo].[Telefony] CHECK CONSTRAINT [CK_Telefony_komorkowy]
GO
ALTER TABLE [dbo].[Telefony]  WITH CHECK ADD  CONSTRAINT [CK_Telefony_Stacjonarny] CHECK  (([Stacjonarny]>=(999999) AND [Stacjonarny]<=(10000000)))
GO
ALTER TABLE [dbo].[Telefony] CHECK CONSTRAINT [CK_Telefony_Stacjonarny]
GO
/****** Object:  StoredProcedure [dbo].[spDodawanie_gatunkow]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 
procedura umożliwiająca dodanie unikalnych gatunków książek do tabeli Gatunki
*/
CREATE PROCEDURE [dbo].[spDodawanie_gatunkow] (
@Gatunek nvarchar(max))
AS
BEGIN
	/* nowe gatunki podane w jednym ciągu znaków
	wstawiane są do tabeli tymczasowej */

	SELECT distinct ltrim(value) as Gatunek
	INTO #tmp_NoweGatunki
	FROM STRING_SPLIT(@Gatunek, ',') 

	/* Wstawienie gatunków do tabeli właściwej */
	INSERT INTO Gatunki
	SELECT distinct tmp.Gatunek
	FROM #tmp_NoweGatunki tmp
	CROSS APPLY Gatunki

	WHERE tmp.Gatunek not in (SELECT Gatunek FROM Gatunki) /* gwarantuje unikatowość gatunków */

END

GO
/****** Object:  StoredProcedure [dbo].[spLaczenie_Gatunkow_i_Ksiazek]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLaczenie_Gatunkow_i_Ksiazek] (
/*Procedura pozwalająca przypisać wiele gatunków do wybranej książki i wpisująca wynik
w tabelę łączącę Gatunki_Ksiazki
*/
@Ksiazka int /* nr ID książki już dodanej do bazy */
, @Gatunek char(30) /* numery id gatunków oddzielone przecinkami */
, @Ilosc int output
)
AS

BEGIN
	/* 
	- stworzenie tymczasowej tabeli, do której umieszczone zostaną w osobnych wierszach ID gatunków
	- stworzenie kolumny LP pośrednio służy stworzeniu warunku w pętli
	*/
	CREATE TABLE #gatunki(ID_Gatunek int, LP int not null identity(1,1));

	/*
	wstawienie ID Gatunków do tabeli tymczasowej
	*/
	INSERT INTO #gatunki
	SELECT distinct ltrim(value) ID_Gatunek 
    FROM Gatunki
    cross apply string_split(@Gatunek, ',')
	
	/*
	max liczba porządkowa LP określa ilość dopisanych gatunków
	*/
	SELECT @Ilosc = max(LP) FROM #gatunki 

	WHILE @Ilosc > 0 /* Pętla ma się wykonywać aż każdemu gatunkowi książki zostanie dopisany
						ID Ksiązki */
        BEGIN 
		/*
		Połączenie gatunków z tabeli testowej z ID Książki
		*/
        INSERT INTO Gatunki_Ksiazki (ID_Gatunek, ID_Ksiazki)
        SELECT distinct #gatunki.ID_Gatunek, @Ksiazka
        FROM #gatunki
        WHERE #gatunki.LP = @Ilosc
		and not exists (
					  select 0
					  from Gatunki_Ksiazki gk
					  where gk.ID_Gatunek = #gatunki.ID_Gatunek
					  and gk.ID_Ksiazki = @Ksiazka
					  )

     	SET @Ilosc = @Ilosc - 1
	
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[spWyszukiwanie]    Script Date: 25.05.2021 22:21:01 ******/
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
GO
/****** Object:  Trigger [dbo].[tr_vKsiazkiPoTerminie_InsteadOfUpdate]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Edycja danych (Status kary) na widoku przetrzymanych ksiazek
*/
CREATE TRIGGER [dbo].[tr_vKsiazkiPoTerminie_InsteadOfUpdate]
ON [dbo].[vKsiazkiPoTerminie]
INSTEAD OF UPDATE
AS
BEGIN

	IF (UPDATE(ID_Wypozyczenia))
	BEGIN
		Raiserror('ID nie może być zmienione', 16,1)
		Return
	END

	IF (UPDATE(Ksiazka))
	BEGIN
		Raiserror('Ksiazka nie może być zmieniona.  Aby zmienic informacje o ksiazce przejdz do widoku ksiazek', 16,1)
		Return
	END

	IF (UPDATE(Wypozyczajacy))
	BEGIN
		Raiserror('Wypozyczajacy nie może być zmieniony. Aby zmienic dane osobowe przejdz do widoku uzytkownikow', 16,1)
		Return
	END

	IF (UPDATE(Telefony_kontaktowe))
	BEGIN
		Raiserror('Telefon nie może być zmieniony. Aby zmienic telefon przejdz do widoku uzytkownikow', 16,1)
		Return
	END
	
	IF (UPDATE(email))
	BEGIN
		Raiserror('email nie może być zmieniony. Aby zmienic email przejdz do widoku uzytkownikow', 16,1)
		Return
	END

	IF (UPDATE(Data_wypozyczenia))
	BEGIN
		Raiserror('Data wypozyczenia nie może być zmieniona', 16,1)
		Return
	END

	IF (UPDATE(Planowana_data_zwrotu))
	BEGIN
		Raiserror('Planowana data zwrotu nie może być zmieniona', 16,1)
		Return
		
	END

	IF (UPDATE(Ilosc_tygodni_po_terminie))
	BEGIN
		Raiserror('Ilość tygodni po terminie nie mogą być zmienione', 16,1)
		Return
	END

	IF (UPDATE(Kara))
	BEGIN
		Raiserror('Kara nie moze być zmieniona', 16,1)
		Return
	END

	IF (UPDATE(Do_zaplaty))
	BEGIN
		Raiserror('Pole Do zaplaty nie moze być zmienione', 16,1)
		Return
	END

	IF (UPDATE(Status_kary))
	BEGIN
		DECLARE @ID_StatusKary int

		Select @ID_StatusKary = ID_Status_kary 
		FROM Statusy_kar
		JOIN INSERTED
		ON inserted.Status_kary = Statusy_kar.Status_kary

		IF(@ID_StatusKary is null)
		BEGIN
			Raiserror('Nie ma takiego statusu', 16,1)
			Return
		END

		UPDATE Kary SET ID_Status_kary = @ID_Statuskary
		FROM Inserted
		join Kary
		ON Kary.ID_Wypozyczenia = Inserted.ID_Wypozyczenia
		
	END

END

GO
/****** Object:  Trigger [dbo].[tr_vUzytkownicyInfo_InsteadOfInsert]    Script Date: 25.05.2021 22:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_vUzytkownicyInfo_InsteadOfInsert]
ON [dbo].[vUzytkownicyInfo]
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @ID int
	DECLARE @Imie nvarchar (50)
	DECLARE @Nazwisko nvarchar (50)
	DECLARE @KierSt int
	DECLARE @Stacjonarny int
	DECLARE @KierKom int
	DECLARE @Komorkowy int
	DECLARE @email varchar (100)
	DECLARE @Ulica nvarchar (50)
	DECLARE @NrDomu nvarchar (10)
	DECLARE @NrMieszkania nvarchar (10)
	DECLARE @KodPocztowy int
	DECLARE @Miasto varchar(30)
	DECLARE @IdTypUzytkownika int
	DECLARE @TypUzytkownika varchar (30)
	DECLARE @IdTel int
	DECLARE @IdMiasta int
	DECLARE @IdAdresu int

	SELECT Login, Imie, Nazwisko, Kier, Tel_stacjonarny, Kier_k, Tel_komorkowy, email, 
			Ulica, Nr_domu, Nr_mieszkania, Kod_pocztowy, Miasto, Typ_uzytkownika
	INTO #TempTable FROM inserted
	
	/* Petla zapewniajaca wstawianie nowych uzytkownikow */
	WHILE (EXISTS (Select Login FROM #TempTable) )
	BEGIN
		select top 1 @id = login from #TempTable

/*Telefony*/
	/* wstawienie numerow telefonow do odpowiedniej tabeli */
	/* przypisanie odpowiednich wartosci parametrom z #TempTable */
	SELECT TOP 1 @KierSt = Kier, @Stacjonarny = Tel_stacjonarny, @KierKom = Kier_k, @Komorkowy = Tel_komorkowy
	FROM #TempTable
	
	/* sprawdzenie czy podany zestaw telefonow juz istnieje w tabeli */
	IF
		exists (SELECT TOP 1 1
				FROM Telefony
				WHERE (Kierunkowy_stacjonarny = @KierSt OR (Kierunkowy_stacjonarny is null and @KierSt is null)) 
					AND (Stacjonarny = @Stacjonarny OR (Stacjonarny is null and  @Stacjonarny is null))
					AND (Kierunkowy_kom = @KierKom OR (Kierunkowy_kom is null and @KierKom is null))
					AND (Komorkowy = @Komorkowy OR (Komorkowy is null and @Komorkowy is null))
			)
		/* jezeli istnieje pobierany jest jego numer ID i przypisywany do parametru @IdTel */
		BEGIN
			Select @IdTel = ID_Tel from telefony 
			WHERE (Kierunkowy_stacjonarny = @KierSt OR (Kierunkowy_stacjonarny is null and @KierSt is null)) 
				AND (Stacjonarny = @Stacjonarny OR (Stacjonarny is null and  @Stacjonarny is null))
				AND (Kierunkowy_kom = @KierKom OR (Kierunkowy_kom is null and @KierKom is null))
				AND (Komorkowy = @Komorkowy OR (Komorkowy is null and @Komorkowy is null))
		END

		ELSE
		/* Jezeli nie istnieje, dane wpisywane sa do tabeli Telefony i nowo nadany numer IdTel przypisywany jest do @IdTel */
		BEGIN
			insert INTO Telefony VALUES (@KierSt, @Stacjonarny, @KierKom, @Komorkowy)
			set @IdTel = IDENT_CURRENT ('Telefony')
		END
		
/*Miasta*/
	/* Wstawienie miasta do odpowiedniej tabeli */
	/* przypisanie odpowiednich wartosci parametrom z #TempTable */
	SELECT TOP 1 @KodPocztowy = Kod_pocztowy, @Miasto = Miasto
	FROM #TempTable
	
	/* Sprawdzenie czy podane miasto z kodem pocztowym juz istnieje */
	IF
		exists (SELECT TOP 1 1
				FROM Miasta
				WHERE Kod_pocztowy = @KodPocztowy AND Miasto = @Miasto)
			
		/* jezeli istnieje pobierany jest jego numer ID i przypisywany do parametru @IdMiasta */
		BEGIN
			Select @IdMiasta = ID_Miasta from Miasta 
			WHERE Kod_pocztowy = @KodPocztowy AND Miasto = @Miasto
		END

		ELSE
		/* Jezeli nie istnieje, dane wpisywane sa do tabeli Miasta i nowo nadany numer Id_Miasta przypisywany jest do @IdMiasta */
		BEGIN
			insert INTO Miasta VALUES (@KodPocztowy, @Miasto)
			set @IdTel = IDENT_CURRENT ('Miasta')
		END

/*Adresy*/
	/* Wstawienie adresu do odpowiedniej tabeli */
	/* przypisanie odpowiednich wartosci parametrom z #TempTable */
	SELECT TOP 1 @Ulica = Ulica, @NrDomu = Nr_domu, @NrMieszkania = Nr_mieszkania
	FROM #TempTable
	
	/* Sprawdzenie czy podany adres juz istnieje */
	IF
		exists (SELECT TOP 1 1
				FROM Adresy
				WHERE ID_Miasta = @IdMiasta AND Ulica = @Ulica AND Nr_domu = @NrDomu
					AND (Nr_mieszkania = @NrMieszkania OR (Nr_mieszkania is null and @NrMieszkania is null))
					AND ID_Rodzaj_adresu = 1
				)
			
	/* jezeli istnieje pobierany jest jego numer ID i przypisywany do parametru @IdAdresu */
	BEGIN
		Select @IdAdresu = ID_Adres from Adresy
		WHERE ID_Miasta = @IdMiasta AND Ulica = @Ulica AND Nr_domu = @NrDomu
			AND (Nr_mieszkania = @NrMieszkania OR (Nr_mieszkania is null and @NrMieszkania is null))
			AND ID_Rodzaj_adresu = 1
	END

	ELSE
	/* Jezeli nie istnieje, dane wpisywane sa do tabeli Adresy i nowo nadany numer Id_Adres przypisywany jest do @IdAdresu */
	BEGIN
		INSERT INTO Adresy VALUES (@IdMiasta, @Ulica, @NrDomu, @NrMieszkania, 1)
		SET @IdAdresu = IDENT_CURRENT ('Adresy')
	END
		
/* Typ uzytkownika */
	/* Pobranie odpowiedniej wartosci dla podanego typu uzytkownika */
	/* przypisanie odpowiednich wartosci parametrom z #TempTable */
	SELECT @IdTypUzytkownika = Id_Typ_uzytkownika
	FROM Typy_uzytkownikow
	join #TempTable
	ON #TempTable.Typ_Uzytkownika = Typy_uzytkownikow.Typ_uzytkownika

	IF(@IdTypUzytkownika is null)
	BEGIN
		Raiserror('Nie ma takiego typu uzytkownika', 16,1)
		Return
	END

/* Uzytkownicy */
	/* wstawienie danych do tabeli Uzytkownicy */
	/* przypisanie odpowiednich wartosci parametrom z #TempTable */
	SELECT TOP 1 @Imie = Imie, @Nazwisko = Nazwisko, @email = email
	FROM #TempTable
	
	/* Sprawdzenie czy podany uzytkownik juz istnieje */
	IF
		exists (SELECT TOP 1 1
				FROM Uzytkownicy
				WHERE Imie = @Imie AND Nazwisko = @Nazwisko AND email = @email AND ID_Adres = @IdAdresu
					AND ID_Tel = @IdTel AND Data_wypisu is null
					AND (ID_Typ_uzytkownika = @IdTypUzytkownika OR (ID_Typ_uzytkownika is null and @IdTypUzytkownika is null))
				)
			
	/* jezeli istnieje wyświetlana jest informacja o istniejacym w bazie uzytkowniku */
		BEGIN
			Select 'Uzytkownik istnieje w bazie:' AS Info,
				 Login, Imie, Nazwisko from Uzytkownicy
			WHERE Imie = @Imie AND Nazwisko = @Nazwisko AND email = @email AND ID_Adres = @IdAdresu
					AND ID_Tel = @IdTel AND Data_wypisu is null
					AND ID_Typ_uzytkownika = @IdTypUzytkownika OR (ID_Typ_uzytkownika is null and @IdTypUzytkownika is null)
		END

	ELSE
	/* Jezeli nie istnieje, dane wpisywane sa do tabeli Uzytkownicy */
		BEGIN
			INSERT INTO Uzytkownicy VALUES (@Imie, @Nazwisko, @email, @IdAdresu, @IdTel, getdate(), NULL, @IdTypUzytkownika)
		END

/* usunięcie aktualnego wpisu z #TempTable */
	DELETE FROM #TempTable WHERE LOGIN = @ID

	END

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Przedrostek nazwiska lub tytuł naukowy (Sir, Dr, mgr itp.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Przedrostek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rok urodzenia autora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Rok_ur_autora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Przedrostek lub tytuł naukowy w pisowni oryginalnej' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Przedrostek_oryg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Imie autora w pisowni oryginalnej' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Imie_oryg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Drugie imie autora w pisowni oryginalnej' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Drugie_imie_oryg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nazwisko autora w pisowni oryginalnej' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Autorzy', @level2type=N'COLUMN',@level2name=N'Nazwisko_oryg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Wielkosc druku. Moze byc podawana w standardowych wymiarach lub wysokosc w cm jezeli ma niestandardowy wymiar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Formaty', @level2type=N'COLUMN',@level2name=N'Wielkosc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gatunki', @level2type=N'COLUMN',@level2name=N'Gatunek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login uzytkownika' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hasla', @level2type=N'COLUMN',@level2name=N'Login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Haslo uzytkownika' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hasla', @level2type=N'COLUMN',@level2name=N'Haslo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Jezyk, w ktorym publikacja zostala wydana' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Jezyki', @level2type=N'COLUMN',@level2name=N'Jezyk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tytul publikacji' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'Tytul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Podawany jezeli rozni sie od pola ''Tytul''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'Tytul_oryginalny'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kraj wydania publikacji' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Kraju'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Jezyk w ktorym publikacja zostala wydana' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Jezyk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Rodzaj_publikacji'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Miejsce w ktorym mozna znalezc ksiazke w bibliotece' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Miejsce_Ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Statusu_Ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stan w jakim jest ksiazka. Updatowany w momencie zwrotu ksiazki' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Stanu_Ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rola jaka pelni autor w danej publikacji' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ksiazki_Autorzy', @level2type=N'COLUMN',@level2name=N'ID_Rola_autora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data i czas zalogowania uzytkownika' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logowania', @level2type=N'COLUMN',@level2name=N'Data_logowania'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data i czas wylogowania uzytkownika' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Logowania', @level2type=N'COLUMN',@level2name=N'Data_wylogowania'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kod pocztowy w wersji 43103' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Miasta', @level2type=N'COLUMN',@level2name=N'Kod_pocztowy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Miejsca_odbioru', @level2type=N'COLUMN',@level2name=N'Miejsce_odbioru'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stan w momencie zakupu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nowe_Ksiazki', @level2type=N'COLUMN',@level2name=N'ID_Stanu_ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cena netto po której zakupiono publikacje' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Nowe_Ksiazki', @level2type=N'COLUMN',@level2name=N'Cena_zakupu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rodzaj okladki' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Okladki', @level2type=N'COLUMN',@level2name=N'Okladki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data dokonanej platnosci' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Platnosci', @level2type=N'COLUMN',@level2name=N'Data_wplaty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kwota dokonanej platnosc - nie musi byc rowna wysokosci kary jesli dopuszczamy platnosci czesciowe' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Platnosci', @level2type=N'COLUMN',@level2name=N'Kwota_wplaty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login pracownika ktory przyjal platnosc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Platnosci', @level2type=N'COLUMN',@level2name=N'Pracownik'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rodzaj_wykorzystania', @level2type=N'COLUMN',@level2name=N'Rodzaj_wykorzystania'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rodzaje_adresow', @level2type=N'COLUMN',@level2name=N'Rodzaj_adresu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rodzaj publikacji' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rodzaje_publikacji', @level2type=N'COLUMN',@level2name=N'Rodzaj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rola autora jaka pelnil w publikacji' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role_Autorow', @level2type=N'COLUMN',@level2name=N'Rola_autora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stany_Ksiazek', @level2type=N'COLUMN',@level2name=N'Stan_ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status kary' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statusy_kar', @level2type=N'COLUMN',@level2name=N'Status_kary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statusy_Ksiazek', @level2type=N'COLUMN',@level2name=N'Status_Ksiazki'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Typ uzytkownika - w zaleznosci od typu moga miec rozne dostepy i rozne ograniczenia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Typy_uzytkownikow', @level2type=N'COLUMN',@level2name=N'Typ_uzytkownika'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rola uzytkownika (pracownik, student, doktorant) - w zaleznosci od roli moga miec rozne dostepy i rozne ograniczenia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Uzytkownicy', @level2type=N'COLUMN',@level2name=N'ID_Typ_uzytkownika'
GO
USE [master]
GO
ALTER DATABASE [Biblioteka] SET  READ_WRITE 
GO
