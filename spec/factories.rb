FactoryGirl.define do 
  factory :user do 
    email 'aaa@bbb.com'
    password 'a1234567'
  end

  factory :new_user do 
    email 'bbb@bbb.com'
    password 'a1234567'
  end
end