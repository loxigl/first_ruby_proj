class ConsultationRequestMailer < ApplicationMailer
  def notification_email(patient, recommendation)
    @patient = patient
    @recommendation = recommendation
    @string = @patient.name + "!\nУ вас новая рекомендация:\n" + @recommendation.text
    mail(to: @patient.email, subject: "Новая рекомендация")
    render status: :ok
  end
end
