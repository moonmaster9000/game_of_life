require_relative "../game"


describe "Conway's Game of life" do
  let(:game) { Game.new grid }

  before do
    game.tick
  end

  describe "cell with fewer than two neighbors" do
    context "cell with no neighbors" do
      let(:grid) do
        [
            [1, 0],
            [0, 0]
        ]
      end

      it "dies" do
        game.grid.should == [
            [0, 0],
            [0, 0]
        ]
      end
    end

    context "cell with 1 neighbor" do
      let(:grid) do
        [
            [1, 1],
            [0, 0]
        ]
      end

      it "dies" do
        game.grid.should == [
            [0, 0],
            [0, 0]
        ]
      end
    end
  end

  describe "cell with two or three live neighbors" do
    context "cell with two live neighbors" do
      let(:grid) do
        [
            [1, 1],
            [1, 0]
        ]
      end

      it "lives" do
        game.grid.should == [
            [1, 1],
            [1, 1]
        ]
      end
    end

    context "cell with three live neighbors" do
      let(:grid) do
        [
            [1, 1, 1],
            [0, 1, 0]
        ]
      end

      it "lives" do
        game.grid.should == [
            [1, 1, 1],
            [1, 1, 1]
        ]
      end
    end
  end

  describe "cell with more than three live neighbors" do
    let(:grid) do
      [
          [0, 1, 0],
          [1, 1, 1],
          [0, 1, 0]
      ]
    end

    it "dies" do
      game.grid.should == [
          [1, 1, 1],
          [1, 0, 1],
          [1, 1, 1],
      ]
    end
  end

  describe "dead cell with exactly three live neighbors" do
    let(:grid) do
      [
          [0, 1, 0],
          [1, 0, 1]
      ]
    end

    it "comes back to life like a zombie" do
      game.grid.should == [
          [0,1,0],
          [0,1,0]
      ]
    end
  end
end
