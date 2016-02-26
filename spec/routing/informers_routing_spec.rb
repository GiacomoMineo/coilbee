require "rails_helper"

RSpec.describe InformersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/informers").to route_to("informers#index")
    end

    it "routes to #new" do
      expect(:get => "/informers/new").to route_to("informers#new")
    end

    it "routes to #show" do
      expect(:get => "/informers/1").to route_to("informers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/informers/1/edit").to route_to("informers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/informers").to route_to("informers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/informers/1").to route_to("informers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/informers/1").to route_to("informers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/informers/1").to route_to("informers#destroy", :id => "1")
    end

  end
end
