require 'serverspec'

set :backend, :exec

describe package('zsh') do
  it { should be_installed }
end

describe file('/home/mtester/.zfunctions/') do
  it { should be_directory }
end

describe file('/home/mtester/.zfunctions/test') do
  it { should be_file }
  its(:content) { should contain /# Tests functions/ }
end

describe file('/home/mtester/.zfunctions/async') do
  it { should be_file }
end

describe file('/home/mtester/.zfunctions/prompt_mlpure_setup') do
  it { should be_file }
end

describe file('/home/mtester/.zshrc') do
  its(:content) { should contain /# Ansible managed:/ }
  its(:content) { should contain /autoload -U promptinit && promptinit/ }
  its(:content) { should contain /prompt mlpure/ }
  its(:content) { should contain /alias ll='ls -la'/ }
end

describe user('mtester') do
  it { should have_login_shell '/bin/zsh' }
end
