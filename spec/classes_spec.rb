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


class TestLibrary < Minitest::Test
  def setup
    @library_obj = Library.new
    # define a local variable @new_book to store a new book hash
    # this is for testing add_book method
    @new_book = {
            title: "Killing Floor",
            rental_details: {
            student_name: "",
            date: ""
            }}
    # for checking change_rent_details method:
    @updated_book = {
            title: "lord_of_the_rings",
            rental_details: {
            student_name: "Josh",
            date: "01/12/12"
            }}

  end

  def test_get_books
    assert([
      {
        title: "lord_of_the_rings",
        rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
        }
      },
      {
        title: "cats_cradle",
        rental_details: {
        student_name: "Judy",
        date: "01/12/19"
        }
      },
      {
        title: "Necronomicon",
        rental_details: {
        student_name: "Erica",
        date: "01/12/15"
        }
      }
    ], @library_obj.books)
  end

  def test_find_info_by_title_book_avilable()
    actual = @library_obj.find_info_by_title("Necronomicon")
    expected = "Title is: Necronomicon\n,
                Rental details:\n
                Student Name: Erica,\n
                Due Date: 01/12/15"
    assert_equal(expected, actual)
  end


  def test_find_info_by_title_book_not_avilable()
    actual = @library_obj.find_info_by_title("Fear and Loath in Las vegas")
    expected = "The book is not available"
    assert_equal(expected, actual)
  end


  def test_find_rental_info_by_title_book_avilable()
    actual = @library_obj.find_rental_info_by_title("Necronomicon")
    expected = "Rental details:\n
                Student Name: Erica,\n
                Due Date: 01/12/15"

    assert_equal(expected, actual)
  end


  def test_find_rental_info_by_title_book_not_avilable()
    actual = @library_obj.find_rental_info_by_title("Fear and Loath in Las vegas")
    expected = "The book is not available"
    assert_equal(expected, actual)
  end

  def test_add_book_book_not_in_lib()
    @library_obj.add_book("Killing Floor")
    actual = @library_obj.return_book_hash_simple("Killing Floor")
    assert_equal(@new_book, actual)
  end


  def test_add_book_book_in_lib()
    assert_equal("Such book is already in the library", @library_obj.add_book("Necronomicon"))
  end

  def test_change_rent_details
    # change details:
    @library_obj.change_rent_details("lord_of_the_rings", "Josh", "01/12/12" )
    expected = @updated_book
    actual = @library_obj.return_book_hash_simple("lord_of_the_rings")
    assert_equal(expected, actual)
  end
end
