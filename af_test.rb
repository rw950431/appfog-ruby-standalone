#!/usr/bin/env ruby
#-----------------------------------------------
# Name:  af_test.rb
#
# Purpose: first test of AppFog standalone app
#          simple example of how to keep standalone app alive
#          since Appfog doesnt automatically restart standalone apps
#
# History:
#   Date        Author  Remarks
#   28Nov2013   RW950431     Created.
#-----------------------------------------------

# run some useless code and then throw an exception
def main()
 puts "Starting:"+Time.new.inspect
 n=5
 loop {
    t=Time.new
    puts "Tick #{n}:"+Time.new.inspect
    n=n-1
    if (n==0)  
      puts "Boom!" 
      raise 
    end 
    sleep 2
 
 }
end

loop {
  begin
    main()
  rescue Exception => bang
    $stderr.puts "==============Begin================="
    $stderr.puts Time.new.inspect
#http://coderrr.wordpress.com/2008/11/07/the-simple-way-to-print-exceptions-in-ruby/
    $stderr.puts $!, *$@
    $stderr.puts "==============End==================="
    sleep 10
  end
}

