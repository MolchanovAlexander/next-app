"use client";
import { useCartStore } from "@/utils/store";
import { useRouter, useSearchParams } from "next/navigation";
import { NextRequest, NextResponse } from "next/server";
import React, { useEffect } from "react";
import ConfettiExplosion from "react-confetti-explosion";

const SuccessPage = () => {

  const searchParams = useSearchParams();
  const payment_intent = searchParams.get("payment_intent");
  const router = useRouter();
  console.log('\x1b[33m%s\x1b[0m', "--- success ---");
  const { clearCart } = useCartStore()
  useEffect(() => {
    const makeRequest = async () => {
      try {
                
        const res = await fetch(`http://localhost:3000/api/confirm/${payment_intent}`, {
          method: "PUT",
        });
        console.log(res);
        
        setTimeout(() => {
          router.push("/orders");
          clearCart();
        }, 3000);
      } catch (err) {
        console.log(err);
      }
    };

    makeRequest();
  }, [payment_intent, router]);

  return (
    <>
      <div className="min-h-[calc(100vh-6rem)] md:min-h-[calc(100vh-15rem)] flex items-center justify-center text-center text-2xl text-green-700">
        <p className="max-w-[600px]">
          Payment successful. You are being redirected to the orders page.
          Please do not close the page.
        </p>
        <ConfettiExplosion className="absolute m-auto"
        />
      </div>
    </>
  );
};

export default SuccessPage;