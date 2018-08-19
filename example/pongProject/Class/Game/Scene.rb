module S18T

    class Game_Scene < Scene

        def init()
            addObject( Game_Table.new() );
            addObject(  Game_Player.new( :position => Vector2.new(10,0), :name => "blue" ) );
            addObject(  Game_Bot.new( :position => Vector2.new(10,14), :name => "red" ) );
            addObject( Game_Ball.new( :position => Vector2.new( 10,7)) );
        end


    end
    
end