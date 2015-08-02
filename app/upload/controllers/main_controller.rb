module Upload
  class MainController < Volt::ModelController
    def index
      @id = ".upload_#{generate_id}"
      page._uploads << {id: id}
      page._updated
    end

    def id
      page._updated
      @id[1..-1]
    end

    private
    def generate_id
      alpha = ('a'..'z').to_a + ('A'..'Z').to_a
      64.times.map { alpha.sample }.join
    end

    def upload
      %x{
        var reader = new FileReader();

        reader.onload = function(e) {
          var dataURL = reader.result;
          $( #{@id} ).data('data-url', dataURL)
          #{ save_upload }
        }


        reader.onprogress = function (event) {
         if (event.lengthComputable) {
             var percentage = Math.round (event.loaded / event.total * 100);
             $(".prog_#{id}").css({width: percentage+'%'})
          }
        }
       
        reader.onloadend = function (event) {
         if (event.lengthComputable) {
             $(".prog_#{id}").css({width: '100%'})
          }
        }
        

        reader.readAsDataURL($( #{@id} )[0].files[0])
      }
    end

    def save_upload
      data = `$( #{@id} ).data('data-url')`
      UploadTasks.upload(data).then {|r| `console.log( #{r} );`}
    end
  end
end
