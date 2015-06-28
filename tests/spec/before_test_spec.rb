require 'serverspec'

set :backend, :exec

describe package('zsh') do
  it { should_not be_installed }
end

describe file('/home/mtester/.zfunctions/') do
  it { should_not be_directory }
end

describe file('/home/mtester/.zfunctions/prompt_mlpure_setup') do
  it { should_not be_file }
end

describe file('/home/mtester/.zfunctions/async') do
  it { should_not be_file }
end

describe file('/home/mtester/.zfunctions/prompt_mlpure_setup') do
  it { should_not be_file }
end

describe user('mtester') do
  it { should have_home_directory '/home/mtester' }
end

describe user('mtester') do
  it { should have_login_shell '/bin/bash' }
end
