class Weather
  attr_accessor :day, :max_t, :min_t

  def initialize(options = {})
    @day = options[:day]
    @max_t = options[:max_t]
    @min_t = options[:min_t]
  end

  def to_s
    "Weather {day #{@day} max_t #{@max_t} min_t #{@min_t}}"
  end

  def self.list(filename, accept_range)
    [].tap do |wheather_data|
      File.readlines(filename)[accept_range].each do |line|
        temp_data = line.split(" ")
        wheather_data << Weather.new({ day: temp_data[0], max_t: temp_data[1], min_t: temp_data[2] })
      end
    end
  end

end
