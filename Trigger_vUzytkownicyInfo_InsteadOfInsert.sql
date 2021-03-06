USE [Biblioteka]
GO

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