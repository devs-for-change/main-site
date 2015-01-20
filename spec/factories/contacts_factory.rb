FactoryGirl.define do
  factory :contact do
    inquiry_type 'fake inquiry'
    name 'Nic Boie'
    email 'nic@devsforchange.org'
    company 'Devs For Change'
    role 'Awesome'
    website 'http://www.devsforchange.org'
    notes 'note'
  end
end
