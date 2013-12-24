require "socket"
require "inifile"
require "metric"
require "metric_collector"

include Conan

config = IniFile.load(File.read("conan.ini"))

collector = MetricCollector.new
Metric.all.each do |metric_class|
  collector.add(metric_class.new)
end
values = collector.collect

config[""]["graphite"] =~ /(.+)\:(\d+)/
graphite_host = $1
graphite_port = $2.to_i

ts = Time.now.to_i
TCPSocket.open(graphite_host, graphite_port) do |sock|
  values.each do |key, value|
    sock.puts "#{config[""]["prefix"]}.#{key} #{value} #{ts}"
  end
end


