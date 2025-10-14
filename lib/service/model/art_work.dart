class ArtWork {
  final String id;
  final String title;
  final String imageUrl;
  final String artist;
  final String date;
  final String department;

  ArtWork({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.date,
    required this.department,
  });

  factory ArtWork.fromMap(Map<String, dynamic> data, String documentId) {
    return ArtWork(
      id: documentId,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      artist: '',
      date: '',
      department: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'artist': artist,
      'date': date,
      'department': department,
    };
  }
}
