module S18T

    class Screen
        class << self

            @@winsize = nil
            @@frames=nil;
            @@nullPixel = "\e[39;49m "

            def Init( _winsize = nil )
                if( _winsize.is_a?( Vector2 ) )
                    @@winsize = _winsize.clone
                else
                    @@winsize = GetTerminalSize();
                end

                @@frames = Frame.new( @@winsize );
                
                Clear();
            end

            def GetTerminalSize()
                _winsize = STDIN.winsize
                return Vector2.new( _winsize[1], _winsize[0] );
            end


            def ServiceObjects( _scene )
                _scene.getNumberObjects.times do | i |
                    _object = _scene.getObject( i );

                    _sprite = _object.getSprite();

                    if( _sprite != nil )

                        if( _object.created?() )
                            _position = _object.getPosition();
                            @@frames.paintDraw( _position, _sprite );
                        end

                        if( _object.dying?() )
                            _oldPosition = _object.getOldPosition();
                            @@frames.clearField( _oldPosition, _sprite );
                        
                        elsif( _object.changed?() )
                            
                            _oldPosition = _object.getOldPosition();
                            _position = _object.getPosition();
                            @@frames.clearField( _oldPosition, _sprite );
                            @@frames.paintDraw( _position, _sprite );
                        end


                    end
                end
            end



            def Draw()
                if ( @@frames.changed?() )
                    @@winsize.y.times do | _row |
                       @@winsize.x.times do | _col |
                            if( @@frames.wasCh?( _col, _row ) )
                                Cursor.SetPosition( _col, _row );
                                if( @@frames.printPixel( _col, _row ) == false )
                                    NullPixel();
                                end
                            end
                        end
                    end
                end

                Cursor.SetPosition( @@winsize.x, @@winsize.y );
            end

            def NullPixel
                print @@nullPixel;
            end

            def Clear()
                system( "clear" );
            end

            def CursorPositionFromIt ( it )
                _x = it % @@winsize.y;
                _y = it / @@winsize.y;
                return _x, _y;
            end

        end
        
    end

end
