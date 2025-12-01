require_relative "section"

class School
  attr_accessor :sections

  def initialize
    @sections = []
  end

  def add_section(section)
    @sections << section
  end

  def find_section(name)
    @sections.find { |s| s.name.downcase == name.downcase }
  end
end
