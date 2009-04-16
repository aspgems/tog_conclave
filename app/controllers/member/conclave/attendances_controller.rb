class Member::Conclave::AttendancesController < Member::BaseController
  
  def index
    @attendances = current_user.attendances
  end
    
  def create
    @event = Event.find(params[:event_id])
    if @event.available_capacity>0
      @event.register(current_user)
      flash[:ok] = I18n.t("tog_conclave.member.registered", :title => @event.title)
    else
      flash[:error] = I18n.t("tog_conclave.member.not_available", :title => @event.title)
    end
    redirect_to(conclave_event_path(@event))
  end
  
  def destroy
    @event = current_user.events.find(params[:event_id])
    @event.unregister(current_user)
    flash[:ok] = I18n.t("tog_conclave.member.unregistered", :title => @event.title)
    redirect_to(conclave_event_path(@event))
  end

end
