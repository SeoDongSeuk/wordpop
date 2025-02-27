class LevelTimeLimit {
  static int getTimeLimit(String levelName) {
    int timeLimit = 30; // 기본 제한 시간 (30초)
    if (levelName == '유아 단계') {
      timeLimit = 30;
    } else if (levelName == '초등 저학년 단계') {
      timeLimit = 40;
    } else if (levelName == '초등 중학년 단계') {
      timeLimit = 50;
    } else if (levelName == '초등 고학년 단계') {
      timeLimit = 60;
    } else if (levelName == '중학 저학년 단계') {
      timeLimit = 70;
    } else if (levelName == '중학 고학년 단계') {
      timeLimit = 80;
    } else if (levelName == '고교 저학년 단계') {
      timeLimit = 90;
    } else if (levelName == '고교 고학년 단계') {
      timeLimit = 100;
    } else if (levelName == '대학 기초 단계') {
      timeLimit = 110;
    } else if (levelName == '대학 심화 단계') {
      timeLimit = 120;
    } else if (levelName == '일반 직장인 단계') {
      timeLimit = 130;
    } else if (levelName == '전문 직장인 단계') {
      timeLimit = 140;
    } else if (levelName == '마스터 단계') {
      timeLimit = 150;
    }
    return timeLimit;
  }
}
