-- Children
select 
		concat(childPerson.FirstName, ' ', childPerson.LastName) as [Child],
		concat(parentPerson.FirstName, ' ', parentPerson.LastName) as [Parent],
		concat(parentPartnerPerson.FirstName, ' ', parentPartnerPerson.LastName) as [Partner]
	from
		dbo.Children child
		inner join dbo.Persons childPerson
			on childPerson.PersonId = child.PersonId
		inner join dbo.Parents parent
			on parent.ParentId = child.ParentId
		inner join dbo.Persons parentPerson
			on parentPerson.PersonId = parent.PersonId
		inner join dbo.Persons parentPartnerPerson
			on parentPartnerPerson.PersonId = parent.PartnerPersonId
