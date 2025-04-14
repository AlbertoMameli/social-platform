--Seleziona gli utenti che hanno postato almeno un video
SELECT `users`.`id`,`users`.`username`, COUNT(`medias`.`type`) AS `posted_video`
FROM `users`
INNER JOIN `medias`
ON `users`.`id` = `medias`.`user_id`
WHERE `medias`.`type` = "video"
GROUP BY `users`.`id`;
--Seleziona tutti i post senza Like (13)
SELECT `posts`.`id`,`posts`.`title`
FROM `posts`
LEFT JOIN `likes`
ON `posts`.`id` = `likes`.`post_id`
WHERE `likes`.`post_id` IS NULL;
--Conta il numero di like per ogni post (165 nel caso di query con SELECT + JOIN oppure 175 nel caso di query con sola SELECT)
SELECT `posts`.`id`, `posts`.`title`, COUNT(`likes`.`post_id`) AS `total_likes`
FROM `likes`
RIGHT JOIN `posts`
ON `likes`.`post_id` = `posts`.`id`
GROUP BY `posts`.`id`;
--Ordina gli utenti per il numero di media caricati (25) 
SELECT  `users`.`id`, `users`.`username`, COUNT(`medias`.`id`) AS `total_medias`
FROM `users`
INNER JOIN `medias`
ON `medias`.`user_id` = `users`.`id`
GROUP BY `medias`.`user_id`
ORDER BY `total_medias` DESC;
--Ordina gli utenti per totale di likes ricevuti nei loro posts (25)
SELECT `users`.`id`, `users`.`username`, COUNT(`likes`.`post_id`) AS `total_like_received`
FROM `users`
INNER JOIN `likes`
ON `users`.`id` = `likes`.`user_id`
GROUP BY `users`.`id`
ORDER BY  `total_like_received` DESC;
