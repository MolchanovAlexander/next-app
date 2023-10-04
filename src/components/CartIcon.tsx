"use client"
import { useCartStore } from "@/utils/store";
import { useSession } from "next-auth/react";
import Image from "next/image";
import Link from "next/link";
import React, { useEffect } from "react";

const CartIcon = () => {
  const { data } = useSession();
  const { totalItems } = useCartStore()
  useEffect(() => {
    useCartStore.persist.rehydrate()
  }, [])

  return (
    <div className="flex items-center justify-center">
      <Link href="/cart" className="flex items-center gap-4">
        <div className="relative w-8 h-8 md:w-5 md:h-5">
          <Image src="/cart.png" alt="" fill />
        </div>
        <span>Cart ({totalItems})</span>
      </Link>
      <div className="flex justify-end min-w-30">

        {data?.user.image
          ? <Image className="rounded min-w-30" src={data?.user.image} alt="/noob.png" width={30} height={30} />
          : <Image className="rounded" src="/noob.png" alt="/noob.png" width={30} height={30} />}
      </div>
    </div>
  );
};

export default CartIcon;