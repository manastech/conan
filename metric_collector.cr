require "metric"

module Conan
  class MetricCollector
    def initialize
      @metrics = [] of Metric
    end

    def add(metric : Metric)
      @metrics << metric
    end

    def collect
      values = {} of String => String
      @metrics.each do |metric|
        metric.collect values
      end
      values
    end
  end
end
