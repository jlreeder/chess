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
    self.total_subsalary * multiplier
  end

  protected
  # protected: other instances of same class can call, but
  # nothing else can call

  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end

end
