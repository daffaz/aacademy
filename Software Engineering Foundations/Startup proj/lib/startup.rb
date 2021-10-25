require 'employee'

class Startup
  attr_reader(:name, :funding, :salaries, :employees)

  # @param [String] name
  # @param [Integer] funding
  # @param [Hash] salaries
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  # @param [String] title
  def valid_title?(title)
    salaries.any? { |key, _value| key == title }
  end

  # @param [Startup] other_startup
  def >(other_startup)
    funding > other_startup.funding
  end

  # @param [String] title
  # @param [String] employee
  def hire(employee, title)
    if valid_title?(title)
      employees << Employee.new(employee, title)
    else
      raise StandardError 'Error'
    end
  end

  def size
    employees.size
  end

  # @param [Employee] employee
  def pay_employee(employee)
    gaji = salaries[employee.title]
    if funding > gaji
      employee.pay(gaji)
      @funding -= gaji
    else
      raise StandardError "Kami miskin"
    end
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    total = 0
    employees.each { |employee| total += salaries[employee.title] }
    total / employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  # @param [Startup] other_startup
  def acquire(other_startup)
    @funding += other_startup.funding
    @salaries = { **other_startup.salaries, **salaries }
    other_startup.employees.each { |employee| employees << employee }
    other_startup.close
  end
end
