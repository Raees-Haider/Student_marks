require_relative "students"

class Section
  attr_accessor :name, :students

  def initialize(name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def top_three_students
    @students.sort_by { |s| -s.total_marks }.first(3)
  end
end
