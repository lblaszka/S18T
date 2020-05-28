module S18T


    class Vector2
        attr_accessor :x
        attr_accessor :y

        def initialize( _x = 0 , _y = 0 )
            @x = _x
            @y = _y
        end

        def value
            return Math.sqrt( @x**2 + @y**2 )
        end

        def values
            return @x, @y
        end

        def clone
            return Vector2.new( @x, @y)
        end

        def to_s
            return "X:"+@x.to_s+" Y:"+@y.to_s
        end

        def field
            return @x*@y;
        end

        def eql?( _vector2 )
            if( _vector2.x == @x && _vector2.y == @y )
                return true;
            end
            return false;
        end

        # overloading arithmetic operator

        def +( _vector2 )
            if _vector2.is_a?( Vector2 )
                return Vector2.new( @x + _vector2.x, @y + _vector2.y )
            end
        end

        def -( _vector2 )
            if _vector2.is_a?( Vector2 )
                return Vector2.new( @x - _vector2.x, @y - _vector2.y )
            end
        end

        def *( _var )

            if _var.is_a?( Vector2 )
                @x*=_var.x
                @y*=_var.y
            elsif _var.is_a?( Number )
                @x*=_var
                @y*=_var

            end
        end

        def /( _var )

            if _var.is_a?( Vector2 )
                @x/=_var.x
                @y/=_var.y
            elsif _var.is_a?( Number )
                @x/=_var
                @y/=_var

            end
        end

        # overloading logic operator

        def ==( _var )
            if _var.is_a?( Vector2 )
                if value == _var.value
                    return true
                end
            elsif _var.is_a?( Numeric )
                if value == _var
                    return true
                end
            end

            return false

        end

        #def >( _var )
    end

    def self.Vector2( _x, _y )
        return Vector2.new( _x, _y);
    end
end