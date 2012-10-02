create or replace function cal_actualamount_byaccountpfId(accountId integer,platformId integer,stype integer)
  return NUMBER is
  result  NUMBER(15,2);
  inamount  NUMBER(15,2):=0;

begin

  if stype=2   then ---�տ�
     select sum(s.actual_amount)
     into inamount from statement s
      where s.type=2 and
        s.to_account_id in
         (select p.id from plat_com_account p where p.account_id=accountId and p.platform_id=platformId);
    end if;
         
 if  stype=1 then    ---����
     select sum(s.actual_amount)
     into inamount from statement s
      where s.type=1 and
        s.from_account_id in
         (select p.id from plat_com_account p where p.account_id=accountId and p.platform_id=platformId);
    end if;
 
    if inamount is null then
      inamount:=0;
    end if;

    result :=inamount;
    return result;

  end cal_actualamount_byaccountpfId;
/