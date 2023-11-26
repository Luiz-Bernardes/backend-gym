# frozen_string_literal: true

module ApplicationHelper
  # Headers for rspec controllers
  def request_header(user)
    request.headers.merge!({'Accept': 'application/json'})
    request.headers.merge!(user.create_new_auth_token)
  end

  # Headers for rspec models, requests
  def request_set_headers(user)
    headers = { "ACCEPT" => "application/json" }
    headers.merge!(user.create_new_auth_token)
    headers
  end
end