require 'test_helper'

class MyTest < ActionDispatch::IntegrationTest
  fixtures :users

  test 'with autorization' do
    user = User.create(
        :email => 'qwe@yandex.ru',
        :password => 'qweqweqwe',
        :password_confirmation => 'qweqweqwe'
    )
    assert user.save
    get '/input'
    assert_response :redirect
    post '/users/sign_in',
         params: {'user[email]' => user.email, 'user[password]' => user.password}
    follow_redirect!
    assert_equal 200, status
    assert_equal '/input', path
  end

  test 'without autorization' do
    get '/output',
        params: {n:3}
    assert_response :redirect
    follow_redirect!
    assert_equal 200, status
    assert_equal '/users/sign_in', path
  end
end
