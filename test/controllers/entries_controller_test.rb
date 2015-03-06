require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  
  def test_create_entry
    assert_difference 'Entry.count', 1 do
      post :create, entry: attributes_for(:entry)
    end
    assert_response(:success)
  end

  def test_show_entry
    entry = create(:entry)
    get :show, id: entry.id, format: :json
    assert_response(:success)
    returned_json = JSON.parse(response.body)
    assert_equal entry.goal, returned_json["goal"]
    assert_equal entry.submitted_by, returned_json["submitted_by"]
  end

  def test_index
    entries = create_list(:entry, 2)
    get :index, format: :json
    assert_response(:success)
    returned_json = JSON.parse(response.body)
    assert_equal 2, returned_json.size
    assert_equal JSON.parse(entries.first.to_json), returned_json.first
    assert_equal JSON.parse(entries.last.to_json), returned_json.last
  end

  def test_random
    entries = create_list(:entry, 3)
    get :random, format: :json
    assert_response(:success)
    returned_json = JSON.parse(response.body)
    jsoned_entries = entries.map do |entry|
      JSON.parse(entry.to_json)
    end
    assert jsoned_entries.include?(returned_json)
  end

end
