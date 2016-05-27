require 'intel_galileo'

def read_temperature( pin_analog = 1, format = 'c')
  
  sensor = IntelGalileo::AnalogInPin.new('A' + pin_analog.to_s)
  value = sensor.read
  puts "valor : #{value.to_i}"
  sample = value.to_i * 5000 / 1023 / 10
  
  return case format
    when 'k' then
      sample + 273.15
    when 'f' then
      sample * 9 / 5 + 32
    when 'c' then
      sample
  end
end 

puts 'Starting program...'
puts 'Leyendo muestra...'
loop do
  puts "La temperatura es : #{read_temperature}"
  sleep(1)
end 
