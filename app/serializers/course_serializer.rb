class CourseSerializer < ActiveModel::Serializer
  attributes :name, :credit, :tutors

  def tutors
    object.tutors.map do |tutor|
      {
        first_name: tutor.first_name,
        last_name: tutor.last_name,
        email: tutor.email
      }
    end
  end
end
