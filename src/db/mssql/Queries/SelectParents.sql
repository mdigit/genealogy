
-- Parents
select 
		concat(parentPerson.FirstName, ' ', parentPerson.LastName) as [Parent],
		concat(partnerPerson.FirstName, ' ', partnerPerson.LastName) as [Partner]
	from
		dbo.Parents parent
		inner join dbo.Persons parentPerson
			on parentPerson.PersonId = parent.PersonId
		inner join dbo.Persons partnerPerson
			on partnerPerson.PersonId = parent.PartnerPersonId
