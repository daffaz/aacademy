class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers.push(teacher)
  end

  def enroll(student)
    if @students.size < @student_capacity
      @students.push(student)
      return true
    end
    false
  end

  # @param [String] student
  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.count / @teachers.count
  end

  # @param [String] student
  # @param [Integer] grade
  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] = @grades[student] << grade
      return true
    end
    false
  end

  # @param [String] student
  def num_grades(student)
    @grades[student].count
  end

  # @param [String] student
  def average_grade(student)
    if @students.include?(student) && @grades[student].size > 0
      return @grades[student].sum / @grades[student].size
    end
    nil
  end
end
