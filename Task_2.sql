/*
2. Create a function to calculate π using the formula

Input parameter for function is precision and output the calculated value. Function must save the intermediate results into the table.
Every time by execution the function the previous results from table must be removed.
*/

create table pi_results_t(
  pi_id number, 
  pi_value number);
/
create or replace function calculate_pi(
  pn_prec number) return number is
  
  ln_result number;
begin
  
  delete from pi_results_t;
  for i in 0..pn_prec 
  loop 
    ln_result:= nvl(ln_result,0)+(1/power(16,i) *((4/(8*i+1))-(2/(8*i+4))-(1/(8*i+5))-(1/(8*i+6))));
    
    insert into pi_results_t(
      pi_id, 
      pi_value)
    values(
      i,
      ln_result);    
      
  end loop;
  commit;

  return ln_result;
end;
/
