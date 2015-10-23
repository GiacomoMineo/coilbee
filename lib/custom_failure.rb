class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end

  def respond
    if http_auth?
      http_auth
    else
      flash[:error] = "Invalid login or password"
      redirect
    end
  end
end