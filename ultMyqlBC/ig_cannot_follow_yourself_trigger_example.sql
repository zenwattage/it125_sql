SHOW tables;


DELIMITER //

CREATE TRIGGER prevent_self_follows
	BEFORE INSERT ON followers FOR EACH ROW
    BEGIN
		IF NEW.follower_id = NEW.followee_id
        THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
    END IF;
    END;
//


INSERT INTO followers(follower_id, followee_id) VALUES(7,7);