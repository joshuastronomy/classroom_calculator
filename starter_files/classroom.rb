# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
grade_hash[student][assignment_num - 1]

# student = grade_hash[student.to_sym]
# array_value = assignment_num - 1
# student[array_value]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

# HOW THE FUCK
def assignment_scores(grade_hash, assignment_num)
  grade_hash.values.transpose[assignment_num - 1]
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_average_score(grade_hash, assignment_num)
  (grade_hash.values.transpose[assignment_num - 1].reduce { |acc, num| acc + num }.to_f / 10).floor
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  grade_hash.transform_values {|nums| nums.reduce(:+)/nums.size}
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
    "A"
  elsif score <= 89 && score >= 80
    "B"
  elsif score <= 79 && score >= 70
    "C"
  elsif score <= 69 && score >= 60
    "D"
  else
    "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  averages(grade_hash).transform_values {|nums| nums = letter_grade(nums)}
end

# Return the average for the entire class.
def class_average(grade_hash)
  averages(grade_hash).values.reduce(:+)/grade_hash.size
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
sorted_hash = averages(grade_hash).sort_by {|name, grade| grade}
sorted_hash.reverse!
top_array = []
sorted_hash.each do |k, v|
  top_array << k
end
top_array.take(number_of_students)
end
