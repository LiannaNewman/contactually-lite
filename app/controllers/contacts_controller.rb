class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def import
    Contact.import(params[:file])
    redirect_to '/contacts', success: 'Contacts Successfully Uploaded!'
  end
end
