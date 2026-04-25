# frozen_string_literal: true

require 'yaml'

RSpec.describe 'project configuration' do
  let(:root) { File.expand_path('..', __dir__) }

  it 'keeps the minimum supported Ruby version at 3.3.0' do
    gemspec = Gem::Specification.load(File.join(root, 'nth_weekday.gemspec'))

    expect(gemspec.required_ruby_version).to eq(Gem::Requirement.new('>= 3.3.0'))
  end

  it 'verifies compatibility on the minimum Ruby and Ruby 4.0.1 in CI' do
    workflow = YAML.load_file(File.join(root, '.github/workflows/test.yml'))
    ruby_versions = workflow.fetch('jobs').fetch('test').fetch('strategy').fetch('matrix').fetch('ruby-version')

    expect(ruby_versions).to contain_exactly('3.3.0', '4.0.1')
  end
end
