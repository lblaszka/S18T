module S18T
    class DemoObject < Object

        @nextChange = 0;
        @changeSpeed =0.5;
        @colorPointer = 0;

        def start()
            @sprite = Sprite.new( Vector2.new(51,7));
            spritePrint_S( COLOR[:red] );
            spritePrint_1( COLOR[:yellow]);
            spritePrint_8( COLOR[:green] );
            spritePrint_T( COLOR[:blue] );

            spritePrint_E( COLOR[:cyan] );
            spritePrint_n1( COLOR[:cyan] );
            spritePrint_g( COLOR[:cyan] );
            spritePrint_i( COLOR[:cyan] );
            spritePrint_n2( COLOR[:cyan] );
            spritePrint_e( COLOR[:cyan] );


            @changeSpeed =0.5;
            @colorPointer =0;
            @nextChange = Engine.GetTime + @changeSpeed;
        end

        def update() 

            if( @nextChange < Engine.GetTime )
                @nextChange = Engine.GetTime + @changeSpeed;
                @colorPointer += 1;
                spritePrint_E(  DEMO_COLORS[ @colorPointer % 5 ] );
                spritePrint_n1( DEMO_COLORS[ @colorPointer % 5 ] );
                spritePrint_g(  DEMO_COLORS[ @colorPointer % 5 ] );
                spritePrint_i(  DEMO_COLORS[ @colorPointer % 5 ] );
                spritePrint_n2( DEMO_COLORS[ @colorPointer % 5 ] );
                spritePrint_e(  DEMO_COLORS[ @colorPointer % 5 ] );
                @changed = true;
            end

        end

        def spritePrint_S( _color, _dx =0, _dy=0 )
            _x = 0 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);

            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            @sprite.setPixel(_x + 3, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 1, _y + 1, _pixel );

            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );
            
            @sprite.setPixel(_x + 2, _y + 3, _pixel );
            @sprite.setPixel(_x + 3, _y + 3, _pixel );

            @sprite.setPixel(_x + 0, _y + 4, _pixel );
            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
            @sprite.setPixel(_x + 3, _y + 4, _pixel );

        end

        def spritePrint_1( _color, _dx =0, _dy=0 )
            _x = 5 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);

            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );

            @sprite.setPixel(_x + 1, _y + 1, _pixel );
            @sprite.setPixel(_x + 2, _y + 1, _pixel );

            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );

            @sprite.setPixel(_x + 1, _y + 3, _pixel );
            @sprite.setPixel(_x + 2, _y + 3, _pixel );

            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
        end

        def spritePrint_8( _color, _dx =0, _dy=0 )
            _x = 9 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);

            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            @sprite.setPixel(_x + 3, _y + 0, _pixel );
            @sprite.setPixel(_x + 4, _y + 0, _pixel );
            @sprite.setPixel(_x + 5, _y + 0, _pixel );

            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 1, _y + 1, _pixel );
            @sprite.setPixel(_x + 4, _y + 1, _pixel );
            @sprite.setPixel(_x + 5, _y + 1, _pixel );

            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );
            @sprite.setPixel(_x + 4, _y + 2, _pixel );
            @sprite.setPixel(_x + 5, _y + 2, _pixel );

            @sprite.setPixel(_x + 0, _y + 3, _pixel );
            @sprite.setPixel(_x + 1, _y + 3, _pixel );
            @sprite.setPixel(_x + 4, _y + 3, _pixel );
            @sprite.setPixel(_x + 5, _y + 3, _pixel );

            @sprite.setPixel(_x + 0, _y + 4, _pixel );
            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
            @sprite.setPixel(_x + 3, _y + 4, _pixel );
            @sprite.setPixel(_x + 4, _y + 4, _pixel );
            @sprite.setPixel(_x + 5, _y + 4, _pixel );

        end

        def spritePrint_T( _color, _dx =0, _dy=0 )
            _x = 16 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            @sprite.setPixel(_x + 3, _y + 0, _pixel );

            @sprite.setPixel(_x + 1, _y + 1, _pixel );
            @sprite.setPixel(_x + 2, _y + 1, _pixel );

            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );

            @sprite.setPixel(_x + 1, _y + 3, _pixel );
            @sprite.setPixel(_x + 2, _y + 3, _pixel );

            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
        end

        def spritePrint_E( _color, _dx =0, _dy=0 )
            _x = 23 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            @sprite.setPixel(_x + 3, _y + 0, _pixel );

            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 1, _y + 1, _pixel );

            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );

            @sprite.setPixel(_x + 0, _y + 3, _pixel );
            @sprite.setPixel(_x + 1, _y + 3, _pixel );

            @sprite.setPixel(_x + 0, _y + 4, _pixel );
            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
            @sprite.setPixel(_x + 3, _y + 4, _pixel );
        end

        def spritePrint_n1( _color, _dx =0, _dy=0 )
            _x = 28 + _dx;
            _y = 2 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 4, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 2, _y + 1, _pixel );
            @sprite.setPixel(_x + 4, _y + 1, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );
            @sprite.setPixel(_x + 4, _y + 2, _pixel );
        end

        def spritePrint_g( _color, _dx =0, _dy=0 )
            _x = 34 + _dx;
            _y = 2 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            @sprite.setPixel(_x + 3, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 3, _y + 1, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );
            
            @sprite.setPixel(_x + 3, _y + 3, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 4, _pixel );
            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
        end

        def spritePrint_i( _color, _dx =0, _dy=0 )
            _x = 39 + _dx;
            _y = 0 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 3, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 4, _pixel );
        end

        def spritePrint_n2( _color, _dx =0, _dy=0 )
            _x = 41 + _dx;
            _y = 2 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 4, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 2, _y + 1, _pixel );
            @sprite.setPixel(_x + 4, _y + 1, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 3, _y + 2, _pixel );
            @sprite.setPixel(_x + 4, _y + 2, _pixel );
        end
        def spritePrint_e( _color, _dx =0, _dy=0 )
            _x = 47 + _dx;
            _y = 1 + _dy;
            _pixel = Pixel.new(" ", COLOR[:default], _color);
            
            @sprite.setPixel(_x + 1, _y + 0, _pixel );
            @sprite.setPixel(_x + 2, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 1, _pixel );
            @sprite.setPixel(_x + 3, _y + 1, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            @sprite.setPixel(_x + 1, _y + 2, _pixel );
            @sprite.setPixel(_x + 2, _y + 2, _pixel );

            @sprite.setPixel(_x + 0, _y + 3, _pixel );

            @sprite.setPixel(_x + 1, _y + 4, _pixel );
            @sprite.setPixel(_x + 2, _y + 4, _pixel );
            @sprite.setPixel(_x + 3, _y + 4, _pixel );
        end

    end

    DEMO_COLORS = [ COLOR[:red], COLOR[:blue], COLOR[:yellow], COLOR[:green], COLOR[:cyan]];
end
