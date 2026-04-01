require_relative "school"
require_relative "methods"

require_relative "data"

school = School.new
load_data(school)

loop do
  puts "\n======================================"
  puts "\t     Marks System"
  puts "======================================"
  puts "1.Display name of All Sections"
  puts "2.Display students in a section"
  puts "3.Add a section"
  puts "4.Add a student in a section"
  puts "5.Display Position holders"
  puts "6.Exit"
  print "Choose an option:"
  option = gets.chomp.to_i
case option
  when 1
    puts "\nSections:"
    school.sections.each { |s| puts "- #{s.name}" }
  when 2
    print "Enter section name: "
    name = gets.chomp
    section = school.find_section(name)
    section ? print_section_details(section) : puts("Section not found!")
  when 3
    add_section(school)
  when 4
    add_student(school)
  when 5
    print "Enter section name: "
    name = gets.chomp
    section = school.find_section(name)
    section ? print_top_positions(section) : puts("Section not found!")
  when 6
    puts "\nExiting... Goodbye!"
    break
  else
    puts "Invalid option. Try again!"
  end
end