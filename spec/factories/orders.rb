FactoryGirl.define do
  factory :order do
    satoshis 1
    order_id 1
    address_id 1
    status "MyString"
    type ""
    notified false
  end
end
