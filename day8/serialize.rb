class Employee
    attr_reader :name, :age, :gender
    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end 
    def ==(other_obj)
        self.name == other_obj.name &&
        self.age == other_obj.age &&
        self.gender == other_obj.gender
    end
    # def printobj
    #     puts self.name
    # end
end

begin
    Employee_Obj = Employee.new('Meet',22,'M')
    Employee_Obj_Serialized = Marshal.dump(Employee_Obj)
    Employee_Obj_Deserialized = Marshal.load(Employee_Obj_Serialized)
    if Employee_Obj == Employee_Obj_Deserialized
        puts("Match Successful")
    else
        puts(" Match Unsuccessful")
    end
    # Employee_Obj.printobj
rescue 
    puts "Error Occured"
end
