module Saringan
  module Operators
    class Equal

      OP_EQUAL = /::/

      class << self
        def to_h(term)
          splitted = split(term)
          { "#{splitted[:key]}": Saringan::Parser.parse(splitted[:value]) }
        end

        def to_query(term)
          splitted = split(term)
          { query: "#{splitted[:key]} = ?", params: splitted[:value] }
        end

        def match?(term)
          term =~ OP_EQUAL
        end

        def split(term)
          splitted = term.split(OP_EQUAL)
          { key: splitted[0], value: splitted[1] }
        end
      end
    end
  end
end
