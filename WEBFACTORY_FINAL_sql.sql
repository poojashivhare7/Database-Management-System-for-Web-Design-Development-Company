
Drop table WEB_TEMP_ASSOCIATION;
Drop table WEB_CUST_ASSOCIATION;
Drop table WORK_EMP_ASSOCIATION;
Drop table W_CUSTOMIZATION;
Drop table W_EMPLOYEE;
Drop table W_WEBSITE;
Drop table W_TEMPLATE_TYPE;
Drop table W_HOSTING;
Drop table W_INVOICE;
Drop table W_WORK_ORDER;
Drop table W_CLIENT;
--------------------------------



Create table W_CLIENT(
Client_ID number(10) NOT NULL,
Client_name VARCHAR2 (25 BYTE)  NOT NULL,
Clinet_Phoneno VARCHAR2 (20 BYTE),
Client_Email  VARCHAR2 (25 BYTE) UNIQUE  NOT NULL,
Client_Address  VARCHAR2 (100 BYTE),
Constraint clinetIDpk primary key(Client_ID));


--------------------------------
Create table W_WORK_ORDER(
Order_ID number(10) NOT NULL,
Content_link VARCHAR2 (70 BYTE) NOT NULL,
Start_Date DATE NOT NULL,
Build_Date DATE NOT NULL,
Completion_Date DATE NOT NULL,
Notes  VARCHAR2 (100 BYTE),
Constraint OrderIDpk primary key(Order_ID),
Client_ID number(10) NOT NULL,
Constraint ClientID_fk foreign key(Client_ID) references W_CLIENT(
Client_ID));
-----------------------------------
Create table W_INVOICE(
Invoice_ID number(10) NOT NULL,
Invoice_Date DATE NOT NULL,
Payment_Status  VARCHAR2 (5 BYTE),
Constraint InvoiceIDpk primary key(Invoice_ID));

------------------------------------
Create table W_HOSTING(
Hosting_ID number(10) NOT NULL,
Hosting_Server VARCHAR2 (25 BYTE)NOT NULL,
Hosting_Package VARCHAR2 (25 BYTE)NOT NULL,
Hosting_Provider VARCHAR2 (25 BYTE)NOT NULL,
Hosting_Charge NUMBER (8,2) NOT NULL,
Constraint HostingIDpk primary key(Hosting_ID));

-----------------------------------
Create table W_TEMPLATE_TYPE(
Template_ID number(10) NOT NULL,
Template_Name VARCHAR2 (15 BYTE)NOT NULL,
Template_Description VARCHAR2 (50 BYTE)NOT NULL,
Template_Charge NUMBER (8,2)NOT NULL,
Constraint TemplateIDpk primary key(Template_ID));

--------------------------------
Create table W_WEBSITE(
Website_ID number(10) NOT NULL,
Order_ID number(10) NOT NULL,
Hosting_ID number(10) NOT NULL,
Invoice_ID number(10) NOT NULL,
Website_Description VARCHAR2 (50 BYTE),
Constraint Website_IDpk primary key(Website_ID),
Constraint OrderID_fk foreign key(Order_ID) references W_WORK_ORDER(
Order_ID),
Constraint HostingID_fk foreign key(Hosting_ID) references W_HOSTING(
Hosting_ID),
Constraint InvoiceID_fk foreign key(Invoice_ID) references W_INVOICE(
Invoice_ID)); 

--------------------------------
Create table W_EMPLOYEE(
Employee_ID number(10) NOT NULL,
Employee_role varchar(15) NOT NULL,
Employee_Description varchar(50),
Constraint Employee_IDpk primary key(Employee_ID)
);


------------------------------------
Create table W_CUSTOMIZATION(
Customization_ID number(10) NOT NULL,
Customization_Charge number(8,2) NOT NULL,
Customization_Description varchar(50),
Constraint Customization_IDpk primary key(Customization_ID)
);

------------------------------------
Create table WORK_EMP_ASSOCIATION(
Order_ID number (10) NOT NULL,
Employee_ID number (10) NOT NULL,
Notes_Emp_describe varchar(50),
Constraint WORK_EMP_ASSOCIATION_pk Primary key (Order_ID,Employee_ID),
Constraint Order_ID_fk foreign key (Order_ID) references W_Work_Order(Order_ID),
Constraint Emp_ID_fk foreign key (Employee_ID) references W_EMPLOYEE(Employee_ID)
);

