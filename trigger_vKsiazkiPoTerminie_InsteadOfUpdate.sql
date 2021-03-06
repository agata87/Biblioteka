USE [Biblioteka]
GO

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

