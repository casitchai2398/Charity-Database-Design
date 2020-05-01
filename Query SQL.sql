Select Donor_ID, Donor_FName, Donor_LName, DEmail
from Donor
where Donor_ID in 
(Select Donor_ID 
from BookDonated 
Group by Donor_ID 
Having Sum(NumberOfBooks) >= 5);


select l.Library_ID, Library_Name, Sum(NumberofBooks), LAddress, Date_Established
From Library l, BookDonated bd
Where Date_Established is not null AND l.Library_ID in
(Select Library_ID
from Library
where to_date(Date_Established, 'DD-MON-YY') like '%98')
Group by l.Library_ID, Library_Name, LAddress, Date_Established;



select Event_Name, Event_ID 
from Event 
where Event_ID in (select Event_ID from MoneyDonated Group by Event_ID Having sum(AmountOfMoney) > 500);


select Event_ID, sum(AmountOfMoney), MDonateDate
From MoneyDonated
Group by Event_ID, MDonateDate;


Select Type, Count(Donor_ID)
From Donor
Group by Type
Having Type is not null
Order by Type;


select d.Donor_ID, Donor_FName, Donor_LName, DEmail, DPhone, AmountOfMoney
from Donor d, MoneyDonated m
where DPhone like '812%' AND d.Donor_ID = m.Donor_ID AND AmountOfMoney >= 100;


Select i.Program_ID, Program_Name, Count(Volunteer_ID)
From Information i, Program p
where i.Program_ID = p.Program_ID
Group by i.Program_ID, Program_Name
Having count(Volunteer_ID) >= 2
Order by Program_Name;



Select Library_Name, NumberOfBooks
From Library l, BookDonated b
Where l.Library_ID = b.Library_ID AND l.Library_Name = 'Qinghua';


Select Executer_ID, Executer_FName, Executer_LName, Role
From Executers
Where Department_ID in (select Department_ID from Department where Department_name = 'Finance'); 



select de.University_ID, University_Name, Count(de.Department_ID)
from DateEstablished de, University u
where de.University_ID = u.University_ID
Group by de.University_ID, University_Name
Order by de.University_ID;








