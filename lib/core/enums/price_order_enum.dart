enum PriceOrderEnum {
  ASC('Asc'),
  DESC('Des');

  const PriceOrderEnum(this.order);
  final String order;

  static PriceOrderEnum fromString(String order) {
    switch (order) {
      case 'Asc':
        return PriceOrderEnum.ASC;
      case 'Des':
        return PriceOrderEnum.DESC;
      default:
        throw ArgumentError('No valid: $order');
    }
  }
}
