class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to '/contacts', notice: 'Contacts Successfully Uploaded!'
  end

  def create
    @contact = Contact.create(
      contact_id: params[:id],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email_address],
      phone_number: params[:phone_number],
      company_name: params[:company_name]
    )
  end
end
