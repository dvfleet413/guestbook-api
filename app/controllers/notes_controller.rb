class NotesController < ApplicationController
    before_action :set_note, only: [:show, :update, :destory]

    def index
        @notes = Note.all
        render json: @notes.to_json
    end

    def show
        render json: @note.to_json
    end

    def create
        note = Note.create!(notes_params)
        
        if note.save
            render json: note.to_json
        end
    end

    def update
        @note.update!(notes_params)
        render json: @note.to_json
    end

    def destroy
        @note.destroy
        render json: Note.all.to_json
    end

    private
        def notes_params
            params.require(:note).permit(:author, :location, :content)
        end

        def set_note
            @note = Note.find_by(id: params[:id])
        end

end
