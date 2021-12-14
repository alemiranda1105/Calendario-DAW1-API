require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "No existen usuarios" do
    User.destroy_all
    get "/api/v1/users/", as: :json
    assert_response :not_found
  end

  test "Obtener todos los usuarios" do
    User.create(password: "123", username: "test", email:"hola")
    get "/api/v1/users/", as: :json
    assert_response :success
  end

  test "Obtener usuario por username" do
    User.create(password: "123", username: "test", email:"hola")
    get "/api/v1/users?username=test", as: :json
    expected_response = "{\"id\":980190963,\"username\":\"test\",\"email\":\"hola\"}"
    assert_response :success
    assert_equal response.body, expected_response
  end

  test "Crear un usuario" do
    prev_users = User.count
    post "/api/v1/users/", params: { user: { username: "Prueba", password: "12345", email:"sadasdasd" } }
    assert_response :success
    assert_equal prev_users + 1, User.count
    expected_response = "{\"id\":980190963,\"username\":\"Prueba\",\"email\":\"sadasdasd\"}"
    assert_equal response.body, expected_response
  end
end
