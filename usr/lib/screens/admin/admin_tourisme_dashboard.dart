import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _DashboardOverview(),
    const _ContentManagement(),
    const _ReservationsManagement(),
    const _StatisticsPage(),
    const _SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administration - Tourisme Maroc'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.admin_panel_settings, size: 35, color: Colors.blue.shade900),
                ),
                SizedBox(height: 10),
                Text(
                  'Administrateur',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'admin@tourismemaroc.ma',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerItem(0, Icons.dashboard, 'Tableau de bord'),
          _buildDrawerItem(1, Icons.edit, 'Gestion du contenu'),
          _buildDrawerItem(2, Icons.book_online, 'Réservations'),
          _buildDrawerItem(3, Icons.analytics, 'Statistiques'),
          _buildDrawerItem(4, Icons.settings, 'Paramètres'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? Colors.blue.shade900 : Colors.grey.shade600),
      title: Text(
        title,
        style: TextStyle(
          color: _selectedIndex == index ? Colors.blue.shade900 : Colors.grey.shade600,
          fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: _selectedIndex == index,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.of(context).pop();
      },
    );
  }
}

class _DashboardOverview extends StatelessWidget {
  const _DashboardOverview();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aperçu général',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildStatCard('Réservations', '247', Icons.book_online, Colors.blue),
              _buildStatCard('Revenus', '45,230€', Icons.euro, Colors.green),
              _buildStatCard('Clients', '1,543', Icons.people, Colors.orange),
              _buildStatCard('Activités', '89', Icons.explore, Colors.purple),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Réservations récentes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildRecentReservations(),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentReservations() {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final reservations = [
            {'client': 'Marie Dupont', 'destination': 'Marrakech', 'date': '15/12/2024', 'status': 'Confirmée'},
            {'client': 'Jean Martin', 'destination': 'Fès', 'date': '18/12/2024', 'status': 'En attente'},
            {'client': 'Sophie Bernard', 'destination': 'Chefchaouen', 'date': '20/12/2024', 'status': 'Confirmée'},
            {'client': 'Pierre Dubois', 'destination': 'Agadir', 'date': '22/12/2024', 'status': 'Confirmée'},
            {'client': 'Alice Moreau', 'destination': 'Ouarzazate', 'date': '25/12/2024', 'status': 'En attente'},
          ];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(reservations[index]['client']!.substring(0, 1)),
            ),
            title: Text(reservations[index]['client']!),
            subtitle: Text('${reservations[index]['destination']} - ${reservations[index]['date']}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: reservations[index]['status'] == 'Confirmée' ? Colors.green.shade100 : Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                reservations[index]['status']!,
                style: TextStyle(
                  color: reservations[index]['status'] == 'Confirmée' ? Colors.green.shade800 : Colors.orange.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ContentManagement extends StatefulWidget {
  const _ContentManagement();

  @override
  State<_ContentManagement> createState() => _ContentManagementState();
}

class _ContentManagementState extends State<_ContentManagement> {
  final List<Map<String, dynamic>> _contentItems = [
    {'type': 'Ville', 'title': 'Marrakech', 'description': 'La ville rouge...', 'image': 'https://images.unsplash.com/photo-1539650116574-75c0c6d0b7ef?w=400'},
    {'type': 'Activité', 'title': 'Randonnée Atlas', 'description': 'Découvrez les montagnes...', 'image': 'https://images.unsplash.com/photo-1464822759844-d150f39b8d94?w=400'},
    {'type': 'Service', 'title': 'Guide touristique', 'description': 'Accompagnement personnalisé...', 'image': 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Gestion du contenu',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () => _showAddContentDialog(context),
                icon: const Icon(Icons.add),
                label: const Text('Ajouter du contenu'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: _contentItems.length,
            itemBuilder: (context, index) {
              final item = _contentItems[index];
              return Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                          image: DecorationImage(
                            image: NetworkImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['type'],
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    _editContentItem(context, index);
                                  } else if (value == 'delete') {
                                    _deleteContentItem(index);
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(value: 'edit', child: Text('Modifier')),
                                  const PopupMenuItem(value: 'delete', child: Text('Supprimer')),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item['description'],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAddContentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter du contenu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Nouvelle destination'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: Implement add destination
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('Nouvelle activité'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: Implement add activity
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Nouvelle image'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: Implement add image
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editContentItem(BuildContext context, int index) {
    // TODO: Implement edit functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fonctionnalité de modification à implémenter')),
    );
  }

  void _deleteContentItem(int index) {
    setState(() {
      _contentItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contenu supprimé')),
    );
  }
}

class _ReservationsManagement extends StatelessWidget {
  const _ReservationsManagement();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gestion des réservations',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text('M'),
                  ),
                  title: Text('Réservation #${1000 + index}'),
                  subtitle: Text('Client: Marie Dupont - Marrakech - 15/12/2024'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Confirmée',
                          style: TextStyle(
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          // TODO: Implement reservation actions
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'view', child: Text('Voir détails')),
                          const PopupMenuItem(value: 'edit', child: Text('Modifier')),
                          const PopupMenuItem(value: 'cancel', child: Text('Annuler')),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsPage extends StatelessWidget {
  const _StatisticsPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistiques',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildStatCard('Visiteurs aujourd\'hui', '156', Icons.people, Colors.blue),
              _buildStatCard('Pages vues', '2,847', Icons.visibility, Colors.green),
              _buildStatCard('Taux de conversion', '3.2%', Icons.trending_up, Colors.orange),
              _buildStatCard('Revenus mensuels', '45,230€', Icons.euro, Colors.purple),
              _buildStatCard('Réservations actives', '89', Icons.book_online, Colors.red),
              _buildStatCard('Satisfaction client', '4.8/5', Icons.star, Colors.amber),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            'Évolution des réservations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Placeholder for chart
                  Container(
                    height: 200,
                    color: Colors.grey.shade100,
                    child: const Center(
                      child: Text('Graphique d\'évolution des réservations'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildChartLegend('Ce mois', '247', Colors.blue),
                      _buildChartLegend('Mois dernier', '189', Colors.grey),
                      _buildChartLegend('Objectif', '300', Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartLegend(String label, String value, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
          const SizedBox(width: 8),
          Text('$label: $value'),
        ],
      );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paramètres',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informations générales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: 'Tourisme Maroc',
                    decoration: const InputDecoration(
                      labelText: 'Nom de l\'entreprise',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    initialValue: 'contact@tourismemaroc.ma',
                    decoration: const InputDecoration(
                      labelText: 'Email de contact',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    initialValue: '+212 6 12 34 56 78',
                    decoration: const InputDecoration(
                      labelText: 'Téléphone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Paramètres sauvegardés')),
                      );
                    },
                    child: const Text('Sauvegarder'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}