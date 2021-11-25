require 'test/unit'

require_relative '../aoc_toolbox.rb'

class AocToolboxTest < Test::Unit::TestCase

    def test_lines
        aoc = InputData.new(filename: "test/input.txt")
        assert(aoc.lines == ["1337", "42"] )
    end

    def test_lines_ints
        aoc = InputData.new(filename: "test/input.txt")
        assert(aoc.lines_ints == [1337, 42])
    end

    def test_fields_regexp
        aoc = InputData.new(filename: "test/input-fields.txt")
        assert(aoc.linefields_regexp(/(\w+): (\d+)\s(\d+)\s(\d+)/)[0] == ['kalle', '123','456','879'])
    end

    def test_fields_separator_str
        aoc = InputData.new(filename: "test/input-fields-csv.txt")
        fields_data = aoc.linefields_separator() # ',' is default separator
        assert(fields_data[0][0] == 'adam')
        assert(fields_data[0][3] == '34')
        assert(fields_data[2][0] == 'cesar')
        assert(fields_data[2][4] == 'a')
    end

    def test_fields_separator_rx
        aoc = InputData.new(filename: "test/input-fields-complex.txt")
        fields_data = aoc.linefields_separator(/\s?:=\s?/)
        assert(fields_data[0][0] == 'a')
        assert(fields_data[0][1] == '23 + 34')
        assert(fields_data[2][0] == 'boing')
        assert(fields_data[2][1] == '42')
    end

    def test_sections
        aoc = InputData.new(filename: "test/input-sections.txt")
        assert(aoc.sections[3].lines == ['section 4', 'banana'])
    end

    def test_sections_rx
        aoc = InputData.new(filename: "test/input-sections-rx.txt")
        secs = aoc.sections(/(^$)|(^--)|(^#)/)
        assert(secs[3].lines()[1] == 'banana')
    end

    def test_matrix_char
        aoc = InputData.new(filename: "test/input-matrix.txt")
        assert(aoc.matrix_char(1, 4) == '.')
        assert(aoc.matrix_char(3, 15) == '#')
    end

    def test_sub_matrix
        aoc = InputData.new(filename: "test/input-matrix.txt")
        assert(aoc.sub_matrix(1,1,2,2).lines == ['.#','..'])
    end
end
