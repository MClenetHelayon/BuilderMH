class Transcendance {
  final int id, slot;
  final String name;

  Transcendance({required this.name, required this.slot, required this.id});

  static getBase() {
    return Transcendance(
      id: 9999,
      name: "-----------------------",
      slot: 0,
    );
  }
}
