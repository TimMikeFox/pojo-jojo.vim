module PoJo
    class JoJo

        def initialize(className)
            @className = className
        end

        def pojoize(fields)
            lines = []
            lines << "public class #{@className} {"
            lines << "}"
            lines
        end
    end
end
