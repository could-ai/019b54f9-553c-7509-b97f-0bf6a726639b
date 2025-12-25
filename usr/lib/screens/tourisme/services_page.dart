import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section Services
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800'),
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
                        'Nos Services',
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
                        'Découvrez toutes nos prestations touristiques',
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

            // Services Grid
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Ce que nous proposons',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Une gamme complète de services pour votre séjour au Maroc',
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
                      _buildServiceCard(
                        'Excursions Organisées',
                        'Découvrez les plus beaux sites du Maroc avec nos guides expérimentés',
                        Icons.explore,
                        Colors.blue,
                        ['Randonnée', 'Culture', 'Aventure', 'Détente'],
                      ),
                      _buildServiceCard(
                        'Hébergement',
                        'Des hôtels et riads sélectionnés pour votre confort',
                        Icons.hotel,
                        Colors.green,
                        ['Riads', 'Hôtels', 'Maisons d\'hôtes', 'Camping'],
                      ),
                      _buildServiceCard(
                        'Transport',
                        'Déplacements en toute sécurité avec nos véhicules modernes',
                        Icons.directions_car,
                        Colors.orange,
                        ['Voiture', 'Bus', '4x4', 'Transfert aéroport'],
                      ),
                      _buildServiceCard(
                        'Activités',
                        'Sports, loisirs et expériences uniques',
                        Icons.sports_soccer,
                        Colors.purple,
                        ['Trek', 'Plongée', 'Golf', 'Spa'],
                      ),
                      _buildServiceCard(
                        'Gastronomie',
                        'Découvrez la cuisine marocaine authentique',
                        Icons.restaurant,
                        Colors.red,
                        ['Cuisine locale', 'Cours de cuisine', 'Dîners traditionnels'],
                      ),
                      _buildServiceCard(
                        'Guide touristique',
                        'Accompagnement personnalisé tout au long de votre séjour',
                        Icons.person,
                        Colors.teal,
                        ['Guide francophone', 'Guide anglophone', 'Guide privé'],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section Tarifs
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  const Text(
                    'Nos Forfaits',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPricingCard(
                        'Découverte',
                        '149€',
                        'par personne',
                        ['Transport A/R', 'Guide', '2 nuits hôtel', 'Repas'],
                        Colors.blue,
                      ),
                      _buildPricingCard(
                        'Premium',
                        '299€',
                        'par personne',
                        ['Transport A/R', 'Guide privé', '4 nuits riad', 'Tous repas', 'Activités'],
                        Colors.orange,
                        true,
                      ),
                      _buildPricingCard(
                        'Luxe',
                        '499€',
                        'par personne',
                        ['Transport privé', 'Guide VIP', '6 nuits palace', 'Gastronomie', 'SPA'],
                        Colors.purple,
                      ),
                    ],
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
          child: const Text('Services', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/villes'),
          child: const Text('Villes'),
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

  Widget _buildServiceCard(String title, String description, IconData icon, Color color, List<String> features) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.5,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: features.map((feature) => Chip(
                label: Text(feature),
                backgroundColor: color.withOpacity(0.1),
                labelStyle: TextStyle(color: color, fontWeight: FontWeight.w500),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCard(String title, String price, String period, List<String> features, Color color, [bool isPopular = false]) {
    return Card(
      elevation: isPopular ? 12 : 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: isPopular ? Border.all(color: color, width: 2) : null,
        ),
        child: Column(
          children: [
            if (isPopular)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Le plus populaire',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  period,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.check, color: color, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPopular ? color : Colors.grey.shade300,
                  foregroundColor: isPopular ? Colors.white : Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Choisir ce forfait'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}