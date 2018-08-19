module S18T

    class Scene

        @objects;

        def initialize()
            @objects = Array.new();
        end

        def addObject( _object )
            @objects[ @objects.length ] = _object;
        end

        def setServisedObjects()
            @objects.each do | _object |
                _object.setServised();
            end
        end

        def getNumberObjects()
            @objects.length;
        end

        def getObject( _index )
            return @objects[ _index ];
        end

        def update()
            @objects.each do | _object |
                if( _object.created?())
                    _object.start()
                end

                _object.update();

            end
        end

        def killDying()

            it = 0;
            while it < @objects.length do
                if( @objects[it].dying?() )
                    @objects[it].dead();
                    @objects.delete_at(it);
                end
                it = it + 1;
            end
        end

        def findObjectsByName( _name )
            _objects = Array.new();

            @objects.each do | _object |
                if( _object.eqName?( _name ) )
                    _objects[ _objects.length ] = _object;
                end
            end
            return _objects;
        end

        def killAll()
            @objects.length.times do | it |
                @objects.delete_at( it );
            end
        end


        def init()

        end

        def close()

        end

    end

end