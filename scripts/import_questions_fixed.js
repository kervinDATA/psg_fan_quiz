const https = require('https');

console.log("⏳ Récupération de l'heure réelle via internet pour contourner le bug de l'horloge...");

https.get('https://google.com', (res) => {
    const dateStr = res.headers.date;
    const realTime = new Date(dateStr).getTime();
    const localTime = Date.now();
    const offset = localTime - realTime;
    
    console.log(`🕰️ Horloge locale : ${new Date(localTime).toISOString()}`);
    console.log(`🕰️ Horloge réelle  : ${new Date(realTime).toISOString()}`);
    console.log(`🔧 Décalage corrigé: ${Math.round(offset / 1000 / 60 / 60 / 24 / 365)} ans`);

    // Override de l'heure pour tromper Firebase
    const originalNow = Date.now;
    Date.now = function() {
        return originalNow() - offset;
    };
    
    const OriginalDate = Date;
    global.Date = class extends OriginalDate {
        constructor(...args) {
            if (args.length === 0) {
                super(OriginalDate.now() - offset);
            } else {
                super(...args);
            }
        }
    };
    global.Date.now = Date.now;

    runImport();
}).on('error', (e) => {
    console.error("❌ Erreur réseau :", e);
});

function runImport() {
    const admin = require('firebase-admin');
    
    // On charge le fichier exact qui est sur ta machine
    let serviceAccount;
    try {
        serviceAccount = require('./serviceAccountKey.json.json');
    } catch (e) {
        serviceAccount = require('./serviceAccountKey.json');
    }
    
    const questions = require('./data/questions_v1.json');

    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount)
    });

    const db = admin.firestore();

    async function importData() {
      console.log('\n🚀 Début de l\'importation des questions...');
      let count = 0;

      for (const question of questions) {
        try {
          const questionData = {
            ...question,
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            isActive: true
          };

          await db.collection('questions').add(questionData);
          console.log(`✅ Question ajoutée : ${question.text.substring(0, 40)}...`);
          count++;
        } catch (error) {
          console.error(`❌ Erreur lors de l'ajout :`, error.message);
        }
      }

      console.log(`\n🎉 Importation terminée ! ${count} questions ont été ajoutées avec succès à ta base Firestore.`);
      process.exit(0);
    }

    importData();
}
