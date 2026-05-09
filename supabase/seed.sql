-- Generated from seed/*.json by scripts/generate-supabase-seed.cjs.
-- Re-run `npm run seed:sql:write` after editing seed JSON.
begin;

delete from public.dishes where id ~ '^d[0-9]{5}$';
delete from public.reviews where id ~ '^rv[0-9]{5}$';
update public.restaurants set status = 'archived' where id ~ '^r[0-9]{3}$' and id not in ('r001', 'r002', 'r003', 'r004', 'r005', 'r006', 'r007', 'r008', 'r009', 'r010', 'r011', 'r012', 'r013', 'r014', 'r015', 'r016', 'r017', 'r018', 'r019', 'r020', 'r021', 'r022', 'r023', 'r024', 'r025', 'r026', 'r027', 'r028', 'r029', 'r030', 'r031', 'r032', 'r033', 'r034', 'r035', 'r036', 'r037', 'r038', 'r039', 'r040', 'r041', 'r042', 'r043', 'r044', 'r045', 'r046', 'r047', 'r048', 'r049', 'r050', 'r051', 'r052', 'r053', 'r054', 'r055', 'r056', 'r057', 'r058', 'r059', 'r060', 'r061', 'r062', 'r063', 'r064', 'r065', 'r066', 'r067', 'r068', 'r069', 'r070', 'r071', 'r072', 'r073', 'r074', 'r075', 'r076', 'r077', 'r078', 'r079', 'r080', 'r081', 'r082', 'r083', 'r084', 'r085', 'r086', 'r087', 'r088', 'r089', 'r090', 'r091', 'r092', 'r093', 'r094', 'r095', 'r096', 'r097', 'r098', 'r099', 'r100', 'r101', 'r102', 'r103', 'r104', 'r105', 'r106', 'r107', 'r108', 'r109', 'r110', 'r111', 'r112', 'r113', 'r114', 'r115', 'r116', 'r117', 'r118', 'r119', 'r120');

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r001', '紫金港餐饮中心临湖餐厅', '紫金港餐饮中心临湖餐厅', array[]::text[], '校内', 0.37, 5, '校内食堂', 23, 4, 0, 0, 30.303725, 120.085675, '校', '#4f8b65', array['正餐', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥23，距离紫金港约 0.4km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.428Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"web_clue","keyword":"临湖餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r002', '浙大紫金港澄月食堂(留学生食堂)', '浙大紫金港澄月食堂(留学生食堂)', array[]::text[], '校内', 0.73, 10, '校内食堂', 30, 4.7, 0, 0, 30.296587, 120.079467, '辣', '#c84b35', array['正餐', '近', '实惠', '人均30内', '校内', '辣', '火锅', '面食']::text[], array['赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '面食']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"web_clue","keyword":"澄月餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引饮食消费页","url":"https://zjuers.com/welcome/life/canteen/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r003', '吉祥馄饨(杭州浙大紫金港店)', '吉祥馄饨(杭州浙大紫金港店)', array[]::text[], '紫金港东门', 0.87, 12, '面食粉面', 14, 3.3, 0, 0, 30.310541, 120.08236, '面', '#6d8fbd', array['正餐', '近', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均约 ¥14，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T15:16:33.434Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"web_clue","keyword":"Tony’s house 泰和路 浙江大学 紫金港","title":"Reddit 杭州餐厅推荐提到 Tony’s House 与紫金港","url":"https://www.reddit.com/r/hangzhou/comments/1jdcfb1","publishedAt":"2025-03-18"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r004', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', array[]::text[], '校内', 0.66, 9, '校内食堂', 16, 4.6, 0, 0, 30.307975, 120.085261, '面', '#6d8fbd', array['正餐', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r005', '浙江大学(紫金港校区)休闲餐厅', '浙江大学(紫金港校区)休闲餐厅', array[]::text[], '校内', 0.6, 8, '校内食堂', 14, 4.4, 0, 0, 30.30787, 120.084031, '校', '#4f8b65', array['正餐', '近', '实惠', '人均30内', '校内', '聚餐', '轻负担', '食堂']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '清爽']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['轻负担']::text[], array['清爽', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥14，距离紫金港约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.428Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r006', '奈哥老坛酸菜鱼(望月店)', '奈哥老坛酸菜鱼(望月店)', array[]::text[], '三墩', 1.04, 14, '中餐简餐', 23, 3.8, 0, 0, 30.309487, 120.08956, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥23，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"web_clue","keyword":"麦思威餐吧 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r007', '浙江大学紫金港校区麦香餐厅', '浙江大学紫金港校区麦香餐厅', array[]::text[], '校内', 0.88, 12, '校内食堂', 9, 4.5, 0, 0, 30.296297, 120.087222, '面', '#6d8fbd', array['正餐', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r008', '浙江大学紫金港校区东区食堂', '浙江大学紫金港校区东区食堂', array[]::text[], '校内', 0.66, 9, '校内食堂', 30, 4.7, 0, 0, 30.308133, 120.084763, '校', '#4f8b65', array['正餐', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r009', '浙江大学紫金港校区玉湖餐厅', '浙江大学紫金港校区玉湖餐厅', array[]::text[], '校内', 0.94, 13, '校内食堂', 20, 4.6, 0, 0, 30.300096, 120.072625, '校', '#4f8b65', array['正餐', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '懒得出校', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥20，距离紫金港约 0.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r010', '肯德基(浙大紫金港店)', '肯德基(浙大紫金港店)', array[]::text[], '校内', 0.69, 9, '异国简餐', 30, 4.5, 0, 0, 30.306459, 120.076215, '校', '#4f8b65', array['正餐', '近', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r011', '蔡家缙云烧饼&粥铺(紫金港店)', '蔡家缙云烧饼&粥铺(紫金港店)', array[]::text[], '紫金港东门', 1.07, 14, '快餐小吃', 12, 4.4, 0, 0, 30.309575, 120.089875, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥12，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r012', '东北烤冷面', '东北烤冷面', array[]::text[], '三墩', 1.07, 14, '面食粉面', 13, 4.4, 0, 0, 30.309575, 120.089875, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥13，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r013', '临榆炸鸡腿(浙大紫金港店)', '临榆炸鸡腿(浙大紫金港店)', array[]::text[], '紫金港东门', 1, 13, '异国简餐', 14, 4.3, 0, 0, 30.309322, 120.089133, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r014', '胡记牛肉汤(浙大店)', '胡记牛肉汤(浙大店)', array[]::text[], '三墩', 1.08, 14, '面食粉面', 16, 4.4, 0, 0, 30.309612, 120.089891, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r015', '浙江大学紫金港校区银泉餐厅', '浙江大学紫金港校区银泉餐厅', array[]::text[], '校内', 0.67, 9, '校内食堂', 44, 4.8, 0, 0, 30.306373, 120.076373, '辣', '#c84b35', array['正餐', '近', '人均50内', '校内', '辣', '面食', '暖胃', '快餐']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥44，距离紫金港约 0.7km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r016', '逗牛士(港湾家园店)', '逗牛士(港湾家园店)', array[]::text[], '三墩', 0.86, 12, '中餐简餐', 16, 3.9, 0, 0, 30.310517, 120.082326, '饭', '#f0aa38', array['正餐', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥16，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r017', '中国兰州拉面(紫金创业园B座店)', '中国兰州拉面(紫金创业园B座店)', array[]::text[], '西湖区', 0.85, 11, '面食粉面', 20, 4, 0, 0, 30.308232, 120.075743, '面', '#6d8fbd', array['正餐', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '清真友好']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['清真友好']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"清真","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r018', '柳星螺蛳粉(紫金港店)', '柳星螺蛳粉(紫金港店)', array[]::text[], '紫金港东门', 1.21, 16, '面食粉面', 17, 4.5, 0, 0, 30.310064, 120.091273, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r019', '唐记老牌螺蛳粉(浙大店)', '唐记老牌螺蛳粉(浙大店)', array[]::text[], '三墩', 1.2, 16, '面食粉面', 18, 4.5, 0, 0, 30.308879, 120.092234, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGO55CFQ","name":"唐记老牌螺蛳粉(浙大店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r020', '三姊妹粉记', '三姊妹粉记', array[]::text[], '三墩', 1.23, 16, '面食粉面', 17, 4.5, 0, 0, 30.308641, 120.092765, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"中餐","page":3},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r021', '梅记·老鸭粉丝馆(浙港国际店)', '梅记·老鸭粉丝馆(浙港国际店)', array[]::text[], '三墩', 1.25, 17, '面食粉面', 19, 4.6, 0, 0, 30.309034, 120.092734, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"中餐","page":4},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r022', '小杨生煎(杭州西溪银泰店)', '小杨生煎(杭州西溪银泰店)', array[]::text[], '紫金港南门', 1.2, 16, '面食粉面', 19, 4.5, 0, 0, 30.293835, 120.074896, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '面食', '暖胃', '聚餐', '一人食']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r023', '麦当劳(宝港生活广场店)', '麦当劳(宝港生活广场店)', array[]::text[], '三墩', 1.1, 15, '异国简餐', 26, 4.6, 0, 0, 30.306562, 120.092588, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥26，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r024', '煮赣派·老南昌水煮(浙大紫金港店)', '煮赣派·老南昌水煮(浙大紫金港店)', array[]::text[], '紫金港东门', 1.03, 14, '中餐简餐', 20, 4.2, 0, 0, 30.309461, 120.089367, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r025', '潮禧肠粉店(望月公寓店)', '潮禧肠粉店(望月公寓店)', array[]::text[], '三墩', 1, 13, '面食粉面', 19, 4.1, 0, 0, 30.309325, 120.089125, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥19，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r026', '徐老友·老友粉(杭州紫金港店)', '徐老友·老友粉(杭州紫金港店)', array[]::text[], '紫金港东门', 1.16, 16, '面食粉面', 24, 4.6, 0, 0, 30.306455, 120.093288, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥24，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":3},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r027', '皇家烤猪蹄(望月公寓樱花苑店)', '皇家烤猪蹄(望月公寓樱花苑店)', array[]::text[], '三墩', 1.16, 15, '中餐简餐', 20, 4.4, 0, 0, 30.309818, 120.09085, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r028', '馅佳面(萍水西街)', '馅佳面(萍水西街)', array[]::text[], '三墩', 1.3, 17, '面食粉面', 9, 4.2, 0, 0, 30.299618, 120.095026, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥9，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","keyword":"小吃","page":6},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.433Z"},{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","keyword":"西餐","page":3},"fetched_at":"2026-05-09T15:16:33.441Z"}]'::jsonb, 'published'
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
  'r029', '宏利美食城', '宏利美食城', array[]::text[], '三墩', 0.86, 11, '中餐简餐', 19, 3.8, 0, 0, 30.3105, 120.082386, '饭', '#f0aa38', array['正餐', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥19，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r030', '滕州菜煎饼(西溪银泰城店)', '滕州菜煎饼(西溪银泰城店)', array[]::text[], '西溪', 1.34, 18, '中餐简餐', 12, 4.4, 0, 0, 30.292614, 120.074385, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥12，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G1OZF4EA","name":"滕州菜煎饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":8},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0G1OZF4EA","name":"滕州菜煎饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r031', '巴蜀王氏现捞', '巴蜀王氏现捞', array[]::text[], '三墩', 1.05, 14, '中餐简餐', 23, 4.3, 0, 0, 30.309502, 120.089577, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣']::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥23，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J26R2D6N","name":"巴蜀王氏现捞","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0J26R2D6N","name":"巴蜀王氏现捞","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r032', '柳州肥姨妈大骨螺蛳粉(浙大店)', '柳州肥姨妈大骨螺蛳粉(浙大店)', array[]::text[], '三墩', 1.23, 16, '面食粉面', 23, 4.6, 0, 0, 30.308959, 120.092499, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥23，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JGSRE2QV","name":"柳州肥姨妈大骨螺蛳粉(浙大店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0JGSRE2QV","name":"柳州肥姨妈大骨螺蛳粉(浙大店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r033', '德泓面馆(浙港国际店)', '德泓面馆(浙港国际店)', array[]::text[], '三墩', 1.3, 17, '面食粉面', 20, 4.6, 0, 0, 30.309361, 120.093113, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFL96IUQ","name":"德泓面馆(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":6},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFL96IUQ","name":"德泓面馆(浙港国际店)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.433Z"}]'::jsonb, 'published'
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
  'r034', '悦览树(紫金港校区浙江大学店)', '悦览树(紫金港校区浙江大学店)', array[]::text[], '校内', 0.95, 13, '中餐简餐', 31, 4.4, 0, 0, 30.296222, 120.075659, '校', '#4f8b65', array['正餐', '人均50内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥31，距离紫金港约 0.9km；当前标签为 正餐、人均50内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFMHW1J9","name":"悦览树(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFMHW1J9","name":"悦览树(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r035', '膳当家黄焖鸡米饭(浙大紫金港店)', '膳当家黄焖鸡米饭(浙大紫金港店)', array[]::text[], '紫金港东门', 1.17, 16, '中餐简餐', 19, 4.3, 0, 0, 30.309873, 120.090953, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":8},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"中餐","page":2},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"黄焖鸡","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":4},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r036', '冯味面馆(萃紫街店)', '冯味面馆(萃紫街店)', array[]::text[], '三墩', 1.08, 14, '面食粉面', 21, 4.2, 0, 0, 30.309781, 120.074137, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['暖胃', '下饭', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥21，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"米线","page":1},"fetched_at":"2026-05-09T15:16:33.433Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"黄焖鸡","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T15:16:33.436Z"}]'::jsonb, 'published'
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
  'r037', '柳州肥姨妈大骨螺蛳粉(西溪银泰店)', '柳州肥姨妈大骨螺蛳粉(西溪银泰店)', array[]::text[], '西溪', 1.32, 18, '面食粉面', 18, 4.5, 0, 0, 30.292755, 120.074612, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LKZ5EKAC","name":"柳州肥姨妈大骨螺蛳粉(西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0LKZ5EKAC","name":"柳州肥姨妈大骨螺蛳粉(西溪银泰店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r038', '肠微粉方程广东味(浙港国际店)', '肠微粉方程广东味(浙港国际店)', array[]::text[], '三墩', 1.25, 17, '面食粉面', 19, 4.4, 0, 0, 30.309192, 120.092608, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L19XJXX3","name":"肠微粉方程广东味(浙港国际店)","query":{"type":"amap_around","keyword":"中餐","page":4},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0L19XJXX3","name":"肠微粉方程广东味(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0L19XJXX3","name":"肠微粉方程广东味(浙港国际店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r039', '朱阿根烧饼(紫荆花北路店)', '朱阿根烧饼(紫荆花北路店)', array[]::text[], '三墩', 1.25, 17, '中餐简餐', 12, 4.1, 0, 0, 30.307211, 120.093894, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥12，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r040', '潘府妈妈手擀面(剑桥店)', '潘府妈妈手擀面(剑桥店)', array[]::text[], '剑桥公社', 1.22, 16, '面食粉面', 28, 4.7, 0, 0, 30.305526, 120.094258, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥28，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF6B159","name":"潘府妈妈手擀面(剑桥店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFF6B159","name":"潘府妈妈手擀面(剑桥店)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFF6B159","name":"潘府妈妈手擀面(剑桥店)","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r041', '杨衢记自选餐厅(西溪银泰城店)', '杨衢记自选餐厅(西溪银泰城店)', array[]::text[], '西溪', 1.34, 18, '中餐简餐', 18, 4.5, 0, 0, 30.292077, 120.07542, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JB6HH0AV","name":"杨衢记自选餐厅(西溪银泰城店)","query":{"type":"amap_around","keyword":"中餐","page":6},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0JB6HH0AV","name":"杨衢记自选餐厅(西溪银泰城店)","query":{"type":"amap_around","keyword":"西餐","page":4},"fetched_at":"2026-05-09T15:16:33.441Z"}]'::jsonb, 'published'
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
  'r042', '苗记禾麦自选快餐(紫金创业园B座店)', '苗记禾麦自选快餐(紫金创业园B座店)', array[]::text[], '西湖区', 0.84, 11, '快餐小吃', 19, 3.6, 0, 0, 30.308348, 120.076077, '饭', '#f0aa38', array['正餐', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥19，距离紫金港约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"中餐","page":1},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T15:16:33.436Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r043', '塔斯汀中国汉堡(杭州市西溪银泰店)', '塔斯汀中国汉堡(杭州市西溪银泰店)', array[]::text[], '西溪', 1.25, 17, '异国简餐', 20, 4.4, 0, 0, 30.293389, 120.07475, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r044', '袁记云饺(西湖区浙大紫金港店)', '袁记云饺(西湖区浙大紫金港店)', array[]::text[], '紫金港东门', 1.05, 14, '中餐简餐', 22, 4.1, 0, 0, 30.309518, 120.089642, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥22，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","keyword":"水饺","page":1},"fetched_at":"2026-05-09T15:16:33.434Z"}]'::jsonb, 'published'
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
  'r045', '重庆鸡公煲(望月公寓47号店)', '重庆鸡公煲(望月公寓47号店)', array[]::text[], '三墩', 1.14, 15, '中餐简餐', 28, 4.5, 0, 0, 30.309666, 120.090735, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDBFZY","name":"重庆鸡公煲(望月公寓47号店)","query":{"type":"amap_around","keyword":"餐饮","page":6},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFFDBFZY","name":"重庆鸡公煲(望月公寓47号店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFFDBFZY","name":"重庆鸡公煲(望月公寓47号店)","query":{"type":"amap_around","keyword":"食堂","page":3},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r046', '北京片皮烤鸭(紫金港店)', '北京片皮烤鸭(紫金港店)', array[]::text[], '紫金港东门', 1.78, 24, '校内食堂', 28, 4, 0, 0, 30.318609, 120.084221, '烤', '#9b5a31', array['正餐', '实惠', '人均30内', '烧烤', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥28，距离紫金港约 1.8km；当前标签为 正餐、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B023B17G6U","name":"北京片皮烤鸭(紫金港店)","query":{"type":"amap_around","keyword":"烤肉","page":4},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B023B17G6U","name":"北京片皮烤鸭(紫金港店)","query":{"type":"web_clue","keyword":"紫金港餐饮中心 风味餐厅 浙江大学","title":"Apple Maps 紫金港餐饮中心风味餐厅页面","url":"https://maps.apple.com/place?auid=1118368631460667&lsp=57879","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r047', '衢州谢记烤饼(望月公寓樱花苑店)', '衢州谢记烤饼(望月公寓樱花苑店)', array[]::text[], '三墩', 1.21, 16, '中餐简餐', 9, 3.8, 0, 0, 30.310076, 120.091266, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥9，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKTAAJZ","name":"衢州谢记烤饼(望月公寓樱花苑店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r048', '华莱士·全鸡汉堡(浙港国际浙港广场店)', '华莱士·全鸡汉堡(浙港国际浙港广场店)', array[]::text[], '三墩', 1.22, 16, '异国简餐', 18, 4.2, 0, 0, 30.308625, 120.092725, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥18，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r049', '张亮麻辣烫(紫金港店)', '张亮麻辣烫(紫金港店)', array[]::text[], '紫金港东门', 1.01, 13, '校内食堂', 30, 4.3, 0, 0, 30.309365, 120.089194, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '聚餐', '食堂', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥30，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r050', '鼎鲜花甲(望月公寓店)', '鼎鲜花甲(望月公寓店)', array[]::text[], '三墩', 1.08, 14, '快餐小吃', 20, 4, 0, 0, 30.309606, 120.089887, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","keyword":"食堂","page":2},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r051', '鲜目录寿司(浙大紫金港店)', '鲜目录寿司(浙大紫金港店)', array[]::text[], '紫金港东门', 1.23, 16, '异国简餐', 23, 4.4, 0, 0, 30.310471, 120.091188, '异', '#4d79b8', array['正餐', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJASE7M","name":"鲜目录寿司(浙大紫金港店)","query":{"type":"amap_around","keyword":"日料","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0FFJASE7M","name":"鲜目录寿司(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r052', '还可以', '还可以', array[]::text[], '三墩', 0.85, 11, '中餐简餐', 33, 4.1, 0, 0, 30.310293, 120.083593, '饭', '#f0aa38', array['正餐', '近', '人均50内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥33，距离紫金港约 0.9km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r053', '渔百仓象山海鲜面(西溪银泰城)', '渔百仓象山海鲜面(西溪银泰城)', array[]::text[], '紫金港南门', 1.2, 16, '火锅麻辣烫', 25, 4.4, 0, 0, 30.293799, 120.075017, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"面馆","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r054', '北街烧烤(三墩店)', '北街烧烤(三墩店)', array[]::text[], '三墩', 0.86, 12, '烧烤烤肉', 33, 4.1, 0, 0, 30.310508, 120.082426, '辣', '#c84b35', array['正餐', '近', '人均50内', '辣', '烧烤', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥33，距离紫金港约 0.9km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r055', '燕子蛋饼超人(西溪银泰城西区店)', '燕子蛋饼超人(西溪银泰城西区店)', array[]::text[], '西溪', 1.26, 17, '中餐简餐', 13, 4, 0, 0, 30.293658, 120.074088, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '早餐', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥13，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KAHYYBRP","name":"燕子蛋饼超人(西溪银泰城西区店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0KAHYYBRP","name":"燕子蛋饼超人(西溪银泰城西区店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r056', '渝八两重庆鸡公煲(杭州望月公寓店)', '渝八两重庆鸡公煲(杭州望月公寓店)', array[]::text[], '三墩', 1.06, 14, '快餐小吃', 20, 3.9, 0, 0, 30.309557, 120.08967, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥20，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r057', '早阳肉包(乾成园店)', '早阳肉包(乾成园店)', array[]::text[], '三墩', 1.35, 18, '中餐简餐', 12, 4.1, 0, 0, 30.312739, 120.073934, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥12，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J3YSDAKA","name":"早阳肉包(乾成园店)","query":{"type":"amap_around","keyword":"小吃","page":8},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r058', '六贤记(西溪银泰店)', '六贤记(西溪银泰店)', array[]::text[], '西溪', 1.16, 15, '中餐简餐', 30, 4.4, 0, 0, 30.293668, 120.076177, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥30，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKL5RN3L","name":"六贤记(西溪银泰店)","query":{"type":"amap_around","keyword":"餐饮","page":6},"fetched_at":"2026-05-09T15:16:33.429Z"}]'::jsonb, 'published'
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
  'r059', '百串百香旋转麻辣烫(望月公寓店)', '百串百香旋转麻辣烫(望月公寓店)', array[]::text[], '三墩', 1.22, 16, '火锅麻辣烫', 25, 4.3, 0, 0, 30.310165, 120.091271, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T15:16:33.443Z"},{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r060', '刘文祥麻辣烫(西溪银泰城店)', '刘文祥麻辣烫(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '火锅麻辣烫', 25, 4.5, 0, 0, 30.292346, 120.075179, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥25，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HRO5J7FQ","name":"刘文祥麻辣烫(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":8},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HRO5J7FQ","name":"刘文祥麻辣烫(西溪银泰城店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0HRO5J7FQ","name":"刘文祥麻辣烫(西溪银泰城店)","query":{"type":"amap_around","keyword":"西餐","page":4},"fetched_at":"2026-05-09T15:16:33.441Z"}]'::jsonb, 'published'
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
  'r061', '鲜有鸡·蔬香炸鸡(西溪银泰城店)', '鲜有鸡·蔬香炸鸡(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '异国简餐', 21, 4.3, 0, 0, 30.29269, 120.074583, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDLMNONJ","name":"鲜有鸡·蔬香炸鸡(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0LDLMNONJ","name":"鲜有鸡·蔬香炸鸡(西溪银泰城店)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r062', '石锅拌饭(浙大店)', '石锅拌饭(浙大店)', array[]::text[], '三墩', 1.41, 19, '异国简餐', 23, 4.5, 0, 0, 30.312846, 120.090769, '面', '#6d8fbd', array['正餐', '实惠', '人均30内', '拍照', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '约会拍照']::text[], array[]::text[], array['暖胃', '面食', '拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥23，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF4969J","name":"石锅拌饭(浙大店)","query":{"type":"amap_around","keyword":"韩餐","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r063', '吉吞吞烤肉卷饼shawerma(西溪银泰店)', '吉吞吞烤肉卷饼shawerma(西溪银泰店)', array[]::text[], '西溪', 1.39, 19, '烧烤烤肉', 24, 4.5, 0, 0, 30.292227, 120.074231, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '烧烤', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥24，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r064', '嵊州小吃(集萃路店)', '嵊州小吃(集萃路店)', array[]::text[], '三墩', 1.32, 18, '快餐小吃', 20, 4.2, 0, 0, 30.312417, 120.074014, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG9328F","name":"嵊州小吃(集萃路店)","query":{"type":"amap_around","keyword":"中餐","page":6},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFG9328F","name":"嵊州小吃(集萃路店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFG9328F","name":"嵊州小吃(集萃路店)","query":{"type":"amap_around","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T15:16:33.436Z"}]'::jsonb, 'published'
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
  'r065', '鸡柳大人(浙大浙港国际店)', '鸡柳大人(浙大浙港国际店)', array[]::text[], '三墩', 1.31, 18, '快餐小吃', 18, 4.1, 0, 0, 30.309283, 120.093352, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KR7MGFK6","name":"鸡柳大人(浙大浙港国际店)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0KR7MGFK6","name":"鸡柳大人(浙大浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":6},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0KR7MGFK6","name":"鸡柳大人(浙大浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r066', '麦当劳(杭州古墩路第二餐厅)', '麦当劳(杭州古墩路第二餐厅)', array[]::text[], '三墩', 1.43, 19, '快餐小吃', 25, 4.6, 0, 0, 30.302525, 120.096873, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥25，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r067', '赛百味(剑桥公社店)', '赛百味(剑桥公社店)', array[]::text[], '剑桥公社', 1.27, 17, '快餐小吃', 25, 4.3, 0, 0, 30.305958, 120.094679, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥25，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B1DQG7","name":"赛百味(剑桥公社店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B023B1DQG7","name":"赛百味(剑桥公社店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r068', '嵊州小吃(浙港国际店)', '嵊州小吃(浙港国际店)', array[]::text[], '三墩', 1.26, 17, '快餐小吃', 21, 4.1, 0, 0, 30.309097, 120.092847, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K17GTSM0","name":"嵊州小吃(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0K17GTSM0","name":"嵊州小吃(浙港国际店)","query":{"type":"amap_around","keyword":"食堂","page":8},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r069', '老博东北老式麻辣烫', '老博东北老式麻辣烫', array[]::text[], '剑桥公社', 1.21, 16, '火锅麻辣烫', 26, 4.2, 0, 0, 30.305519, 120.09409, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥26，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","keyword":"火锅","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","keyword":"食堂","page":5},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r070', '乡村基(杭州西溪银泰城东区店)', '乡村基(杭州西溪银泰城东区店)', array[]::text[], '西溪', 1.28, 17, '快餐小吃', 23, 4.2, 0, 0, 30.292932, 120.074964, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥23，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KR9AFOQ2","name":"乡村基(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0KR9AFOQ2","name":"乡村基(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"小吃","page":6},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r071', '杨国福麻辣烫(浙港国际店)', '杨国福麻辣烫(浙港国际店)', array[]::text[], '三墩', 1.24, 17, '火锅麻辣烫', 25, 4.2, 0, 0, 30.309019, 120.092687, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I1UX0XYL","name":"杨国福麻辣烫(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I1UX0XYL","name":"杨国福麻辣烫(浙港国际店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I1UX0XYL","name":"杨国福麻辣烫(浙港国际店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r072', '炙北哈尔滨自助盒饭地锅烤肉', '炙北哈尔滨自助盒饭地锅烤肉', array[]::text[], '西溪', 1.51, 20, '烧烤烤肉', 16, 4.3, 0, 0, 30.292811, 120.071289, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥16，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LA25MQ4A","name":"炙北哈尔滨自助盒饭地锅烤肉","query":{"type":"amap_around","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0LA25MQ4A","name":"炙北哈尔滨自助盒饭地锅烤肉","query":{"type":"amap_around","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0LA25MQ4A","name":"炙北哈尔滨自助盒饭地锅烤肉","query":{"type":"amap_around","keyword":"西餐","page":7},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r073', '巴比手工鲜包(浙港国际店)', '巴比手工鲜包(浙港国际店)', array[]::text[], '三墩', 1.3, 17, '快餐小吃', 11, 3.7, 0, 0, 30.308825, 120.093555, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥11，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L39SRWVP","name":"巴比手工鲜包(浙港国际店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0L39SRWVP","name":"巴比手工鲜包(浙港国际店)","query":{"type":"amap_around","keyword":"小吃","page":6},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r074', '魔锅坊麻辣香锅(紫金港店)', '魔锅坊麻辣香锅(紫金港店)', array[]::text[], '紫金港东门', 1.24, 17, '校内食堂', 26, 4.2, 0, 0, 30.310517, 120.091208, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥26，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFZP6LC","name":"魔锅坊麻辣香锅(紫金港店)","query":{"type":"amap_around","keyword":"中餐","page":3},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFFZP6LC","name":"魔锅坊麻辣香锅(紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r075', '青蔬麻辣烫(港湾家园店)', '青蔬麻辣烫(港湾家园店)', array[]::text[], '三墩', 0.88, 12, '火锅麻辣烫', 24, 3.4, 0, 0, 30.310647, 120.082352, '辣', '#c84b35', array['正餐', '近', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.4，人均约 ¥24，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","keyword":"小吃","page":1},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","keyword":"西餐","page":1},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r076', '河间驴肉火烧(西溪银泰城店)', '河间驴肉火烧(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '快餐小吃', 21, 4.1, 0, 0, 30.29269, 120.074583, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKUAT3AB","name":"河间驴肉火烧(西溪银泰城店)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0HKUAT3AB","name":"河间驴肉火烧(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HKUAT3AB","name":"河间驴肉火烧(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":8},"fetched_at":"2026-05-09T15:16:33.432Z"}]'::jsonb, 'published'
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
  'r077', '土家酱香饼(西溪银泰城店)', '土家酱香饼(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '快餐小吃', 14, 3.8, 0, 0, 30.292341, 120.07524, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥14，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":7},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":8},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r078', '汉堡王(杭州华策中心)', '汉堡王(杭州华策中心)', array[]::text[], '西湖区', 1.46, 19, '异国简餐', 25, 4.5, 0, 0, 30.300331, 120.067035, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥25，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKOK0GI","name":"汉堡王(杭州华策中心)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFKOK0GI","name":"汉堡王(杭州华策中心)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r079', '沙县小吃', '沙县小吃', array[]::text[], '西溪', 1.44, 19, '快餐小吃', 20, 4.2, 0, 0, 30.293865, 120.071078, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHREZ53","name":"沙县小吃","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFHREZ53","name":"沙县小吃","query":{"type":"amap_around","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0FFHREZ53","name":"沙县小吃","query":{"type":"amap_around","keyword":"西餐","page":6},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r080', '老乡鸡(杭州西溪谷店)', '老乡鸡(杭州西溪谷店)', array[]::text[], '西溪', 1.51, 20, '快餐小吃', 24, 4.5, 0, 0, 30.290822, 120.074416, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥24，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IAY7Y1LS","name":"老乡鸡(杭州西溪谷店)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"}]'::jsonb, 'published'
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
  'r081', '沙县小吃(望月公寓店)', '沙县小吃(望月公寓店)', array[]::text[], '三墩', 1.43, 19, '快餐小吃', 16, 4, 0, 0, 30.313101, 120.090755, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥16，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF3Z23U","name":"沙县小吃(望月公寓店)","query":{"type":"amap_around","keyword":"快餐","page":2},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFF3Z23U","name":"沙县小吃(望月公寓店)","query":{"type":"amap_around","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r082', '甘其食(硒和云创店)', '甘其食(硒和云创店)', array[]::text[], '三墩', 1.85, 25, '快餐小吃', 9, 4.5, 0, 0, 30.315575, 120.069625, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 1.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L2S55R0C","name":"甘其食(硒和云创店)","query":{"type":"amap_around","keyword":"快餐","page":5},"fetched_at":"2026-05-09T15:16:33.431Z"}]'::jsonb, 'published'
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
  'r083', '塔斯汀中国汉堡(杭州市三坝地铁站店)', '塔斯汀中国汉堡(杭州市三坝地铁站店)', array[]::text[], '三墩', 1.56, 21, '异国简餐', 20, 4.4, 0, 0, 30.30002, 120.0979, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J6N9PJE8","name":"塔斯汀中国汉堡(杭州市三坝地铁站店)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0J6N9PJE8","name":"塔斯汀中国汉堡(杭州市三坝地铁站店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r084', '老娘舅(杭州双龙街西溪银泰店)', '老娘舅(杭州双龙街西溪银泰店)', array[]::text[], '西溪', 1.27, 17, '快餐小吃', 31, 4.3, 0, 0, 30.293025, 120.075043, '饭', '#f0aa38', array['正餐', '人均50内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥31，距离紫金港约 1.3km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"中餐","page":4},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"中餐","page":5},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T15:16:33.436Z"}]'::jsonb, 'published'
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
  'r085', '一休家饭团(西溪银泰店)', '一休家饭团(西溪银泰店)', array[]::text[], '西溪', 1.22, 16, '异国简餐', 17, 3.6, 0, 0, 30.293665, 120.074871, '异', '#4d79b8', array['正餐', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","keyword":"小吃","page":4},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","keyword":"日料","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","keyword":"食堂","page":6},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r086', '肯德基(杭州西溪银泰城店)', '肯德基(杭州西溪银泰城店)', array[]::text[], '西溪', 1.25, 17, '异国简餐', 35, 4.4, 0, 0, 30.293243, 120.075073, '饭', '#f0aa38', array['正餐', '人均50内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥35，距离紫金港约 1.2km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"小吃","page":5},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"西餐","page":3},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","keyword":"食堂","page":7},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r087', '喻老头正宗重庆麻辣烫', '喻老头正宗重庆麻辣烫', array[]::text[], '三墩', 1.59, 21, '火锅麻辣烫', 25, 4.6, 0, 0, 30.302084, 120.098467, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥25，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I0PP0X33","name":"喻老头正宗重庆麻辣烫","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I0PP0X33","name":"喻老头正宗重庆麻辣烫","query":{"type":"amap_around","keyword":"自选快餐","page":3},"fetched_at":"2026-05-09T15:16:33.435Z"}]'::jsonb, 'published'
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
  'r088', '顺旺基(世纪中心店)', '顺旺基(世纪中心店)', array[]::text[], '西溪', 1.55, 21, '烧烤烤肉', 20, 4.3, 0, 0, 30.292813, 120.070686, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '烧烤', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥20，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T15:16:33.436Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r089', '西火火川派小火锅(杭州西溪银泰城东区店)', '西火火川派小火锅(杭州西溪银泰城东区店)', array[]::text[], '西溪', 1.18, 16, '火锅麻辣烫', 39, 4.4, 0, 0, 30.293787, 120.075451, '辣', '#c84b35', array['正餐', '人均50内', '辣', '火锅', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥39，距离紫金港约 1.2km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"餐饮","page":8},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"火锅","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","keyword":"食堂","page":4},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r090', '麦当劳(三坝耀江文鼎苑餐厅)', '麦当劳(三坝耀江文鼎苑餐厅)', array[]::text[], '文新', 1.56, 21, '异国简餐', 28, 4.6, 0, 0, 30.299075, 120.097625, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥28，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r091', '食其家·牛丼咖喱(文鼎财富店)', '食其家·牛丼咖喱(文鼎财富店)', array[]::text[], '三墩', 1.57, 21, '异国简餐', 23, 4.4, 0, 0, 30.298638, 120.097634, '异', '#4d79b8', array['正餐', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2BASAA3","name":"食其家·牛丼咖喱(文鼎财富店)","query":{"type":"amap_around","keyword":"日料","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r092', '聚串门儿-东北烧烤.铜锅涮肉', '聚串门儿-东北烧烤.铜锅涮肉', array[]::text[], '剑桥公社', 1.16, 15, '烧烤烤肉', 44, 4.5, 0, 0, 30.305259, 120.09364, '辣', '#c84b35', array['正餐', '人均50内', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥44，距离紫金港约 1.2km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"餐饮","page":6},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"中餐","page":2},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"火锅","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","keyword":"食堂","page":3},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r093', '肯德基(杭州紫霞街店)', '肯德基(杭州紫霞街店)', array[]::text[], '紫金港南门', 1.52, 20, '异国简餐', 28, 4.5, 0, 0, 30.29038, 120.075335, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IDX70ZT1","name":"肯德基(杭州紫霞街店)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0IDX70ZT1","name":"肯德基(杭州紫霞街店)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r094', '汉堡王(杭州西溪首座)', '汉堡王(杭州西溪首座)', array[]::text[], '西溪', 1.58, 21, '异国简餐', 28, 4.6, 0, 0, 30.289998, 120.074789, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥28，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIBHRW1","name":"汉堡王(杭州西溪首座)","query":{"type":"amap_around","keyword":"快餐","page":3},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0FFIBHRW1","name":"汉堡王(杭州西溪首座)","query":{"type":"amap_around","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r095', '浙大北门烧烤(紫金创业园B座店)', '浙大北门烧烤(紫金创业园B座店)', array[]::text[], '西湖区', 0.84, 11, '烧烤烤肉', 55, 4.3, 0, 0, 30.308367, 120.076121, '辣', '#c84b35', array['正餐', '近', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥55，距离紫金港约 0.8km；当前标签为 正餐、近、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"}]'::jsonb, 'published'
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
  'r096', '喜三叔·烤肉卷饼·肉筋卷饼', '喜三叔·烤肉卷饼·肉筋卷饼', array[]::text[], '三墩', 1.44, 19, '烧烤烤肉', 14, 3.7, 0, 0, 30.314987, 120.076955, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥14，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K0H4DTNO","name":"喜三叔·烤肉卷饼·肉筋卷饼","query":{"type":"amap_around","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0K0H4DTNO","name":"喜三叔·烤肉卷饼·肉筋卷饼","query":{"type":"amap_around","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r097', '冒大仙火锅冒菜(剑桥公社店)', '冒大仙火锅冒菜(剑桥公社店)', array[]::text[], '剑桥公社', 1.18, 16, '火锅麻辣烫', 24, 3.6, 0, 0, 30.305387, 120.093836, '辣', '#c84b35', array['正餐', '实惠', '人均30内', '辣', '火锅', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥24，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"餐饮","page":8},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"快餐","page":1},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"小吃","page":3},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"冒菜","page":1},"fetched_at":"2026-05-09T15:16:33.435Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","keyword":"火锅","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r098', '叹今生酒馆小火锅(西溪银泰城店)', '叹今生酒馆小火锅(西溪银泰城店)', array[]::text[], '西溪', 1.32, 18, '火锅麻辣烫', 35, 4.3, 0, 0, 30.292775, 120.074525, '辣', '#c84b35', array['正餐', '人均50内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥35，距离紫金港约 1.3km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L05RU4HB","name":"叹今生酒馆小火锅(西溪银泰城店)","query":{"type":"amap_around","keyword":"火锅","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0L05RU4HB","name":"叹今生酒馆小火锅(西溪银泰城店)","query":{"type":"amap_around","keyword":"西餐","page":4},"fetched_at":"2026-05-09T15:16:33.441Z"}]'::jsonb, 'published'
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
  'r099', '李桑炭火烤肉(浙大紫金港店)', '李桑炭火烤肉(浙大紫金港店)', array[]::text[], '紫金港东门', 1.15, 15, '烧烤烤肉', 111, 4.6, 0, 0, 30.306415, 120.093141, '辣', '#c84b35', array['正餐', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥111，距离紫金港约 1.1km；当前标签为 正餐、辣、烧烤，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":6},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T15:16:33.438Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","keyword":"食堂","page":3},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"web_clue","keyword":"李桑炭火烤肉 浙大紫金港","title":"李桑炭火烤肉(浙大紫金港店) Trip.com 餐厅页","url":"https://hk.trip.com/restaurant/china/hangzhou/detail/restaurant-142213787","publishedAt":"2025-06-24"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r100', '意式披萨店', '意式披萨店', array[]::text[], '三墩', 1.17, 16, '异国简餐', 42, 4.3, 0, 0, 30.308384, 120.092223, '异', '#4d79b8', array['正餐', '人均50内', '快餐', '一人食', '异国料理']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥42，距离紫金港约 1.2km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HRA5M7GK","name":"意式披萨店","query":{"type":"amap_around","keyword":"餐饮","page":7},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0HRA5M7GK","name":"意式披萨店","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0HRA5M7GK","name":"意式披萨店","query":{"type":"amap_around","keyword":"西餐","page":2},"fetched_at":"2026-05-09T15:16:33.441Z"}]'::jsonb, 'published'
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
  'r101', '华莱士·全鸡汉堡(蒋村龙湖店)', '华莱士·全鸡汉堡(蒋村龙湖店)', array[]::text[], '紫金港南门', 1.75, 23, '异国简餐', 18, 4.3, 0, 0, 30.293696, 120.067121, '饭', '#f0aa38', array['正餐', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥18，距离紫金港约 1.7km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HD0CZ0U6","name":"华莱士·全鸡汉堡(蒋村龙湖店)","query":{"type":"amap_around","keyword":"快餐","page":4},"fetched_at":"2026-05-09T15:16:33.431Z"},{"type":"amap_poi","poi_id":"B0HD0CZ0U6","name":"华莱士·全鸡汉堡(蒋村龙湖店)","query":{"type":"amap_around","keyword":"炸鸡","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0HD0CZ0U6","name":"华莱士·全鸡汉堡(蒋村龙湖店)","query":{"type":"amap_around","keyword":"汉堡","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"}]'::jsonb, 'published'
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
  'r102', '宋小样·锦州烧烤(紫金港店)', '宋小样·锦州烧烤(紫金港店)', array[]::text[], '剑桥公社', 1.33, 18, '校内食堂', 57, 4.5, 0, 0, 30.305896, 120.095365, '辣', '#c84b35', array['正餐', '辣', '烧烤', '聚餐', '夜宵', '食堂', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥57，距离紫金港约 1.3km；当前标签为 正餐、辣、烧烤，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L167SMRJ","name":"宋小样·锦州烧烤(紫金港店)","query":{"type":"amap_around","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T15:16:33.437Z"},{"type":"amap_poi","poi_id":"B0L167SMRJ","name":"宋小样·锦州烧烤(紫金港店)","query":{"type":"amap_around","keyword":"烤肉","page":2},"fetched_at":"2026-05-09T15:16:33.438Z"}]'::jsonb, 'published'
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
  'r103', '古茗(浙大银泉校内店)', '古茗(浙大银泉校内店)', array[]::text[], '校内', 0.75, 10, '茶饮', 16, 4.4, 0, 0, 30.306192, 120.075274, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","keyword":"食堂","page":1},"fetched_at":"2026-05-09T15:16:33.442Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"web_clue","keyword":"银泉餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T15:16:33.443Z"}]'::jsonb, 'published'
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
  'r104', '库迪咖啡(浙大紫金港启真湖店)', '库迪咖啡(浙大紫金港启真湖店)', array[]::text[], '校内', 0.37, 5, '茶饮', 9, 4.4, 0, 0, 30.304241, 120.085384, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.428Z"},{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r105', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', array[]::text[], '校内', 0.4, 5, '茶饮', 13, 4.6, 0, 0, 30.304294, 120.085681, '甜', '#d9915d', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥13，距离紫金港约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.428Z"},{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r106', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', array[]::text[], '校内', 0.56, 7, '咖啡', 17, 4.5, 0, 0, 30.298056, 120.07996, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.428Z"},{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r107', '麦思威咖啡', '麦思威咖啡', array[]::text[], '校内', 0.72, 10, '咖啡', 14, 4.5, 0, 0, 30.302666, 120.089435, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r108', '一鸣真鲜奶吧(浙大紫金港经济学院店)', '一鸣真鲜奶吧(浙大紫金港经济学院店)', array[]::text[], '校内', 0.63, 8, '茶饮', 14, 4.3, 0, 0, 30.297791, 120.078919, '甜', '#d9915d', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L125U1KT","name":"一鸣真鲜奶吧(浙大紫金港经济学院店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"}]'::jsonb, 'published'
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
  'r109', '瑞幸咖啡(浙大医学院店)', '瑞幸咖啡(浙大医学院店)', array[]::text[], '紫金港周边', 0.79, 11, '咖啡', 14, 4.5, 0, 0, 30.295967, 120.084462, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.8km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r110', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', array[]::text[], '校内', 0.7, 9, '咖啡', 13, 4.2, 0, 0, 30.308075, 120.085925, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r111', '库迪咖啡(浙大紫金港成均苑店)', '库迪咖啡(浙大紫金港成均苑店)', array[]::text[], '紫金港南门', 0.7, 9, '咖啡', 13, 4.1, 0, 0, 30.297215, 120.078576, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r112', '吉利烘焙(浙江大学紫金港店)', '吉利烘焙(浙江大学紫金港店)', array[]::text[], '校内', 0.7, 9, '甜品烘焙', 13, 4.1, 0, 0, 30.309001, 120.083047, '甜', '#d9915d', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '甜品', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189B4","name":"吉利烘焙(浙江大学紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T15:16:33.429Z"}]'::jsonb, 'published'
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
  'r113', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', array[]::text[], '校内', 0.8, 11, '茶饮', 15, 4.3, 0, 0, 30.30906, 120.085999, '甜', '#d9915d', array['饮品', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥15，距离紫金港约 0.8km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKW58RH","name":"一鸣真鲜奶吧(杭州浙大紫金翠柏店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"}]'::jsonb, 'published'
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
  'r114', '瑞幸咖啡(浙江大学紫金港校区店)', '瑞幸咖啡(浙江大学紫金港校区店)', array[]::text[], '校内', 1.05, 14, '咖啡', 9, 4.5, 0, 0, 30.297848, 120.091314, '咖', '#8c6338', array['饮品', '实惠', '人均30内', '校内', '拍照', '咖啡', '甜品', '轻负担']::text[], array['约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡', '甜品']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 1.1km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r115', '瑞幸咖啡(紫金创业园B幢店)', '瑞幸咖啡(紫金创业园B幢店)', array[]::text[], '西湖区', 0.86, 12, '咖啡', 16, 4.4, 0, 0, 30.308421, 120.075783, '咖', '#8c6338', array['饮品', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.9km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r116', '库迪咖啡(浙大紫金港校区店)', '库迪咖啡(浙大紫金港校区店)', array[]::text[], '校内', 1.04, 14, '茶饮', 9, 4.4, 0, 0, 30.309464, 120.089591, '咖', '#8c6338', array['饮品', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 1.0km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'r117', '蜜雪冰城(望月店)', '蜜雪冰城(望月店)', array[]::text[], '三墩', 1.18, 16, '茶饮', 8, 4.6, 0, 0, 30.309906, 120.091092, '咖', '#8c6338', array['饮品', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '约会拍照']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥8，距离紫金港约 1.2km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFZY4TW","name":"蜜雪冰城(望月店)","query":{"type":"amap_around","keyword":"餐饮","page":8},"fetched_at":"2026-05-09T15:16:33.430Z"},{"type":"amap_poi","poi_id":"B0FFFZY4TW","name":"蜜雪冰城(望月店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r118', '蜜雪冰城(杭州旗舰店)', '蜜雪冰城(杭州旗舰店)', array[]::text[], '西溪', 1.31, 17, '茶饮', 8, 4.8, 0, 0, 30.292126, 120.076082, '咖', '#8c6338', array['饮品', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '约会拍照']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥8，距离紫金港约 1.3km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HR0ZVB08","name":"蜜雪冰城(杭州旗舰店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r119', '厝内小眷村(浙大紫金港店)', '厝内小眷村(浙大紫金港店)', array[]::text[], '校内', 1.09, 15, '茶饮', 16, 4.6, 0, 0, 30.309626, 120.090079, '甜', '#d9915d', array['饮品', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 1.1km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T15:16:33.440Z"}]'::jsonb, 'published'
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
  'r120', '花哥饮品(紫金港店)', '花哥饮品(紫金港店)', array[]::text[], '紫金港东门', 1.12, 15, '茶饮', 15, 4.6, 0, 0, 30.309722, 120.090333, '甜', '#d9915d', array['饮品', '实惠', '人均30内', '拍照', '甜品', '奶茶', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '下午茶', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照']::text[], array[]::text[], array['小吃', '拍照', '快餐', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥15，距离紫金港约 1.1km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIVMBMX","name":"花哥饮品(紫金港店)","query":{"type":"amap_around","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T15:16:33.429Z"},{"type":"amap_poi","poi_id":"B0FFIVMBMX","name":"花哥饮品(紫金港店)","query":{"type":"amap_around","keyword":"小吃","page":2},"fetched_at":"2026-05-09T15:16:33.432Z"},{"type":"amap_poi","poi_id":"B0FFIVMBMX","name":"花哥饮品(紫金港店)","query":{"type":"amap_around","keyword":"甜品","page":1},"fetched_at":"2026-05-09T15:16:33.439Z"}]'::jsonb, 'published'
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
  'rv_r002_internet', 'r002', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥30，地址为余杭塘路925号澄月食堂3层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r003_internet', 'r003', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3、人均约 ¥14，地址为泰和路港湾家园29幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r004_internet', 'r004', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为申花路796号紫金港国际饭店1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r005_internet', 'r005', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥14，地址为三墩镇余杭塘路866号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r006_internet', 'r006', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥23，地址为三墩镇龙宇街望月商品17号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r007_internet', 'r007', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为三墩镇余杭塘路866号浙江大学紫金港校区医学院图书馆旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r008_internet', 'r008', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥30，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r009_internet', 'r009', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥20，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r010_internet', 'r010', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为余杭塘路866号浙江大学紫金港校区银泉餐厅一楼C区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r011_internet', 'r011', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥12，地址为三墩镇望月公寓商业用房29号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r012_internet', 'r012', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥13，地址为三墩镇龙宇街望月商铺11号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r013_internet', 'r013', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥14，地址为龙宇街望月商铺4号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r014_internet', 'r014', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为望月商铺28号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r015_internet', 'r015', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.8、人均约 ¥44，地址为余杭塘路866号浙江大学紫金港校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r016_internet', 'r016', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥16，地址为石祥西路港湾家园29幢3单元1层1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r017_internet', 'r017', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r018_internet', 'r018', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为三墩镇望月公寓商业用房60-64号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r019_internet', 'r019', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为三墩紫荆花城2号楼128室内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r020_internet', 'r020', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为浙港国际1号楼136室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r021_internet', 'r021', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥19，地址为浙港国际2号楼109号(虾龙圩地铁站B口步行490米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r022_internet', 'r022', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥19，地址为余杭塘路与崇仁路交叉口西溪银泰城B1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r023_internet', 'r023', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥26，地址为紫荆花北路188号4幢一层麦当劳餐厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r024_internet', 'r024', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为望月公寓12号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r025_internet', 'r025', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥19，地址为紫荆花北路139,137号望月公寓桂花苑。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r026_internet', 'r026', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥24，地址为申花路798号1层1017室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r027_internet', 'r027', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为望月商铺49号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r028_internet', 'r028', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥9，地址为三墩镇萍水西街197号(三坝地铁站D口步行340米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r029_internet', 'r029', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥19，地址为港湾家园29幢。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r030_internet', 'r030', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥12，地址为双龙街588号银泰城F1层2幢118号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r031_internet', 'r031', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥23，地址为龙宇街望月公寓16号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r032_internet', 'r032', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥23，地址为三墩紫荆花城2号楼123号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r033_internet', 'r033', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥20，地址为盛龙街浙港国际2幢101室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r034_internet', 'r034', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥31，地址为余杭塘路688号浙大紫金港校区西区管理学院新大楼A座1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r035_internet', 'r035', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥19，地址为望月公寓樱花苑望月商铺52号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r036_internet', 'r036', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥21，地址为萃紫街69号德萃公寓。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r037_internet', 'r037', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为蒋村街道西溪银泰商业中心2号楼东楼133室(海底捞楼上)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r038_internet', 'r038', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥19，地址为三墩镇浙港国际2号楼122室-1。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r039_internet', 'r039', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥12，地址为三墩镇紫荆花北路188号3幢108室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r040_internet', 'r040', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥28，地址为申花路六北38号剑桥公社C-18-1。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r041_internet', 'r041', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为双龙街588号杭州西溪银泰城F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r042_internet', 'r042', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥19，地址为紫金创业园B座101-105室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r043_internet', 'r043', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为双龙街588号杭州西溪银泰城西区(弘德路店)B1层BF022。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r044_internet', 'r044', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥22，地址为紫荆花北路139号,137号望月公寓桂花苑。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r045_internet', 'r045', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为三墩镇望月公寓商业用房47号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r046_internet', 'r046', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥28，地址为三墩镇紫蝶苑10号楼206室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r047_internet', 'r047', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥9，地址为望月公寓东4门南120米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r048_internet', 'r048', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥18，地址为盛龙街浙港国际1号楼140号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r049_internet', 'r049', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥30，地址为望月商铺5-6号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r050_internet', 'r050', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为三墩镇望月公寓商业用房30号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r051_internet', 'r051', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为三墩镇望月公寓商业用房75号铺位1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r052_internet', 'r052', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥33，地址为港湾家园西区18幢5号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r053_internet', 'r053', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为余杭塘路与崇仁路交叉口西溪银泰城地下一层铺位号BF038。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r054_internet', 'r054', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥33，地址为三墩镇港湾家园29幢3单元1楼7号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r055_internet', 'r055', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥13，地址为双龙街588号杭州西溪银泰城西区弘德路店F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r056_internet', 'r056', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥20，地址为望月公寓23号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r057_internet', 'r057', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥12，地址为乾成园东北1门旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r058_internet', 'r058', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥30，地址为双龙街588号西溪银泰城1号楼负一层B048号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r059_internet', 'r059', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥25，地址为望月公寓东4门南110米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r060_internet', 'r060', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥25，地址为双龙街西溪银泰城1号楼南-3-124室(蜜雪冰城隔壁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r061_internet', 'r061', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥21，地址为2-东116(浙大紫金港地铁站B1口步行270米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r062_internet', 'r062', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥23，地址为三墩镇紫金花北路163号望月公寓商业用房165号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r063_internet', 'r063', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥24，地址为西溪银泰2号楼南楼126室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r064_internet', 'r064', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为三墩镇集萃路25号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r065_internet', 'r065', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥18，地址为浙港国际(虾龙圩地铁站B口步行420米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r066_internet', 'r066', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥25，地址为三墩镇古墩路673号瑞博国际大厦。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r067_internet', 'r067', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥25，地址为申花路781号商铺(虾龙圩地铁站C口步行490米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r068_internet', 'r068', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥21，地址为浙港国际(虾龙圩地铁站B口步行480米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r069_internet', 'r069', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥26，地址为剑桥公社C座3幢16号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r070_internet', 'r070', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥23，地址为双龙街588号杭州西溪银泰城西区(弘德路店)B1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r071_internet', 'r071', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥25，地址为三墩镇紫荆花城2号楼120室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r072_internet', 'r072', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥16，地址为西溪世纪中心1幢128室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r073_internet', 'r073', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥11，地址为浙港国际一号楼102。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r074_internet', 'r074', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥26，地址为三墩镇望月商铺77号(紫荆花北路)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r075_internet', 'r075', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.4、人均约 ¥24，地址为港湾家园西区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r076_internet', 'r076', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥21，地址为西溪银泰商业中心2-东137室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r077_internet', 'r077', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥14，地址为双龙街588号杭州西溪银泰城F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r078_internet', 'r078', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥25，地址为五常港路442号444号华策中心9号一层101/102号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r079_internet', 'r079', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为蒋村街道西溪世纪中心2号楼123室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r080_internet', 'r080', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥24，地址为西溪谷国际商务中心店一楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r081_internet', 'r081', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥16，地址为三墩镇望月公寓商业用房130号一楼紫荆花北路183号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r082_internet', 'r082', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为西园五路2号西园紫行大厦2-109室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r083_internet', 'r083', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为2号线三坝地铁站C01商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r084_internet', 'r084', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥31，地址为双龙街西溪银泰商业中心1号楼地下一层BF016A室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r085_internet', 'r085', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥17，地址为蒋村街道晴川街西溪银泰商业中心1号楼地下一层BF112室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r086_internet', 'r086', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥35，地址为西溪银泰城地下一层商铺BF052-054号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r087_internet', 'r087', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥25，地址为古墩路616号同人精华F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r088_internet', 'r088', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥20，地址为蒋村街道西溪世纪中心1-1151-116号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r089_internet', 'r089', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥39，地址为西溪银泰城负一楼B1035。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r090_internet', 'r090', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥28，地址为古墩路657号(三坝地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r091_internet', 'r091', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为古墩路651号文鼎财富F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r092_internet', 'r092', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥44，地址为三墩镇申花路789号剑桥公社B座4号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r093_internet', 'r093', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为紫霞街崇仁路口(公交站)后面的肯德基。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r094_internet', 'r094', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥28，地址为蒋村街道文一西路588号西溪首座5幢楼111室商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r095_internet', 'r095', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥55，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r096_internet', 'r096', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥14，地址为振华路189号紫润国际。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r097_internet', 'r097', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥24，地址为杭州龙申综合发展中心2幢一层8号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r098_internet', 'r098', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥35，地址为西溪银泰商业中心2号楼东楼144海底捞楼上。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r099_internet', 'r099', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥111，地址为申花路798号1楼门面。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r100_internet', 'r100', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥42，地址为万塘路40号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r101_internet', 'r101', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥18，地址为花蒋天街8号楼109室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r102_internet', 'r102', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥57，地址为申花路759号剑桥公社E座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r103_internet', 'r103', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为浙江大学紫金港校区银泉食堂对面1幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r104_internet', 'r104', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为余杭塘路866号浙江大学紫金港校区浙大超市启真湖店内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r105_internet', 'r105', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥13，地址为三墩镇浙江大学紫金港校区学生活动中心B1号楼106。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r106_internet', 'r106', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为紫金港路浙大紫金港校区文科组团人文学院大楼一层大厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r107_internet', 'r107', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为余杭塘路866号浙江大学紫金港校区东二教学楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r108_internet', 'r108', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥14，地址为余杭塘路929号浙江大学紫金港校区成均苑7幢一层1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r109_internet', 'r109', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为浙大医学院店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r110_internet', 'r110', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥13，地址为余杭塘路866号浙江大学紫金港校区白沙综合楼二楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r111_internet', 'r111', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路与紫金港路隧道交叉口西320米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r112_internet', 'r112', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路388号浙大紫金港校区蓝田6幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r113_internet', 'r113', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥15，地址为浙大紫金港校区翠柏1舍1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r114_internet', 'r114', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为浙江大学紫金港校区店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r115_internet', 'r115', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r116_internet', 'r116', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为三墩镇望月公寓20号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r117_internet', 'r117', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥8，地址为育英路望月公寓55号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r118_internet', 'r118', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.8、人均约 ¥8，地址为西溪银泰城1号楼3-南112室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r119_internet', 'r119', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为三墩镇浙大紫金港望月公寓南门32A号(浙大紫金港校区坠落街)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r120_internet', 'r120', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥15，地址为望月商铺35号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
