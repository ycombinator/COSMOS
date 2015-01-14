# encoding: ascii-8bit

# Copyright 2014 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt

require 'spec_helper'
require 'cosmos/processors/processor'

module Cosmos

  describe NewPacketLogProcessor do

    describe "initialize" do
      it "should take a packet log writer name" do
        a = NewPacketLogProcessor.new('MINE')
        a.value_type.should eql :CONVERTED
      end
    end

    describe "call" do
      it "should start logging" do
        log_name = nil
        allow(CmdTlmServer).to receive_message_chain(:instance,:start_logging) do |name|
          log_name = name
        end
        a = NewPacketLogProcessor.new()
        a.call(nil, nil)
        log_name.should eql('ALL')
      end
    end

  end
end
