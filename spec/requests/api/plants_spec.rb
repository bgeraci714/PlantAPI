require 'rails_helper'

describe "Plant API" do
  it "receives a list of plants" do
    Plant.create(name: "A plant named Tim", description: "Likes water.")

    get "/api/plants"
    json = JSON.parse(response.body)
    expect(response).to be_success

    test_plant_json = {
      "created_at" => "2016-11-11T19:41:02.246Z",
      "description" => "Likes water.",
      "id" => 6,
      "name" => "A plant named Tim",
      "updated_at" => "2016-11-11T19:41:02.246Z",
      }
    expect(json[-1]["name"]).to eq test_plant_json["name"]
    expect(json[-1]["description"]).to eq test_plant_json["description"]



  end

  it "lets users create new plants" do
    headers = {'CONTENT_TYPE' => 'application/json'}
    plant_json = {
      plant: {
        name: "test plant",
        description: "my plant"
      }
    }.to_json

    post "/api/plants", plant_json, headers
    expect(response).to be_success
    #binding.pry

    # database testing
    new_plant = Plant.last
    expect(new_plant.name).to eq "test plant"
    expect(new_plant.description).to eq "my plant"

    json = JSON.parse(response.body)
    expect(response).to be_success

    expect(json["name"]).to eq new_plant.name


  end
end
