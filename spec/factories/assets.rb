include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :asset do |a|
    a.attachment { fixture_file_upload(Rails.root.join('spec/factories/test_images/test.jpg'), 'image/jpg') }
  end
end
