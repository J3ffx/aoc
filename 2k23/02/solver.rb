file = File.open("example.txt")
max = {"red" => 12, "green" => 13, "blue" => 14}
file_data = file.read.split("\n")
r = file_data.filter{ |l|
    id, draws = l.split(": ")
    draws = draws.split("; ")
    res = true
    draws.each do |draw|
        draw.split(", ").each{
            number, color = _1.split
            # p max[color], number.to_i
            if number.to_i > max[color]
                res = false
            end
        }
    end
    res
}
warn r.map{_1.split(": ").first.split.last.to_i}.sum
file.close

file = File.open("input.txt")
file_data = file.read.split("\n")
r = file_data.map{ |l|
    id, draws = l.split(": ")
    draws = draws.split("; ")
    max = {"red" => 0, "green" => 0, "blue" => 0}
    draws.each do |draw|
        draw.split(", ").each{
            number, color = _1.split
            if number.to_i > max[color]
                max[color] = number.to_i
            end
        }
    end
    max["red"] * max["green"] * max["blue"]
}
warn r.sum
file.close