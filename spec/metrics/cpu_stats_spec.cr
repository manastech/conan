require "../spec_helper"

class CpuStatsTest < Conan::CpuStats
  class File
    def self.read_lines(file)
      ::File.read_lines("#{__DIR__}/../data/#{file.replace('/', '_')}")
    end
  end
end

describe "cpu_stats" do
  it "parse /proc/stat" do
    values = collect(CpuStatsTest.new)

    values["cpu.user"].should eq("613564")
    values["cpu.nice"].should eq("255027")
    values["cpu.system"].should eq("532591")
    values["cpu.idle"].should eq("706317676")

    values["cpu.iowait"].should eq("1174933")
    values["cpu.irq"].should eq("3")
    values["cpu.softirq"].should eq("14759")

    values["cpu.steal"].should eq("0")
    values["cpu.guest"].should eq("0")
  end
end
