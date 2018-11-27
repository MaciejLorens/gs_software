require "application_system_test_case"

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test "visiting the index" do
    visit receipts_url
    assert_selector "h1", text: "Receipts"
  end

  test "creating a Receipt" do
    visit receipts_url
    click_on "New Receipt"

    fill_in "Car Number", with: @receipt.car_number
    fill_in "Company", with: @receipt.company_id
    fill_in "Expiration From", with: @receipt.expiration_from
    fill_in "Expiration To", with: @receipt.expiration_to
    fill_in "Hidden", with: @receipt.hidden
    fill_in "Hidden At", with: @receipt.hidden_at
    fill_in "Number", with: @receipt.number
    fill_in "Product", with: @receipt.product_id
    fill_in "Semitrailer Number", with: @receipt.semitrailer_number
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "updating a Receipt" do
    visit receipts_url
    click_on "Edit", match: :first

    fill_in "Car Number", with: @receipt.car_number
    fill_in "Company", with: @receipt.company_id
    fill_in "Expiration From", with: @receipt.expiration_from
    fill_in "Expiration To", with: @receipt.expiration_to
    fill_in "Hidden", with: @receipt.hidden
    fill_in "Hidden At", with: @receipt.hidden_at
    fill_in "Number", with: @receipt.number
    fill_in "Product", with: @receipt.product_id
    fill_in "Semitrailer Number", with: @receipt.semitrailer_number
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt" do
    visit receipts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt was successfully destroyed"
  end
end
