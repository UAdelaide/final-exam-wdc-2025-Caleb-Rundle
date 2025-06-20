SELECT Dogs.name AS 'dog_name', Dogs.size AS 'size', Users.username AS 'owner_username' FROM Dogs
INNER JOIN Users ON Dogs.owner_id=Users.user_id;

SELECT WalkRequests.request_id AS request_id, Dogs.name AS dog_name, WalkRequests.requested_time as re