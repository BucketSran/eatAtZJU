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

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r007', '紫金港北街·砂锅小馆', '紫金港北街·砂锅小馆', array[]::text[], '紫金港北门', 0.9, 11, '砂锅煲', 31, 4.5, 90, 268, 30.3132, 120.0903, '煲', '#a8663c', array['近', '暖胃', '一人食', '人均40内']::text[], array['晚自习前', '雨天热饭', '单人吃饭']::text[], '砂锅类选择多，热乎、出餐稳定，适合不想走太远的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r008', '西园路·轻食拌饭', '西园路·轻食拌饭', array[]::text[], '西园', 1, 13, '轻食简餐', 27, 4.2, 84, 221, 30.3035, 120.0788, '轻', '#5aa37c', array['不辣', '一人食', '实惠', '人均30内']::text[], array['健身后', '轻负担', '赶时间']::text[], '拌饭和沙拉组合比较轻，适合想吃得清爽但不想只吃草的时候。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r009', '申花·港式烧腊饭', '申花·港式烧腊饭', array[]::text[], '申花', 2.1, 26, '港式简餐', 36, 4.6, 89, 238, 30.3211, 120.1055, '叉', '#c75f3a', array['下饭', '快餐', '一人食', '人均40内']::text[], array['想吃肉', '独自觅食', '周末换口味']::text[], '烧腊饭分量扎实，甜口酱汁比较稳，是周末外出顺手的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r010', '蓝田街·贵州酸汤粉', '蓝田街·贵州酸汤粉', array[]::text[], '蓝田', 1.4, 18, '米粉', 24, 4.4, 87, 302, 30.2998, 120.0852, '粉', '#d1463b', array['辣', '酸爽', '面食', '人均30内']::text[], array['想吃酸辣', '午餐快吃', '一个人']::text[], '酸汤粉开胃，价格友好，适合食堂吃腻后的快速替代。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r011', '紫金里·东北小炒', '紫金里·东北小炒', array[]::text[], '紫金里', 1.6, 20, '东北菜', 44, 4.5, 88, 176, 30.3068, 120.0969, '锅', '#b06a36', array['聚餐', '下饭', '大份', '人均50内']::text[], array['四人聚餐', '想吃大份', '晚饭改善']::text[], '菜量友好，适合多人点菜分摊，人均能压住。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r012', '城西银泰·越南粉铺', '城西银泰·越南粉铺', array[]::text[], '城西银泰', 2.8, 35, '东南亚', 42, 4.6, 86, 149, 30.296, 120.114, '越', '#4d9a8d', array['不辣', '清爽', '面食', '人均50内']::text[], array['周末逛街', '清爽汤粉', '轻聚餐']::text[], '汤粉清爽，商场环境舒服，适合周末顺路吃。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r013', '北门口·重庆小面', '北门口·重庆小面', array[]::text[], '紫金港北门', 0.8, 10, '重庆小面', 19, 4.3, 85, 389, 30.3128, 120.0915, '辣', '#bb3f31', array['辣', '面食', '实惠', '人均30内']::text[], array['赶课午饭', '想吃辣', '预算友好']::text[], '小面便宜直接，辣度醒脑，适合一个人快速解决。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r014', '校内·西式简餐窗口', '校内·西式简餐窗口', array[]::text[], '校内', 0.3, 5, '西式简餐', 26, 4.1, 82, 330, 30.3092, 120.0871, '堡', '#5f7fbd', array['校内', '快餐', '不辣', '人均30内']::text[], array['课间午餐', '懒得出校', '单人吃饭']::text[], '校内可达，选择简单，适合只是想换个窗口。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r015', '古墩路·泰式咖喱饭', '古墩路·泰式咖喱饭', array[]::text[], '古墩路', 2.4, 31, '泰式简餐', 41, 4.7, 90, 205, 30.3021, 120.1038, '泰', '#d9852b', array['咖喱', '微辣', '拍照', '人均50内']::text[], array['周末约饭', '想吃咖喱', '两人小聚']::text[], '咖喱香料感更明显，店面小但氛围适合轻约饭。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r016', '西溪湿地口·手工水饺', '西溪湿地口·手工水饺', array[]::text[], '西溪', 2.6, 33, '饺子面点', 25, 4.4, 87, 157, 30.2889, 120.082, '饺', '#6d9b71', array['不辣', '实惠', '面食', '人均30内']::text[], array['清淡晚饭', '一个人', '预算友好']::text[], '水饺口味朴素，价格稳，适合不想吃油重的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r017', '天目里·烤肉拌饭', '天目里·烤肉拌饭', array[]::text[], '天目里', 3, 38, '韩式简餐', 34, 4.5, 86, 190, 30.2853, 120.1185, '拌', '#8d5a3b', array['下饭', '一人食', '微辣', '人均40内']::text[], array['周末换口味', '独自觅食', '想吃肉']::text[], '酱料和烤肉香气足，比较适合一个人吃得满足。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r018', '紫金港南门·兰州牛肉面', '紫金港南门·兰州牛肉面', array[]::text[], '紫金港南门', 1.2, 16, '牛肉面', 21, 4.3, 86, 355, 30.3006, 120.091, '牛', '#5b82a9', array['面食', '清真友好', '实惠', '人均30内']::text[], array['午餐快吃', '清真友好', '预算友好']::text[], '牛肉面是稳妥选项，出餐快，价格也适合日常。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r019', '三墩·潮汕砂锅粥', '三墩·潮汕砂锅粥', array[]::text[], '三墩', 3.2, 40, '潮汕粥铺', 47, 4.6, 88, 133, 30.3245, 120.0745, '粥', '#c0955f', array['暖胃', '聚餐', '不辣', '人均50内']::text[], array['晚归加餐', '清淡聚餐', '生病恢复']::text[], '砂锅粥适合多人分食，口味清淡但有鲜味。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r020', '文一西路·新疆炒米粉', '文一西路·新疆炒米粉', array[]::text[], '文一西路', 2.7, 34, '新疆米粉', 29, 4.5, 89, 247, 30.2926, 120.0974, '米', '#b83a2e', array['辣', '下饭', '一人食', '人均30内']::text[], array['重口晚饭', '想吃辣', '独自觅食']::text[], '炒米粉酱香重，辣度有存在感，适合想吃点刺激的晚上。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r021', '蒋村·日式拉面屋', '蒋村·日式拉面屋', array[]::text[], '蒋村', 2.2, 28, '日式拉面', 43, 4.7, 91, 184, 30.2978, 120.0736, '拉', '#7b5f4a', array['面食', '暖胃', '一人食', '人均50内']::text[], array['雨天热汤', '一个人', '周末出门']::text[], '拉面汤底浓，座位适合一个人慢慢吃完。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r022', '紫金港东门·麻辣烫', '紫金港东门·麻辣烫', array[]::text[], '紫金港东门', 1, 14, '麻辣烫', 26, 4.2, 83, 448, 30.3069, 120.0981, '麻', '#c2473c', array['辣', '实惠', '快餐', '人均30内']::text[], array['自由搭配', '晚饭快吃', '嘴馋']::text[], '选择自由、价格可控，是不知道吃什么时的高容错解。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r023', '莲花街·烤鱼小桌', '莲花街·烤鱼小桌', array[]::text[], '莲花街', 2.5, 32, '烤鱼', 59, 4.6, 87, 166, 30.2865, 120.0989, '鱼', '#3d7f8f', array['聚餐', '辣', '夜宵', '50+']::text[], array['四人约饭', '夜宵改善', '想吃鱼']::text[], '适合多人分一条鱼，价格比日常饭高一点但氛围好。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r024', '校内·深夜粥面档', '校内·深夜粥面档', array[]::text[], '校内', 0.5, 7, '粥面夜宵', 18, 4.1, 82, 520, 30.3076, 120.0868, '夜', '#4d6078', array['校内', '夜宵', '实惠', '人均30内']::text[], array['晚课后', '夜宵', '轻负担']::text[], '校内夜宵兜底选项，便宜、近、不会太撑。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00701', 'r007', '番茄肥牛砂锅', 32, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00702', 'r007', '菌菇鸡肉煲', 29, 82, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00703', 'r007', '腊味煲仔饭', 28, 78, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00801', 'r008', '鸡胸牛油果拌饭', 29, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00802', 'r008', '照烧鸡腿拌饭', 25, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00803', 'r008', '玉米南瓜汤', 8, 65, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00901', 'r009', '双拼烧腊饭', 38, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00902', 'r009', '叉烧滑蛋饭', 35, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd00903', 'r009', '例汤', 5, 62, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01001', 'r010', '酸汤牛肉粉', 26, 92, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01002', 'r010', '番茄酸汤粉', 20, 80, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01003', 'r010', '炸蛋加料', 5, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01101', 'r011', '锅包肉', 46, 94, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01102', 'r011', '地三鲜', 28, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01103', 'r011', '小鸡炖蘑菇', 58, 89, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01201', 'r012', '火车头牛肉粉', 45, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01202', 'r012', '柠檬鸡翅', 22, 76, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01203', 'r012', '越式春卷', 18, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01301', 'r013', '豌杂小面', 18, 94, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01302', 'r013', '牛肉小面', 24, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01303', 'r013', '煎蛋', 4, 68, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01401', 'r014', '黑椒鸡排饭', 24, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01402', 'r014', '芝士牛肉卷', 22, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01403', 'r014', '土豆泥', 6, 60, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01501', 'r015', '黄咖喱鸡饭', 39, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01502', 'r015', '冬阴功汤', 28, 78, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01503', 'r015', '芒果糯米饭', 22, 82, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01601', 'r016', '猪肉白菜水饺', 22, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01602', 'r016', '虾仁三鲜水饺', 30, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01603', 'r016', '紫菜蛋花汤', 6, 61, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01701', 'r017', '烤五花拌饭', 34, 90, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01702', 'r017', '肥牛泡菜锅', 42, 83, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01703', 'r017', '海苔饭团', 12, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01801', 'r018', '经典牛肉面', 18, 92, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01802', 'r018', '红烧牛肉面', 25, 85, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01803', 'r018', '凉拌土豆丝', 8, 64, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01901', 'r019', '鲜虾砂锅粥', 58, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01902', 'r019', '潮汕卤水拼盘', 42, 80, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd01903', 'r019', '炸粿肉', 26, 76, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02001', 'r020', '鸡肉炒米粉', 28, 94, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02002', 'r020', '牛肉炒米粉', 32, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02003', 'r020', '酸奶', 8, 67, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02101', 'r021', '豚骨叉烧拉面', 45, 94, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02102', 'r021', '味噌玉米拉面', 39, 82, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02103', 'r021', '唐扬鸡块', 24, 75, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02201', 'r022', '自选麻辣烫', 26, 92, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02202', 'r022', '番茄汤底', 1, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02203', 'r022', '麻酱小料', 3, 66, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02301', 'r023', '香辣烤鱼', 128, 92, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02302', 'r023', '豆花烤鱼', 118, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02303', 'r023', '宽粉加菜', 8, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02401', 'r024', '皮蛋瘦肉粥', 12, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02402', 'r024', '青菜肉丝面', 16, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02403', 'r024', '茶叶蛋', 3, 70, array[]::text[], 'published'
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

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00701', 'r007', null, '复习到饿', 5, '热气很足，冬天吃完很舒服。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00702', 'r007', null, '北门十分钟', 4, '价格还行，高峰期略挤。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00801', 'r008', null, '想少油一点', 4, '拌饭比沙拉顶饱，午饭合适。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00802', 'r008', null, '训练完路过', 4, '口味清淡，酱可以少放。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00901', 'r009', null, '肉食爱好者', 5, '叉烧偏甜，米饭够吸汁。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv00902', 'r009', null, '周末出门', 4, '比校内贵一点，但换口味不错。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01001', 'r010', null, '酸辣脑袋', 5, '酸味很开胃，辣度可调。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01002', 'r010', null, '下课冲刺', 4, '出餐快，位置不算宽。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01101', 'r011', null, '东北菜雷达', 5, '锅包肉量不错，酸甜口。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01102', 'r011', null, '寝室聚餐', 4, '四个人点三菜刚好。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01201', 'r012', null, '汤粉爱好者', 5, '汤底清爽，粉量刚好。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01202', 'r012', null, '逛街顺路', 4, '价格商场水平，环境加分。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01301', 'r013', null, '辣椒油爱好者', 5, '豌杂很香，辣度别逞强。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01302', 'r013', null, '十分钟吃完', 4, '便宜快，但饭点排队。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01401', 'r014', null, '早八幸存者', 4, '胜在近，口味稳定。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01402', 'r014', null, '不想出校', 4, '偶尔换换口味可以。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01501', 'r015', null, '咖喱第二人格', 5, '黄咖喱很下饭，甜辣平衡。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01502', 'r015', null, '拍照党', 4, '灯光好看，座位不多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01601', 'r016', null, '清淡派', 4, '饺子皮还可以，汤免费更好。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01602', 'r016', null, '散步路过', 4, '吃完去西溪走走挺舒服。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01701', 'r017', null, '拌饭巡逻员', 4, '烤肉香，酱略甜。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01702', 'r017', null, '一个人也行', 4, '位置舒服，饭量够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01801', 'r018', null, '面食党', 4, '面拉得不错，汤偏清。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01802', 'r018', null, '南门路过', 4, '胜在快和便宜。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01901', 'r019', null, '胃不舒服', 5, '粥很热，分量适合两三人。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv01902', 'r019', null, '夜归人', 4, '不算近，但吃完很舒坦。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02001', 'r020', null, '辣到清醒', 5, '中辣已经够了，米粉很吸酱。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02002', 'r020', null, 'DDL续命', 4, '适合晚上吃，吃完有战斗力。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02101', 'r021', null, '拉面巡礼', 5, '汤底浓，叉烧厚度可以。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02102', 'r021', null, '窗边座位', 4, '一个人吃不尴尬。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02201', 'r022', null, '选择困难', 4, '自己夹菜最省脑子。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02202', 'r022', null, '加班回来', 4, '汤底还行，别夹太多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02301', 'r023', null, '四人桌刚好', 5, '人多分摊比较合适。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02302', 'r023', null, '夜宵局', 4, '香辣口比较下饭。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02401', 'r024', null, '晚课结束', 4, '不用出校就是最大优点。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02402', 'r024', null, '不想吃炸串', 4, '粥很适合收尾。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

commit;
