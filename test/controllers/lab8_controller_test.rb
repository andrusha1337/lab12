require 'test_helper'

class Lab8ControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(
        :email => 'qwe@yandex.ru',
        :password => 'qweqweqwe',
        :password_confirmation => 'qweqweqwe'
    )
    post '/users/sign_in',
         params: {'user[email]' => user.email, 'user[password]' => user.password}
  end

  test "should get input" do
    get '/input'
    assert_response :success
  end

  test "should get output" do
    get '/output'
    assert_response :success
  end

  test "set nothing" do
    get '/output'
    assert_equal assigns[:result], []
  end

  test "set 2" do
    get '/output',
        params: {n: 2}
    assert_equal assigns[:result], []
  end

  test "set 3" do
    get '/output',
        params: {n: 3}
    assert_equal assigns[:result], [153, 370, 371, 407]
  end
end
