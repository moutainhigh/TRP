create or replace procedure create_OPT_TRANSACTION(opt_date TIMESTAMP,sessionId String,userDepart long) is

begin
  delete from OPT_TRANSACTION o where o.session_id=sessionId;

  insert into OPT_TRANSACTION
    (
      id,
      USER_NAME,
      SELLORDERSTOTAL,
      NORMALORDER,--������Ч������      
      REFUNDORDER,--��Ʊ
      INVALIDORDER,--��Ʊ
      ALTEREDORDER,--��ǩ������
      CANCELORDER,--ȡ��������
      SOLDTICKET_COUNT,--������Ʊ����
      INAMOUNT,
      OUTAMOUNT,
      PROFIT,
      REFUNDAMOUNTRECEIVED,--���˷��˿�
      REFUNDAMOUNTPAID,--���˷��˿�
      CANCELTICKETCOLLECTION,
      CANCELTICKETREFUND,
      session_id,
      OPT_DATE
    )
   select
     SEQ_OPTTRANSACTION.Nextval,
     u.user_name,
     0,
     cal_airticketOrder_count(u.user_id,1),    
     cal_airticketOrder_count(u.user_id,2),
     cal_airticketOrder_count(u.user_id,3),
     cal_airticketOrder_count(u.user_id,4),
     cal_airticketOrder_count(u.user_id,5),     
     cal_airticketnumber_by_user(u.user_id,1),
     cal_airticketOrder_amount(u.user_id,1),
     cal_airticketOrder_amount(u.user_id,2),
     0,
     cal_airticketOrder_amount(u.user_id,3),
     cal_airticketOrder_amount(u.user_id,4),
     0,
     0,
     sessionId,
     cast(opt_date as date)
     from sys_user u,dual d
     where u.user_depart =userDepart;
     commit;
     -----------
     update OPT_TRANSACTION set SELLORDERSTOTAL=(NORMALORDER+REFUNDORDER+INVALIDORDER+ALTEREDORDER+CANCELORDER) where 1=1 ;
     update OPT_TRANSACTION set profit=(INAMOUNT-OUTAMOUNT) where 1=1 ;
     -------------
     commit;

end create_OPT_TRANSACTION;
/
