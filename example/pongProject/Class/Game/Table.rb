module S18T

    class Game_Table < Object
        
        TABLE_SIZE_X = 23
        TABLE_SIZE_Y = 15
        
        def start()

            @sprite = Sprite.new( Vector2.new( TABLE_SIZE_X, TABLE_SIZE_Y ));

            TABLE_SIZE_Y.times do | _y |

                @sprite.setPixel( 0, _y, Pixel.new( " ", COLOR[:grey], COLOR[:grey] ) );
                @sprite.setPixel( TABLE_SIZE_X-1, _y, Pixel.new( " ", COLOR[:grey], COLOR[:grey] ) );

            end

        end
    end
    
end