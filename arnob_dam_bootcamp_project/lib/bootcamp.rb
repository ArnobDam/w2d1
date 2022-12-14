require "byebug"

class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity

        @teachers = []
        @students = []

        @grades = Hash.new {|hash,k| hash[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        teachers << teacher
    end

    def enroll(student)
        if students.length < @student_capacity
            students << student
            true
        else
            false
        end
    end

    def enrolled?(student)
        if students.include?(student)
            return true
        end
        false
    end

    def student_to_teacher_ratio
        students.length / teachers.length
    end

    def add_grade(student, grade)
        if students.include?(student)
            @grades[student] << grade
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        grades_sum = 0

        #debugger
        if students.include?(student) && @grades[student].length > 0
            @grades[student].each {|grade| grades_sum += grade}
            grades_sum / @grades[student].length
        elsif @grades[student].length == 0
            nil
        else
            nil
        end
    end
end
