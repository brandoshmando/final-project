class Course < ActiveRecord::Base
  has_many :rosters
  has_many :students, :through => :rosters
  has_many :grades, :through => :students
  belongs_to :professor
  has_and_belongs_to_many :assistants, join_table: 'assistants_courses'
  has_and_belongs_to_many :evals

  def average_score
    score_counter = 0
    self.grades.each do |grade|
      score_counter += grade.final_score.to_f
    end
    (score_counter / self.students.count) / 100
  end
#Method returns an array of scores for every student in said course
  def scores
    buckets = {bot: 0, twenty: 0, thirty: 0, forty: 0, fifty: 0, sixty: 0, seventy: 0, eighty: 0, top: 0 }
    y_axis = []

    scores = self.students.map do |student|
      if student.total_score.nil?
        0
      else
        student.total_score.to_f / self.possible_points.to_f
      end
    end
    puts scores.sort!

    scores.each do |score|
      case score
      when 0.9..1.0
        buckets[:top] += 1
      when 0.8..0.899
        buckets[:eighty] += 1
      when 0.7..0.799
        buckets[:seventy] += 1
      when 0.6..0.699
        buckets[:sixty] += 1
      when 0.5..0.599
        buckets[:fifty] += 1
      when 0.4..0.499
        buckets[:forty] += 1
      when 0.3..0.399
        buckets[:thirty] += 1
      when 0.2..0.299
        buckets[:twenty] += 1
      else
        if score < 0.2
        buckets[:bot] += 1
        end
      end
    end
    buckets.each_value {|val| y_axis.push(val)}
    y_axis
  end

  def x_axis
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
#Method returns total possible points within a course
  def possible_points
    (self.evals.reduce(0) {|sum, eval| sum += eval.max_score.to_i; sum})
  end
end
