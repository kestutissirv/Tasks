/*
Query should return 5 columns for each account number: 
1. account_number
2. the biggest VALUE of transacted amount in last 7 days
3. the DATE  of biggest transacted amount in last 7 days 
4. the lowest VALUE of transacted amount in last 30 days
5. the DATE  of lowest transacted amount in last 30 days 
*/
select distinct
  trn.account_number,
  (select
     max(trn1.transaction_amt)
  from
    transaction_table trn1
  where
    trn1.account_number = trn.account_number and
    trunc(trn1.transaction_date) between trunc(sysdate) - 7 and trunc(sysdate)) max_amt_in_7days,
  (select
    max(trn2.transaction_date) keep (dense_rank first order by trn2.transaction_amt desc)
  from
    transaction_table trn2
  where
    trn2.account_number = trn.account_number and
    trunc(trn2.transaction_date) between trunc(sysdate) - 7 and trunc(sysdate)) date_of_max_amt_in_7days,
  (select
     min(trn3.transaction_amt)
  from
    transaction_table trn3
  where
    trn3.account_number = trn.account_number and
    trunc(trn3.transaction_date) between trunc(sysdate) - 30 and trunc(sysdate)) min_amt_in_30days,
  (select
    min(trn4.transaction_date) keep (dense_rank first order by trn4.transaction_amt asc)
  from
    transaction_table trn4
  where
    trn4.account_number = trn.account_number and
    trunc(trn4.transaction_date) between trunc(sysdate) - 30 and trunc(sysdate)) date_of_min_amt_in_30days
from 
  transaction_table trn 
order by 
  trn.account_number;
