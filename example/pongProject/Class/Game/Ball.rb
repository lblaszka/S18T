module S18T

    class Game_Ball < Object

        def start()

            @sprite = Sprite.new( Vector2.new(1,1) );
            @sprite.setPixel( 0,0, Pixel.new("o", COLOR[:grey]));

            @moveDir =  Vector2.new(0,-1);
            @moveSpeed = 0.2;
            @nextMove = Engine.GetTime() + @moveSpeed;

        end

        def update()

            if( @nextMove < Engine.GetTime() )
                @nextMove = Engine.GetTime() + @moveSpeed;
                collisionWithWalls();
                collisionWithPaddles();
                move();
                
                if( ( getPosition().y < 0 ) || ( getPosition().y > 14  ) )
                	Engine.SetScene( MainMenu_Scene.new() );
                end
            end

            
        end

        def collisionWithWalls()
           if( ( getPosition().x == 1 ) || ( getPosition().x == 20  ) )
           		@moveDir.x = @moveDir.x * -1;
           end 
        end
        
        def collisionWithPaddles()
        		if( getPosition().y == 1 )
        			_blue = Engine.GetScene().findObjectsByName("blue")[0];
        			if( getPosition().x + @moveDir.x - _blue.getPosition().x == 0 )
        				@moveDir.x = -1;
                        @moveDir.y = 1;
                        @moveSpeed-=0.01;
        			elsif( getPosition().x + @moveDir.x - _blue.getPosition().x == 1)
        				#@moveDir.x = 0;
        				@moveDir.y = 1;
                        @moveSpeed-=0.01;
        			elsif( getPosition().x + @moveDir.x - _blue.getPosition().x == 2 )
        				@moveDir.x = 1;
        				@moveDir.y = 1;
                        @moveSpeed-=0.01;
        			end
        		end
        		
        		if( getPosition().y == 13 )
        			_red = Engine.GetScene().findObjectsByName("red")[0];
        			if( getPosition().x + @moveDir.x - _red.getPosition().x == 0 )
        				@moveDir.x = -1;
        				@moveDir.y = -1;
                        @moveSpeed-=0.01;
        			elsif( getPosition().x + @moveDir.x - _red.getPosition().x == 1)
        				#@moveDir.x = 0;
        				@moveDir.y = -1;
                        @moveSpeed-=0.01;
        			elsif( getPosition().x + @moveDir.x - _red.getPosition().x == 2 )
        				@moveDir.x = 1;
        				@moveDir.y = -1;
                        @moveSpeed-=0.01;
        			end
        		end
        end

        def move()
            changePosition( @moveDir );
        end

    end
    
end