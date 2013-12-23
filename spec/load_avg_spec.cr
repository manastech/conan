require "spec"
require "../metric"

class LoadAvgTest < LoadAvg
  def initialize(@uptime)
  end

  def system2(command)
    command.should eq("uptime")
    [@uptime]
  end
end

describe "load_avg" do
  it "parses mac uptime" do
    load_avg = LoadAvgTest.new("16:06  up 4 days,  5:19, 6 users, load averages: 1.20 1.79 1.77")
    values = {} of String => String
    load_avg.collect(values)
    values["system.loadavg.1min"].should eq("1.20")
    values["system.loadavg.5min"].should eq("1.79")
    values["system.loadavg.15min"].should eq("1.77")
  end

  it "parses linux uptime" do
    load_avg = LoadAvgTest.new(" 16:12:22 up 41 days,  1:24,  2 users,  load average: 0.02, 0.04, 0.05")
    values = {} of String => String
    load_avg.collect(values)
    values["system.loadavg.1min"].should eq("0.02")
    values["system.loadavg.5min"].should eq("0.04")
    values["system.loadavg.15min"].should eq("0.05")
  end
end
