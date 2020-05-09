
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

-- Children
select 
		concat(childPerson.FirstName, ' ', childPerson.LastName) as [Child]
		--concat(parentPerson.FirstName, ' ', parentPerson.LastName) as [Parent]
		--concat(partnerPerson.FirstName, ' ', partnerPerson.LastName) as [Partner]
	from
		dbo.Children child
		inner join dbo.Persons childPerson
			on childPerson.PersonId = child.PersonId

			select * from dbo.Children c inner join dbo.Persons p on p.PersonId = c.PersonId

