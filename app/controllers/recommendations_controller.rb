class RecommendationsController < ApplicationController

  def index
    get_buy_patient
    idc = []
    @consultation_request.each { |rec|

      idc.append(rec.recommendations)

    }
    render json: idc[0]
  end

  def create
    set_consultation_request
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
    @consultation_request = ConsultationRequest.find(params[:consultation_request_id])
  end

  def get_buy_patient
    @patient = Patient.find(params[:patient_id])
    @consultation_request = ConsultationRequest.where(patient_id: @patient.id)
  end

  def recommendation_params
    params.require(:recommendation).permit(:text)
  end
end
