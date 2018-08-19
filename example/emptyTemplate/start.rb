module S18T
    #Include S18T
    dir = "./"+File.dirname(__FILE__)+"/"
    require dir+"../../S18T/S18T.rb"

    #start S18T Engine
    Engine.Start();
    #clear terminal
    Screen.Clear();
    #set scene
    Engine.SetScene( Scene.new() );
    
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