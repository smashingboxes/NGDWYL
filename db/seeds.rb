users = [ "Ian Donovan", "Kenneth Nicholson", "Raleigh Felton" ]
goals = [ "Write a book", "Climb a mountain", "Travel the world" ]
5.times do
  Entry.create(goal: goals.sample, submitted_by: users.sample)
end
