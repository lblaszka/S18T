module S18T

    class Engine
        class << self
            @@scene = nil
            @@working = false
            @@lock = false; # lock if mainloop is executive!

            @@deltaTime;
            @@oldTime;
            @@time;

            @@nextScene = nil;
            
            def Start (  )
                if( @@working )
                    return
                end

                Input.Init();
                Screen.Init();

                @@working=true;

                @@oldTime = Time.now();
                print "S18T Engine started!\n\r"           
            end

            def Stop ( )
                if( @@lock == true )
                    @@working = false
                    return
                end
                
                Input.Close();
                @@working=false;
                print "S18T Engine stoped!\n\r"
            end
            
            def SetScene( _scene )
                if( @@lock == true )
                    @@nextScene = _scene;
                    return;
                end

                if @@scene.is_a?( Scene )
                    @@scene.close()
                    @@scene.killAll();
                    @@scene = nil
                    
                    Screen.Clear();
                end

                @@scene = _scene
                @@scene.init()
            end

            def MainLoop()
                @@lock=true;
                @@time = Time.now().to_f;
                @@deltaTime = @@oldTime - Time.now();
                @@oldTime = Time.now();
                Input.Clear();
                Input.Update();
                
                @@scene.update();

                Screen.ServiceObjects( @@scene );
                Screen.Draw();  

                @@scene.killDying();

                @@scene.setServisedObjects();
                @@lock=false;

                if( @@nextScene != nil)
                    SetScene( @@nextScene );
                    @@nextScene = nil;
                end
            end

            def GetDeltaTime()
                return @@deltaTime;
            end

            def GetTime()
                return @@time;
            end

            def GetScene()
                return @@scene;
            end

            def Working?()
                return @@working;
            end
            
        end
    end
end