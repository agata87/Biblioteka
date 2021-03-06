USE [master]
GO
/****** Object:  Database [Biblioteka]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Kary]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Platnosci]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Ksiazki]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Daty_wypozyczen]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Wypozyczenia]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Telefony]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Ksiazki_Autorzy]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Statusy_kar]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Statusy_kar_Status_kary] UNIQUE NONCLUSTERED 
(
	[Status_kary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autorzy]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  View [dbo].[vKsiazkiPoTerminie]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Adresy]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Miasta]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Typy_uzytkownikow]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Typy_uzytkownikow_Typ_uzytkownika] UNIQUE NONCLUSTERED 
(
	[Typ_uzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUzytkownicyInfo]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Wydawnictwa]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Wydawnictwa_Wydawnictwo] UNIQUE NONCLUSTERED 
(
	[Wydawnictwo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Wypozyczone_Ksiazki]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Regaly]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Regaly__2C6F1F830847F92C] UNIQUE NONCLUSTERED 
(
	[Regal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rzedy_regalow]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Rzedy_re__D51FE90E2480DA61] UNIQUE NONCLUSTERED 
(
	[Rzad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Pokoje]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Pokoje_Pokoj] UNIQUE NONCLUSTERED 
(
	[Pokoj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly_Pokoje]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Pietra]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Pietra_Pietro] UNIQUE NONCLUSTERED 
(
	[Pietro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Rzedy_Regaly_Pokoje_Pietra]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Daty_rezerwacji]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  View [dbo].[vDostepnoscKsiazek]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Formaty]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Formaty_Wielkosc] UNIQUE NONCLUSTERED 
(
	[Wielkosc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miejsca_Ksiazek]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Okladki]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Okladki_Okladki] UNIQUE NONCLUSTERED 
(
	[Okladki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaje_publikacji]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Stany_Ksiazek]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Stany_ksiazek_Stan_ksiazki] UNIQUE NONCLUSTERED 
(
	[Stan_ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statusy_Ksiazek]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Statusy_ksiazek_Status_ksiazki] UNIQUE NONCLUSTERED 
(
	[Status_Ksiazki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vKsiazkiInfo]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  View [dbo].[vNiezaplaconeKary]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Gatunki]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Gatunki_Gatunek] UNIQUE NONCLUSTERED 
(
	[Gatunek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gatunki_Ksiazki]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Hasla]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Jezyki]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Jezyk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kraje]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Kraj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logowania]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Miejsca_odbioru]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Miejsca_odbioru_Miejsce_odbioru] UNIQUE NONCLUSTERED 
(
	[Miejsce_odbioru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nowe_Ksiazki]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Table [dbo].[Rodzaj_wykorzystania]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Rodzaj_wykorzystania_Rodzaj_wykorzystania] UNIQUE NONCLUSTERED 
(
	[Rodzaj_wykorzystania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaje_adresow]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Rodzaje_adresow_Rodzaj_adresu] UNIQUE NONCLUSTERED 
(
	[Rodzaj_adresu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Autorow]    Script Date: 25.05.2021 22:23:20 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UX_Role_autorow_Rola_autora] UNIQUE NONCLUSTERED 
(
	[Rola_autora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[spDodawanie_gatunkow]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  StoredProcedure [dbo].[spLaczenie_Gatunkow_i_Ksiazek]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  StoredProcedure [dbo].[spWyszukiwanie]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Trigger [dbo].[tr_vKsiazkiPoTerminie_InsteadOfUpdate]    Script Date: 25.05.2021 22:23:20 ******/
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
/****** Object:  Trigger [dbo].[tr_vUzytkownicyInfo_InsteadOfInsert]    Script Date: 25.05.2021 22:23:20 ******/
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
