import 'package:flutter/material.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedDestination = 'Marrakech';
  String _selectedActivity = 'Visite guidée';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  int _numberOfPersons = 1;
  String _selectedPackage = 'Découverte';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section Réservations
            Container(
              height: 250,
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
                        'Réservations',
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
                        'Réservez votre expérience unique au Maroc',
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

            // Reservation Form
            Container(
              padding: const EdgeInsets.all(40),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Formulaire de Réservation',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Remplissez ce formulaire pour réserver votre séjour',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Informations personnelles
                        const Text(
                          'Informations Personnelles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Prénom *',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ce champ est obligatoire';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nom *',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ce champ est obligatoire';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email *',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ce champ est obligatoire';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Email invalide';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Téléphone *',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ce champ est obligatoire';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),

                        // Détails du séjour
                        const Text(
                          'Détails du Séjour',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedDestination,
                                decoration: const InputDecoration(
                                  labelText: 'Destination',
                                  border: OutlineInputBorder(),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'Marrakech', child: Text('Marrakech')),
                                  DropdownMenuItem(value: 'Fès', child: Text('Fès')),
                                  DropdownMenuItem(value: 'Chefchaouen', child: Text('Chefchaouen')),
                                  DropdownMenuItem(value: 'Agadir', child: Text('Agadir')),
                                  DropdownMenuItem(value: 'Ouarzazate', child: Text('Ouarzazate')),
                                  DropdownMenuItem(value: 'Rabat', child: Text('Rabat')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedDestination = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _selectedActivity,
                                decoration: const InputDecoration(
                                  labelText: 'Activité',
                                  border: OutlineInputBorder(),
                                ),
                                items: const [
                                  DropdownMenuItem(value: 'Visite guidée', child: Text('Visite guidée')),
                                  DropdownMenuItem(value: 'Randonnée', child: Text('Randonnée')),
                                  DropdownMenuItem(value: 'Désert', child: Text('Excursion désert')),
                                  DropdownMenuItem(value: 'Plage', child: Text('Séjour balnéaire')),
                                  DropdownMenuItem(value: 'Culture', child: Text('Circuit culturel')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _selectedActivity = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: _selectedDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(const Duration(days: 365)),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _selectedDate = picked;
                                    });
                                  }
                                },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Date d\'arrivée',
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Text(
                                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                value: _numberOfPersons,
                                decoration: const InputDecoration(
                                  labelText: 'Nombre de personnes',
                                  border: OutlineInputBorder(),
                                ),
                                items: List.generate(10, (index) => index + 1)
                                    .map((number) => DropdownMenuItem(
                                          value: number,
                                          child: Text(number.toString()),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _numberOfPersons = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: _selectedPackage,
                          decoration: const InputDecoration(
                            labelText: 'Forfait choisi',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'Découverte', child: Text('Découverte - 149€/pers')),
                            DropdownMenuItem(value: 'Premium', child: Text('Premium - 299€/pers')),
                            DropdownMenuItem(value: 'Luxe', child: Text('Luxe - 499€/pers')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedPackage = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Commentaires ou demandes spéciales',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Récapitulatif et paiement
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Récapitulatif de la réservation',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              _buildSummaryRow('Destination', _selectedDestination),
                              _buildSummaryRow('Activité', _selectedActivity),
                              _buildSummaryRow('Date', '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                              _buildSummaryRow('Personnes', _numberOfPersons.toString()),
                              _buildSummaryRow('Forfait', _selectedPackage),
                              const Divider(),
                              _buildSummaryRow('Prix estimé', _calculatePrice(), isTotal: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _showConfirmationDialog(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Confirmer la réservation',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
          child: const Text('Contact'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/reservations'),
          child: const Text('Réservations', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          child: const Text('Réserver'),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.orange.shade700 : Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.orange.shade700 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  String _calculatePrice() {
    int basePrice;
    switch (_selectedPackage) {
      case 'Découverte':
        basePrice = 149;
        break;
      case 'Premium':
        basePrice = 299;
        break;
      case 'Luxe':
        basePrice = 499;
        break;
      default:
        basePrice = 149;
    }
    return '${(basePrice * _numberOfPersons).toString()}€';
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation de réservation'),
          content: const Text(
            'Votre réservation a été enregistrée avec succès ! '
            'Vous recevrez un email de confirmation dans quelques instants.'
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Retour à l\'accueil'),
            ),
          ],
        );
      },
    );
  }
}