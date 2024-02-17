enum StatusComparingCryptocurrencyEnum {
  ToCompare('To compare'),
  CompareWith('Compare with'),
  Comparing('Comparing');

  const StatusComparingCryptocurrencyEnum(this.status);
  final String status;

  static StatusComparingCryptocurrencyEnum fromString(String order) {
    switch (order) {
      case 'To compare':
        return StatusComparingCryptocurrencyEnum.ToCompare;
      case 'Compare with':
        return StatusComparingCryptocurrencyEnum.CompareWith;
      case 'Comparing':
        return StatusComparingCryptocurrencyEnum.Comparing;

      default:
        throw ArgumentError('No valid: $order');
    }
  }
}
