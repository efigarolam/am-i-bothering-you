class CoolDownBroController < ApplicationController
  before_action :find_bully

  def index
    @complaint = Complaint.new(bully: @bully)
  end

  def create
    if @bully.present?
      complaint = Complaint.create(complaint_params)

      if complaint.persisted?
        NotifyBullyMailer.mail(complaint).deliver
      end
    end
  end

  private

  def complaint_params
    params.require(:complaint).permit(:bully_id, :message)
  end

  def find_bully
    @bully = Bully.find_by(username: params[:bully])
  end

end

