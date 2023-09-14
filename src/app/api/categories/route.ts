
import { prisma } from "@/utils/connect";
import { NextResponse } from "next/server";


// FETCH ALL CATEGORIES
export const GET = async () => {
  try {
    const categories = await prisma.category.findMany();
    return new NextResponse(JSON.stringify(categories), { status: 200 });
  } catch (err) {
    console.log(err);
    return new NextResponse(
      JSON.stringify({ message: "Something went wrong!" }),
      { status: 500 }
    );
  }
};


// // fetch
// export const GET =()=> {
//     return new NextResponse(":noob", {status:200}) 
// }
// export const POST =()=> {
//     return new NextResponse(":noob", {status:200}) 
// }