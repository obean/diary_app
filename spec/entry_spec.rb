require 'entry'
describe Entry do

let(:entry) { "this is an entry" }
let(:title) { "this is a title" }
let(:subject) {  Entry.new(title, entry) }

  it "has a title" do
    expect(subject.title).to eq "this is a title"
  end
  
  it "has an entry" do
    expect(subject.entry).to eq "this is an entry"
  end
end