SELECT * FROM creditcard_project.credit_card;
SELECT * FROM creditcard_project.credit_card_label;
#Group the customers based on their income type and find the average of their annual income.

Select Type_Income,avg(Annual_income) as avg_annual_income
from credit_card
group by type_income;


#Find the female owners of cars and property.

Select Ind_ID,GENDER,Car_owner,Propert_owner
from credit_card
where Gender = 'F' AND 
Car_owner = 'Y' AND Propert_owner = 'Y';


#Find the male customers who are staying with their families.
Select Ind_ID,GENDER,Marital_status,Family_members
from credit_card
where GENDER = 'M' AND
Marital_status = 'Married'
AND Family_members > '1';



#Please list the top five people having the highest income.
SELECT Ind_ID,Annual_income
from credit_card
order by Annual_income DESC
LIMIT 5;



#How many married people are having bad credit?
Select count(Ind_ID),label
from credit_card_label
where label = '1';



#What is the highest education level and what is the total count?
Select count(Ind_ID),EDUCATION
from credit_card
where EDUCATION = 'Academic degree';





#Between married males and females, who is having more bad credit? 
Select MAX(GENDER),label
from credit_card
inner join credit_card_label
on credit_card.Ind_ID = credit_card_label.Ind_ID
where label ='1';