require 'rails_helper'
require 'spec_helper'

describe "Plant API" do
  it "receives a list of messages" do
    get "/api/plants/1"
    json = JSON.parse(response.body)
    expect(response).to be_success


  end
end
