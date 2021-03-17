require 'io/console'

# Reads keypresses from the user including 2 and 3 escape character sequences.
def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  #STDIN.echo = !true
  STDIN.cooked!

  return input
end

##
#i = 0
#c = ""
#time = Time.now
#
#while(i != 2)
#    c += read_char
#    i -= 1
#    now = Time.now
#    if now.to_i-time.to_i == 10
#      break
#    end
#end
#
#puts "Voce apertou espaco #{c.size} vezes"
#
#puts c
