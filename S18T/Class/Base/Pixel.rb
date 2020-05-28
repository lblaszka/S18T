module S18T
    class Pixel
        attr_accessor :value

        @char;
        @colors;

        def initialize( _char, _fontColor="9", _backgroudColor="9" )
            @char = _char[0].to_s;
            @colors = "\e[3" + _fontColor + ";4" + _backgroudColor + "m";
        end

        def puts
            return @colors + @char + "\e[0m";
        end
    end
end