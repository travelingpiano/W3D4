# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :question_id, :answer_choice_id, :user_id, presence: true
  validate :not_duplicate_response
  validate :not_answer_self_poll

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def not_answer_self_poll
    if self.user_id == question.poll.user_id
      errors[:user_id] << "can't answer own poll"
    end
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "can't submit the same response twice"
    end
  end

  def respondent_already_answered?
    return true if sibling_responses.exists?(user_id: self.user_id)
    false
  end

end
