module S18T
    #Include S18T
    dir = "./"+File.dirname(__FILE__)+"/"
    require dir+"../../S18T/S18T.rb"

    class TestMenu < MenuObject
        def enterItem( _index )
            if( _index == 2 )
                Engine.Stop();
            end
        end
    end

    #start S18T Engine
    Engine.Start();
    #clear terminal
    Screen.Clear();
    #set scene
    scene = Scene.new();
    scene.addObject( TextLabel.new( :text => "TextLabel") );
    Engine.SetScene( scene );
    scene.addObject( TestMenu.new(  :menuItems =>   [ 
                                                        { :text => "Start"},
                                                        { :text => "Stop"},
                                                        { :text => "exit"} 
                                                    ],
                                    :menuTitle =>   { 
                                                        :text =>"MenuObject", 
                                                        :text_color => COLOR[:BLACK], 
                                                        :text_bgColor => COLOR[:YELLOW] 
                                                    },
                                    :menuItem_color => COLOR[:BLUE],
                                    :menuItem_bgColor => COLOR[:DEFAULT],
                                    :menuItem_Selected_color => COLOR[:BLACK],
                                    :menuItem_Selected_bgColor => COLOR[:GREY],
                                    :position => Vector2(1,1)
                                ));
    #mainloop
    #if engine working this loop will be still doing
    while Engine.Working?() do
        
        #call MainLoop() meth, S18T update Input class and scene.
        Engine.MainLoop();

        #if user press CTRL + C (^C), stop engine.
        if( Input.Key( KEY[:CTRL_C]))
            Screen.Clear();
            Engine.Stop();
        end
    end


end