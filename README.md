# S18T
Simple terminal game engine, written in Ruby. S18T supported GNU/Linux OS. If your OS used terminal, S18T should working good (if hes installed ruby!).
####
S18T Engine was created for learning ruby language. Cen be use to write simple terminal game or application. Engine work great with ssh protocol, telnet etc.

## Fast look
Make sure you have ruby and git installed. Next, execute the following code in the shell:
```bash
cd ~/
git clone https://github.com/lblaszka/S18T
ruby ~/S18T/example/pongProject/start.rb

```
Have fun!

## Getting Started
S18T Engine requires installed Ruby on OS.
### First steps
First, download the engine source code (S18T directory) to the empty location. Then, in the new file with the extension .rb, include the file S18T.rb located in the S18T directory. For example:
```Ruby
require "/path/to/S18T/S18T.rb"
```
It's enough to use the game engine classes.

### Using engine class
All classes and engine components are in the module named "S18T". Therefore, any reference to engine classes should be preceded by "S18T ::":
```Ruby
S18T::ClassName
```
For easier writing, it is recommended to write the code in the S18T module.

### Simple using S18T Engine
The simplest application using S18T looks like this:
```Ruby
module S18T
  require "/path/to/S18T/S18T.rb" #include S18T engine

  Engine.Start(); # start engine
  #do something
  Engine.Stop(); # stop engine
end
```
Application template using the S18T engine can be found in path "examples/template". It contains a code:
```Ruby
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
```

### A sample game "WalkingDot"
A simple game using S18T Engine is located under the path "example/walkingDot". To run the example, just run the following command:
```Bash
#ruby /path/to/example/walkingDot/start.rb
```
In the game, the user moves a single dot. By browsing its code, you can see how to create new scenes and objects. It is basic element of game.
#### WalkingDotObject class
First, look on Class catalog. There is two files: WalkingDotScene.rb and WalkingDotObject.rb. In WalkingDotObject.rb is ther code:
```ruby
module S18T
    class WalkingDotObject < Object

        def start()
            setPosition( Vector2.new(10,10) );
            @sprite = Sprite.new( Vector2.new(1,1));
            @sprite.setPixel( 0,0, Pixel.new(" ",COLOR[:default], COLOR[:blue]));
        end

        def update()

            if( Input.Key( KEY[:LEFT] ) )
                changePosition( Vector2.new(-1, 0) );
            end

            if( Input.Key( KEY[:RIGHT] ) )
                changePosition( Vector2.new(1, 0) );
            end

            if( Input.Key( KEY[:UP] ) )
                changePosition( Vector2.new(0, -1) );
            end

            if( Input.Key( KEY[:DOWN] ) )
                changePosition( Vector2.new(0, 1) );
            end

        end

    end
end
```
It is very simple game object. New class "WalkingDotObject" inherid by "S18T::Object" class. This is required for each game object!
This class include two methods: start and update. Method start in S18T::Object classes is called only one then game object was created. In WalkingDotObject class on start method is set position of object and added simple sprite.
```ruby
setPosition( Vector2.new( position_X, position_Y) ); # set position of game object
@sprite = Sprite.new( Vector2.new( spriteSize_X, spriteSize_Y ) ); #created new S18T::Sprite object and set as @sprite 
@sprite.setPixel( pixelPosition_X, pixelPosition_Y, Pixel.new( pixelChar, fontColor, backgroundColor ) ); #in created sprite on size 1x1, set pixel on position x and y.
```
In update method is checking if arrow buttons are pressed. The S18T::Input class, hes method self.Key( \_char ). This method return true if "\_char" was pressed.
```ruby
if( Input.Key( char ) )
  #if "char" was pressed, do this.
end
```
For simple chars (like: "a", "b" ... "z", "0", "1", ... "9"), you can insert in parameter char.
```ruby
if( Input.Key( "a" ) )
  #if pressed "a" do this.
end
if( Input.Key( "1" ) )
  #if pressed "1" do this.
end
```
For special keys ( like: enter, tab, arrow keys, etc.) defined in the table S18T::KEY (https://github.com/lblaszka/S18T/blob/master/S18T/Class/Base/Input.rb).
```ruby
if( Input.Key( KEY[:left ] )
  #if pressed left arrow key do this.
end
if( Input.Key( KEY[:enter] )
  #if pressed enter key do this.
end
```
Back to WalkingDotObject class, for change position of object use changePosition( deltaPosition ) method. Parameter is object of S18T::Vector2 class. First value of vector is x, second is y.
```ruby
changePosition( Vector2.new( deltaPosition_X, deltaPosition_Y ) );
```
#### WalkingDotScene class
Next, take a look on "WalkingDotScene.rb". In S18T, all game object must be insert to S18T::Scene class object. For WalkingDot game was created class "WalkingDotScene" inherid by S18T::Scene class.
```ruby
module S18T

    class WalkingDotScene < Scene

        def init()
            addObject( WalkingDotObject.new() );
        end
    end

end
```
WalkingDotScene has only one method, init(). This called by S18T::Engine class when scene object was started servised by engine. In WalkingDotScene class in init() method is added new object WalkingDotObject in this moment new game object will be working.
#### start.rb file
On end, take a look on start.rb in main catalog of WalkingDot example.
```ruby
module S18T
    #Include S18T
    dir = "./"+File.dirname(__FILE__)+"/"
    require dir+"../../S18T/S18T.rb"
    require dir+"Class/WalkingDotScene.rb"
    require dir+"Class/WalkingDotObject.rb"

    #start S18T Engine
    Engine.Start();
    #clear terminal
    Screen.Clear();
    #set scene
    Engine.SetScene( WalkingDotScene.new() );
    
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
```
First, need include S18T Engine files and class of WalkingDot. 
```ruby
dir = "./"+File.dirname(__FILE__)+"/"
require dir+"../../S18T/S18T.rb"
require dir+"Class/WalkingDotScene.rb"
require dir+"Class/WalkingDotObject.rb"
```
In dir varible is saved path to "start.rb" file. Next, included files (S18T/S18T.rb, Class/WalkingDotScene.rb and Class/WalkingDotObject.rb).
Next step is inited S18T engine:
```ruby
Engine.Start();
```
Now, S18T is inited and is set terminal mod on "raw, no echo". Next step is set WalkingDotScene in Engine.
```ruby
Engine.SetScene( WalkingDotScene.new() );
```
In this moment, S18T::Engine class called init() method on WalkingDotScene object. Next is loop:
```ruby
while Engine.Working?() do
        
    #call MainLoop() meth, S18T update Input class and scene.
    Engine.MainLoop();

    #if user press CTRL + C (^C), stop engine.
    if( Input.Key( KEY[:CTRL_C]))
        Screen.Clear();
        Engine.Stop();
    end
end
```
S18T::Engine.Working?() return true if S18T::Engine working. Calling S18T::Engine.MainLoop() for call update() methods for all game object included in current scene object. For exit game need press CTRL + C, if pressed, terminal be cleared and S18T stoped. Then S18T::Engine.Working?() return false ane loop be ended.
