import Link from 'next/link';
import { motion } from 'framer-motion';

export default function ProductCTA() {
  return (
    <section className="bg-gradient-to-br from-tuscher-blue/5 to-tuscher-cyan/5 py-20 sm:py-24">
      <div className="container">
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card max-w-4xl mx-auto p-8 sm:p-12 text-center"
        >
          <div className="space-y-8">
            <div>
              <span className="text-4xl mb-6 block">🎯</span>
              <h2 className="text-2xl sm:text-3xl md:text-4xl font-bold text-tuscher-blue">
                Bereit für Ihren maßgeschneiderten Insektenschutz?
              </h2>
            </div>
            
            <p className="text-gray-600 text-lg max-w-2xl mx-auto">
              Konfigurieren Sie jetzt Ihre individuelle Lösung und erhalten Sie ein unverbindliches Angebot.
            </p>
            
            <div className="pt-4">
              <Link 
                href="/salesfunnel"
                className="inline-flex items-center justify-center 
                         px-12 py-5 text-lg font-medium
                         bg-tuscher-blue text-white
                         rounded-xl shadow-lg
                         hover:shadow-xl hover:bg-tuscher-blue-light
                         transform hover:scale-[1.02] active:scale-[0.98]
                         transition-all duration-300"
              >
                Jetzt konfigurieren
              </Link>
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
} 