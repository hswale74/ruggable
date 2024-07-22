# Data Exploration
I began the task with a bit of data exploration to understand the granularity of the tables. I used a brute force approach to test combinations of columns to identify those that had the same cardinality as the table. 

I focused on the rugs_usa_parent, rugs_usa_variant, and links tables. From eyeballing the data I had the sense that the ideas of ‘parent product’ and ‘variant’ were related to the ideas of material, brand, origin, and shape.

## Rugs usa parent
I noticed that the ‘pid’ key was not sufficient by itself as a primary key for the parent table, but ‘url’ was. Through exploration and some luck, I saw that the url contained a reference to both pid and color, which did not always match the ‘color’ field on the table itself. The pid and color (as derived from url) were adequate as a primary key.

I chose this model initially, but then it became clear to me that it was difficult to use this model for analysis. Without any explicit sales data, my only window into sales or operational metrics were the inventory columns on rugs_usa_variant, which did not contain a reference to color. I decided then to simply create a dimension table for product level dimensions like brand, category, material, and weave. I ensured that a given product_id (pid) had only a single unique value for brand, category, material, and weave and I created a simple dimension model.


## Rugs usa variant
For rugs_usa_variant, Pid and variant id together matched the cardinality of the table. I am still a little confused about what constitutes a parent product and what is a variant.  I noticed that ‘actual_size’ and ‘shape’ have a cardinality of 536 whereas the variant id column (‘variant’) has a cardinality of 587. Pretty close, so I settled on that though I’m sure I’m missing some of the picture.

This table was my only window into sales and inventory. I ultimately chose a simple measure of how well a product was selling: I used the 'status' and 'low_stock' columns and I derived a 'popular_product_flag' column which is true if the status is 'In stock' and the 'low_stock' flag is true, or when the status is backordered, preordered, or out of stock.

## Rugs usa links
This table seemed to showing search results from the rugs usa website. Each link seems to correspond to a parent product and color. The page link stipulates what page of the search you are on. I thought this might be interesting - what is the impact of search rank on popularity. 


# Analysis
Without having explicit sales transaction data, I chose to derive a measure of popularity as described above. I then used this to answer the following questions.

## Product
What are the most popular products and variants?

## Marketing 
How does the position of a product in the page rank affect sales?