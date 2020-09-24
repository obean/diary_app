class Entry
  attr_reader :entry, :title, :creation_date

  def initialize(title, entry, date)
    @title = title
    @entry = entry
    @creation_date = date
  end

end