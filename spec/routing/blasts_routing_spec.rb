require "spec_helper"

describe BlastsController do
  describe "routing" do

    it "routes to #index" do
      get("/blasts").should route_to("blasts#index")
    end

    it "routes to #new" do
      get("/blasts/new").should route_to("blasts#new")
    end

    it "routes to #show" do
      get("/blasts/1").should route_to("blasts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blasts/1/edit").should route_to("blasts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blasts").should route_to("blasts#create")
    end

    it "routes to #update" do
      put("/blasts/1").should route_to("blasts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blasts/1").should route_to("blasts#destroy", :id => "1")
    end

  end
end
