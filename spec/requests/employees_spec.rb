require 'rails_helper'

RSpec.describe "EmployeesRequest", type: :request do
  before(:each) do 
    @employee = create(:employee)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema employee" do
      get "/api/v1/employees/#{@employee.id}.json"
      expect(response).to match_json_schema("employee")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get "/api/v1/employees.json"
      expect(response.body).to include_json(
        data: [
          {
            id: @employee.id.to_s,
            type: "employee",
            attributes: {
              name: @employee.name,
              role: @employee.role
            },
            relationships: {
              emails: {
                data: []
              },
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
      get "/api/v1/employees/#{@employee.id}.json"
      expect(response.body).to include_json(
        data: {
          id: @employee.id.to_s,
          type: "employee",
          attributes: {
            name: @employee.name,
            role: @employee.role
          },
          relationships: {
            emails: {
              data: []
            },
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
      headers = { "ACCEPT" => "application/json" }
      employee_params = build(:employee, gym: @employee.gym).attributes
      post "/api/v1/employees.json", params: { employee: employee_params }, headers: headers
      employee = Employee.last
      expect(response.body).to include_json(
        data: {
          id: employee.id.to_s,
          type: "employee",
          attributes: {
            name: employee.name,
            role: employee.role
          },
          relationships: {
            emails: {
              data: []
            },
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
      headers = { "ACCEPT" => "application/json" }
      patch "/api/v1/employees/#{@employee.id}.json", params: { employee: @employee.attributes }, headers: headers
      expect(response.body).to include_json(
        data: {
          id: @employee.id.to_s,
          type: "employee",
          attributes: {
            name: @employee.name,
            role: @employee.role
          },
          relationships: {
            emails: {
              data: []
            },
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
