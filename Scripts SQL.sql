create table Department 
(Department_ID char(10) not null,
Department_name varchar(20) not null,
Job_description varchar(500) not null,
constraint pk_Department PRIMARY KEY(Department_ID)
);

Create Table University(
University_ID char(10) primary key not null,
University_Name varchar2(50) not null,
UAddress varchar(50)
);

Create Table Library(
Library_ID char(10) primary key not null,
Library_Name varchar2(30) not null,
LAddress varchar(50),
Date_Established date
);

create table Program
(Program_ID char(10) not null,
Program_Name varchar(50) not null,
PStart_Date date not null,
PEnd_Date date not null,
PMaxEnroll number(20) not null,
Library_ID char(10) not null,
Department_ID char(10) not null,
constraint pk_Program PRIMARY KEY(Program_ID),
Constraint fk_ProgramLibrary foreign key (Library_ID)
References Library(Library_ID) on delete cascade, 
Constraint fk_ProgramDepartment foreign key (Department_ID)
References Department(Department_ID) on delete cascade
);

Create Table Volunteer(
Volunteer_ID char(10) primary key not null,
Volunteer_FName varchar2(30) not null,
Volunteer_LName varchar2(30) not null,
VPhone char(20),
VEmail varchar2(50) not null,
VAddress varchar2(100),
Date_Joined date not null
);

create table Event
(Event_ID char(10) not null,
Event_Name varchar(50) not null,
EDate Date not null,
EDescription varchar(200) not null,
Department_ID char(10),
constraint pk_Event primary key(Event_ID),
Constraint fk_DepartmentEvent foreign key (Department_ID)
References Department(Department_ID) on delete cascade
);

Create Table Donor(
Donor_ID char(10) primary key not null,
Donor_FName varchar2(30),
Donor_LName varchar2(30),
DPhone varchar2(20),
DEmail varchar(50) not null,
DAddress varchar(50),
Type varchar(20) check (Type in ('Money Donor','Book Donor','Both')) 
);

Create table DateEstablished(
	Department_ID char(10) not null references Department (Department_ID),
	University_ID char(10) not null references University (University_ID),
	Date_Established Date,
	Primary key(Department_ID, University_ID)
);

Create table BookDonated(
	Donor_ID char(10) not null references Donor (Donor_ID),
	Library_ID char(10) not null references Library (Library_ID),
	Event_ID char(10) not null references Event (Event_ID),
NumberOfBooks number(10) not null,
BDonateDate Date
);

Create table MoneyDonated(
	Donor_ID char(10) not null references Donor (Donor_ID),
	Event_ID char(10) not null references Event (Event_ID),
AmountOfMoney number(10) not null,
MDonateDate Date
);

create table Executers
(
Executer_ID char(10)
  constraint pk_Executers primary key,
Executer_Fname varchar2(20)
  constraint Executers_Executer_Fname not null, 
Executer_Lname varchar2(20)
  constraint Executers_Executer_Lname not null, 
Phone varchar2(20)
  constraint Executers_Phone not null, 
Email varchar2(25)
  constraint Excuters_Email not null,
Department_ID char(10) not null,
President_ID char(10),
Date_Joined date not null, 
Role varchar(15)not null
check(Role in ('director','VP', 'president')), 
Constraint fk_DepartmentExecuters foreign key (Department_ID)
References Department(Department_ID) on delete cascade,
Constraint fk_President foreign key (President_ID)
References Executers(Executer_ID) on delete cascade
);


create table Information
(
Volunteer_ID char(10) not null,
Program_ID char (10) not null,
constraint pk_vpid primary key (Volunteer_ID, Program_ID),
constraint fk_volunteer foreign key (Volunteer_ID)
references Volunteer(Volunteer_ID) on delete cascade,
constraint fk_program foreign key (Program_ID)
references Program(Program_ID) on delete cascade
);

insert into Department (Department_ID, Department_name,Job_description)
    Values(0000000001, 'Activity','Hold events' );
