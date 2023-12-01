file = File.open("example.txt")
file_data = file.read
warn file_data
# code here
file.close

file = File.open("example2.txt")
file_data = file.read
warn file_data
# code here
file.close