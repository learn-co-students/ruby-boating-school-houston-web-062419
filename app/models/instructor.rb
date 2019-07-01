class Instructor

	attr_reader :name

	@@all = []

	def initialize (name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def find_student_tests (student)
		BoatingTest.all.select {|t| t.student == student}
	end

	def find_test (student, test_name)
		find_student_tests(student).find {|t| t.test_name == test_name}
	end

	def pass_student (student, test_name)
		f = find_test(student, test_name) 
		if f
			f.test_status = "passed"
		else
			BoatingTest.new(student, test_name, "passed", self)
		end
	end

	def fail_student (student, test_name)
		f = find_test(student, test_name) 
		if f
			f.test_status = "failed"
		else
			BoatingTest.new(student, test_name, "failed", self)
		end
	end


end
