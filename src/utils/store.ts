import { ActionTypes, CartType } from "@/types/types";
import { create } from "zustand";
import { persist } from "zustand/middleware";

declare global {
  interface Window {
    store: any;
  }
}

const INITIAL_STATE = {
  products: [],
  totalItems: 0,
  totalPrice: 0,
};

export const useCartStore = create(
  (persist<CartType & ActionTypes>(
    (set, get) => ({
      products: INITIAL_STATE.products,
      totalPrice: INITIAL_STATE.totalPrice,
      totalItems: INITIAL_STATE.totalItems,

      addToCart(item) {
        console.log(item);
        
        const products = get().products;
        const totalP = get().totalPrice;
        const productsLength = products.length
        const toi = get().totalItems
        
        const productInState = products.find((product) => product.id === item.id);
        console.log(productInState , "  in state");
        
        if (productInState) {
          console.log(productInState.id, productInState.img, " if in state");
          
          const updatedProducts = products.map((product) =>
            product.id === productInState.id
              ? {
                ...item,
                quantity: item.quantity + product.quantity,
                price: item.price + product.price,
              }
              : item
          );
          set((state) => {
            console.log(state.totalPrice, item.price);
            return {
            products: updatedProducts,
            totalItems: state.totalItems + item.quantity,
            totalPrice: state.totalPrice + item.price,
            
          }});
        } else {

          set((state) => ({
            products: [...state.products, item],
            totalItems: state.totalItems + item.quantity,
            totalPrice: state.totalPrice + item.price,
          }));

        }
      },
      removeFromCart(item) {
        const products = get().products;
        const totalP = get().totalPrice;
        const toi = get().totalItems
        const productsLength = products.length
        console.log(typeof (totalP) + " remove " + productsLength + " toi - " + toi);

        if (productsLength === 1) {
          console.log("0000 starts");

          set((state) => ({
            products: [],
            totalItems: 0,
            totalPrice: 0,
          }));
        } else if (products.length) {
          set((state) => ({

            products: state.products.filter((product) => product.id !== item.id),
            totalItems: state.totalItems - item.quantity,
            totalPrice: +state.totalPrice - item.price,
          }));

        }
      },
    }),
    { name: "cart", skipHydration: true }
  ))
);
//window.store = useCartStore;