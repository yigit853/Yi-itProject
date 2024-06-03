CREATE PROCEDURE [dbo].[GenerateCode]

@CodeLength INT = 8,
@Characters NVARCHAR(50) = 'ACDEFGHKLMNPRTXYZ234579',
@CodeCount INT = 1,
@MaxCodes INT = 1000

AS 
BEGIN 

SET NOCOUNT ON;

CREATE TABLE #TempCodes (
    Code NVARCHAR(8)
);

DECLARE @Counter INT = 0;

WHILE (SELECT COUNT(*) FROM #TempCodes) < @CodeCount AND @Counter < @MaxCodes
BEGIN
    DECLARE @NewCode NVARCHAR(10) = '';
    DECLARE @Index INT = 1;

    WHILE @Index <= @CodeLength
    BEGIN
        DECLARE @RandomIndex INT = CEILING(RAND() * LEN(@Characters));
        SET @NewCode = @NewCode + SUBSTRING(@Characters, @RandomIndex, 1);
        SET @Index = @Index + 1;
    END;

    IF NOT EXISTS (SELECT 1 FROM #TempCodes WHERE Code = @NewCode)
    BEGIN
        INSERT INTO #TempCodes (Code) VALUES (@NewCode);
    END;

    SET @Counter = @Counter + 1;
END;

SELECT * FROM #TempCodes;

IF @Counter >= @MaxCodes
BEGIN
    PRINT 'Max code count reached. Some codes might be duplicates.';
END;

drop table #TempCodes

END