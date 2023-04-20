require "rails_helper"

RSpec.describe ShortnersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shortners").to route_to("shortners#index")
    end

    it "routes to #new" do
      expect(get: "/shortners/new").to route_to("shortners#new")
    end

    it "routes to #show" do
      expect(get: "/shortners/1").to route_to("shortners#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shortners/1/edit").to route_to("shortners#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shortners").to route_to("shortners#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shortners/1").to route_to("shortners#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shortners/1").to route_to("shortners#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shortners/1").to route_to("shortners#destroy", id: "1")
    end
  end
end
