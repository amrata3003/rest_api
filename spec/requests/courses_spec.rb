require 'rails_helper'

describe 'Courses API', type: :request do
  describe 'GET /courses' do
    it 'returns all courses along with tutors' do
      FactoryBot.create_list(:course, 2)
      get '/api/v1/courses'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /courses' do
    describe 'create a new course' do
      describe 'valid details' do
        it 'with tutors' do
          params = {
            "course": {
              "name": "course1",
              "credit": "6",
              "tutors_attributes": [
                { "first_name": "Tutor",
                  "last_name": "First",
                  "email": "Tutor1@yopmail.com"
                }
              ]
            }
          }
          expect {
            post '/api/v1/courses', params: params
          }.to change { Course.count }.from(0).to(1)
            .and change { Tutor.count }.from(0).to(1)

          expect(response).to have_http_status(:created)
          expect(response.body).to eq('{"name":"course1","credit":6,"tutors":[{"first_name":"Tutor","last_name":"First","email":"Tutor1@yopmail.com"}]}')
        end

        it 'with tutors' do
          params = {
            "course": {
              "name": "course1",
              "credit": "6"
            }
          }
          expect {
            post '/api/v1/courses', params: params
          }.to change { Course.count }.from(0).to(1)
          
          expect(Tutor.count).to eq(0)
          expect(response).to have_http_status(:created)
          expect(response.body).to eq('{"name":"course1","credit":6,"tutors":[]}')
        end
      end

      it 'invalid details' do
        params = {
          "course": {
            "name": "",
            "credit": "6"
          }
        }
        expect { post '/api/v1/courses', params: params }.to_not change { Course.count }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end