module S18T
=begin
    S18T:Input

    How use:
        Class Input to work needed inited. If is done, application dont read from STDIN chars.
        When call meth. "Input.update();" class reading from STDIN incoming chars and save in buffor.
        Now, can check what chars came on using meth. "Input.key( _char );", for this meth. upcase 
        and downcase chars are not same. Diffrent is on meth. "Input.keyUD( _char );", this meth. 
        upcase and downcase chars are same.
        After call "Input.update();" red chars are saved in buffor, for clear they using "Input.clear();".
        For read input stream use "Input.stream(); ", meth. return chars.



        On begin need inited Input exp:
            
            S18T:Input.init();

        Meth. init(); change terminal mode on "raw" and "no echo".
        For returning to normal work terminal need call meth. close(); exp:

            S18T.Input.close();



=end

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

            # get from STDIN chars and save in varibles status.
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

    KEY = {
            :UP => "\e[A",
            :DOWN => "\e[B",
            :LEFT => "\e[D",
            :RIGHT => "\e[C",

            :ENTER => "\r",
            :TAB => "\t",

            :CTRL_Z => "\x1A",
            :CTRL_X => "\x18",
            :CTRL_C => "\x03"
    }
end
