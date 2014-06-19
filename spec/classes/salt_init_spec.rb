require 'spec_helper'

describe "salt" do
  it do 
    should contain_class('salt')
  end
# Minion config
  context 'with minion_master => undef' do
    it do
      should contain_class('salt::minion')
      should contain_class('salt::minion::install')
      should contain_file('minion-conf').with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
      should contain_file('minion-conf')\
      .with_content(/^#master: salt/) 
    end
  end
  context 'with minion_master => host.example.com' do
    let(:params) {{:minion_master => 'host.example.com'}}
    it do
      should contain_file('minion-conf')\
      .with_content(/^master: host.example.com/) 
    end
  end


# Master config
  context 'with master => true' do
    let(:params) {{:master => true}}
    it do
      should contain_file('master-conf').with({
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'path'    => '/etc/salt/master',
      })
      should contain_service('salt-master').with({
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end
  context 'with master => true, master_interface => 127.0.0.1' do
    let(:params) {{:master => true, :master_interface => '127.0.0.1'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^interface: 127.0.0.1/)
    end
  end
  context 'with master => true, master_publish_port => 9901' do
    let(:params) {{:master => true, :master_publish_port => 9901}}
    it do
      should contain_file('master-conf')\
      .with_content(/^publish_port: 9901/)
    end
  end
  context 'with master => true, master_user => salt' do
    let(:params) {{:master => true, :master_user => 'salt'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^user: salt/)
    end
  end
  context 'with master => true, master_max_open_files => 56789' do
    let(:params) {{:master => true, :master_max_open_files => 56789}}
    it do
      should contain_file('master-conf')\
      .with_content(/^max_open_files: 56789/)
    end
  end
  context 'with master => true, master_worker_threads => 99' do
    let(:params) {{:master => true, :master_worker_threads => 99}}
    it do
      should contain_file('master-conf')\
      .with_content(/^worker_threads: 99/)
    end
  end
  context 'with master => true, master_ret_port => 4499' do
    let(:params) {{:master => true, :master_ret_port => 4499}}
    it do
      should contain_file('master-conf')\
      .with_content(/^ret_port: 4499/)
    end
  end
  context 'with master => true, master_pidfile => /var/run/saltypid' do
    let(:params) {{:master => true, :master_pidfile => '/var/run/saltypid'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^pidfile: \/var\/run\/saltypid/)
    end
  end
  context 'with master => true, master_root_dir => /var/salt' do
    let(:params) {{:master => true, :master_root_dir => '/var/salt'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^root_dir: \/var\/salt/)
    end
  end
  context 'with master => true, master_pki_dir => /var/salt/pki' do
    let(:params) {{:master => true, :master_pki_dir => '/var/salt/pki'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^pki_dir: \/var\/salt\/pki/)
    end
  end
  context 'with master => true, master_cachedir => /var/salt/cache' do
    let(:params) {{:master => true, :master_cachedir => '/var/salt/cache'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^cachedir: \/var\/salt\/cache/)
    end
  end
  context 'with master => true, master_keep_jobs => 37' do
    let(:params) {{:master => true, :master_keep_jobs => 37}}
    it do
      should contain_file('master-conf')\
      .with_content(/^keep_jobs: 37/)
    end
  end
  context 'with master => true, master_sock_dir => /tmp' do
    let(:params) {{:master => true, :master_sock_dir => '/tmp'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^sock_dir: \/tmp/)
    end
  end
  context 'with master => true, master_job_cache => false' do
    let(:params) {{:master => true, :master_job_cache => 'false'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^job_cache: false/)
    end
  end
  context 'with master => true, master_minion_data_cache => false' do
    let(:params) {{:master => true, :master_minion_data_cache => 'false'}}
    it do
      should contain_file('master-conf')\
      .with_content(/^minion_data_cache: false/)
    end
  end
end
