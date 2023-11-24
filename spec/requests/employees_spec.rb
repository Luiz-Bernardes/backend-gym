require 'rails_helper'
include ApplicationHelper

RSpec.describe "EmployeesRequest", type: :request do
  before(:each) do 
    # FACTORIES
    @gym = create(:gym)
    @admin = create(:admin, gym: @gym)
    @employee = create(:employee, gym: @gym)
    # ADD HEADER
    @headers = request_set_headers(@admin)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema employee" do
      get "/api/v1/employees/#{@employee.id}.json", headers: @headers
      expect(response).to match_json_schema("employee")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/employees.json", headers: @headers
      expect(response.body).to include_json(
        data: [
          {
            id: @employee.id.to_s,
            type: "employee",
            attributes: {
              name: @employee.name,
              email: @employee.email,
              role: @employee.role,
              gender: @employee.gender
            },
            relationships: {
              telephones: {
                data: []
              },
              locations: {
                data: []
              }
            }
          }
        ]
      )
    end

    it "show is expected response body to include json" do
      get "/api/v1/employees/#{@employee.id}.json", headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @employee.id.to_s,
          type: "employee",
          attributes: {
            name: @employee.name,
            email: @employee.email,
            role: @employee.role,
            gender: @employee.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }

        }
      )
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      employee_params = build(:employee, gym: @employee.gym).attributes
      post "/api/v1/employees.json", params: { employee: employee_params }, headers: @headers
      employee = Employee.last
      expect(response.body).to include_json(
        data: {
          id: employee.id.to_s,
          type: "employee",
          attributes: {
            name: employee.name,
            email: employee.email,
            role: employee.role,
            gender: employee.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }
        }
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      patch "/api/v1/employees/#{@employee.id}.json", params: { employee: @employee.attributes }, headers: @headers
      expect(response.body).to include_json(
        data: {
          id: @employee.id.to_s,
          type: "employee",
          attributes: {
            name: @employee.name,
            email: @employee.email,
            role: @employee.role,
            gender: @employee.gender
          },
          relationships: {
            telephones: {
              data: []
            },
            locations: {
              data: []
            }
          }
        }
      )
    end
  end

end
