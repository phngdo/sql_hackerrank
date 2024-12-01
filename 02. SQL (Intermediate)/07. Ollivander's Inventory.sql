SELECT wand.id, 
       wand_property.age, 
       wand.coins_needed, 
       wand.power
  FROM Wands AS wand
 INNER JOIN Wands_Property AS wand_property
         ON wand.code = wand_property.code
 WHERE wand_property.is_evil = 0
   AND wand.coins_needed = (SELECT MIN(sub_wand.coins_needed)
                              FROM Wands AS sub_wand
                             INNER JOIN Wands_Property AS sub_wand_property
                                     ON sub_wand.code = sub_wand_property.code
                             WHERE sub_wand_property.age = wand_property.age
                               AND sub_wand.power = wand.power
                           )
 ORDER BY wand.power DESC,
          wand_property.age DESC;
