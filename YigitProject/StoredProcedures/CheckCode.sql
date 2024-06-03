CREATE PROCEDURE [dbo].[CheckCode]
@Code VARCHAR(8) = 'L5KGDKCC'

AS 
BEGIN
SET NOCOUNT ON;

IF LEN(@Code) != 8
BEGIN
    PRINT 'Invalid code length. The code must be 8 characters long.';
    RETURN;
END;

IF @Code LIKE '%[^ACDEFGHKLMNPRTXYZ234579]%'
BEGIN
    PRINT 'It contains invalid characters. The code can only contain characters from ACDEFGHKLMNPRTXYZ234579.';
    RETURN; 
END
ELSE
BEGIN 
    PRINT 'Valid Code';
END
END