insert into Department (Department_ID, Department_name,Job_description)
    Values(0000000002, 'Internal Management', 'Communication with members');
insert into Department (Department_ID, Department_name,Job_description)
    Values(0000000003, 'Finance', 'Record cash inflow and outflow');
insert into Department (Department_ID, Department_name,Job_description)
    Values(0000000004, 'Marketing', 'Create posters');
insert into Department (Department_ID, Department_name,Job_description)
    Values(0000000005,'Public Relation','Marketing promotion');


Insert into University(University_ID, University_Name, UAddress)
    values(1000000000,'Indiana University Bloomington','107 S Indiana Ave, Bloomington, IN 47405');
Insert into University(University_ID, University_Name, UAddress)
    values(2000000000,'University of Texas at Austin','Austin, TX 78712');
Insert into University(University_ID, University_Name, UAddress)
    values(3000000000,'Michigan State University',' 220 Trowbridge Rd, East Lansing, MI 48824');
Insert into University(University_ID, University_Name, UAddress)
    values(4000000000,'Carnegie Mellon University','5000 Forbes Ave, Pittsburgh, PA 15213');
Insert into University(University_ID, University_Name, UAddress)
    values(5000000000,'University of Chicago','5801 S Ellis Ave, Chicago, IL 60637');



Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(1100000000,'ABC','155 S, Greenwood, IN 46142',to_date('5-20-98','MM-DD-YY'));
Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(2200000000,'BCD',' 1251 US Highway, Greenwood, IN 4614',to_date('5-20-98','MM-DD-YY'));
Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(3300000000,'CDE','2687 E, Plainfield, IN 46168',to_date('6-24-98','MM-DD-YY'));
Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(4400000000,'DEF','10791 E, Avon, IN 46123',to_date('6-19-04','MM-DD-YY'));
Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(5500000000,'EFG','6231N, Indianapolis, IN 46220',to_date('6-20-11','MM-DD-YY'));
Insert into Library(Library_ID, Library_Name, LAddress, Date_Established)
Values(6600000000,'Qinghua','6231N, Indianapolis, IN 46220',to_date('6-20-11','MM-DD-YY'));


Insert into Program(Program_ID, Program_Name, PStart_Date, PEnd_Date, PMaxEnroll, Library_ID, Department_ID)
    Values(1010000000,'Little 5', to_date('5-21-15','MM-DD-YY'), to_date('9-1-16','MM-DD-YY'),15,1100000000,0000000001);
Insert into Program(Program_ID, Program_Name, PStart_Date, PEnd_Date, PMaxEnroll, Library_ID, Department_ID)
    Values(1020000000,'Little 4', to_date('5-21-16','MM-DD-YY'), to_date('9-1-17','MM-DD-YY'),15,2200000000,0000000002);
Insert into Program(Program_ID, Program_Name, PStart_Date, PEnd_Date, PMaxEnroll, Library_ID, Department_ID)
    Values(1030000000,'Little 3', to_date('5-21-10','MM-DD-YY'), to_date('9-1-11','MM-DD-YY'),15,3300000000,0000000003);
Insert into Program(Program_ID, Program_Name, PStart_Date, PEnd_Date, PMaxEnroll, Library_ID, Department_ID)
    Values(1040000000,'Little 2', to_date('5-21-09','MM-DD-YY'), to_date('9-1-10','MM-DD-YY'),15,4400000000,0000000004);
Insert into Program(Program_ID, Program_Name, PStart_Date, PEnd_Date, PMaxEnroll, Library_ID, Department_ID)
Values(1050000000,'Little 1', to_date('5-21-05','MM-DD-YY'), to_date('9-1-06','MM-DD-YY'),15,5500000000,0000000005);


insert into Volunteer (Volunteer_ID,Volunteer_FName,Volunteer_LName,VPhone,VEmail,VAddress,Date_Joined)
    values (7398214390,'Makala', 'Johnson','829-792-7912','majohla@sina.com','32 Volunteer Revenue,LA,California',to_date('5-21-05','MM-DD-YY'));
