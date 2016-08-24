require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "example_user", email: "example@dude.com", password: "foobar")
  end

  test "username should be present" do
    @user.username = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email =  "     "
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = "  "
    assert_not @user.valid?
  end

  test "email should be loosely validated" do
    invalid_emails = %w[foo_bar@foo_com FOOOBAR.COM@c bizzle@***]

    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid."
    end
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
end
