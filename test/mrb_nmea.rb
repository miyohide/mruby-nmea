##
## Nmea Test
##

assert("Nmea#hello") do
  t = Nmea.new "hello"
  assert_equal("hello", t.hello)
end

assert("Nmea#bye") do
  t = Nmea.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("Nmea.hi") do
  assert_equal("hi!!", Nmea.hi)
end
