# Monkey-Patch Ruby's existing Array class to add your own custom methods

class Array
    require "byebug"
    #PART 1

    def span
        if self.length == 0
            nil
        else
            self.max - self.min
        end
    end

    def average
        if self.length == 0
            nil
        else
            self.sum / (1.0*self.length)
        end
    end

    def median
        if self.length == 0
            return nil
        end

        if self.length % 2 != 0
            self.sort[self.length/2]
        else
            (self.sort[self.length/2 - 1] + self.sort[self.length/2]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end


    #PART 2

    def my_count(value)

        count = 0

        self.each {|ele| count += 1 if ele == value}

        count
    end

    def my_index(value)

        self.each_with_index do |ele,i|
            if ele == value
                return i
            end
        end
        nil
    end

    def my_uniq

        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end

        new_arr
    end

    
    def my_transpose

        new_arr = Array.new(self.length) {Array.new[]}

        debugger
        self.each_with_index do |arr, idx1|
            arr.each_with_index do |ele, idx2|
                new_arr[idx2] << ele
            end
        end

        new_arr
    end
end

#run sample array to run debugger (hopefully)

