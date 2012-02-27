FactoryGirl.define do
  factory :pomodoro do
    association :task
    finished false
  end
end
