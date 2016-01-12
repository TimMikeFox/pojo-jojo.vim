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

    context "one field" do

        input = [["String","theProperty"]]

        it "should create a private property, getter, and setter" do
            property = "private String theProperty;"
            getter = "public String getTheProperty() { return theProperty; }"
            setter = "public void setTheProperty(String theProperty) { this.theProperty = theProperty; }"

            result = @pojoj.pojoize(input)

            expect(result).to include(property)
            expect(result).to include(getter)
            expect(result).to include(setter)
        end
    end

end
