require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../classes'


class TestStudent < Minitest::Test

  def setup
    @student_obj = Student.new("Augustas", "G17")
  end

  def test_name_of_student
    assert_equal("Augustas", @student_obj.name)
  end

  def test_cohort_of_student
    assert_equal("G17", @student_obj.cohort)
  end

  def test_student_can_talk()
    assert_equal("I can talk!", @student_obj.talk)
  end

  def test_say_favourite_language
    assert_equal("I love Ruby", @student_obj.say_favourite_language("Ruby"))
  end

end


class TestTeam < Minitest::Test

  def setup
    @team_obj = Team.new("A-Team", [], "Augustas3000")
  end

  def test_add_player
    @team_obj.add_player("SniperX")
    assert_equal("SniperX", @team_obj.players.last)
  end

  def test_player_in_team_true
    # adding a player so we later can check if he is in the list.
    @team_obj.add_player("SniperX")
    assert_equal(true, @team_obj.player_in_team?("SniperX"))

  end

  def test_player_in_team_false
    # @team_obj.add_player("SniperX")
    # empty list of players as per def setup
    assert_equal(false, @team_obj.player_in_team?("SniperX"))
  end

  def test_update_points_win
    # the @team_obj generated in setup starts with 0 initial points
    @team_obj.update_points("win")
    # we will add @points to attr_reader in classes.rb
    # in order to call points method on object @team_obj
    assert_equal(1, @team_obj.points)
  end

  def test_update_points_loose
    # the @team_obj generated in setup starts with 0 initial points
    @team_obj.update_points("loose")
    # we will add @points to attr_reader in classes.rb
    # in order to call points method on object @team_obj
    assert_equal(0, @team_obj.points)
  end

end
