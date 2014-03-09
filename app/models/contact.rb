class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  # attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. 
  def headers
    {
      :subject => "A new Contact",
      :to      => "adam0964@gmail.com",
      :from    => %("#{name}" <#{email}>)
    }
  end
end
