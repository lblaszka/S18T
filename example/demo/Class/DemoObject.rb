module S18T
    class DemoObject < Object

        @nextChange = 0;
        @changeSpeed =0.5;
        @colorPointer = 0;

        def start()
            @sprite = Sprite.new( Vector2.new(51,7));
            spritePrint_S( COLOR[:RED] );
            spritePrint_1( COLOR[:YELLOW]);
            spritePrint_8( COLOR[:GREEN] );
            spritePrint_T( COLOR[:BLUE] );

            spritePrint_E( COLOR[:CYAN] );
            spritePrint_n1( COLOR[:CYAN] );
            spritePrint_g( COLOR[:CYAN] );
            spritePrint_i( COLOR[:CYAN] );
            spritePrint_n2( COLOR[:CYAN] );
            spritePrint_e( COLOR[:CYAN] );


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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);

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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);

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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);

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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
            @sprite.setPixel(_x + 0, _y + 0, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 2, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 3, _pixel );
            
            @sprite.setPixel(_x + 0, _y + 4, _pixel );
        end

        def spritePrint_n2( _color, _dx =0, _dy=0 )
            _x = 41 + _dx;
            _y = 2 + _dy;
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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
            _pixel = Pixel.new(" ", COLOR[:DEFAULT], _color);
            
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

    DEMO_COLORS = [ COLOR[:RED], COLOR[:BLUE], COLOR[:YELLOW], COLOR[:GREEN], COLOR[:CYAN]];
end



=begin

SSSS 111 888888 TTTT    EEEE             I
SS    11 88  88  TT     EE                        EE
SSSS  11 888888  TT     EEE  NN  N  GGGG I NN  N E  E
  SS  11 88  88  TT     EE   N N N  G  G I N N N EEE
SSSS  11 888888  TT     EEEE N  NN  GGGG I N  NN E
                                       G          EEE
                                    GGG       
=end