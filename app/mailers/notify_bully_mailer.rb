class NotifyBullyMailer < MandrillMailer::TemplateMailer
  default from: 'no-reply@cooldownbro.com'

  def mail(complaint)
    mandrill_mail template: 'notify-bully',
                  subject: 'You are bothering to somebody',
                  to: complaint.bully.email,
                  vars: {
                    'message'  => complaint.message,
                  },
                  inline_css: true
  end

end

