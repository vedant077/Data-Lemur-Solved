WITH artist_count as (
SELECT  artist_name,dense_rank() OVER(ORDER BY COUNT(gsr.song_id) DESC) as r
FROM artists a
inner JOIN songs s
ON a.artist_id = s.artist_id
RIGHT JOIN global_song_rank gsr
ON gsr.song_id = s.song_id
WHERE rank <=10
GROUP BY artist_name)
SELECT  artist_name,r
FROM artist_count
WHERE r <=5
