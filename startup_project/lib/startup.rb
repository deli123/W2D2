require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup_2)
        @funding > startup_2.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "Invalid Title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if !employee.instance_of?(Employee)
            raise "Invalid Employee"
        end

        amt = @salaries[employee.title]
        if @funding > amt
            @funding -= amt
            employee.pay(amt)
        else
            raise "Not enough funding"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum.to_f / @employees.length
    end

    def close
        @employees.clear
        @funding = 0
    end

    def acquire(startup)
        if !startup.instance_of?(Startup)
            raise "Invalid Startup"
        end

        @employees += startup.employees
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            if !self.valid_title?(title)
                @salaries[title] = salary
            end
        end

        startup.close
    end
end
