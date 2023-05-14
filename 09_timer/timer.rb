class Timer
  attr_reader :seconds, :time_string

  def initialize
    @seconds = 0
    @time_string = "00:00:00"
  end

  def seconds=(seconds)
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    seconds = (seconds % 60)

    @time_string = format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
