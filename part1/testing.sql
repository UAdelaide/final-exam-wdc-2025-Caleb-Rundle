SELECT Dogs.name AS dog_name, Dogs.size, Users.username FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;