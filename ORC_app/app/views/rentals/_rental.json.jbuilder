json.extract! rental, :id, :user_ID, :item_ID, :rental_date, :return_date, :days_used, :on_time_price, :created_at, :updated_at
json.url rental_url(rental, format: :json)
