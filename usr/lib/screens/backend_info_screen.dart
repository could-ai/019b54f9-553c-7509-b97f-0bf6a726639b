import 'package:flutter/material.dart';

class BackendInfoScreen extends StatelessWidget {
  const BackendInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations Backend'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Architecture Backend Recommandée',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              'Express.js Backend',
              'Node.js avec Express.js pour une API REST simple et rapide à développer.',
              Icons.code,
              Colors.green,
              [
                'Créer un serveur Express basique',
                'Configurer les routes API (GET, POST, PUT, DELETE)',
                'Implémenter la gestion des réservations',
                'Ajouter l\'upload d\'images',
                'Configurer la base de données (MongoDB ou PostgreSQL)',
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              'Base de données',
              'Stockage des données utilisateurs, réservations, et contenu du site.',
              Icons.storage,
              Colors.blue,
              [
                'Utilisateurs (nom, email, téléphone)',
                'Réservations (client, destination, dates, statut)',
                'Contenu (villes, activités, images, descriptions)',
                'Statistiques (visites, conversions, revenus)',
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(
              'Fonctionnalités Admin',
              'Interface pour gérer le contenu et consulter les statistiques.',
              Icons.admin_panel_settings,
              Colors.orange,
              [
                'Authentification admin',
                'CRUD pour villes et activités',
                'Gestion des réservations (confirmation/annulation)',
                'Upload et gestion d\'images',
                'Tableau de bord avec statistiques',
                'Export de données',
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prochaines Étapes',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    _buildStep('1. Configurer Supabase pour la base de données et l\'authentification'),
                    _buildStep('2. Créer les Edge Functions pour les API backend'),
                    _buildStep('3. Implémenter l\'upload d\'images et la gestion du contenu'),
                    _buildStep('4. Développer la logique des réservations'),
                    _buildStep('5. Ajouter les statistiques et rapports admin'),
                    _buildStep('6. Tester et déployer l\'application'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description, IconData icon, Color color, List<String> features) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: color),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 15),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: color, size: 20),
                  const SizedBox(width: 10),
                  Expanded(child: Text(feature)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 16),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              step,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}