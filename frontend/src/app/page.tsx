import HeroSection from '@/components/home/HeroSection';
import WelcomeSection from '@/components/home/WelcomeSection';
import ProductCategories from '@/components/home/ProductCategories';
import UeberUnsSection from '@/components/home/UeberUnsSection';
import FAQSection from '@/components/home/FAQ';
import { getFAQs } from '@/utils/api';

// Add this to prevent static page generation
export const dynamic = 'force-dynamic';

export default async function Home() {
  try {
    const faqsResponse = await getFAQs();
    if (!faqsResponse) {
      console.error('No FAQ response received');
      return <main>Error loading content</main>;
    }
    const faqs = faqsResponse?.data || [];

    return (
      <main>
        <HeroSection />
        <WelcomeSection />
        <UeberUnsSection />
        <ProductCategories />
        <FAQSection faqs={faqs} />
      </main>
    );
  } catch (error) {
    console.error('Error in Home page:', error);
    return <main>Error loading content</main>;
  }
}
