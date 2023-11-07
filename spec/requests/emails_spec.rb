require 'rails_helper'

RSpec.describe "EmailsRequest", type: :request do
  before(:each) do 
    @gym = create(:gym)
    @user = create(:user)
    @email = create(:email, gym: @gym, user: @user)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema email" do
      get "/api/v1/emails/#{@email.id}.json"
      expect(response).to match_json_schema("email")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/emails.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @email.id.to_s,
            type: "email",
            attributes: {
              address: @email.address,
              gym: {
                id: @email.gym.id,
                name: @email.gym.name,
                cnpj: @email.gym.cnpj,
                slug: @email.gym.slug
              },
              user: {
                id: @email.user.id,
                name: @email.user.name
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/emails/#{@email.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @email.id.to_s,
          type: "email",
          attributes: {
            address: @email.address,
            gym: {
              id: @email.gym.id,
              name: @email.gym.name,
              cnpj: @email.gym.cnpj,
              slug: @email.gym.slug
            },
            user: {
              id: @email.user.id,
              name: @email.user.name
            }
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      email_params = build(:email, gym: @gym, user: @user).attributes
      post "/api/v1/emails.json", params: { email: email_params }, headers: headers
      email = Email.last
      expect(response.body).to include_json(
        data: {
          id: email.id.to_s,
          type: "email",
          attributes: {
            address: email.address,
            gym: {
              id: email.gym.id,
              name: email.gym.name,
              cnpj: email.gym.cnpj,
              slug: email.gym.slug
            },
            user: {
              id: email.user.id,
              name: email.user.name
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/emails/#{@email.id}.json" , params: { email: @email.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @email.id.to_s,
          type: "email",
          attributes: {
            address: @email.address,
            gym: {
              id: @email.gym.id,
              name: @email.gym.name,
              cnpj: @email.gym.cnpj,
              slug: @email.gym.slug
            },
            user: {
              id: @email.user.id,
              name: @email.user.name
            }
          }
        }
      )
    end
  end

end
