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

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, reason, source_refs, status
) values (
  'r025', '紫金港北门·川湘小炒一号店', '紫金港北门·川湘小炒一号店', array[]::text[], '紫金港北门', 0.8, 10, '川湘小炒', 40, 4.2, 88, 125, 30.313, 120.0882, '辣', '#c84b35', array['辣', '下饭', '聚餐', '人均50内']::text[], array['晚饭改善', '想吃辣', '三五好友']::text[], '锅气足、味道直接，适合想把米饭认真吃完的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r026', '紫金港南门·家常盖饭小馆', '紫金港南门·家常盖饭小馆', array[]::text[], '紫金港南门', 1.3, 18, '家常盖饭', 23, 4.3, 89, 162, 30.2998, 120.0874, '饭', '#e0a23a', array['实惠', '快餐', '一人食', '人均30内']::text[], array['赶课午餐', '预算友好', '单人吃饭']::text[], '出餐快、价格稳，是日常不知道吃什么时的安全牌。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r027', '校内·面馆粉铺饭铺', '校内·面馆粉铺饭铺', array[]::text[], '校内', 0.3, 4, '面馆粉铺', 27, 4.3, 90, 199, 30.3094, 120.0872, '面', '#6688bd', array['面食', '暖胃', '一人食', '人均30内']::text[], array['雨天热汤', '一个人', '快速解决']::text[], '热汤和碳水都到位，适合课间或晚自习前快速补能。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r028', '西园·夜宵小吃食堂外档', '西园·夜宵小吃食堂外档', array[]::text[], '西园', 1.1, 15, '夜宵小吃', 23, 4.4, 91, 236, 30.307, 120.0733, '夜', '#5c6078', array['夜宵', '小吃', '实惠', '人均30内']::text[], array['晚课后', '嘴馋', '组队加餐']::text[], '便宜、热闹、快乐，适合晚上给自己一点小奖励。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r029', '青芝坞·轻食简餐街角店', '青芝坞·轻食简餐街角店', array[]::text[], '青芝坞', 1.9, 24, '轻食简餐', 31, 4.5, 92, 273, 30.2782, 120.1263, '轻', '#5aa37c', array['不辣', '一人食', '轻负担', '人均30内']::text[], array['健身后', '清爽午餐', '不想太油']::text[], '口味清爽，饱腹感比沙拉强，适合想吃轻一点的时候。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r030', '申花·日韩简餐小桌', '申花·日韩简餐小桌', array[]::text[], '申花', 1.9, 23, '日韩简餐', 36, 4.6, 93, 310, 30.319, 120.1038, '拌', '#8d5a3b', array['一人食', '下饭', '拍照', '人均50内']::text[], array['周末换口味', '独自觅食', '两人小聚']::text[], '酱汁和主食都比较稳，店面氛围适合慢慢吃。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r031', '蒋村·清真友好便当社', '蒋村·清真友好便当社', array[]::text[], '蒋村', 2.2, 28, '清真友好', 23, 4.7, 94, 347, 30.3004, 120.0692, '牛', '#4f8b65', array['清真友好', '面食', '实惠', '人均30内']::text[], array['清真友好', '午餐快吃', '预算友好']::text[], '选择稳定、价格友好，适合日常快速解决。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r032', '文一西路·聚餐烤鱼热饭局', '文一西路·聚餐烤鱼热饭局', array[]::text[], '文一西路', 2.8, 36, '聚餐烤鱼', 58, 4.1, 95, 384, 30.2936, 120.095, '鱼', '#3d7f8f', array['聚餐', '辣', '夜宵', '50+']::text[], array['多人约饭', '夜宵改善', '想吃鱼']::text[], '更适合多人分食，氛围感比日常快餐强。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r033', '城西银泰·粥面暖胃风味档', '城西银泰·粥面暖胃风味档', array[]::text[], '城西银泰', 2.7, 33, '粥面暖胃', 20, 4.2, 96, 421, 30.2968, 120.1128, '粥', '#c0955f', array['暖胃', '不辣', '实惠', '人均30内']::text[], array['晚课后', '胃口一般', '轻负担']::text[], '清淡、近、负担小，适合不想吃太重的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r034', '三墩·咖啡甜点深夜档', '三墩·咖啡甜点深夜档', array[]::text[], '三墩', 3.2, 40, '咖啡甜点', 38, 4.3, 80, 458, 30.3227, 120.0745, '咖', '#8c6338', array['拍照', '不辣', '一人食', '人均50内']::text[], array['下午自习', '独处放空', '轻约会']::text[], '适合坐一会儿，把吃饭和自习之间的缝隙填满。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r035', '紫金港北门·东南亚风味一号店', '紫金港北门·东南亚风味一号店', array[]::text[], '紫金港北门', 0.9, 12, '东南亚风味', 41, 4.3, 81, 495, 30.3121, 120.0881, '越', '#4d9a8d', array['不辣', '清爽', '面食', '人均50内']::text[], array['周末换口味', '清爽汤粉', '轻聚餐']::text[], '汤粉清爽，香料感轻，适合吃腻重口后的换口味。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r036', '紫金港南门·东北大份菜小馆', '紫金港南门·东北大份菜小馆', array[]::text[], '紫金港南门', 1.1, 14, '东北大份菜', 44, 4.4, 82, 532, 30.3053, 120.0934, '锅', '#b06a36', array['聚餐', '下饭', '大份', '人均50内']::text[], array['寝室聚餐', '大份下饭', '晚饭改善']::text[], '菜量友好，人多分摊很合适，适合寝室饭局。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r037', '校内·川湘小炒饭铺', '校内·川湘小炒饭铺', array[]::text[], '校内', 0.4, 6, '川湘小炒', 42, 4.5, 83, 569, 30.3067, 120.0836, '辣', '#c84b35', array['辣', '下饭', '聚餐', '人均50内']::text[], array['晚饭改善', '想吃辣', '三五好友']::text[], '锅气足、味道直接，适合想把米饭认真吃完的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r038', '西园·家常盖饭食堂外档', '西园·家常盖饭食堂外档', array[]::text[], '西园', 1.2, 17, '家常盖饭', 25, 4.6, 84, 146, 30.3008, 120.0737, '饭', '#e0a23a', array['实惠', '快餐', '一人食', '人均30内']::text[], array['赶课午餐', '预算友好', '单人吃饭']::text[], '出餐快、价格稳，是日常不知道吃什么时的安全牌。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r039', '青芝坞·面馆粉铺街角店', '青芝坞·面馆粉铺街角店', array[]::text[], '青芝坞', 1.7, 20, '面馆粉铺', 29, 4.7, 85, 183, 30.277, 120.1193, '面', '#6688bd', array['面食', '暖胃', '一人食', '人均30内']::text[], array['雨天热汤', '一个人', '快速解决']::text[], '热汤和碳水都到位，适合课间或晚自习前快速补能。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r040', '申花·夜宵小吃小桌', '申花·夜宵小吃小桌', array[]::text[], '申花', 2, 25, '夜宵小吃', 20, 4.1, 86, 220, 30.32, 120.1022, '夜', '#5c6078', array['夜宵', '小吃', '实惠', '人均30内']::text[], array['晚课后', '嘴馋', '组队加餐']::text[], '便宜、热闹、快乐，适合晚上给自己一点小奖励。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r041', '蒋村·轻食简餐便当社', '蒋村·轻食简餐便当社', array[]::text[], '蒋村', 2.3, 30, '轻食简餐', 28, 4.2, 87, 257, 30.2961, 120.0752, '轻', '#5aa37c', array['不辣', '一人食', '轻负担', '人均30内']::text[], array['健身后', '清爽午餐', '不想太油']::text[], '口味清爽，饱腹感比沙拉强，适合想吃轻一点的时候。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r042', '文一西路·日韩简餐热饭局', '文一西路·日韩简餐热饭局', array[]::text[], '文一西路', 2.6, 32, '日韩简餐', 38, 4.3, 88, 294, 30.2893, 120.0921, '拌', '#8d5a3b', array['一人食', '下饭', '拍照', '人均50内']::text[], array['周末换口味', '独自觅食', '两人小聚']::text[], '酱汁和主食都比较稳，店面氛围适合慢慢吃。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r043', '城西银泰·清真友好风味档', '城西银泰·清真友好风味档', array[]::text[], '城西银泰', 2.8, 35, '清真友好', 25, 4.3, 89, 331, 30.2957, 120.1184, '牛', '#4f8b65', array['清真友好', '面食', '实惠', '人均30内']::text[], array['清真友好', '午餐快吃', '预算友好']::text[], '选择稳定、价格友好，适合日常快速解决。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r044', '三墩·聚餐烤鱼深夜档', '三墩·聚餐烤鱼深夜档', array[]::text[], '三墩', 3.3, 42, '聚餐烤鱼', 60, 4.4, 90, 368, 30.3209, 120.0773, '鱼', '#3d7f8f', array['聚餐', '辣', '夜宵', '50+']::text[], array['多人约饭', '夜宵改善', '想吃鱼']::text[], '更适合多人分食，氛围感比日常快餐强。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r045', '紫金港北门·粥面暖胃一号店', '紫金港北门·粥面暖胃一号店', array[]::text[], '紫金港北门', 0.7, 8, '粥面暖胃', 17, 4.5, 91, 405, 30.3133, 120.0875, '粥', '#c0955f', array['暖胃', '不辣', '实惠', '人均30内']::text[], array['晚课后', '胃口一般', '轻负担']::text[], '清淡、近、负担小，适合不想吃太重的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r046', '紫金港南门·咖啡甜点小馆', '紫金港南门·咖啡甜点小馆', array[]::text[], '紫金港南门', 1.2, 16, '咖啡甜点', 35, 4.6, 92, 442, 30.297, 120.0884, '咖', '#8c6338', array['拍照', '不辣', '一人食', '人均50内']::text[], array['下午自习', '独处放空', '轻约会']::text[], '适合坐一会儿，把吃饭和自习之间的缝隙填满。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r047', '校内·东南亚风味饭铺', '校内·东南亚风味饭铺', array[]::text[], '校内', 0.5, 8, '东南亚风味', 43, 4.7, 93, 479, 30.31, 120.0821, '越', '#4d9a8d', array['不辣', '清爽', '面食', '人均50内']::text[], array['周末换口味', '清爽汤粉', '轻聚餐']::text[], '汤粉清爽，香料感轻，适合吃腻重口后的换口味。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r048', '西园·东北大份菜食堂外档', '西园·东北大份菜食堂外档', array[]::text[], '西园', 1, 13, '东北大份菜', 46, 4.1, 94, 516, 30.2983, 120.0758, '锅', '#b06a36', array['聚餐', '下饭', '大份', '人均50内']::text[], array['寝室聚餐', '大份下饭', '晚饭改善']::text[], '菜量友好，人多分摊很合适，适合寝室饭局。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r049', '青芝坞·川湘小炒街角店', '青芝坞·川湘小炒街角店', array[]::text[], '青芝坞', 1.8, 22, '川湘小炒', 44, 4.2, 95, 553, 30.2758, 120.1242, '辣', '#c84b35', array['辣', '下饭', '聚餐', '人均50内']::text[], array['晚饭改善', '想吃辣', '三五好友']::text[], '锅气足、味道直接，适合想把米饭认真吃完的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r050', '申花·家常盖饭小桌', '申花·家常盖饭小桌', array[]::text[], '申花', 2.1, 27, '家常盖饭', 22, 4.3, 96, 130, 30.3168, 120.1091, '饭', '#e0a23a', array['实惠', '快餐', '一人食', '人均30内']::text[], array['赶课午餐', '预算友好', '单人吃饭']::text[], '出餐快、价格稳，是日常不知道吃什么时的安全牌。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r051', '蒋村·面馆粉铺便当社', '蒋村·面馆粉铺便当社', array[]::text[], '蒋村', 2.1, 26, '面馆粉铺', 26, 4.3, 80, 167, 30.3017, 120.0753, '面', '#6688bd', array['面食', '暖胃', '一人食', '人均30内']::text[], array['雨天热汤', '一个人', '快速解决']::text[], '热汤和碳水都到位，适合课间或晚自习前快速补能。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r052', '文一西路·夜宵小吃热饭局', '文一西路·夜宵小吃热饭局', array[]::text[], '文一西路', 2.7, 34, '夜宵小吃', 22, 4.4, 81, 204, 30.2941, 120.0963, '夜', '#5c6078', array['夜宵', '小吃', '实惠', '人均30内']::text[], array['晚课后', '嘴馋', '组队加餐']::text[], '便宜、热闹、快乐，适合晚上给自己一点小奖励。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r053', '城西银泰·轻食简餐风味档', '城西银泰·轻食简餐风味档', array[]::text[], '城西银泰', 2.9, 37, '轻食简餐', 30, 4.5, 82, 241, 30.2922, 120.1116, '轻', '#5aa37c', array['不辣', '一人食', '轻负担', '人均30内']::text[], array['健身后', '清爽午餐', '不想太油']::text[], '口味清爽，饱腹感比沙拉强，适合想吃轻一点的时候。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r054', '三墩·日韩简餐深夜档', '三墩·日韩简餐深夜档', array[]::text[], '三墩', 3.1, 38, '日韩简餐', 40, 4.6, 83, 278, 30.327, 120.0745, '拌', '#8d5a3b', array['一人食', '下饭', '拍照', '人均50内']::text[], array['周末换口味', '独自觅食', '两人小聚']::text[], '酱汁和主食都比较稳，店面氛围适合慢慢吃。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r055', '紫金港北门·清真友好一号店', '紫金港北门·清真友好一号店', array[]::text[], '紫金港北门', 0.8, 10, '清真友好', 22, 4.7, 84, 315, 30.3136, 120.0925, '牛', '#4f8b65', array['清真友好', '面食', '实惠', '人均30内']::text[], array['清真友好', '午餐快吃', '预算友好']::text[], '选择稳定、价格友好，适合日常快速解决。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r056', '紫金港南门·聚餐烤鱼小馆', '紫金港南门·聚餐烤鱼小馆', array[]::text[], '紫金港南门', 1.3, 18, '聚餐烤鱼', 57, 4.1, 85, 352, 30.296, 120.0918, '鱼', '#3d7f8f', array['聚餐', '辣', '夜宵', '50+']::text[], array['多人约饭', '夜宵改善', '想吃鱼']::text[], '更适合多人分食，氛围感比日常快餐强。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r057', '校内·粥面暖胃饭铺', '校内·粥面暖胃饭铺', array[]::text[], '校内', 0.3, 4, '粥面暖胃', 19, 4.2, 86, 389, 30.3073, 120.0886, '粥', '#c0955f', array['暖胃', '不辣', '实惠', '人均30内']::text[], array['晚课后', '胃口一般', '轻负担']::text[], '清淡、近、负担小，适合不想吃太重的一餐。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r058', '西园·咖啡甜点食堂外档', '西园·咖啡甜点食堂外档', array[]::text[], '西园', 1.1, 15, '咖啡甜点', 37, 4.3, 87, 426, 30.3066, 120.0773, '咖', '#8c6338', array['拍照', '不辣', '一人食', '人均50内']::text[], array['下午自习', '独处放空', '轻约会']::text[], '适合坐一会儿，把吃饭和自习之间的缝隙填满。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r059', '青芝坞·东南亚风味街角店', '青芝坞·东南亚风味街角店', array[]::text[], '青芝坞', 1.9, 24, '东南亚风味', 45, 4.3, 88, 463, 30.2745, 120.1241, '越', '#4d9a8d', array['不辣', '清爽', '面食', '人均50内']::text[], array['周末换口味', '清爽汤粉', '轻聚餐']::text[], '汤粉清爽，香料感轻，适合吃腻重口后的换口味。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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
  'r060', '申花·东北大份菜小桌', '申花·东北大份菜小桌', array[]::text[], '申花', 1.9, 23, '东北大份菜', 43, 4.4, 89, 500, 30.3242, 120.1036, '锅', '#b06a36', array['聚餐', '下饭', '大份', '人均50内']::text[], array['寝室聚餐', '大份下饭', '晚饭改善']::text[], '菜量友好，人多分摊很合适，适合寝室饭局。', '[{"type":"demo_seed","path":"seed/restaurants.json"}]'::jsonb, 'published'
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

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02501', 'r025', '小炒黄牛肉', 46, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02502', 'r025', '干锅花菜', 29, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02503', 'r025', '酸辣土豆丝', 15, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02601', 'r026', '番茄牛腩饭', 27, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02602', 'r026', '青椒肉丝饭', 19, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02603', 'r026', '荷包蛋', 4, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02701', 'r027', '番茄肥牛面', 31, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02702', 'r027', '雪菜肉丝面', 22, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02703', 'r027', '卤蛋', 5, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02801', 'r028', '炸鸡柳', 12, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02802', 'r028', '烤年糕', 7, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02803', 'r028', '关东煮', 17, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02901', 'r029', '照烧鸡腿拌饭', 27, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02902', 'r029', '牛油果鸡胸碗', 31, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd02903', 'r029', '南瓜汤', 8, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03001', 'r030', '烤肉拌饭', 33, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03002', 'r030', '咖喱猪排饭', 42, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03003', 'r030', '海苔饭团', 13, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03101', 'r031', '牛肉拉面', 19, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03102', 'r031', '孜然牛肉拌面', 27, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03103', 'r031', '凉拌黄瓜', 7, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03201', 'r032', '香辣烤鱼', 129, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03202', 'r032', '豆花烤鱼', 117, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03203', 'r032', '宽粉加菜', 8, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03301', 'r033', '皮蛋瘦肉粥', 12, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03302', 'r033', '青菜肉丝面', 16, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03303', 'r033', '茶叶蛋', 4, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03401', 'r034', '拿铁', 22, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03402', 'r034', '巴斯克蛋糕', 29, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03403', 'r034', '鸡肉可颂', 31, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03501', 'r035', '牛肉河粉', 44, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03502', 'r035', '越式春卷', 17, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03503', 'r035', '柠檬鸡翅', 22, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03601', 'r036', '锅包肉', 45, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03602', 'r036', '地三鲜', 28, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03603', 'r036', '小鸡炖蘑菇', 59, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03701', 'r037', '小炒黄牛肉', 46, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03702', 'r037', '干锅花菜', 29, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03703', 'r037', '酸辣土豆丝', 15, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03801', 'r038', '番茄牛腩饭', 27, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03802', 'r038', '青椒肉丝饭', 19, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03803', 'r038', '荷包蛋', 4, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03901', 'r039', '番茄肥牛面', 31, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03902', 'r039', '雪菜肉丝面', 22, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd03903', 'r039', '卤蛋', 5, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04001', 'r040', '炸鸡柳', 12, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04002', 'r040', '烤年糕', 7, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04003', 'r040', '关东煮', 17, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04101', 'r041', '照烧鸡腿拌饭', 27, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04102', 'r041', '牛油果鸡胸碗', 31, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04103', 'r041', '南瓜汤', 8, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04201', 'r042', '烤肉拌饭', 33, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04202', 'r042', '咖喱猪排饭', 42, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04203', 'r042', '海苔饭团', 13, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04301', 'r043', '牛肉拉面', 19, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04302', 'r043', '孜然牛肉拌面', 27, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04303', 'r043', '凉拌黄瓜', 7, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04401', 'r044', '香辣烤鱼', 129, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04402', 'r044', '豆花烤鱼', 117, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04403', 'r044', '宽粉加菜', 8, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04501', 'r045', '皮蛋瘦肉粥', 12, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04502', 'r045', '青菜肉丝面', 16, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04503', 'r045', '茶叶蛋', 4, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04601', 'r046', '拿铁', 22, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04602', 'r046', '巴斯克蛋糕', 29, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04603', 'r046', '鸡肉可颂', 31, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04701', 'r047', '牛肉河粉', 44, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04702', 'r047', '越式春卷', 17, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04703', 'r047', '柠檬鸡翅', 22, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04801', 'r048', '锅包肉', 45, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04802', 'r048', '地三鲜', 28, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04803', 'r048', '小鸡炖蘑菇', 59, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04901', 'r049', '小炒黄牛肉', 46, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04902', 'r049', '干锅花菜', 29, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd04903', 'r049', '酸辣土豆丝', 15, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05001', 'r050', '番茄牛腩饭', 27, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05002', 'r050', '青椒肉丝饭', 19, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05003', 'r050', '荷包蛋', 4, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05101', 'r051', '番茄肥牛面', 31, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05102', 'r051', '雪菜肉丝面', 22, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05103', 'r051', '卤蛋', 5, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05201', 'r052', '炸鸡柳', 12, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05202', 'r052', '烤年糕', 7, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05203', 'r052', '关东煮', 17, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05301', 'r053', '照烧鸡腿拌饭', 27, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05302', 'r053', '牛油果鸡胸碗', 31, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05303', 'r053', '南瓜汤', 8, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05401', 'r054', '烤肉拌饭', 33, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05402', 'r054', '咖喱猪排饭', 42, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05403', 'r054', '海苔饭团', 13, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05501', 'r055', '牛肉拉面', 19, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05502', 'r055', '孜然牛肉拌面', 27, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05503', 'r055', '凉拌黄瓜', 7, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05601', 'r056', '香辣烤鱼', 129, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05602', 'r056', '豆花烤鱼', 117, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05603', 'r056', '宽粉加菜', 8, 88, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05701', 'r057', '皮蛋瘦肉粥', 12, 77, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05702', 'r057', '青菜肉丝面', 16, 86, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05703', 'r057', '茶叶蛋', 4, 95, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05801', 'r058', '拿铁', 22, 84, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05802', 'r058', '巴斯克蛋糕', 29, 93, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05803', 'r058', '鸡肉可颂', 31, 74, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05901', 'r059', '牛肉河粉', 44, 91, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05902', 'r059', '越式春卷', 17, 72, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd05903', 'r059', '柠檬鸡翅', 22, 81, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd06001', 'r060', '锅包肉', 45, 70, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd06002', 'r060', '地三鲜', 28, 79, array[]::text[], 'published'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  name = excluded.name,
  price = excluded.price,
  heat = excluded.heat,
  tags = excluded.tags,
  status = excluded.status;

insert into public.dishes (id, restaurant_id, name, price, heat, tags, status) values (
  'd06003', 'r060', '小鸡炖蘑菇', 59, 88, array[]::text[], 'published'
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

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02501', 'r025', null, '周末出门', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02502', 'r025', null, '一个人也行', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02601', 'r026', null, '一个人也行', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02602', 'r026', null, '预算守门员', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02701', 'r027', null, '预算守门员', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02702', 'r027', null, '酸辣脑袋', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02801', 'r028', null, '酸辣脑袋', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02802', 'r028', null, '复习到饿', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02901', 'r029', null, '复习到饿', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv02902', 'r029', null, '紫金港饭搭子', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03001', 'r030', null, '紫金港饭搭子', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03002', 'r030', null, '赶DDL的研一', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03101', 'r031', null, '赶DDL的研一', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03102', 'r031', null, '不吃香菜', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03201', 'r032', null, '不吃香菜', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03202', 'r032', null, '夜宵观察员', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03301', 'r033', null, '夜宵观察员', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03302', 'r033', null, '早八幸存者', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03401', 'r034', null, '早八幸存者', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03402', 'r034', null, '周末出门', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03501', 'r035', null, '周末出门', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03502', 'r035', null, '一个人也行', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03601', 'r036', null, '一个人也行', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03602', 'r036', null, '预算守门员', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03701', 'r037', null, '预算守门员', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03702', 'r037', null, '酸辣脑袋', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03801', 'r038', null, '酸辣脑袋', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03802', 'r038', null, '复习到饿', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03901', 'r039', null, '复习到饿', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv03902', 'r039', null, '紫金港饭搭子', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04001', 'r040', null, '紫金港饭搭子', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04002', 'r040', null, '赶DDL的研一', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04101', 'r041', null, '赶DDL的研一', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04102', 'r041', null, '不吃香菜', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04201', 'r042', null, '不吃香菜', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04202', 'r042', null, '夜宵观察员', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04301', 'r043', null, '夜宵观察员', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04302', 'r043', null, '早八幸存者', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04401', 'r044', null, '早八幸存者', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04402', 'r044', null, '周末出门', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04501', 'r045', null, '周末出门', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04502', 'r045', null, '一个人也行', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04601', 'r046', null, '一个人也行', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04602', 'r046', null, '预算守门员', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04701', 'r047', null, '预算守门员', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04702', 'r047', null, '酸辣脑袋', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04801', 'r048', null, '酸辣脑袋', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04802', 'r048', null, '复习到饿', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04901', 'r049', null, '复习到饿', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv04902', 'r049', null, '紫金港饭搭子', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05001', 'r050', null, '紫金港饭搭子', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05002', 'r050', null, '赶DDL的研一', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05101', 'r051', null, '赶DDL的研一', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05102', 'r051', null, '不吃香菜', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05201', 'r052', null, '不吃香菜', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05202', 'r052', null, '夜宵观察员', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05301', 'r053', null, '夜宵观察员', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05302', 'r053', null, '早八幸存者', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05401', 'r054', null, '早八幸存者', 4, '适合和朋友一起点几样分着吃。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05402', 'r054', null, '周末出门', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05501', 'r055', null, '周末出门', 5, '味道不算惊艳，但胜在稳妥。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05502', 'r055', null, '一个人也行', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05601', 'r056', null, '一个人也行', 4, '离校区不远，赶时间也能接受。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05602', 'r056', null, '预算守门员', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05701', 'r057', null, '预算守门员', 5, '建议错峰，饭点人会比较多。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05702', 'r057', null, '酸辣脑袋', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05801', 'r058', null, '酸辣脑袋', 4, '整体体验舒服，适合周末换口味。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05802', 'r058', null, '复习到饿', 5, '高峰期会排队，但翻台还算快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05901', 'r059', null, '复习到饿', 5, '推荐先点招牌，不太容易踩雷。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv05902', 'r059', null, '紫金港饭搭子', 4, '价格对学生比较友好，分量也够。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv06001', 'r060', null, '紫金港饭搭子', 4, '口味稳定，适合不知道吃什么的时候。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, rating, text, tags, status) values (
  'rv06002', 'r060', null, '赶DDL的研一', 5, '一个人来吃不会尴尬，座位周转快。', array[]::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

commit;
