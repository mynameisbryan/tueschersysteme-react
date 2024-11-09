export default function Loading() {
  return (
    <div className="container mx-auto px-4 py-16">
      <div className="animate-pulse space-y-8">
        {/* Hero Section Skeleton */}
        <div className="h-[400px] bg-gray-200 rounded-lg" />
        
        {/* Tabs Skeleton */}
        <div className="flex gap-4 overflow-x-auto">
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="w-48 h-12 bg-gray-200 rounded flex-shrink-0" />
          ))}
        </div>
        
        {/* Products Grid Skeleton */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="h-64 bg-gray-200 rounded" />
          ))}
        </div>
      </div>
    </div>
  );
} 