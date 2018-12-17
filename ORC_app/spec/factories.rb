FactoryBot.define do 
  factory :user do
  email_address{"L@email.com"}
  first_name{"Mary"}
  last_name{"Mathias"}
  iclass{"12345"}
  #gear_type{"WetSuit"}
  #rental_date{"12/2/2018"}
  #return_date{"12/3/2018"}
  #days_used{"1"}
  #on_time_price{"3.00"}
  #password{"M1234"}
  end


 factory :administrator do
  email{"L@email.com"}
  password{"Restricted1234"}
  password_confirmation{"Restricted1234"}
  end
  
end
