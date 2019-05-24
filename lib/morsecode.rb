#!/usr/bin/env ruby

# file: morsecode.rb


class MorseCode

  def initialize(input_string='')
    
    @h = {
      "t"=>"1", "m"=>"11", "n"=>"12", "o"=>"111", "g"=>"112", "q"=>"1121", 
      "z"=>"1122", "k"=>"121", "d"=>"122", "-"=>"2211", "."=>"212121", 
      "y"=>"1211", "c"=>"1212", "x"=>"1221", "b"=>"1222", "e"=>"2", "a"=>"21",
      "i"=>"22", "w"=>"211", "r"=>"212", ""=>"2121", "l"=>"2122", "u"=>"221", 
      "s"=>"222", "j"=>"2111", "p"=>"2112", "f"=>"2212", "v"=>"2221", 
      "h"=>"2222", "1"=>"21111", "2"=>"22111", "3"=>"22211", "4"=>"22221", 
      "5"=>"22222", "6"=>"12222", "7"=>"11222", "8"=>"11122", "9"=>"11112",
      "0"=>"11111", " "=>"5", "_"=>"221121", ":"=>"222111", "/"=>"12212", 
      "@"=>"211212", "?"=>"221122", ","=>"112211", "^"=>"3"
    }
    
    @input_string = input_string
  end

  def to_s
    @input_string.split(/5/).map \
        {|word| word.split(/4/).map{|code| @h.invert[code]}.join }.join ' '
  end

  def to_mc
    @input_string.split(//).map{|char| @h[char]}.join('4')
  end

end

class MorseCodeInteractive

  def initialize(dash: 'D', dot: 'C', separator: 'B', terminator: "\r", 
                 debug: false)

    @keys = {
      dash: dash, 
      dot: dot, 
      separator: separator, 
      terminator: terminator
    }

    @mc = ''
    @debug = debug

  end

  def input(c)

    h = {
      dash: :dash, 
      dot: :dot, 
      separator: :separator, 
      terminator: :submit
    }

    if @debug then
      puts 'c: ' + c.inspect
      puts '@keys.invert: ' + @keys.invert.inspect
    end

    key = @keys.invert[c]
    puts 'key: ' + key.inspect if @debug
    found = h[key]
    puts 'found: ' + found.inspect if @debug
    method(found).call if found

  end

  def on_dash() end
  def on_dot() end
    
  def on_separator(c)
    puts 'c: ' + c.inspect
  end
  
  def on_submit(s)
    puts 's: ' + s.inspect    
  end

  private

  def dash()
    @mc += '1'
    on_dash()
  end

  def dot()
    @mc += '2'
    on_dot()
  end

  def separator()
    
    @mc += @mc[-1] =='4' ? '5' : '4'
    s = MorseCode.new(@mc).to_s[-1]
    on_separator(s)

  end

  def submit()

    s = MorseCode.new(@mc).to_s 
    on_submit(s)
    @mc = ''  

  end
end
