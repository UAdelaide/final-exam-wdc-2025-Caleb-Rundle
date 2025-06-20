SELECT Dogs.name AS 'dog_name', Dogs.size AS 'size', Users.username AS 'owner_username' FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;
