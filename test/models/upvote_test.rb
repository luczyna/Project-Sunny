require 'test_helper'

class UpvoteTest < ActiveSupport::TestCase
  test "creating an Upvote" do
    user = User.first
    idea = Idea.where(user: User.second).first
    version = Version.where(idea: idea).order(number: :asc).last

    vote = Upvote.new(user: user, version: version)
    assert vote.valid?
  end

  test "deleting idea also deletes upvotes" do
    idea = Idea.where(name: "Coffee Idea").first
    idea.destroy

    versions = Version.where(idea: idea)
    votes = Upvote.where(version_id: versions.ids)
    votes.each do |v|
      assert v.destroyed?
    end
  end

  # test "deleting user also deletes all of their upvotes" do
  #   user = User.first
  #   assert_not_empty(Upvote.where(user: user))
  #
  #   user.destroy
  #   assert_empty(Upvote.where(user: user))
  # end
end
