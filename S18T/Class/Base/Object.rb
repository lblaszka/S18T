module S18T
    class Object

        @name;

        @position; #current position of object
        
        @oldPosition; #old position of object, using to clearing pixels in Frame.
        @changed; #if object moved, this varible should be true, then Frame will render this object

        @created;

        @sprite;
        @zIndex;

        def initialize ( _args = nil )
            if( _args != nil )
                if( _args[ :name ] != nil )
                    @name = _args[ :name ];
                end

                if( _args[ :sprite ] != nil )
                    @sprite = _args[ :sprite ];
                end

                if( _args[ :position ].is_a?( Vector2 ) )
                    @position = _args[ :position ];
                    @oldPosition = _args[ :position ];
                end

                if( _args[ :zIndex ] != nil )
                    @zIndex = _args[ :zIndex ];
                end
            end

            if( @position == nil )
                @position = Vector2.new(0,0);
                @oldPosition = Vector2.new(0,0);
            end

            if( @zIndex == nil )
                @zIndex = 1;
            end

            @changed = false;
            @created = true;
        end

        def eqName?( _string )
            return @name.eql?( _string )
        end

        def changed?()
            return @changed;
        end

        def created?()
            return @created;
        end

        def dying?()
            return @dying;
        end

        def setPosition( _position )
            @oldPosition = @position;
            @position = _position;
            @changed = true;
        end

        def changePosition( _position )
            setPosition( @position + _position );
        end

        def setServised()
            @changed = false;
            @created = false;
        end

        def setDying()
            @dying = true;
        end

        def getPosition()
            return @position;
        end

        def getOldPosition()
            return @oldPosition;
        end

        def getSprite()
            return @sprite;
        end

        def getZIndex()
            return @zIndex;
        end

        # virtual functions
        def start()

        end

        def update()

        end

        def dead()

        end
    end
end