insert into Volunteer (Volunteer_ID,Volunteer_FName,Volunteer_LName,VPhone,VEmail,VAddress,Date_Joined)
    values (5901958159,'Bill', 'Rite','532-902-0328','bijoritaa@gmail.com','Luck Way 532,Portland,Oregon',to_date('5-21-05','MM-DD-YY'));
insert into Volunteer (Volunteer_ID,Volunteer_FName,Volunteer_LName,VPhone,VEmail,VAddress,Date_Joined)
    values (8092412568,'Abigial', 'Gryffth','118-120-529','bigmouth@iu.edu','Made Revenue 031, Minniapolis,Minnesoda',to_date('5-21-05','MM-DD-YY')); 
insert into Volunteer (Volunteer_ID,Volunteer_FName,Volunteer_LName,VPhone,VEmail,VAddress,Date_Joined)
    values (7583901275,'Blake', 'Harden','192-509-0950','bladen@iu.edu','5812 Convenanter DR. Bloomington, Indiana',to_date('5-30-05','MM-DD-YY'));
insert into Volunteer (Volunteer_ID,Volunteer_FName,Volunteer_LName,VPhone,VEmail,VAddress,Date_Joined)
    values (8590410239,'Justin', 'Funny','853-983-0925','whysoserious@joker.com','Bruce Wayne Castle,Gotham',to_date('7-21-05','MM-DD-YY')); 
    
    
    
insert into Event (Event_ID,Event_Name,EDate,EDescription,Department_ID)
    values (7642801572,'Chase Your Dream',to_date('5-21-06','MM-DD-YY'),'Chase your dream while help other students chasing theirs',0000000001);
insert into Event (Event_ID,Event_Name,EDate,EDescription,Department_ID)
    values (7895310341,'Read More Books',to_date('5-11-05','MM-DD-YY'),'Donate your books to those who cannot afford', 0000000002);
insert into Event (Event_ID,Event_Name,EDate,EDescription,Department_ID) 
    values (5638910254,'Give me your money',to_date('6-21-05','MM-DD-YY'),'This is not a robery. Actually it is',0000000003);
insert into Event (Event_ID,Event_Name,EDate,EDescription,Department_ID) 
    values (8509431579,'Jane is the Best Teacher',to_date('5-10-15','MM-DD-YY'),'Jane is the Best teacher. Say yes she will give an A', 0000000004); 
insert into Event (Event_ID,Event_Name,EDate,EDescription,Department_ID) 
    values (7530912808,'Hello World',to_date('5-21-16','MM-DD-YY'),'Help students to go out and see the world',0000000005); 
    
    
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type) 
    values (0920127916,'Victor', 'Oladipo','362-837-9327','vicoladi@gamil.com','Indianapolis','Money Donor'); 
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type) 
    values (0125829572,'Darron', 'James','812-333-3333','dajmejr@hotmail.com','Indianapolis','Book Donor'); 
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type)
    values (9140074142,'Lucy', 'Liu','812-666-6666','821008518@qq.com','LA','Money Donor'); 
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type)
    values (2803758915,'Jane', 'Tan','812-339-6434','janetan@iu.edu','CA','Book Donor');
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type)
    values (5215750125,'Emma', 'Watson','812-345-5678','emwat52@gamil.com','Bloomington','Money Donor'); 
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type)
    values (5245650125,'Jiawei', 'Li','812-955-5632','jiawli@iu.edu','Bloomington','Both'); 
insert into Donor(Donor_ID,Donor_FName,Donor_LName,DPhone,DEmail,DAddress,Type)
    values (5290850158,'Tom', 'Simpson','568-323-3548','tomsimp@gamil.com','Sebastopol','Both'); 
    
insert into MoneyDonated (Donor_ID,Event_ID,AmountOfMoney,MDonateDate)
    Values (0920127916,7642801572,100000,to_date('5-21-16','MM-DD-YY')); 
