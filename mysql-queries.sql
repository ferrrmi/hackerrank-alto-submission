-- count, min max, sum total volume warehouses each of customer
SELECT c.name as name, count(w.customer_id) as warehouses, min(w.volume) as min_volume, max(w.volume) as max_volume, sum(w.volume) as total_volume
from customers c
left join warehouses  w
on c.id = w.customer_id
where w.is_active = 1
GROUP by c.name
order by c.name;

-- sum cost and traffic of each mac user
select c.mac as mac, sum(t.amount) as traffic, ROUND(sum(t.amount * c.tariff),2) as cost
from clients c
left join traffic t
on c.id = t.client_id
where t.dt between '2022-05-01' and '2022-05-31'
GROUP by c.mac
order by cost desc;

-- bitcoin trx group by wallet, and count sum each wallet
SELECT wallet_address, 
       SUM(is_sender) as count_of_sending, 
       SUM(is_recipient) as count_of_recipient, 
       SUM(CASE WHEN transaction_type = 'incoming' THEN amount ELSE 0 END) 
       - SUM(CASE WHEN transaction_type = 'outgoing' THEN amount ELSE 0 END) AS balance
FROM (
   SELECT sender as wallet_address,'outgoing' AS transaction_type, 1 as is_sender, 0 as is_recipient, amount FROM transactions where dt between '2021-01-01' and '2021-12-31'
    UNION ALL
    SELECT recipient as wallet_address, 'incoming' AS transaction_type, 0 as is_sender, 1 as is_recipient, amount FROM transactions where dt between '2021-01-01' and '2021-12-31'
) as combined
GROUP BY wallet_address
order BY wallet_address;