require 'spec_helper'

describe 'php' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "php class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('php::params') }
        it { should contain_class('php::install').that_comes_before('php::config') }
        it { should contain_class('php::config') }
        it { should contain_class('php::service').that_subscribes_to('php::config') }

        it { should contain_service('php') }
        it { should contain_package('php').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'php class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('php') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
