module S18T

    class Game_Paddle < Object

        PADDLE_SIZE_X = 3
        PADDLE_SIZE_Y = 1

        PADDLE_MOVE_SPACE = 9

        def start()
            @fgColor = COLOR[:black];
            @bgColor = COLOR[:grey];
        end

        def moveLeft
            if( @paddlePosition > - PADDLE_MOVE_SPACE )
                @paddlePosition-= 1;
                changePosition( Vector2.new(-1,0) );
            end
        end

        def moveRight
            if( @paddlePosition < PADDLE_MOVE_SPACE )
                @paddlePosition+= 1;
                changePosition( Vector2.new(1,0) );
            end
        end

        def drawPaddle()
            @sprite = Sprite.new( Vector2.new( PADDLE_SIZE_X, PADDLE_SIZE_Y ) );
            @paddlePosition = 0;
            
            PADDLE_SIZE_X.times do | it |
                @sprite.setPixel( it, 0, Pixel.new( "\205", @fgColor, @bgColor));
            end
        end
    end

    class Game_Player < Game_Paddle

        def start()
            @fgColor = COLOR[:blue];
            @bgColor = COLOR[:default];
            drawPaddle();
        end

        def update()
            if( Input.Key( KEY[ :LEFT ] ) )
                moveLeft();
            end

            if( Input.Key( KEY[ :RIGHT ] ) )
                moveRight();
            end
        end

    end

    class Game_Bot < Game_Paddle

        def start()
            @fgColor = COLOR[:red];
            @bgColor = COLOR[:default];
            drawPaddle();
        end

        def update()
            if( Input.Key( KEY[ :LEFT ] ) )
                moveLeft();
            end

            if( Input.Key( KEY[ :RIGHT ] ) )
                moveRight();
            end
        end
    end
end