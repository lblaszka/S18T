module S18T
    require "/"+File.dirname(__FILE__)+"/Class/Includes.rb"

    VERSION = "1.0.1 Dev"
    WEB_SITE = "https://github.com/lblaszka/s18t"

    def self.info
print <<EOF
S18T - Terminal Game Engine
    Version: #{VERSION}
    More: #{WEB_SITE}\n
EOF
    end

END{
    system("stty -raw echo")
    print "\e[?25h";
}

end
