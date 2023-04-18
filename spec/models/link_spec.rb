require 'rails_helper'

RSpec.describe Link, type: :model do
  
    it " is if valid  has an original url and lookup code" do
        link  = Link.new(
            original_url: "https://www.favorate-website-link/article/how-to-build",
            lookup_code: "12344566"
        )
        link.save
        expect(link.valid?).to be(true)
    end

    it "is if invalid  has an original url and lookup code" do
        link  = Link.new(
            original_url: "https://www.favorate-website-link/article/how-to-build"
        )
        link.save
        expect(link.valid?).to be(false)
    end

    it "does not have an original" do
        link  = Link.new(
            lookup_code: "12344566" 
        )
        link.save
        expect(link.valid?).to be(false)
    end

    it "is invalid if the lookup code already exist" do
        link  = Link.new(
            original_url: "https://www.favorate-website-link/article/how-to-build",
            lookup_code: "12344566"
        )
        link.save

        link_2  = Link.new(
            original_url: "https://www.favorate-website-link/article/how-to-bake",
            lookup_code: "12344566"
        )
        expect(link_2.valid?).to be(false)
   
    
    
    end


    
end


