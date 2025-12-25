import 'package:flutter/material.dart';

class VillesPage extends StatelessWidget {
  const VillesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section Villes
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1539650116574-75c0c6d0b7ef?w=800'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Découvrez Nos Villes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Les plus belles destinations du Maroc',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Villes Grid
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Destinations Exceptionnelles',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Explorez les trésors cachés et les merveilles du Maroc',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildVilleCard(
                        context,
                        'Marrakech',
                        'La ville rouge, cœur battant du Maroc',
                        'https://images.unsplash.com/photo-1539650116574-75c0c6d0b7ef?w=400',
                        ['Jardin Majorelle', 'Palmeraie', 'Souks', 'Koutoubia'],
                        '89€',
                      ),
                      _buildVilleCard(
                        context,
                        'Fès',
                        'La plus ancienne des villes impériales',
                        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
                        ['Médina', 'Université Al Quaraouiyine', 'Souks', 'Palais'],
                        '65€',
                      ),
                      _buildVilleCard(
                        context,
                        'Chefchaouen',
                        'La ville bleue, perle du Rif',
                        'https://images.unsplash.com/photo-1551632811-561732d1e306?w=400',
                        ['Médina bleue', 'Montagnes', 'Artisanat', 'Nature'],
                        '75€',
                      ),
                      _buildVilleCard(
                        context,
                        'Agadir',
                        'Station balnéaire moderne',
                        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
                        ['Plages', 'Marina', 'Souk El Had', 'Golf'],
                        '95€',
                      ),
                      _buildVilleCard(
                        context,
                        'Ouarzazate',
                        'Porte du désert du Sahara',
                        'https://images.unsplash.com/photo-1542219550-37153d387c27?w=400',
                        ['Atlas Studios', 'Kasbahs', 'Désert', 'Cinéma'],
                        '120€',
                      ),
                      _buildVilleCard(
                        context,
                        'Rabat',
                        'Capitale moderne et historique',
                        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
                        ['Casbah', 'Tour Hassan', 'Jardin d\'essais', 'Musées'],
                        '55€',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section Circuit
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  const Text(
                    'Circuits Recommandés',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Des itinéraires soigneusement élaborés pour une expérience inoubliable',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  _buildCircuitCard(
                    'Circuit Impérial',
                    '8 jours',
                    'Marrakech → Fès → Rabat → Casablanca',
                    ['Visite des 4 villes impériales', 'Guide francophone', 'Hébergement 4*', 'Repas inclus'],
                    '450€',
                    Colors.blue,
                  ),
                  const SizedBox(height: 30),
                  _buildCircuitCard(
                    'Aventure Désert',
                    '6 jours',
                    'Marrakech → Ouarzazate → Désert → Fès',
                    ['Nuit dans le désert', 'Randonnée chameau', 'Kasbahs', 'Coucher de soleil'],
                    '380€',
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: const Text(
        'Tourisme Maroc',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/'),
          child: const Text('Accueil'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/services'),
          child: const Text('Services'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/villes'),
          child: const Text('Villes', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/contact'),
          child: const Text('Contact'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/reservations'),
          child: const Text('Réservations'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/reservations'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          child: const Text('Réserver'),
        ),
      ],
    );
  }

  Widget _buildVilleCard(BuildContext context, String name, String description, String imageUrl, List<String> highlights, String price) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: highlights.map((highlight) => Chip(
                    label: Text(highlight, style: const TextStyle(fontSize: 12)),
                    backgroundColor: Colors.orange.withOpacity(0.1),
                    labelStyle: TextStyle(color: Colors.orange.shade700, fontWeight: FontWeight.w500),
                  )).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'À partir de $price',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/reservations'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Visiter'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircuitCard(String title, String duration, String route, List<String> features, String price, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.grey.shade600, size: 20),
                      const SizedBox(width: 5),
                      Text(duration, style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(width: 20),
                      Icon(Icons.route, color: Colors.grey.shade600, size: 20),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(route, style: TextStyle(color: Colors.grey.shade600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...features.map((feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: color, size: 20),
                        const SizedBox(width: 10),
                        Text(feature),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Column(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const Text('par personne'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Réserver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}