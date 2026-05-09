-- Generated from seed/*.json by scripts/generate-supabase-seed.cjs.
-- Re-run `npm run seed:sql:write` after editing seed JSON.
begin;

delete from public.dishes where id ~ '^d[0-9]{5}$';
delete from public.reviews where id ~ '^rv[0-9]{5}$';
update public.restaurants set status = 'archived' where id ~ '^r[0-9]{3}$' and id not in ('r001', 'r002', 'r003', 'r004', 'r005', 'r006', 'r007', 'r008', 'r009', 'r010', 'r011', 'r012', 'r013', 'r014', 'r015', 'r016', 'r017', 'r018', 'r019', 'r020', 'r021', 'r022', 'r023', 'r024', 'r025', 'r026', 'r027', 'r028', 'r029', 'r030', 'r031', 'r032', 'r033', 'r034', 'r035', 'r036', 'r037', 'r038', 'r039', 'r040', 'r041', 'r042', 'r043', 'r044', 'r045', 'r046', 'r047', 'r048', 'r049', 'r050', 'r051', 'r052', 'r053', 'r054', 'r055', 'r056', 'r057', 'r058', 'r059', 'r060');

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r001', '紫金港餐饮中心临湖餐厅', '紫金港餐饮中心临湖餐厅', array[]::text[], '校内', 0.37, 5, '校内食堂', 23, 4, 96, 186, 30.303725, 120.085675, '校', '#4f8b65', array['近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '懒得出校']::text[], array[]::text[], array['下饭', '实惠', '食堂']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥23，距离紫金港约 0.4km；当前标签为 近、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"web_clue","keyword":"临湖餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r002', '古茗(浙大银泉校内店)', '古茗(浙大银泉校内店)', array[]::text[], '校内', 0.75, 10, '茶饮', 16, 4.4, 96, 188, 30.306192, 120.075274, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"web_clue","keyword":"银泉餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r003', '浙大紫金港澄月食堂(留学生食堂)', '浙大紫金港澄月食堂(留学生食堂)', array[]::text[], '校内', 0.73, 10, '校内食堂', 30, 4.7, 96, 198, 30.296587, 120.079467, '辣', '#c84b35', array['近', '实惠', '人均30内', '校内', '辣', '火锅', '面食', '暖胃']::text[], array['赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '实惠', '火锅', '食堂']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"web_clue","keyword":"澄月餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引饮食消费页","url":"https://zjuers.com/welcome/life/canteen/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r004', '库迪咖啡(浙大紫金港启真湖店)', '库迪咖啡(浙大紫金港启真湖店)', array[]::text[], '校内', 0.37, 5, '茶饮', 9, 4.4, 96, 198, 30.304241, 120.085384, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 0.4km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.595Z"},{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r005', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', array[]::text[], '校内', 0.4, 5, '茶饮', 13, 4.6, 96, 203, 30.304294, 120.085681, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥13，距离紫金港约 0.4km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r006', '吉祥馄饨(杭州浙大紫金港店)', '吉祥馄饨(杭州浙大紫金港店)', array[]::text[], '紫金港东门', 0.87, 12, '面食粉面', 14, 3.3, 96, 152, 30.310541, 120.08236, '面', '#6d8fbd', array['近', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '夜宵']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均约 ¥14，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"web_clue","keyword":"Tony’s house 泰和路 浙江大学 紫金港","title":"Reddit 杭州餐厅推荐提到 Tony’s House 与紫金港","url":"https://www.reddit.com/r/hangzhou/comments/1jdcfb1","publishedAt":"2025-03-18"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r007', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', array[]::text[], '校内', 0.56, 7, '咖啡', 17, 4.5, 95, 196, 30.298056, 120.07996, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 0.6km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r008', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', array[]::text[], '校内', 0.66, 9, '校内食堂', 16, 4.6, 95, 196, 30.307975, 120.085261, '面', '#6d8fbd', array['近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐', '食堂']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['聚餐', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠', '食堂']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r009', '浙江大学(紫金港校区)休闲餐厅', '浙江大学(紫金港校区)休闲餐厅', array[]::text[], '校内', 0.6, 8, '中餐简餐', 14, 4.4, 95, 192, 30.30787, 120.084031, '校', '#4f8b65', array['近', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '轻负担']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥14，距离紫金港约 0.6km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r010', '麦思威咖啡', '麦思威咖啡', array[]::text[], '校内', 0.72, 10, '咖啡', 14, 4.5, 95, 192, 30.302666, 120.089435, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r011', '奈哥老坛酸菜鱼(望月店)', '奈哥老坛酸菜鱼(望月店)', array[]::text[], '三墩', 1.04, 14, '中餐简餐', 23, 3.8, 96, 163, 30.309487, 120.08956, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥23，距离紫金港约 1.0km；当前标签为 实惠、人均30内、快餐，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"web_clue","keyword":"麦思威餐吧 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r012', '一鸣真鲜奶吧(浙大紫金港经济学院店)', '一鸣真鲜奶吧(浙大紫金港经济学院店)', array[]::text[], '校内', 0.63, 8, '茶饮', 14, 4.3, 95, 188, 30.297791, 120.078919, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 0.6km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L125U1KT","name":"一鸣真鲜奶吧(浙大紫金港经济学院店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r013', '浙江大学紫金港校区麦香餐厅', '浙江大学紫金港校区麦香餐厅', array[]::text[], '校内', 0.88, 12, '面食粉面', 9, 4.5, 95, 188, 30.296297, 120.087222, '面', '#6d8fbd', array['近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r014', '瑞幸咖啡(浙大医学院店)', '瑞幸咖啡(浙大医学院店)', array[]::text[], '紫金港周边', 0.79, 11, '咖啡', 14, 4.5, 95, 190, 30.295967, 120.084462, '咖', '#8c6338', array['近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r015', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', array[]::text[], '校内', 0.7, 9, '咖啡', 13, 4.2, 95, 183, 30.308075, 120.085925, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥13，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r016', '库迪咖啡(浙大紫金港成均苑店)', '库迪咖啡(浙大紫金港成均苑店)', array[]::text[], '紫金港南门', 0.7, 9, '咖啡', 13, 4.1, 95, 181, 30.297215, 120.078576, '咖', '#8c6338', array['近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r017', '吉利烘焙(浙江大学紫金港店)', '吉利烘焙(浙江大学紫金港店)', array[]::text[], '校内', 0.7, 9, '甜品烘焙', 13, 4.1, 95, 180, 30.309001, 120.083047, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '甜品', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189B4","name":"吉利烘焙(浙江大学紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r018', '浙江大学紫金港校区东区食堂', '浙江大学紫金港校区东区食堂', array[]::text[], '校内', 0.66, 9, '校内食堂', 30, 4.7, 95, 200, 30.308133, 120.084763, '校', '#4f8b65', array['近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '懒得出校']::text[], array[]::text[], array['下饭', '实惠', '食堂']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r019', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', array[]::text[], '校内', 0.8, 11, '茶饮', 15, 4.3, 95, 184, 30.30906, 120.085999, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '晚餐', '夜宵']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['下饭', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥15，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKW58RH","name":"一鸣真鲜奶吧(杭州浙大紫金翠柏店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r020', '瑞幸咖啡(浙江大学紫金港校区店)', '瑞幸咖啡(浙江大学紫金港校区店)', array[]::text[], '校内', 1.05, 14, '咖啡', 9, 4.5, 95, 184, 30.297848, 120.091314, '咖', '#8c6338', array['实惠', '人均30内', '校内', '拍照', '咖啡', '甜品', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '早餐', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡', '甜品']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 1.1km；当前标签为 实惠、人均30内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r021', '瑞幸咖啡(紫金创业园B幢店)', '瑞幸咖啡(紫金创业园B幢店)', array[]::text[], '西湖区', 0.86, 12, '咖啡', 16, 4.4, 95, 185, 30.308421, 120.075783, '咖', '#8c6338', array['近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r022', '库迪咖啡(浙大紫金港校区店)', '库迪咖啡(浙大紫金港校区店)', array[]::text[], '校内', 1.04, 14, '茶饮', 9, 4.4, 95, 181, 30.309464, 120.089591, '咖', '#8c6338', array['实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '早餐', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 1.0km；当前标签为 实惠、人均30内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r023', '蜜雪冰城(望月店)', '蜜雪冰城(望月店)', array[]::text[], '三墩', 1.18, 16, '茶饮', 8, 4.6, 94, 183, 30.309906, 120.091092, '咖', '#8c6338', array['实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '中餐', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '运动后']::text[], array['轻负担']::text[], array['小吃', '拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥8，距离紫金港约 1.2km；当前标签为 实惠、人均30内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFZY4TW","name":"蜜雪冰城(望月店)","query":{"type":"amap_around","keyword":"餐饮","page":8},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFFZY4TW","name":"蜜雪冰城(望月店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r024', '蜜雪冰城(杭州旗舰店)', '蜜雪冰城(杭州旗舰店)', array[]::text[], '西溪', 1.31, 17, '茶饮', 8, 4.8, 94, 186, 30.292126, 120.076082, '咖', '#8c6338', array['实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '中餐', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '运动后']::text[], array['轻负担']::text[], array['小吃', '拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥8，距离紫金港约 1.3km；当前标签为 实惠、人均30内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HR0ZVB08","name":"蜜雪冰城(杭州旗舰店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r025', '浙江大学紫金港校区玉湖餐厅', '浙江大学紫金港校区玉湖餐厅', array[]::text[], '校内', 0.94, 13, '中餐简餐', 20, 4.6, 95, 189, 30.300096, 120.072625, '校', '#4f8b65', array['实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥20，距离紫金港约 0.9km；当前标签为 实惠、人均30内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r026', '肯德基(浙大紫金港店)', '肯德基(浙大紫金港店)', array[]::text[], '校内', 0.69, 9, '异国简餐', 30, 4.5, 95, 193, 30.306459, 120.076215, '校', '#4f8b65', array['近', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离紫金港约 0.7km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r027', '厝内小眷村(浙大紫金港店)', '厝内小眷村(浙大紫金港店)', array[]::text[], '校内', 1.09, 15, '茶饮', 16, 4.6, 94, 186, 30.309626, 120.090079, '甜', '#d9915d', array['实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '中餐', '小吃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 1.1km；当前标签为 实惠、人均30内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r028', '蔡家缙云烧饼&粥铺(紫金港店)', '蔡家缙云烧饼&粥铺(紫金港店)', array[]::text[], '紫金港东门', 1.07, 14, '快餐小吃', 12, 4.4, 94, 180, 30.309575, 120.089875, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '小吃']::text[], array['外卖']::text[], array['中餐', '夜宵']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥12，距离紫金港约 1.1km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r029', '东北烤冷面', '东北烤冷面', array[]::text[], '三墩', 1.07, 14, '面食粉面', 13, 4.4, 94, 180, 30.309575, 120.089875, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥13，距离紫金港约 1.1km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r030', '临榆炸鸡腿(浙大紫金港店)', '临榆炸鸡腿(浙大紫金港店)', array[]::text[], '紫金港东门', 1, 13, '异国简餐', 14, 4.3, 95, 179, 30.309322, 120.089133, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖']::text[], array['中餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 1.0km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r031', '熊爪咖啡give&take(浙江大学店)', '熊爪咖啡give&take(浙江大学店)', array[]::text[], '校内', 0.79, 11, '咖啡', 19, 4.1, 95, 178, 30.306619, 120.075048, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥19，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L16USKVW","name":"熊爪咖啡give&take(浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0L16USKVW","name":"熊爪咖啡give&take(浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r032', '一鸣真鲜奶吧(杭州浙大紫金港银泉店)', '一鸣真鲜奶吧(杭州浙大紫金港银泉店)', array[]::text[], '校内', 0.8, 11, '校内食堂', 17, 4, 95, 175, 30.306522, 120.07491, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '甜品', '聚餐', '轻负担']::text[], array['聚餐', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '晚餐']::text[], array['聚餐', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '甜品', '食堂']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥17，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKHR8HD","name":"一鸣真鲜奶吧(杭州浙大紫金港银泉店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFKHR8HD","name":"一鸣真鲜奶吧(杭州浙大紫金港银泉店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r033', '小满面包烘焙社(浙大紫金港店)', '小满面包烘焙社(浙大紫金港店)', array[]::text[], '校内', 0.88, 12, '甜品烘焙', 22, 4.3, 95, 182, 30.310418, 120.084119, '甜', '#d9915d', array['近', '实惠', '人均30内', '校内', '拍照', '甜品', '面食', '暖胃']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['约会拍照', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '拍照', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥22，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JG5C8BQ0","name":"小满面包烘焙社(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r034', '胡记牛肉汤(浙大店)', '胡记牛肉汤(浙大店)', array[]::text[], '三墩', 1.08, 14, '面食粉面', 16, 4.4, 94, 180, 30.309612, 120.089891, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 1.1km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r035', '浙江大学紫金港校区银泉餐厅', '浙江大学紫金港校区银泉餐厅', array[]::text[], '校内', 0.67, 9, '校内食堂', 44, 4.8, 95, 202, 30.306373, 120.076373, '辣', '#c84b35', array['近', '人均50内', '校内', '辣', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '快餐', '食堂']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥44，距离紫金港约 0.7km；当前标签为 近、人均50内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r036', '杰里烘焙', '杰里烘焙', array[]::text[], '三墩', 0.87, 12, '甜品烘焙', 28, 4.5, 95, 188, 30.310383, 120.084041, '甜', '#d9915d', array['近', '实惠', '人均30内', '拍照', '甜品', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IAJC0IAG","name":"杰里烘焙","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r037', '研院咖啡(浙江大学紫金港店)', '研院咖啡(浙江大学紫金港店)', array[]::text[], '校内', 0.78, 10, '咖啡', 26, 4.2, 95, 182, 30.295872, 120.080448, '咖', '#8c6338', array['近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥26，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KU6SW9PO","name":"研院咖啡(浙江大学紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0KU6SW9PO","name":"研院咖啡(浙江大学紫金港店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r038', '逗牛士(港湾家园店)', '逗牛士(港湾家园店)', array[]::text[], '三墩', 0.86, 12, '中餐简餐', 16, 3.9, 95, 170, 30.310517, 120.082326, '饭', '#f0aa38', array['近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥16，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r039', 'CoCo都可(浙港国际店)', 'CoCo都可(浙港国际店)', array[]::text[], '三墩', 1.3, 17, '中餐简餐', 12, 4.5, 94, 177, 30.308875, 120.093525, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥12，距离紫金港约 1.3km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J1K55RQD","name":"CoCo都可(浙港国际店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r040', '中国兰州拉面(紫金创业园B座店)', '中国兰州拉面(紫金创业园B座店)', array[]::text[], '西湖区', 0.85, 11, '面食粉面', 20, 4, 95, 174, 30.308232, 120.075743, '面', '#6d8fbd', array['近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '清真友好', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐', '懒得出校']::text[], array['清真友好']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"清真","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r041', '柳星螺蛳粉(紫金港店)', '柳星螺蛳粉(紫金港店)', array[]::text[], '紫金港东门', 1.21, 16, '面食粉面', 17, 4.5, 94, 180, 30.310064, 120.091273, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r042', '唐记老牌螺蛳粉(浙大店)', '唐记老牌螺蛳粉(浙大店)', array[]::text[], '三墩', 1.2, 16, '面食粉面', 18, 4.5, 94, 180, 30.308879, 120.092234, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '夜宵']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.2km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGO55CFQ","name":"唐记老牌螺蛳粉(浙大店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r043', '三姊妹粉记', '三姊妹粉记', array[]::text[], '三墩', 1.23, 16, '面食粉面', 17, 4.5, 94, 179, 30.308641, 120.092765, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"中餐","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r044', '肯德基车速取餐点(浙大紫金港店)', '肯德基车速取餐点(浙大紫金港店)', array[]::text[], '紫金港东门', 0.63, 8, '中餐简餐', 32, 4, 95, 179, 30.306512, 120.077095, '饭', '#f0aa38', array['近', '人均50内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥32，距离紫金港约 0.6km；当前标签为 近、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J327054S","name":"肯德基车速取餐点(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0J327054S","name":"肯德基车速取餐点(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r045', '梅记·老鸭粉丝馆(浙港国际店)', '梅记·老鸭粉丝馆(浙港国际店)', array[]::text[], '三墩', 1.25, 17, '面食粉面', 19, 4.6, 94, 182, 30.309034, 120.092734, '面', '#6d8fbd', array['实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥19，距离紫金港约 1.2km；当前标签为 实惠、人均30内、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"中餐","page":4},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r046', '麦当劳(宝港生活广场店)', '麦当劳(宝港生活广场店)', array[]::text[], '三墩', 1.1, 15, '异国简餐', 26, 4.6, 94, 185, 30.306562, 120.092588, '辣', '#c84b35', array['实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥26，距离紫金港约 1.1km；当前标签为 实惠、人均30内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r047', '煮赣派·老南昌水煮(浙大紫金港店)', '煮赣派·老南昌水煮(浙大紫金港店)', array[]::text[], '紫金港东门', 1.03, 14, '中餐简餐', 20, 4.2, 95, 175, 30.309461, 120.089367, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.0km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r048', '皇家烤猪蹄(望月公寓樱花苑店)', '皇家烤猪蹄(望月公寓樱花苑店)', array[]::text[], '三墩', 1.16, 15, '中餐简餐', 20, 4.4, 94, 178, 30.309818, 120.09085, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.2km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r049', '宏利美食城', '宏利美食城', array[]::text[], '三墩', 0.86, 11, '中餐简餐', 19, 3.8, 95, 167, 30.3105, 120.082386, '饭', '#f0aa38', array['近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥19，距离紫金港约 0.9km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r050', '栗栗烘焙·栗酥饼(浙大紫金港店)', '栗栗烘焙·栗酥饼(浙大紫金港店)', array[]::text[], '紫金港东门', 1.16, 15, '甜品烘焙', 11, 4, 94, 166, 30.309712, 120.090911, '甜', '#d9915d', array['实惠', '人均30内', '拍照', '甜品', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '中餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['中餐', '下午茶']::text[], array['一人食', '约会拍照', '运动后']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥11，距离紫金港约 1.2km；当前标签为 实惠、人均30内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LKLH90K5","name":"栗栗烘焙·栗酥饼(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0LKLH90K5","name":"栗栗烘焙·栗酥饼(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r051', '可莎蜜兒(紫荆)', '可莎蜜兒(紫荆)', array[]::text[], '三墩', 1.13, 15, '甜品烘焙', 23, 4.4, 94, 179, 30.309723, 120.090481, '甜', '#d9915d', array['实惠', '人均30内', '拍照', '甜品', '面食', '暖胃', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '中餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '下午茶', '夜宵']::text[], array['一人食', '约会拍照', '运动后']::text[], array['轻负担']::text[], array['暖胃', '面食', '拍照', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.1km；当前标签为 实惠、人均30内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189J1","name":"可莎蜜兒(紫荆)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B023B189J1","name":"可莎蜜兒(紫荆)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T10:27:20.600Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r052', '苗记禾麦自选快餐(紫金创业园B座店)', '苗记禾麦自选快餐(紫金创业园B座店)', array[]::text[], '西湖区', 0.84, 11, '快餐小吃', 19, 3.6, 95, 162, 30.308348, 120.076077, '饭', '#f0aa38', array['近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥19，距离紫金港约 0.8km；当前标签为 近、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r053', '塔斯汀中国汉堡(杭州市西溪银泰店)', '塔斯汀中国汉堡(杭州市西溪银泰店)', array[]::text[], '西溪', 1.25, 17, '异国简餐', 20, 4.4, 94, 176, 30.293389, 120.07475, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖']::text[], array['中餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.3km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r054', '北京片皮烤鸭(紫金港店)', '北京片皮烤鸭(紫金港店)', array[]::text[], '紫金港东门', 1.78, 24, '烧烤烤肉', 28, 4, 95, 151, 30.318609, 120.084221, '辣', '#c84b35', array['实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['下饭', '实惠', '烧烤']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥28，距离紫金港约 1.8km；当前标签为 实惠、人均30内、辣，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B023B17G6U","name":"北京片皮烤鸭(紫金港店)","query":{"type":"web_clue","keyword":"紫金港餐饮中心 风味餐厅 浙江大学","title":"Apple Maps 紫金港餐饮中心风味餐厅页面","url":"https://maps.apple.com/place?auid=1118368631460667&lsp=57879","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r055', '华莱士·全鸡汉堡(浙港国际浙港广场店)', '华莱士·全鸡汉堡(浙港国际浙港广场店)', array[]::text[], '三墩', 1.22, 16, '异国简餐', 18, 4.2, 94, 170, 30.308625, 120.092725, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖']::text[], array['中餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥18，距离紫金港约 1.2km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T10:27:20.598Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r056', '张亮麻辣烫(紫金港店)', '张亮麻辣烫(紫金港店)', array[]::text[], '紫金港东门', 1.01, 13, '火锅麻辣烫', 30, 4.3, 95, 179, 30.309365, 120.089194, '辣', '#c84b35', array['实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['下饭', '实惠', '火锅']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥30，距离紫金港约 1.0km；当前标签为 实惠、人均30内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r057', '鼎鲜花甲(望月公寓店)', '鼎鲜花甲(望月公寓店)', array[]::text[], '三墩', 1.08, 14, '快餐小吃', 20, 4, 94, 168, 30.309606, 120.089887, '饭', '#f0aa38', array['实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 1.1km；当前标签为 实惠、人均30内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r058', '鲜目录寿司(浙大紫金港店)', '鲜目录寿司(浙大紫金港店)', array[]::text[], '紫金港东门', 1.23, 16, '异国简餐', 23, 4.4, 94, 176, 30.310471, 120.091188, '异', '#4d79b8', array['实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '下午茶', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐', '实惠', '异国料理']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.2km；当前标签为 实惠、人均30内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJASE7M","name":"鲜目录寿司(浙大紫金港店)","query":{"type":"amap_around","keyword":"日料","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"},{"type":"amap_poi","poi_id":"B0FFJASE7M","name":"鲜目录寿司(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r059', '渔百仓象山海鲜面(西溪银泰城)', '渔百仓象山海鲜面(西溪银泰城)', array[]::text[], '紫金港南门', 1.2, 16, '火锅麻辣烫', 25, 4.4, 94, 177, 30.293799, 120.075017, '辣', '#c84b35', array['实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐', '夜宵']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['聚餐']::text[], array['辣']::text[], array['暖胃', '面食', '实惠', '火锅']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离紫金港约 1.2km；当前标签为 实惠、人均30内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T10:27:20.597Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T10:27:20.598Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T10:27:20.600Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r060', '北街烧烤(三墩店)', '北街烧烤(三墩店)', array[]::text[], '三墩', 0.86, 12, '烧烤烤肉', 33, 4.1, 95, 176, 30.310508, 120.082426, '辣', '#c84b35', array['近', '人均50内', '辣', '烧烤', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐', '夜宵']::text[], array['一人食', '聚餐', '懒得出校']::text[], array['辣']::text[], array['下饭', '烧烤']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥33，距离紫金港约 0.9km；当前标签为 近、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T10:27:20.596Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T10:27:20.599Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T10:27:20.601Z"}]'::jsonb, 'published'
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
  service_modes = excluded.service_modes,
  meal_periods = excluded.meal_periods,
  scenario_tags = excluded.scenario_tags,
  constraint_tags = excluded.constraint_tags,
  preference_tags = excluded.preference_tags,
  reason = excluded.reason,
  source_refs = excluded.source_refs,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r001_internet', 'r001', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥23，地址为宜山路与迪臣南路交叉口东160米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r002_internet', 'r002', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为浙江大学紫金港校区银泉食堂对面1幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r003_internet', 'r003', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥30，地址为余杭塘路925号澄月食堂3层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r004_internet', 'r004', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为余杭塘路866号浙江大学紫金港校区浙大超市启真湖店内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r005_internet', 'r005', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥13，地址为三墩镇浙江大学紫金港校区学生活动中心B1号楼106。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r006_internet', 'r006', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3、人均约 ¥14，地址为泰和路港湾家园29幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r007_internet', 'r007', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为紫金港路浙大紫金港校区文科组团人文学院大楼一层大厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r008_internet', 'r008', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为申花路796号紫金港国际饭店1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r009_internet', 'r009', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥14，地址为三墩镇余杭塘路866号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r010_internet', 'r010', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为余杭塘路866号浙江大学紫金港校区东二教学楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r011_internet', 'r011', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥23，地址为三墩镇龙宇街望月商品17号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r012_internet', 'r012', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥14，地址为余杭塘路929号浙江大学紫金港校区成均苑7幢一层1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r013_internet', 'r013', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为三墩镇余杭塘路866号浙江大学紫金港校区医学院图书馆旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r014_internet', 'r014', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为浙大医学院店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r015_internet', 'r015', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥13，地址为余杭塘路866号浙江大学紫金港校区白沙综合楼二楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r016_internet', 'r016', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路与紫金港路隧道交叉口西320米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r017_internet', 'r017', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路388号浙大紫金港校区蓝田6幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r018_internet', 'r018', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥30，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r019_internet', 'r019', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥15，地址为浙大紫金港校区翠柏1舍1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r020_internet', 'r020', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为浙江大学紫金港校区店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r021_internet', 'r021', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r022_internet', 'r022', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为三墩镇望月公寓20号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r023_internet', 'r023', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥8，地址为育英路望月公寓55号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r024_internet', 'r024', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.8、人均约 ¥8，地址为西溪银泰城1号楼3-南112室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r025_internet', 'r025', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥20，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r026_internet', 'r026', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为余杭塘路866号浙江大学紫金港校区银泉餐厅一楼C区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r027_internet', 'r027', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为三墩镇浙大紫金港望月公寓南门32A号(浙大紫金港校区坠落街)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r028_internet', 'r028', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥12，地址为三墩镇望月公寓商业用房29号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r029_internet', 'r029', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥13，地址为三墩镇龙宇街望月商铺11号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r030_internet', 'r030', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥14，地址为龙宇街望月商铺4号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r031_internet', 'r031', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥19，地址为三墩镇余杭塘路866号浙江大学紫金港校区银泉学院S3104商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r032_internet', 'r032', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥17，地址为留石高架路与留石高架路出口交叉口东南260米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r033_internet', 'r033', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥22，地址为浙大紫金港校区港湾家园19幢11-12商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r034_internet', 'r034', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为望月商铺28号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r035_internet', 'r035', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.8、人均约 ¥44，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r036_internet', 'r036', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为泰和路港湾家园19幢13一14号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r037_internet', 'r037', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥26，地址为余杭塘路与紫金港路隧道交叉口西南240米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r038_internet', 'r038', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥16，地址为石祥西路港湾家园29幢3单元1层1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r039_internet', 'r039', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥12，地址为三墩紫荆花城1号楼101室(浙港国际)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r040_internet', 'r040', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r041_internet', 'r041', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为三墩镇望月公寓商业用房60-64号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r042_internet', 'r042', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为三墩紫荆花城2号楼128室内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r043_internet', 'r043', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为浙港国际1号楼136室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r044_internet', 'r044', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥32，地址为石祥西路859号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r045_internet', 'r045', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥19，地址为浙港国际2号楼109号(虾龙圩地铁站B口步行490米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r046_internet', 'r046', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥26，地址为紫荆花北路188号4幢一层麦当劳餐厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r047_internet', 'r047', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为望月公寓12号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r048_internet', 'r048', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为望月商铺49号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r049_internet', 'r049', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥19，地址为港湾家园29幢。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r050_internet', 'r050', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥11，地址为龙宇街48号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r051_internet', 'r051', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为光明路望月公寓37-38号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r052_internet', 'r052', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥19，地址为紫金创业园B座101-105室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r053_internet', 'r053', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为双龙街588号杭州西溪银泰城西区(弘德路店)B1层BF022。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r054_internet', 'r054', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥28，地址为三墩镇紫蝶苑10号楼206室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r055_internet', 'r055', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥18，地址为盛龙街浙港国际1号楼140号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r056_internet', 'r056', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥30，地址为望月商铺5-6号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r057_internet', 'r057', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为三墩镇望月公寓商业用房30号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r058_internet', 'r058', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为三墩镇望月公寓商业用房75号铺位1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r059_internet', 'r059', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为余杭塘路与崇仁路交叉口西溪银泰城地下一层铺位号BF038。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status) values (
  'rv_r060_internet', 'r060', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥33，地址为三墩镇港湾家园29幢3单元1楼7号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
)
on conflict (id) do update set
  restaurant_id = excluded.restaurant_id,
  display_name_snapshot = excluded.display_name_snapshot,
  avatar_snapshot = excluded.avatar_snapshot,
  rating = excluded.rating,
  text = excluded.text,
  tags = excluded.tags,
  status = excluded.status;

commit;
