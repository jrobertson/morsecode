# Introducing the Morsecode gem

    require 'morsecode'

    MorseCode.new('22224242122421224111').to_s
    #=> "hello"

    MorseCode.new('hello').to_mc
    #=> "22224242122421224111"

The morse code gem accepts a string of numbers (2=dot, 4=separator, 1=dash) representing morse code and converts it to text.

## Resources 

* [Morse code](http://en.wikipedia.org/wiki/Morse_code)
* [jrobertson/morsecode](https://github.com/jrobertson/morsecode) [GitHub]
