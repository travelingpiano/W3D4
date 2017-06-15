# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results_n_plus_one
    answerchoices = answer_choices
    results = {}
    answerchoices.each do |choice|
      results[choice.text] = choice.responses.length
    end
    results
  end

  def results
    answerchoices = answer_choices
      .select("answer_choices.text,COUNT(responses.*) as counts")
      .left_joins(:responses)
      .group("answer_choices.text")
    results = {}
    answerchoices.each do |choice|
      results[choice.text] = choice.counts
    end
    results
  end

end
