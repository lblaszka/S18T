module S18T
    class WalkingDotObject < Object

        def start()
            setPosition( Vector2.new(10,10) );
            @sprite = Sprite.new( Vector2.new(1,1));
            @sprite.setPixel( 0,0, Pixel.new(" ",COLOR[:DEFAULT], COLOR[:BLUE]));
        end

        def update()

            if( Input.Key( KEY[:LEFT] ) )
                changePosition( Vector2.new(-1, 0) );
            end

            if( Input.Key( KEY[:RIGHT] ) )
                changePosition( Vector2.new(1, 0) );
            end      

            if( Input.Key( KEY[:UP] ) )
                changePosition( Vector2.new(0, -1) );
            end

            if( Input.Key( KEY[:DOWN] ) )
                changePosition( Vector2.new(0, 1) );
            end

        end

    end
end