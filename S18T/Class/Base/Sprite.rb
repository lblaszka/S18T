module S18T
    class Sprite

        @offset=nil;
        @size=nil;
        @draw=nil;

        def initialize( _size = Vector2.new(1,1), _offset = Vector2.new(0,0) )
                @size = _size.clone;
                @offset = _offset.clone;

            @draw = Array.new( @size.field, nil );
        end

        def setPixel( _x, _y, _pixel )
            if( _x > @size.x || _x < 0 )
                Debug.Log("Error! Sprite.setPixel - Overload _x possition. Value: #{ _x.to_s }", :ERROR);
                return;
            end

            if( _y > @size.y || _y < 0 )
                Debug.Log("Error! Sprite.setPixel - Overload _y possition. Value: #{ _y.to_s }", :ERROR);
                return;
            end

            @draw[ _y * @size.x + _x ] = _pixel;
        end

        def getOffset
            return @offset;
        end

        def getSize()
            return @size
        end

        def getPixel( _x, _y )
            return @draw[ _y * @size.x + _x ];
        end

    end
end