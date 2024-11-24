// frontend/src/components/ui/ErrorMessage.tsx
export default function ErrorMessage({ message }: { message: string }) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-lg p-4">
        <p className="text-red-700">{message}</p>
      </div>
    );
  }