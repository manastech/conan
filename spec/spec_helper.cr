require "spec"
require "../metric"

def collect(metric)
  values = {} of String => String
  metric.collect(values)
  values
end
