require "json"
require "http"
require "serialport"

my_url = "http://localhost:3000/posts"
my_json = {title: "POST DE MI API", content: "Este post es de mi api", api_token: "ajKjhuyhrfDFhNMNfbffghHf"}

def send_request(url, json)
  json.to_json
  HTTP.post(url, json: json)
end


#params for serial port
port_str = "/dev/ttyS6"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
#just read forever
while true
  value = sp.readline.to_i
  puts value

  if value <= 10
    send_request(my_url, {title: "La distacia es de #{value}", content: "Este post es de mi api", api_token: "ajKjhuyhrfDFhNMNfbffghHf"})
  end
end
#puts i.class #String

sp.close                       #see note 1
