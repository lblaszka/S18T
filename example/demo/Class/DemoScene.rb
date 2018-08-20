module S18T
    class DemoScene < Scene
        
        def init()
            addObject( DemoObject.new() );
            addObject( TextLabel.new( :text => "S18T - Terminal Game Engine. V:#{VERSION}", :position => Vector2.new( 0, 8)));
            addObject( TextLabel.new( :text => "More: https://github.com/lblaszka/S18T", :position => Vector2.new( 0, 9)));
        end

    end
end