module S18T
    class Input
        class << self
            def Init()
                @@chars = Hash.new
                @@inputStream = ''
                @@inited = true
                system("stty raw -echo")
                print "\e[?25l";
            end

            def Close()
                @@chars = nil
                @@inputStream = nil
                @@inited = false
                system("stty -raw echo")
                print "\e[?25h";
            end

            def Update()
                if( @@inited == false )
                    Error_noInit();
                    return;
                end

                _nread = STDIN.nread;

                while ( _nread > 0 ) do

                    _char = STDIN.read(1)
                    if( _char == "\e" )
                        _char+= STDIN.read(2);
                        _nread= _nread - 2;
                    end
                    @@inputStream+=_char
                    @@chars[ _char ] = true;

                    _nread= _nread - 1;
                end
            end

            def Clear()
                @@chars.clear
                @@inputStream = ''
            end

            def Key( _char )
                return @@chars[ _char ]
            end

            def KeyUD( _char )
                return @@chars[ _char.upcase ] || @@chars[ _char.downcase ]
            end

            def getStream()
                return ""+@@inputStream
            end

            def getStatus()
                return @@chars.length
            end

            def getKeys()
                return @@chars.to_s
            end

            def Error_noInit()
                puts "Input class isnt inited. Use Input.init()!"
            end
        end
    end 
end
