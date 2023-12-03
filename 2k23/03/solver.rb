require 'set'

file = File.open("example.txt")
file_data = file.read.split("\n")
sum = 0
rows = file_data.length
cols = file_data[0].length
processed_cells = Set.new

file_data.each_with_index do |l, i|
    l.chars.each_with_index do |c, j|
        if c.match(/[^.0-9]/)
            (-1..1).each do |di|
                (-1..1).each do |dj|
                    ni, nj = i + di, j + dj
                    next unless ni.between?(0, rows - 1) && nj.between?(0, cols - 1)
                    next if (ni == i && nj == j) || processed_cells.include?([ni, nj])

                    neighbor = file_data[ni][nj]
                    if neighbor.match?(/[0-9]/)
                        n = neighbor

                        k = 1
                        while nj - k >= 0 && file_data[ni][nj - k].match?(/[0-9]/)
                            n = file_data[ni][nj - k] + n
                            processed_cells.add([ni, nj - k])
                            k += 1
                        end

                        k = 1
                        while nj + k < cols && file_data[ni][nj + k].match?(/[0-9]/)
                            n += file_data[ni][nj + k]
                            processed_cells.add([ni, nj + k])
                            k += 1
                        end

                        sum += n.to_i
                        processed_cells.add([ni, nj])
                    end
                end
            end
        end
    end
end
warn sum
# code here
file.close

file = File.open("input.txt")
file_data = file.read.split("\n")
sum = 0
rows = file_data.length
cols = file_data[0].length
processed_cells = Set.new

file_data.each_with_index do |l, i|
    l.chars.each_with_index do |c, j|
        if c.match(/\*/)
            nn = 0
            pr = 1
            temp_processed_cells = Set.new
            (-1..1).each do |di|
                (-1..1).each do |dj|
                    ni, nj = i + di, j + dj

                    next unless ni.between?(0, rows - 1) && nj.between?(0, cols - 1)
                    next if (ni == i && nj == j) || temp_processed_cells.include?([ni, nj])

                    neighbor = file_data[ni][nj]
                    if neighbor.match?(/[0-9]/)
                        nn += 1
                        n = neighbor

                        k = 1
                        while nj - k >= 0 && file_data[ni][nj - k].match?(/[0-9]/)
                            n = file_data[ni][nj - k] + n
                            temp_processed_cells.add([ni, nj - k])
                            k += 1
                        end

                        k = 1
                        while nj + k < cols && file_data[ni][nj + k].match?(/[0-9]/)
                            n += file_data[ni][nj + k]
                            temp_processed_cells.add([ni, nj + k])
                            k += 1
                        end

                        pr *= n.to_i
                        temp_processed_cells.add([ni, nj])
                    end
                end
            end
            if nn == 2
                sum += pr
                processed_cells.merge(temp_processed_cells)
            end
        end
    end
end
warn sum
file.close