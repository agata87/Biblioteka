USE [Biblioteka]
GO
/****** Object:  StoredProcedure [dbo].[spDodawanie_gatunkow]    Script Date: 25.05.2021 22:09:12 ******/
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

