require_relative "../test_helper"

class EntryTest < ActiveSupport::TestCase
  test "the truth" do
    entry = create(:entry)
    puts "Entry: #{ entry.goal }, submitted by: #{ entry.submitted_by }"
    assert true
  end
end
