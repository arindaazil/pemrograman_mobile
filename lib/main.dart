import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedule Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Tugas {
  final String id;
  final String matkul;
  final String judul;
  final String deadline;
  final bool selesai;
  final Color warna;

  Tugas({
    required this.id,
    required this.matkul,
    required this.judul,
    required this.deadline,
    required this.selesai,
    required this.warna,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String namaMahasiswa = "Arinda Zilva Safira";

  List<Tugas> listTugas = [
    Tugas(id: '1', matkul: 'Pemrograman Mobile', judul: 'membuat Wireframe dua screen', deadline: 'Hari ini, 23:59', selesai: false, warna: Colors.redAccent),
    Tugas(id: '2', matkul: 'Metode Numerik', judul: 'Mengerjakan tugas 4, newtown raphson', deadline: 'Besok, 12:00', selesai: false, warna: Colors.orange),
    Tugas(id: '3', matkul: 'Metodologi Penelitian', judul: 'membuat Proposal penelitian ', deadline: '3 hari lagi', selesai: true, warna: Colors.green),
  ];

  void toggleSelesai(String id) {
    setState(() {
      listTugas = listTugas.map((tugas) {
        if (tugas.id == id) {
          return Tugas(
            id: tugas.id,
            matkul: tugas.matkul,
            judul: tugas.judul,
            deadline: tugas.deadline,
            selesai: !tugas.selesai,
            warna: !tugas.selesai ? Colors.green : Colors.orange,
          );
        }
        return tugas;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    int jumlahBelumSelesai =
        listTugas.where((t) => !t.selesai).length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Jadwal Hari Ini',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // HEADER PROFIL + TANGGAL
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          size: 30, color: Colors.indigo),
                    ),
                    const SizedBox(width: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, $namaMahasiswa 👋',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$jumlahBelumSelesai Tugas Belum Selesai',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),

                const Icon(Icons.calendar_month,
                    color: Colors.white, size: 40),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text('Daftar Tugas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          // LIST TUGAS
          ...listTugas.map((tugas) => Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      tugas: tugas,
                      toggleSelesai: toggleSelesai,
                    ),
                  ),
                );
              },
              leading: Container(width: 4, color: tugas.warna),
              title: Text(
                tugas.judul,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: tugas.selesai
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              subtitle: Text(
                  '${tugas.matkul}\nDeadline: ${tugas.deadline}'),
              isThreeLine: true,
              trailing: IconButton(
                onPressed: () => toggleSelesai(tugas.id),
                icon: Icon(
                  tugas.selesai
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: tugas.selesai
                      ? Colors.green
                      : Colors.grey,
                  size: 28,
                ),
              ),
            ),
          )),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Tambah Tugas'),
      ),
    );
  }
}

// DETAIL SCREEN
class DetailScreen extends StatelessWidget {
  final Tugas tugas;
  final Function(String) toggleSelesai;

  const DetailScreen({
    super.key,
    required this.tugas,
    required this.toggleSelesai,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tugas.matkul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tugas.judul,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            Chip(
              label: Text(
                  tugas.selesai ? 'Selesai' : 'Belum Selesai'),
              backgroundColor: tugas.selesai
                  ? Colors.green[100]
                  : Colors.red[100],
            ),

            const SizedBox(height: 20),

            const Text('Deadline',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.access_time, size: 20),
                const SizedBox(width: 8),
                Text(tugas.deadline,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),

            const Divider(height: 40),

            const Text('Deskripsi',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Text(
                'Kerjakan sesuai instruksi dan upload ke e-learning.'),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pengingat'),
                          content: const Text(
                              'Pengingat 1 jam sebelum deadline aktif'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context),
                                child: const Text('Oke'))
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.alarm),
                    label: const Text('Pengingat'),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      toggleSelesai(tugas.id);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Selesai'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}