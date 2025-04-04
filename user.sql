--Seleziona gli utenti che hanno postato almeno un video
SELECT `users`.`id`,`users`.`username`, count(`medias`.`type`) AS "posted_video"
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
WHERE `likes`.`date` IS NULL
--Conta il numero di like per ogni post (165 nel caso di query con SELECT + JOIN oppure 175 nel caso di query con sola SELECT)
SELECT `posts`.`id`, `posts`.`title`, COUNT(`likes`.`post_id`) AS "total_likes"
FROM `likes`
RIGHT JOIN `posts`
ON `likes`.`post_id` = `posts`.`id`
GROUP BY `posts`.`id`
--Ordina gli utenti per il numero di media caricati (25) 
SELECT `users`.`id`,`users`.`username`, SUM(`medias`.`id`) AS "total_medias"
FROM `users`
INNER JOIN `posts`
ON `users`.`id` = `posts`.`user_id`
INNER JOIN `media_post`
ON `posts`.`id` = `media_post`.`post_id`
INNER JOIN `medias`
ON `media_post`.`media_id` = `medias`.`id`
GROUP BY `users`.`id`
ORDER BY  SUM(`medias`.`id`) DESC
--Ordina gli utenti per totale di likes ricevuti nei loro posts (25)
 SELECT `users`.`id`, `users`.`username`, COUNT(`likes`.`post_id`) AS "total_like"
FROM `users`
INNER JOIN `likes`
ON `users`.`id` = `likes`.`user_id`
GROUP BY `users`.`id`
ORDER BY  COUNT(`likes`.`post_id`) DESC
