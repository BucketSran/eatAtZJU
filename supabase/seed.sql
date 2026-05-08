-- Generated from seed/*.json by scripts/generate-supabase-seed.cjs.
-- Re-run `npm run seed:sql:write` after editing seed JSON.
begin;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r001', '青芝坞·小院川味', '青芝坞·小院川味', array[]::text[], '青芝坞', 1.8, 22, '川湘菜', 46, 4.7, 96, 328, 30.2749, 120.1238, '辣', '#d95f35', array['辣', '聚餐', '下饭', '人均50内']::text[], array['晚餐聚餐', '想吃辣', '三五好友']::text[], '学生评价集中在“锅气足、分量稳、晚饭不踩雷”，适合约饭和改善伙食。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r002', '港湾家常菜', '港湾家常菜', array[]::text[], '紫金港北门', 0.7, 9, '家常菜', 28, 4.5, 91, 412, 30.3124, 120.0921, '饭', '#f0aa38', array['近', '实惠', '快餐', '人均30内']::text[], array['下课即吃', '预算友好', '单人吃饭']::text[], '距离近、出餐快，是“今天不想思考”的安全牌。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r003', '留学生食堂风味档', '留学生食堂风味档', array[]::text[], '校内', 0.4, 6, '融合简餐', 24, 4.4, 88, 285, 30.3088, 120.0865, '校', '#4f8b65', array['校内', '实惠', '清真友好', '人均30内']::text[], array['课间午餐', '多人拼桌', '轻负担']::text[], '校内可达，价格友好，风味档选择比普通窗口更有记忆点。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r004', '龙湖天街·一碗热汤面', '龙湖天街·一碗热汤面', array[]::text[], '西溪天街', 2.3, 29, '面馆', 33, 4.6, 89, 194, 30.2965, 120.1012, '面', '#6d8fbd', array['面食', '暖胃', '一人食', '人均40内']::text[], array['雨天热汤', '独自觅食', '轻聚餐']::text[], '汤头清爽、座位舒服，适合一个人慢慢吃完再回去写作业。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r005', '西园夜市·炸串铺', '西园夜市·炸串铺', array[]::text[], '西园', 1.1, 15, '小吃夜宵', 22, 4.3, 86, 506, 30.3029, 120.0774, '串', '#b85834', array['夜宵', '小吃', '实惠', '快乐碳水']::text[], array['夜跑后', '组队加餐', '嘴馋']::text[], '打卡量很高，学生评价的关键词是“热闹、便宜、快乐”。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r006', '慢吞吞咖喱屋', '慢吞吞咖喱屋', array[]::text[], '申花', 2, 25, '日式简餐', 39, 4.8, 94, 236, 30.3204, 120.1042, '咖', '#8c6338', array['不辣', '一人食', '拍照', '人均50内']::text[], array['独处放空', '不想吃辣', '拍照打卡']::text[], '环境安静、咖喱浓郁，适合想暂时逃离食堂宇宙的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
  rating = excluded.rating,
  student_score = excluded.student_score,
  checkins = excluded.checkins,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  cover_icon = excluded.cover_icon,
  cover_color = excluded.cover_color,
  tags = excluded.tags,
  suited_for = excluded.suited_for,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00101', 'r001', '招牌小炒黄牛肉', 48, 98, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00102', 'r001', '酸辣鸡杂', 36, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00103', 'r001', '砂锅米饭', 5, 76, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00201', 'r002', '番茄牛腩饭', 26, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00202', 'r002', '青椒肉丝盖饭', 18, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00203', 'r002', '小碗汤', 4, 62, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00301', 'r003', '咖喱鸡饭', 18, 89, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00302', 'r003', '孜然牛肉拌面', 22, 83, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00303', 'r003', '酸奶碗', 12, 71, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00401', 'r004', '番茄肥牛面', 35, 92, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00402', 'r004', '雪菜笋丝面', 24, 73, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00403', 'r004', '卤蛋', 4, 66, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00501', 'r005', '炸鸡柳', 12, 94, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00502', 'r005', '年糕串', 4, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00503', 'r005', '掌中宝', 16, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00601', 'r006', '炸猪排咖喱饭', 42, 96, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00602', 'r006', '溏心蛋牛肉咖喱', 38, 87, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00603', 'r006', '柚子苏打', 16, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00101', 'r001', null, '紫金港饭搭子', 5, '辣度可以备注，米饭很香，四个人点三个菜刚刚好。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00102', 'r001', null, '赶DDL的研一', 4, '高峰要等位，但翻台快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00201', 'r002', null, '十分钟吃完', 5, '性价比稳定，适合赶课。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00202', 'r002', null, '不吃香菜', 4, '口味偏家常，重口党可能觉得淡。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00301', 'r003', null, '玉泉路过', 4, '比想象中丰富，咖喱饭很稳。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00302', 'r003', null, '早八幸存者', 4, '中午排队略长，建议错峰。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00401', 'r004', null, '爱喝汤', 5, '番茄汤底很舒服，冬天尤其加分。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00402', 'r004', null, '小份就够', 4, '商场价，但环境比路边店好。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00501', 'r005', null, '今晚不减脂', 5, '快乐是真的，罪恶感也是真的。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00502', 'r005', null, '夜宵观察员', 4, '建议两三个人拼，不然容易点多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00601', 'r006', null, '咖喱信徒', 5, '猪排脆，咖喱很厚，适合慢慢吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00602', 'r006', null, '论文卡住了', 5, '一个人坐窗边挺治愈。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

commit;
