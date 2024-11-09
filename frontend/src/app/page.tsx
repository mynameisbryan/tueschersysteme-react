import HeroSection from '@/components/home/HeroSection';
import WelcomeSection from '@/components/home/WelcomeSection';
import ProductCategories from '@/components/home/ProductCategories';
import UeberUnsSection from '@/components/home/UeberUnsSection';
import FAQSection from '@/components/home/FAQ';
import ContactSection from '@/components/home/ContactSection';
import { getFAQs, getContactData } from '@/utils/api';

// Add this to prevent static page generation
export const dynamic = 'force-dynamic';

export default async function Home() {
  try {
    const [faqsResponse, contactResponse] = await Promise.all([
      getFAQs(),
      getContactData()
    ]);

    if (!faqsResponse || !contactResponse) {
      console.error('Failed to fetch required data');
      return <main>Error loading content</main>;
    }

    const faqs = faqsResponse.data || [];
    const contactData = contactResponse.data || {
      title: "Kontakt",
      subtitle: "Haben Sie Fragen? Kontaktieren Sie uns!",
      address: {
        street: "Your Street",
        city: "Your City",
        postal_code: "12345",
        phone: "+49 123 456789",
        email: "contact@example.com",
        opening_hours: "Mo-Fr: 9:00 - 17:00"
      },
      contact_form: {
        success_message: "Vielen Dank für Ihre Nachricht!",
        error_message: "Es ist ein Fehler aufgetreten.",
        privacy_text: "Ich akzeptiere die Datenschutzerklärung",
        newsletter_text: "Ja, ich möchte den Newsletter erhalten",
        submit_button_text: "Absenden"
      }
    };

    return (
      <main>
        <HeroSection />
        <WelcomeSection />
        <UeberUnsSection />
        <ProductCategories />
        <FAQSection faqs={faqs} />
        <ContactSection initialData={contactData} />
      </main>
    );
  } catch (error) {
    console.error('Error in Home page:', error);
    return <main>Error loading content</main>;
  }
}