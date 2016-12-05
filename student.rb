class Student
attr_reader :first_name, :last_name, :grade

def initialize(first_name, last_name, grade)
	@first_name = first_name
	@last_name = last_name
	@grade = grade
end

def to_s
	"#{first_name} #{last_name} #{grade}"
end
def senior?
	grade == 12
end

end
def seniors(students)
	senior_students = []
	senior_students = students.select{|s| s.senior?}
end


Sam = Student.new("Sam","Jones", 11)
Kim = Student.new("Kim","Lee", 12)
Tim = Student.new("Tim","Len", 12)


all_students = [Sam, Kim, Tim]

all_students.each do |s|
	puts s
end

seniors(all_students).each{|ss| puts ss}

