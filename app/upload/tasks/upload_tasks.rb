class UploadTasks < Volt::Task
  def upload(data)
    store._uploads << {data: data}
    store._uploads.last.id
  end
end