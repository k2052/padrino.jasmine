Padrinojasmine.controllers do
  before do
    halt 403 unless env['REMOTE_ADDR'] == '127.0.0.1'
  end

  get :fixtures, :map => '/jasmine/fixtures(/:filename)' do
    render "jasmine/fixtures/#{params[:filename]}"
  end

  get :spec, :map => '/jasmine(/:filename)' do
    params[:filename] = 'default' unless params[:filename]
    render "jasmine/spec/#{params[:filename]}"
  end
end
