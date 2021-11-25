RSpec.describe "hello spec" do
  describe "math" do
    it "should be able to perform base math" do
      expect(5 * 5).to eq(25)
    end
  end

  describe String do
    let(:string) { String.new}
        it "should be equal to an empty string" do
          expect(string).to eq("")
    end
  end
end