-----------------------------------
Create table WEB_CUST_ASSOCIATION(
Website_ID number(10) NOT NULL,
Customization_ID number(10) NOT NULL,
Notes_Cust_describe varchar(50),
Constraint Web_Custom_Assoc_PK primary key (Website_ID,Customization_ID),
Constraint W_custom_ID_fk foreign key (Website_ID) references W_Website(Website_ID),
Constraint Cust_ID_fk foreign key (Customization_ID) references W_CUSTOMIZATION(Customization_ID)
);

-----------------------------------

Create table WEB_TEMP_ASSOCIATION(
Website_ID number (10) NOT NULL,
Template_ID number (10) NOT NULL,
Notes_Temp_describe varchar(50),
constraint web_t_association_pk primary key(Website_ID,Template_ID),
constraint web_id_fk foreign key(Website_ID) references W_Website(Website_ID),
constraint temp_id_fk foreign key (Template_ID) references W_Template_Type(Template_ID)
);


--------------------

insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2345, 'Anna G','+1-9827462846', 'anna.g@gmail.com', 'Hartford ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2346, 'James King','+1-9827464545', 'james.k@gmail.com', '100wells street, Hartford ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2347, 'Jessica Pearson','+1-9539462846', 'jessica.pearson@gmail.com', '100 constitiution plaza, Hartford');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2348, 'Meghna Ashok','+1-9827463946', 'meghna.ashok@gmail.com', '9660 Cambridge Lane
Willingboro, NJ 08046 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2349, 'Yashi Gupta','+1-9827462123', 'yash.g@gmail.com', '30 County Rd.
Windermere, FL 34786 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2350, 'Mohit Gupta','+1-9827462096', 'mohit.g@gmail.com', '2 Armstrong Dr.
Rosemount, MN 55068');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2351, 'Jasika Kalra','+1-9027462846', 'jasika.kalra@gmail.com', '670 Illinois Dr.
Oconomowoc, WI 53066 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2352, 'Pooja S','+1-8827462846', 'pooja.s@gmail.com', '564 East Hilltop Drive
Midland, MI 48640 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2353, 'Joe Jones','+1-8477462846', 'joe.j@gmail.com', '444 Hickory Rd.
Norfolk, VA 23503 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2354, 'Nick J','+1-7947462846', 'nick.j@gmail.com', '98 North Main Avenue
Miamisburg, OH 45342 ');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2355, 'Leonardo D','+1-7507462846', 'leonardo.d@gmail.com', '3 Pilgrim Dr.
Fair Lawn, NJ 07410');
insert into W_CLIENT (Client_ID,Client_name,Clinet_Phoneno,Client_Email, Client_Address) values(2356, 'Kate Winset','+1-9826982846', 'kate.winset@gmail.com', '26 Manhattan Dr.
Birmingham, AL 35209');
--------------------------------

insert into W_WORK_ORDER values(1234,'https://www.creation.com' , '20-AUG-2021', '03-OCT-2021', '03-NOV-2021','include world map as customization',2345);
insert into W_WORK_ORDER values(1235,'https://www.animals.com' , '20-JUN-2020', '03-SEP-2020', '03-OCT-2020','include blue border as customization',2346);
insert into W_WORK_ORDER values(1236,'https://www.crystal.com' , '15-AUG-2021', '01-OCT-2021', '03-NOV-2021','include animation as customization',2347);
insert into W_WORK_ORDER values(1237,'https://www.quizlet.com' , '13-SEP-2020', '10-NOV-2020', '10-DEC-2020','include cartoons as customization',2348);
insert into W_WORK_ORDER values(1238,'https://www.physio.com' , '09-JAN-2021', '03-MAR-2021', '03-APR-2021','include princess theme as template',2349);
insert into W_WORK_ORDER values(1239,'https://www.webester.com' , '20-FEB-2021', '10-APR-2021', '06-MAY-2021','include world map as customization',2350);
insert into W_WORK_ORDER values(1240,'https://www.swiggy.com' , '12-APR-2020', '03-JUN-2020', '06-JUL-2021','include coloured links as customization',2351);
insert into W_WORK_ORDER values(1241,'https://www.zomato.com' , '10-MAY-2020', '03-AUG-2020', '03-SEP-2020','include animation as customization',2352);
insert into W_WORK_ORDER values(1242,'https://www.uber.com' , '06-JUN-2021', '05-AUG-2021', '03-OCT-2021','include red border as customization',2353);
insert into W_WORK_ORDER values(1243,'https://www.ola.com' , '10-JUL-2020', '14-SEP-2020', '09-OCT-2020','include cartoons as customization',2354);
insert into W_WORK_ORDER values(1244,'https://www.snap.com' , '10-OCT-2020', '07-DEC-2020', '03-FEB-2021','include world map as customization',2355);
insert into W_WORK_ORDER values(1245,'https://www.skyp.com' , '07-NOV-2020', '06-JAN-2021', '15-FEB-2021','include star theme as template',2356);
--------------------------------

insert into W_INVOICE values(3456,'03-NOV-2021','NO');
insert into W_INVOICE values(3457,'03-OCT-2020','YES');
insert into W_INVOICE values(3458,'03-NOV-2021','NO');
insert into W_INVOICE values(3459,'10-DEC-2020','YES');
insert into W_INVOICE values(3460,'03-APR-2021','YES');
insert into W_INVOICE values(3461,'06-MAY-2021','YES');
insert into W_INVOICE values(3462,'06-JUL-2021','NO');
insert into W_INVOICE values(3463,'03-SEP-2020','YES');
insert into W_INVOICE values(3464,'03-OCT-2021','NO');
insert into W_INVOICE values(3465,'09-OCT-2020','YES');
insert into W_INVOICE values(3466,'03-FEB-2021','YES');
insert into W_INVOICE values(3467,'15-FEB-2021','YES');
--------------------------------

insert into W_HOSTING values(5670,'AWS', 'premium','Amazon', 96.67);
insert into W_HOSTING values(5671,'Akamai Technologies, Inc.', 'platinum','Akamai International B.V.', 100.67);
insert into W_HOSTING values(5672,'Google LLC', 'pxecutive','Google', 78.60);
insert into W_HOSTING values(5673,'AWS', 'economy','Amazon', 96.67);
insert into W_HOSTING values(5674,'Microsoft LLC', 'deluxe','Microsoft', 89.05);
insert into W_HOSTING values(5675,'AWS', 'gold','Amazon', 96.67);
insert into W_HOSTING values(5676,'AWS', 'silver','Amazon', 45.07);
insert into W_HOSTING values(5677,'Akamai Technologies, Inc.', 'premium','Akamai International B.V.', 103.78);
insert into W_HOSTING values(5678,'AWS', 'premium','Amazon', 123.78);
insert into W_HOSTING values(5679,'Google LLC', 'platinum','Google LLC', 78.67);
insert into W_HOSTING values(5680,'AWS', 'economy','Amazon', 120.89);
insert into W_HOSTING values(5681,'Microsoft LLC', 'deluxe','Microsoft', 130.67);
--------------------------------

insert into W_EMPLOYEE values (101,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (102,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (103,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (104,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (105,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (106,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (107,'Developer','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (108,'Tester','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (109,'Tester','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (110,'Tester','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (111,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (112,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (113,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (114,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (115,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (116,'Account Manager','Works in 9am-5pm shift');
insert into W_EMPLOYEE values (117,'Developer','Works in 9am-5pm shift');
--------------------------------

insert into W_TEMPLATE_TYPE values (1,'Standard','Default template',10);
insert into W_TEMPLATE_TYPE values (2,'Stylepoint','Perfect template to showcase your work',20);
insert into W_TEMPLATE_TYPE values (3,'Dashcore','Lightweight and customizable theme',40);
insert into W_TEMPLATE_TYPE values (4,'Zeen','News and Magazine theme',50);
insert into W_TEMPLATE_TYPE values (5,'Jupiter','Fastest and lightest theme',60);
insert into W_TEMPLATE_TYPE values (6,'NOHO','Creative portfolio theme',50);
insert into W_TEMPLATE_TYPE values (7,'BeTheme','Business and Personal template',30);
insert into W_TEMPLATE_TYPE values (8,'Enfold','User friendly ecommerce and portfolios theme',40);
insert into W_TEMPLATE_TYPE values (9,'Rhythm','Fully-responsive template',20);
insert into W_TEMPLATE_TYPE values (10,'Tersus','Elegant and professional portfolio template',50);
insert into W_TEMPLATE_TYPE values (11,'Histogram','Images and layouts',20);
insert into W_TEMPLATE_TYPE values (12,'TheNa','Horizontal-scrolling sites',30);
insert into W_TEMPLATE_TYPE values (13,'Princess','Images and light theme',20);
insert into W_TEMPLATE_TYPE values (14,'Star','Extra features',50);
--------------------------------

insert into W_WEBSITE values (1,1234,5670,3456,'Customized website including world map');
insert into W_WEBSITE values (2,1235,5671,3457,'Customized website with blue border');
insert into W_WEBSITE values (3,1236,5672,3458,'Customized website including animations');
insert into W_WEBSITE values (4,1237,5673,3459,'Customized website including cartoons');
insert into W_WEBSITE values (5,1238,5674,3460,'Princess theme website');
insert into W_WEBSITE values (6,1239,5675,3461,'Customized website including world map');
insert into W_WEBSITE values (7,1240,5676,3462,'Customized website including coloured links');
insert into W_WEBSITE values (8,1241,5677,3463,'Customized website including animations');
insert into W_WEBSITE values (9,1242,5678,3464,'Customized website with red border');
insert into W_WEBSITE values (10,1243,5679,3465,'Customized website including cartoons');
insert into W_WEBSITE values (11,1244,5680,3466,'Customized website including world map');
insert into W_WEBSITE values (12,1245,5681,3467,'Star themed website');
--------------------------------

insert into W_CUSTOMIZATION values (1,20,'Customize borders');
insert into W_CUSTOMIZATION values (2,10,'Customize links');
insert into W_CUSTOMIZATION values (3,30,'Customize animations');
insert into W_CUSTOMIZATION values (4,40,'Customize theme');
insert into W_CUSTOMIZATION values (5,20,'Customize world map');
insert into W_CUSTOMIZATION values (6,20,'Customize layout');
insert into W_CUSTOMIZATION values (7,15,'Customize cartoons');
insert into W_CUSTOMIZATION values (8,20,'Customize Buttons');
insert into W_CUSTOMIZATION values (9,30,'Customize UI interface');
insert into W_CUSTOMIZATION values (10,10,'Customize Fonts');
insert into W_CUSTOMIZATION values (11,20,'Customize Background ');
--------------------------------

insert into WEB_CUST_ASSOCIATION values (1,5,'Customized website including world map');
insert into WEB_CUST_ASSOCIATION values (2,1,'Customized website with blue border');
insert into WEB_CUST_ASSOCIATION values (3,3,'Customized website including animations');
insert into WEB_CUST_ASSOCIATION values (4,7,'Customized website including cartoons');
insert into WEB_CUST_ASSOCIATION values (5,4,'Princess theme website');
insert into WEB_CUST_ASSOCIATION values (6,5,'Customized website including world map');
insert into WEB_CUST_ASSOCIATION values (7,2,'Customized website including coloured links');
insert into WEB_CUST_ASSOCIATION values (8,3,'Customized website including animations');
insert into WEB_CUST_ASSOCIATION values (9,1,'Customized website with red border');
insert into WEB_CUST_ASSOCIATION values (10,7,'Customized website including cartoons');
insert into WEB_CUST_ASSOCIATION values (11,5,'Customized website including world map');
insert into WEB_CUST_ASSOCIATION values (12,4,'Star themed website');
insert into WEB_CUST_ASSOCIATION values (1,6,'Customized website including world map');
insert into WEB_CUST_ASSOCIATION values (1,7,'Customized website including world map');
insert into WEB_CUST_ASSOCIATION values (3,4,'Customized website including animations');
insert into WEB_CUST_ASSOCIATION values (3,6,'Customized website including animations');
insert into WEB_CUST_ASSOCIATION values (8,2,'Customized website including coloured links');
insert into WEB_CUST_ASSOCIATION values (9,2,'Customized website including coloured links');
--------------------------------

insert into WEB_TEMP_ASSOCIATION values (1,4,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (2,11,'Customized website with blue border');
insert into WEB_TEMP_ASSOCIATION values (3,9,'Customized website including animations');
insert into WEB_TEMP_ASSOCIATION values (4,11,'Customized website including cartoons');
insert into WEB_TEMP_ASSOCIATION values (5,13,'Princess theme website');
insert into WEB_TEMP_ASSOCIATION values (6,4,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (7,11,'Customized website including coloured links');
insert into WEB_TEMP_ASSOCIATION values (8,11,'Customized website including animations');
insert into WEB_TEMP_ASSOCIATION values (9,10,'Customized website with red border');
insert into WEB_TEMP_ASSOCIATION values (10,8,'Customized website including cartoons');
insert into WEB_TEMP_ASSOCIATION values (11,4,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (12,14,'Star themed website');
insert into WEB_TEMP_ASSOCIATION values (1,5,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (1,6,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (2,10,'Customized website with blue border');
insert into WEB_TEMP_ASSOCIATION values (2,9,'Customized website with blue border');
insert into WEB_TEMP_ASSOCIATION values (4,9,'Customized website including cartoons');
insert into WEB_TEMP_ASSOCIATION values (4,6,'Customized website including cartoons');
insert into WEB_TEMP_ASSOCIATION values (7,4,'Customized website including world map');
insert into WEB_TEMP_ASSOCIATION values (8,4,'Customized website including world map');
--------------------------------

insert into WORK_EMP_ASSOCIATION values (1234,101,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1235,102,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1236,102,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1237,102,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1236,103,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1237,104,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1238,104,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1238,105,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1239,106,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1236,106,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1241,106,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1242,106,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1240,107,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1241,101,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1242,102,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1243,103,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1244,104,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1245,103,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1244,103,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1241,103,'Developer assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1234,111,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1235,111,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1236,116,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1237,115,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1238,114,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1239,113,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1240,111,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1241,112,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1242,113,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1243,114,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1244,115,'Account Manager assigned for the order');
insert into WORK_EMP_ASSOCIATION values (1245,116,'Account Manager assigned for the order');
--------------------------------

select * from WEB_TEMP_ASSOCIATION;
select * from WEB_CUST_ASSOCIATION;
select * from WORK_EMP_ASSOCIATION;
select * from W_CUSTOMIZATION;
select * from W_EMPLOYEE;
select * from W_WEBSITE;
select * from W_TEMPLATE_TYPE;
select * from W_HOSTING;
select * from W_INVOICE;
select * from W_WORK_ORDER;
select * from W_CLIENT;
--------------------------------


--QUERY 1

select e.employee_id, count(w.website_id) AS "No.of Websites Assigned", listagg(w.website_id,', ') within group(order by w.website_id) as "Website_ID",
(case
when count(w.website_id)=4 then 'Developer Available to work on 1 Website'
when count(w.website_id)=3 then 'Developer Available to work on 2 Website'
when count(w.website_id)=2 then 'Developer Available to work on 3 Website' 
when count(w.website_id)=1 then 'Developer Available to work on 4 Websites' 
when count(w.website_id)=0 then 'Developer Available to work on 5 Websites'
else 'Developer Unavailable' end) AS  "Availability"
from w_website w join w_work_order o on w.order_id=o.order_id
join work_emp_association a on a.order_id=o.order_id
right outer join w_employee e on a.employee_id=e.employee_id
where e.employee_role='Developer' AND '&date'<o.completion_date
group by e.employee_id
order by 2;

--QUERY 2
select w_customization.customization_id, concat(round(avg(build_date - start_date)),' days') days_to_build_website , w_customization.customization_description
from w_website 
inner join w_work_order
on w_website.order_id = w_work_order.order_id
inner join web_cust_association
on web_cust_association.website_id = w_website.website_id
inner join w_customization
on w_customization.customization_id = web_cust_association.customization_id
group by w_customization.customization_id, w_customization.customization_description
order by w_customization.customization_id  ;

--QUERY 3
select  i.Invoice_ID, w.website_id, sum(c.Customization_Charge) "Customization Charge in $" , sum(h.Hosting_Charge) "hosting charge in $" ,sum(t.Template_Charge) "template charge in $",sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge) "Total Amount in $"
from W_INVOICE i left join W_WEBSITE w
on i.INVOICE_ID =w.Invoice_ID
left join W_HOSTING h
on h.Hosting_ID= w.Hosting_ID
left join Web_Cust_Association wca
on w.Website_id= wca.Website_id
left join W_Customization c
on c.Customization_ID= wca.Customization_ID
left join Web_Temp_Association wta
on w.Website_id= wta.Website_id
left join W_TEMPLATE_TYPE t
on wta.template_id=t.template_id
group by (w.Website_id, i.INVOICE_ID)
order by 6;

--QUERY 4
select  e.employee_id, sum(c.Customization_Charge) "Customization Charge in $" , sum(h.Hosting_Charge)"hosting charge in $" ,sum(t.Template_Charge)"template charge in $",sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge)"Total Amount in $", (case when sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge)>2000 then 100 when sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge)>1500 then 70 when sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge)>1000 then 50 when sum(c.Customization_Charge)+sum(h.Hosting_Charge)+sum(t.Template_Charge)>500 then 30 else 0 END)"bonus in $ given to employees"
from W_EMPLOYEE e  join Work_Emp_Association wea
on e.employee_ID =wea.employee_ID
join w_work_order o
on o.order_id=wea.order_id
join w_website w
on o.order_id=w.order_id
join W_HOSTING h
on h.Hosting_ID= w.Hosting_ID
join Web_Cust_Association wca
on w.Website_id= wca.Website_id
join W_Customization c
on c.Customization_ID= wca.Customization_ID
join Web_Temp_Association wta
on w.Website_id= wta.Website_id
join W_TEMPLATE_TYPE t
on wta.template_id=t.template_id
group by ( e.employee_id)
order by 5 desc;