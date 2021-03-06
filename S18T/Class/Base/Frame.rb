module S18T
    class Frame
        @size = nil;
        @buffor = nil;
        @mask   = nil;  #change pixels
        @changed   = false;

        def initialize ( _size )
            @size = _size.clone
            
            @buffor = Array.new( _size.y * _size.x, String );
            @mask = Array.new( _size.y * _size.x, 0 );

            clear();
        end

        def clearField( _position, _sprite )
            @changed = true;
            _position = _position - _sprite.getOffset;
            
            _size = _sprite.getSize;

            _size.y.times do | _row |
                _size.x.times do | _col |
                    paintPixel( _position.x + _col, _position.y + _row, nil, 1 );
                end
            end
        end

        def paintDraw( _position, _sprite )
            @changed = true;
            _position = _position - _sprite.getOffset;
            
            _size = _sprite.getSize;

            _size.y.times do | _row |
                _size.x.times do | _col |
                    paintPixel( _position.x + _col, _position.y + _row, _sprite.getPixel( _col, _row ) );
                end
            end
        end

        def paintPixel( _x, _y, _pixel = nil, null=nil)
            if( _x < 0 || _y < 0 )
                return
            end

            if( _x > ( @size.x - 1 ) || _y > ( @size.y - 1 ) )
                return
            end

            @buffor[ getBufforOffset( _x, _y ) ] = _pixel;
            @mask[ getBufforOffset( _x, _y ) ] = 1;
        end

        def printPixel( _x, _y )
            @mask[ getBufforOffset( _x, _y ) ]=0;
            _pixel = @buffor[ getBufforOffset( _x, _y ) ];

            if( _pixel == nil )
                return false;
            else
                print @buffor[ getBufforOffset( _x, _y ) ].puts;
            end
            
            return true;
        end

        def isNil?(_x, _y)
            if(  @buffor[ getBufforOffset( _x, _y ) ] == nil )
                true
            else
                false
            end
        end

        def wasCh?( _x, _y )
            if(  @mask[ getBufforOffset( _x, _y ) ] == 1 )
                true
            else
                false
            end
        end

        def changed?()
            return @changed
        end

        def getMask( )
            return @mask
        end


        def getBufforOffset( _x, _y )
            return ( _y * @size.x ) + _x
        end

        def clear()
            @buffor.length.times do |i|
                @buffor[i] = nil
                @mask[i] = 0
            end
        end

        def clearMask()
            @chaged = false;
            @mask.length.times do |i|
                @mask[i] = 0
            end
        end
    end
end