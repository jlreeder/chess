require_relative 'employee'

class Manager < Employee
  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salary, boss)
    @employees = employees
end
