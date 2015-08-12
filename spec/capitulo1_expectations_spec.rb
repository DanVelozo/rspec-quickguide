# page 33 - rspec quickguide (howto)

require 'rails_helper'

# eq, eql, equal, ==, ===
hello = 'hello rspec'

hello.should == 'hello rspec'
expect(hello).to eql(hello)
expect(hello).to equal(hello)

expect(hello).to_no equal('hello rspec')

object = Object.new
object.should === object
object.should_not === Object.new

# exist

expect(Pathname.new(_FILE_)).to exist
expect(File).to exist(_FILE_)

expect(Pathname.new('invalid file')).not_to exist

# include

expect([1, 2, 3]).to include(1)
expect([1, 2, 3]).to include(1, 3)

expect(1..3).to include(1)
expect(1.3).to include(1, 2, 3)

expect('hello rspec').to include('lo rs')

expect([1, 2, 3]).not_to include(4)
expect('hello rspec').not_to include('hi')
