def measure(times = 1)
  ts = []

  times.times do
    start_ts = Time.now
    yield
    end_ts = Time.now

    ts << end_ts - start_ts
  end

  sum = ts.reduce(0) { |sum, num| sum += num }

  sum / ts.length
end
