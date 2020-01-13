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


# Create a class for a Library that has an array of books. Each book should be a hash with a title, which is a string, and rental details, which is another hash with a student name and due date


class Library

  attr_reader :books
  # attr_writer :


  def initialize
    @books = [
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
    ]
  end

  # Create a method that takes in a book title and returns all of the information about that book.

  def return_book_hash_simple(book_title_str)
    for book_hash in @books
      if book_hash[:title] == book_title_str
        return  book_hash
      end
    end
    return "The book is not available"
  end


  def find_info_by_title(book_title_str)

    for book_hash in @books

      if book_hash[:title] == book_title_str
        return "Title is: #{book_hash[:title]}\n,
                Rental details:\n
                Student Name: #{book_hash[:rental_details][:student_name]},\n
                Due Date: #{book_hash[:rental_details][:date]}"
      end

    end

    return "The book is not available"
  end

  # Create a method that takes in a book title and returns only the rental details for that book.

  def find_rental_info_by_title(book_title_str)

    for book_hash in @books

      if book_hash[:title] == book_title_str
        return "Rental details:\n
                Student Name: #{book_hash[:rental_details][:student_name]},\n
                Due Date: #{book_hash[:rental_details][:date]}"
      end

    end

    return "The book is not available"
  end

# Create a method that takes in a book title and adds it to our book list (add a new hash for the book with the student name and date being left as empty strings)

  def add_book(book_title_str)
    # is the book not already present in @books list?
    for book_hash in @books
      if book_hash[:title] == book_title_str
        return "Such book is already in the library"
      end
    end

    new_book = {
            title: book_title_str,
            rental_details: {
            student_name: "",
            date: ""
            }}

    @books.push(new_book)

  end


  # Create a method that changes the rental details of a book by taking in the title of the book, the student renting it and the date it’s due to be returned.

  def change_rent_details(book_title_str, student_str, due_date_str)
    # return hash of questioned book if present and save it
    # to a variable book_hash
    book_hash = return_book_hash_simple(book_title_str)
    # delete the old one from @books array
    @books.delete(book_hash)
    # update saved hash as required
    book_hash[:rental_details][:student_name] = student_str
    book_hash[:rental_details][:date] = due_date_str
    # push the updated book hash to @books array
    @books.push(book_hash)
  end

end
