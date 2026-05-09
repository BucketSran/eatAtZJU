-- Generated from seed/*.json by scripts/generate-supabase-seed.cjs.
-- Re-run `npm run seed:sql:write` after editing seed JSON.
begin;

delete from public.dishes where id ~ '^d[0-9]{5}$';
delete from public.reviews where id ~ '^rv[0-9]{5}$';
update public.restaurants set status = 'archived' where id ~ '^r[0-9]+$' and id not in ('r001', 'r002', 'r003', 'r004', 'r005', 'r006', 'r007', 'r008', 'r009', 'r010', 'r011', 'r012', 'r013', 'r014', 'r015', 'r016', 'r017', 'r018', 'r019', 'r020', 'r021', 'r022', 'r023', 'r024', 'r025', 'r026', 'r027', 'r028', 'r029', 'r030', 'r031', 'r032', 'r033', 'r034', 'r035', 'r036', 'r037', 'r038', 'r039', 'r040', 'r041', 'r042', 'r043', 'r044', 'r045', 'r046', 'r047', 'r048', 'r049', 'r050', 'r051', 'r052', 'r053', 'r054', 'r055', 'r056', 'r057', 'r058', 'r059', 'r060', 'r061', 'r062', 'r063', 'r064', 'r065', 'r066', 'r067', 'r068', 'r069', 'r070', 'r071', 'r072', 'r073', 'r074', 'r075', 'r076', 'r077', 'r078', 'r079', 'r080', 'r081', 'r082', 'r083', 'r084', 'r085', 'r086', 'r087', 'r088', 'r089', 'r090', 'r091', 'r092', 'r093', 'r094', 'r095', 'r096', 'r097', 'r098', 'r099', 'r100', 'r101', 'r102', 'r103', 'r104', 'r105', 'r106', 'r107', 'r108', 'r109', 'r110', 'r111', 'r112', 'r113', 'r114', 'r115', 'r116', 'r117', 'r118', 'r119', 'r120', 'r121', 'r122', 'r123', 'r124', 'r125', 'r126', 'r127', 'r128', 'r129', 'r130', 'r131', 'r132', 'r133', 'r134', 'r135', 'r136', 'r137', 'r138', 'r139', 'r140', 'r141', 'r142', 'r143', 'r144', 'r145', 'r146', 'r147', 'r148', 'r149', 'r150', 'r151', 'r152', 'r153', 'r154', 'r155', 'r156', 'r157', 'r158', 'r159', 'r160', 'r161', 'r162', 'r163', 'r164', 'r165', 'r166', 'r167', 'r168', 'r169', 'r170', 'r171', 'r172', 'r173', 'r174', 'r175', 'r176', 'r177', 'r178', 'r179', 'r180', 'r181', 'r182', 'r183', 'r184', 'r185', 'r186', 'r187', 'r188', 'r189', 'r190', 'r191', 'r192', 'r193', 'r194', 'r195', 'r196', 'r197', 'r198', 'r199', 'r200', 'r201', 'r202', 'r203', 'r204', 'r205', 'r206', 'r207', 'r208', 'r209', 'r210', 'r211', 'r212', 'r213', 'r214', 'r215', 'r216', 'r217', 'r218', 'r219', 'r220', 'r221', 'r222', 'r223', 'r224', 'r225', 'r226', 'r227', 'r228', 'r229', 'r230', 'r231', 'r232', 'r233', 'r234', 'r235', 'r236', 'r237', 'r238', 'r239', 'r240', 'r241', 'r242', 'r243', 'r244', 'r245', 'r246', 'r247', 'r248', 'r249', 'r250', 'r251', 'r252', 'r253', 'r254', 'r255', 'r256', 'r257', 'r258', 'r259', 'r260', 'r261', 'r262', 'r263', 'r264', 'r265', 'r266', 'r267', 'r268', 'r269', 'r270', 'r271', 'r272', 'r273', 'r274', 'r275', 'r276', 'r277', 'r278', 'r279', 'r280', 'r281', 'r282');

insert into public.restaurants (
  id, name, canonical_name, aliases, area, distance, walk_minutes, cuisine, price, rating, student_score, checkins, latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes, meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs, status
) values (
  'r001', '紫金港餐饮中心临湖餐厅', '紫金港餐饮中心临湖餐厅', array[]::text[], '紫金港校内', 0.37, 5, '校内食堂', 23, 4, 0, 0, 30.303725, 120.085675, '校', '#4f8b65', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥23，距离紫金港约 0.4km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"},{"type":"amap_poi","poi_id":"B0FFI40DNI","name":"紫金港餐饮中心临湖餐厅","query":{"type":"web_clue","campus":"紫金港","keyword":"临湖餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r002', '浙大紫金港澄月食堂(留学生食堂)', '浙大紫金港澄月食堂(留学生食堂)', array[]::text[], '紫金港校内', 0.73, 10, '校内食堂', 30, 4.7, 0, 0, 30.296587, 120.079467, '辣', '#c84b35', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '辣', '火锅', '面食', '暖胃']::text[], array['赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '暖胃', '面食', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"},{"type":"amap_poi","poi_id":"B0FFJVVCQS","name":"浙大紫金港澄月食堂(留学生食堂)","query":{"type":"web_clue","campus":"紫金港","keyword":"澄月餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引饮食消费页","url":"https://zjuers.com/welcome/life/canteen/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r003', '吉祥馄饨(杭州浙大紫金港店)', '吉祥馄饨(杭州浙大紫金港店)', array[]::text[], '紫金港校内', 0.87, 12, '面食粉面', 14, 3.3, 0, 0, 30.310541, 120.08236, '面', '#6d8fbd', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均约 ¥14，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"},{"type":"amap_poi","poi_id":"B0LRR7L9J8","name":"吉祥馄饨(杭州浙大紫金港店)","query":{"type":"web_clue","campus":"紫金港","keyword":"Tony’s house 泰和路 浙江大学 紫金港","title":"Reddit 杭州餐厅推荐提到 Tony’s House 与紫金港","url":"https://www.reddit.com/r/hangzhou/comments/1jdcfb1","publishedAt":"2025-03-18"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r004', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', '紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)', array[]::text[], '紫金港校内', 0.66, 9, '校内食堂', 16, 4.6, 0, 0, 30.307975, 120.085261, '面', '#6d8fbd', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐', '食堂']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFGFQZ3V","name":"紫金港餐饮中心-风味餐厅(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r005', '浙江大学(紫金港校区)休闲餐厅', '浙江大学(紫金港校区)休闲餐厅', array[]::text[], '紫金港校内', 0.6, 8, '中餐简餐', 14, 4.4, 0, 0, 30.30787, 120.084031, '校', '#4f8b65', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '轻负担']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '清爽', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['轻负担']::text[], array['清爽', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥14，距离紫金港约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFFDBG9V","name":"浙江大学(紫金港校区)休闲餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r006', '奈哥老坛酸菜鱼(望月店)', '奈哥老坛酸菜鱼(望月店)', array[]::text[], '三墩', 1.04, 14, '中餐简餐', 23, 3.8, 0, 0, 30.309487, 120.08956, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥23，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"},{"type":"amap_poi","poi_id":"B0LB2ZMQUO","name":"奈哥老坛酸菜鱼(望月店)","query":{"type":"web_clue","campus":"紫金港","keyword":"麦思威餐吧 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r007', '浙江大学紫金港校区麦香餐厅', '浙江大学紫金港校区麦香餐厅', array[]::text[], '紫金港校内', 0.88, 12, '面食粉面', 9, 4.5, 0, 0, 30.296297, 120.087222, '面', '#6d8fbd', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B023B189A7","name":"浙江大学紫金港校区麦香餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r008', '浙江大学紫金港校区东区食堂', '浙江大学紫金港校区东区食堂', array[]::text[], '紫金港校内', 0.66, 9, '校内食堂', 30, 4.7, 0, 0, 30.308133, 120.084763, '校', '#4f8b65', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFG6AI25","name":"浙江大学紫金港校区东区食堂","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r009', '浙江大学紫金港校区玉湖餐厅', '浙江大学紫金港校区玉湖餐厅', array[]::text[], '紫金港校内', 0.94, 13, '中餐简餐', 20, 4.6, 0, 0, 30.300096, 120.072625, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥20，距离紫金港约 0.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFLJUBYI","name":"浙江大学紫金港校区玉湖餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r010', '肯德基(浙大紫金港店)', '肯德基(浙大紫金港店)', array[]::text[], '紫金港校内', 0.69, 9, '异国简餐', 30, 4.5, 0, 0, 30.306459, 120.076215, '校', '#4f8b65', array['正餐', '紫金港', '近', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离紫金港约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0JD3S9527","name":"肯德基(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r011', '蔡家缙云烧饼&粥铺(紫金港店)', '蔡家缙云烧饼&粥铺(紫金港店)', array[]::text[], '紫金港东门', 1.07, 14, '快餐小吃', 12, 4.4, 0, 0, 30.309575, 120.089875, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥12，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFJNT7JU","name":"蔡家缙云烧饼&粥铺(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r012', '东北烤冷面', '东北烤冷面', array[]::text[], '三墩', 1.07, 14, '面食粉面', 13, 4.4, 0, 0, 30.309575, 120.089875, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥13，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFF63V1J","name":"东北烤冷面","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r013', '临榆炸鸡腿(浙大紫金港店)', '临榆炸鸡腿(浙大紫金港店)', array[]::text[], '紫金港校内', 1, 13, '异国简餐', 14, 4.3, 0, 0, 30.309322, 120.089133, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0JDBSJ3JL","name":"临榆炸鸡腿(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r014', '胡记牛肉汤(浙大店)', '胡记牛肉汤(浙大店)', array[]::text[], '三墩', 1.08, 14, '面食粉面', 16, 4.4, 0, 0, 30.309612, 120.089891, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0H10HVPZR","name":"胡记牛肉汤(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r015', '浙江大学紫金港校区银泉餐厅', '浙江大学紫金港校区银泉餐厅', array[]::text[], '紫金港校内', 0.67, 9, '面食粉面', 44, 4.8, 0, 0, 30.306373, 120.076373, '辣', '#c84b35', array['正餐', '紫金港', '近', '人均50内', '校内', '辣', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥44，距离紫金港约 0.7km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0I2G5F6T0","name":"浙江大学紫金港校区银泉餐厅","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r016', '逗牛士(港湾家园店)', '逗牛士(港湾家园店)', array[]::text[], '三墩', 0.86, 12, '中餐简餐', 16, 3.9, 0, 0, 30.310517, 120.082326, '饭', '#f0aa38', array['正餐', '紫金港', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥16，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFIC93QU","name":"逗牛士(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r017', '中国兰州拉面(紫金创业园B座店)', '中国兰州拉面(紫金创业园B座店)', array[]::text[], '西湖区', 0.85, 11, '面食粉面', 20, 4, 0, 0, 30.308232, 120.075743, '面', '#6d8fbd', array['正餐', '紫金港', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '清真友好', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['清真友好']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"清真","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0KGXKHX23","name":"中国兰州拉面(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r018', '柳星螺蛳粉(紫金港店)', '柳星螺蛳粉(紫金港店)', array[]::text[], '紫金港东门', 1.21, 16, '面食粉面', 17, 4.5, 0, 0, 30.310064, 120.091273, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0J2G18IWJ","name":"柳星螺蛳粉(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r019', '唐记老牌螺蛳粉(浙大店)', '唐记老牌螺蛳粉(浙大店)', array[]::text[], '三墩', 1.2, 16, '面食粉面', 18, 4.5, 0, 0, 30.308879, 120.092234, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGO55CFQ","name":"唐记老牌螺蛳粉(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r020', '三姊妹粉记', '三姊妹粉记', array[]::text[], '三墩', 1.23, 16, '面食粉面', 17, 4.5, 0, 0, 30.308641, 120.092765, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0L29SRX7Z","name":"三姊妹粉记","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r021', '梅记·老鸭粉丝馆(浙港国际店)', '梅记·老鸭粉丝馆(浙港国际店)', array[]::text[], '三墩', 1.25, 17, '面食粉面', 19, 4.6, 0, 0, 30.309034, 120.092734, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":4},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0HDLSV8P5","name":"梅记·老鸭粉丝馆(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r022', '小杨生煎(杭州西溪银泰店)', '小杨生煎(杭州西溪银泰店)', array[]::text[], '紫金港南门', 1.2, 16, '面食粉面', 19, 4.5, 0, 0, 30.293835, 120.074896, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFIJQ429","name":"小杨生煎(杭州西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r023', '麦当劳(宝港生活广场店)', '麦当劳(宝港生活广场店)', array[]::text[], '三墩', 1.1, 15, '异国简餐', 26, 4.6, 0, 0, 30.306562, 120.092588, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥26，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0GK1GVETF","name":"麦当劳(宝港生活广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r024', '煮赣派·老南昌水煮(浙大紫金港店)', '煮赣派·老南昌水煮(浙大紫金港店)', array[]::text[], '紫金港校内', 1.03, 14, '中餐简餐', 20, 4.2, 0, 0, 30.309461, 120.089367, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0L3J5EAFP","name":"煮赣派·老南昌水煮(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r025', '潮禧肠粉店(望月公寓店)', '潮禧肠粉店(望月公寓店)', array[]::text[], '三墩', 1, 13, '面食粉面', 19, 4.1, 0, 0, 30.309325, 120.089125, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '暖胃', '面食', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥19，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0L0YC74FN","name":"潮禧肠粉店(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r026', '徐老友·老友粉(杭州紫金港店)', '徐老友·老友粉(杭州紫金港店)', array[]::text[], '紫金港东门', 1.16, 16, '面食粉面', 24, 4.6, 0, 0, 30.306455, 120.093288, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥24，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0LUG7LNOK","name":"徐老友·老友粉(杭州紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r027', '皇家烤猪蹄(望月公寓樱花苑店)', '皇家烤猪蹄(望月公寓樱花苑店)', array[]::text[], '三墩', 1.16, 15, '中餐简餐', 20, 4.4, 0, 0, 30.309818, 120.09085, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFHDX9CC","name":"皇家烤猪蹄(望月公寓樱花苑店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r028', '馅佳面(萍水西街)', '馅佳面(萍水西街)', array[]::text[], '三墩', 1.3, 17, '面食粉面', 9, 4.2, 0, 0, 30.299618, 120.095026, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥9，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","campus":"紫金港","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0FFH0UKLO","name":"馅佳面(萍水西街)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":3},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r029', '宏利美食城', '宏利美食城', array[]::text[], '三墩', 0.86, 11, '中餐简餐', 19, 3.8, 0, 0, 30.3105, 120.082386, '饭', '#f0aa38', array['正餐', '紫金港', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥19，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFFDCN9B","name":"宏利美食城","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r030', '滕州菜煎饼(西溪银泰城店)', '滕州菜煎饼(西溪银泰城店)', array[]::text[], '西溪', 1.34, 18, '中餐简餐', 12, 4.4, 0, 0, 30.292614, 120.074385, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥12，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G1OZF4EA","name":"滕州菜煎饼(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r031', '巴蜀王氏现捞', '巴蜀王氏现捞', array[]::text[], '三墩', 1.05, 14, '中餐简餐', 23, 4.3, 0, 0, 30.309502, 120.089577, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣']::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥23，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J26R2D6N","name":"巴蜀王氏现捞","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0J26R2D6N","name":"巴蜀王氏现捞","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r032', '柳州肥姨妈大骨螺蛳粉(浙大店)', '柳州肥姨妈大骨螺蛳粉(浙大店)', array[]::text[], '三墩', 1.23, 16, '面食粉面', 23, 4.6, 0, 0, 30.308959, 120.092499, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥23，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JGSRE2QV","name":"柳州肥姨妈大骨螺蛳粉(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0JGSRE2QV","name":"柳州肥姨妈大骨螺蛳粉(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r033', '德泓面馆(浙港国际店)', '德泓面馆(浙港国际店)', array[]::text[], '三墩', 1.3, 17, '面食粉面', 20, 4.6, 0, 0, 30.309361, 120.093113, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFL96IUQ","name":"德泓面馆(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r034', '悦览树(紫金港校区浙江大学店)', '悦览树(紫金港校区浙江大学店)', array[]::text[], '紫金港校内', 0.95, 13, '中餐简餐', 31, 4.4, 0, 0, 30.296222, 120.075659, '校', '#4f8b65', array['正餐', '紫金港', '人均50内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥31，距离紫金港约 0.9km；当前标签为 正餐、人均50内、校内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFMHW1J9","name":"悦览树(紫金港校区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFMHW1J9","name":"悦览树(紫金港校区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r035', '膳当家黄焖鸡米饭(浙大紫金港店)', '膳当家黄焖鸡米饭(浙大紫金港店)', array[]::text[], '紫金港校内', 1.17, 16, '中餐简餐', 19, 4.3, 0, 0, 30.309873, 120.090953, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":2},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"黄焖鸡","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0J1UM5VEM","name":"膳当家黄焖鸡米饭(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r036', '冯味面馆(萃紫街店)', '冯味面馆(萃紫街店)', array[]::text[], '三墩', 1.08, 14, '面食粉面', 21, 4.2, 0, 0, 30.309781, 120.074137, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '暖胃', '下饭', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['暖胃', '下饭', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥21，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"黄焖鸡","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0I2BR591W","name":"冯味面馆(萃紫街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r037', '柳州肥姨妈大骨螺蛳粉(西溪银泰店)', '柳州肥姨妈大骨螺蛳粉(西溪银泰店)', array[]::text[], '西溪', 1.32, 18, '面食粉面', 18, 4.5, 0, 0, 30.292755, 120.074612, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '中餐', '晚餐', '暖胃', '面食', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LKZ5EKAC","name":"柳州肥姨妈大骨螺蛳粉(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r038', '肠微粉方程广东味(浙港国际店)', '肠微粉方程广东味(浙港国际店)', array[]::text[], '三墩', 1.25, 17, '面食粉面', 19, 4.4, 0, 0, 30.309192, 120.092608, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥19，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L19XJXX3","name":"肠微粉方程广东味(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":4},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0L19XJXX3","name":"肠微粉方程广东味(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r039', '朱阿根烧饼(紫荆花北路店)', '朱阿根烧饼(紫荆花北路店)', array[]::text[], '三墩', 1.25, 17, '中餐简餐', 12, 4.1, 0, 0, 30.307211, 120.093894, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥12，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I2H734AQ","name":"朱阿根烧饼(紫荆花北路店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r040', '杨衢记自选餐厅(西溪银泰城店)', '杨衢记自选餐厅(西溪银泰城店)', array[]::text[], '西溪', 1.34, 18, '中餐简餐', 18, 4.5, 0, 0, 30.292077, 120.07542, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JB6HH0AV","name":"杨衢记自选餐厅(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r041', '苗记禾麦自选快餐(紫金创业园B座店)', '苗记禾麦自选快餐(紫金创业园B座店)', array[]::text[], '西湖区', 0.84, 11, '快餐小吃', 19, 3.6, 0, 0, 30.308348, 120.076077, '饭', '#f0aa38', array['正餐', '紫金港', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥19，距离紫金港约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0I2JC5LQP","name":"苗记禾麦自选快餐(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r042', '塔斯汀中国汉堡(杭州市西溪银泰店)', '塔斯汀中国汉堡(杭州市西溪银泰店)', array[]::text[], '西溪', 1.25, 17, '异国简餐', 20, 4.4, 0, 0, 30.293389, 120.07475, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I04CX2YA","name":"塔斯汀中国汉堡(杭州市西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r043', '袁记云饺(西湖区浙大紫金港店)', '袁记云饺(西湖区浙大紫金港店)', array[]::text[], '紫金港校内', 1.05, 14, '中餐简餐', 22, 4.1, 0, 0, 30.309518, 120.089642, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥22，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0KKR6NW76","name":"袁记云饺(西湖区浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r044', '重庆鸡公煲(望月公寓47号店)', '重庆鸡公煲(望月公寓47号店)', array[]::text[], '三墩', 1.14, 15, '中餐简餐', 28, 4.5, 0, 0, 30.309666, 120.090735, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDBFZY","name":"重庆鸡公煲(望月公寓47号店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFFDBFZY","name":"重庆鸡公煲(望月公寓47号店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r045', '北京片皮烤鸭(紫金港店)', '北京片皮烤鸭(紫金港店)', array[]::text[], '紫金港东门', 1.78, 24, '校内食堂', 28, 4, 0, 0, 30.318609, 120.084221, '烤', '#9b5a31', array['正餐', '紫金港', '实惠', '人均30内', '烧烤', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥28，距离紫金港约 1.8km；当前标签为 正餐、实惠、人均30内，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B023B17G6U","name":"北京片皮烤鸭(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":4},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B023B17G6U","name":"北京片皮烤鸭(紫金港店)","query":{"type":"web_clue","campus":"紫金港","keyword":"紫金港餐饮中心 风味餐厅 浙江大学","title":"Apple Maps 紫金港餐饮中心风味餐厅页面","url":"https://maps.apple.com/place?auid=1118368631460667&lsp=57879","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r046', '衢州谢记烤饼(望月公寓樱花苑店)', '衢州谢记烤饼(望月公寓樱花苑店)', array[]::text[], '三墩', 1.21, 16, '中餐简餐', 9, 3.8, 0, 0, 30.310076, 120.091266, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥9，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKTAAJZ","name":"衢州谢记烤饼(望月公寓樱花苑店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r047', '华莱士·全鸡汉堡(浙港国际浙港广场店)', '华莱士·全鸡汉堡(浙港国际浙港广场店)', array[]::text[], '三墩', 1.22, 16, '异国简餐', 18, 4.2, 0, 0, 30.308625, 120.092725, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥18，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0G26HLHWR","name":"华莱士·全鸡汉堡(浙港国际浙港广场店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r048', '张亮麻辣烫(紫金港店)', '张亮麻辣烫(紫金港店)', array[]::text[], '紫金港东门', 1.01, 13, '校内食堂', 30, 4.3, 0, 0, 30.309365, 120.089194, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥30，距离紫金港约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFH7WCEG","name":"张亮麻辣烫(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r049', '鼎鲜花甲(望月公寓店)', '鼎鲜花甲(望月公寓店)', array[]::text[], '三墩', 1.08, 14, '快餐小吃', 20, 4, 0, 0, 30.309606, 120.089887, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0H129D4TW","name":"鼎鲜花甲(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r050', '鲜目录寿司(浙大紫金港店)', '鲜目录寿司(浙大紫金港店)', array[]::text[], '紫金港校内', 1.23, 16, '异国简餐', 23, 4.4, 0, 0, 30.310471, 120.091188, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校', '中餐', '晚餐', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJASE7M","name":"鲜目录寿司(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r051', '还可以', '还可以', array[]::text[], '三墩', 0.85, 11, '中餐简餐', 33, 4.1, 0, 0, 30.310293, 120.083593, '饭', '#f0aa38', array['正餐', '紫金港', '近', '人均50内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥33，距离紫金港约 0.9km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0K3K5JYWE","name":"还可以","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r052', '渔百仓象山海鲜面(西溪银泰城)', '渔百仓象山海鲜面(西溪银泰城)', array[]::text[], '紫金港南门', 1.2, 16, '火锅麻辣烫', 25, 4.4, 0, 0, 30.293799, 120.075017, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐', '夜宵']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFIL8A78","name":"渔百仓象山海鲜面(西溪银泰城)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r053', '北街烧烤(三墩店)', '北街烧烤(三墩店)', array[]::text[], '三墩', 0.86, 12, '烧烤烤肉', 33, 4.1, 0, 0, 30.310508, 120.082426, '辣', '#c84b35', array['正餐', '紫金港', '近', '人均50内', '辣', '烧烤', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥33，距离紫金港约 0.9km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0FFKDKDK1","name":"北街烧烤(三墩店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r054', '燕子蛋饼超人(西溪银泰城西区店)', '燕子蛋饼超人(西溪银泰城西区店)', array[]::text[], '西溪', 1.26, 17, '中餐简餐', 13, 4, 0, 0, 30.293658, 120.074088, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '早餐', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥13，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KAHYYBRP","name":"燕子蛋饼超人(西溪银泰城西区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0KAHYYBRP","name":"燕子蛋饼超人(西溪银泰城西区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r055', '渝八两重庆鸡公煲(杭州望月公寓店)', '渝八两重庆鸡公煲(杭州望月公寓店)', array[]::text[], '三墩', 1.06, 14, '快餐小吃', 20, 3.9, 0, 0, 30.309557, 120.08967, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥20，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0FFGIO7OV","name":"渝八两重庆鸡公煲(杭州望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r056', '百串百香旋转麻辣烫(望月公寓店)', '百串百香旋转麻辣烫(望月公寓店)', array[]::text[], '三墩', 1.22, 16, '火锅麻辣烫', 25, 4.3, 0, 0, 30.310165, 120.091271, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFGG3OPX","name":"百串百香旋转麻辣烫(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r057', '小禾山·炒鸡米饭(西湖区紫金港望月公寓店)', '小禾山·炒鸡米饭(西湖区紫金港望月公寓店)', array[]::text[], '三墩', 1.07, 14, '中餐简餐', 22, 3.9, 0, 0, 30.30958, 120.089787, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥22，距离紫金港约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"黄焖鸡","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0LA77W7CR","name":"小禾山·炒鸡米饭(西湖区紫金港望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"盖浇饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r058', '刘文祥麻辣烫(西溪银泰城店)', '刘文祥麻辣烫(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '火锅麻辣烫', 25, 4.5, 0, 0, 30.292346, 120.075179, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥25，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HRO5J7FQ","name":"刘文祥麻辣烫(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0HRO5J7FQ","name":"刘文祥麻辣烫(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r059', '鲜有鸡·蔬香炸鸡(西溪银泰城店)', '鲜有鸡·蔬香炸鸡(西溪银泰城店)', array[]::text[], '紫金港校内', 1.33, 18, '异国简餐', 21, 4.3, 0, 0, 30.29269, 120.074583, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDLMNONJ","name":"鲜有鸡·蔬香炸鸡(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r060', '石锅拌饭(浙大店)', '石锅拌饭(浙大店)', array[]::text[], '三墩', 1.41, 19, '异国简餐', 23, 4.5, 0, 0, 30.312846, 120.090769, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '拍照', '面食', '暖胃', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['暖胃', '面食', '拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥23，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF4969J","name":"石锅拌饭(浙大店)","query":{"type":"amap_around","campus":"紫金港","keyword":"韩餐","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r061', '吉吞吞烤肉卷饼shawerma(西溪银泰店)', '吉吞吞烤肉卷饼shawerma(西溪银泰店)', array[]::text[], '西溪', 1.39, 19, '烧烤烤肉', 24, 4.5, 0, 0, 30.292227, 120.074231, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '烧烤', '快餐', '一人食', '聚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥24，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0KK6CGKYE","name":"吉吞吞烤肉卷饼shawerma(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r062', '嵊州小吃(集萃路店)', '嵊州小吃(集萃路店)', array[]::text[], '三墩', 1.32, 18, '快餐小吃', 20, 4.2, 0, 0, 30.312417, 120.074014, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG9328F","name":"嵊州小吃(集萃路店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r063', '阿香米线(杭州西溪银泰城餐厅)', '阿香米线(杭州西溪银泰城餐厅)', array[]::text[], '紫金港南门', 1.21, 16, '校内食堂', 25, 4.2, 0, 0, 30.293857, 120.074805, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIB7O7T","name":"阿香米线(杭州西溪银泰城餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFIB7O7T","name":"阿香米线(杭州西溪银泰城餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"},{"type":"amap_poi","poi_id":"B0FFIB7O7T","name":"阿香米线(杭州西溪银泰城餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFIB7O7T","name":"阿香米线(杭州西溪银泰城餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r064', '鸡柳大人(浙大浙港国际店)', '鸡柳大人(浙大浙港国际店)', array[]::text[], '三墩', 1.31, 18, '快餐小吃', 18, 4.1, 0, 0, 30.309283, 120.093352, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥18，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KR7MGFK6","name":"鸡柳大人(浙大浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r065', '麦当劳(杭州古墩路第二餐厅)', '麦当劳(杭州古墩路第二餐厅)', array[]::text[], '三墩', 1.43, 19, '快餐小吃', 25, 4.6, 0, 0, 30.302525, 120.096873, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥25，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0HK1RAMA3","name":"麦当劳(杭州古墩路第二餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r066', '赛百味(剑桥公社店)', '赛百味(剑桥公社店)', array[]::text[], '剑桥公社', 1.27, 17, '快餐小吃', 25, 4.3, 0, 0, 30.305958, 120.094679, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥25，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B1DQG7","name":"赛百味(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B023B1DQG7","name":"赛百味(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r067', '嵊州小吃(浙港国际店)', '嵊州小吃(浙港国际店)', array[]::text[], '三墩', 1.26, 17, '快餐小吃', 21, 4.1, 0, 0, 30.309097, 120.092847, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K17GTSM0","name":"嵊州小吃(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r068', '老博东北老式麻辣烫', '老博东北老式麻辣烫', array[]::text[], '剑桥公社', 1.21, 16, '火锅麻辣烫', 26, 4.2, 0, 0, 30.305519, 120.09409, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥26，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0IABRLCKT","name":"老博东北老式麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r069', '乡村基(杭州西溪银泰城东区店)', '乡村基(杭州西溪银泰城东区店)', array[]::text[], '西溪', 1.28, 17, '快餐小吃', 23, 4.2, 0, 0, 30.292932, 120.074964, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥23，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KR9AFOQ2","name":"乡村基(杭州西溪银泰城东区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r070', '杨国福麻辣烫(浙港国际店)', '杨国福麻辣烫(浙港国际店)', array[]::text[], '三墩', 1.24, 17, '火锅麻辣烫', 25, 4.2, 0, 0, 30.309019, 120.092687, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥25，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I1UX0XYL","name":"杨国福麻辣烫(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I1UX0XYL","name":"杨国福麻辣烫(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r071', '炙北哈尔滨自助盒饭地锅烤肉', '炙北哈尔滨自助盒饭地锅烤肉', array[]::text[], '西溪', 1.51, 20, '烧烤烤肉', 16, 4.3, 0, 0, 30.292811, 120.071289, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥16，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LA25MQ4A","name":"炙北哈尔滨自助盒饭地锅烤肉","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0LA25MQ4A","name":"炙北哈尔滨自助盒饭地锅烤肉","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r072', '巴比手工鲜包(浙港国际店)', '巴比手工鲜包(浙港国际店)', array[]::text[], '三墩', 1.3, 17, '快餐小吃', 11, 3.7, 0, 0, 30.308825, 120.093555, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥11，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L39SRWVP","name":"巴比手工鲜包(浙港国际店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r073', '魔锅坊麻辣香锅(紫金港店)', '魔锅坊麻辣香锅(紫金港店)', array[]::text[], '紫金港东门', 1.24, 17, '校内食堂', 26, 4.2, 0, 0, 30.310517, 120.091208, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '下饭', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣']::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥26，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFZP6LC","name":"魔锅坊麻辣香锅(紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:11:25.132Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r074', '青蔬麻辣烫(港湾家园店)', '青蔬麻辣烫(港湾家园店)', array[]::text[], '三墩', 0.88, 12, '火锅麻辣烫', 24, 3.4, 0, 0, 30.310647, 120.082352, '辣', '#c84b35', array['正餐', '紫金港', '近', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.4，人均约 ¥24，距离紫金港约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0FFG2IZ2S","name":"青蔬麻辣烫(港湾家园店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r075', '河间驴肉火烧(西溪银泰城店)', '河间驴肉火烧(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '快餐小吃', 21, 4.1, 0, 0, 30.29269, 120.074583, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥21，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKUAT3AB","name":"河间驴肉火烧(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r076', '土家酱香饼(西溪银泰城店)', '土家酱香饼(西溪银泰城店)', array[]::text[], '西溪', 1.33, 18, '快餐小吃', 14, 3.8, 0, 0, 30.292341, 120.07524, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥14，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0HR0GQZVU","name":"土家酱香饼(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r077', '汉堡王(杭州华策中心)', '汉堡王(杭州华策中心)', array[]::text[], '西湖区', 1.46, 19, '异国简餐', 25, 4.5, 0, 0, 30.300331, 120.067035, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥25，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKOK0GI","name":"汉堡王(杭州华策中心)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFKOK0GI","name":"汉堡王(杭州华策中心)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r078', '袁记云饺(龙湖西溪天街店)', '袁记云饺(龙湖西溪天街店)', array[]::text[], '紫金港南门', 1.7, 23, '校内食堂', 15, 4.5, 0, 0, 30.293044, 120.068306, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '下饭', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥15，距离紫金港约 1.7km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LA2AG2UQ","name":"袁记云饺(龙湖西溪天街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r079', '沙县小吃', '沙县小吃', array[]::text[], '西溪', 1.44, 19, '快餐小吃', 20, 4.2, 0, 0, 30.293865, 120.071078, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHREZ53","name":"沙县小吃","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFHREZ53","name":"沙县小吃","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r080', '老乡鸡(杭州西溪谷店)', '老乡鸡(杭州西溪谷店)', array[]::text[], '西溪', 1.51, 20, '快餐小吃', 24, 4.5, 0, 0, 30.290822, 120.074416, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥24，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IAY7Y1LS","name":"老乡鸡(杭州西溪谷店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r081', '沙县小吃(望月公寓店)', '沙县小吃(望月公寓店)', array[]::text[], '三墩', 1.43, 19, '快餐小吃', 16, 4, 0, 0, 30.313101, 120.090755, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥16，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF3Z23U","name":"沙县小吃(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFF3Z23U","name":"沙县小吃(望月公寓店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r082', '甘其食(硒和云创店)', '甘其食(硒和云创店)', array[]::text[], '三墩', 1.85, 25, '快餐小吃', 9, 4.5, 0, 0, 30.315575, 120.069625, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 1.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L2S55R0C","name":"甘其食(硒和云创店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":5},"fetched_at":"2026-05-09T17:11:25.134Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r083', '塔斯汀中国汉堡(杭州市三坝地铁站店)', '塔斯汀中国汉堡(杭州市三坝地铁站店)', array[]::text[], '三墩', 1.56, 21, '异国简餐', 20, 4.4, 0, 0, 30.30002, 120.0979, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J6N9PJE8","name":"塔斯汀中国汉堡(杭州市三坝地铁站店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0J6N9PJE8","name":"塔斯汀中国汉堡(杭州市三坝地铁站店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r084', '老娘舅(杭州双龙街西溪银泰店)', '老娘舅(杭州双龙街西溪银泰店)', array[]::text[], '西溪', 1.27, 17, '快餐小吃', 31, 4.3, 0, 0, 30.293025, 120.075043, '饭', '#f0aa38', array['正餐', '紫金港', '人均50内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥31，距离紫金港约 1.3km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":4},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":5},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.137Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0G15BOWI7","name":"老娘舅(杭州双龙街西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r085', '杭州炒饭哥(望月店)', '杭州炒饭哥(望月店)', array[]::text[], '三墩', 1.28, 17, '快餐小吃', 19, 3.8, 0, 0, 30.311211, 120.091051, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥19，距离紫金港约 1.3km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G26ZJPHT","name":"杭州炒饭哥(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":5},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0G26ZJPHT","name":"杭州炒饭哥(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r086', '一休家饭团(西溪银泰店)', '一休家饭团(西溪银泰店)', array[]::text[], '西溪', 1.22, 16, '异国简餐', 17, 3.6, 0, 0, 30.293665, 120.074871, '异', '#4d79b8', array['正餐', '紫金港', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '下饭', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['下饭', '拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥17，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0I0KU2DZ8","name":"一休家饭团(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r087', '肯德基(杭州西溪银泰城店)', '肯德基(杭州西溪银泰城店)', array[]::text[], '西溪', 1.25, 17, '异国简餐', 35, 4.4, 0, 0, 30.293243, 120.075073, '饭', '#f0aa38', array['正餐', '紫金港', '人均50内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥35，距离紫金港约 1.2km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:11:25.135Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"},{"type":"amap_poi","poi_id":"B0FFILE5AP","name":"肯德基(杭州西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":3},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r088', '喻老头正宗重庆麻辣烫', '喻老头正宗重庆麻辣烫', array[]::text[], '三墩', 1.59, 21, '火锅麻辣烫', 25, 4.6, 0, 0, 30.302084, 120.098467, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐', '夜宵']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥25，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I0PP0X33","name":"喻老头正宗重庆麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0I0PP0X33","name":"喻老头正宗重庆麻辣烫","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":3},"fetched_at":"2026-05-09T17:11:25.138Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r089', '章诚素饺(西溪银泰店)', '章诚素饺(西溪银泰店)', array[]::text[], '西溪', 1.36, 18, '校内食堂', 23, 4.1, 0, 0, 30.292387, 120.074381, '校', '#4f8b65', array['正餐', '紫金港', '实惠', '人均30内', '聚餐', '轻负担', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '下饭', '清爽', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['轻负担']::text[], array['下饭', '清爽', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥23，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JKOSKWPS","name":"章诚素饺(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"},{"type":"amap_poi","poi_id":"B0JKOSKWPS","name":"章诚素饺(西溪银泰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":5},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r090', '顺旺基(世纪中心店)', '顺旺基(世纪中心店)', array[]::text[], '西溪', 1.55, 21, '烧烤烤肉', 20, 4.3, 0, 0, 30.292813, 120.070686, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '烧烤', '快餐', '一人食', '聚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥20，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","campus":"紫金港","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","campus":"紫金港","keyword":"自选快餐","page":2},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","campus":"紫金港","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0JBYHVRU6","name":"顺旺基(世纪中心店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r091', '西火火川派小火锅(杭州西溪银泰城东区店)', '西火火川派小火锅(杭州西溪银泰城东区店)', array[]::text[], '西溪', 1.18, 16, '火锅麻辣烫', 39, 4.4, 0, 0, 30.293787, 120.075451, '辣', '#c84b35', array['正餐', '紫金港', '人均50内', '辣', '火锅', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '紫金港']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥39，距离紫金港约 1.2km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"},{"type":"amap_poi","poi_id":"B0JDJZDD66","name":"西火火川派小火锅(杭州西溪银泰城东区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r092', '麦当劳(三坝耀江文鼎苑餐厅)', '麦当劳(三坝耀江文鼎苑餐厅)', array[]::text[], '文新', 1.56, 21, '异国简餐', 28, 4.6, 0, 0, 30.299075, 120.097625, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥28，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0FFKBMWPY","name":"麦当劳(三坝耀江文鼎苑餐厅)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r093', '王老笨·东北过桥米线(龙湖杭州西溪天街店)', '王老笨·东北过桥米线(龙湖杭州西溪天街店)', array[]::text[], '紫金港南门', 1.69, 23, '校内食堂', 20, 4.5, 0, 0, 30.29233, 120.069158, '面', '#6d8fbd', array['正餐', '紫金港', '实惠', '人均30内', '面食', '暖胃', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '暖胃', '下饭', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥20，距离紫金港约 1.7km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L12XVIYH","name":"王老笨·东北过桥米线(龙湖杭州西溪天街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:11:25.136Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r094', '食其家·牛丼咖喱(文鼎财富店)', '食其家·牛丼咖喱(文鼎财富店)', array[]::text[], '三墩', 1.57, 21, '异国简餐', 23, 4.4, 0, 0, 30.298638, 120.097634, '异', '#4d79b8', array['正餐', '紫金港', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '下饭', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['下饭', '拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2BASAA3","name":"食其家·牛丼咖喱(文鼎财富店)","query":{"type":"amap_around","campus":"紫金港","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r095', '聚串门儿-东北烧烤.铜锅涮肉', '聚串门儿-东北烧烤.铜锅涮肉', array[]::text[], '剑桥公社', 1.16, 15, '烧烤烤肉', 44, 4.5, 0, 0, 30.305259, 120.09364, '辣', '#c84b35', array['正餐', '紫金港', '人均50内', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '紫金港']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥44，距离紫金港约 1.2km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","campus":"紫金港","keyword":"中餐","page":2},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","campus":"紫金港","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0LK6HK55I","name":"聚串门儿-东北烧烤.铜锅涮肉","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r096', '肯德基(杭州紫霞街店)', '肯德基(杭州紫霞街店)', array[]::text[], '紫金港南门', 1.52, 20, '异国简餐', 28, 4.5, 0, 0, 30.29038, 120.075335, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离紫金港约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IDX70ZT1","name":"肯德基(杭州紫霞街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0IDX70ZT1","name":"肯德基(杭州紫霞街店)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r097', '汉堡王(杭州西溪首座)', '汉堡王(杭州西溪首座)', array[]::text[], '西溪', 1.58, 21, '异国简餐', 28, 4.6, 0, 0, 30.289998, 120.074789, '饭', '#f0aa38', array['正餐', '紫金港', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥28，距离紫金港约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIBHRW1","name":"汉堡王(杭州西溪首座)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0FFIBHRW1","name":"汉堡王(杭州西溪首座)","query":{"type":"amap_around","campus":"紫金港","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r098', '浙大北门烧烤(紫金创业园B座店)', '浙大北门烧烤(紫金创业园B座店)', array[]::text[], '西湖区', 0.84, 11, '校内食堂', 55, 4.3, 0, 0, 30.308367, 120.076121, '辣', '#c84b35', array['正餐', '紫金港', '近', '辣', '烧烤', '聚餐', '夜宵', '食堂', '下饭']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥55，距离紫金港约 0.8km；当前标签为 正餐、近、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0K6YA2HFJ","name":"浙大北门烧烤(紫金创业园B座店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r099', '喜三叔·烤肉卷饼·肉筋卷饼', '喜三叔·烤肉卷饼·肉筋卷饼', array[]::text[], '三墩', 1.44, 19, '烧烤烤肉', 14, 3.7, 0, 0, 30.314987, 120.076955, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥14，距离紫金港约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K0H4DTNO","name":"喜三叔·烤肉卷饼·肉筋卷饼","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":2},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0K0H4DTNO","name":"喜三叔·烤肉卷饼·肉筋卷饼","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r100', '冒大仙火锅冒菜(剑桥公社店)', '冒大仙火锅冒菜(剑桥公社店)', array[]::text[], '剑桥公社', 1.18, 16, '火锅麻辣烫', 24, 3.6, 0, 0, 30.305387, 120.093836, '辣', '#c84b35', array['正餐', '紫金港', '实惠', '人均30内', '辣', '火锅', '快餐', '一人食', '聚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥24，距离紫金港约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:11:25.133Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"冒菜","page":1},"fetched_at":"2026-05-09T17:11:25.138Z"},{"type":"amap_poi","poi_id":"B0I3VUFB3Q","name":"冒大仙火锅冒菜(剑桥公社店)","query":{"type":"amap_around","campus":"紫金港","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r101', '叹今生酒馆小火锅(西溪银泰城店)', '叹今生酒馆小火锅(西溪银泰城店)', array[]::text[], '西溪', 1.32, 18, '火锅麻辣烫', 35, 4.3, 0, 0, 30.292775, 120.074525, '辣', '#c84b35', array['正餐', '紫金港', '人均50内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '紫金港']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥35，距离紫金港约 1.3km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L05RU4HB","name":"叹今生酒馆小火锅(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0L05RU4HB","name":"叹今生酒馆小火锅(西溪银泰城店)","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r102', '李桑炭火烤肉(浙大紫金港店)', '李桑炭火烤肉(浙大紫金港店)', array[]::text[], '紫金港校内', 1.15, 15, '烧烤烤肉', 111, 4.6, 0, 0, 30.306415, 120.093141, '辣', '#c84b35', array['正餐', '紫金港', '校内', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '懒得出校', '夜宵', '中餐', '晚餐', '下饭', '小吃', '紫金港']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥111，距离紫金港约 1.1km；当前标签为 正餐、校内、辣，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:11:25.139Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:11:25.143Z"},{"type":"amap_poi","poi_id":"B0J2MULL9T","name":"李桑炭火烤肉(浙大紫金港店)","query":{"type":"web_clue","campus":"紫金港","keyword":"李桑炭火烤肉 浙大紫金港","title":"李桑炭火烤肉(浙大紫金港店) Trip.com 餐厅页","url":"https://hk.trip.com/restaurant/china/hangzhou/detail/restaurant-142213787","publishedAt":"2025-06-24"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r103', '意式披萨店', '意式披萨店', array[]::text[], '三墩', 1.17, 16, '异国简餐', 42, 4.3, 0, 0, 30.308384, 120.092223, '异', '#4d79b8', array['正餐', '紫金港', '人均50内', '快餐', '一人食', '异国料理']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '紫金港']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥42，距离紫金港约 1.2km；当前标签为 正餐、人均50内、快餐，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HRA5M7GK","name":"意式披萨店","query":{"type":"amap_around","campus":"紫金港","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:11:25.134Z"},{"type":"amap_poi","poi_id":"B0HRA5M7GK","name":"意式披萨店","query":{"type":"amap_around","campus":"紫金港","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:11:25.142Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r104', '古茗(浙大银泉校内店)', '古茗(浙大银泉校内店)', array[]::text[], '紫金港校内', 0.75, 10, '茶饮', 16, 4.4, 0, 0, 30.306192, 120.075274, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","campus":"紫金港","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"amap_around","campus":"紫金港","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:11:25.143Z"},{"type":"amap_poi","poi_id":"B0JKLAZ0RS","name":"古茗(浙大银泉校内店)","query":{"type":"web_clue","campus":"紫金港","keyword":"银泉餐厅 浙江大学 紫金港","title":"2025 年浙江大学本科新生指引校园区域页","url":"https://welcome.zjuintl-share.top/life/campus/","publishedAt":"2025-01-01"},"fetched_at":"2026-05-09T17:11:25.143Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r105', '库迪咖啡(浙大紫金港启真湖店)', '库迪咖啡(浙大紫金港启真湖店)', array[]::text[], '紫金港校内', 0.37, 5, '茶饮', 9, 4.4, 0, 0, 30.304241, 120.085384, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0J10CFPJ3","name":"库迪咖啡(浙大紫金港启真湖店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r106', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', '爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)', array[]::text[], '紫金港校内', 0.4, 5, '茶饮', 13, 4.6, 0, 0, 30.304294, 120.085681, '甜', '#d9915d', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥13，距离紫金港约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0LB99WOD7","name":"爷爷不泡茶NOYEYENOTEA(浙大紫金港校内店)","query":{"type":"amap_around","campus":"紫金港","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r107', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)', array[]::text[], '紫金港校内', 0.56, 7, '茶饮', 17, 4.5, 0, 0, 30.298056, 120.07996, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '甜品', '奶茶']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '咖啡', '甜品', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离紫金港约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"},{"type":"amap_poi","poi_id":"B0H1P4DLL0","name":"luckin coffee 瑞幸咖啡(紫金港校区西区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r108', '麦思威咖啡', '麦思威咖啡', array[]::text[], '紫金港校内', 0.72, 10, '咖啡', 14, 4.5, 0, 0, 30.302666, 120.089435, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0LGP5JCEV","name":"麦思威咖啡","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r109', '一鸣真鲜奶吧(浙大紫金港经济学院店)', '一鸣真鲜奶吧(浙大紫金港经济学院店)', array[]::text[], '紫金港校内', 0.63, 8, '茶饮', 14, 4.3, 0, 0, 30.297791, 120.078919, '甜', '#d9915d', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥14，距离紫金港约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L125U1KT","name":"一鸣真鲜奶吧(浙大紫金港经济学院店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r110', '瑞幸咖啡(浙大医学院店)', '瑞幸咖啡(浙大医学院店)', array[]::text[], '紫金港周边', 0.79, 11, '茶饮', 14, 4.5, 0, 0, 30.295967, 120.084462, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥14，距离紫金港约 0.8km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0KKKUOI13","name":"瑞幸咖啡(浙大医学院店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r111', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', 'luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)', array[]::text[], '紫金港校内', 0.7, 9, '茶饮', 13, 4.2, 0, 0, 30.308075, 120.085925, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0K2HUHPSU","name":"luckin coffee 瑞幸咖啡(紫金港校区浙江大学店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r112', '库迪咖啡(浙大紫金港成均苑店)', '库迪咖啡(浙大紫金港成均苑店)', array[]::text[], '紫金港校内', 0.7, 9, '咖啡', 13, 4.1, 0, 0, 30.297215, 120.078576, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0K2ZKTZTI","name":"库迪咖啡(浙大紫金港成均苑店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.140Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r113', '吉利烘焙(浙江大学紫金港店)', '吉利烘焙(浙江大学紫金港店)', array[]::text[], '紫金港校内', 0.7, 9, '甜品烘焙', 13, 4.1, 0, 0, 30.309001, 120.083047, '甜', '#d9915d', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '甜品', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '拍照', '清爽', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥13，距离紫金港约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B189B4","name":"吉利烘焙(浙江大学紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:11:25.131Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r114', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', '一鸣真鲜奶吧(杭州浙大紫金翠柏店)', array[]::text[], '紫金港校内', 0.8, 11, '茶饮', 15, 4.3, 0, 0, 30.30906, 120.085999, '甜', '#d9915d', array['饮品', '紫金港', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '快餐', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥15，距离紫金港约 0.8km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKW58RH","name":"一鸣真鲜奶吧(杭州浙大紫金翠柏店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r115', '瑞幸咖啡(浙江大学紫金港校区店)', '瑞幸咖啡(浙江大学紫金港校区店)', array[]::text[], '紫金港校内', 1.05, 14, '茶饮', 9, 4.5, 0, 0, 30.297848, 120.091314, '咖', '#8c6338', array['饮品', '紫金港', '实惠', '人均30内', '校内', '拍照', '咖啡', '甜品', '奶茶', '轻负担']::text[], array['约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '甜品', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离紫金港约 1.1km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"},{"type":"amap_poi","poi_id":"B0LG4C6PT1","name":"瑞幸咖啡(浙江大学紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r116', '瑞幸咖啡(紫金创业园B幢店)', '瑞幸咖啡(紫金创业园B幢店)', array[]::text[], '西湖区', 0.86, 12, '咖啡', 16, 4.4, 0, 0, 30.308421, 120.075783, '咖', '#8c6338', array['饮品', '紫金港', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离紫金港约 0.9km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:11:25.131Z"},{"type":"amap_poi","poi_id":"B0J0AL7L3X","name":"瑞幸咖啡(紫金创业园B幢店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r117', '库迪咖啡(浙大紫金港校区店)', '库迪咖啡(浙大紫金港校区店)', array[]::text[], '紫金港校内', 1.04, 14, '茶饮', 9, 4.4, 0, 0, 30.309464, 120.089591, '咖', '#8c6338', array['饮品', '紫金港', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥9，距离紫金港约 1.0km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0JAPU28OI","name":"库迪咖啡(浙大紫金港校区店)","query":{"type":"amap_around","campus":"紫金港","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r118', '蜜雪冰城(望月店)', '蜜雪冰城(望月店)', array[]::text[], '三墩', 1.18, 16, '茶饮', 8, 4.6, 0, 0, 30.309906, 120.091092, '咖', '#8c6338', array['饮品', '紫金港', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '小吃', '拍照', '清爽', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '约会拍照']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥8，距离紫金港约 1.2km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFZY4TW","name":"蜜雪冰城(望月店)","query":{"type":"amap_around","campus":"紫金港","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r119', '蜜雪冰城(杭州旗舰店)', '蜜雪冰城(杭州旗舰店)', array[]::text[], '西溪', 1.31, 17, '茶饮', 8, 4.8, 0, 0, 30.292126, 120.076082, '咖', '#8c6338', array['饮品', '紫金港', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '约会拍照', '下午茶', '早餐', '小吃', '拍照', '清爽', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '约会拍照']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.8，人均约 ¥8，距离紫金港约 1.3km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HR0ZVB08","name":"蜜雪冰城(杭州旗舰店)","query":{"type":"amap_around","campus":"紫金港","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r120', '厝内小眷村(浙大紫金港店)', '厝内小眷村(浙大紫金港店)', array[]::text[], '紫金港校内', 1.09, 15, '茶饮', 16, 4.6, 0, 0, 30.309626, 120.090079, '甜', '#d9915d', array['饮品', '紫金港', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠', '奶茶']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离紫金港约 1.1km；当前标签为 饮品、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:11:25.132Z"},{"type":"amap_poi","poi_id":"B0HDJ7VMDL","name":"厝内小眷村(浙大紫金港店)","query":{"type":"amap_around","campus":"紫金港","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:11:25.141Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r121', '浙江大学玉泉校区民族餐厅', '浙江大学玉泉校区民族餐厅', array[]::text[], '玉泉校内', 0.35, 5, '异国简餐', 12, 4.3, 0, 0, 30.266619, 120.125171, '辣', '#c84b35', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '辣', '面食', '暖胃', '快餐']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥12，距离玉泉约 0.3km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B023B09VU5","name":"浙江大学玉泉校区民族餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B023B09VU5","name":"浙江大学玉泉校区民族餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B023B09VU5","name":"浙江大学玉泉校区民族餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"清真","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"},{"type":"amap_poi","poi_id":"B023B09VU5","name":"浙江大学玉泉校区民族餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"},{"type":"amap_poi","poi_id":"B023B09VU5","name":"浙江大学玉泉校区民族餐厅","query":{"type":"web_clue","campus":"玉泉","keyword":"浙江大学 玉泉 食堂","title":"浙江大学玉泉校区食堂公开信息检索","url":"https://www.zju.edu.cn/","publishedAt":"2026-01-01"},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r122', '浙江大学玉泉校区四食堂', '浙江大学玉泉校区四食堂', array[]::text[], '玉泉校内', 0.44, 6, '校内食堂', 16, 4.6, 0, 0, 30.267506, 120.125299, '校', '#4f8b65', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥16，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B09VYC","name":"浙江大学玉泉校区四食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B023B09VYC","name":"浙江大学玉泉校区四食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B023B09VYC","name":"浙江大学玉泉校区四食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r123', '春红美食', '春红美食', array[]::text[], '黄龙', 0.4, 5, '中餐简餐', 12, 4.2, 0, 0, 30.261218, 120.126415, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥12，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J6YZZHGE","name":"春红美食","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0J6YZZHGE","name":"春红美食","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0J6YZZHGE","name":"春红美食","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0J6YZZHGE","name":"春红美食","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r124', '浙大五食堂', '浙大五食堂', array[]::text[], '玉泉校内', 0.4, 5, '校内食堂', 17, 4.4, 0, 0, 30.264101, 120.127661, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥17，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFPA80C","name":"浙大五食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFFPA80C","name":"浙大五食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFFPA80C","name":"浙大五食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:12:18.723Z"},{"type":"amap_poi","poi_id":"B0FFFPA80C","name":"浙大五食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r125', '大桂卤桂林米粉', '大桂卤桂林米粉', array[]::text[], '青芝坞', 0.33, 4, '面食粉面', 12, 4, 0, 0, 30.262518, 120.126664, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥12，距离玉泉约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L23C4WXM","name":"大桂卤桂林米粉","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0L23C4WXM","name":"大桂卤桂林米粉","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r126', '辣子王兰州牛肉面(西湖店)', '辣子王兰州牛肉面(西湖店)', array[]::text[], '青芝坞', 0.33, 4, '面食粉面', 22, 4.4, 0, 0, 30.262623, 120.126727, '辣', '#c84b35', array['正餐', '玉泉', '近', '实惠', '人均30内', '辣', '面食', '暖胃', '聚餐', '清真友好']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '清真友好']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥22，距离玉泉约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"盖浇饭","page":1},"fetched_at":"2026-05-09T17:12:18.723Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"清真","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"},{"type":"amap_poi","poi_id":"B0JUFZQNVJ","name":"辣子王兰州牛肉面(西湖店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r127', '麦哥烧饼店', '麦哥烧饼店', array[]::text[], '青芝坞', 0.33, 4, '面食粉面', 15, 4.1, 0, 0, 30.262496, 120.126678, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥15，距离玉泉约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B1AGT4","name":"麦哥烧饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B023B1AGT4","name":"麦哥烧饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B023B1AGT4","name":"麦哥烧饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B023B1AGT4","name":"麦哥烧饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r128', '游埠豆浆(东山弄店)', '游埠豆浆(东山弄店)', array[]::text[], '玉泉周边', 0.65, 9, '面食粉面', 15, 4.5, 0, 0, 30.259392, 120.128039, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥15，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGHC4Y4T","name":"游埠豆浆(东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r129', '青海牛肉拉面', '青海牛肉拉面', array[]::text[], '浙大路', 0.42, 6, '面食粉面', 14, 4, 0, 0, 30.26112, 120.126685, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '清真友好', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['清真友好']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥14，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JAPA6FL5","name":"青海牛肉拉面","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0JAPA6FL5","name":"青海牛肉拉面","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0JAPA6FL5","name":"青海牛肉拉面","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0JAPA6FL5","name":"青海牛肉拉面","query":{"type":"amap_around","campus":"玉泉","keyword":"清真","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"},{"type":"amap_poi","poi_id":"B0JAPA6FL5","name":"青海牛肉拉面","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r130', '沙县小吃(浙大求是村店)', '沙县小吃(浙大求是村店)', array[]::text[], '玉泉周边', 0.42, 6, '快餐小吃', 13, 3.8, 0, 0, 30.26114, 120.126632, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥13，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K177K1AT","name":"沙县小吃(浙大求是村店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K177K1AT","name":"沙县小吃(浙大求是村店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0K177K1AT","name":"沙县小吃(浙大求是村店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0K177K1AT","name":"沙县小吃(浙大求是村店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r131', '新丰小吃(浙大路分店)', '新丰小吃(浙大路分店)', array[]::text[], '浙大路', 0.64, 8, '面食粉面', 21, 4.5, 0, 0, 30.259694, 120.128182, '辣', '#c84b35', array['正餐', '玉泉', '近', '实惠', '人均30内', '辣', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥21，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFP9YRL","name":"新丰小吃(浙大路分店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFFP9YRL","name":"新丰小吃(浙大路分店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFFP9YRL","name":"新丰小吃(浙大路分店)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0FFFP9YRL","name":"新丰小吃(浙大路分店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0FFFP9YRL","name":"新丰小吃(浙大路分店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r132', '早阳肉包(玉古路小区店)', '早阳肉包(玉古路小区店)', array[]::text[], '青芝坞', 0.64, 9, '中餐简餐', 10, 4, 0, 0, 30.267929, 120.128186, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥10，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JD1GUIQI","name":"早阳肉包(玉古路小区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0JD1GUIQI","name":"早阳肉包(玉古路小区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r133', '碗里香·牛肉生煎(西湖东山弄店)', '碗里香·牛肉生煎(西湖东山弄店)', array[]::text[], '玉泉周边', 0.65, 9, '中餐简餐', 19, 4.4, 0, 0, 30.259186, 120.127772, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥19，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K0UR5U0C","name":"碗里香·牛肉生煎(西湖东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0K0UR5U0C","name":"碗里香·牛肉生煎(西湖东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0K0UR5U0C","name":"碗里香·牛肉生煎(西湖东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r134', '东山弄社区老年食堂', '东山弄社区老年食堂', array[]::text[], '玉泉周边', 0.6, 8, '中餐简餐', 13, 4, 0, 0, 30.259575, 120.127375, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '食堂', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥13，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K19CMJ7U","name":"东山弄社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K19CMJ7U","name":"东山弄社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K19CMJ7U","name":"东山弄社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0K19CMJ7U","name":"东山弄社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r135', '早阳肉包(杭州西湖风景名胜区店)', '早阳肉包(杭州西湖风景名胜区店)', array[]::text[], '玉泉周边', 0.57, 8, '中餐简餐', 12, 3.9, 0, 0, 30.260357, 120.127933, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥12，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K3YHCYJS","name":"早阳肉包(杭州西湖风景名胜区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K3YHCYJS","name":"早阳肉包(杭州西湖风景名胜区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r136', '麦当劳(杭州西湖区玉古路店)', '麦当劳(杭州西湖区玉古路店)', array[]::text[], '青芝坞', 0.58, 8, '中餐简餐', 30, 4.6, 0, 0, 30.266732, 120.128543, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥30，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKP7CJX2","name":"麦当劳(杭州西湖区玉古路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KKP7CJX2","name":"麦当劳(杭州西湖区玉古路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KKP7CJX2","name":"麦当劳(杭州西湖区玉古路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0KKP7CJX2","name":"麦当劳(杭州西湖区玉古路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r137', '味唯餐饮', '味唯餐饮', array[]::text[], '玉泉周边', 0.6, 8, '中餐简餐', 15, 4, 0, 0, 30.259652, 120.127535, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥15，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDP7O4CW","name":"味唯餐饮","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LDP7O4CW","name":"味唯餐饮","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LDP7O4CW","name":"味唯餐饮","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0LDP7O4CW","name":"味唯餐饮","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r138', '米村拌饭(黄龙体育馆店)', '米村拌饭(黄龙体育馆店)', array[]::text[], '黄龙', 0.77, 10, '中餐简餐', 24, 4.6, 0, 0, 30.26698, 120.130714, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥24，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K255PE7D","name":"米村拌饭(黄龙体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r139', '问粥道', '问粥道', array[]::text[], '青芝坞', 0.65, 9, '中餐简餐', 28, 4.5, 0, 0, 30.258325, 120.121158, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"砂锅","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"},{"type":"amap_poi","poi_id":"B0FFFFZQVP","name":"问粥道","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r140', '吉祥馄饨(杭州浙大玉泉店)', '吉祥馄饨(杭州浙大玉泉店)', array[]::text[], '玉泉校内', 0.43, 6, '面食粉面', 21, 3.8, 0, 0, 30.2677, 120.123784, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥21，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KG4CTDUP","name":"吉祥馄饨(杭州浙大玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KG4CTDUP","name":"吉祥馄饨(杭州浙大玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KG4CTDUP","name":"吉祥馄饨(杭州浙大玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KG4CTDUP","name":"吉祥馄饨(杭州浙大玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r141', '四季食堂(西湖体育馆店)', '四季食堂(西湖体育馆店)', array[]::text[], '黄龙', 0.85, 11, '中餐简餐', 17, 4.4, 0, 0, 30.268392, 120.130689, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '食堂', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥17，距离玉泉约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LAN5UH8W","name":"四季食堂(西湖体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0LAN5UH8W","name":"四季食堂(西湖体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":3},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0LAN5UH8W","name":"四季食堂(西湖体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r142', '张伙计鲜卤(黄龙店)', '张伙计鲜卤(黄龙店)', array[]::text[], '黄龙', 0.65, 9, '中餐简餐', 19, 4.1, 0, 0, 30.267814, 120.128483, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥19，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JD45PY5X","name":"张伙计鲜卤(黄龙店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r143', '徐记饼店', '徐记饼店', array[]::text[], '玉泉周边', 0.67, 9, '中餐简餐', 16, 4, 0, 0, 30.269697, 120.124841, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥16，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKZ4OH3T","name":"徐记饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KKZ4OH3T","name":"徐记饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0KKZ4OH3T","name":"徐记饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0KKZ4OH3T","name":"徐记饼店","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r144', '沙县小吃(黄龙体育馆店)', '沙县小吃(黄龙体育馆店)', array[]::text[], '黄龙', 0.76, 10, '快餐小吃', 15, 4.1, 0, 0, 30.266747, 120.130672, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥15，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLDQ2RU","name":"沙县小吃(黄龙体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFLDQ2RU","name":"沙县小吃(黄龙体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r145', '伊北味青海拉面(体中三路店)', '伊北味青海拉面(体中三路店)', array[]::text[], '西溪', 0.81, 11, '面食粉面', 20, 4.4, 0, 0, 30.266676, 120.131294, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K3CZ3Q11","name":"伊北味青海拉面(体中三路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0K3CZ3Q11","name":"伊北味青海拉面(体中三路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r146', '沙县小吃(庆丰公寓店)', '沙县小吃(庆丰公寓店)', array[]::text[], '玉泉周边', 0.74, 10, '快餐小吃', 15, 4, 0, 0, 30.270474, 120.123582, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥15，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIXOHUM","name":"沙县小吃(庆丰公寓店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFIXOHUM","name":"沙县小吃(庆丰公寓店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":3},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0FFIXOHUM","name":"沙县小吃(庆丰公寓店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r147', 'MR.DUNDUN(黄龙店)', 'MR.DUNDUN(黄龙店)', array[]::text[], '黄龙', 0.9, 12, '中餐简餐', 20, 4.5, 0, 0, 30.265114, 120.132843, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥20，距离玉泉约 0.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LG5SUTFK","name":"MR.DUNDUN(黄龙店)","query":{"type":"amap_around","campus":"玉泉","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r148', '老俞馄饨', '老俞馄饨', array[]::text[], '玉泉周边', 0.59, 8, '面食粉面', 35, 4.5, 0, 0, 30.259546, 120.12717, '面', '#6d8fbd', array['正餐', '玉泉', '近', '人均50内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥35，距离玉泉约 0.6km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUCCU8R7","name":"老俞馄饨","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LUCCU8R7","name":"老俞馄饨","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LUCCU8R7","name":"老俞馄饨","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0LUCCU8R7","name":"老俞馄饨","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0LUCCU8R7","name":"老俞馄饨","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r149', '大鼓生烫牛肉米线', '大鼓生烫牛肉米线', array[]::text[], '玉泉周边', 0.76, 10, '面食粉面', 25, 4.4, 0, 0, 30.266788, 120.130691, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUBUF1B8","name":"大鼓生烫牛肉米线","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0LUBUF1B8","name":"大鼓生烫牛肉米线","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LUBUF1B8","name":"大鼓生烫牛肉米线","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LUBUF1B8","name":"大鼓生烫牛肉米线","query":{"type":"amap_around","campus":"玉泉","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0LUBUF1B8","name":"大鼓生烫牛肉米线","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r150', '吉祥馄饨(杭州青芝坞店)', '吉祥馄饨(杭州青芝坞店)', array[]::text[], '青芝坞', 0.66, 9, '面食粉面', 25, 4.2, 0, 0, 30.257846, 120.123469, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥25，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:12:18.723Z"},{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0FFKQJW9D","name":"吉祥馄饨(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r151', '缙云俞师傅烧饼', '缙云俞师傅烧饼', array[]::text[], '青芝坞', 0.65, 9, '中餐简餐', 9, 3.5, 0, 0, 30.267839, 120.128462, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.5，人均约 ¥9，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G0FOC6N1","name":"缙云俞师傅烧饼","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0G0FOC6N1","name":"缙云俞师傅烧饼","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0G0FOC6N1","name":"缙云俞师傅烧饼","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0G0FOC6N1","name":"缙云俞师傅烧饼","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r152', '老妈妈手擀面', '老妈妈手擀面', array[]::text[], '青芝坞', 0.63, 8, '面食粉面', 29, 4.3, 0, 0, 30.258405, 120.121431, '辣', '#c84b35', array['正餐', '玉泉', '近', '实惠', '人均30内', '辣', '面食', '暖胃', '聚餐', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥29，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B14YXH","name":"老妈妈手擀面","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B023B14YXH","name":"老妈妈手擀面","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B023B14YXH","name":"老妈妈手擀面","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B023B14YXH","name":"老妈妈手擀面","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r153', '龙记面馆(黄龙华洋体育馆店)', '龙记面馆(黄龙华洋体育馆店)', array[]::text[], '黄龙', 0.77, 10, '面食粉面', 23, 4.3, 0, 0, 30.266928, 120.130705, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥23，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K09SXI0O","name":"龙记面馆(黄龙华洋体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0K09SXI0O","name":"龙记面馆(黄龙华洋体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0K09SXI0O","name":"龙记面馆(黄龙华洋体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0K09SXI0O","name":"龙记面馆(黄龙华洋体育馆店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r154', '余香小吃', '余香小吃', array[]::text[], '西湖', 1.16, 15, '快餐小吃', 11, 4.5, 0, 0, 30.27269, 120.117329, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥11，距离玉泉约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KU95OVHD","name":"余香小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":5},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KU95OVHD","name":"余香小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KU95OVHD","name":"余香小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":5},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r155', '盼丰年沙县小吃', '盼丰年沙县小吃', array[]::text[], '黄龙', 0.63, 8, '快餐小吃', 20, 3.9, 0, 0, 30.267884, 120.128166, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥20，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDCZRG32","name":"盼丰年沙县小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LDCZRG32","name":"盼丰年沙县小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LDCZRG32","name":"盼丰年沙县小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0LDCZRG32","name":"盼丰年沙县小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r156', '肯德基(浙江省黄龙体育中心店)', '肯德基(浙江省黄龙体育中心店)', array[]::text[], '黄龙', 0.79, 11, '快餐小吃', 30, 4.6, 0, 0, 30.267136, 120.130793, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥30，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KBK9AOJT","name":"肯德基(浙江省黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KBK9AOJT","name":"肯德基(浙江省黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KBK9AOJT","name":"肯德基(浙江省黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r157', '卤儿道道·荤素饭铺(西湖黄龙公元大厦店)', '卤儿道道·荤素饭铺(西湖黄龙公元大厦店)', array[]::text[], '黄龙', 0.73, 10, '快餐小吃', 26, 4.3, 0, 0, 30.264419, 120.131125, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '轻负担', '下饭']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃', '清爽']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['轻负担']::text[], array['下饭', '小吃', '清爽', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥26，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0TOB8XF","name":"卤儿道道·荤素饭铺(西湖黄龙公元大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0L0TOB8XF","name":"卤儿道道·荤素饭铺(西湖黄龙公元大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0L0TOB8XF","name":"卤儿道道·荤素饭铺(西湖黄龙公元大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0L0TOB8XF","name":"卤儿道道·荤素饭铺(西湖黄龙公元大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0L0TOB8XF","name":"卤儿道道·荤素饭铺(西湖黄龙公元大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r158', '浙大玉泉北门炒粉干(庆丰农贸市场店)', '浙大玉泉北门炒粉干(庆丰农贸市场店)', array[]::text[], '玉泉校内', 0.71, 9, '面食粉面', 21, 4, 0, 0, 30.270145, 120.12324, '面', '#6d8fbd', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥21，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B172LV","name":"浙大玉泉北门炒粉干(庆丰农贸市场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B023B172LV","name":"浙大玉泉北门炒粉干(庆丰农贸市场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B023B172LV","name":"浙大玉泉北门炒粉干(庆丰农贸市场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r159', '肯德基(杭州东山弄店)', '肯德基(杭州东山弄店)', array[]::text[], '浙大路', 0.65, 9, '快餐小吃', 36, 4.5, 0, 0, 30.26001, 120.128702, '饭', '#f0aa38', array['正餐', '玉泉', '近', '人均50内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥36，距离玉泉约 0.6km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KUGAN64N","name":"肯德基(杭州东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KUGAN64N","name":"肯德基(杭州东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KUGAN64N","name":"肯德基(杭州东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KUGAN64N","name":"肯德基(杭州东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r160', '时光餐厅(兰家湾店)', '时光餐厅(兰家湾店)', array[]::text[], '青芝坞', 0.57, 8, '快餐小吃', 25, 3.9, 0, 0, 30.258669, 120.12412, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥25，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHQ76PP","name":"时光餐厅(兰家湾店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFHQ76PP","name":"时光餐厅(兰家湾店)","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFHQ76PP","name":"时光餐厅(兰家湾店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0FFHQ76PP","name":"时光餐厅(兰家湾店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFHQ76PP","name":"时光餐厅(兰家湾店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r161', '巴比馒头(黄龙时代广场店)', '巴比馒头(黄龙时代广场店)', array[]::text[], '黄龙', 1.04, 14, '快餐小吃', 5, 3.9, 0, 0, 30.27311, 120.1249, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥5，距离玉泉约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HB24UD7Y","name":"巴比馒头(黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0HB24UD7Y","name":"巴比馒头(黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r162', '德克士(黄龙体育中心体育场店)', '德克士(黄龙体育中心体育场店)', array[]::text[], '黄龙', 0.85, 11, '快餐小吃', 32, 4.6, 0, 0, 30.265597, 120.132218, '饭', '#f0aa38', array['正餐', '玉泉', '近', '人均50内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥32，距离玉泉约 0.9km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KAVZ6QMQ","name":"德克士(黄龙体育中心体育场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KAVZ6QMQ","name":"德克士(黄龙体育中心体育场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KAVZ6QMQ","name":"德克士(黄龙体育中心体育场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r163', '正新鸡排(杭州玉泉店)', '正新鸡排(杭州玉泉店)', array[]::text[], '玉泉校内', 0.32, 4, '快餐小吃', 25, 3.3, 0, 0, 30.26262, 120.126628, '校', '#4f8b65', array['正餐', '玉泉', '近', '实惠', '人均30内', '校内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均约 ¥25，距离玉泉约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GDDAQRLN","name":"正新鸡排(杭州玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0GDDAQRLN","name":"正新鸡排(杭州玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0GDDAQRLN","name":"正新鸡排(杭州玉泉店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r164', '塔斯汀中国汉堡(杭州市黄龙时代广场店)', '塔斯汀中国汉堡(杭州市黄龙时代广场店)', array[]::text[], '黄龙', 1.07, 14, '异国简餐', 20, 4.4, 0, 0, 30.273329, 120.124826, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离玉泉约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IKPU1XRH","name":"塔斯汀中国汉堡(杭州市黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0IKPU1XRH","name":"塔斯汀中国汉堡(杭州市黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0IKPU1XRH","name":"塔斯汀中国汉堡(杭州市黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r165', '百味福小吃', '百味福小吃', array[]::text[], '玉泉周边', 0.64, 9, '快餐小吃', 17, 3.4, 0, 0, 30.259414, 120.127877, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.4，人均约 ¥17，距离玉泉约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KDD63GKQ","name":"百味福小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KDD63GKQ","name":"百味福小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KDD63GKQ","name":"百味福小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0KDD63GKQ","name":"百味福小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0KDD63GKQ","name":"百味福小吃","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r166', '老乡鸡(杭州支付宝店)', '老乡鸡(杭州支付宝店)', array[]::text[], '杭州国家高新技术产业开发区', 1.03, 14, '异国简餐', 26, 4.5, 0, 0, 30.273037, 120.12488, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥26，距离玉泉约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H0TGO7DS","name":"老乡鸡(杭州支付宝店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0H0TGO7DS","name":"老乡鸡(杭州支付宝店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0H0TGO7DS","name":"老乡鸡(杭州支付宝店)","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r167', '熊鬻记台湾饭团(古荡路地铁站店)', '熊鬻记台湾饭团(古荡路地铁站店)', array[]::text[], '西溪', 0.8, 11, '快餐小吃', 11, 3.3, 0, 0, 30.271006, 120.123085, '饭', '#f0aa38', array['正餐', '玉泉', '近', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均约 ¥11，距离玉泉约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JDTU85VH","name":"熊鬻记台湾饭团(古荡路地铁站店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0JDTU85VH","name":"熊鬻记台湾饭团(古荡路地铁站店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r168', '蜀老板东北老式砂锅麻辣烫', '蜀老板东北老式砂锅麻辣烫', array[]::text[], '古翠文一片区', 1.18, 16, '火锅麻辣烫', 21, 4, 0, 0, 30.274125, 120.120875, '辣', '#c84b35', array['正餐', '玉泉', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐', '夜宵']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥21，距离玉泉约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LKVM4LEI","name":"蜀老板东北老式砂锅麻辣烫","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LKVM4LEI","name":"蜀老板东北老式砂锅麻辣烫","query":{"type":"amap_around","campus":"玉泉","keyword":"砂锅","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0LKVM4LEI","name":"蜀老板东北老式砂锅麻辣烫","query":{"type":"amap_around","campus":"玉泉","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r169', '九里香烧烤(杭州西湖风景名胜区店)', '九里香烧烤(杭州西湖风景名胜区店)', array[]::text[], '青芝坞', 0.65, 9, '烧烤烤肉', 39, 3.7, 0, 0, 30.258065, 120.122364, '辣', '#c84b35', array['正餐', '玉泉', '近', '人均50内', '辣', '烧烤', '火锅', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥39，距离玉泉约 0.6km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IRGSCP7G","name":"九里香烧烤(杭州西湖风景名胜区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r170', '张亮麻辣烫(塘苗路店)', '张亮麻辣烫(塘苗路店)', array[]::text[], '西溪', 1.15, 15, '火锅麻辣烫', 30, 4.2, 0, 0, 30.274155, 120.123287, '辣', '#c84b35', array['正餐', '玉泉', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥30，距离玉泉约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIW8CB5","name":"张亮麻辣烫(塘苗路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0FFIW8CB5","name":"张亮麻辣烫(塘苗路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r171', '麦当劳(杭州黄龙万科中心餐厅)', '麦当劳(杭州黄龙万科中心餐厅)', array[]::text[], '黄龙', 1.35, 18, '异国简餐', 35, 4.7, 0, 0, 30.275552, 120.126912, '辣', '#c84b35', array['正餐', '玉泉', '人均50内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array['辣']::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥35，距离玉泉约 1.3km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G16SZCOQ","name":"麦当劳(杭州黄龙万科中心餐厅)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0G16SZCOQ","name":"麦当劳(杭州黄龙万科中心餐厅)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0G16SZCOQ","name":"麦当劳(杭州黄龙万科中心餐厅)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r172', '麦当劳(华星科技大厦店)', '麦当劳(华星科技大厦店)', array[]::text[], '古荡', 1.41, 19, '异国简餐', 28, 4.5, 0, 0, 30.276391, 120.12516, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '下饭', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离玉泉约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0ID6D1T4L","name":"麦当劳(华星科技大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0ID6D1T4L","name":"麦当劳(华星科技大厦店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r173', 'THREEFIVE·美式汉堡', 'THREEFIVE·美式汉堡', array[]::text[], '青芝坞', 1.04, 14, '异国简餐', 23, 3.6, 0, 0, 30.270875, 120.130625, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.6，人均约 ¥23，距离玉泉约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LR2D4SH1","name":"THREEFIVE·美式汉堡","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0LR2D4SH1","name":"THREEFIVE·美式汉堡","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0LR2D4SH1","name":"THREEFIVE·美式汉堡","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r174', 'Grassy salad(黄龙时代广场店)', 'Grassy salad(黄龙时代广场店)', array[]::text[], '黄龙', 1.03, 14, '异国简餐', 37, 4.1, 0, 0, 30.272941, 120.125294, '异', '#4d79b8', array['正餐', '玉泉', '人均50内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '拍照', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥37，距离玉泉约 1.0km；当前标签为 正餐、人均50内、拍照，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J1V533A2","name":"Grassy salad(黄龙时代广场店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r175', '山烤辣鸡(西溪路店)', '山烤辣鸡(西溪路店)', array[]::text[], '黄龙', 0.61, 8, '异国简餐', 68, 4.6, 0, 0, 30.268046, 120.127623, '辣', '#c84b35', array['正餐', '玉泉', '近', '辣', '拍照', '烧烤', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '夜宵', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '拍照', '快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥68，距离玉泉约 0.6km；当前标签为 正餐、近、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"韩餐","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"},{"type":"amap_poi","poi_id":"B0FFF5WQ2I","name":"山烤辣鸡(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r176', '华莱士·全鸡汉堡(星光城二店)', '华莱士·全鸡汉堡(星光城二店)', array[]::text[], '古翠文一片区', 1.58, 21, '异国简餐', 18, 4.3, 0, 0, 30.277753, 120.120233, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥18，距离玉泉约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IGHCEN46","name":"华莱士·全鸡汉堡(星光城二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":4},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0IGHCEN46","name":"华莱士·全鸡汉堡(星光城二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0IGHCEN46","name":"华莱士·全鸡汉堡(星光城二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r177', '鲜渔厨豆花烤鱼.烧烤.精酿小酒馆', '鲜渔厨豆花烤鱼.烧烤.精酿小酒馆', array[]::text[], '黄龙', 0.91, 12, '烧烤烤肉', 56, 4.6, 0, 0, 30.264813, 120.132908, '辣', '#c84b35', array['正餐', '玉泉', '辣', '烧烤', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '玉泉']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥56，距离玉泉约 0.9km；当前标签为 正餐、辣、烧烤，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKN154DC","name":"鲜渔厨豆花烤鱼.烧烤.精酿小酒馆","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KKN154DC","name":"鲜渔厨豆花烤鱼.烧烤.精酿小酒馆","query":{"type":"amap_around","campus":"玉泉","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0KKN154DC","name":"鲜渔厨豆花烤鱼.烧烤.精酿小酒馆","query":{"type":"amap_around","campus":"玉泉","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r178', '那些年潮汕牛肉火锅(杭州青芝坞店)', '那些年潮汕牛肉火锅(杭州青芝坞店)', array[]::text[], '青芝坞', 0.65, 9, '火锅麻辣烫', 65, 4.5, 0, 0, 30.258394, 120.120915, '辣', '#c84b35', array['正餐', '玉泉', '近', '辣', '火锅', '聚餐', '夜宵', '下饭']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥65，距离玉泉约 0.7km；当前标签为 正餐、近、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUUSPVZB","name":"那些年潮汕牛肉火锅(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"},{"type":"amap_poi","poi_id":"B0LUUSPVZB","name":"那些年潮汕牛肉火锅(杭州青芝坞店)","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r179', '浙大求是社区老年食堂', '浙大求是社区老年食堂', array[]::text[], '黄龙', 0.39, 5, '校内食堂', 20, 3.7, 0, 0, 30.264085, 120.127657, '校', '#4f8b65', array['正餐', '玉泉', '近', '实惠', '人均30内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均待学生补充，距离玉泉约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K1RUPE24","name":"浙大求是社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K1RUPE24","name":"浙大求是社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0K1RUPE24","name":"浙大求是社区老年食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r180', '汉堡王(杭州星光城)', '汉堡王(杭州星光城)', array[]::text[], '古翠文一片区', 1.48, 20, '异国简餐', 30, 4.5, 0, 0, 30.276891, 120.121086, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离玉泉约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0H6PHPSLW","name":"汉堡王(杭州星光城)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0H6PHPSLW","name":"汉堡王(杭州星光城)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r181', '汤布里波·炸鸡新贵(黄龙国际中心店)', '汤布里波·炸鸡新贵(黄龙国际中心店)', array[]::text[], '黄龙', 1.48, 20, '异国简餐', 30, 4.5, 0, 0, 30.276028, 120.129601, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离玉泉约 1.5km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDJBPB8U","name":"汤布里波·炸鸡新贵(黄龙国际中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0LDJBPB8U","name":"汤布里波·炸鸡新贵(黄龙国际中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r182', '华莱士·全鸡汉堡(黄姑山二店)', '华莱士·全鸡汉堡(黄姑山二店)', array[]::text[], '西湖', 1.64, 22, '异国简餐', 18, 4.3, 0, 0, 30.275717, 120.13366, '饭', '#f0aa38', array['正餐', '玉泉', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥18，距离玉泉约 1.6km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":4},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"玉泉","keyword":"汉堡","page":2},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r183', '奈久食寿司·丼饭(文三路地铁站店)', '奈久食寿司·丼饭(文三路地铁站店)', array[]::text[], '古荡', 1.43, 19, '异国简餐', 18, 3.9, 0, 0, 30.276625, 120.125025, '异', '#4d79b8', array['正餐', '玉泉', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '下饭', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['下饭', '拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥18，距离玉泉约 1.4km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KRK778FC","name":"奈久食寿司·丼饭(文三路地铁站店)","query":{"type":"amap_around","campus":"玉泉","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r184', '杨国福麻辣烫(西湖区文三路店)', '杨国福麻辣烫(西湖区文三路店)', array[]::text[], '杭州国家高新技术产业开发区', 1.4, 19, '火锅麻辣烫', 31, 4.3, 0, 0, 30.276063, 120.120392, '辣', '#c84b35', array['正餐', '玉泉', '人均50内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '玉泉']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥31，距离玉泉约 1.4km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG48RLU","name":"杨国福麻辣烫(西湖区文三路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r185', '胖子烧饼(文三路)', '胖子烧饼(文三路)', array[]::text[], '西湖', 1.97, 26, '烧烤烤肉', 11, 4.5, 0, 0, 30.277027, 120.137253, '辣', '#c84b35', array['正餐', '玉泉', '实惠', '人均30内', '辣', '烧烤', '面食', '暖胃', '聚餐', '夜宵']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '暖胃', '面食', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥11，距离玉泉约 2.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"玉泉","keyword":"馄饨","page":2},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"玉泉","keyword":"自选快餐","page":4},"fetched_at":"2026-05-09T17:12:18.723Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"玉泉","keyword":"烤肉","page":3},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r186', '必胜客(黄龙体育中心店)', '必胜客(黄龙体育中心店)', array[]::text[], '黄龙', 0.83, 11, '异国简餐', 62, 4.5, 0, 0, 30.266932, 120.131403, '面', '#6d8fbd', array['正餐', '玉泉', '近', '面食', '暖胃', '快餐', '一人食', '异国料理']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '快餐']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥62，距离玉泉约 0.8km；当前标签为 正餐、近、面食，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGDMLHZ0","name":"必胜客(黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0KGDMLHZ0","name":"必胜客(黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:12:18.720Z"},{"type":"amap_poi","poi_id":"B0KGDMLHZ0","name":"必胜客(黄龙体育中心店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r187', '艳华阿姨麻辣烫炸炸(中茵大厦A座店)', '艳华阿姨麻辣烫炸炸(中茵大厦A座店)', array[]::text[], '杭州国家高新技术产业开发区', 1.49, 20, '火锅麻辣烫', 37, 4.6, 0, 0, 30.276604, 120.12808, '辣', '#c84b35', array['正餐', '玉泉', '人均50内', '辣', '火锅', '快餐', '一人食', '聚餐', '夜宵', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥37，距离玉泉约 1.5km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JRSYHMVH","name":"艳华阿姨麻辣烫炸炸(中茵大厦A座店)","query":{"type":"amap_around","campus":"玉泉","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0JRSYHMVH","name":"艳华阿姨麻辣烫炸炸(中茵大厦A座店)","query":{"type":"amap_around","campus":"玉泉","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:12:18.722Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r188', '小火锅', '小火锅', array[]::text[], '玉泉校内', 0.32, 4, '火锅麻辣烫', 35, 3.3, 0, 0, 30.266248, 120.125384, '辣', '#c84b35', array['正餐', '玉泉', '近', '人均50内', '校内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃']::text[], '公开信息整理：高德显示评分 3.3，人均待学生补充，距离玉泉约 0.3km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0YA6306","name":"小火锅","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0L0YA6306","name":"小火锅","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0L0YA6306","name":"小火锅","query":{"type":"amap_around","campus":"玉泉","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"},{"type":"amap_poi","poi_id":"B0L0YA6306","name":"小火锅","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0L0YA6306","name":"小火锅","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r189', '西溪路419号烧烤店', '西溪路419号烧烤店', array[]::text[], '玉泉周边', 0.71, 9, '校内食堂', 20, 3.3, 0, 0, 30.270175, 120.123175, '辣', '#c84b35', array['正餐', '玉泉', '近', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '食堂']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均待学生补充，距离玉泉约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":3},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"玉泉","keyword":"烧烤","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"玉泉","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":3},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r190', '红恩小吃(西溪路店)', '红恩小吃(西溪路店)', array[]::text[], '西湖', 2.04, 27, '校内食堂', 42, 4.6, 0, 0, 30.269458, 120.143775, '辣', '#c84b35', array['正餐', '玉泉', '人均50内', '辣', '面食', '暖胃', '快餐', '一人食', '聚餐', '食堂']::text[], array['一人食', '聚餐', '赶课快吃', '中餐', '晚餐', '暖胃', '面食', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥42，距离玉泉约 2.0km；当前标签为 正餐、人均50内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:12:18.721Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"酸菜鱼","page":2},"fetched_at":"2026-05-09T17:12:18.722Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"玉泉","keyword":"炒饭","page":2},"fetched_at":"2026-05-09T17:12:18.723Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r191', '库迪咖啡(浙大玉泉外经贸楼店)', '库迪咖啡(浙大玉泉外经贸楼店)', array[]::text[], '玉泉校内', 0.39, 5, '咖啡', 9, 4.5, 0, 0, 30.260527, 120.125086, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥9，距离玉泉约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LG0R6CTT","name":"库迪咖啡(浙大玉泉外经贸楼店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LG0R6CTT","name":"库迪咖啡(浙大玉泉外经贸楼店)","query":{"type":"amap_around","campus":"玉泉","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r192', '古茗(古茗浙大玉泉校区店)', '古茗(古茗浙大玉泉校区店)', array[]::text[], '玉泉校内', 0.2, 3, '茶饮', 17, 4.4, 0, 0, 30.265409, 120.124374, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '奶茶', '轻负担']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥17，距离玉泉约 0.2km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LATC7E10","name":"古茗(古茗浙大玉泉校区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0LATC7E10","name":"古茗(古茗浙大玉泉校区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r193', '库迪咖啡(浙大玉泉玉古路校外店)', '库迪咖啡(浙大玉泉玉古路校外店)', array[]::text[], '玉泉校内', 0.35, 5, '咖啡', 9, 4.3, 0, 0, 30.261859, 120.126373, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥9，距离玉泉约 0.3km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L33CAOPH","name":"库迪咖啡(浙大玉泉玉古路校外店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0L33CAOPH","name":"库迪咖啡(浙大玉泉玉古路校外店)","query":{"type":"amap_around","campus":"玉泉","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r194', '蜜雪冰城', '蜜雪冰城', array[]::text[], '青芝坞', 0.64, 9, '茶饮', 6, 4.5, 0, 0, 30.267884, 120.128322, '甜', '#d9915d', array['饮品', '玉泉', '近', '实惠', '人均30内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥6，距离玉泉约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKVX2M54","name":"蜜雪冰城","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KKVX2M54","name":"蜜雪冰城","query":{"type":"amap_around","campus":"玉泉","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r195', '可莎蜜兒(玉泉)', '可莎蜜兒(玉泉)', array[]::text[], '青芝坞', 0.32, 4, '茶饮', 23, 4.5, 0, 0, 30.262876, 120.126739, '甜', '#d9915d', array['饮品', '玉泉', '近', '实惠', '人均30内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥23，距离玉泉约 0.3km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B156GB","name":"可莎蜜兒(玉泉)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B023B156GB","name":"可莎蜜兒(玉泉)","query":{"type":"amap_around","campus":"玉泉","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r196', '麦思威西餐厅', '麦思威西餐厅', array[]::text[], '玉泉校内', 0.32, 4, '茶饮', 26, 4.6, 0, 0, 30.266359, 120.125046, '辣', '#c84b35', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '辣', '拍照', '咖啡', '奶茶']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array['辣']::text[], array['小吃', '拍照', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥26，距离玉泉约 0.3km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJMI75B","name":"麦思威西餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0FFJMI75B","name":"麦思威西餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:12:18.724Z"},{"type":"amap_poi","poi_id":"B0FFJMI75B","name":"麦思威西餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"},{"type":"amap_poi","poi_id":"B0FFJMI75B","name":"麦思威西餐厅","query":{"type":"amap_around","campus":"玉泉","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:12:18.727Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r197', '瑞幸咖啡(浙大玉泉新桥门店)', '瑞幸咖啡(浙大玉泉新桥门店)', array[]::text[], '玉泉校内', 0.37, 5, '咖啡', 14, 4.1, 0, 0, 30.265252, 120.127073, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥14，距离玉泉约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KAJZUJ6F","name":"瑞幸咖啡(浙大玉泉新桥门店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0KAJZUJ6F","name":"瑞幸咖啡(浙大玉泉新桥门店)","query":{"type":"amap_around","campus":"玉泉","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"},{"type":"amap_poi","poi_id":"B0KAJZUJ6F","name":"瑞幸咖啡(浙大玉泉新桥门店)","query":{"type":"amap_around","campus":"玉泉","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r198', '瑞幸咖啡(东山弄店)', '瑞幸咖啡(东山弄店)', array[]::text[], '玉泉周边', 0.68, 9, '茶饮', 14, 4.6, 0, 0, 30.259062, 120.128005, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥14，距离玉泉约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KBZS654B","name":"瑞幸咖啡(东山弄店)","query":{"type":"amap_around","campus":"玉泉","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r199', '一鸣真鲜奶吧(杭州浙大玉泉校区店)', '一鸣真鲜奶吧(杭州浙大玉泉校区店)', array[]::text[], '玉泉校内', 0.44, 6, '茶饮', 14, 4.1, 0, 0, 30.267775, 120.123775, '甜', '#d9915d', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥14，距离玉泉约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKJ51Z4M","name":"一鸣真鲜奶吧(杭州浙大玉泉校区店)","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:12:18.718Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r200', '小桥门面包坊', '小桥门面包坊', array[]::text[], '玉泉校内', 0.3, 4, '甜品烘焙', 26, 4.3, 0, 0, 30.263825, 120.126675, '甜', '#d9915d', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '甜品', '面食', '暖胃']::text[], array['赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '暖胃', '面食', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '拍照', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥26，距离玉泉约 0.3km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L17S9038","name":"小桥门面包坊","query":{"type":"amap_around","campus":"玉泉","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:12:18.718Z"},{"type":"amap_poi","poi_id":"B0L17S9038","name":"小桥门面包坊","query":{"type":"amap_around","campus":"玉泉","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:12:18.725Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r201', '古茗(西湖玉泉北门店)', '古茗(西湖玉泉北门店)', array[]::text[], '玉泉周边', 0.74, 10, '茶饮', 13, 4.5, 0, 0, 30.270502, 120.123497, '咖', '#8c6338', array['饮品', '玉泉', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥13，距离玉泉约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0G0R697FX","name":"古茗(西湖玉泉北门店)","query":{"type":"amap_around","campus":"玉泉","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r202', '1点点(玉泉北门店)', '1点点(玉泉北门店)', array[]::text[], '玉泉校内', 0.71, 9, '茶饮', 17, 4.5, 0, 0, 30.270177, 120.124024, '甜', '#d9915d', array['饮品', '玉泉', '近', '实惠', '人均30内', '校内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离玉泉约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFJVKVGQ","name":"1点点(玉泉北门店)","query":{"type":"amap_around","campus":"玉泉","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r203', '浙大附中食堂', '浙大附中食堂', array[]::text[], '黄龙', 1.04, 14, '校内食堂', 20, 2.6, 0, 0, 30.258125, 120.132225, '校', '#4f8b65', array['正餐', '玉泉', '实惠', '人均30内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '中餐', '晚餐', '下饭', '实惠', '玉泉']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 2.6，人均待学生补充，距离玉泉约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.83。', '[{"type":"amap_poi","poi_id":"B0FFI73YW7","name":"浙大附中食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"中餐","page":4},"fetched_at":"2026-05-09T17:12:18.719Z"},{"type":"amap_poi","poi_id":"B0FFI73YW7","name":"浙大附中食堂","query":{"type":"amap_around","campus":"玉泉","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:12:18.726Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r204', '六妹螺蛳粉(黄龙店)', '六妹螺蛳粉(黄龙店)', array[]::text[], '黄龙', 0.74, 10, '面食粉面', 15, 4.7, 0, 0, 30.275811, 120.134678, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥15，距离西溪约 0.7km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B0KG7HA32W","name":"六妹螺蛳粉(黄龙店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0KG7HA32W","name":"六妹螺蛳粉(黄龙店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:13:23.371Z"},{"type":"amap_poi","poi_id":"B0KG7HA32W","name":"六妹螺蛳粉(黄龙店)","query":{"type":"web_clue","campus":"西溪","keyword":"浙江大学 西溪 文三路 美食","title":"西溪校区文三路周边公开餐饮信息检索","url":"https://ditu.amap.com/","publishedAt":"2026-01-01"},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r205', '浙江大学西溪校区北园餐厅', '浙江大学西溪校区北园餐厅', array[]::text[], '西溪校内', 0.6, 8, '中餐简餐', 12, 4.1, 0, 0, 30.278814, 120.137629, '校', '#4f8b65', array['正餐', '西溪', '近', '实惠', '人均30内', '校内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥12，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 1.00。', '[{"type":"amap_poi","poi_id":"B023B18RDB","name":"浙江大学西溪校区北园餐厅","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B18RDB","name":"浙江大学西溪校区北园餐厅","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B023B18RDB","name":"浙江大学西溪校区北园餐厅","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:13:23.371Z"},{"type":"amap_poi","poi_id":"B023B18RDB","name":"浙江大学西溪校区北园餐厅","query":{"type":"web_clue","campus":"西溪","keyword":"浙江大学 西溪 食堂","title":"浙江大学西溪校区食堂公开信息检索","url":"https://www.zju.edu.cn/","publishedAt":"2026-01-01"},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r206', '浙江大学西溪校区食堂', '浙江大学西溪校区食堂', array[]::text[], '西溪校内', 0.21, 3, '校内食堂', 16, 4.4, 0, 0, 30.276764, 120.140946, '校', '#4f8b65', array['正餐', '西溪', '近', '实惠', '人均30内', '校内', '聚餐', '食堂', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离西溪约 0.2km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG43EBN","name":"浙江大学西溪校区食堂","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFG43EBN","name":"浙江大学西溪校区食堂","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFG43EBN","name":"浙江大学西溪校区食堂","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r207', '游埠豆浆(东部软件园店)', '游埠豆浆(东部软件园店)', array[]::text[], '文三路', 0.31, 4, '快餐小吃', 16, 4.5, 0, 0, 30.27779, 120.143765, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥16，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KKZXULAL","name":"游埠豆浆(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0KKZXULAL","name":"游埠豆浆(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0KKZXULAL","name":"游埠豆浆(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r208', '胖子烧饼(文三路)', '胖子烧饼(文三路)', array[]::text[], '文三路', 0.53, 7, '烧烤烤肉', 11, 4.5, 0, 0, 30.277027, 120.137253, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '烧烤', '面食', '暖胃', '聚餐']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥11，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"西溪","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B0FFFDXGJA","name":"胖子烧饼(文三路)","query":{"type":"amap_around","campus":"西溪","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r209', '浙江大学西溪校区教工食堂', '浙江大学西溪校区教工食堂', array[]::text[], '西溪校内', 0.23, 3, '校内食堂', 10, 3.9, 0, 0, 30.276887, 120.140773, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '校内', '面食', '暖胃', '聚餐', '食堂']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥10，距离西溪约 0.2km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B16BTA","name":"浙江大学西溪校区教工食堂","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B16BTA","name":"浙江大学西溪校区教工食堂","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B16BTA","name":"浙江大学西溪校区教工食堂","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B023B16BTA","name":"浙江大学西溪校区教工食堂","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B023B16BTA","name":"浙江大学西溪校区教工食堂","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r210', '文武王氏烧饼·无矾油条(马塍路店)', '文武王氏烧饼·无矾油条(马塍路店)', array[]::text[], '文三路', 0.51, 7, '快餐小吃', 13, 4.5, 0, 0, 30.276553, 120.147464, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥13，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K2798U35","name":"文武王氏烧饼·无矾油条(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0K2798U35","name":"文武王氏烧饼·无矾油条(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0K2798U35","name":"文武王氏烧饼·无矾油条(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0K2798U35","name":"文武王氏烧饼·无矾油条(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r211', '新丰小吃(文三路分店)', '新丰小吃(文三路分店)', array[]::text[], '文三路', 0.56, 7, '面食粉面', 14, 4.6, 0, 0, 30.278373, 120.146989, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '面食', '暖胃', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥14，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B06RJ0","name":"新丰小吃(文三路分店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B06RJ0","name":"新丰小吃(文三路分店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B06RJ0","name":"新丰小吃(文三路分店)","query":{"type":"amap_around","campus":"西溪","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B023B06RJ0","name":"新丰小吃(文三路分店)","query":{"type":"amap_around","campus":"西溪","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B023B06RJ0","name":"新丰小吃(文三路分店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r212', '文武王氏烧饼·无矾油条(西溪路店)', '文武王氏烧饼·无矾油条(西溪路店)', array[]::text[], '西溪周边', 0.6, 8, '中餐简餐', 15, 4.7, 0, 0, 30.269925, 120.143103, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥15，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFA6IKC","name":"文武王氏烧饼·无矾油条(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFFA6IKC","name":"文武王氏烧饼·无矾油条(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFFA6IKC","name":"文武王氏烧饼·无矾油条(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B0FFFA6IKC","name":"文武王氏烧饼·无矾油条(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFFA6IKC","name":"文武王氏烧饼·无矾油条(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r213', '火烧饼灌鸡蛋(立元创业楼店)', '火烧饼灌鸡蛋(立元创业楼店)', array[]::text[], '古荡', 0.57, 8, '中餐简餐', 10, 4.4, 0, 0, 30.276013, 120.136447, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥10，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JA5UEZAH","name":"火烧饼灌鸡蛋(立元创业楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0JA5UEZAH","name":"火烧饼灌鸡蛋(立元创业楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0JA5UEZAH","name":"火烧饼灌鸡蛋(立元创业楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0JA5UEZAH","name":"火烧饼灌鸡蛋(立元创业楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r214', '老娘舅(杭州西溪数码港店)', '老娘舅(杭州西溪数码港店)', array[]::text[], '文三路', 0.29, 4, '中餐简餐', 23, 4.4, 0, 0, 30.277408, 120.144225, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥23，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B023B0BEPF","name":"老娘舅(杭州西溪数码港店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r215', '周素珍馄饨店(文三路店)', '周素珍馄饨店(文三路店)', array[]::text[], '文三路', 0.58, 8, '面食粉面', 15, 4.5, 0, 0, 30.278756, 120.146968, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '轻负担', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['轻负担']::text[], array['暖胃', '面食', '清爽', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥15，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHJTDZ4","name":"周素珍馄饨店(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFHJTDZ4","name":"周素珍馄饨店(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFHJTDZ4","name":"周素珍馄饨店(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0FFHJTDZ4","name":"周素珍馄饨店(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r216', '泮芳春煎饺(马塍路店)', '泮芳春煎饺(马塍路店)', array[]::text[], '文三路', 0.56, 7, '中餐简餐', 19, 4.6, 0, 0, 30.278396, 120.146976, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥19，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LBDO5RZK","name":"泮芳春煎饺(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LBDO5RZK","name":"泮芳春煎饺(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LBDO5RZK","name":"泮芳春煎饺(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0LBDO5RZK","name":"泮芳春煎饺(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0LBDO5RZK","name":"泮芳春煎饺(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r217', '乐回头饺子店', '乐回头饺子店', array[]::text[], '黄龙', 0.46, 6, '面食粉面', 21, 4.5, 0, 0, 30.271228, 120.141458, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '轻负担', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['轻负担']::text[], array['暖胃', '面食', '清爽', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥21，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFFA72ST","name":"乐回头饺子店","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFFA72ST","name":"乐回头饺子店","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFFA72ST","name":"乐回头饺子店","query":{"type":"amap_around","campus":"西溪","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0FFFA72ST","name":"乐回头饺子店","query":{"type":"amap_around","campus":"西溪","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0FFFA72ST","name":"乐回头饺子店","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r218', '胖子烧饼(联强大厦店)', '胖子烧饼(联强大厦店)', array[]::text[], '文三路', 0.66, 9, '面食粉面', 13, 4.5, 0, 0, 30.276853, 120.135802, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥13，距离西溪约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GRMCZIHA","name":"胖子烧饼(联强大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0GRMCZIHA","name":"胖子烧饼(联强大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0GRMCZIHA","name":"胖子烧饼(联强大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r219', '兰溪手擀面', '兰溪手擀面', array[]::text[], '西溪周边', 0.35, 5, '面食粉面', 20, 4.1, 0, 0, 30.277825, 120.144575, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥20，距离西溪约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LUULSL3J","name":"兰溪手擀面","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LUULSL3J","name":"兰溪手擀面","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LUULSL3J","name":"兰溪手擀面","query":{"type":"amap_around","campus":"西溪","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LUULSL3J","name":"兰溪手擀面","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r220', '啊臻味道米粉(文三数字生活街区店)', '啊臻味道米粉(文三数字生活街区店)', array[]::text[], '文三路', 0.27, 4, '面食粉面', 36, 4.6, 0, 0, 30.277683, 120.141967, '面', '#6d8fbd', array['正餐', '西溪', '近', '人均50内', '面食', '暖胃', '聚餐', '下饭']::text[], array['聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭', '面食']::text[], array['堂食']::text[], array['中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥36，距离西溪约 0.3km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFI5DX7X","name":"啊臻味道米粉(文三数字生活街区店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFI5DX7X","name":"啊臻味道米粉(文三数字生活街区店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0FFI5DX7X","name":"啊臻味道米粉(文三数字生活街区店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFI5DX7X","name":"啊臻味道米粉(文三数字生活街区店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r221', '海燕快餐', '海燕快餐', array[]::text[], '文三路', 0.27, 4, '快餐小吃', 17, 3.8, 0, 0, 30.277697, 120.141992, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥17，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K1NZJD29","name":"海燕快餐","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0K1NZJD29","name":"海燕快餐","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0K1NZJD29","name":"海燕快餐","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0K1NZJD29","name":"海燕快餐","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r222', '旭源小吃(保俶北路店)', '旭源小吃(保俶北路店)', array[]::text[], '文三路', 0.31, 4, '快餐小吃', 13, 3.7, 0, 0, 30.27779, 120.140848, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥13，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B1EQ3O","name":"旭源小吃(保俶北路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B1EQ3O","name":"旭源小吃(保俶北路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B1EQ3O","name":"旭源小吃(保俶北路店)","query":{"type":"amap_around","campus":"西溪","keyword":"盖浇饭","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B023B1EQ3O","name":"旭源小吃(保俶北路店)","query":{"type":"amap_around","campus":"西溪","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B023B1EQ3O","name":"旭源小吃(保俶北路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r223', '温岭嵌糕(杭大路店)', '温岭嵌糕(杭大路店)', array[]::text[], '黄龙', 0.56, 7, '中餐简餐', 15, 4.2, 0, 0, 30.270384, 120.141253, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥15，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGNUX6IM","name":"温岭嵌糕(杭大路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0KGNUX6IM","name":"温岭嵌糕(杭大路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r224', '正宗云南大理寺过桥米线(文三店)', '正宗云南大理寺过桥米线(文三店)', array[]::text[], '文三路', 0.68, 9, '面食粉面', 18, 4.5, 0, 0, 30.277705, 120.148833, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥18，距离西溪约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGZULKP","name":"正宗云南大理寺过桥米线(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFGZULKP","name":"正宗云南大理寺过桥米线(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0FFGZULKP","name":"正宗云南大理寺过桥米线(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"粉面","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0FFGZULKP","name":"正宗云南大理寺过桥米线(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFGZULKP","name":"正宗云南大理寺过桥米线(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r225', '麦当劳(科技广场店)', '麦当劳(科技广场店)', array[]::text[], '文三路', 0.52, 7, '异国简餐', 30, 4.7, 0, 0, 30.277965, 120.146858, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.7，人均约 ¥30，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:13:23.369Z"},{"type":"amap_poi","poi_id":"B023B08XJR","name":"麦当劳(科技广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r226', '饺宫煮东北水饺', '饺宫煮东北水饺', array[]::text[], '文三路', 0.27, 4, '面食粉面', 13, 3.5, 0, 0, 30.277682, 120.141954, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 3.5，人均约 ¥13，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0DDNHP8","name":"饺宫煮东北水饺","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0L0DDNHP8","name":"饺宫煮东北水饺","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0L0DDNHP8","name":"饺宫煮东北水饺","query":{"type":"amap_around","campus":"西溪","keyword":"水饺","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0L0DDNHP8","name":"饺宫煮东北水饺","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r227', '设茶', '设茶', array[]::text[], '黄龙', 0.54, 7, '中餐简餐', 25, 4.5, 0, 0, 30.272387, 120.146874, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥25，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JBGHO8G4","name":"设茶","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r228', '二〇二小吃(松木场河西西区店)', '二〇二小吃(松木场河西西区店)', array[]::text[], '西溪周边', 0.72, 10, '快餐小吃', 10, 4.2, 0, 0, 30.269957, 120.146591, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥10，距离西溪约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0KGNSWIUD","name":"二〇二小吃(松木场河西西区店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0KGNSWIUD","name":"二〇二小吃(松木场河西西区店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0KGNSWIUD","name":"二〇二小吃(松木场河西西区店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":5},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r229', '建德大包(黄姑山路店)', '建德大包(黄姑山路店)', array[]::text[], '文三路', 0.83, 11, '中餐简餐', 8, 4.3, 0, 0, 30.275675, 120.133725, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥8，距离西溪约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HUA55ZRH","name":"建德大包(黄姑山路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:13:23.363Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r230', '食其家·牛丼咖喱(世贸丽晶城欧美中心店)', '食其家·牛丼咖喱(世贸丽晶城欧美中心店)', array[]::text[], '古荡', 0.53, 7, '异国简餐', 25, 4.4, 0, 0, 30.273857, 120.137121, '异', '#4d79b8', array['正餐', '西溪', '近', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校', '中餐', '晚餐', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFK9Y6BX","name":"食其家·牛丼咖喱(世贸丽晶城欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFK9Y6BX","name":"食其家·牛丼咖喱(世贸丽晶城欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFK9Y6BX","name":"食其家·牛丼咖喱(世贸丽晶城欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFK9Y6BX","name":"食其家·牛丼咖喱(世贸丽晶城欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r231', '包四方·兵哥包子(马塍路店)', '包四方·兵哥包子(马塍路店)', array[]::text[], '文三路', 0.53, 7, '中餐简餐', 11, 3.8, 0, 0, 30.276238, 120.147729, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '下饭']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥11，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K32UDYU6","name":"包四方·兵哥包子(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0K32UDYU6","name":"包四方·兵哥包子(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r232', '猪来顺隆江猪脚饭牛腩饭(文三路店)', '猪来顺隆江猪脚饭牛腩饭(文三路店)', array[]::text[], '文三路', 0.52, 7, '快餐小吃', 21, 4.2, 0, 0, 30.277004, 120.137356, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '下饭']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥21，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LU1GDNW5","name":"猪来顺隆江猪脚饭牛腩饭(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LU1GDNW5","name":"猪来顺隆江猪脚饭牛腩饭(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LU1GDNW5","name":"猪来顺隆江猪脚饭牛腩饭(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LU1GDNW5","name":"猪来顺隆江猪脚饭牛腩饭(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LU1GDNW5","name":"猪来顺隆江猪脚饭牛腩饭(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r233', '迎面尔来(文三店)', '迎面尔来(文三店)', array[]::text[], '西溪周边', 0.28, 4, '面食粉面', 27, 4, 0, 0, 30.277434, 120.143879, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥27，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I14XHDPN","name":"迎面尔来(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0I14XHDPN","name":"迎面尔来(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0I14XHDPN","name":"迎面尔来(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r234', '文三社区老年食堂', '文三社区老年食堂', array[]::text[], '文三路', 0.44, 6, '中餐简餐', 18, 3.9, 0, 0, 30.276866, 120.14656, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '食堂', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.9，人均约 ¥18，距离西溪约 0.4km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLNO458","name":"文三社区老年食堂","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFLNO458","name":"文三社区老年食堂","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFLNO458","name":"文三社区老年食堂","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r235', '麦当劳(杭州世贸丽晶城餐厅)', '麦当劳(杭州世贸丽晶城餐厅)', array[]::text[], '古荡', 0.56, 8, '异国简餐', 30, 4.6, 0, 0, 30.273625, 120.136825, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥30，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0FFHJPUR0","name":"麦当劳(杭州世贸丽晶城餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r236', '秀才娘子云南鲜花过桥米线', '秀才娘子云南鲜花过桥米线', array[]::text[], '文三路', 0.59, 8, '面食粉面', 20, 4.2, 0, 0, 30.278008, 120.147655, '面', '#6d8fbd', array['正餐', '西溪', '近', '实惠', '人均30内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥20，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LR4HPLTF","name":"秀才娘子云南鲜花过桥米线","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LR4HPLTF","name":"秀才娘子云南鲜花过桥米线","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LR4HPLTF","name":"秀才娘子云南鲜花过桥米线","query":{"type":"amap_around","campus":"西溪","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0LR4HPLTF","name":"秀才娘子云南鲜花过桥米线","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r237', '清风特色早餐(颐高广场店)', '清风特色早餐(颐高广场店)', array[]::text[], '文三路', 0.87, 12, '面食粉面', 10, 4.3, 0, 0, 30.274675, 120.133325, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '面食', '暖胃', '聚餐', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '早餐', '中餐', '晚餐', '暖胃']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥10，距离西溪约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B088DF","name":"清风特色早餐(颐高广场店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":5},"fetched_at":"2026-05-09T17:13:23.362Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r238', '喜大元精工面(马塍店)', '喜大元精工面(马塍店)', array[]::text[], '文三路', 0.56, 7, '面食粉面', 32, 4.6, 0, 0, 30.276044, 120.148168, '面', '#6d8fbd', array['正餐', '西溪', '近', '人均50内', '面食', '暖胃', '聚餐', '一人食', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '下饭']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['暖胃', '下饭', '面食']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥32，距离西溪约 0.6km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"面馆","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B023B0BEM1","name":"喜大元精工面(马塍店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r239', '六贤记(文三店)', '六贤记(文三店)', array[]::text[], '文三路', 0.57, 8, '中餐简餐', 30, 4.5, 0, 0, 30.278016, 120.147475, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFG9UMU6","name":"六贤记(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFG9UMU6","name":"六贤记(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r240', '乡村基·川味现炒(欧美中心店)', '乡村基·川味现炒(欧美中心店)', array[]::text[], '古荡', 0.55, 7, '中餐简餐', 20, 4, 0, 0, 30.273764, 120.136921, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥20，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K32C9XBH","name":"乡村基·川味现炒(欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0K32C9XBH","name":"乡村基·川味现炒(欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0K32C9XBH","name":"乡村基·川味现炒(欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r241', '百脑汇美食广场(教工路店)', '百脑汇美食广场(教工路店)', array[]::text[], '古荡', 0.63, 8, '中餐简餐', 24, 4.3, 0, 0, 30.274527, 120.135855, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['下饭', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥24，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIMFBX7","name":"百脑汇美食广场(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":2},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0FFIMFBX7","name":"百脑汇美食广场(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFIMFBX7","name":"百脑汇美食广场(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":3},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r242', '拌将麻辣拌·麻辣烫(文三路店)', '拌将麻辣拌·麻辣烫(文三路店)', array[]::text[], '文三路', 0.27, 4, '火锅麻辣烫', 26, 3.7, 0, 0, 30.277681, 120.141857, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '火锅', '面食', '暖胃', '聚餐']::text[], array['聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['暖胃', '面食', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.7，人均约 ¥26，距离西溪约 0.3km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I1LHJEL6","name":"拌将麻辣拌·麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0I1LHJEL6","name":"拌将麻辣拌·麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0I1LHJEL6","name":"拌将麻辣拌·麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0I1LHJEL6","name":"拌将麻辣拌·麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"},{"type":"amap_poi","poi_id":"B0I1LHJEL6","name":"拌将麻辣拌·麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r243', '梅小食(马塍路店)', '梅小食(马塍路店)', array[]::text[], '文三路', 0.55, 7, '快餐小吃', 17, 3.8, 0, 0, 30.276143, 120.148052, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥17，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LKVH55D7","name":"梅小食(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LKVH55D7","name":"梅小食(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LKVH55D7","name":"梅小食(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LKVH55D7","name":"梅小食(马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r244', '杨国福麻辣烫(浙大西溪店)', '杨国福麻辣烫(浙大西溪店)', array[]::text[], '西溪校内', 0.52, 7, '校内食堂', 31, 4.3, 0, 0, 30.277023, 120.137336, '辣', '#c84b35', array['正餐', '西溪', '近', '人均50内', '校内', '辣', '火锅', '聚餐', '食堂', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥31，距离西溪约 0.5km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFH0EC6Y","name":"杨国福麻辣烫(浙大西溪店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFH0EC6Y","name":"杨国福麻辣烫(浙大西溪店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFH0EC6Y","name":"杨国福麻辣烫(浙大西溪店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0FFH0EC6Y","name":"杨国福麻辣烫(浙大西溪店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFH0EC6Y","name":"杨国福麻辣烫(浙大西溪店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r245', '沙县小吃(立元商务楼店)', '沙县小吃(立元商务楼店)', array[]::text[], '文三路', 0.52, 7, '快餐小吃', 19, 3.8, 0, 0, 30.277025, 120.137294, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥19，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKXLSM7L","name":"沙县小吃(立元商务楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0HKXLSM7L","name":"沙县小吃(立元商务楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":1},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0HKXLSM7L","name":"沙县小吃(立元商务楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"馄饨","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0HKXLSM7L","name":"沙县小吃(立元商务楼店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":2},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r246', '华莱士·全鸡汉堡(黄姑山二店)', '华莱士·全鸡汉堡(黄姑山二店)', array[]::text[], '西湖', 0.84, 11, '异国简餐', 18, 4.3, 0, 0, 30.275717, 120.13366, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥18，距离西溪约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0FFHFYTLB","name":"华莱士·全鸡汉堡(黄姑山二店)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r247', '肯德基(杭州聚龙店)', '肯德基(杭州聚龙店)', array[]::text[], '黄龙', 0.76, 10, '快餐小吃', 28, 4.5, 0, 0, 30.268972, 120.13953, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥28，距离西溪约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LGJHPYO9","name":"肯德基(杭州聚龙店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LGJHPYO9","name":"肯德基(杭州聚龙店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":4},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LGJHPYO9","name":"肯德基(杭州聚龙店)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r248', '巴比馒头(杭州沈塘桥路店)', '巴比馒头(杭州沈塘桥路店)', array[]::text[], '拱墅区', 1.03, 14, '快餐小吃', 4, 4, 0, 0, 30.280991, 120.150819, '饭', '#f0aa38', array['正餐', '西溪', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '早餐', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['早餐', '中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥4，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIQBTNK","name":"巴比馒头(杭州沈塘桥路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:13:23.362Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r249', '百味园自选快餐(文三店)', '百味园自选快餐(文三店)', array[]::text[], '文三路', 0.56, 7, '快餐小吃', 30, 4.2, 0, 0, 30.27834, 120.146975, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '小吃', '快餐', '实惠']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥30，距离西溪约 0.6km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L35ND9H6","name":"百味园自选快餐(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0L35ND9H6","name":"百味园自选快餐(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0L35ND9H6","name":"百味园自选快餐(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0L35ND9H6","name":"百味园自选快餐(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r250', '福昌洞(昌地·火炬大厦店)', '福昌洞(昌地·火炬大厦店)', array[]::text[], '文三路', 0.8, 11, '异国简餐', 22, 4.3, 0, 0, 30.276748, 120.134239, '异', '#4d79b8', array['正餐', '西溪', '近', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校', '中餐', '晚餐', '拍照']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.3，人均约 ¥22，距离西溪约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GKUUHCLI","name":"福昌洞(昌地·火炬大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"韩餐","page":1},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r251', '故里炸鸡(教工路店)', '故里炸鸡(教工路店)', array[]::text[], '古荡', 0.67, 9, '异国简餐', 16, 3.8, 0, 0, 30.274152, 120.135506, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥16，距离西溪约 0.7km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0K0T5MEV4","name":"故里炸鸡(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0K0T5MEV4","name":"故里炸鸡(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0K0T5MEV4","name":"故里炸鸡(教工路店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r252', '临榆炸鸡腿(沈塘桥店)', '临榆炸鸡腿(沈塘桥店)', array[]::text[], '拱墅区', 1.12, 15, '异国简餐', 15, 4.5, 0, 0, 30.28151, 120.151496, '饭', '#f0aa38', array['正餐', '西溪', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥15，距离西溪约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L161SOOG","name":"临榆炸鸡腿(沈塘桥店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0L161SOOG","name":"临榆炸鸡腿(沈塘桥店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r253', '麦当劳(杭州黄龙世纪广场餐厅)', '麦当劳(杭州黄龙世纪广场餐厅)', array[]::text[], '黄龙', 0.82, 11, '异国简餐', 32, 4.6, 0, 0, 30.268098, 120.14077, '辣', '#c84b35', array['正餐', '西溪', '近', '人均50内', '辣', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥32，距离西溪约 0.8km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0GR1X1WGI","name":"麦当劳(杭州黄龙世纪广场餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":1},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0GR1X1WGI","name":"麦当劳(杭州黄龙世纪广场餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0GR1X1WGI","name":"麦当劳(杭州黄龙世纪广场餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0GR1X1WGI","name":"麦当劳(杭州黄龙世纪广场餐厅)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r254', '来笼嵊州小吃(黄姑山路店)', '来笼嵊州小吃(黄姑山路店)', array[]::text[], '文三路', 0.87, 12, '快餐小吃', 11, 3.8, 0, 0, 30.274421, 120.133358, '饭', '#f0aa38', array['正餐', '西溪', '近', '实惠', '人均30内', '快餐', '一人食', '聚餐', '下饭']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '下饭', '小吃']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array[]::text[], array['下饭', '小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥11，距离西溪约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGR0F5V","name":"来笼嵊州小吃(黄姑山路店)","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":5},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0FFGR0F5V","name":"来笼嵊州小吃(黄姑山路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:13:23.363Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r255', '青柠与辣椒·泰式小火锅(EAC店)', '青柠与辣椒·泰式小火锅(EAC店)', array[]::text[], '西溪周边', 0.55, 7, '火锅麻辣烫', 26, 3.8, 0, 0, 30.273556, 120.137067, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.8，人均约 ¥26，距离西溪约 0.5km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L2LUP8W9","name":"青柠与辣椒·泰式小火锅(EAC店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0L2LUP8W9","name":"青柠与辣椒·泰式小火锅(EAC店)","query":{"type":"amap_around","campus":"西溪","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r256', '塔斯汀中国汉堡(杭州市文二路店)', '塔斯汀中国汉堡(杭州市文二路店)', array[]::text[], '杭州国家高新技术产业开发区', 1.02, 14, '异国简餐', 20, 4.4, 0, 0, 30.282846, 120.136368, '饭', '#f0aa38', array['正餐', '西溪', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2HRCNCP","name":"塔斯汀中国汉堡(杭州市文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0I2HRCNCP","name":"塔斯汀中国汉堡(杭州市文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r257', '鸡柳大人(文二路店)', '鸡柳大人(文二路店)', array[]::text[], '西湖', 0.99, 13, '快餐小吃', 14, 4.1, 0, 0, 30.28297, 120.137106, '饭', '#f0aa38', array['正餐', '西溪', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '小吃', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥14，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L1KBU9KC","name":"鸡柳大人(文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:13:23.362Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r258', '小渝儿正宗重庆麻辣烫(文鸿金座店)', '小渝儿正宗重庆麻辣烫(文鸿金座店)', array[]::text[], '文三路', 0.87, 12, '火锅麻辣烫', 22, 4.2, 0, 0, 30.276137, 120.133344, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥22，距离西溪约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J6A6PX15","name":"小渝儿正宗重庆麻辣烫(文鸿金座店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r259', '牛约堡-牛肉汉堡(闲林店)', '牛约堡-牛肉汉堡(闲林店)', array[]::text[], '西溪周边', 0.57, 8, '异国简餐', 31, 4, 0, 0, 30.271918, 120.137921, '饭', '#f0aa38', array['正餐', '西溪', '近', '人均50内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '懒得出校', '中餐', '晚餐', '快餐', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃', '懒得出校']::text[], array[]::text[], array['快餐']::text[], '公开信息整理：高德显示评分 4.0，人均约 ¥31，距离西溪约 0.6km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0IGZZY5I0","name":"牛约堡-牛肉汉堡(闲林店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0IGZZY5I0","name":"牛约堡-牛肉汉堡(闲林店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":2},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0IGZZY5I0","name":"牛约堡-牛肉汉堡(闲林店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0IGZZY5I0","name":"牛约堡-牛肉汉堡(闲林店)","query":{"type":"amap_around","campus":"西溪","keyword":"汉堡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r260', '红恩小吃(西溪路店)', '红恩小吃(西溪路店)', array[]::text[], '西溪周边', 0.66, 9, '校内食堂', 42, 4.6, 0, 0, 30.269458, 120.143775, '辣', '#c84b35', array['正餐', '西溪', '近', '人均50内', '辣', '面食', '暖胃', '快餐', '一人食', '聚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '中餐', '晚餐', '暖胃', '面食']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣']::text[], array['暖胃', '面食', '小吃', '快餐']::text[], '公开信息整理：高德显示评分 4.6，人均约 ¥42，距离西溪约 0.7km；当前标签为 正餐、近、人均50内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":3},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"米线","page":1},"fetched_at":"2026-05-09T17:13:23.364Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"炒饭","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":2},"fetched_at":"2026-05-09T17:13:23.370Z"},{"type":"amap_poi","poi_id":"B0FFKPZXOA","name":"红恩小吃(西溪路店)","query":{"type":"amap_around","campus":"西溪","keyword":"食堂","page":4},"fetched_at":"2026-05-09T17:13:23.371Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r261', '刘文祥麻辣烫(文三路店)', '刘文祥麻辣烫(文三路店)', array[]::text[], '文三路', 0.92, 12, '火锅麻辣烫', 26, 4.4, 0, 0, 30.27679, 120.132991, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥26，距离西溪约 0.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L2KUGXV5","name":"刘文祥麻辣烫(文三路店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r262', '鲜目录寿司(文二店)', '鲜目录寿司(文二店)', array[]::text[], '杭州国家高新技术产业开发区', 1, 13, '异国简餐', 25, 4.4, 0, 0, 30.283811, 120.14579, '异', '#4d79b8', array['正餐', '西溪', '实惠', '人均30内', '拍照', '快餐', '一人食', '聚餐', '异国料理']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照', '中餐', '晚餐', '拍照', '快餐']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '约会拍照']::text[], array[]::text[], array['拍照', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥25，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I2G5FDQU","name":"鲜目录寿司(文二店)","query":{"type":"amap_around","campus":"西溪","keyword":"日料","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r263', '清泰街大食堂(文二路店)', '清泰街大食堂(文二路店)', array[]::text[], '西湖', 0.97, 13, '烧烤烤肉', 23, 4.1, 0, 0, 30.282957, 120.137517, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '轻负担', '食堂']::text[], array['聚餐', '夜宵', '中餐', '晚餐', '小吃', '清爽', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐']::text[], array['辣', '轻负担', '大份']::text[], array['小吃', '清爽', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥23，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFIBD9US","name":"清泰街大食堂(文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"酸菜鱼","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0FFIBD9US","name":"清泰街大食堂(文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"西餐","page":4},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r264', '小渝儿麻辣烫正宗重庆(沈塘桥店)', '小渝儿麻辣烫正宗重庆(沈塘桥店)', array[]::text[], '拱墅区', 1.1, 15, '火锅麻辣烫', 27, 4.5, 0, 0, 30.281405, 120.151406, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '辣', '火锅', '快餐', '一人食', '聚餐', '夜宵']::text[], array['一人食', '聚餐', '赶课快吃', '夜宵', '中餐', '晚餐', '小吃', '快餐']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃']::text[], array['辣', '大份']::text[], array['小吃', '快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥27，距离西溪约 1.1km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HRURHPAV","name":"小渝儿麻辣烫正宗重庆(沈塘桥店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":2},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0HRURHPAV","name":"小渝儿麻辣烫正宗重庆(沈塘桥店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r265', '祁氏手撕烤鸭(浙江体育职业技术学院教工路校区店)', '祁氏手撕烤鸭(浙江体育职业技术学院教工路校区店)', array[]::text[], '古荡', 0.76, 10, '烧烤烤肉', 18, 3.4, 0, 0, 30.278872, 120.135686, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.4，人均约 ¥18，距离西溪约 0.8km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0J3HAPPZX","name":"祁氏手撕烤鸭(浙江体育职业技术学院教工路校区店)","query":{"type":"amap_around","campus":"西溪","keyword":"烤肉","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r266', '黄手艺冒菜', '黄手艺冒菜', array[]::text[], '西溪', 0.87, 12, '火锅麻辣烫', 30, 4.1, 0, 0, 30.276278, 120.133428, '辣', '#c84b35', array['正餐', '西溪', '近', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校', '夜宵', '中餐', '晚餐', '小吃']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐', '赶课快吃', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥30，距离西溪约 0.9km；当前标签为 正餐、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"中餐","page":4},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"小吃","page":5},"fetched_at":"2026-05-09T17:13:23.363Z"},{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"},{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"冒菜","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"自选快餐","page":1},"fetched_at":"2026-05-09T17:13:23.366Z"},{"type":"amap_poi","poi_id":"B0LRTA9R2A","name":"黄手艺冒菜","query":{"type":"amap_around","campus":"西溪","keyword":"火锅","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r267', '杨国福麻辣烫(杭州文二路店)', '杨国福麻辣烫(杭州文二路店)', array[]::text[], '西湖', 1.03, 14, '火锅麻辣烫', 30, 4.2, 0, 0, 30.282922, 120.13621, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '辣', '火锅', '聚餐', '夜宵', '一人食', '下饭']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '下饭', '小吃', '实惠']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['下饭', '小吃', '实惠']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥30，距离西溪约 1.0km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFGEECXB","name":"杨国福麻辣烫(杭州文二路店)","query":{"type":"amap_around","campus":"西溪","keyword":"麻辣烫","page":1},"fetched_at":"2026-05-09T17:13:23.365Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r268', '汤布里波·炸鸡新贵(黄龙国际中心店)', '汤布里波·炸鸡新贵(黄龙国际中心店)', array[]::text[], '黄龙', 1.23, 16, '异国简餐', 30, 4.5, 0, 0, 30.276028, 120.129601, '饭', '#f0aa38', array['正餐', '西溪', '实惠', '人均30内', '快餐', '一人食']::text[], array['一人食', '赶课快吃', '中餐', '晚餐', '快餐', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['中餐', '晚餐']::text[], array['一人食', '赶课快吃']::text[], array[]::text[], array['快餐', '实惠']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥30，距离西溪约 1.2km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDJBPB8U","name":"汤布里波·炸鸡新贵(黄龙国际中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"快餐","page":3},"fetched_at":"2026-05-09T17:13:23.362Z"},{"type":"amap_poi","poi_id":"B0LDJBPB8U","name":"汤布里波·炸鸡新贵(黄龙国际中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"炸鸡","page":1},"fetched_at":"2026-05-09T17:13:23.367Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r269', '浙大北门烧烤', '浙大北门烧烤', array[]::text[], '西溪校内', 1.92, 26, '校内食堂', 55, 4.2, 0, 0, 30.270201, 120.12326, '辣', '#c84b35', array['正餐', '西溪', '校内', '辣', '烧烤', '聚餐', '夜宵', '食堂', '下饭']::text[], array['聚餐', '懒得出校', '夜宵', '中餐', '晚餐', '下饭', '小吃', '西溪']::text[], array['堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '懒得出校']::text[], array['辣', '大份']::text[], array['下饭', '小吃']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥55，距离西溪约 1.9km；当前标签为 正餐、校内、辣，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFM5Y4PM","name":"浙大北门烧烤","query":{"type":"amap_around","campus":"西溪","keyword":"烧烤","page":3},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0FFM5Y4PM","name":"浙大北门烧烤","query":{"type":"amap_around","campus":"西溪","keyword":"烤肉","page":4},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r270', '西溪路419号烧烤店', '西溪路419号烧烤店', array[]::text[], '古荡', 1.93, 26, '校内食堂', 20, 3.3, 0, 0, 30.270175, 120.123175, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '辣', '烧烤', '聚餐', '夜宵', '食堂', '一人食']::text[], array['一人食', '聚餐', '夜宵', '中餐', '晚餐', '小吃', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['一人食', '聚餐']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.3，人均待学生补充，距离西溪约 1.9km；当前标签为 正餐、实惠、人均30内，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"西溪","keyword":"烧烤","page":3},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0L1YBD3Z7","name":"西溪路419号烧烤店","query":{"type":"amap_around","campus":"西溪","keyword":"烤肉","page":4},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r271', '金杰咖啡馆', '金杰咖啡馆', array[]::text[], '西溪校内', 0.17, 2, '咖啡', 17, 4.1, 0, 0, 30.274696, 120.140754, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '校内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.1，人均约 ¥17，距离西溪约 0.2km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0I24RQ3JG","name":"金杰咖啡馆","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0I24RQ3JG","name":"金杰咖啡馆","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r272', '西子浮雪咖啡奶茶店(文三店)', '西子浮雪咖啡奶茶店(文三店)', array[]::text[], '文三路', 0.45, 6, '茶饮', 16, 4.4, 0, 0, 30.277825, 120.145975, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥16，距离西溪约 0.4km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LD9LAI45","name":"西子浮雪咖啡奶茶店(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":1},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LD9LAI45","name":"西子浮雪咖啡奶茶店(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"},{"type":"amap_poi","poi_id":"B0LD9LAI45","name":"西子浮雪咖啡奶茶店(文三店)","query":{"type":"amap_around","campus":"西溪","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r273', '库迪咖啡(东部软件园店)', '库迪咖啡(东部软件园店)', array[]::text[], '文三路', 0.51, 7, '咖啡', 9, 4.2, 0, 0, 30.278258, 120.146399, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥9，距离西溪约 0.5km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0HLRVW3","name":"库迪咖啡(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0L0HLRVW3","name":"库迪咖啡(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r274', '麦记牛奶(杭州EAC店)', '麦记牛奶(杭州EAC店)', array[]::text[], '西溪周边', 0.55, 7, '甜品烘焙', 16, 4.5, 0, 0, 30.273556, 120.137067, '甜', '#d9915d', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '甜品', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '拍照', '清爽', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '甜品']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥16，距离西溪约 0.5km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LA5SPT1C","name":"麦记牛奶(杭州EAC店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LA5SPT1C","name":"麦记牛奶(杭州EAC店)","query":{"type":"amap_around","campus":"西溪","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:13:23.369Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r275', '瑞幸咖啡(立元大厦店)', '瑞幸咖啡(立元大厦店)', array[]::text[], '古荡', 0.57, 8, '咖啡', 15, 4.5, 0, 0, 30.276853, 120.136692, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥15，距离西溪约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0FFLDSDWD","name":"瑞幸咖啡(立元大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":4},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0FFLDSDWD","name":"瑞幸咖啡(立元大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"},{"type":"amap_poi","poi_id":"B0FFLDSDWD","name":"瑞幸咖啡(立元大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"甜品","page":1},"fetched_at":"2026-05-09T17:13:23.369Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r276', '霸王茶姬(浙江杭州西湖EAC欧美中心店)', '霸王茶姬(浙江杭州西湖EAC欧美中心店)', array[]::text[], '古荡', 0.53, 7, '茶饮', 17, 4.5, 0, 0, 30.274028, 120.137037, '甜', '#d9915d', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '奶茶', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '小吃', '拍照', '实惠']::text[], array['外卖', '堂食']::text[], array['下午茶']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array[]::text[], array['小吃', '拍照', '实惠', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥17，距离西溪约 0.5km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0JRNH7FY9","name":"霸王茶姬(浙江杭州西湖EAC欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":2},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0JRNH7FY9","name":"霸王茶姬(浙江杭州西湖EAC欧美中心店)","query":{"type":"amap_around","campus":"西溪","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r277', 'luckin coffee 瑞幸咖啡(东部软件园店)', 'luckin coffee 瑞幸咖啡(东部软件园店)', array[]::text[], '文三路', 0.61, 8, '茶饮', 16, 4.5, 0, 0, 30.279081, 120.146951, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥16，距离西溪约 0.6km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LDCSPT1H","name":"luckin coffee 瑞幸咖啡(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":5},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LDCSPT1H","name":"luckin coffee 瑞幸咖啡(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"},{"type":"amap_poi","poi_id":"B0LDCSPT1H","name":"luckin coffee 瑞幸咖啡(东部软件园店)","query":{"type":"amap_around","campus":"西溪","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r278', 'Manner Coffee', 'Manner Coffee', array[]::text[], '古荡', 0.55, 7, '咖啡', 19, 4.4, 0, 0, 30.273125, 120.137275, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥19，距离西溪约 0.5km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0L0BDUVDO","name":"Manner Coffee","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0L0BDUVDO","name":"Manner Coffee","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r279', '蜜雪冰城(翠苑街道店)', '蜜雪冰城(翠苑街道店)', array[]::text[], '文三路', 0.89, 12, '茶饮', 6, 4.5, 0, 0, 30.277171, 120.133323, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.5，人均约 ¥6，距离西溪约 0.9km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HDH7FRS7","name":"蜜雪冰城(翠苑街道店)","query":{"type":"amap_around","campus":"西溪","keyword":"奶茶","page":1},"fetched_at":"2026-05-09T17:13:23.370Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r280', 'Pull-Tab拉环咖啡(杭州市西湖区马塍路店)', 'Pull-Tab拉环咖啡(杭州市西湖区马塍路店)', array[]::text[], '文三路', 0.54, 7, '咖啡', 20, 4.4, 0, 0, 30.27638, 120.14784, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '拍照', '清爽']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['拍照', '清爽', '实惠', '咖啡']::text[], '公开信息整理：高德显示评分 4.4，人均约 ¥20，距离西溪约 0.5km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0LAVR7NTK","name":"Pull-Tab拉环咖啡(杭州市西湖区马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"餐饮","page":3},"fetched_at":"2026-05-09T17:13:23.361Z"},{"type":"amap_poi","poi_id":"B0LAVR7NTK","name":"Pull-Tab拉环咖啡(杭州市西湖区马塍路店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r281', '库迪咖啡(杭州百脑汇科技大厦店)', '库迪咖啡(杭州百脑汇科技大厦店)', array[]::text[], '古荡', 0.69, 9, '茶饮', 9, 4.2, 0, 0, 30.273867, 120.135418, '咖', '#8c6338', array['饮品', '西溪', '近', '实惠', '人均30内', '拍照', '咖啡', '奶茶', '轻负担', '一人食']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校', '下午茶', '早餐', '小吃', '拍照']::text[], array['外卖', '堂食']::text[], array['下午茶', '早餐']::text[], array['一人食', '赶课快吃', '约会拍照', '懒得出校']::text[], array['轻负担']::text[], array['小吃', '拍照', '清爽', '实惠', '咖啡', '奶茶']::text[], '公开信息整理：高德显示评分 4.2，人均约 ¥9，距离西溪约 0.7km；当前标签为 饮品、近、实惠，置信度 0.95。', '[{"type":"amap_poi","poi_id":"B0HKYNN7HP","name":"库迪咖啡(杭州百脑汇科技大厦店)","query":{"type":"amap_around","campus":"西溪","keyword":"咖啡","page":1},"fetched_at":"2026-05-09T17:13:23.369Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'r282', '玉泉烧烤(浙大店)', '玉泉烧烤(浙大店)', array[]::text[], '西溪校内', 1.92, 26, '校内食堂', 24, 3.1, 0, 0, 30.270231, 120.123266, '辣', '#c84b35', array['正餐', '西溪', '实惠', '人均30内', '校内', '辣', '烧烤', '聚餐', '夜宵', '食堂']::text[], array['聚餐', '懒得出校', '夜宵', '中餐', '晚餐', '小吃', '实惠', '西溪']::text[], array['外卖', '堂食']::text[], array['夜宵', '中餐', '晚餐']::text[], array['聚餐', '懒得出校']::text[], array['辣', '大份']::text[], array['小吃', '实惠']::text[], '公开信息整理：高德显示评分 3.1，人均约 ¥24，距离西溪约 1.9km；当前标签为 正餐、实惠、人均30内，置信度 0.83。', '[{"type":"amap_poi","poi_id":"B0IAVMFFU4","name":"玉泉烧烤(浙大店)","query":{"type":"amap_around","campus":"西溪","keyword":"烧烤","page":3},"fetched_at":"2026-05-09T17:13:23.367Z"},{"type":"amap_poi","poi_id":"B0IAVMFFU4","name":"玉泉烧烤(浙大店)","query":{"type":"amap_around","campus":"西溪","keyword":"烤肉","page":4},"fetched_at":"2026-05-09T17:13:23.368Z"}]'::jsonb, 'published'
)
on conflict (id) do update set
  name = excluded.name,
  canonical_name = excluded.canonical_name,
  area = excluded.area,
  distance = excluded.distance,
  walk_minutes = excluded.walk_minutes,
  cuisine = excluded.cuisine,
  price = excluded.price,
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
  'rv_r040_internet', 'r040', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为双龙街588号杭州西溪银泰城F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r041_internet', 'r041', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥19，地址为紫金创业园B座101-105室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r042_internet', 'r042', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为双龙街588号杭州西溪银泰城西区(弘德路店)B1层BF022。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r043_internet', 'r043', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥22，地址为紫荆花北路139号,137号望月公寓桂花苑。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r044_internet', 'r044', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为三墩镇望月公寓商业用房47号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r045_internet', 'r045', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥28，地址为三墩镇紫蝶苑10号楼206室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r046_internet', 'r046', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥9，地址为望月公寓东4门南120米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r047_internet', 'r047', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥18，地址为盛龙街浙港国际1号楼140号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r048_internet', 'r048', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥30，地址为望月商铺5-6号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r049_internet', 'r049', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为三墩镇望月公寓商业用房30号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r050_internet', 'r050', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为三墩镇望月公寓商业用房75号铺位1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r051_internet', 'r051', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥33，地址为港湾家园西区18幢5号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r052_internet', 'r052', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为余杭塘路与崇仁路交叉口西溪银泰城地下一层铺位号BF038。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r053_internet', 'r053', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥33，地址为三墩镇港湾家园29幢3单元1楼7号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r054_internet', 'r054', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥13，地址为双龙街588号杭州西溪银泰城西区弘德路店F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r055_internet', 'r055', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥20，地址为望月公寓23号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r056_internet', 'r056', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥25，地址为望月公寓东4门南110米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r057_internet', 'r057', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥22，地址为紫荆花北路139,137号望月公寓桂花苑。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r058_internet', 'r058', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥25，地址为双龙街西溪银泰城1号楼南-3-124室(蜜雪冰城隔壁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r059_internet', 'r059', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥21，地址为2-东116(浙大紫金港地铁站B1口步行270米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r060_internet', 'r060', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥23，地址为三墩镇紫金花北路163号望月公寓商业用房165号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r061_internet', 'r061', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥24，地址为西溪银泰2号楼南楼126室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r062_internet', 'r062', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为三墩镇集萃路25号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r063_internet', 'r063', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥25，地址为蒋村街道余杭塘路与双龙路交叉口地下一层036阿香米线。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r064_internet', 'r064', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥18，地址为浙港国际(虾龙圩地铁站B口步行420米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r065_internet', 'r065', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥25，地址为三墩镇古墩路673号瑞博国际大厦。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r066_internet', 'r066', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥25，地址为申花路781号商铺(虾龙圩地铁站C口步行490米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r067_internet', 'r067', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥21，地址为浙港国际(虾龙圩地铁站B口步行480米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r068_internet', 'r068', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥26，地址为剑桥公社C座3幢16号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r069_internet', 'r069', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥23，地址为双龙街588号杭州西溪银泰城西区(弘德路店)B1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r070_internet', 'r070', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥25，地址为三墩镇紫荆花城2号楼120室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r071_internet', 'r071', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥16，地址为西溪世纪中心1幢128室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r072_internet', 'r072', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥11，地址为浙港国际一号楼102。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r073_internet', 'r073', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥26，地址为三墩镇望月商铺77号(紫荆花北路)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r074_internet', 'r074', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.4、人均约 ¥24，地址为港湾家园西区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r075_internet', 'r075', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥21，地址为西溪银泰商业中心2-东137室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r076_internet', 'r076', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥14，地址为双龙街588号杭州西溪银泰城F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r077_internet', 'r077', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥25，地址为五常港路442号444号华策中心9号一层101/102号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r078_internet', 'r078', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥15，地址为蒋村街道花蒋天街商业中心10号楼108室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r085_internet', 'r085', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥19，地址为三墩镇城北商贸园46幢。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r086_internet', 'r086', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥17，地址为蒋村街道晴川街西溪银泰商业中心1号楼地下一层BF112室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r087_internet', 'r087', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥35，地址为西溪银泰城地下一层商铺BF052-054号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r088_internet', 'r088', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥25，地址为古墩路616号同人精华F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r089_internet', 'r089', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥23，地址为蒋村街道西溪银泰商业中心2号楼南楼307室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r090_internet', 'r090', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥20，地址为蒋村街道西溪世纪中心1-1151-116号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r091_internet', 'r091', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥39，地址为西溪银泰城负一楼B1035。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r092_internet', 'r092', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥28，地址为古墩路657号(三坝地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r093_internet', 'r093', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥20，地址为西溪天街3号楼117室王老笨东北过桥米线。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r094_internet', 'r094', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为古墩路651号文鼎财富F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r095_internet', 'r095', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥44，地址为三墩镇申花路789号剑桥公社B座4号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r096_internet', 'r096', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为紫霞街崇仁路口(公交站)后面的肯德基。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r097_internet', 'r097', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥28，地址为蒋村街道文一西路588号西溪首座5幢楼111室商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r098_internet', 'r098', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥55，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r099_internet', 'r099', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥14，地址为振华路189号紫润国际。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r100_internet', 'r100', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥24，地址为杭州龙申综合发展中心2幢一层8号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r101_internet', 'r101', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥35，地址为西溪银泰商业中心2号楼东楼144海底捞楼上。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r102_internet', 'r102', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥111，地址为申花路798号1楼门面。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r103_internet', 'r103', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥42，地址为万塘路40号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r104_internet', 'r104', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为浙江大学紫金港校区银泉食堂对面1幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r105_internet', 'r105', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为余杭塘路866号浙江大学紫金港校区浙大超市启真湖店内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r106_internet', 'r106', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥13，地址为三墩镇浙江大学紫金港校区学生活动中心B1号楼106。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r107_internet', 'r107', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为紫金港路浙大紫金港校区文科组团人文学院大楼一层大厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r108_internet', 'r108', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为余杭塘路866号浙江大学紫金港校区东二教学楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r109_internet', 'r109', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥14，地址为余杭塘路929号浙江大学紫金港校区成均苑7幢一层1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r110_internet', 'r110', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥14，地址为浙大医学院店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r111_internet', 'r111', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥13，地址为余杭塘路866号浙江大学紫金港校区白沙综合楼二楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r112_internet', 'r112', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路与紫金港路隧道交叉口西320米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r113_internet', 'r113', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥13，地址为余杭塘路388号浙大紫金港校区蓝田6幢1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r114_internet', 'r114', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥15，地址为浙大紫金港校区翠柏1舍1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r115_internet', 'r115', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为浙江大学紫金港校区店。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r116_internet', 'r116', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为紫金创业园B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r117_internet', 'r117', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥9，地址为三墩镇望月公寓20号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r118_internet', 'r118', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥8，地址为育英路望月公寓55号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r119_internet', 'r119', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.8、人均约 ¥8，地址为西溪银泰城1号楼3-南112室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r120_internet', 'r120', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为三墩镇浙大紫金港望月公寓南门32A号(浙大紫金港校区坠落街)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r121_internet', 'r121', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥12，地址为浙江大学玉泉校区二食堂背后(校园卡服务部对面)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r122_internet', 'r122', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥16，地址为浙大路38号浙江大学玉泉校区内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r123_internet', 'r123', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥12，地址为浙大求是村南2门西140米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r124_internet', 'r124', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥17，地址为浙大路38号浙江大学玉泉校区求是村。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r125_internet', 'r125', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥12，地址为玉古路149号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r126_internet', 'r126', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥22，地址为玉古路149号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r127_internet', 'r127', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥15，地址为玉古路149号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r128_internet', 'r128', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥15，地址为外东山弄与夕阳红路交叉口北60米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r129_internet', 'r129', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥14，地址为浙大路30-6号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r130_internet', 'r130', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥13，地址为浙大求是村南2门西100米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r131_internet', 'r131', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥21，地址为新丰小吃浙大路39号(浙大路分店)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r132_internet', 'r132', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥10，地址为玉古路167号玉古路小区(黄龙体育中心地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r133_internet', 'r133', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥19，地址为夕阳红路与外东山弄交叉口西北60米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r134_internet', 'r134', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥13，地址为外东山弄57号一楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r135_internet', 'r135', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥12，地址为全季酒店东北门旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r136_internet', 'r136', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥30，地址为玉古路166号(黄龙体育中心地铁站D口步行160米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r137_internet', 'r137', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥15，地址为外东山弄66号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r138_internet', 'r138', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥24，地址为灵隐街道体中三路1号1幢1层103号商铺铺位C。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r139_internet', 'r139', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为青芝坞13号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r140_internet', 'r140', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥21，地址为智泉路与树人路交叉口北140米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r141_internet', 'r141', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥17，地址为体环二路与支路二交叉口西60米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r142_internet', 'r142', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥19，地址为西溪路381号(黄龙体育中心地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r143_internet', 'r143', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥16，地址为庆丰新村西南2门西60米(古荡地铁站C口步行240米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r144_internet', 'r144', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥15，地址为黄龙路1号浙江省黄龙体育中心。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r145_internet', 'r145', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为华洋体育馆体中三路1号1幢1层118号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r146_internet', 'r146', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥15，地址为西溪路413号(古荡地铁站C口步行90米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r147_internet', 'r147', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥20，地址为灵隐街道黄龙路1号黄龙体育中心体育场西区W125。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r148_internet', 'r148', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥35，地址为外东山弄66号A栋1楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r149_internet', 'r149', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为灵隐街道体中三路1号1幢第一层108号铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r150_internet', 'r150', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥25，地址为玉古路60号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r151_internet', 'r151', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.5、人均约 ¥9，地址为玉古路小区东南1门旁(黄龙体育中心地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r152_internet', 'r152', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥29，地址为青芝坞10号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r153_internet', 'r153', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥23，地址为黄龙华洋体育馆1号1幢1层107商铺龙记面馆。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r154_internet', 'r154', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥11，地址为天目山路388号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r155_internet', 'r155', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥20，地址为西溪路393号(黄龙体育中心地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r156_internet', 'r156', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥30，地址为黄龙路1号浙江省黄龙体育中心。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r157_internet', 'r157', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥26，地址为灵隐街道求是路8号公元大厦南楼B1层-6。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r158_internet', 'r158', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥21，地址为庆丰农贸市场东北门旁(古荡地铁站C口步行110米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r159_internet', 'r159', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥36，地址为浙大路东山弄86号东山农贸市场106、107、101-1号商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r160_internet', 'r160', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥25，地址为玉古路61号青芝坞阑家湾23号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r161_internet', 'r161', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥5，地址为万塘路8号黄龙时代广场A座F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r162_internet', 'r162', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥32，地址为黄龙体育中心西大道与西溪路交叉口东200米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r163_internet', 'r163', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3、人均约 ¥25，地址为浙大路38号浙江大学玉泉校区知泉路18号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r164_internet', 'r164', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为黄龙时代广场A座万塘路12号-1商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r165_internet', 'r165', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.4、人均约 ¥17，地址为外东山弄86号东山市集一楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r166_internet', 'r166', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥26，地址为万塘路10号-1商铺(古荡地铁站C口步行320米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r167_internet', 'r167', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3、人均约 ¥11，地址为万塘路与西溪路交叉口北60米(古荡地铁站C口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r168_internet', 'r168', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥21，地址为翠苑街道塘苗路29号底商。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r169_internet', 'r169', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥39，地址为灵隐街道青芝坞29号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r170_internet', 'r170', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥30，地址为塘苗路2号105室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r171_internet', 'r171', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥35，地址为学院路77号黄龙国际中心4号楼麦当劳餐厅。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r172_internet', 'r172', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为文三路477号一层商铺和地下室一部分。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r173_internet', 'r173', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.6、人均约 ¥23，地址为玉古路188号现代国际大厦A座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r174_internet', 'r174', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥37，地址为万塘路与采薇巷交叉口东南80米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r175_internet', 'r175', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥68，地址为西溪路399号(黄龙体育中心地铁站D口步行100米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r176_internet', 'r176', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥18，地址为文三路500号星光城A座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r177_internet', 'r177', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥56，地址为黄龙体育中心A3口向东20米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r178_internet', 'r178', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥65，地址为余杭区青芝坞15号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r179_internet', 'r179', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7，地址为浙大求是社区61幢对面。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r180_internet', 'r180', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为文三路500号星光城9号楼9-L1-0069-L1-016。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r181_internet', 'r181', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为翠苑街道学院路77号黄龙国际中心AB楼室外外广场A5室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r182_internet', 'r182', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥18，地址为黄姑山路38号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r183_internet', 'r183', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥18，地址为杭州地铁19号线文三路地铁站商业区wsla01商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r184_internet', 'r184', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥31，地址为文三路583号(文三路地铁站D3口步行460米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r185_internet', 'r185', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥11，地址为文三路233-7号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r186_internet', 'r186', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥62，地址为体中三路1号1幢1层125号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r187_internet', 'r187', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥37，地址为文三路453号中茵大厦A101室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r188_internet', 'r188', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3，地址为浙江大学玉泉校区三食堂1楼西南角。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r189_internet', 'r189', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3，地址为西溪路与万塘路交叉口南40米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r190_internet', 'r190', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥42，地址为西溪路75号西溪路75号院。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r191_internet', 'r191', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥9，地址为浙大路38号(浙江大学玉泉校区外经贸楼一楼大厅)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r192_internet', 'r192', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥17，地址为浙大路38号浙江大学玉泉校区永谦活动中心对面求是超市内。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r193_internet', 'r193', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥9，地址为玉古路145号黄鸿年科技综合大楼F1层玉古路146-2号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r194_internet', 'r194', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥6，地址为玉古路167号玉古路小区(黄龙体育中心地铁站D口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r195_internet', 'r195', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥23，地址为玉古路149-1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r196_internet', 'r196', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥26，地址为浙江大学玉泉校区二食堂1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r197_internet', 'r197', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥14，地址为玉古路157号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r198_internet', 'r198', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥14，地址为外东山弄86号西湖·东山集1层左边。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r199_internet', 'r199', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥14，地址为浙大路38号浙大玉泉校区内5号店铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r200_internet', 'r200', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥26，地址为灵隐街道浙江大学玉泉校区小桥门附房9-2号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r201_internet', 'r201', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥13，地址为西溪路410号庆丰公寓西楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r202_internet', 'r202', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为西溪路412号浙大玉泉校区北门对面。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r203_internet', 'r203', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 2.6，地址为曙光路89号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r204_internet', 'r204', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥15，地址为黄姑山路拓峰新天地4号楼1楼(沿着围墙走到最里面)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r205_internet', 'r205', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥12，地址为文三路232号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r206_internet', 'r206', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为天目山路148号浙江大学(西溪校区)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r207_internet', 'r207', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥16，地址为文三路118号文锦大厦B座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r208_internet', 'r208', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥11，地址为文三路233-7号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r209_internet', 'r209', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥10，地址为天目山路148号浙江大学西溪校区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r210_internet', 'r210', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥13，地址为马塍路12号杭州丽庭酒店管理有限公司151-158室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r211_internet', 'r211', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥14，地址为文三路90号东部软件园科技广场1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r212_internet', 'r212', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥15，地址为西溪路58号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r213_internet', 'r213', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥10，地址为教工路88号立元创业楼F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r214_internet', 'r214', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥23，地址为文三路123-2号(西溪数码港正对面)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r215_internet', 'r215', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥15，地址为马塍路26号旁(近知味观)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r216_internet', 'r216', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥19，地址为文三路72号科技广场(沈塘桥地铁站E口步行270米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r217_internet', 'r217', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥21，地址为天目山路131号(杭大路口)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r218_internet', 'r218', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥13，地址为文三路255号联强大厦F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r219_internet', 'r219', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥20，地址为文二路102-1号(沈塘桥地铁站E口步行390米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r220_internet', 'r220', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥36，地址为西溪街道文三路158号3幢1号楼一楼西起第四间。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r221_internet', 'r221', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥17，地址为文三路158号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r222_internet', 'r222', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥13，地址为黄姑山路29号文三数字生活街区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r223_internet', 'r223', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥15，地址为北山街道杭大路44号(黄龙洞地铁站A1口步行440米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r224_internet', 'r224', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥18，地址为文三路31号(沈塘桥地铁站F1口步行120米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r225_internet', 'r225', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.7、人均约 ¥30，地址为文三路90号东部软件园科技广场。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r226_internet', 'r226', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.5、人均约 ¥13，地址为文三路164号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r227_internet', 'r227', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥25，地址为窑背巷与天目山路辅路交叉口北20米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r228_internet', 'r228', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥10，地址为保俶路218号松木场河西小区西区。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r229_internet', 'r229', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥8，地址为黄姑山路48号建德大包(文三路地铁站A口步行410米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r230_internet', 'r230', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为教工路18号世贸丽晶城欧美中心F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r231_internet', 'r231', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥11，地址为马塍路11号(沈塘桥地铁站E口步行310米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r232_internet', 'r232', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥21，地址为西溪街道文三路235号一层107号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r233_internet', 'r233', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥27，地址为文锦大厦B座正门南50米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r234_internet', 'r234', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.9、人均约 ¥18，地址为文三路103号5幢西侧(沈塘桥地铁站E口步行340米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r235_internet', 'r235', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥30，地址为教工路18号欧美中心。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r236_internet', 'r236', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥20，地址为文三路56-1号(沈塘桥地铁站E口步行100米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r237_internet', 'r237', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥10，地址为黄姑山横路50号(文三路地铁站G口步行460米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r238_internet', 'r238', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥32，地址为马塍路10-3号(沈塘桥地铁站E口步行350米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r239_internet', 'r239', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为西溪街道文三路56-4号、56-3号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r240_internet', 'r240', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥20，地址为教工路18号世贸丽晶城欧美中心F2层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r241_internet', 'r241', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥24，地址为教工路23号百脑汇科技大厦5层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r242_internet', 'r242', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.7、人均约 ¥26，地址为文三路162号商铺左起第三间。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r243_internet', 'r243', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥17，地址为马塍路10-10号(沈塘桥地铁站E口步行320米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r244_internet', 'r244', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥31，地址为文三路223号立元商务楼F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r245_internet', 'r245', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥19，地址为文三路223号立元商务楼F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r246_internet', 'r246', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥18，地址为黄姑山路38号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r247_internet', 'r247', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥28，地址为杭大路聚龙大厦A座肯德基。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r248_internet', 'r248', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥4，地址为沈塘桥路29号(沈塘桥地铁站A口旁)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r249_internet', 'r249', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥30，地址为马塍路与文三路交叉口西北80米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r250_internet', 'r250', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.3、人均约 ¥22，地址为文三路259号昌地·火炬大厦F1层。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r251_internet', 'r251', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥16，地址为教工路百脑汇科技大厦五楼5-11号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r252_internet', 'r252', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥15，地址为米市巷街道沈塘桥路64号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r253_internet', 'r253', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥32，地址为杭大路1号黄龙世纪广场一楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r254_internet', 'r254', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥11，地址为黄姑山路11号(文三路地铁站A口步行490米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r255_internet', 'r255', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 3.8、人均约 ¥26，地址为世贸丽晶城欧美中心商业街2楼。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r256_internet', 'r256', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为西路区文二路209号(耀江文欣大厦)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r257_internet', 'r257', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥14，地址为文二路207号耀江文欣苑。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r258_internet', 'r258', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥22，地址为黄姑山路57号文鸿金座(文三路地铁站A口步行370米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r259_internet', 'r259', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.0、人均约 ¥31，地址为雅乐国际花园11-3幢-224室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r260_internet', 'r260', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.6、人均约 ¥42，地址为西溪路75号西溪路75号院。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r261_internet', 'r261', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥26，地址为文三路355号(文三路地铁站A口步行240米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r262_internet', 'r262', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥25，地址为文二路32号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r263_internet', 'r263', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥23，地址为西溪街道文二路177号(下宁桥地铁站B口步行120米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r264_internet', 'r264', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥27，地址为沈塘桥地铁站A口步行50米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r265_internet', 'r265', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.4、人均约 ¥18，地址为浙江体育职业技术学院教工路校区东2门旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r266_internet', 'r266', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥30，地址为翠苑街道黄姑三路55-2。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r267_internet', 'r267', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥30，地址为文二路213号(下宁桥地铁站B口步行260米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r268_internet', 'r268', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥30，地址为翠苑街道学院路77号黄龙国际中心AB楼室外外广场A5室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r269_internet', 'r269', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥55，地址为西溪路与万塘路交叉口东南40米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r270_internet', 'r270', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.3，地址为西溪路与万塘路交叉口南40米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r271_internet', 'r271', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.1、人均约 ¥17，地址为浙江大学西溪校区图书馆一楼1号。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r272_internet', 'r272', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥16，地址为文三路90号东部软件园数智广场2-3号玻璃房。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r273_internet', 'r273', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥9，地址为文三路90号东部软件园南门处玻璃房。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r274_internet', 'r274', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥16，地址为欧美中心1号楼1层D112-1C商铺。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r275_internet', 'r275', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥15，地址为教工路88号立元大厦一层101室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r276_internet', 'r276', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥17，地址为学教工路18号世贸丽晶城欧美中心2号楼F区1层115室。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r277_internet', 'r277', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥16，地址为马塍路28-30号小区西门旁。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r278_internet', 'r278', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥19，地址为教工路18号世贸丽晶城·欧美中心C座。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r279_internet', 'r279', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 5, '系统整理：高德 POI 显示评分 4.5、人均约 ¥6，地址为文三路318号(文三路地铁站A口步行240米)。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r280_internet', 'r280', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.4、人均约 ¥20，地址为马塍路10-11外。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r281_internet', 'r281', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 4, '系统整理：高德 POI 显示评分 4.2、人均约 ¥9，地址为教工路23号百脑汇科技大厦1层大堂。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
  'rv_r282_internet', 'r282', null, '互联网小助手', '{"type":"preset","preset":"rice","text":"搜","color":"#2f7df6"}'::jsonb, 3, '系统整理：高德 POI 显示评分 3.1、人均约 ¥24，地址为西溪路与万塘路交叉口东南20米。本条是公开信息整理，不代表学生实地体验。', array['系统整理', '公开信息']::text[], 'approved'
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
