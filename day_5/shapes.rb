=begin
    
Create classes: Circle, Square, Rectangle, Triangle, Pentagon, Hexagon, Heptagon, Octagon as child classes of Shape. These classes should have functions to calculate perimeter, area, description about the shape and comparison with another shape based on area or perimeter. For eg: there is an object of Circle with x area and object of Heptagon with y area, a function should tell which object has a larger area.
Implement function to compare two shape's perimeter and area based on length/breadth of the shape. Add validations on the input taken from user.
Get the lengths/breadths of the two classes in command line arguments, validate the inputs and perform the task as mentioned above. Write the necessary docstrings

    
=end


class Shapes
    @description = " Shapes are figures "
    def get_description
        @description
    end
    def == (shape_2)
        if self.get_perimeter > shape_2.get_perimeter
            puts(" Perimeter : #{self.get_description} > #{shape_2.get_description}")
        else
            puts(" Perimeter : #{shape_2.get_description} > #{self.get_description}")
        end
        if self.get_area > shape_2.get_area
            puts(" area : #{self.get_description} > #{shape_2.get_description}")
        else
            puts(" area : #{shape_2.get_description} > #{self.get_description}")
        end
    end
end

class Square < Shapes    
    
    def initialize(a)
        @side = a
        @description = " Square"
    end
    def get_perimeter
        4*@side
    end
    def get_area
        @side*@side
    end
   
end
#Square.new(5).get_description

class Rectangle < Shapes    
    
    def initialize(a,b)
        @l = a
        @b = b
        @description = " Rectangle "
    end
    def get_perimeter
        2*(@l + @b)
    end
    def get_area
        @l*@b
    end
   
end
# Rectangle.new(2,3).get_description
class Triangle < Shapes    
    
    def initialize(a,b)
        @b = a
        @h = b
        @description = " Triangle have 3 sides "
    end
    def get_perimeter
        2*(@b + @h)
    end
    def get_area
        (@h*@b)/2
    end
   
end
# Triangle.new(2,3).get_description

class Pentagon < Shapes    
    
    def initialize(a)
        @a = a
        
        @description = " Pentagon have 5l sides "
    end
    def get_perimeter
        5*@a
    end
    def get_area
        ((@a*@a)/4)*(Math.sqrt(5*(5 + 2*Math.sqrt(5))))
    end
   
end



Square.new(4) == Rectangle.new(4, 4)