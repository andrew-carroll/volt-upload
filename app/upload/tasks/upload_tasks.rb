class UploadTasks < Volt::TaskHandler
  def upload(data)
    store._uploads << {data: data}
    store._uploads.last._id
  end
end