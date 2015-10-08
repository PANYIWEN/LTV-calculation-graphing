Sys.setlocale("LC_ALL",locale = "Japanese");
library(bigrquery);
project="pialab-rdmp";

#sql????????????--graph1
sql='SELECT customer_id,sum(total) as he FROM [nipcola.order_mst_all]
group by customer_id
order by customer_id'

#sql????????????--rf-graph
sql='SELECT customer_id,DATEDIFF(CURRENT_DATE(),max(TIMESTAMP(order_date))) as recency, count(order_id) as frequency FROM [nipcola.order_mst_all]
group by customer_id
order by recency,frequency'

#??????
data=query_exec(sql,project=project,max_pages = Inf)