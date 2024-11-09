import { IconType } from '@/types/content';

interface FeatureItemProps {
  title: string;
  icon: string;
}

export default function FeatureItem({ title, icon }: FeatureItemProps) {
  const getIcon = (icon: IconType) => {
    switch (icon) {
      case 'SHIELD':
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M20.618 5.984A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
          </svg>
        );
      case 'HOME':
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
        );
      case 'HEART':
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
          </svg>
        );
      case 'GEAR':
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>
        );
      case 'CLOCK':
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        );
      default:
        return (
          <svg className="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" 
               fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" 
                  d="M13 10V3L4 14h7v7l9-11h-7z" />
          </svg>
        );
    }
  };

  return (
    <li className="flex items-center gap-2.5 sm:gap-3 md:gap-4 text-white/90 
                   group transition-all duration-300 hover:text-white">
      {/* Icon Container */}
      <div className="flex-shrink-0 w-7 h-7 sm:w-9 sm:h-9 md:w-11 md:h-11
                    rounded-full bg-tuscher-cyan/20 
                    flex items-center justify-center
                    group-hover:bg-tuscher-cyan/30 transition-all duration-300">
        {/* Icon with updated color */}
        <div className="text-tuscher-cyan">
          {getIcon(icon as IconType)}
        </div>
      </div>
      
      {/* Text */}
      <span className="text-sm sm:text-base md:text-lg font-medium leading-tight">
        {title}
      </span>
    </li>
  );
} 