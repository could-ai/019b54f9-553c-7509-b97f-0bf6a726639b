import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section Contact
            Container(
              height: 300,
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
                        'Contactez-nous',
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
                        'Nous sommes là pour vous aider',
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

            // Contact Content
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text(
                    'Prêt à découvrir le Maroc ?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Notre équipe est à votre disposition pour répondre à toutes vos questions et vous accompagner dans l\'organisation de votre voyage.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 60),

                  // Contact Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildContactCard(
                          'Téléphone',
                          '+212 6 12 34 56 78',
                          'Disponible 7j/7 de 9h à 18h',
                          Icons.phone,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: _buildContactCard(
                          'Email',
                          'contact@tourismemaroc.ma',
                          'Réponse sous 24h',
                          Icons.email,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: _buildContactCard(
                          'Adresse',
                          '123 Avenue Mohammed V, Marrakech',
                          'Ouvert du lundi au samedi',
                          Icons.location_on,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),

                  // Contact Form
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Envoyez-nous un message',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Prénom',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nom',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Téléphone',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Sujet',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(value: 'reservation', child: Text('Réservation')),
                              DropdownMenuItem(value: 'information', child: Text('Demande d\'information')),
                              DropdownMenuItem(value: 'support', child: Text('Support technique')),
                              DropdownMenuItem(value: 'autre', child: Text('Autre')),
                            ],
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              border: OutlineInputBorder(),
                              alignLabelWithHint: true,
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Message envoyé avec succès !'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Envoyer le message',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // FAQ Section
                  const Text(
                    'Questions Fréquentes',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  _buildFAQItem(
                    'Comment réserver un voyage ?',
                    'Vous pouvez réserver directement en ligne via notre site, par téléphone ou en nous contactant par email. Nous vous accompagnerons dans toutes les étapes.',
                  ),
                  _buildFAQItem(
                    'Quels sont les moyens de paiement acceptés ?',
                    'Nous acceptons les cartes de crédit (Visa, Mastercard), les virements bancaires et PayPal pour votre commodité.',
                  ),
                  _buildFAQItem(
                    'Puis-je annuler ou modifier ma réservation ?',
                    'Oui, sous réserve de nos conditions générales. Contactez-nous dès que possible pour toute modification.',
                  ),
                  _buildFAQItem(
                    'Les prix incluent-ils les vols ?',
                    'Non, sauf mention contraire. Les prix indiqués concernent généralement les prestations terrestres au Maroc.',
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
          child: const Text('Villes'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/contact'),
          child: const Text('Contact', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
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

  Widget _buildContactCard(String title, String info, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              info,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}