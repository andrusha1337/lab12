require 'test_helper'

class Lab8ControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get lab8_input_url
    assert_response :success
  end

  test 'should get output' do
    get lab8_output_url
    assert_response :success
  end

  test 'set 1' do
    get lab8_output_url, {n: 1}
    assert_equal assigns[:result], [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  test 'set 2' do
    get lab8_output_url, {n: 2}
    assert_equal assigns[:result], []
  end

  test 'set 3' do
    get lab8_output_url, {n: 3}
    assert_equal assigns[:result], [153, 370, 371, 407]
  end
end
