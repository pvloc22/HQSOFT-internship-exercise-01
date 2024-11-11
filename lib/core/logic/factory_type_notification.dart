class FactoryTypeNotification {
  static String getTypeNotification(int index) {
    switch (index) {
      case 0:
        return '';
      case 1:
        return 'AutoPromoTrade';
      case 2:
        return 'OtherTrade';
      case 3:
        return 'WorkingNote';
      case 4:
        return 'Other';
      default:
        return '';
    }
  }
}
