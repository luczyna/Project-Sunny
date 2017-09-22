require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  test 'an idea without a name is invalid' do
    idea = Idea.new

    idea.user_id = 1
    # idea.name = 'Test test'

    assert_not idea.valid?
  end

  test 'an idea without a user_id is invalid' do
    idea = Idea.new

    # idea.user_id = 1
    idea.name = 'Test test'

    assert_not idea.valid?
  end

  test 'saving an idea with at a user and name' do
    idea = Idea.new

    idea.user_id = User.first.id
    idea.name = 'Test test'

    assert idea.save!
  end

  test 'not being able to save an idea that is the 6th to be published' do
    Idea.destroy_all

    for i in (1..5)
      idea = Idea.new

      idea.user_id = User.first.id
      idea.name = "Test #{i}"
      idea.published = true

      idea.save
    end

    assert_equal Idea.count, 5

    nope_idea = Idea.new
    nope_idea.user_id = User.first.id
    nope_idea.name = "Test 6"
    nope_idea.published = true

    assert_not nope_idea.valid?
  end

  test 'being able to save an unpublished idea after 5 have been created' do
    Idea.destroy_all

    for i in (1..5)
      idea = Idea.new

      idea.user_id = User.first.id
      idea.name = "Test #{i}"
      idea.published = true

      idea.save
    end

    unpublished_idea = Idea.new
    unpublished_idea.user_id = User.first.id
    unpublished_idea.name = "Test 6"
    unpublished_idea.published = false

    assert unpublished_idea.save!
  end

  test 'restricting saving Ideas that have the same name (between a user only)' do
    coffee = Idea.new(
      name: 'Coffee',
      user_id: User.first.id,
      published: false
    )
    assert coffee.save

    covfefe = Idea.new(
      name: 'Coffee',
      user_id: User.first.id,
      published: false
    )
    assert_not covfefe.valid?
  end

  test 'deleting an idea and related versions' do
    idea = Idea.where(:name => "Really Good Idea").limit(1).first
    idea_id = idea.id

    idea.destroy

    assert idea.destroyed?
    assert_equal(Version.where(:idea_id => idea_id).count, 0)
  end
end
