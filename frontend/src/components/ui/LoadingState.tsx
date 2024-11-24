import React from 'react';

export const LoadingState = () => {
  return (
    <div className="animate-pulse space-y-4">
      {[1, 2, 3].map((i) => (
        <div key={i} className="h-24 bg-gray-200 rounded-lg" />
      ))}
    </div>
  );
}; 