alter table public.restaurants
  add column if not exists service_modes text[] not null default array[]::text[],
  add column if not exists meal_periods text[] not null default array[]::text[],
  add column if not exists scenario_tags text[] not null default array[]::text[],
  add column if not exists constraint_tags text[] not null default array[]::text[],
  add column if not exists preference_tags text[] not null default array[]::text[];

create index if not exists restaurants_service_modes_idx on public.restaurants using gin(service_modes);
create index if not exists restaurants_meal_periods_idx on public.restaurants using gin(meal_periods);
create index if not exists restaurants_scenario_tags_idx on public.restaurants using gin(scenario_tags);
create index if not exists restaurants_constraint_tags_idx on public.restaurants using gin(constraint_tags);
create index if not exists restaurants_preference_tags_idx on public.restaurants using gin(preference_tags);

update public.restaurants
set
  service_modes = array_remove(array[
    case when tags && array['快餐','一人食','实惠','人均30内','轻负担']::text[] or suited_for && array['快速解决','单人吃饭','懒得出校','赶时间']::text[] then '外卖' end,
    case when tags && array['校内','聚餐','下饭','拍照','暖胃','清真友好']::text[] or suited_for && array['多人拼桌','多人约饭','四人聚餐','拍照打卡']::text[] then '堂食' end
  ], null),
  meal_periods = array_remove(array[
    case when tags && array['暖胃','面食','校内','近','清真友好']::text[] or suited_for && array['雨天热汤','雨天热饭','清真友好']::text[] then '早餐' end,
    case when tags && array['快餐','实惠','一人食','校内','人均30内']::text[] or suited_for && array['午餐快吃','课间午餐','赶课午餐','赶课午饭']::text[] then '中餐' end,
    case when tags && array['咖啡','甜品','拍照','轻负担']::text[] or suited_for && array['下午自习','拍照打卡','嘴馋']::text[] then '下午茶' end,
    case when tags && array['聚餐','下饭','辣','人均50内']::text[] or suited_for && array['晚饭快吃','晚饭改善','晚餐聚餐','重口晚饭']::text[] then '晚餐' end,
    case when tags && array['夜宵','小吃','暖胃']::text[] or suited_for && array['夜宵','夜宵改善','晚归加餐','夜跑后']::text[] then '夜宵' end
  ], null),
  scenario_tags = array_remove(array[
    case when tags && array['一人食']::text[] or suited_for && array['一个人','单人吃饭','独自觅食','独处放空']::text[] then '一人食' end,
    case when tags && array['聚餐']::text[] or suited_for && array['多人拼桌','多人约饭','四人聚餐','三五好友','两人小聚']::text[] then '聚餐' end,
    case when tags && array['快餐']::text[] or suited_for && array['赶课午餐','赶课午饭','课间午餐','快速解决','赶时间']::text[] then '赶课快吃' end,
    case when suited_for && array['晚自习前','下午自习','晚课后']::text[] then '自习后' end,
    case when tags && array['拍照']::text[] or suited_for && array['拍照打卡','轻约会']::text[] then '约会拍照' end,
    case when tags && array['轻负担']::text[] or suited_for && array['健身后','夜跑后']::text[] then '运动后' end,
    case when tags && array['校内','近']::text[] or suited_for && array['懒得出校']::text[] then '懒得出校' end
  ], null),
  constraint_tags = array_remove(array[
    case when tags && array['辣','微辣']::text[] or suited_for && array['想吃辣','重口晚饭']::text[] then '辣' end,
    case when tags && array['不辣']::text[] or suited_for && array['不想吃辣','清淡晚饭']::text[] then '不辣' end,
    case when tags && array['轻负担']::text[] or suited_for && array['不想太油','健身后']::text[] then '轻负担' end,
    case when tags && array['大份']::text[] or suited_for && array['想吃大份','大份下饭']::text[] then '大份' end,
    case when tags && array['快乐碳水']::text[] then '快乐碳水' end,
    case when tags && array['清真友好']::text[] or suited_for && array['清真友好']::text[] then '清真友好' end
  ], null),
  preference_tags = array_remove(array[
    case when tags && array['暖胃']::text[] or suited_for && array['雨天热汤','雨天热饭']::text[] then '暖胃' end,
    case when tags && array['下饭']::text[] or suited_for && array['大份下饭']::text[] then '下饭' end,
    case when tags && array['面食']::text[] or cuisine like '%面%' or cuisine like '%粉%' then '面食' end,
    case when tags && array['小吃']::text[] or cuisine like '%小吃%' then '小吃' end,
    case when tags && array['拍照']::text[] or suited_for && array['拍照打卡']::text[] then '拍照' end,
    case when tags && array['清爽']::text[] or suited_for && array['清爽午餐','清爽汤粉']::text[] then '清爽' end,
    case when tags && array['快餐']::text[] or suited_for && array['快速解决']::text[] then '快餐' end,
    case when tags && array['实惠','人均30内']::text[] or suited_for && array['预算友好']::text[] then '实惠' end
  ], null)
where
  service_modes = array[]::text[]
  or meal_periods = array[]::text[]
  or scenario_tags = array[]::text[]
  or constraint_tags = array[]::text[]
  or preference_tags = array[]::text[];
