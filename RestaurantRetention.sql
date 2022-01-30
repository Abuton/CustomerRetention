SELECT purchase_month,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 0), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_0,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 1), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_1,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 2), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_2, 
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 3), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_3,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 4), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_4, 
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 5), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_5, 
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 6), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_6, 
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 7), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_7, 
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 8), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_8,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 9), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_9,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 10), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_10,
            round(count(DISTINCT IIF((subs_purchase_month-purchase_month = 11), user_id, null))/count(DISTINCT IIF( (subs_purchase_month - purchase_month) = 0, user_id, null)),2) as month_11            
    
            FROM 
            
            (SELECT strftime('%m', outer_p.purchase_date) as subs_purchase_month, 
            purchase_month,
            first_time_purchase.user_id 
            FROM( 
            SELECT 
              min(strftime('%m', f.first_purchase_date)) as purchase_month, 
              user_id
            FROM
                first_purchases as f
             JOIN
                purchases as p
            USING
                (user_id)
            WHERE
                f.product_line = 'Restaurant'
              GROUP BY 2) as first_time_purchase
            JOIN 
                 purchases as outer_p
            USING
                (user_id)
            GROUP BY 1,2,3 )
            GROUP BY 1
            ORDER BY 1 asc