with base as (
    Select *, row_number() over (partition by card_links order by page_rank) as row_num
    from (
        Select
        md5(card_links) as link_product_map_uuid,
        split_part(split_part(card_links, '/', -1), '-', 1) as pid, --the last element of the card_links is the pid
        split_part(card_links, '/', -2) as color, --the penultimate element of the card_links is the color
        case when split_part(split_part(page_links, '/', -1), '?', 2) = '' then 1
            else cast(
                    split_part(
                        split_part(split_part(page_links, '/', -1), '?', 2),
                        '=',
                        2
                    ) as int) end as page_rank,    --the second element of the query string is the page rank
        request_time_stamp::timestamptz as request_timestamp_utc, --assuming timestamp is in utc at the source
        dw_insert_timestamp::timestamptz as dw_insert_timestamp_utc, --assuming timestamp is in utc at the source
        card_links, 
        page_links
        from rugs_usa_links) links
)

Select *
from base
where row_num = 1