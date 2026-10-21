import { useQuery } from '@tanstack/react-query';
import { api } from './client';

export const useProducts = () => useQuery({ queryKey: ['products'], queryFn: async () => (await api.get('/products')).data });
export const useProduct = (id) => useQuery({ queryKey: ['product', id], queryFn: async () => (await api.get(`/products/${id}`)).data, enabled: !!id });
export const usePortfolio = () => useQuery({ queryKey: ['portfolio'], queryFn: async () => (await api.get('/portfolio')).data });
export const useTeam = () => useQuery({ queryKey: ['team'], queryFn: async () => (await api.get('/team')).data });
export const usePosts = () => useQuery({ queryKey: ['posts'], queryFn: async () => (await api.get('/posts')).data });
export const usePost = (id) => useQuery({ queryKey: ['post', id], queryFn: async () => (await api.get(`/posts/${id}`)).data, enabled: !!id });
export const useReviews = () => useQuery({ queryKey: ['reviews'], queryFn: async () => (await api.get('/reviews')).data });
