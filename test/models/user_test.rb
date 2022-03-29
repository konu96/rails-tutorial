require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name: 'dummy user',
      email: 'dummy@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  test 'should be valid' do
    assert_equal true, @user.valid?
  end

  test 'name should be present' do
    @user.name = '  '
    assert_equal false , @user.valid?
  end

  test 'name should be email' do
    @user.email = '  '
    assert_equal false , @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_equal false, @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_equal false, @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[ user@example.com USER@foo.COM ]

    valid_addresses.each do |valid_address|
      @user.email = valid_address

      assert_equal true, @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[ user@example,com user_at_foo.org ]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address

      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save

    assert_equal false, duplicate_user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
