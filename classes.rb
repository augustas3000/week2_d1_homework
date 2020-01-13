# Create a class called Student :
class Student
  # that takes in a name (String) and a cohort (string - e.g “E18”, “G6”, etc) when an new instance is created.

  attr_accessor :name, :cohort

  def initialize(name, cohort)
      @name = name
      @cohort = cohort
  end

  def talk
    return "I can talk!"
  end

  def say_favourite_language(language)
    return "I love #{language}"
  end

end

# Make a class to represent a Team that has the properties Team name (String), Players (array of strings) and a Coach (String)
class Team

  attr_reader :team_name, :players, :coach, :points
  attr_writer :coach

  def initialize(team_name_str, players_array, coach_str)
    @team_name = team_name_str
    @players = players_array
    @coach = coach_str
    # for tracking point count, this is instance variable which we
    # do not define on initialization
    @points = 0
  end

  # Create a method that adds a new player to the players array.
  def add_player(nu_player_name_str)
    @players.push(nu_player_name_str)
  end

  # Add a method that takes in a string of a player’s name and checks to see if they are in the players array.
  def player_in_team?(player_name_str)
    if @players.include?(player_name_str)
      return true
    else
      return false
    end
  end

  # Create a method that takes in whether the team has won or lost and updates the points property for a win.

  # result_str input will be limited to "win" or "loose"
  def update_points(result_str)
    win_or_loose = {"win" => 1, "loose" => 0}
    @points += win_or_loose[result_str]
  end

end
