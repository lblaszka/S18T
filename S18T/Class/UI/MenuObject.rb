module S18T

    class MenuObject < Object

            @menuItem_color # String/char - font color unselected menu item
            @menuItem_bgColor # String/char -  background color unselected menu item          
            @menuItem_Selected_color # String/char -  font color selected menu item
            @menuItem_Selected_bgColor # String/char -  background color selected menu item
            @keyDown # String/char - key down code
            @keyUp # String/char - key up code    
            @keyEnter # String/char - key enter code        
            @title # S18T::TextLabel - object of title text label  
            @menuItems # Array[ S18T::TextLabel ] - container of menu items.

        def initialize ( _args )
            super( _args );

            @menuItem_color = _args[:menuItem_color];
            @menuItem_bgColor = _args[:menuItem_bgColor];
            @menuItem_Selected_color = _args[:menuItem_Selected_color];
            @menuItem_Selected_bgColor = _args[:menuItem_Selected_bgColor];

            if( _args[:keyDown] != nil )
                @keyDown = _args[:keyDown];
            else
                @keyDown = KEY[:DOWN];
            end

            if( _args[:keyUp] != nil )
                @keyUp = _args[:keyUp];
            else
                @keyUp = KEY[:UP];
            end

            if( _args[:keyEnter] != nil )
                @keyEnter = _args[:keyEnter];
            else
                @keyEnter = KEY[:ENTER];
            end

            maneMenuTitle( _args[ :menuTitle] );
            makeMenuItems( _args[ :menuItems ] );

            @selected = 0;

            selectItem( @selected );
        end

        private
        def maneMenuTitle( _menuTitle )
            _menuTitle[:position] = getPosition();
            @title = TextLabel.new( _menuTitle );
            Engine.GetScene().addObject( @title );
        end

        def makeMenuItems( _menuItems )
            @menuItems = Array.new();
            _menuItems.each do | menuItem |
                menuItem[:position] = getPosition() + Vector2.new( 0, @menuItems.length + 1);
                menuItem[:text_color] = @menuItem_color;
                menuItem[:text_bgColor] = @menuItem_bgColor;
                _textLabel = TextLabel.new( menuItem )
                @menuItems[ @menuItems.length ] = _textLabel;
                Engine.GetScene().addObject( _textLabel );
            end
        end

        def selectItem( _index )
            if( _index >= 0 || _index < @menuItems.length )
                @menuItems[ _index ].setText( :text_color => @menuItem_Selected_color, :text_bgColor => @menuItem_Selected_bgColor );
            end
        end

        def unselectItem( _index )
            if( _index >= 0 || _index < @menuItems.length )
                @menuItems[ _index ].setText( :text_color => @menuItem_color, :text_bgColor => @menuItem_bgColor );
            end
        end
        
        public
        def update()
            if( Input.Key( @keyUp ) )
                unselectItem( @selected );
                
                @selected -= 1;
                if( @selected < 0 )
                    @selected = @menuItems.length - 1;
                end

                selectItem( @selected );
            end

            if( Input.Key( @keyDown ) )
                unselectItem( @selected );
                
                @selected += 1;
                if( @selected >= @menuItems.length )
                    @selected = 0;
                end

                selectItem( @selected );
            end

            if( Input.Key( @keyEnter ) )
                enterItem( @selected );
            end
        end

        protected
        def enterItem( _index )

        end
    end
end