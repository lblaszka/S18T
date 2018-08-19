module S18T

    class Cursor
        class << self
            def SetPosition ( _x, _y=0 )
                print "\033["+( 1 + _y ).to_s+";"+( 1 + _x ).to_s+"H"
            end

            def ChPosition( _x, _y=0)
                print "\033["+( 1 + _y + pos[:row] ).to_s+";"+( 1 + _x + pos[:column] ).to_s+"H"
            end

            def GetPosition
                res = ''
                $stdin.raw do |stdin|
                    $stdout << "\e[6n"
                    $stdout.flush
                    while (c = stdin.getc) != 'R'
                    res << c if c
                    end
                end
                m = res.match /(?<row>\d+);(?<column>\d+)/
                { row: Integer(m[:row]), column: Integer(m[:column]) }
            end

            def SetColor( _fontColor=9, _backgroudColor=9 )
                print "\e[3"+_fontColor.to_s+";4"+_backgroudColor.to_s+"m";
            end
        end
    end
end