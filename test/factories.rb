FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User #{n}" }
        f.sequence(:email) { |n| "test#{n}@example.com" }
        f.password { "password" }
        f.password_confirmation { |d| d.password }
    end
    
    factory :pass do |f|
        f.sequence(:from) { |n| "Pass #{n}" }
        f.sequence(:code) { |n| "Code #{n}" }
        f.code_id {999}
        f.association :user
    end
end