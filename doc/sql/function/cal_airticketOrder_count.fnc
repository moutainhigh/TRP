create or replace function cal_airticketOrder_count(userId integer,ptype integer)
  return NUMBER is
  result  NUMBER(15,2);
  normalcount  NUMBER(15,2):=0;--������Ч��������
  retirecount  NUMBER(15,2):=0;--��Ʊ��������
  abolishcount number(15,2):=0;--��Ʊ��������
  umbuchencount  NUMBER(15,2):=0;--��ǩ��������
  cancelcount  NUMBER(15,2):=0;--ȡ����������
  totalcount  NUMBER(15,2):=0;--������������
begin
    if ptype=1 then               
       select count(distinct o.group_mark_no) into normalcount from airticket_order o
       where  o.status not in(22,32,45)  --�ˡ��ϡ���ǩ���
       and  exists(select t.order_no from ticket_log t where o.group_mark_no=t.order_no 
                  and t.user_id=userId and o.status in(5,22,32,45) and  t.type=7) ;                 
       totalcount :=normalcount;
    end if;
     if ptype=2 then
       select count(distinct o.group_mark_no) into retirecount from airticket_order o,ticket_log t
       where o.group_mark_no=t.order_no and t.user_id=userId and o.status in(22) and  t.type=12;  
       totalcount :=retirecount;
    end if;
     if ptype=3 then
       select count(distinct o.group_mark_no) into abolishcount from airticket_order o,ticket_log t
       where o.group_mark_no=t.order_no and t.user_id=userId and o.status in(32) and  t.type=17;  
      totalcount :=abolishcount;
    end if;
     if ptype=4 then
       select count(distinct o.group_mark_no) into abolishcount from airticket_order o,ticket_log t
       where o.group_mark_no=t.order_no and t.user_id=userId and o.status in(45) and  t.type=26;  
      totalcount :=umbuchencount;
    end if;
     if ptype=5 then
      --���롢����ȡ��
       select count(distinct o.group_mark_no) into cancelcount from airticket_order o,ticket_log t
       where o.group_mark_no=t.order_no and t.user_id=userId and o.status in(5) and  t.type in(4,6);  
      totalcount :=cancelcount;
    end if;   
     if ptype=6 then
        ----������������
       select count(distinct o.group_mark_no) into totalcount from airticket_order o,ticket_log t
       where o.group_mark_no=t.order_no and t.user_id=userId and o.status in(5,22,32,45) and t.type in(5,12,17); 
      totalcount :=totalcount;
    end if;

    result :=totalcount;
    return result;

  end cal_airticketOrder_count;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
/
