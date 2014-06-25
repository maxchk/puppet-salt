# spec/classes/repo_spec.rb

require 'spec_helper'

describe "salt::repo" do

  context 'with os = Centos' do
    let(:facts) { {:operatingsystem => 'Centos', :osfamily => 'Redhat'} }
    it { should contain_class('salt::repo::rpm')}
  end
  context 'with os = Redhat' do
    let(:facts) { {:operatingsystem => 'Redhat', :osfamily => 'Redhat'} }
    it { should contain_class('salt::repo::rpm')}
  end
  context 'with os = Ubuntu saucy' do
    let(:facts) { {:operatingsystem => 'Ubuntu', :osfamily => 'Debian', :lsbdistid => 'Ubuntu', :lsbdistcodename => 'saucy'} }
    it { should contain_class('salt::repo::deb')}
  end
  context 'with os = Debian squeeze' do
    let(:facts) { {:operatingsystem => 'Debian', :osfamily => 'Debian', :lsbdistid => 'Debian', :lsbdistcodename => 'squeeze'} }
    it { should contain_class('salt::repo::deb')}
  end
end

describe "salt::repo::deb" do
  context 'with os = Ubuntu saucy' do
    let(:facts) { {:operatingsystem => 'Ubuntu', :osfamily => 'Debian', :lsbdistid => 'Ubuntu', :lsbdistcodename => 'saucy'} }
      it { should create_class('salt::repo::deb')}
    end
  context 'with os = Debian squeeze' do
    let(:facts) { {:operatingsystem => 'Debian', :osfamily => 'Debian', :lsbdistid => 'Debian', :lsbdistcodename => 'squeeze'} }
    it { should create_class('salt::repo::deb')}
  end
end
