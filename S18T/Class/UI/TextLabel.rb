module S18T

    class TextLabel < Object

        def initialize ( _args )
            super( _args );
            setText( _args );
        end

        def setText( _args )
            if( _args[:text] != nil )
                @text = _args[:text];
            end

            if( _args[ :text_color ] != nil )
                @text_color = _args[ :text_color ];
            else
                @text_color = COLOR[ :default ];
            end

            if( _args[ :text_bgColor ] != nil )
                @text_bgColor = _args[ :text_bgColor ];
            else
                @text_bgColor = COLOR[ :default ];
            end
            setSpriteText();
            
        end

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