class Complaint < ActiveRecord::Base
  belongs_to :bully

  validate :so_many_complaints

  def so_many_complaints
    if bully.present?
      errors.add(:created_at, 'message') if is_there_an_existing_complaint?
    end
  end

  def is_there_an_existing_complaint?
    complaints = Complaint.where('bully_id = ? AND created_at BETWEEN ? AND ?', bully.id, Time.zone.now - 30.minutes, Time.zone.now)
    complaints.any?
  end

end

