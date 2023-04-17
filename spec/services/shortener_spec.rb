require "rails_helper"

RSpec.describe Shortener do

    it "shortener a given url upto 7 char" do 
        url = "https://www.favorate-website-link/article/how-to-build"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end



    it "shortener a given url upto 7 char" do 
        url = "https://www.favorate-website-link/article/how-to-build"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.favorate-website-link/article/how-to-bake"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)

    end

    it "always give the same url and same  lookup_code code " do
        url = "https://www.favorate-website-link/article/how-to-build"
        shortener = Shortener.new(url)
        first_code = shortener.lookup_code

        url = "https://www.favorate-website-link/article/how-to-build"
        shortener = Shortener.new(url)
        second_code = shortener.lookup_code

        expect(first_code).to eq(second_code)

    end


end