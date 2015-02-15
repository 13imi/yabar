module API
  module Ver1
    class Tasks < Grape::API

      resource :tasks do
        # POST /api/v1/tasks
        desc "Create a tasks."
        params do
          requires :name, type: String, desc: "Task name"
          requires :deadline, type: Date, desc: "Task deadline."
          requires :yabasa, type: Integer, desc: "Task yabasa."
          requires :user_id, type: Integer, desc: "Task user id."
          optional :memo, type: String, desc: "Task memo."
        end
        post do
          Task.create({
                        user_id: params[:user_id],
                        name: params[:name],
                        deadline: params[:deadline],
                        yabasa: params[:yabasa],
                        memo: params[:memo],
                      })
        end

        # GET /api/v1/tasks
        desc 'Return all tasks.'
        params do
          requires :start_day, type: Date, desc: 'Start Day'
          requires :end_day, type: Date, desc: 'End day'
          requires :user_id, type: Integer, desc: "User id."
        end
        get do
          User.find(params[:user_id]).tasks.day_after(params[:start_day]).day_before(params[:end_day])
        end

        # GET /api/v1/tasks/{:id}
        desc 'Return a task.'
        params do
          requires :id, type: Integer, desc: 'Task id.'
        end
        get ':id' do
          present!(params[:id])
          Task.find(params[:id])
        end

        # POST /api/v1/tasks/{:id}
        desc "Update a tasks."
        params do
          requires :id, type: Integer, desc: "Task ID."
          requires :user_id, type: Integer, desc: "Task user id."
          optional :name, type: String, desc: "Task name."
          optional :deadline, type: Date, desc: "Task deadline."
          optional :yabasa, type: Integer, desc: "Task yabasa."
          optional :memo, type: String, desc: "Task memo."
        end
        put ':id' do
          present!(params[:id])
          User.find(params[:user_id]).tasks.find(params[:id]).update({
                                                                       name: params[:name],
                                                                       deadline: params[:deadline],
                                                                       yabasa: params[:yabasa],
                                                                       memo: params[:memo]
                                                                     })
        end

        # DELETE /api/v1/tasks/{:id}
        desc "Delete a tasks."
        params do
          requires :id, type: Integer, desc: "Tasks ID."
        end
        delete ':id' do
          present!(params[:id])
          Task.find(params[:id]).destroy
        end
      end
    end
  end
end
