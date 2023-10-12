class RecommendationsController < ApplicationController
  before_action :set_consultation_request

  def index
    @recommendations = @consultation_request.recommendations
    render json: @recommendations

  end

  def create
    @recommendation = @consultation_request.recommendations.build(recommendation_params)

    if @recommendation.save
      @patient = @consultation_request.patient
      ConsultationRequestMailer.notification_email(@patient, @recommendation).deliver_later
      render json: @recommendation, status: :created
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_consultation_request
    @consultation_request = ConsultationRequest.all.find(params[:consultation_request_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:text)
  end
end
