module PoJo
    class JoJo

        def initialize(className)
            @className = className
        end

        def pojoize(fields)
            lines = []
            lines << "public class #{@className} {"
            write_properties lines, fields
            lines << "" unless fields.empty?
            write_getters_and_setters lines, fields
            lines << "" unless fields.empty?
            lines << "}"
            lines
        end

        def write_properties(lines, fields)
            fields.each do |t, n|
                lines << "private #{t} #{n};"
            end
        end
        
        def write_getters_and_setters(lines, fields)
            fields.each do |t, n|
                lines << "public #{t} get#{n[0].upcase}#{n[1..-1]}() { return #{n}; }"
                lines << "public void set#{n[0].upcase}#{n[1..-1]}(#{t} #{n}) { this.#{n} = #{n}; }"
            end
        end

    end
end
