const admin = require('firebase-admin');
// On charge notre clé secrète
const serviceAccount = require('./serviceAccountKey.json');
// On charge notre lot de questions
const questions = require('./data/questions_v1.json');

// 1. Initialisation des pouvoirs d'administration
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function importData() {
  console.log('🚀 Début de l\'importation des questions...');
  let count = 0;

  for (const question of questions) {
    try {
      // 2. On ajoute les champs techniques manquants pour correspondre à ton modèle de données
      const questionData = {
        ...question,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        isActive: true
      };

      // 3. On envoie la question dans la collection 'questions'
      await db.collection('questions').add(questionData);
      
      console.log(`✅ Question ajoutée : ${question.text.substring(0, 40)}...`);
      count++;
    } catch (error) {
      console.error(`❌ Erreur lors de l'ajout :`, error);
    }
  }

  console.log(`\n🎉 Importation terminée ! ${count} questions ont été ajoutées avec succès à ta base Firestore.`);
}

// Lancement de la fonction
importData();