class ContactsController < ApplicationController
   
   #GET request to /contact-us
   #Show new contact form
   def new
      @contact = Contact.new
   end
   
   #POST request /contacts
   def create
    #Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    #Save the Contact object to the database
      if @contact.save
        #Store form fields via parameters into variables
          name = params[:contact][:name]
          phone = params[:contact][:phone]
          email = params[:contact][:email]
          body = params[:contact][:message]
        #Plug variables into the contact mailer email method 
        # and send email
          ContactMailer.contact_email(name, phone, email, body).deliver
        #Store success message in flash hash
        # and redirect to the new action
          flash[:success] = "Message sent."
          redirect_to new_contact_path
      else
          #If contact option doesn't save,
          # store errors in flash hash and
          # redirect to the new action
          flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
    private
    #To collect data from form, use 
    # strong parameters and whitelist
    # the form fields
      def contact_params
         params.require(:contact).permit(:name, :email, :phone, :message)
     end
       
end 