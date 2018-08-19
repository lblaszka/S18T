module S18T
    dir = "./"+File.dirname(__FILE__)+"/"
    require dir+"../../S18T/S18T.rb"
    require dir+"Class/Include.rb"

    Engine.Start();
    
    Screen.Clear();
    Engine.SetScene( MainMenu_Scene.new() );

    while Engine.Working?() do
        
        Engine.MainLoop();

        if( Input.Key( KEY[:CTRL_C]))
            Engine.Stop();
        end
    end
    Engine.Stop();
end