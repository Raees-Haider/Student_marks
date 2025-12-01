def add_section(school)
  print "\nEnter name of new section: "
  name = gets.chomp
  school.add_section(Section.new(name))
  puts "Section #{name} added successfully!"
end

def add_student(school)
  print "\nEnter section name: "
  sec_name = gets.chomp
  section = school.find_section(sec_name)

  if section.nil?
    puts "Section not found!"
    return
  end

  print "Enter student name: "
  student_name = gets.chomp
  student = Student.new(student_name)

  puts "\nEnter marks for each subject:"
  SUBJECTS.each do |sub|
    print "#{sub}: "
    marks = gets.chomp.to_f
    student.set_marks(sub, marks)
  end

  section.add_student(student)
  puts "Student #{student_name} added to Section #{sec_name}!"
end

def print_section_details(section)
  puts "\n--- Students in Section #{section.name} ---"
  if section.students.nil? || section.students.empty?
    puts "No students found in this section."
    return
  end
  section.students.each do |student|
    puts "\nStudent: #{student.name}"
    student.subjects.each do |sub|
      puts "  #{sub.subject}: #{sub.marks}"
    end
    puts "  Total Marks: #{student.total_marks}"
  end
end

def print_top_positions(section)
  puts "\n--- Top 3 Students in Section #{section.name} ---"
  section.top_three_students.each_with_index do |s, i|
    puts "#{i + 1}. #{s.name} - #{s.total_marks} marks"
  end
end
