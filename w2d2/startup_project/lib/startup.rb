require "employee"

class Startup
    attr_accessor :name,:funding,:salaries,:employees
    def initialize(name,funding,salaries)
        @employees = []
        @name = name
        @funding = funding
        @salaries = salaries
    end
    def valid_title?(title)
         @salaries.has_key?(title)
    end
    def > (startup_2)
        self.funding > startup_2.funding
    end
    def hire (employee,title)
        if self.valid_title?(title)
            @employees << Employee.new(employee,title)
        else
            raise "title not valid"
        end
    end
    def size
        @employees.length
    end
    def pay_employee(employee)
        amount = self.salaries[employee.title]
        if amount < @funding 
            employee.pay(amount)   
            @funding -= amount
        else
            raise "Not enough funding"   
        end
    end
    def payday
        @employees.map {|employee| pay_employee(employee)}
    end
    def average_salary
        sum = 0
        @employees.each {|employee| sum += self.salaries[employee.title]}
        sum/self.size
    end
    def close
        @employees = []
        @funding = 0
    end
    def acquire(startup_3)
        @funding += startup_3.funding
        startup_3.salaries.each do |title,salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += startup_3.employees
        startup_3.close
    end
end
