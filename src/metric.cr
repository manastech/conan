module Conan
  abstract class Metric
    @@all = {} of String => Metric.class

    def initialize(params)
    end

    def self.register(name)
      Metric.register(name, self)
    end

    def self.register(name, klass)
      @@all[name] = klass
    end

    def self.all
      @@all.values
    end

    def self.[](name)
      @@all[name]?
    end
  end

  require "metrics/**"
end
