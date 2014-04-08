require_relative '../singleton.rb'

describe "Singleton" do
  after(:each) {Object.send(:remove_const, :Foo)}

  it "must return the same instance for every .instance call" do
    class Foo; singletonize; end
    instance = Foo.instance
    expect(instance).to equal(Foo.instance)
  end

  it "must not return the same instance for different classes" do
    class Foo; singletonize; end
    class Bar; singletonize; end

    foo_instance = Foo.instance
    bar_instance = Bar.instance
    expect(foo_instance).to_not equal(bar_instance)
  end

  it "must not define .instance on classes that don't call #Singleton" do
    class Foo; end
    expect{Foo.instance}.to raise_error(NoMethodError)
  end

  it ".new must be private" do
    class Foo; singletonize; end
    expect{Foo.new}.to raise_error(NoMethodError)
  end
end
