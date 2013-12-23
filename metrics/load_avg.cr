class LoadAvg < Metric
  def collect(values)
    output = system2("uptime")
    output[0].chomp =~ /([\d\.]+)[^\d]+([\d\.]+)[^\d]+([\d\.]+)$/
    values["system.loadavg.1min"] = $1
    values["system.loadavg.5min"] = $2
    values["system.loadavg.15min"] = $3
  end
end
