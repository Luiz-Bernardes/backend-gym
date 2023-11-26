class UserMailer < ApplicationMailer
	def welcome_client
    @user = params[:user]
    @url  = 'http://academixsuite.com.br'
    mail(to: @user.email, subject: 'Cadastro de aluno efetuado com sucesso!')
    # # CALL
    # UserMailer.with(user: @client).welcome_client.deliver_now
  end
end
