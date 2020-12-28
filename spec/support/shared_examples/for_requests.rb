# frozen_string_literal: true

RSpec.shared_examples 'successful endpoint' do
  it_behaves_like 'json header'

  it 'returns 200 http status code' do
    expect(response).to have_http_status(:success)
  end
end

RSpec.shared_examples 'json header' do
  it 'returns content-type: application/json header' do
    expect(response.content_type).to include('application/json')
  end
end

RSpec.shared_examples 'conflict endpoint' do
  it_behaves_like 'json header'

  it 'returns 409 http status code' do
    expect(response).to have_http_status(:conflict)
  end
end

RSpec.shared_examples 'not found endpoint' do
  it_behaves_like 'json header'

  it 'returns 404 http status code' do
    expect(response).to have_http_status(:not_found)
  end
end
