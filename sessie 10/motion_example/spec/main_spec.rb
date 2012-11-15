describe "Application 'motion_example'" do
  before do
    @app = UIApplication.sharedApplication
  end
  
  it "adds numbers"do
    (1  + 2).should == 3
    [1,2,3].size.should == 3
  end
end
