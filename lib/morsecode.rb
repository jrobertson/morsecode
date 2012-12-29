#!/usr/bin/env ruby

# file: morsecode.rb

require 'dynarex'

class MorseCode

  def initialize(input_string)
    buffer = File.open(File.dirname(__FILE__) + '/morsecode.xml','r').read
    @h = Hash[Dynarex.new(buffer).to_h.map{|x| x.values[0..1]}]
    
    @input_string = input_string
  end

  def to_s
    @input_string.split(/4/).map{|code| @h[code]}.join()
  end

  def to_mc
    @input_string.split(//).map{|char| @h.invert[char]}.join('4')
  end

end
