import 'package:shared_preferences/shared_preferences.dart';

class InitialWords {
  static Future<void> initializeWords() async {
    final prefs = await SharedPreferences.getInstance();

    // 유아 단계
    await prefs.setStringList('유아 단계', [
      'baby-아기',
      'ball-공',
      'bird-새',
      'car-자동차',
      'cat-고양이',
      'dog-개',
      'flower-꽃',
      'mom-엄마',
      'dad-아빠',
      'tree-나무'
    ]);

    // 초등 저학년 단계
    await prefs.setStringList('초등 저학년 단계', [
      'apple-사과',
      'book-책',
      'friend-친구',
      'house-집',
      'school-학교',
      'sun-태양',
      'water-물',
      'color-색깔',
      'happy-행복한',
      'play-놀다'
    ]);

    // 초등 중학년 단계
    await prefs.setStringList('초등 중학년 단계', [
      'family-가족',
      'learn-배우다',
      'music-음악',
      'question-질문',
      'story-이야기',
      'animal-동물',
      'beautiful-아름다운',
      'careful-조심스러운',
      'forest-숲',
      'travel-여행하다'
    ]);

    // 초등 고학년 단계
    await prefs.setStringList('초등 고학년 단계', [
      'believe-믿다',
      'create-창조하다',
      'explore-탐험하다',
      'imagine-상상하다',
      'interest-흥미',
      'problem-문제',
      'protect-보호하다',
      'science-과학',
      'weather-날씨',
      'wonderful-멋진'
    ]);

    // 중학 저학년 단계
    await prefs.setStringList('중학 저학년 단계', [
      'analyze-분석하다',
      'benefit-이익',
      'challenge-도전',
      'compare-비교하다',
      'develop-개발하다',
      'environment-환경',
      'opinion-의견',
      'participate-참여하다',
      'research-연구',
      'various-다양한'
    ]);

    // 중학 고학년 단계
    await prefs.setStringList('중학 고학년 단계', [
      'communicate-의사소통하다',
      'cooperate-협력하다',
      'describe-묘사하다',
      'discuss-토론하다',
      'evaluate-평가하다',
      'influence-영향',
      'maintain-유지하다',
      'predict-예측하다',
      'solution-해결책',
      'support-지지하다'
    ]);

    // 고교 저학년 단계
    await prefs.setStringList('고교 저학년 단계', [
      'acquire-습득하다',
      'contribute-기여하다',
      'critical-비판적인',
      'diversity-다양성',
      'essential-필수적인',
      'hypothesis-가설',
      'investigate-조사하다',
      'potential-잠재력',
      'significant-중요한',
      'strategy-전략'
    ]);

    // 고교 고학년 단계
    await prefs.setStringList('고교 고학년 단계', [
      'analyze-분석하다',
      'complexity-복잡성',
      'demonstrate-증명하다',
      'enhance-향상시키다',
      'innovation-혁신',
      'phenomenon-현상',
      'sophisticated-정교한',
      'transform-변형시키다',
      'verify-검증하다',
      'advocate-옹호하다'
    ]);

    // 대학 기초 단계
    await prefs.setStringList('대학 기초 단계', [
      'abstract-추상적인',
      'analysis-분석',
      'concept-개념',
      'context-맥락',
      'derive-끌어내다',
      'framework-틀',
      'interpret-해석하다',
      'methodology-방법론',
      'principle-원칙',
      'thesis-논문'
    ]);

    // 대학 심화 단계
    await prefs.setStringList('대학 심화 단계', [
      'articulate-명료하게 설명하다',
      'critique-비평',
      'discourse-담론',
      'empirical-경험적인',
      'paradigm-모범',
      'qualitative-정성적인',
      'quantitative-정량적인',
      'synthesize-종합하다',
      'theoretical-이론적인',
      'validate-입증하다'
    ]);

    // 일반 직장인 단계
    await prefs.setStringList('일반 직장인 단계', [
      'collaborate-협업하다',
      'delegate-위임하다',
      'expertise-전문 지식',
      'initiative-주도권',
      'negotiate-협상하다',
      'objective-목표',
      'optimize-최적화하다',
      'proficiency-능숙함',
      'resource-자원',
      'synergy-시너지'
    ]);

    // 전문 직장인 단계
    await prefs.setStringList('전문 직장인 단계', [
      'align-조정하다',
      'benchmark-기준',
      'compliance-준수',
      'consensus-합의',
      'discrepancy-불일치',
      'facilitate-촉진하다',
      'implement-실행하다',
      'mitigate-완화하다',
      'strategic-전략적인',
      'sustainability-지속 가능성'
    ]);

    // 마스터 단계
    await prefs.setStringList('마스터 단계', [
      'aberration-탈선',
      'cogent-설득력 있는',
      'didactic-교훈적인',
      'ephemeral-덧없는',
      'incumbent-의무적인',
      'innocuous-해롭지 않은',
      'myriad-무수히 많음',
      'ostensible-표면상의',
      'paradox-역설',
      'ubiquitous-어디에나 있는'
    ]);
  }
}
