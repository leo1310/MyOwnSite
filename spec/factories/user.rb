require 'factory_girl'

Factory.define :user do |user|
  user.name                  "Name"
  user.last_name                "Last_name"
  user.phone           "+380971234567"
  user.nik_name           "NikName"
  user.email "user@example.ru"
  user.password "123456"
end

