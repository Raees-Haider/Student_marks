require_relative "subject_marks"

SUBJECTS = [
  "Math",
  "English", 
  "Biology", 
  "Chemistry",
  "Physics", 
  "Urdu", 
  "Islamic Studies"
]

class Student
  attr_accessor :name, :subjects

  def initialize(name)
    @name = name
    @subjects = []
    SUBJECTS.each do |sub|
      @subjects << SubjectMark.new(sub, 0.0)
    end
  end

  def set_marks(subject, marks)
    sub = @subjects.find { |s| s.subject == subject }
    sub.marks = marks if sub
  end

  def total_marks
    @subjects.map(&:marks).sum
  end
end
