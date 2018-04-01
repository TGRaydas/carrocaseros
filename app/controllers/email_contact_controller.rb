class EmailContactController < ApplicationController
  def create
    @email = EmailContact.create(email_params)
  end

  def update
    email = EmailContact.find(params[:id])
    email.update_attributes(email_params)
  end

  def email_params
    params.require(:email_contact).permit(:email, :active)
  end
end
