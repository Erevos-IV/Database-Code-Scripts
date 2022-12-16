select 
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<TraderAlias>', UserProfile),0) +LEN('<TraderAlias>'), NULLIF(CHARINDEX('</TraderAlias>', UserProfile),0) - NULLIF(CHARINDEX('<TraderAlias>', UserProfile),0)-LEN('<TraderAlias>')) AS TraderAlias,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<TraderCorporateName>', UserProfile),0) +LEN('<TraderCorporateName>'), NULLIF(CHARINDEX('</TraderCorporateName>', UserProfile),0) - NULLIF(CHARINDEX('<TraderCorporateName>', UserProfile),0)-LEN('<TraderCorporateName>')) AS TraderCorporateName,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<EmailNotificationType>', UserProfile),0) +LEN('<EmailNotificationType>'), NULLIF(CHARINDEX('</EmailNotificationType>', UserProfile),0) - NULLIF(CHARINDEX('<EmailNotificationType>', UserProfile),0)-LEN('<EmailNotificationType>')) AS EmailNotificationType,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<FirstName>', UserProfile),0) +LEN('<FirstName>'), NULLIF(CHARINDEX('</FirstName>', UserProfile),0) - NULLIF(CHARINDEX('<FirstName>', UserProfile),0)-LEN('<FirstName>')) AS FirstName,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<Surname>', UserProfile),0) +LEN('<Surname>'), NULLIF(CHARINDEX('</Surname>', UserProfile),0) - NULLIF(CHARINDEX('<Surname>', UserProfile),0)-LEN('<Surname>')) AS Surname,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<WebOfferCounter>', UserProfile),0) +LEN('<WebOfferCounter>'), NULLIF(CHARINDEX('</WebOfferCounter>', UserProfile),0) - NULLIF(CHARINDEX('<WebOfferCounter>', UserProfile),0)-LEN('<WebOfferCounter>')) AS WebOfferCounter,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<EMailCMR>', UserProfile),0) +LEN('<EMailCMR>'), NULLIF(CHARINDEX('</EMailCMR>', UserProfile),0) - NULLIF(CHARINDEX('<EMailCMR>', UserProfile),0)-LEN('<EMailCMR>')) AS EMailCMR,
SUBSTRING(UserProfile, NULLIF(CHARINDEX('<EMailPOD>', UserProfile),0) +LEN('<EMailPOD>'), NULLIF(CHARINDEX('</EMailPOD>', UserProfile),0) - NULLIF(CHARINDEX('<EMailPOD>', UserProfile),0)-LEN('<EMailPOD>')) AS EMailPOD
from aspnet_Users aspu
INNER JOIN aspnet_Membership aspm ON aspu.UserId = aspm.UserId
INNER JOIN UsersProfiles uspp ON uspp.UserId = aspu.UserId


-- THIS IS HOW TO BREAK A PROBLEMATIC XML INTO COLUMNS AND ROWS
