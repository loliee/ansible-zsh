require 'serverspec'

set :backend, :exec

describe file('/home/mtester/.zfunctions/async') do
  it { should be_file }
end

describe file('/home/mtester/.zfunctions/prompt_mlpure_setup') do
  it { should be_file }
end

describe file('/home/mtester/.zfunctions/.zshrc') do
  its(:content) { should contain /# Ansible managed:/ }
  its(:content) { should contain /fpath=("$HOME/.zfunctions" $fpath)/ }
  its(:content) { should contain /autoload -U promptinit && promptinit/ }
  its(:content) { should contain /prompt mlpure/ }
  its(:content) { should contain /alias ll='ls -la'/ }
end
