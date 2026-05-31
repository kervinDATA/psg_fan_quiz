class League {
  final String id; // Le fameux code secret à 6 lettres
  final String name; // Le nom du groupe (ex: "Les Ultras")
  final String adminId; // L'ID du créateur
  final List<String> members; // La liste des ID des joueurs
  final int currentDay; // Le jour actuel du championnat (1, 2 ou 3)

  League({
    required this.id,
    required this.name,
    required this.adminId,
    required this.members,
    this.currentDay = 1,
  });

  // Fonction pour transformer les données Firestore en objet Flutter
  factory League.fromMap(Map<String, dynamic> data, String documentId) {
    return League(
      id: documentId,
      name: data['name'] ?? '',
      adminId: data['adminId'] ?? '',
      members: List<String>.from(data['members'] ?? []),
      currentDay: data['currentDay'] ?? 1,
    );
  }
}