create or replace function cal_airticketOrder_amount(userId integer,ptype integer)
  return NUMBER is
  result  NUMBER(15,2);
  normalInAmount  NUMBER(15,2):=0;--���������տ���
  normalOutAmount  NUMBER(15,2):=0;--��������������
  retireInAmount number(15,2):=0;--�ջ��˷�Ʊ�˿�(����ƽ̨�ջص�Ʊ��)
  retireOutAmount  NUMBER(15,2):=0;--֧���˷�Ʊ��(����ƽ̨�˷�Ʊ�˿�)
  totalAmount number(15,2):=0;
begin
    if ptype=1 then
      select sum(s.actual_amount) into normalInAmount from airticket_order o,Statement s
      where  o.status not in(22,32,45)  --�ˡ��ϡ���ǩ���
      and o.business_type=2 --1:���� 2������
      and o.statement_id=s.id
      and exists(select t.order_no from ticket_log t where o.group_mark_no=t.order_no
                  and t.user_id=userId and o.status in(5,22,32,45) and  t.type=7) ;
       totalAmount :=normalInAmount;
    end if;
     if ptype=2 then
         select sum(s.actual_amount) into normalInAmount from airticket_order o,Statement s
      where  o.status not in(22,32,45)
      and o.business_type=1
      and o.statement_id=s.id
      and exists(select t.order_no from ticket_log t where o.group_mark_no=t.order_no
                  and t.user_id=userId and o.status in(5,22,32,45) and  t.type=7) ;
       totalAmount :=normalOutAmount;
    end if;
     if ptype=3 then
       select sum(s.actual_amount) into retireInAmount  from airticket_order o,ticket_log t,statement s
       where o.group_mark_no=t.order_no and t.user_id=userId
       and o.business_type=1
       and o.status in(22,32) and  t.type in(12,17);
      totalAmount :=retireInAmount;
    end if;
     if ptype=4 then
      select sum(s.actual_amount) into retireInAmount  from airticket_order o,ticket_log t,statement s
       where o.group_mark_no=t.order_no and t.user_id=userId
       and o.business_type=2
       and o.status in(22,32) and  t.type in(12,17);
      totalAmount :=retireOutAmount;
    end if;

    if totalAmount is null then
      totalAmount:=0;
    end if;

    result :=totalAmount;
    return result;

  end cal_airticketOrder_amount;
/
