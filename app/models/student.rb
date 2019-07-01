class Student

	attr_reader :first_name

	@@all = []

	def initialize (name)
		@first_name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def add_boating_test(test_name, test_status, instructor)
		BoatingTest.new(self, test_name, test_status, instructor)
	end

	def self.find_student (name)
		all.find{|s| s.first_name == name}
	end

	def student_tests
		BoatingTest.all.select{|s| s.student == self}
	end

	def passed
		student_tests.select{|t| t.test_status == "passed"}
	end

	def failed
		student_tests.select{|t| t.test_status == "failed"}
	end

	def grade_percentage
		(passed.size.to_f/student_tests.size.to_f) if student_tests.size > 0
	end

end
