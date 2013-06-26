class FootBall
  attr_accessor :name, :goal_for, :goal_against, :difference

  def initialize(options = {})
    @name = options[:name]
    @goal_for = options[:goal_for]
    @goal_against = options[:goal_against]
  end

  def to_s
    "Team {name #{@name}} goal_for #{@goal_for} goal_against #{@goal_against}"
  end

  def self.index_map
    { name: 1, goal_for: -4, goal_against: -2 }
  end

  def self.list(filename, accept_range)
    [].tap do |football_data|
      File.readlines(filename)[accept_range].each do |line|
        temp_data = line.split(" ")
        football_data << FootBall.new(
            { name: temp_data[index_map[:name]],
              goal_for: temp_data[index_map[:goal_for]],
              goal_against: temp_data[index_map[:goal_against]]
            }) if temp_data[index_map[:name]]
        football_data.last.difference = calculate_difference(football_data.last)
      end
    end
  end

  def self.calculate_difference(football)
    (football.goal_for.to_i - football.goal_against.to_i).abs
  end

  def self.select_min_by(list, attr_name)
    list.min_by { |team| team.instance_variable_get("@#{attr_name}") }
  end

  def self.sort_by(list, attr_name)
    list.sort_by { |team| team.instance_variable_get("@#{attr_name}") }
  end

end
