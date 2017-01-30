require_relative 'employee'

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total = 0
    employees.each do |employee|
      total += employee.salary
    end
    total * multiplier
  end
end
