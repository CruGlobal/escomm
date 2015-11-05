# class TokensController < ApplicationController
#   def new
#     binding.pry
#     render_error "You must pass in a service ticket ('st' parameter)" and return if params[:st].blank?

#     st = validate_service_ticket(params[:st])
#     render_error 'Invalid service ticket' and return unless st.is_valid?

#     access_token = generate_access_token(st)
#     render json: access_token
#   end

#   protected

#   # Validate Service Ticket
#   def validate_service_ticket(ticket)
#     st = CASClient::ServiceTicket.new(
#       ticket,
#       v1_service_url
#     )
#     RubyCAS::Filter.client.validate_service_ticket(st)
#   end

#   # Generate Access Token
#   def generate_access_token(st)
#     CruLib::AccessToken.new(
#       key_guid: st.extra_attributes['ssoGuid'],
#       email: st.user,
#       first_name: st.extra_attributes['firstName'],
#       last_name: st.extra_attributes['lastName']
#     )
#   end
# end
