select top 3
	srvc_name,
	min_participants
from dbo.additional_service

select top 3
	srvc_name [additional service],
	min_participants [minimum participants]
from dbo.additional_service