require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  test 'a version without an idea id being invalid' do
    version = Version.new

    version.number = 1
    # version.idea_id = Idea.first.id
    version.goal = 'Test'
    version.content = 'Test test'

    assert_not version.valid?
  end

  test 'a version without content being invalid' do
    version = Version.new

    version.number = 1
    version.idea_id = Idea.first.id
    version.goal = 'Test'
    # version.content = 'Test test'

    assert_not version.valid?
  end

  test 'a version without a goal being invalid' do
    version = Version.new

    version.number = 1
    version.idea_id = Idea.first.id
    # version.goal = 'Test'
    version.content = 'Test test'

    assert_not version.valid?
  end

  test 'a version without a number being invalid' do
    version = Version.new

    # version.number = 1
    version.idea_id = Idea.first.id
    version.goal = 'Test'
    version.content = 'Test test'

    assert_not version.valid?
  end

  test 'a version with number, goal, content, and idea id being valid' do
    version = Version.new

    version.idea_id = Idea.first.id
    version.number = Version.where(idea: Idea.first).count + 1
    version.goal = 'Test'
    version.content = 'Test test'

    assert version.save
  end

  test 'a versions\' content length must be no more than 500 characters' do
    version = Version.new

    version.idea_id = Idea.first.id
    version.number = Version.where(idea: Idea.first).count + 1
    version.goal = 'Test'
    version.content = 'a' * 500

    assert version.valid?

    version.content = 'a' * 501
    assert_not version.valid?
  end

  test 'a version\' goal length must be no more than 75 characters' do
    version = Version.new

    version.idea_id = Idea.first.id
    version.number = Version.where(idea: Idea.first).count + 1
    version.goal = 'a' * 75
    version.content = 'Test test'

    assert version.valid?

    version.goal = 'a' * 76
    assert_not version.valid?
  end

  test 'a version can not share a number of another version belonging to the same idea' do
    version = Version.new
    version.number = Version.where(idea: Idea.first).count + 1
    version.idea_id = Idea.first.id
    version.goal = 'Test'
    version.content = 'Test test'

    assert version.save

    revision = Version.new
    revision.number = version.number
    revision.idea_id = Idea.first.id
    revision.goal = 'Better Test'
    revision.content = 'Test test'

    assert_not revision.valid?

    revision.number = version.number + 1
    assert revision.valid?
  end
end
