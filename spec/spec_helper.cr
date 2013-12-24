require "spec"
require "../src/metric"

def collect(metric)
  values = {} of String => String
  metric.collect(values)
  values
end
