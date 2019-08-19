module ApiHelpers

  def root_api_path
    '/v1'
  end

  def stub_authentication(user)
    Grape::Endpoint.before_each do |endpoint|
      allow(endpoint).to receive(:authenticate!).and_return(true)
      allow(endpoint).to receive(:current_user).and_return(user)
    end
  end

  def helpers_stub_cleanup
    Grape::Endpoint.before_each nil
  end
end