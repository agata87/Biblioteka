USE [Biblioteka]
GO
/****** Object:  StoredProcedure [dbo].[spLaczenie_Gatunkow_i_Ksiazek]    Script Date: 25.05.2021 22:06:17 ******/
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
