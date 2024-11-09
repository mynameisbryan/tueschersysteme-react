import { ButtonHTMLAttributes, forwardRef } from 'react'
import { cn } from '@/utils/cn'

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline' | 'cta'
  size?: 'sm' | 'md' | 'lg'
}

const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'primary', size = 'md', ...props }, ref) => {
    return (
      <button
        ref={ref}
        className={cn(
          'relative inline-flex items-center justify-center overflow-hidden rounded-lg font-medium transition-all duration-300',
          // Size variations
          {
            'px-4 py-2 text-sm': size === 'sm',
            'px-6 py-3 text-base': size === 'md',
            'px-8 py-4 text-lg': size === 'lg',
          },
          // Variant styles with enhanced hover effects
          {
            // Primary - Dark blue with white text
            'bg-[var(--color-navy)] text-white hover:bg-[var(--color-navy-light)] border border-transparent group': 
              variant === 'primary',
            
            // Secondary - Transparent with white text and border
            'bg-transparent text-white border border-white/80 hover:border-white group': 
              variant === 'secondary',
            
            // Outline - Transparent with cyan text and border
            'bg-transparent text-[var(--color-primary)] border border-[var(--color-primary)] group': 
              variant === 'outline',
            
            // CTA - Dark blue with cyan accents
            'bg-[var(--color-navy)] text-[var(--color-primary)] border border-[var(--color-primary)] group': 
              variant === 'cta',
          },
          'group active:scale-95',
          className
        )}
        {...props}
      >
        <span className="relative z-10">{props.children}</span>
        {/* Magical hover effects */}
        <span className="absolute inset-0 z-0 bg-gradient-to-r from-[#7CDDBA]/0 via-[#7CDDBA]/20 to-[#7CDDBA]/0 
                       opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
        <span className="absolute inset-0 z-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500
                       bg-[radial-gradient(circle_at_center,rgba(124,221,186,0.1)_0%,transparent_70%)]" />
        <span className="absolute z-0 inset-0 rounded-lg opacity-0 group-hover:opacity-100 transition-all duration-500
                       shadow-[inset_0_0_12px_rgba(124,221,186,0.2)]" />
        {/* Ripple effect on click */}
        <span className="absolute inset-0 -z-10 overflow-hidden rounded-lg">
          <span className="absolute inset-0 transform scale-0 rounded-lg bg-[#7CDDBA]/10
                         group-active:scale-200 group-active:duration-500" />
        </span>
      </button>
    )
  }
)
Button.displayName = 'Button'

export default Button 