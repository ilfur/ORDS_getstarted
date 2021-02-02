select city, 
       json_objectagg('name' is last_name) cust_per_city 
from src_customer, src_city
where city like 'Co%' 
and src_customer.city_id like src_city.city_id
group by city;




select json_object('country_name' is r.country, 
                   'ctinfo' is 
        (select json_arrayagg(
                json_object('name' is last_name,
                            'phone' is phone, 
                            'city' is city, 
                            'street' is address absent on null)             
                            absent on null) 
                from src_customer co , src_city c, src_region r
                where co.city_id = c.city_id
                and c.region_id = r.region_id
                and age < 40)          
                absent on null) as ct1
from src_region r;




select json_object('is_Boolean' is 'true' format json) from dual;





select json_arrayagg (
          json_object (
             'custId' is custid,
             'orderId' is order_id,
             'order_date' is order_date,
             'items' is json_arrayagg (json_object (
                'product' is product,
                'quantity' is qty,
                'amount' is amount
                ) returning clob
             )
          ) 
       returning clob) json_data from v_orders360
       group by custid, order_id, order_date;
       

select json_object (
   'lastName' is last_name,
   'firstName' is first_name,
   'address' is address,
   'city' is city,
   'phone' is phone,
   'salesPerson' is sp_first_name||' '||sp_last_name
 returning varchar2(32000)) from v_cust360
 where custid = '102';
