module ExceptionsToStatusCodesConcern
  NotAuthorised = Class.new(StandardError)

  def self.included(base)
    base.rescue_from ExceptionsToStatusCodesConcern::NotAuthorised do |exception|
      respond_to do |format|
        format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
        format.html do
          flash[:error] = "You are not Authorized to access this page"
          redirect_to root_path
        end
        format.any  { head status }
      end
    end
  end

  private

  def not_authorised
    raise ExceptionsToStatusCodesConcern::NotAuthorised
  end
end
