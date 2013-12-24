class CpuStats < Metric
  register "cpu"

  def collect(values)
    File.read_lines("/proc/stat").each do |line|
      if line.starts_with?("cpu ")
        times = line[4..-1].split(' ')
        values["cpu.user"] = times[1]
        values["cpu.nice"] = times[2]
        values["cpu.system"] = times[3]
        values["cpu.idle"] = times[4]

        values["cpu.iowait"] = times[5]
        values["cpu.irq"] = times[6]
        values["cpu.softirq"] = times[7]

        values["cpu.steal"] = times[8]
        values["cpu.guest"] = times[9]
      end
    end
  end
end
