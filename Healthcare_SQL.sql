-- SQL Queries
select * from dialysis1;
select * from dialysis2;

-- KPI 1
select 
sum(`No of patients in the transfusion summary`) as 'Transfusion Summary', 
sum(`No of patients in hypercalcemia summary`) as 'Hypercalcemia Summary',
sum(`No of patients in Serum phosphorus summary`) as 'Erum Phosphorus Summary', 
sum(`No of patients in hospitalization summary`) as 'Hospitalization Summary',
sum(`No of hospitalizations in hospital readmission summary`) as 'Hospital Readmission Summary',
sum(`No of Patients in survival summary`) as 'Survival Summary',
sum(`No of Patients in fistula summary`) as 'fistula summary',
sum(`No of patients in long term catheter summary`) as 'Long term Catheter Summary',
sum(`No of patients in nPCR summary`) as 'nPCR Summary'
from dialysis1;

-- KPI 2
select `Profit or Non-Profit`, count(`Profit or Non-Profit`) as Count 
from dialysis1 where `Profit or Non-Profit`= 'Profit' or `Profit or Non-Profit`= 'Non-Profit' 
group by `Profit or Non-Profit`;

-- KPI 3
select `dialysis1`.`Chain Organization`, count(`dialysis2`.`Total Performance Score`) as `Count  of No score` 
from dialysis1 inner join  dialysis2 on `dialysis2`.`CMS Certification Number (CCN)` = `dialysis1`.`Provider No` 
where `dialysis2`.`Total Performance Score` = 'No Score' group by `dialysis1`.`Chain Organization`; 

-- KPI 4
select avg(`# of Dialysis Stations`) as `average dialysis stations`, 
sum(`# of Dialysis Stations`) as `Total dialysis stations`,
min(`# of Dialysis Stations`) as `minimum number of dialysis stations`,
max(`# of Dialysis Stations`) as `maximum number of dialysis stations`  
from dialysis1;

-- KPI 5
select 
sum(case when `Patient Transfusion category text`= 'As Expected' then 1 end) as`Patient Transfusion category text`,
sum(case when `Patient hospitalization category text`= 'As Expected' then 1 end) as`Patient hospitalization category text`,
sum(case when `Patient Survival Category Text`= 'As Expected' then 1 end) as`Patient Survival Category Text`,
sum(case when `Patient Infection category text`= 'As Expected' then 1 end) as`Patient Infection category text`,
sum(case when `Fistula Category Text`= 'As Expected' then 1 end) as`Fistula Category Text`,
sum(case when `SWR category text`= 'As Expected' then 1 end) as`SWR category text`,
sum(case when `PPPW category text`= 'As Expected' then 1 end) as`PPPW category text`
from dialysis1;

-- KPI 6
select round(avg(`PY2020 Payment Reduction Percentage`),2) as `Average Payment Reduction` from dialysis2;