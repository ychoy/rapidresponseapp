json.extract! user, :id, :username, :first_name, :last_name, :prefix, :email, :password_digest, :title, :company, :address, :biography, :profession, :helping, :under_18?, :in_danger?, :in_contact_ICE_24_hours?, :created_at, :updated_at
json.url user_url(user, format: :json)
