module S18T

    class TextLabel < Object

        @text # String
        @text_color # string/char - font color
        @text_bgColor # String/char - background color

        def initialize ( _args )
            super( _args );
            setText( _args );
        end

        public
        def setText( _args )
            if( _args[:text].is_a?(String) )
                @text = _args[:text];
            end

            if( _args[ :text_color ] != nil )
                @text_color = _args[ :text_color ];
            else
                @text_color = COLOR[ :DEFAULT ];
            end

            if( _args[ :text_bgColor ] != nil )
                @text_bgColor = _args[ :text_bgColor ];
            else
                @text_bgColor = COLOR[ :DEFAULT ];
            end
            setSpriteText();
            
        end

        private
        def setSpriteText
            if( @text.is_a?( String ) )
                if( ( @sprite == nil ) || ( ( @text.length - @sprite.getSize().x ) > 0 ) )
                     @sprite = Sprite.new( Vector2.new( @text.length+2, 1 ));
                end

                @sprite.getSize().x.times do | it |
                    @sprite.setPixel( it, 0, nil );
                end
                
                @text.length.times do | it |
                    @sprite.setPixel( it, 0, Pixel.new( @text[it], @text_color, @text_bgColor ) );
                end    
            end

            @changed = true;
        end
    end

end