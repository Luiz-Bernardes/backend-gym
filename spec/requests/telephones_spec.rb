require 'rails_helper'

RSpec.describe "TelephonesRequest", type: :request do
  before(:each) do 
    @gym = create(:gym)
    @user = create(:user)
    @telephone = create(:telephone, gym: @gym, user: @user)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema telephone" do
      get "/api/v1/telephones/#{@telephone.id}.json"
      expect(response).to match_json_schema("telephone")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/telephones.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @telephone.id.to_s,
            type: "telephone",
            attributes: {
              number: @telephone.number,
              gym: {
                id: @telephone.gym.id,
                name: @telephone.gym.name,
                cnpj: @telephone.gym.cnpj,
                slug: @telephone.gym.slug
              },
              user: {
                id: @telephone.user.id,
                name: @telephone.user.name
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/telephones/#{@telephone.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: @telephone.number,
            gym: {
              id: @telephone.gym.id,
              name: @telephone.gym.name,
              cnpj: @telephone.gym.cnpj,
              slug: @telephone.gym.slug
            },
            user: {
              id: @telephone.user.id,
              name: @telephone.user.name
            }
          }
        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      telephone_params = build(:telephone, gym: @gym, user: @user).attributes
      post "/api/v1/telephones.json", params: { telephone: telephone_params }, headers: headers
      telephone = Telephone.last
      expect(response.body).to include_json(
        data: {
          id: telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: telephone.number,
            gym: {
              id: telephone.gym.id,
              name: telephone.gym.name,
              cnpj: telephone.gym.cnpj,
              slug: telephone.gym.slug
            },
            user: {
              id: telephone.user.id,
              name: telephone.user.name
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/telephones/#{@telephone.id}.json" , params: { telephone: @telephone.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @telephone.id.to_s,
          type: "telephone",
          attributes: {
            number: @telephone.number,
            gym: {
              id: @telephone.gym.id,
              name: @telephone.gym.name,
              cnpj: @telephone.gym.cnpj,
              slug: @telephone.gym.slug
            },
            user: {
              id: @telephone.user.id,
              name: @telephone.user.name
            }
          }
        }
      )
    end
  end

end
