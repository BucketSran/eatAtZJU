import type { CampusOption, MealCategoryOption } from './restaurantTaxonomy'

export const TUTORIAL_REQUIREMENT_PRESET = {
  budget: '不限',
  campus: '玉泉' as CampusOption,
  mealCategory: '正餐' as MealCategoryOption,
  serviceMode: '都可以',
  tags: ['不辣', '非食堂']
} as const
