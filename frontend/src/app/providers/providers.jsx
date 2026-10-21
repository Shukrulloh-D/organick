import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient({ defaultOptions: { queries: { staleTime: 60000 } } });

export function Providers({ children }) {
  return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
}
