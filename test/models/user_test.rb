require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#comments" do
    sign_in users(:elon)
    comment = Comment.new(comment: nil)
    assert_not comment.save, "Saved without comment"
  end
end
