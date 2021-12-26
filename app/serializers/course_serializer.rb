class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :credit, :tutors

  def tutors
    object.tutors.map do |tutor|
      {
        id: tutor.id,
        first_name: tutor.first_name,
        last_name: tutor.last_name,
        email: tutor.email
      }
    end
  end
end