insert into MoneyDonated (Donor_ID,Event_ID,AmountOfMoney,MDonateDate) 
    values (9140074142,5638910254,49,to_date('5-21-15','MM-DD-YY')); 
insert into MoneyDonated (Donor_ID,Event_ID,AmountOfMoney,MDonateDate) 
    values (2803758915,8509431579,200,to_date('5-21-05','MM-DD-YY')); 
insert into MoneyDonated (Donor_ID,Event_ID,AmountOfMoney,MDonateDate) 
    values (5290850158,8509431579,500,to_date('5-15-05','MM-DD-YY')); 
insert into MoneyDonated (Donor_ID,Event_ID,AmountOfMoney,MDonateDate) 
    values (5245650125,8509431579,875,to_date('5-16-05','MM-DD-YY')); 
    
insert into BookDonated (Donor_ID,Library_ID,Event_ID,NumberOfBooks) 
    values (0125829572,1100000000,7895310341,5);
insert into BookDonated (Donor_ID,Library_ID,Event_ID,NumberOfBooks) 
    values (5215750125,5500000000,7530912808,4);
insert into BookDonated (Donor_ID,Library_ID,Event_ID,NumberOfBooks) 
    values (5215750125,6600000000,7530912808,4);



insert into Executers (Executer_ID,Executer_Fname,Executer_Lname,Phone,Email,Department_ID,President_ID,Date_Joined,Role)
    values (7642009851,'Pierce', 'Ding','812-349-1020','congding@hotmail.com',0000000004,null,to_date('9-15-16','MM-DD-YY'),'president');
insert into Executers (Executer_ID,Executer_Fname,Executer_Lname,Phone,Email,Department_ID,President_ID,Date_Joined,Role)
    values (8509419011,'Yimei', 'Tong','135-790-256','yimei@iu.edu',0000000001,7642009851,to_date('3-15-15','MM-DD-YY'),'director');
insert into Executers (Executer_ID,Executer_Fname,Executer_Lname,Phone,Email,Department_ID,President_ID,Date_Joined,Role)
    values (0238750094,'Zi', 'Chai','581-923-9305','zichai@hotmail.com',0000000002,7642009851,to_date('9-15-16','MM-DD-YY'),'VP');
insert into Executers (Executer_ID,Executer_Fname,Executer_Lname,Phone,Email,Department_ID,President_ID,Date_Joined,Role)
    values (6749185093,'Amy', 'Zheng','812-349-8931','bmyzheng@gmail.com',0000000003,7642009851,to_date('9-15-16','MM-DD-YY'),'VP');
insert into Executers (Executer_ID,Executer_Fname,Executer_Lname,Phone,Email,Department_ID,President_ID,Date_Joined,Role)
    values (7589103100, 'Huaqiu', 'Zheng','091-053-9835','huaqiuzheng@gmail.com',0000000005,7642009851,to_date('9-15-16','MM-DD-YY'),'director');
    


insert into Information (Volunteer_ID,Program_ID)
    values (7398214390, 1010000000);
insert into Information (Volunteer_ID,Program_ID)
    values (8590410239, 1010000000);
insert into Information (Volunteer_ID,Program_ID)
    values (7583901275, 1020000000);
insert into Information (Volunteer_ID,Program_ID)
    values (7583901275, 1010000000);
insert into Information (Volunteer_ID,Program_ID)
    values (5901958159, 1030000000);
insert into Information (Volunteer_ID,Program_ID)
    values (5901958159, 1010000000);
insert into Information (Volunteer_ID,Program_ID)
    values (5901958159, 1020000000);
    
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (1,1000000000,to_date('5-21-16','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (2,1000000000, to_date('5-21-16','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (3,1000000000, to_date('5-21-16','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (4,1000000000, to_date('5-21-16','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (1,4000000000, to_date('4-1-05','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (1,3000000000, to_date('4-10-05','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (2,2000000000, to_date('6-14-13','MM-DD-YY'));
insert into DateEstablished (Department_ID, University_ID, Date_Established)
    values (1,2000000000, to_date('6-14-17','MM-DD-YY'));
