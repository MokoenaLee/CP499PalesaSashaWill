json.extract! inventory, :id, :gear_type, :brand, :model, :color, :size, :serial_number, :retail, :purchase_price, :total_spent, :date_purchaseed, :purchase_method, :reason, :gear_category, :available, :bulk, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
