file = File.open("input.txt")
file_data = file.read.split("\n").map{_1.scan /\d/}
answer = file_data.map{_1.first + _1.last}.map(&:to_i)
# warn answer
p answer.sum
file.close

file = File.open("input.txt")
file_data = file.read.split("\n").map{ |l|
    first = l.scan(/\d|one|two|three|four|five|six|seven|eight|nine/).map{_1.gsub(/one/, "1").gsub(/two/, "2").gsub(/three/, "3").gsub(/four/, "4").gsub(/five/, "5").gsub(/six/, "6").gsub(/seven/, "7").gsub(/eight/, "8").gsub(/nine/, "9")}
    last = l.reverse.scan(/\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/).map{_1.gsub(/eno/, "1").gsub(/owt/, "2").gsub(/eerht/, "3").gsub(/ruof/, "4").gsub(/evif/, "5").gsub(/xis/, "6").gsub(/neves/, "7").gsub(/thgie/, "8").gsub(/enin/, "9")}

    [first.first, last.first]
}
answer = file_data.map{_1.first + _1.last}.map(&:to_i)
# warn answer
p answer.sum
file.close