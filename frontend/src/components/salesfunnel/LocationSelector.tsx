import { useState, useEffect } from 'react';
import { useDebounce } from '@/hooks/useDebounce';
import { Location, LocationSelectorProps } from '@/types/location';
import { CheckIcon } from '@heroicons/react/20/solid';

export default function LocationSelector({ 
  value, 
  onChange,
  onValidLocation,
  error 
}: LocationSelectorProps) {
  const [suggestions, setSuggestions] = useState<Location[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [showSuggestions, setShowSuggestions] = useState(false);
  
  const debouncedPlz = useDebounce(value.plz, 300);

  useEffect(() => {
    const fetchLocations = async () => {
      if (debouncedPlz.length >= 2) {
        setIsLoading(true);
        try {
          const response = await fetch(`/api/locations?plz=${debouncedPlz}`);
          const data = await response.json();
          setSuggestions(data);
        } catch (error) {
          console.error('Error fetching locations:', error);
        } finally {
          setIsLoading(false);
        }
      } else {
        setSuggestions([]);
      }
    };

    fetchLocations();
  }, [debouncedPlz]);

  const handleLocationSelect = (location: Location) => {
    onChange(location);
    // Format the location string for Strapi
    const locationString = `${location.plz} ${location.city}`;
    onValidLocation(locationString);
    setShowSuggestions(false);
  };

  // Rest of the component remains the same as in your AdditionalInfo.tsx
  // Just update the onClick handler in the suggestions list to use handleLocationSelect
} 