class Item < ActiveRecord::Base

  attr_accessible :description, :due_date, :status, :user_id
  validates :description,  length: {minimum: 5, maximum: 60}
  validate :due_date_cannot_be_in_the_past
  belongs_to :user

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "is required") if due_date.blank?
    errors.add(:due_date, "can't be in the past") if !due_date.blank? and due_date < Date.today
  end


end
