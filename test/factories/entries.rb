FactoryGirl.define do
  factory :entry do
    goal { ["Travel the world", "Start a charity", "Become an expert in one field"].sample }
    submitted_by { ["Raleigh Felton", "Ian Donovan", "Kenneth Nicholson", "Dante Passera"].sample }
  end
end