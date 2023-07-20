use Practices;

select *
from Titanic;

--1.Show the first 10 rows of the dataset.
select top 10 *
from Titanic;

select top 10 *
from Titanic
order by PassengerId desc;

--2.Find the number of passengers who survived.
select count(*) Survived_Passengers
from Titanic
where Survived=1;

--3.Find the average age of all passengers.
select AVG(Age) Avg_Age
from Titanic;

--4.Find the number of passengers in each class.
select Pclass,count(*) Number_of_Passengers
from Titanic
group by Pclass;

--5.Find the first 10 rows of the dataset sorted by passenger class in descending order.
select top 10 *
from Titanic
order by Pclass DESC;

--6.Find the number of passengers in each class sorted by class in ascending order.
select Pclass,count(*) Number_of_passengers
from Titanic
group by Pclass
order by Pclass asc;

--6b.Find the number of passengers in each class sorted by number in ascending order.
select Pclass,count(*) Number_of_passengers
from Titanic
group by Pclass
order by Number_of_passengers asc;

--7.Find the average fare paid by passengers in each class.
select Pclass,AVG(Fare) Avg_Fare
from Titanic
group by Pclass;

--8.Find the name of the passenger with the highest fare.
select Name,Fare
from Titanic
where Fare=(select max(Fare)
            from Titanic);

--9.Find the name of the passenger who had the highest age among the suvivors.
select Name,Age,Survived
from Titanic
where Age=(select max(Age)
           from Titanic
		   where Survived=1);

--10.Find the number of passengers who paid more than the average fare.
select count(*) No_that_paid_more_than_avg
from Titanic
where Fare >(select avg(Fare)
             from Titanic);

--11.Find the name of the passenger who had the most parents or children on board.
select Name,Parch
From Titanic
where Parch =(select max(Parch)
              from Titanic);

--12.Find the number of Male and Female passengers who survived
--and order the results by sex in ascending order.
select Sex,count(*) No_of_Passengers
from Titanic
where Survived=1
group by Sex
order by Sex asc;

--13.Find the name,age and fare of the oldest passenger who survived.
select Name,Age,Fare
from Titanic
where Age=(select max(Age)
      from Titanic
      where Survived=1);

--14.Find the Name and age of the youngest female passenger who survived in third class.
select Name ,Age
From Titanic
where Age=(select min(Age)
           from Titanic
           where Survived=1 and Pclass=3 and Sex='female');

--15.Find the number of male and female passengers.
select Sex,count(*)
from Titanic
group by Sex;

select
sum(case when Sex='male' then 1 else 0 end) No_male,
sum(case when Sex='female' then 1 else 0 end) No_female
from Titanic;

--16.Select all passengers who travelled in a cabin that was not shared by other passengers.
select *
from Titanic
where Cabin IN(
               select Cabin
			   from Titanic
			   group by Cabin
			   having count(*) =1);
















		  






















































































