class VerificationNotifierMailer < ActionMailer::Base
    default from: 'notifications@doubtfire.com'

    def verification_email
      @tutor = project.main_convenor_user
      @student = project.student

      tutor_email = %("#{@tutor.name}" <#{@tutor.email}>)

      mail(to: tutor_email, subject: 'Student Verification Failed')
    end
  end