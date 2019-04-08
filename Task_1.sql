/*
1. Create a program where input parameter is a number (age) and output is a text
corresponding to the age.
*/
declare
  ln_age number;
  lv_text varchar2(50);
begin
  ln_age := &age;
  if ln_age < 0 or ln_age is null then
    lv_text := 'Error: Incorrect age'; -- Nors užduotyje nenurodyta, darau prielaidą, kad amžius negali būti neigiamas skaičius ar nenurodytas
  elsif ln_age < 7 then 
    lv_text := 'You are infant';
  elsif ln_age < 18 then 
    lv_text := 'You are schoolchild';
  elsif ln_age < 40 then  
    lv_text := 'You are adult';
  elsif ln_age < 55 then  
    lv_text := 'You are in middle-age';
  else
    lv_text := 'You are aged';
  end if;
  dbms_output.put_line(lv_text);
end;
