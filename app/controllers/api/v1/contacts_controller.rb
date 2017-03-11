module Api
  module V1
    class ContactsController < ApplicationController
      skip_before_filter :verify_authenticity_token

      def index
        @contacts = Contact.all
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

      def destroy
        @contact = Contact.find_by(id: params[:id])
        if @contact.destroy
          render json: {success: 'Contact was successfully deleted!'}
        else
          render json: {danger: 'Something went wrong, please refresh page and try again.'}
        end
      end
    end
  end
end
