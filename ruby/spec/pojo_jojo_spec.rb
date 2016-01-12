require 'pojojojo'

describe PoJo::JoJo, "#pojoize" do

    before :each do
        @pojoj = PoJo::JoJo.new "ClassName"
    end

    context "no fields" do
        it "should equal boiler plate" do
            expected = ['public class ClassName {','}']
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

        it "should create a .toString() method" do
            to_string_signature = "public String toString() {"
            to_string_setup = "StringBuilder builder = new StringBuilder(\"ClassName {\");"
            to_string_contents = "builder.append(\"theProperty='\" + this.theProperty + \"'\");"

            result = @pojoj.pojoize(input)

            expect(result).to include(to_string_signature)
            expect(result).to include(to_string_setup)
            expect(result).to include(to_string_contents)
        end

        it "should create a .equals() method" do
            equals_signature = "public boolean equals(Object o) {"
            identity_check = "if(this == o) return true;"
            instance_check = "if(!(o instanceof ClassName)) return false;"
            field_check = "if(!Objects.equals(this.theProperty, other.theProperty)) return false;"

            result = @pojoj.pojoize(input)

            expect(result).to include(equals_signature)
            expect(result).to include(identity_check)
            expect(result).to include(instance_check)
            expect(result).to include(field_check)
        end
    end

end
