module S18T

    class MainMenu_Scene < Scene

        def init
            addObject( Menu.new() );
            
        end

    end

    class Menu < Object

        def start()
            @selected = 1;

            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,5), 
                                                            :name => "menu_0", 
                                                            :text => " RPG Project ", 
                                                            :text_color => COLOR[ :black ], 
                                                            :text_bgColor => COLOR[ :blue ] ) );
            
            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,6), 
                                                            :name => "menu_1", 
                                                            :text => " New Game ", 
                                                            :text_color => COLOR[ :black ], 
                                                            :text_bgColor => COLOR[ :grey ] ) );
            
            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,7), 
                                                            :name => "menu_2", 
                                                            :text => " Load Game "  ) );
            
            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,8), 
                                                            :name => "menu_3", 
                                                            :text => " Options " ) );
            
            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,9), 
                                                            :name => "menu_4", 
                                                            :text => " Help "  ) );
            
            Engine.GetScene().addObject( TextObject.new(    :position => Vector2.new(5,10), 
                                                            :name => "menu_5", 
                                                            :text => " Exit "  ) );
        end

        def update()
            if( Input.Key( KEY[ :UP ] ) )
                unselectMenuObject( @selected );
                @selected-=1;

                if( @selected == 0 )
                    @selected = 5;
                end

                selectMenuObject( @selected );
            end

            if( Input.Key( KEY[ :DOWN ] ) )
                unselectMenuObject( @selected );
                @selected+=1;

                if( @selected == 6 )
                    @selected = 1;
                end

                selectMenuObject( @selected );
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