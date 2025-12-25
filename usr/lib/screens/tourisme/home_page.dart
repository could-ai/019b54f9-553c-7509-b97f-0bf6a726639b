import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tourisme Maroc',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text('Accueil', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/services'),
            child: const Text('Services', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/villes'),
            child: const Text('Villes', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/reservations'),
            child: const Text('Réservations', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=800'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Découvrez le Maroc',
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
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Des expériences uniques dans les plus belles destinations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/reservations'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Réserver Maintenant',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Section Activités Populaires
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  const Text(
                    'Activités Populaires',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Découvrez nos excursions et activités les plus demandées',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final activities = [
                        {'title': 'Randonnée Atlas', 'price': '89€', 'image': 'https://images.unsplash.com/photo-1464822759844-d150f39b8d94?w=400'},
                        {'title': 'Visite Marrakech', 'price': '45€', 'image': 'https://images.unsplash.com/photo-1539650116574-75c0c6d0b7ef?w=400'},
                        {'title': 'Désert Sahara', 'price': '120€', 'image': 'https://images.unsplash.com/photo-1542219550-37153d387c27?w=400'},
                        {'title': 'Plage Agadir', 'price': '65€', 'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400'},
                        {'title': 'Médina Fès', 'price': '35€', 'image': 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400'},
                        {'title': 'Chefchaouen', 'price': '75€', 'image': 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400'},
                      ];
                      return _buildActivityCard(context, activities[index]);
                    },
                  ),
                ],
              ),
            ),

            // Section Pourquoi Nous Choisir
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'Pourquoi Nous Choisir',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureCard(
                        Icons.verified_user,
                        'Guides Expérimentés',
                        'Nos guides locaux connaissent parfaitement le Maroc',
                      ),
                      _buildFeatureCard(
                        Icons.security,
                        'Sécurité Garantie',
                        'Vos voyages sont entièrement assurés',
                      ),
                      _buildFeatureCard(
                        Icons.star,
                        'Qualité Premium',
                        'Expériences uniques et authentiques',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(40),
              color: Colors.black87,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tourisme Maroc',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Votre partenaire pour découvrir le Maroc authentique',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Liens Rapides',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/'),
                            child: const Text('Accueil', style: TextStyle(color: Colors.white70)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/services'),
                            child: const Text('Services', style: TextStyle(color: Colors.white70)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/contact'),
                            child: const Text('Contact', style: TextStyle(color: Colors.white70)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white30, height: 40),
                  const Text(
                    '© 2024 Tourisme Maroc. Tous droits réservés.',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, Map<String, String> activity) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(activity['image']!),
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
                Text(
                  activity['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'À partir de ${activity['price']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/reservations'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Réserver'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: Colors.orange),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}