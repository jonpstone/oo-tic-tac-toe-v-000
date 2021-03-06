require 'spec_helper'
require 'rainbow/color'

module Rainbow
  describe Color do
    describe '.build' do

      subject { described_class.build(ground, values) }

      let(:ground) { :foreground }

      context "when single fixnum given" do
        let(:values) { [1] }

        it { should be_a(Color) }
      end

      context "when single symbol given" do
        let(:values) { [:red] }

        it { should be_a(Color) }
      end

      context "when single string given" do
        let(:values) { ['#dead00'] }

        it { should be_a(Color) }
      end

      context "when 2 elements" do
        let(:values) { [1, 2] }

        it 'raises ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context "when 3 elements given" do
        let(:values) { [1, 2, 3] }

        it { should be_a(Color) }
      end

      context "when 4 elements" do
        let(:values) { [1, 2, 3, 4] }

        it 'raises ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

    end
  end

  describe Color::Indexed do
    let(:color) { described_class.new(ground, 5) }

    describe '#codes' do
      subject { color.codes }

      context "when ground is :foreground" do
        let(:ground) { :foreground }

        it { should eq([35]) }
      end

      context "when ground is :background" do
        let(:ground) { :background }

        it { should eq([45]) }
      end
    end
  end

  describe Color::Named do
    let(:color) { described_class.new(ground, name) }

    describe '#codes' do
      subject { color.codes }

      context "when ground is :foreground" do
        let(:ground) { :foreground }

        context "and name is :black" do
          let(:name) { :black }

          it { should eq([30]) }
        end

        context "and name is :red" do
          let(:name) { :red }

          it { should eq([31]) }
        end

        context "and name is :green" do
          let(:name) { :green }

          it { should eq([32]) }
        end

        context "and name is :yellow" do
          let(:name) { :yellow }

          it { should eq([33]) }
        end

        context "and name is :blue" do
          let(:name) { :blue }

          it { should eq([34]) }
        end

        context "and name is :magenta" do
          let(:name) { :magenta }

          it { should eq([35]) }
        end

        context "and name is :cyan" do
          let(:name) { :cyan }

          it { should eq([36]) }
        end

        context "and name is :white" do
          let(:name) { :white }

          it { should eq([37]) }
        end

        context "and name is invalid" do
          let(:name) { :foo }

          it 'raises ArgumentError' do
            expect { subject }.to raise_error(ArgumentError)
          end
        end
      end

      context "when ground is :background" do
        let(:ground) { :background }

        context "and name is :black" do
          let(:name) { :black }

          it { should eq([40]) }
        end

        context "and name is :red" do
          let(:name) { :red }

          it { should eq([41]) }
        end

        context "and name is :green" do
          let(:name) { :green }

          it { should eq([42]) }
        end

        context "and name is :yellow" do
          let(:name) { :yellow }

          it { should eq([43]) }
        end

        context "and name is :blue" do
          let(:name) { :blue }

          it { should eq([44]) }
        end

        context "and name is :magenta" do
          let(:name) { :magenta }

          it { should eq([45]) }
        end

        context "and name is :cyan" do
          let(:name) { :cyan }

          it { should eq([46]) }
        end

        context "and name is :white" do
          let(:name) { :white }

          it { should eq([47]) }
        end

        context "and name is invalid" do
          let(:name) { :foo }

          it 'raises ArgumentError' do
            expect { subject }.to raise_error(ArgumentError)
          end
        end
      end
    end
  end

  describe Color::RGB do
    let(:color) { described_class.new(ground, r, g, b) }

    describe '#codes' do
      subject { color.codes }

      let(:ground) { :foreground }
      let(:r) { 0 }
      let(:g) { 128 }
      let(:b) { 255 }

      context "when ground is :foreground" do
        let(:ground) { :foreground }

        it { should eq([38, 5, 39]) }
      end

      context "when ground is :background" do
        let(:ground) { :background }

        it { should eq([48, 5, 39]) }
      end

      context "when a component is lower than 0" do
        let(:r) { -1 }

        it 'raises ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context "when a component is greater than 255" do
        let(:b) { 256 }

        it 'raises ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

    end
  end
end
