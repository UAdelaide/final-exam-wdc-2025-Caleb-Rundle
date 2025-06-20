SELECT Dogs.name, Dogs.size, Users.username FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;