require 'serverspec'

set :backend, :exec

describe package('zsh') do
  it { should be_installed }
end

describe command('ls /home/mtester/.zfunctions') do
  it { should_not be_file }
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
