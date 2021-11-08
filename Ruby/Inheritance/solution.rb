class Employee
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = [employees]
  end

  def bonus(multiplier)
    employee_salary = 0

    @employees.each do |employee|
      employee_salary += employee.salary
    end

    employee_salary * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end
end
