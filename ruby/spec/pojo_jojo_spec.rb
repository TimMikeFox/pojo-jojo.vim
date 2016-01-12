require 'pojojojo'

describe PoJo::JoJo, "#pojoize" do

    before :each do
        @pojoj = PoJo::JoJo.new "ClassName"
    end

    context "no fields" do
        it "should equal boiler plate" do
            expected = "public class ClassName {\n}"
            expect(@pojoj.pojoize([])).to eq(expected)
        end
    end

end
