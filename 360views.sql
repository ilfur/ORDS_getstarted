--------------------------------------------------------
--  DDL for View V_CUST360
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODI_DEMO"."V_CUST360" ("CUSTID", "DEAR", "LAST_NAME", "FIRST_NAME", "ADDRESS", "CITY_ID", "PHONE", "AGE", "SALES_PERS_ID", "REGION", "COUNTRY_ID", "COUNTRY", "CITY", "REGION_ID", "POPULATION", "SP_FIRST_NAME", "SP_LAST_NAME", "SP_HIRE_DATE") AS 
  select 
       cust.custid, 
       cust.dear,
    cust.last_name,
    cust.first_name,
    cust.address,
    cust.city_id,
    cust.phone,
    cust.age,
    cust.sales_pers_id,
    r.region,
    r.country_id,
    r.country,
    c.city,
    c.region_id,
    c.population,
    sp.first_name sp_first_name,
    sp.last_name sp_last_name,
    sp.hire_date sp_hire_date
from src_customer cust, src_region r, src_city c, src_sales_person sp
where cust.sales_pers_id = sp.sales_pers_id
and cust.city_id = c.city_id
and c.region_id = r.region_id
;


--------------------------------------------------------
--  DDL for View V_ORDERS360
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ODI_DEMO"."V_ORDERS360" ("ADDRESS", "AGE", "CITY_ID", "CUSTID", "DEAR", "FIRST_NAME", "LAST_NAME", "PHONE", "SALES_PERS_ID", "CUSTOMER", "ORDER_DATE", "ORDER_ID", "STATUS", "AMOUNT", "QTY", "PRODUCT_ID", "LORDER_ID", "FAMILY_NAME", "PRICE", "PRODUCT") AS 
  select 
   cust.address,
   cust.age,
   cust.city_id,
   cust.custid,
   cust.dear,
   cust.first_name,
   cust.last_name,
   cust.phone,
   cust.sales_pers_id,
   ord.customer,
   ord.order_date,
   ord.order_id,
   ord.status,
   ordl.amount,
   ordl.qty,
   ordl.product_id,
   ordl.lorder_id,
   prod.family_name,
   prod.price,
   prod.product
from src_customer cust, src_orders ord, src_order_lines ordl, src_product prod
where cust.custid = ord.cust_id
and ordl.order_id = ord.order_id
and prod.product_id = ordl.product_id
;


