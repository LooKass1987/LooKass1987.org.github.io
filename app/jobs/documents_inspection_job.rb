class DocumentsInspectionJob < ApplicationJob

  after_perform do |job|
    # job.class.set(wait_until: Time.now.tomorrow.midnight + 3.hours).perform_later
    job.class.set(wait: 12.hours).perform_later
  end

  def perform(*args)
    Certificate.inspection
    Attestat.inspection
  end

end
