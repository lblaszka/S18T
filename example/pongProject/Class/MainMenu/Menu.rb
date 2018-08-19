module S18T

    class Menu < Object

        def start()
            @selected = 1;

            Engine.GetScene().addObject( TextLabel.new(    :position => Vector2.new(5,5), 
                                                            :name => "menu_0", 
                                                            :text => " Pong Project ", 
                                                            :text_color => COLOR[ :black ], 
                                                            :text_bgColor => COLOR[ :blue ] ) );
            
            Engine.GetScene().addObject( TextLabel.new(    :position => Vector2.new(5,6), 
                                                            :name => "menu_1", 
                                                            :text => " Play! ", 
                                                            :text_color => COLOR[ :black ], 
                                                            :text_bgColor => COLOR[ :grey ] ) );
            
            Engine.GetScene().addObject( TextLabel.new(    :position => Vector2.new(5,7), 
                                                            :name => "menu_2", 
                                                            :text => " Exit "  ) );
        end

        def update()
            if( Input.Key( KEY[ :UP ] ) )
                unselectMenuObject( @selected );
                @selected-=1;

                if( @selected == 0 )
                    @selected = 2;
                end

                selectMenuObject( @selected );
            end

            if( Input.Key( KEY[ :DOWN ] ) )
                unselectMenuObject( @selected );
                @selected+=1;

                if( @selected == 3 )
                    @selected = 1;
                end

                selectMenuObject( @selected );
            end

            if( Input.Key( KEY[ :ENTER] ) )
                if( @selected == 2 )
                    Engine.Stop();
                end

                if( @selected == 1 )
                    Engine.SetScene( Game_Scene.new() );
                end
                
            end
        end

        def unselectMenuObject( _index )
            Engine.GetScene().findObjectsByName( "menu_"+_index.to_s )[0].setText( :text_bgColor => COLOR[ :default], :text_color => COLOR[ :default] );
        end

        def selectMenuObject( _index )
            Engine.GetScene().findObjectsByName( "menu_"+_index.to_s )[0].setText( :text_bgColor => COLOR[ :grey], :text_color => COLOR[ :black] );
        end

    end

end