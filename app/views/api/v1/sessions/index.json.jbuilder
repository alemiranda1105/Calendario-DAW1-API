json.user do
  json.id @current_user.id
  json.username @current_user.username
  json.email @current_user.email
end