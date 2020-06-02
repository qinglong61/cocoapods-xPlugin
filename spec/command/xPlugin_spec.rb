require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Xplugin do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ xPlugin }).should.be.instance_of Command::Xplugin
      end
    end
  end
end

