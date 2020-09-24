feature "viewing entries" do
  scenario "viewing basic entry" do
    visit"/"
    first('.item').click_on("Read Entry")
    expect(page).to have_content "title"
    expect(page).to have_content "entry"
  end
end