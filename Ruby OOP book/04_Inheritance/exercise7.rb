class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    if @grade > other_student.grade
      return true
    else
      return false
    end
  end

  protected

  def grade
    @grade
  end

end

bob = Student.new("Bob", 5)
joe = Student.new("Joe", 7)

puts "Well done!" if joe.better_grade_than?(bob)
