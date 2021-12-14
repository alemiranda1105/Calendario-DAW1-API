require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Obtener todos los usuarios" do
    User.create(password: "123", username: "test", email:"hola")
    get "/api/v1/users/", as: :json
    assert_response :success
  end
end
