use doraemon;
select*from qq
alter table qq 
rename to churn_ana ;
select * from churn_ana;

select * from qq where tenure is null;
select count(*) from churn_ana;


#what is total churn in data set calculate;
select count(churn) from churn_ana where churn = "yes";



#ques2 how many male churn and female churn calculate
select gender,  count(churn) from churn_ana  where churn = "yes" group by gender;

#show the number of customer who chured in each month;
select tenure, count(churn)  from churn_ana where churn = "yes" group by tenure order by tenure asc limit 1;
 
 
 # average tenure before  churn (calculate the average number of days between signup_date and churn date for cjurned customer.
 select*from qq;
 select churn,avg(tenure) from churn_ana  group by churn;
 
 #calculate the average monthlycharges and totalcharges for churned customes
 select churn ,avg(MonthlyCharges +TotalCharges) as both_charges from churn_ana where churn = "yes";
 
 #which interetservice type highest churn rate
 select InternetService, count(churn) from churn_ana where churn = "yes" group by InternetService limit 1;
 
 # segmentation  and filtering questions;
# Q.list the top 10 customer (by totalcharges)who have churned;
select*from qq;
select CustomerID,  TotalCharges from churn_ana where churn = "yes" order by TotalCharges desc  limit 10 ;
 
#Q.  find all customer who have tenure <6 and monthly charges >80 -potential high risk customers;
select   CustomerID , tenure, MonthlyCharges from churn_ana where Tenure <6 and MonthlyCharges > 80 ;
#q.show the number of customer who had tech support  = "no" and churned
select churn ,  count(CustomerID) from churn_ana where TechSupport  = "no" and churn = "yes" group by churn;
 
# q.identify customer with fiber optics service and month_to_month contract who churned;
SELECT 
    CustomerID, InternetService, ContractType, Churn
FROM
    churn_ana
WHERE
    InternetService = 'Fiber Optic'
        AND ContractType = 'Month-to-Month'
        AND Churn = 'yes'; 
 #Q.find the average monthlycharges by contract_type only for customer those are churned; 
 select ContractType   ,avg(MonthlyCharges)   from churn_ana where churn = "yes" group by ContractType;
 select*from qq;
 
 
 #TREND OR PATTERN DISCOVERY
 #which combination of contratType and internetservice has the highest churn rate
 select churn, count(ContractType) and count(InternetService)from churn_ana  where churn = "yes" group by InternetService and ContractType limit 1;
select ContractType,InternetService, count(case when  churn = "yes" then 1 end)*1.0/count(*)as churn_rate from churn_ana group by  ContractType,InternetService order by churn_rate desc limit 1;

#Q compare the average tenure between churned and retained customer;
select  churn, avg(Tenure) from churn_ana group by churn;

#what is churn rate for customers who had  techsupport = "yes" and "no"?
select  churn , count(TechSupport) from  churn_ana group by churn;


#questoin find the percentage of customer in ech internet servie type who churned ?
select internetService, round(sum(case when churn = "yes" then 1 else 0 end)
*100.0/count(internetService) ,2)as chu_per from churn_ana group by internetService;                                                                          



