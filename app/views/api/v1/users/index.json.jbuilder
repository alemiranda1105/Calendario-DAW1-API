if @users
  json.array! @users do |user|
    json.id user.id
    json.username user.username
    json.email user.email
  end
else
  json.id @user.id
  json.username @user.username
  json.email @user.email
end