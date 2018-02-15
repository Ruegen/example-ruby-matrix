class Matrix
    attr_accessor :matrix, :rows, :columns
    
    def initialize(rows, columns)
        @rows = rows
        @columns = columns 
        @matrix = []

        for i in 0...@rows do
            @matrix[i] = []
            for c in 0...@columns do 
                @matrix[i][c] = 0
            end
        end
    end

    def randomize
        @matrix.each_with_index do |row, rowIndex|
            row.each_with_index do |col, colIndex|
                @matrix[rowIndex][colIndex] = rand(0...10)
            end
        end
    end

    def add n 
        @matrix.each_with_index do |row, rowIndex|
            row.each_with_index do |col, colIndex|
                @matrix[rowIndex][colIndex] += n
            end
        end
    end

    def subtract n 
        @matrix.each_with_index do |row, rowIndex|
            row.each_with_index do |col, colIndex|
                @matrix[rowIndex][colIndex] -= n
            end
        end
    end

    def multiply n 
        # dot product of self * n
        if n.instance_of? Matrix 
            if @rows != n.rows 
                raise 'incorrect matrix size' 
            end

            # new matrix which will be the dot product of self * n
            m = Matrix.new @rows, n.columns
 
            m.matrix.each_with_index do |row, rowIndex|
                row.each_with_index do |col, colIndex|
                    # dot product here
                    result = 0;

                    # sum all rows values by multiplying them by each n column value
                    @matrix.each_with_index do |r, i|
                        result += @matrix[rowIndex][i] * n.matrix[i][colIndex]
                    end

                    m.matrix[rowIndex][colIndex] = result
                end
            end
            # finally return the new matrix object (dot product of 2 matricies)
            return m
        else 
            @matrix.each_with_index do |row, rowIndex|
                row.each_with_index do |col, colIndex|
                    @matrix[rowIndex][colIndex] *= n
                end
            end
        end
    end

    def divide n 
        @matrix.each_with_index do |row, rowIndex|
            row.each_with_index do |col, colIndex|
                @matrix[rowIndex][colIndex] /= n
            end
        end
    end
end


a = Matrix.new(2,2)
b = Matrix.new(2,2)

a.randomize
b.randomize

result = a.multiply b
puts result.matrix.to_s