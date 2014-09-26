FactoryGirl.define do
  factory :assistant do |f|
    f.first_name "Brando"
    f.last_name "Shmando"
    f.email "shmando@example.com"
    f.password "Password"

  end

  factory :professor do |f|
    f.first_name "Brando"
    f.last_name "Shmando"
    f.email "profshmando@example.com"
    f.password "Password"
    f.password_confirmation "Password"
  end
end