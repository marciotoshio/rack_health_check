# frozen_string_literal: true
require 'rack/mock'
require_relative '../support/mock_rack_app'

describe RackHealthCheck::Checker do
  let(:app) { MockRackApp.new }
  subject { described_class.new(app) }
  let(:request) { Rack::MockRequest.new(subject) }
  let(:path) { '/health_check' }
  let(:response) do
    request.post(path, input: 'some content')
  end

  before do
    RackHealthCheck.config.strategies = [RackHealthCheck::Strategy::HttpChecker]
  end

  context 'when call the default health check path' do
    it { expect(response.body).to eq('success') }
  end

  context 'when call a custom health check path' do
    let(:path) { '/ping' }
    before { RackHealthCheck.config.path = '/ping' }
    after { RackHealthCheck.config.path = '/health_check' }

    it { expect(response.body).to eq('success') }
  end

  context 'when call another route' do
    let(:path) { '/echo' }

    it { expect(response.body).to eq('some content') }
  end

  context 'when some strategy raise an error' do
    before do
      allow(RackHealthCheck::Strategy::HttpChecker).to receive(:health_check)
        .and_raise('some error')
    end

    it { expect(response.status).to eq(500) }
    it { expect(response.body).to eq('some error') }

    context 'with custom error status e.g. 999' do
      before { RackHealthCheck.config.http_status_for_error = 999 }
      after { RackHealthCheck.config.http_status_for_error = 500 }

      it { expect(response.status).to eq(999) }
    end
  end
end
