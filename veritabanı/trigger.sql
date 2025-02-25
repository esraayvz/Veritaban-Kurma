USE Pastane32
GO
-- Tam adlar g�r�n�m�
CREATE VIEW vw_TamAdlar
AS
SELECT 
    KisiID,
    FirstName + ' ' + LastName AS TamAd
FROM 
    Kisi;
GO

CREATE TRIGGER trg_YeniKisiEklendi
ON Kisi
AFTER INSERT
AS
BEGIN
    DECLARE @FirstName varchar(100), @LastName varchar(100);
    
    SELECT @FirstName = FirstName, @LastName = LastName 
    FROM inserted;

    -- Ba�ar� mesaj� d�nd�r
    RAISERROR ('%s %s ba�ar�yla eklendi.', 0, 1, @FirstName, @LastName) WITH NOWAIT;
END;
GO
CREATE PROCEDURE sp_YeniKisiEkle
    @TCNo char(11),
    @FirstName varchar(100),
    @LastName varchar(100),
    @Telefon char(10),
    @Adres varchar(250),
    @e_mail varchar(50)
AS
BEGIN
    BEGIN TRY
        -- Yeni ki�iyi ekle
        INSERT INTO Kisi (TCNo, FirstName, LastName)
        VALUES (@TCNo, @FirstName, @LastName);

        -- Eklenen ki�inin ID'sini al
        DECLARE @KisiID int;
        SET @KisiID = SCOPE_IDENTITY();

        -- �leti�im bilgisi ekle
        INSERT INTO IletisimBilgisi (Telefon, Adres, e_mail, KisiID)
        VALUES (@Telefon, @Adres, @e_mail, @KisiID);
    END TRY
    BEGIN CATCH
        -- Hata durumunda hata mesaj� d�nd�r
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO
EXEC sp_YeniKisiEkle '12345678901', 'Yeter', 'Yorgun', '5551234567', 'Caddebostan �stanbul', 'yeteryorgun@gmail.com';
