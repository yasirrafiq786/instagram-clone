require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should not create user without email" do
    user = User.new(username: "test", email: "", password: "123abc")
    assert_not user.save, "Saved the user without email"
  end
end
