module S18T
    class Debug
        @@mode=1;
        class << self

            def SetMode( _mode )
                @@mode = _mode;
            end

            def Log ( _message, _type=0 )
                if( @@mode == 1 )
                    if( _type == :ERROR )
                        Cursor.SetColor(1,0);
                    end
                    Cursor.SetPosition(0,0);
                    puts( _message );

                    Cursor.SetColor();
                    if( _type == :ERROR )
                        Engine.Stop();
                    end
                end
            end
        end
    end
end
        