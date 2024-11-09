'use client';

import { Component, ReactNode } from 'react';

interface Props {
  children: ReactNode;
}

interface State {
  hasError: boolean;
  error?: Error;
}

class ErrorBoundary extends Component<Props, State> {
  public state: State = {
    hasError: false
  };

  public static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error };
  }

  public componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    console.error('[ErrorBoundary] Caught error:', {
      error,
      errorInfo,
      stack: error.stack
    });
  }

  public render() {
    if (this.state.hasError) {
      return (
        <div className="container mx-auto px-4 py-16">
          <div className="text-center">
            <h2 className="text-xl font-bold text-red-600 mb-4">
              Ein Fehler ist aufgetreten
            </h2>
            {process.env.NODE_ENV === 'development' && this.state.error && (
              <pre className="text-sm text-gray-600 mt-2">
                {this.state.error.message}
              </pre>
            )}
          </div>
        </div>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary; 