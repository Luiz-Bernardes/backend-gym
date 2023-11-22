module ApplicationHelper
  def request_header(user)
    request.headers.merge!({'Accept': 'application/json'})
    request.headers.merge!(user.create_new_auth_token)
  end
end