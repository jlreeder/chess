require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    # generally the return value for adding
    # something to something else is the thing added
    subordinate
  end

  def bonus(multiplier)
    total = 0
    employees.each do |employee|
      total += employee.salary
    end
    total * multiplier
  end
end
